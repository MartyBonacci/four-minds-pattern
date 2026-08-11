# Lessons from Practice: Living with the Mentor→Developer Pattern

> What extended real-world use of the Mentor→Developer pattern revealed about its lifecycle, its failure modes, and when it stops being the best tool for the job.

This document is a companion to [The Mentor→Developer Workflow](./mentor-developer-workflow.md). That document explains how the pattern works and why it's powerful. This one captures what changes after weeks or months of using it on a single project — the patterns of success that hold up, the patterns of failure that emerge, and the signals that tell you when to evolve your usage.

**The honest framing:** The Mentor→Developer pattern is genuinely powerful. It's also not equally powerful at every stage of a project's life. Recognizing the difference is the difference between using the pattern well and being slowed down by it.

---

## Table of Contents

1. [Where This Comes From](#where-this-comes-from)
2. [The Decay Curve: When Value Erodes](#the-decay-curve-when-value-erodes)
3. [Failure Patterns to Watch For](#failure-patterns-to-watch-for)
4. [Hybrid Approaches](#hybrid-approaches)
5. [Practical Guidance](#practical-guidance)
6. [What to Do Differently Next Time](#what-to-do-differently-next-time)
7. [Further Reading](#further-reading)

---

## Where This Comes From

These lessons emerged from extended use of the Mentor→Developer pattern on a multi-sprint PWA project. The pattern was used from greenfield definition through production deployment and into an extended polish/maintenance phase. Roughly 25 prompt artifacts accumulated. Some were brilliant; some, in retrospect, were the wrong tool for the moment.

**The TL;DR:** The pattern delivered enormous value in early architectural phases. Around the transition into stabilization, the pattern's friction started exceeding its benefit — and the symptoms of that transition were specific, observable, and worth naming.

---

## The Decay Curve: When Value Erodes

The pattern's value-to-friction ratio is **not constant** across a project's lifecycle. Here's the rough shape:

```
Value     │
to        │ ╱──╲
Friction  │╱    ╲___
Ratio     │         ╲___
          │             ╲___
          └─────────────────────→
          Sprint 1   ...   Maintenance
```

### The Phases

**Greenfield (first few sprints):**
The pattern is at peak value. Architectural decisions cost a lot to reverse. Mentor's preservation of design intent is genuinely worth the friction. Crafted prompts produce thoughtful, well-aligned implementations.

**Feature expansion (middle sprints):**
Still high value. Codebase has shape but is still changing meaningfully. Mentor's strategic perspective continues to pay back. The accumulating prompt artifacts become a useful design history.

**Stabilization (later sprints):**
Value falls below friction. Most changes are small tweaks that don't need architectural review. Mentor's mental model of the codebase starts to drift. Bugs caused by stale assumptions begin to outnumber the bugs prevented by strategic review.

**Maintenance:**
The pattern actively slows you down. Code drift, token cost, and the copy-paste tax dominate. Most fixes would be faster done directly in Developer with plan mode.

### The Transition Isn't Sharp

The shift is gradual and project-specific. **The signal to watch for:** Mentor increasingly delegates "re-read the current state of file X" to subagents instead of relying on its own memory. That's the codebase having grown beyond what Mentor's working context can faithfully hold. When you notice this happening repeatedly, you're past the inflection point.

**Another signal:** Mentor's prompts start producing builds that work, but with subtle issues that surface only at runtime — issues a fresh code reading would have caught. Stale model bugs.

---

## Failure Patterns to Watch For

These are the failure modes most likely to emerge with extended use. Naming them makes them easier to catch in the moment.

### 1. Stale Mental Model

**What it looks like:** Mentor recommends a change to file or function X that no longer exists, has been refactored, or has different behavior than Mentor remembers.

**Symptom:** Developer reports confusion ("I don't see the function you mentioned"), or Developer applies the change to something that isn't quite right ("I added it to the new equivalent helper, but please verify").

**Why it happens:** Mentor's mental model is a snapshot from when it last read those files — possibly weeks ago. The codebase has moved on; Mentor hasn't.

**Mitigation:** Make it a habit for Mentor to explicitly re-read target files at the start of any prompt that touches them. The cost is small; the accuracy gain is huge.

### 2. Approximation Collapse

**What it looks like:** Mentor offers two options ("the simple way" and "the precise way") and recommends the simple one. The simple version turns out to model the wrong semantic — not just less precisely, but structurally invalid.

**Symptom:** A visible bug that contradicts what the prompt was supposed to achieve. Often subtle enough that "all tests pass" doesn't catch it.

**Why it happens:** Some abstractions can't be approximated. When an underlying API doesn't expose the abstraction you need, "simpler" can mean "doesn't actually express the thing." Mentor, working at a distance from the actual code, may not recognize this in advance.

**Mitigation:** When recommending one option over another, articulate WHY the recommended approach fits the constraints — not just that it's simpler. If you can't articulate why simpler is also correct here, don't choose simpler.

### 3. Phantom Verification

**What it looks like:** Mentor recommends "the build should pass" or "tests should still work" without any way to actually verify.

**Symptom:** Developer reports success, but later runtime or visual issues emerge. Often UI/UX issues that no test would catch.

**Why it happens:** Mentor cannot run tests, start a dev server, or observe the running app. It's making predictions, not verifications. For visual or runtime work especially, this matters.

**Mitigation:** Include explicit verification steps the user can run. Be honest in the prompt: "I cannot verify visual behavior; please confirm X looks correct after build." Lean on Developer's explicit testing rather than Mentor's predictions.

### 4. Information Laundering

**What it looks like:** User summarizes Developer's output to Mentor; Mentor designs based on the summary; design assumes details the summary omitted.

**Symptom:** Developer's actual report contained a warning or partial failure that Mentor missed because the user paraphrased "all good!"; the next prompt is built on incomplete info.

**Why it happens:** The user is the message bus, and humans naturally compress.

**Mitigation:** Paste full output to Mentor when it matters, not summaries. Especially for build reports, error messages, and test output.

### 5. Cargo-Culted Approach

**What it looks like:** Mentor recommends a known pattern that worked previously, even though the current context has subtly different requirements.

**Symptom:** Implementation produces bugs that contradict the prompt's stated goals; the pattern was right shape, wrong fit.

**Why it happens:** Patterns that worked before are easy to reach for. The mental cost of evaluating "does this pattern fit THIS context" is higher than recalling "this pattern worked last time."

**Mitigation:** When proposing a pattern, articulate the specific conditions that make it fit. If you find yourself saying "this is similar to what we did in sprint 2," ask whether the constraints are actually similar.

---

## Hybrid Approaches

You don't have to commit to one usage pattern for the whole project. Here are evolution paths that have worked:

### Phase-Based Switching

Use Mentor→Developer through greenfield and feature expansion. Switch to single-instance plan mode in Developer for stabilization and maintenance. Keep the prompt artifacts from the early phase as the project's design history; replace ongoing prompts with a lightweight `decisions.md` log inside the project itself.

This is probably the most common evolution. The artifacts you accumulated during the active phase remain valuable; you just stop adding to them when the per-prompt cost exceeds the per-prompt benefit.

### On-Demand Mentoring

Use single-instance plan mode in Developer as the default workflow. Spawn a fresh Mentor only for genuinely architectural conversations — new major features, philosophical pivots, cross-cutting refactors. The Mentor's lifespan matches the architectural decision's scope, not the whole project's.

This works well once you've internalized when the Mentor adds value. Most days, you don't need it. Some days, you really do.

### Mentor as Reviewer Only

Developer does both design and execution in plan mode. Mentor is consulted only for code review at major checkpoints (e.g., before a sprint ships). The Mentor reads the actual current code each time, so its view stays fresh. This minimizes drift while preserving the second-set-of-eyes benefit.

Trade-off: you lose the prompt-crafting advantage but keep the strategic-review advantage. Useful when prompt-crafting feels redundant but you still value an outside critique before merging.

### Embedded Review Subagent

Inside Developer, periodically spawn a `code-reviewer` subagent (or similar) that reads recent changes and reports issues. This is review without maintaining a separate Mentor instance at all. Lower fidelity than a long-running Mentor, but no drift.

Useful for projects in maintenance mode where you want occasional review but don't want to set up a Mentor instance for it.

---

## Practical Guidance

### Do

- **Re-read target files in Mentor before crafting any prompt that touches them.** Treat Mentor's memory as a hint, not the source of truth.
- **Paste full Developer output to Mentor**, not summaries. Especially for build reports, errors, and test output.
- **Articulate WHY a recommended approach fits**, not just that it's simpler or familiar. If you can't articulate why, you don't yet know if it fits.
- **Keep prompt artifacts as design history.** Even after you stop generating new ones, the existing files are valuable documentation.
- **Watch for the decay signals.** Mentor delegating "re-read state" frequently? Mentor's prompts producing subtle bugs? Time to consider switching modes.

### Don't

- **Don't treat Mentor as authoritative on current code state.** It isn't, and pretending otherwise leads to stale-model bugs.
- **Don't summarize Developer reports to save Mentor's reading time.** Mentor needs the full output to design accurately.
- **Don't use Mentor for tiny tweaks.** Single-line CSS changes, button-text updates, small bug fixes — these don't need strategic review. Use Developer in plan mode directly.
- **Don't continue using Mentor unchanged after you've crossed into stabilization.** The pattern that served you brilliantly in greenfield will start producing bugs in maintenance.
- **Don't conflate "the pattern is powerful" with "the pattern always applies."** Both can be true: it's a great pattern AND it's not the right tool for every phase.

---

## What to Do Differently Next Time

Reflecting on a project that used the pattern from start to finish, these adjustments would have helped:

**Plan the transition deliberately.** Around the time the codebase stabilizes, take a session to assess: are recent Mentor prompts still adding value? If most have been small fixes that Mentor was overqualified for, switch primary mode to Developer plan mode at that point.

**Maintain a lightweight decision log inside the project.** A `docs/decisions.md` file in the project itself, capturing one-paragraph notes on architectural choices as they happen. This is the lightweight replacement for prompt artifacts in maintenance mode — preserves design history without the friction of writing a full prompt.

**Make code re-reading explicit and routine.** Before every Mentor prompt that touches existing code, the first action should be reading current state of the relevant files. This single discipline catches most stale-model bugs.

**Be more honest in Mentor prompts about what Mentor can't verify.** Phrases like "I cannot run tests; please confirm X manually" are more useful than implicit assumptions that everything will work.

**Consider keeping Highest Self engaged on the workflow itself.** The pattern's lifecycle is exactly the kind of thing Highest Self is there for. A periodic check-in ("is the current Mentor→Developer cadence still serving us, or has it become friction?") would have caught the decay earlier.

---

## A Note on Why This Pattern Still Matters

None of the above is an argument against the Mentor→Developer pattern. The pattern remains genuinely powerful — and for the project that produced these lessons, the early sprints absolutely benefited from it. The architectural decisions made during that phase, preserved in prompt artifacts, are still readable and useful months later. That's value the pattern delivered that no other workflow would have.

What changes over time isn't the pattern's quality. It's the project's needs. **Recognizing that change, and adapting your workflow to match, is itself a meta-skill** — and one that maps neatly to the Highest Self role described elsewhere in this repo.

The lesson isn't "use Mentor→Developer less." The lesson is **"use Mentor→Developer when the gap between strategy and execution is large, and graduate to lighter workflows when that gap closes."**

---

## Further Reading

- [The Mentor→Developer Workflow](./mentor-developer-workflow.md) — The pattern itself, in detail
- [Workflow Guide](./workflow-guide.md) — Detailed workflows for each Mind
- [Why This Works](./why-this-works.md) — Cognitive science foundation for the pattern
- [Troubleshooting](./troubleshooting.md) — Common issues and how to address them

---

*These lessons came from one extended project's experience. The patterns of success and failure described here may not generalize to every project — that's part of what makes them worth documenting. If your experience differs, that's a contribution worth sharing back.*
