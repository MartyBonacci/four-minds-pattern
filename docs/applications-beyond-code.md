# Four Minds Beyond Code

The Four Minds Pattern is often presented through software development examples, but it's fundamentally a **cognitive architecture** that applies to any creative or intellectual work.

## The Core Pattern (Domain-Agnostic)

**Developer:** Execution mode with full project context
**Peer:** Safe exploration space without commitment pressure
**Mentor:** Strategic guidance with visibility into both execution and exploration
**Highest Self:** Meta-level reflection on the work process itself

This separation of cognitive roles works wherever you need:
- Strategic AND tactical thinking
- Exploration AND commitment
- Execution AND reflection
- Multiple perspectives on the same work

---

## Documentation Development

### The Setup

```
~/documentation-projects/
└── api-docs-mentor/
    ├── api-docs/           # Developer: edits markdown files
    └── api-docs-peer/      # Peer: explores messaging approaches
```

### Example Workflow

**Phase 1: Brainstorm with Peer**
```
You → Peer:
"Our API documentation is too technical. Let's explore different
ways to make it more accessible for junior developers."

Peer:
[Explores multiple approaches:
- More examples vs. more theory
- Tutorial-style vs. reference-style
- Beginner path vs. graduated complexity]

"I think a graduated complexity approach with a clear 'Quick Start'
separate from 'Complete Reference' would work best. Want me to
draft some example structures?"
```

**Phase 2: Strategy with Mentor**
```
You → Mentor:
"Peer drafted some structures. Given our current API docs and user
feedback, craft a prompt for Developer to restructure the docs."

Mentor:
[Reviews existing docs + Peer explorations]
"Here's the prompt for Developer:

'Restructure API documentation into three tiers:
1. Quick Start (10 min to first API call)
2. Common Patterns (covers 80% use cases)
3. Complete Reference (exhaustive)

Maintain existing content but reorganize. Follow the structure
in peer/doc-structure-proposal.md. Keep code examples from
current docs/examples/ directory...'"
```

**Phase 3: Execute with Developer**
```
You → Developer:
[Paste Mentor's prompt]

Developer:
[Reorganizes docs, preserves examples, creates new structure]
```

**Phase 4: Reflect with Highest Self**
```
You → Highest Self:
"This restructuring workflow worked well. What documentation
patterns should I adopt for future projects?"

Highest Self:
[Analyzes across your documentation projects]
"I notice you consistently benefit from:
- Structure exploration in Peer before committing
- Mentor's synthesis of user feedback + content strategy
- This suggests a reusable pattern: User research → Peer exploration
  → Mentor synthesis → Developer execution

Want to create a documentation workflow template?"
```

### Role Translation

| Software Development | Documentation Development |
|---|---|
| Write code | Write content |
| Debug issues | Revise clarity |
| Refactor structure | Reorganize information |
| Add features | Add sections/topics |
| Code review | Content review |
| Test functionality | Review comprehension |

---

## Content Creation (Writing, Video, Podcasts)

### The Setup

```
~/content-projects/
└── newsletter-mentor/
    ├── newsletter/         # Developer: writes/publishes content
    └── newsletter-peer/    # Peer: explores angles and approaches
```

### Example Workflow

**Exploring Topics (Peer)**
```
You → Peer:
"I want to write about AI coding assistants, but the topic feels
overdone. Let's brainstorm fresh angles."

Peer:
[Explores unconventional angles:
- The cognitive cost of context switching
- Why 'faster coding' misses the point
- Desk setup for multiple AI instances
- The psychology of AI pair programming]

"The 'cognitive cost' angle feels underexplored. Want to develop
that direction?"
```

**Strategic Direction (Mentor)**
```
You → Mentor:
"Peer identified 'cognitive cost of context switching' as a fresh
angle. Given my audience (developers), craft an outline for Developer."

Mentor:
[Considers audience, platform, Peer's exploration]
"Here's the outline for Developer:

Title: 'The Hidden Cost: Why Context Switching Kills Your Productivity
(And How to Fix It)'

Hook: Personal anecdote about losing flow state
Problem: Define context switching cost (with research)
Solution: Introduce cognitive role separation
Example: Walk through a scenario
Takeaway: Actionable first step

Tone: Conversational but research-backed
Length: 1200 words
CTA: Link to Four Minds Pattern docs"
```

**Writing (Developer)**
```
You → Developer:
[Paste Mentor's outline]

Developer:
[Writes article following structure, maintains voice, includes research]
```

### Role Translation

| Software Development | Content Creation |
|---|---|
| Implement features | Write/produce content |
| Try libraries | Explore angles/formats |
| Architect system | Structure narrative |
| Code patterns | Writing patterns |
| Performance optimization | Engagement optimization |

---

## Strategic Planning & Business

### The Setup

```
~/strategy-projects/
└── product-strategy-mentor/
    ├── product-strategy/      # Developer: executes initiatives
    └── product-strategy-peer/ # Peer: explores scenarios
```

### Example Workflow

**Scenario Exploration (Peer)**
```
You → Peer:
"We're considering expanding into enterprise. Let's war-game
different approaches and their implications."

Peer:
[Explores scenarios:
- Enterprise-first pivot vs. gradual expansion
- Self-serve vs. sales-driven
- Feature parity vs. enterprise-specific product
- Pricing models and implications]

"Each path has different resource requirements and risks.
Want me to document the tradeoff matrix?"
```

**Strategic Synthesis (Mentor)**
```
You → Mentor:
"Review Peer's scenario analysis and our current resources.
What's our recommended path forward?"

Mentor:
[Synthesizes Peer's exploration + current reality]
"Given your team size (15) and runway (18 months), I recommend:
Gradual expansion with enterprise-friendly features...

Here's the prompt for Developer to create an execution plan:
'Draft a 6-month roadmap for enterprise expansion that...'"
```

**Execution Planning (Developer)**
```
You → Developer:
[Paste Mentor's prompt]

Developer:
[Creates detailed roadmap with milestones, resources, dependencies]
```

### Role Translation

| Software Development | Strategic Planning |
|---|---|
| Build features | Execute initiatives |
| Test approaches | Explore scenarios |
| Design architecture | Design strategy |
| Technical decisions | Business decisions |
| Code quality | Execution quality |

---

## Research & Analysis

### The Setup

```
~/research-projects/
└── market-research-mentor/
    ├── market-research/      # Developer: conducts research
    └── market-research-peer/ # Peer: explores hypotheses
```

### Example Workflow

**Hypothesis Exploration (Peer)**
```
You → Peer:
"We need to understand why our conversion rate dropped. Let's
brainstorm potential factors before diving into data."

Peer:
[Explores hypotheses:
- Seasonal variation
- Recent pricing changes
- Competitor activity
- Product changes
- Marketing channel shifts]

"These feel like the most likely factors. Want me to suggest
an analysis approach for each?"
```

**Research Design (Mentor)**
```
You → Mentor:
"Given Peer's hypotheses and our available data, design a research
plan for Developer to execute."

Mentor:
"Here's the systematic research plan:

1. Baseline comparison (year-over-year to eliminate seasonality)
2. Cohort analysis (before/after pricing change)
3. Competitor pricing audit
4. Feature usage correlation
5. Channel performance breakdown

Prioritize #1 and #2 (highest signal potential).

Prompt for Developer:
'Conduct year-over-year conversion analysis...'"
```

**Analysis Execution (Developer)**
```
You → Developer:
[Paste Mentor's plan]

Developer:
[Conducts analysis, creates visualizations, documents findings]
```

**Methodology Reflection (Highest Self)**
```
You → Highest Self:
"This research workflow worked well. What patterns should I
adopt for future research projects?"

Highest Self:
[Analyzes research approach]
"This follows a strong pattern: hypothesis generation (Peer)
→ research design (Mentor) → execution (Developer). This
prevents confirmation bias and ensures systematic investigation.

Consider creating a research methodology template based on
this approach."
```

### Role Translation

| Software Development | Research & Analysis |
|---|---|
| Write code | Conduct analysis |
| Experiment with approaches | Explore hypotheses |
| Design system | Design research plan |
| Debug issues | Investigate anomalies |
| Code quality | Research rigor |

---

## The Universal Pattern

Regardless of domain, Four Minds works because it separates:

1. **Execution pressure** (Developer) from **exploratory freedom** (Peer)
2. **Tactical work** (Developer) from **strategic thinking** (Mentor)
3. **Doing the work** (Developer/Peer/Mentor) from **improving how you work** (Highest Self)

**Ask yourself:**
- Do I switch between "doing" and "planning" frequently?
- Do I wish I could explore ideas without commitment pressure?
- Do I need strategic guidance that understands my execution context?
- Do I want to improve my work process itself?

If yes to any of these, Four Minds applies to your domain.

---

## Translation Guide

To adapt Four Minds to your domain:

1. **Identify your "artifacts"** (what you create)
   - Software: code, tests, docs
   - Writing: articles, books, scripts
   - Strategy: plans, roadmaps, analyses

2. **Map the roles:**
   - Developer = Creates your artifacts
   - Peer = Explores possibilities for your artifacts
   - Mentor = Strategizes about your artifacts
   - Highest Self = Reflects on your creation process

3. **Set up directory structure:**
   ```
   ~/your-projects/
   └── project-mentor/
       ├── project/       # Developer context
       └── project-peer/  # Peer context
   ```

4. **Use the same flags:**
   - Mentor: `claude-code -c --plan`
   - Peer: `claude-code -c --plan`
   - Developer: `claude-code` (or with `-c`)
   - Highest Self: `claude-code -c --plan` from `~/`

5. **Follow the same patterns:**
   - Mentor→Developer prompting
   - Peer exploration→documentation→implementation
   - Highest Self workflow evolution

The cognitive architecture is universal. The examples are domain-specific.

---

## Why Software Examples Dominate the Docs

**Transparency:** The pattern creator is a software developer and coding instructor. Software examples are:
- What they know deeply
- Concrete and easy to demonstrate
- Natural fit for Claude Code (a developer tool)
- Accessible to the primary early audience

**But this doesn't mean the pattern is software-only.**

If you work in a different domain and find the software examples hard to translate, consider:
- Creating domain-specific examples for your field
- Contributing to documentation expansion
- Sharing your usage patterns with the community

The pattern itself is domain-agnostic. The documentation is domain-specific (for now).

---

## Community Invitation

**Using Four Minds in a non-software domain?**

We'd love to hear about it:
- What domain?
- How did you translate the roles?
- What workflows emerged?
- What examples would help others in your field?

Your experience helps broaden the pattern's documented applications and makes it more accessible to diverse creative professionals.
