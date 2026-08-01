# Escalation Boundary — when the builder involves a human vs. self-resolves

**Purpose:** minimize human relay steps. Reserve the human for genuine human judgment; route verification / discipline / advice to a fresh-context advisor subagent; self-resolve the mechanical. The human's steps are the bottleneck — every item moved out of Lane 3 is latency removed from their critical path.

## Three lanes

When the builder (or mentor) hits a "should I check this?" moment, classify it into ONE lane:

### Lane 1 — Self-resolve (no escalation)
- Mechanical actions within a Standing Authorization (below).
- Anything covered by a known project fact or a *validated* discipline → apply it, cite it, move on.
- Routine implementation choices with a consistent-with-existing-patterns default.

### Lane 2 — Advisor subagent (fresh-context, no human)
Dispatch a fresh-context advisor agent (read-only, adversarial) for:
- Verifying a ship / green-gate / "it's done" claim → it runs git + tests read-only, adversarially.
- Diagnosing a failure or flake *before* choosing a remedy (including a clean-base reproduction).
- A discipline check before landing (no masking failures, stop-rules honored, verify-then-push, scope boundary respected).
- Pressure-testing a handoff or brief's premise against the actual code before it drives a decision.
- Bounding emergent work (handle now vs. tracked deferral).

Outcome → **VERIFIED** (proceed) / **ISSUE** (fix, loop) / **NEEDS-HUMAN** (promote to Lane 3).

### Lane 3 — Escalate to the human (genuine human decision ONLY)
1. **Risk acceptance** — adopting a security/quality/technical posture with tradeoffs (e.g., deferring a known fix).
2. **Product / UX judgment** — subjective calls ("does this feel right"; milestone design reviews).
3. **Scope / priority tradeoffs** — what ships vs. defers; launch-priority calls.
4. **Outward-facing / irreversible action** not covered by a Standing Authorization.
5. **Spec contradiction / genuine ambiguity** with no consistent default (flag it — never pick silently).
6. **Novel risk outside the known disciplines** — a "this feels off" the advisor can't resolve.

Each escalation is ONE well-formed message: the decision · the options · the recommendation + why · the risk being accepted. (One good escalation beats many round-trips.)

## Standing Authorizations (the human sets these once → they never escalate)

Adapt this list to your risk tolerance; the point is that it's explicit and set in advance:

- Builder MAY commit locally, freely.
- Builder MAY push **advisor-VERIFIED** commits to the integration branch (clean fast-forward) without per-push approval.
- Builder MAY run the ship-gate, tests, and read-only git/inspection freely.
- Builder MAY NOT touch external services, deploy, or take destructive/irreversible actions without a Lane-3 escalation.

## Anti-patterns (these are Lane 1/2 — do NOT relay to the human)

- "Is the gate really green?" → advisor verifies.
- "Is this flake mine?" → advisor + clean-base repro.
- "Should I commit/push this verified thing?" → standing-authorized.
- "Did the push land?" → builder fetches and checks; never assert-then-relay.
