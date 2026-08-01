# Headless Builder Failure Modes — the catalog

Headless builders (`claude --print`) fail in **enumerable** ways. Over 498 audited
dispatches on a production project, six distinct failure modes appeared. Every one was
recovered (7/7 recovery attempts succeeded), for a single structural reason:

> **Git commits are the durable record.** Every interruption left committed work intact,
> and uncommitted work usually survives in the tree. A recovery that starts from
> `git status` — not from the builder's report — always finds the truth.

The other structural fact driving this catalog: **print-mode runs are single-turn.**
Anything the builder defers to "later" — a backgrounded test run, a "waiting for the
completion notification" — never happens, because there is no later turn.

Each mode below has a **tell** (how the mentor detects it), a **recovery**, and the
**standing rule** it produced. The rules are the point: an incident that doesn't change
the infrastructure or the prompt template will simply happen again.

---

## Mode 1 — Timeout mid-task

**What happens:** The dispatch wrapper's timeout kills the builder partway through a
slice. Work is sitting in the tree, uncommitted; no report was written.

**Tell:** Exit code 124; empty or missing `result.md`; `git status` in the builder tree
shows substantial uncommitted changes (one real instance: 800+ uncommitted lines, zero
commits).

**Recovery:** Resume dispatch (see [the resume protocol](#the-resume-protocol) below).

**Standing rules:**
- Long-slice prompts get a **budget clause**: "nearing the time budget → COMMIT what is
  verified + write an honest partial report; never die silent."
- Calibrate budgets to your gate suite. When an end-to-end test estate grows to 25–35
  minutes on its own, slices that run it need proportionally larger budgets — or the
  prompt names a **targeted** gate set (the slice's own spec + directly affected
  families) and leaves the wide sweeps to the mentor's verification pass. Three
  consecutive timeout deaths in one week — each with a *complete implementation* that
  died in the gate phase — bought this rule.

---

## Mode 2 — API connection death mid-response

**What happens:** The API connection drops partway through the run. The builder leaves
partial untracked files and a truncated result.

**Tell:** `result.md` is truncated and contains the API error text itself; the tree has
partial/untracked files.

**Recovery:** Resume dispatch. The committed work is intact; the partial files are
assessed by the resume builder against the original spec.

**Standing rule:** On ANY odd or empty `result.md`, the mentor checks
`git -C <builder-tree> status` and `git log` for surviving work BEFORE re-dispatching
fresh — the work usually survives, and a fresh dispatch that ignores it will duplicate
or clobber it.

---

## Mode 3 — Yield-await (the builder ends its turn waiting for something that never comes)

**What happens:** The builder backgrounds its own test gates, then ends its turn
"awaiting the completion notification." In an interactive session it would be re-invoked
when the background job finishes; headless print-mode gets **no later turns**. The run
"completes" having verified nothing — one real instance's entire report was a single
orphan sentence.

**Tell:** A bizarrely short `result.md` (one sentence, mid-thought); claimed gates with
no gate output; sometimes still-running test processes in the tree.

**Recovery:** Resume dispatch ordering the gates to be run synchronously.

**Standing rule:** Every dispatch prompt includes: **"run every gate SYNCHRONOUSLY, in
your turn; never background-and-await."** This clause is not optional boilerplate — the
failure is silent without it.

---

## Mode 4 — Zombie survives the timeout and races the next dispatch

**What happens:** The naive kill (`timeout --signal=TERM claude`) signals only the
claude process; its child processes (node, test runners) survive and **keep mutating the
repo** — in the real incident, for ~20 more minutes, during which the zombie ran a
`git stash -u … stash pop` sequence for a clean-baseline test and wiped the tree out
from under the *next* dispatch mid-review (very likely stashing its own work into
oblivion first).

**Tell:** Exit 124 was reported, but the tree keeps changing afterward; processes with
CWD inside the builder tree outlive the dispatch.

**Recovery:** Resume dispatch; the resume builder **commits rescued work IMMEDIATELY**,
before anything else, to put it beyond stash/reset reach.

**Standing rules (now structural in `dispatch.sh`):**
- The builder runs as its own **process-group leader**; timeout does TERM-then-KILL on
  the whole group.
- A **survivor sweep** after every run warns about builder-shaped processes still alive
  with CWD in the tree (warn, never auto-kill — a broad pkill would hit the mentor
  session itself).
- **One builder per tree**, enforced by a per-tree flock lockfile, so a racing second
  dispatch fails fast instead of interleaving.

---

## Mode 5 — Verified-but-uncommitted clean exit

**What happens:** The builder finishes ALL the work, runs the gates green, writes a
full, confident report ("exactly the intended files… everything green") — and ends its
turn with **the entire diff uncommitted**. Clean exit code. This is the mode that makes
"never trust the builder's self-report" a protocol rather than a preference.

**Tell:** The report lists **files but no commit hashes** — that absence is the tell.
Confirmed by `git log <base>..HEAD` printing empty while the gates pass.

**Recovery:** A tiny commit-first dispatch (the mentor never commits the builder repo
itself — all writes route through the builder, even this one).

**Standing rule:** EVERY builder report is checked for **actual commit hashes against
the actual tree**. "Report reads complete" ≠ committed. This check is part of the
mentor's fixed post-dispatch verification, not a judgment call.

---

## Mode 6 — Killed mid-checkout → detached HEAD in the shared tree

**What happens:** A builder is killed in the middle of a clean-base checkout, leaving
the shared tree in **detached HEAD at an older commit**. The commits are complete and
intact — but everything downstream silently reads the wrong code: the locally running
app serves pre-fix behavior, and the mentor's own background gate runs test the wrong
tree, producing phantom failures.

**Tell:** `git symbolic-ref -q HEAD` fails (detached). Secondary tells: the running app
doesn't show the change that's definitely committed; gates fail in ways that make no
sense against the diff.

**Recovery:** `git checkout <branch>` — the work was committed; nothing was lost.

**Standing rules:**
- After ANY builder death, the mentor's checklist includes `git symbolic-ref -q HEAD`;
  if detached, restore the branch BEFORE any gate run.
- Sweep for **orphaned dev/test webservers** the dead builder left listening — a stale
  server serves stale code and poisons both human sighted checks and e2e runs.

---

## The resume protocol

All six modes recover through the same shape (proven repeatedly):

1. **Assess the tree first.** `git status`, `git log <base>..HEAD`, `git symbolic-ref -q HEAD`
   — in the builder tree, before deciding anything.
2. **Resume, don't restart**, when work survives: dispatch with `--resume <session_id>`
   (or a fresh dispatch pointed at the in-tree work if the session is unrecoverable).
3. The resume prompt: **state the failure mode verbatim**, point at the in-tree work,
   order a **critical self-review of the half-done diff against the appended original
   spec** (never "just continue" — the builder must re-earn its picture of the state),
   then complete + commit.
4. Include the budget clause: "nearing the budget → COMMIT what is verified + honest
   partial report; never die silent."
5. If the death was mode 4 (zombie), the resume builder **commits rescued work first**,
   before any other action.

## The mentor's post-dispatch checklist

Run after **every** dispatch, not just suspicious ones — mode 5 looks like success:

- [ ] Exit code and `result.md` sanity (truncation? orphan sentence? error text?)
- [ ] `git log <base>..HEAD` — do the claimed commits actually exist?
- [ ] Report cross-check — commit **hashes** present, not just file lists?
- [ ] `git status` — uncommitted or untracked leftovers?
- [ ] `git symbolic-ref -q HEAD` — on the expected branch?
- [ ] Survivor sweep clean? No orphaned processes or listeners in the builder tree?
- [ ] Re-run the gates **yourself** (see the traps below), independent of the report

## Related mentor-side traps

Not builder failure modes, but caught in the same production run and load-bearing for
the checklist above:

- **The chain-gate pipefail trap.** A verify-then-dispatch chain like
  `run-tests 2>&1 | tail -1 && dispatch-next` dispatched over a RED suite, because a
  bash pipeline returns the *last* command's status — `tail` exited 0. Rule: every
  verify-then-dispatch chain sets `set -o pipefail` FIRST, or explicitly asserts the
  summary line (e.g., grep for "0 failed"). Build-on-green is only as strong as the
  chain's exit-code plumbing.
- **Probe scripts that never exit.** A db connection pool keeps the event loop alive;
  piped through `tail`/`head`, all output is buffered until EOF — so a finished 23-second
  probe looks like a dead silent hang. Rule: prompts requiring probe scripts demand an
  explicit `process.exit(0)` / pool `.end()`.
- **The environment-variable prose trap.** Stating "make sure DATABASE_URL is set" as
  prose produced runs where gates executed in a shell without it — false reds, and worse,
  a "pre-existing at baseline" claim that was **vacuous because the baseline run shared
  the same broken shell**. Rules: prompts INLINE the literal `export VAR=...` prefix
  inside every gate command block; and a claimed-pre-existing failure is only proven
  pre-existing when the baseline run's environment is independently known-good.

## Infrastructure kills

One more way a dispatch dies that isn't the builder's fault: the platform itself (e.g.,
a subscription usage-window limit) kills the run — typically early, pre-commit, with no
builder output and no wrapper timeout. Recovery is the standard checklist (usually all
clean) plus a **verbatim relaunch after the window resets**. If the human is around, ask
before re-dispatching; they know when the window resets.

---

## Why this catalog matters

None of these modes is exotic. If you run headless builders, you will hit most of this
list — the only question is whether each incident becomes a standing rule (a wrapper
hardening, a prompt clause, a checklist line) or a recurring surprise. The loop
described in the [main README](../README.md) is reliable *because of* this catalog, not
despite it. Expect to extend it with modes specific to your own stack, and treat every
new incident as a documentation event.
