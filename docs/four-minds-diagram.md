# Four Minds Visual Diagrams

Visual representations of the Four Minds Pattern architecture.

---

## Directory Hierarchy Diagram

```
~/                                    ┌─────────────────────────────────┐
│                                     │      HIGHEST SELF               │
│                                     │                                 │
│                                     │  Context: ALL projects          │
│                                     │           ALL .claude configs   │
│                                     │           ALL plugins/skills    │
│                                     │                                 │
│                                     │  Role: Meta-level orchestrator  │
│                                     │        Workflow guidance        │
│                                     │        Cross-project patterns   │
│                                     └─────────────────────────────────┘
│
├── .claude/                          (Global configs, plugins, skills)
│
├── code-projects/                ┌─────────────────────────────────┐
│   │                             │         MENTOR                  │
│   │                             │                                 │
│   │                             │  Context: project + peer     │
│   │                             │                                 │
│   │                             │  Role: Strategic advisor        │
│   │                             │        Prompt engineering       │
│   │                             │        Architecture planning    │
│   │                             └─────────────────────────────────┘
│   │
│   ├── my-app/               ┌─────────────────────────────────┐
│   │   ├── src/              │       DEVELOPER                 │
│   │   ├── tests/            │                                 │
│   │   ├── package.json      │  Context: project files only    │
│   │   └── ...               │                                 │
│   │                         │  Role: Implementation           │
│   │                         │        Code execution           │
│   │                         │        Bug fixing               │
│   │                         └─────────────────────────────────┘
│   │
│   └── my-app-peer/      ┌─────────────────────────────────┐
│       ├── explorations/     │         PEER                    │
│       ├── decisions/        │                                 │
│       ├── drafts/           │  Context: peer only          │
│       └── ...               │                                 │
│                             │  Role: Safe ideation & planning │
│                             │        Brainstorming            │
│                             │        Private planning         │
│                             └─────────────────────────────────┘
```

---

## Context Visibility Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         HIGHEST SELF                            │
│                     (Sees EVERYTHING)                           │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │  All Projects  │  All .claude  │  All Plugins  │  History │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
         ┌───────────────────────────────────────┐
         │            MENTOR                     │
         │      (Sees Project + Peer)         │
         │  ┌──────────────┐   ┌──────────────┐  │
         │  │   Project    │   │   Peer    │  │
         │  │    Files     │   │ Experiments  │  │
         │  └──────────────┘   └──────────────┘  │
         └───────────────────────────────────────┘
                │                      │
                ▼                      ▼
    ┌──────────────────┐   ┌──────────────────┐
    │    DEVELOPER     │   │      PEER        │
    │                  │   │                  │
    │  (Project only)  │   │  (Peer only)  │
    │                  │   │                  │
    │  ┌────────────┐  │   │  ┌────────────┐  │
    │  │  Project   │  │   │  │  Peer   │  │
    │  │   Files    │  │   │  │ Experiments│  │
    │  └────────────┘  │   │  └────────────┘  │
    └──────────────────┘   └──────────────────┘
```

---

## Cognitive Role Separation Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    THE FOUR MINDS PATTERN                       │
│           Cognitive Role Decomposition Architecture             │
└─────────────────────────────────────────────────────────────────┘

    META-LEVEL              ┌─────────────────────────┐
    THINKING                │    HIGHEST SELF         │
                            │    "The Sage"           │
                            │                         │
                            │  • Cross-project wisdom │
                            │  • Workflow optimization│
                            │  • Tool development     │
                            └───────────┬─────────────┘
                                        │
                   ┌────────────────────┼────────────────────┐
                   │                    │                    │
                   ▼                    ▼                    ▼
    STRATEGIC    ┌─────────────┐  ┌─────────────┐  ┌─────────────┐
    THINKING     │   MENTOR    │  │             │  │             │
                 │ "The Coach" │  │             │  │             │
                 │             │  │             │  │             │
                 │ • Planning  │  │             │  │             │
                 │ • Prompting │  │             │  │             │
                 │ • Strategy  │  │             │  │             │
                 └─────────────┘  │             │  │             │
                                  │             │  │             │
    EXPERIMENTAL              ┌───┴───────┐     │  │             │
    THINKING                  │   PEER    │     │  │             │
                              │"The Lab"  │     │  │             │
                              │           │     │  │             │
                              │ • Try new │     │  │             │
                              │ • Draft   │     │  │             │
                              │ • Explore │     │  │             │
                              └───────────┘     │  │             │
                                                │  │             │
    TACTICAL                                    │  │             │
    EXECUTION                              ┌────┴──┴─────┐       │
                                           │  DEVELOPER  │       │
                                           │ "The Hands" │       │
                                           │             │       │
                                           │ • Implement │       │
                                           │ • Execute   │       │
                                           │ • Build     │       │
                                           └─────────────┘       │
```

---

## Information Flow Diagram

```
                    ┌─────────────────┐
                    │  HIGHEST SELF   │
                    │                 │
                    │  Provides:      │
                    │  • Patterns     │
                    │  • Best practices│
                    └────────┬────────┘
                             │
                             ▼
┌───────────────────────────────────────────────────────┐
│                      MENTOR                           │
│                                                       │
│  Receives: Patterns from Highest Self                │
│  Sees: Project + Peer                             │
│  Provides: Strategic prompts                         │
└───────────┬───────────────────────────┬───────────────┘
            │                           │
            ▼                           ▼
    ┌───────────────┐          ┌────────────────┐
    │  DEVELOPER    │◄─────────│     PEER       │
    │               │  Validated│                │
    │  Receives:    │  approaches│  Receives:     │
    │  • Prompts    │           │  • Questions   │
    │  • Direction  │           │  • Ideas       │
    │               │           │                │
    │  Provides:    │           │  Provides:     │
    │  • Results    │           │  • Experiments │
    │  • Code       │──────────►│  • Drafts      │
    │               │  Feedback │                │
    └───────────────┘           └────────────────┘

Flow Pattern:
1. Highest Self → Mentor (patterns and guidance)
2. Mentor → Peer (experiment requests)
3. Peer → Mentor (experimental findings)
4. Mentor → Developer (strategic prompts)
5. Developer → Mentor (results for multi-step)
```

---

## Typical Workflow Diagram

```
START: New Feature Needed
         │
         ▼
    ┌─────────────────┐
    │  ASK MENTOR:    │
    │  "Help me plan  │
    │   this feature" │
    └────────┬────────┘
             │
             ├─────────────────────┐
             │                     │
             ▼                     ▼
    Need Experiment?        Direct Implementation?
         YES                      NO
         │                        │
         ▼                        │
    ┌─────────────┐               │
    │  USE PEER:  │               │
    │  Try approach│               │
    │  in peer  │               │
    └──────┬──────┘               │
           │                      │
           ▼                      │
    ┌─────────────┐               │
    │  Results to │               │
    │   MENTOR    │               │
    └──────┬──────┘               │
           │                      │
           └──────────┬───────────┘
                      │
                      ▼
              ┌──────────────┐
              │ MENTOR crafts│
              │    prompt    │
              └──────┬───────┘
                     │
                     ▼
              ┌──────────────┐
              │  DEVELOPER   │
              │  implements  │
              └──────┬───────┘
                     │
                     ▼
              ┌──────────────┐
              │    DONE      │
              │              │
              │ (or iterate  │
              │  if needed)  │
              └──────────────┘
```

---

## Terminal Layout Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                    TMUX Session: four-minds                     │
├─────────────────────────────────┬───────────────────────────────┤
│                                 │                               │
│     HIGHEST SELF (~/)           │     MENTOR (parent/)          │
│                                 │                               │
│  $ claude-code -c --plan        │  $ claude-code -c --plan      │
│                                 │                               │
│  > "How do I develop plugins?"  │  > "Craft prompt for auth"    │
│                                 │                               │
│  [Advisory mode]                │  [Strategic mode]             │
│                                 │                               │
├─────────────────────────────────┼───────────────────────────────┤
│                                 │                               │
│     PEER (peer/)             │     DEVELOPER (project/)      │
│                                 │                               │
│  $ claude-code -c --plan        │  $ claude-code                │
│                                 │                               │
│  > "Let's try approach A"       │  > [Execute Mentor's prompt]  │
│                                 │                               │
│  [Experimentation mode]         │  [Execution mode]             │
│                                 │                               │
└─────────────────────────────────┴───────────────────────────────┘

Keyboard shortcuts:
  Ctrl+b ←/→/↑/↓  : Navigate panes
  Ctrl+b z        : Zoom pane (fullscreen)
  Ctrl+b [        : Scroll mode
```

---

## Comparison: Traditional vs Four Minds

```
TRADITIONAL SINGLE AI APPROACH
┌─────────────────────────────────────┐
│         ONE AI INSTANCE             │
│                                     │
│  Does Everything:                   │
│  • Strategic thinking               │
│  • Experimentation                  │
│  • Implementation                   │
│  • All at once                      │
│                                     │
│  Problems:                          │
│  ❌ Context switching               │
│  ❌ Polluted git history            │
│  ❌ No perspective separation       │
│  ❌ Strategic/tactical confusion    │
└─────────────────────────────────────┘

FOUR MINDS PATTERN
┌─────────────────────────────────────┐
│          HIGHEST SELF               │
│      (Meta-level guidance)          │
└──────────────┬──────────────────────┘
               │
┌──────────────┴──────────────────────┐
│            MENTOR                   │
│      (Strategic thinking)           │
└──────┬────────────────┬─────────────┘
       │                │
┌──────┴──────┐  ┌──────┴──────┐
│    PEER     │  │  DEVELOPER  │
│(Experiment) │  │ (Execute)   │
└─────────────┘  └─────────────┘

Benefits:
✅ Clear cognitive separation
✅ Clean git history (experiments in peer)
✅ Perspective diversity
✅ Strategic clarity
✅ Focused execution
```

---

## Use Case: Feature Development Flow

```
PHASE 1: PLANNING
   You → Mentor: "Plan authentication feature"
   Mentor: Reviews project, suggests architecture

   ┌─────────┐
   │ MENTOR  │
   └────┬────┘
        │ Strategic plan
        ▼

PHASE 2: EXPERIMENTATION (if needed)
   You → Peer: "Try JWT library"
   Peer: Tests in peer

        ┌─────────┐
        │  PEER   │
        └────┬────┘
             │ Experimental results
             ▼

PHASE 3: STRATEGY REFINEMENT
   You → Mentor: "Peer validated approach, craft prompts"
   Mentor: Creates implementation prompts

   ┌─────────┐
   │ MENTOR  │
   └────┬────┘
        │ Detailed prompts
        ▼

PHASE 4: EXECUTION
   You → Developer: [Paste prompts]
   Developer: Implements

        ┌────────────┐
        │ DEVELOPER  │
        └─────┬──────┘
              │ Implementation
              ▼

PHASE 5: COMPLETION
   Feature complete, clean git history,
   strategic decisions documented
```

---

## Context Scope Comparison

```
HIGHEST SELF
├─ Breadth: ███████████████████████████████ (Maximum)
└─ Depth:   ████ (Limited per project)

MENTOR
├─ Breadth: ████████████ (Project + Peer)
└─ Depth:   ████████████████ (Good project understanding)

PEER
├─ Breadth: ████ (Peer only)
└─ Depth:   ████████████████████ (Deep experimental focus)

DEVELOPER
├─ Breadth: ████████ (Project only)
└─ Depth:   ████████████████████████ (Maximum code detail)

Trade-off: Breadth ↔ Depth
Each Mind optimized for its role
```

---

These diagrams can be used in:
- README.md
- Documentation
- Presentations
- Blog posts
- Video thumbnails
- Social media graphics

For high-quality visual versions, consider creating:
- PNG/SVG graphics using draw.io or Excalidraw
- Animated GIFs showing workflow
- Interactive diagrams
- Video walkthroughs with screen recordings
