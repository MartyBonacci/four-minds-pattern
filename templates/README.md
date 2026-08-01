# Templates — the v2 (verified delegation) toolkit

These four files are the working mechanisms of the evolved Four Minds Pattern, sanitized
from ~7 weeks of production use (498 audited dispatches). They are meant to be stolen and
adapted, not used verbatim.

| File | What it is | Adapt before use |
|---|---|---|
| [`dispatch.sh`](dispatch.sh) | The mentor→builder headless dispatch wrapper: per-tree flock locks, process-group timeout kill, survivor sweep, full audit capture per run | Set `BUILDER_DIR` and `DISPATCH_MODEL` (env vars or edit the defaults); extend the survivor-sweep process pattern for your toolchain |
| [`MENTOR-KICKOFF.md`](MENTOR-KICKOFF.md) | The role-establishment ritual pasted as the first message of every mentor session | Replace `<project>` and paths; point it at your own state-handoff file |
| [`escalation-boundary.md`](escalation-boundary.md) | The three-lane model deciding what self-resolves, what goes to an advisor agent, and what reaches the human | Rewrite the Standing Authorizations to your risk tolerance |
| [`PARKING-LOT.md`](PARKING-LOT.md) | Zero-ceremony idea capture protocol (header + entry format) | Nothing — just start appending entries |

Read [docs/failure-modes.md](../docs/failure-modes.md) before your first dispatch. The
dispatch script's odd-looking parts (group kill, survivor sweep, lockfiles) each exist
because of a specific incident in that catalog; adopting the script without the
discipline gets you the failures without the recoveries.

**Safety note:** `dispatch.sh` defaults to `--permission-mode bypassPermissions` — an
unattended AI process with full write access to the builder repo and its toolchain. Read
the "Honest Tradeoffs" section of the main README before pointing it at anything you
care about, and never give a builder production credentials.
