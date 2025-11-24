# Four Minds Workflow Guide

Complete guide to using each Mind effectively, when to use which Mind, and how they coordinate together.

---

## Table of Contents

1. [Quick Reference](#quick-reference)
2. [Highest Self Workflows](#highest-self-workflows)
3. [Mentor Workflows](#mentor-workflows)
4. [Peer Workflows](#peer-workflows)
5. [Developer Workflows](#developer-workflows)
6. [Coordination Patterns](#coordination-patterns)
7. [Decision Matrix](#decision-matrix)
8. [Common Scenarios](#common-scenarios)

---

## Quick Reference

### When to Use Each Mind

| You Want To... | Use This Mind | What It Solves |
|---|---|---|
| Implement a feature | Developer | Execution focus without strategic interruption |
| Fix a bug | Developer | Direct code access with full project context |
| Review code | Developer | Complete codebase understanding for thorough review |
| Brainstorm approaches | Peer | Freedom to explore without commitment anxiety |
| Try a risky idea | Peer | Safe space where exploration has no consequences |
| Draft marketing copy | Peer | Unconstrained ideation for messaging/positioning |
| Talk through architecture | Peer | Conversational exploration before decisions |
| Get prompting advice | Mentor | Strategic prompts aligned with codebase patterns |
| Plan architecture | Mentor | Synthesis of project reality + ideation insights |
| Coordinate execution | Mentor | Strategic orchestration with visibility into both contexts |
| Learn Claude Code workflows | Highest Self | Meta-level tool mastery and workflow evolution |
| Build Claude Code plugins | Highest Self | Access to all configs + cross-project patterns |
| Improve development practice | Highest Self | Continuous workflow innovation and reflection |

### Typical Terminal Setup

```
Terminal 1 (top-left):     Highest Self
cd ~/
claude-code -c --plan

Terminal 2 (top-right):    Mentor
cd ~/code-projects/my-app-mentor/
claude-code -c --plan

Terminal 3 (bottom-left):  Peer
cd ~/code-projects/my-app-mentor/my-app-peer/
claude-code -c --plan

Terminal 4 (bottom-right): Developer
cd ~/code-projects/my-app-mentor/my-app/
claude-code
```

### Common Flags by Mind

| Mind | Typical Flags | Why |
|---|---|---|
| Highest Self | `-c --plan` | Preserve learning, advisory mode |
| Mentor | `-c --plan` | Preserve strategy, prompt-crafting mode |
| Peer | `-c --plan` | Preserve experiments, ideation mode |
| Developer | (none) or `-c` | Execution mode, context optional |

---

## Highest Self Workflows

**Location:** `~/` (home directory)
**Context:** All projects, all .claude directories, all plugins/commands/skills
**Role:** Workflow evolution partner, Claude Code mastery guide, and meta-development advisor

### Primary Use Cases

#### 1. Developing Claude Code Tooling

**When:** Building plugins, commands, skills, or scripts for Claude Code itself.

**Why Highest Self:** Has access to all existing .claude configurations and can see patterns across your tool development.

**Example workflow:**
```
You → Highest Self:
"I want to create a new Claude Code plugin for managing database
migrations. Show me examples from my existing plugins and guide me
through the structure."

Highest Self:
[Reviews your existing plugins from ~/.claude/]
"Based on your existing plugins, here's the recommended structure:
- Your convocli-notifier plugin shows a good pattern for...
- Your specswarm plugin demonstrates how to handle...
- I recommend following the architecture from..."
```

**Deliverables:** Plugin scaffolding, command structures, workflow automation

#### 2. Cross-Project Pattern Recognition

**When:** You want to understand patterns across all your projects.

**Example workflow:**
```
You → Highest Self:
"I'm starting a new React app. What patterns have worked well in my
previous React projects?"

Highest Self:
[Scans all React projects in ~/code-projects/]
"Analyzing your React project history:
- 5 projects use Vite, 2 use Create React App
- Vite projects show better dev experience in your commit messages
- You consistently prefer functional components
- Your best-structured project (my-dashboard) uses this folder structure:
  [shows structure]
- Recommend: Vite + functional components + that folder structure"
```

#### 3. Workflow Optimization

**When:** You want to improve how you use the Four Minds pattern itself.

**Example workflow:**
```
You → Highest Self:
"I feel like I'm not using Peer effectively. How can I optimize my
workflow?"

Highest Self:
"Looking at your usage patterns across projects:
- You use Peer mostly for documentation planning
- I see missed opportunities in these areas:
  1. Library evaluation before committing to dependencies
  2. A/B testing different algorithms before choosing
  3. Drafting user-facing copy before adding to project
- Suggest: Use Peer for 'what if' explorations more actively"
```

#### 4. Development Practice Meta-Analysis

**When:** You want insights about your development practice itself.

**Example workflow:**
```
You → Highest Self:
"What are my most common debugging patterns?"

Highest Self:
[Analyzes across all projects]
"Your debugging patterns:
1. You typically add console logging first (80% of debugging sessions)
2. You reference error handling patterns from utils/errors.ts
3. You run tests early in debugging process
4. Common issue: Missing await on async calls (appears in 12 projects)
Suggest: Create a debugging checklist based on these patterns"
```

#### 5. Workflow Evolution and Innovation

**When:** You want to improve how you work, not just what you work on.

**Why Highest Self:** Sees all your projects, understands your patterns, knows the Claude Code ecosystem deeply. This meta-level perspective enables insights about your entire development practice.

**Example workflow:**
```
You → Highest Self:
"I find myself repeatedly context-switching between planning and coding,
and it's killing my productivity. How can I structure my workflow better?"

Highest Self:
[Analyzes your project structures, Claude Code usage patterns]
"Looking at your working patterns, I notice:
- You often start coding before fully planning
- Then stop to plan more when you hit complexity
- This creates fragmented context in your conversations

I see a potential solution: What if you physically separated strategic
planning from execution using directory hierarchy? You could run one
Claude instance at project level for execution, and another at parent
level for strategy..."

You:
"Interesting... tell me more about this directory hierarchy approach."

[Conversation evolves, exploring the idea]

Highest Self:
"This could be formalized into a pattern. Let me sketch out how it would work:
- Different directory levels = different cognitive contexts
- Multiple Claude instances = separated concerns
- You orchestrate between them based on thinking mode..."

[Several conversations later, the Four Minds Pattern emerges]
```

**Real Examples of Workflow Innovations:**
- **SpecSwarm:** Emerged from Highest Self conversations about systematic feature development
- **ConvoSync:** Created based on Highest Self's insights about conversation management
- **Four Minds Pattern:** The pattern you're using right now came from Highest Self meta-reflection
- **Custom Claude Code plugins:** Developed through Highest Self guidance on tooling needs

**Topics for Highest Self Conversations:**
- "My workflow feels inefficient, but I can't pinpoint why"
- "What Claude Code features am I underutilizing?"
- "Should I build a custom plugin for [repeated task]?"
- "How do expert Claude Code users structure their work?"
- "I keep hitting the same problems across projects—what pattern am I missing?"
- "What's the next evolution of my development practice?"

**Why This Works:**
Highest Self combines:
1. **Deep tool knowledge** (understands Claude Code capabilities)
2. **Cross-project perspective** (sees patterns across your work)
3. **Self-knowledge** (same LLM as your Developer, so knows what's possible)
4. **Meta-level thinking** (focuses on HOW you work, not WHAT you build)

This unique combination enables genuine workflow innovation, not just optimization of existing approaches.

### Best Practices for Highest Self

✅ **Do:**
- Ask about cross-project patterns
- Seek workflow and process guidance
- Build Claude Code tooling
- Meta-level strategic planning
- Analyze your development practice

❌ **Don't:**
- Use for single-project implementation details
- Let it edit specific project files (too broad context)
- Ask about features unrelated to Claude Code ecosystem
- Use when Mentor/Peer/Developer would be more focused

### Typical Session Structure

```
1. Open Highest Self: cd ~/ && claude-code -c --plan
2. Ask meta-level question about workflows or cross-project patterns
3. Receive strategic guidance based on full development practice
4. Apply insights to current work
5. Keep session open for ongoing workflow consultation
```

---

## Mentor Workflows

**Location:** Project-mentor directory containing both project and peer
**Context:** Both project AND peer directories simultaneously
**Role:** Strategic advisor and prompt engineer

### Primary Use Cases

#### 1. Crafting Prompts for Developer

**When:** You need to implement a feature and want strategically crafted instructions.

**Why Mentor:** Sees project structure, existing patterns, and peer experiments.

**Example workflow:**
See [Mentor→Developer Workflow](mentor-developer-workflow.md) for complete guide.

**Quick version:**
```
You → Mentor:
"Help me craft a prompt for Developer to implement user authentication"

Mentor:
[Reviews project structure and patterns]
"Here's the prompt for Developer:
'Implement JWT-based authentication following the existing API
pattern in src/api/, using error handling from utils/errors.ts,
with tests matching __tests__/api/ structure...'"

You → Developer:
[paste Mentor's prompt]
```

#### 2. Architectural Planning

**When:** Making strategic decisions about project structure or approach.

**Example workflow:**
```
You → Mentor:
"Should we use Redux or Context API for state management?"

Mentor:
[Examines project scope and existing patterns]
"Based on your project structure:
- Current scale: Medium complexity (15 components)
- Existing patterns: You're using hooks effectively
- No global state currently
- Recommendation: Start with Context API
  - Matches your functional component approach
  - Sufficient for current scope
  - Can migrate to Redux if needed later
- I see you tried Redux in peer - what issues did you hit?"

[You share peer findings]

Mentor:
"Given those performance concerns from peer, stick with Context
but implement it following the pattern from your best-performing app..."
```

#### 3. Coordinating Experiments and Implementation

**When:** You've tried approaches in Peer and need to decide what to implement.

**Example workflow:**
```
You → Mentor:
"I tried two different data fetching approaches in peer. Which should
I implement in the project?"

Mentor:
[Reviews both peer and project]
"Comparing your peer experiments:

Approach A (custom hook):
+ Matches your existing hook patterns
+ More testable
- More initial setup

Approach B (direct fetch):
+ Simpler initially
- Creates inconsistency with existing data layer

Recommend Approach A because:
1. Consistency with hooks/useAuth.ts pattern
2. Your tests/__tests__/hooks/ structure already set up
3. Worth the setup time for maintainability

Here's the prompt for Developer to implement Approach A:
[detailed implementation prompt]"
```

#### 4. Code Review Coordination

**When:** You want strategic code review, not just syntax checking.

**Example workflow:**
```
You → Mentor:
"Developer just implemented the payment integration. Please review
the approach strategically."

Mentor:
[Reviews implementation in project context]
"Strategic review of payment integration:

Architecture alignment: ✅
- Follows existing service pattern
- Consistent error handling

Potential concerns: ⚠️
- Direct API calls in components (we usually use hooks)
- Missing rate limiting (we have it on other endpoints)
- Test coverage gaps in payment flow edge cases

Recommendations:
1. Extract to usePayment hook (matches our pattern)
2. Add rate limiting using existing middleware/rateLimit.ts
3. Add tests for refund and dispute scenarios

Want me to craft prompts for Developer to address these?"
```

### Best Practices for Mentor

✅ **Do:**
- Craft strategic prompts for Developer
- Review project + peer together
- Make architectural decisions
- Coordinate between experimentation and execution
- Maintain conversation context with `-c` flag
- Stay in plan mode (advisory, not execution)

❌ **Don't:**
- Edit project files directly (breaks Developer's context—theory-based, not validated)
- Implement features (that's Developer's job)
- Run without `-c` flag (loses strategic context)
- Operate at project level (use project-mentor directory)

### Typical Session Structure

```
1. Open Mentor: cd ~/code-projects/my-app-mentor/ && claude-code -c --plan
2. Describe what you want to accomplish
3. Mentor reviews both project and peer context
4. Mentor crafts strategic prompt(s) for Developer
5. You copy-paste to Developer
6. If multi-step, paste results back to Mentor for next prompt
7. Keep session open for ongoing strategy consultation
```

---

## Peer Workflows

**Location:** Sibling directory to project (e.g., `my-app-peer/`)
**Context:** Peer directory, can request permission to view project
**Role:** Conversational brainstorming partner; safe experimentation space

### Primary Use Cases

#### 1. Conversational Ideation and Brainstorming

**When:** You need to think through possibilities, talk through approaches, or develop ideas before committing to a direction.

**The Pattern:**
Peer is your thinking partner for exploring "what could be" without the weight of "what must be done." This is conversational, iterative, unconstrained ideation.

**Example workflow:**
```
You → Peer:
"I'm thinking about how users should onboard to our app. Let's brainstorm
different flows and talk through the tradeoffs."

Peer:
"Great! Let's explore some approaches:

Option A: Guided tutorial on first login
- Pros: High hand-holding, good for complex apps
- Cons: Users might skip it, feels forced
- Best for: Apps with steep learning curves

Option B: Progressive disclosure during usage
- Pros: Contextual, feels natural
- Cons: Might miss key features
- Best for: Intuitive interfaces

Option C: Interactive playground
- Pros: Learning by doing, engaging
- Cons: Development overhead
- Best for: Creative or technical tools

What's your user base like? Are they technical? Time-constrained?"

You:
"Mix of technical and non-technical. Time-constrained for sure."

Peer:
"In that case, I'd lean toward Option B with a twist: progressive
disclosure with a 'quick tips' system that appears contextually but
can be dismissed. Want to talk through how that would work in practice?"

You:
"Yes, walk me through it..."

[Conversation continues, exploring details, edge cases, UX flow]

Peer:
"Should I document this as a UX flow spec? Or create some wireframe
descriptions we can give to Developer later?"
```

**Why This Works:**
- Conversational format allows iterative refinement
- No pressure to "get it right" immediately
- Can explore tangents without derailing implementation work
- Freedom from commitment enables better ideas
- Peer can challenge assumptions you didn't know you were making

**Common Brainstorming Topics:**
- Feature designs and user flows
- Architecture approaches
- Market positioning and value propositions
- Content strategy and messaging
- Problem-solving for tricky requirements
- "How might we..." exploratory questions

**After Brainstorming:**
Ask Peer to document the decisions/insights (see "Planning Artifacts and Decision Documentation" section) for transfer to Mentor or Developer.

**Remember:** This is Peer's PRIMARY role. Technical discussions (libraries, algorithms, etc.) are a specific application of this brainstorming capability, not the core purpose.

**Important: Peer writes markdown documentation files, not code files.**

Even when discussing technical topics (libraries, algorithms, architectures), Peer's output is:
- ✅ Markdown files documenting ideas, evaluations, decisions
- ✅ Conversational exploration of possibilities
- ❌ NOT code prototypes or implementations

If you need to test a library or validate an approach with actual code, have the conversation with Peer, document the decision, then ask Developer to implement.

#### 2. Library/Approach Evaluation

**When:** Considering a new library or technical approach before committing.

**Example workflow:**
```
You → Peer:
"I'm thinking about using Zustand for state management. Let's discuss
the pros and cons before I commit to it."

Peer:
"Great! Let's evaluate Zustand through discussion. I'll help you think
through the implications. What state management patterns does your app need?"

[You describe requirements]

Peer:
[Conversational exploration of Zustand's fit]
"Based on our discussion, here's my evaluation:

Pros:
- Minimal boilerplate (compared to Redux)
- Great TypeScript support
- Fits your functional style

Cons:
- Learning curve for team
- Less ecosystem tooling than Redux
- Younger library, fewer battle-tested patterns

Trade-offs Analysis:
[Detailed discussion of trade-offs specific to your use case]

Recommendation: Zustand seems like a good fit for your needs.

Should I document this evaluation in peer/zustand-evaluation.md so we
can share it with Mentor for implementation planning?"
```

**After documentation:**
```
You → Mentor:
"I've evaluated Zustand with Peer (see peer/zustand-evaluation.md).
Please craft an implementation prompt for Developer."

Mentor:
[Reviews both evaluation doc and project]
"Here's the prompt for Developer:
'Implement Zustand state management following the evaluation in
docs/zustand-evaluation.md. Start with [specific module], following
existing patterns in src/state/...'"
```

#### 3. Algorithm/Logic Discussion

**When:** Thinking through different algorithms or logic approaches before implementation.

**Example workflow:**
```
You → Peer:
"I need to implement search functionality. Let's discuss different
algorithmic approaches and their trade-offs."

Peer:
"Great! Let's explore search algorithm options for your use case.
First, tell me about your data size, search requirements, and
performance constraints."

[You describe context]

Peer:
[Conversational exploration of approaches]
"Let's think through three main approaches:

Approach A: Simple string matching
- Pros: Fast (~2ms), easy to maintain
- Cons: Inflexible, exact matches only
- Best for: Small datasets, precise queries

Approach B: Fuzzy search (fuse.js library)
- Pros: Very flexible, handles typos, moderate speed (~15ms)
- Cons: Additional dependency, configuration needed
- Best for: User-facing search, < 10k items

Approach C: Custom weighted algorithm
- Pros: Perfect relevance for your domain
- Cons: Slower (~50ms), complex to maintain
- Best for: Critical search where relevance > speed

Given your constraints (< 1000 items, user-facing), I'd recommend
Approach B. The fuzzy matching will improve UX significantly, and 15ms
is imperceptible to users.

Should I document this analysis in peer/search-algorithm-analysis.md?"
```

**After documentation:**
```
You → Mentor:
"Peer and I analyzed search algorithms (see peer/search-algorithm-analysis.md).
Can you craft an implementation prompt for Developer using fuzzy search?"

Mentor:
"Here's the prompt for Developer:
'Implement fuzzy search using fuse.js per the analysis in
docs/search-algorithm-analysis.md. Configure with the recommended
weights and thresholds. Follow existing search patterns in
src/search/...'"
```

#### 3. Private Planning and Strategy

**When:** Brainstorming features, market positioning, or business decisions.

**Example workflow:**
```
You → Peer:
"Let's brainstorm value propositions for this product."

Peer:
"Value proposition brainstorming:

For: Developers using AI coding assistants
Problem: Context switching kills productivity
Solution: Four Minds Pattern

Possible angles:
1. Productivity: '10x your AI coding effectiveness'
2. Quality: 'Better code through cognitive role separation'
3. Workflow: 'Think strategically, execute tactically'
4. Innovation: 'The missing pattern in AI development'

Draft messaging for each angle:
[detailed drafts in peer/marketing-drafts.md]

Which resonates with your positioning?"
```

#### 4. Documentation Drafting

**When:** Writing docs, marketing copy, or planning materials privately.

**Example workflow:**
```
You → Peer:
"Draft a README for this project based on the current state."

Peer:
[Can request permission to view project]
"I see your project structure. Let me draft a comprehensive README.

[Creates peer/README-draft.md with:
- Project overview
- Installation
- Usage examples
- API documentation
- Contributing guidelines]

Review the draft and let me know what to adjust before
moving it to the main project."
```

#### 5. Refactoring Discussion

**When:** Thinking through major refactors before touching production code.

**Example workflow:**
```
You → Peer:
"I want to refactor the component structure. It's getting messy with
30+ files in a flat directory. Let's talk through options."

Peer:
[Requests permission to view project structure]
"I can see your current structure. Let's discuss refactoring approaches.

Current structure:
/components (flat, 30+ files) - hard to navigate

Let's explore organizational strategies:

Option A: By feature
/components/auth, /components/dashboard, etc.
+ Clear feature boundaries
+ Easy to find related components
- Still somewhat flat within features

Option B: By component type
/components/common, /components/features, /components/layouts
+ Clear component categories
+ Reusable components grouped
- Feature code spread across categories

Option C: Hybrid approach
/components/common (shared)
/components/features/auth (feature-specific)
/components/layouts (structural)
+ Best of both worlds
+ Scales well
- More directories to manage

Given your project size and growth trajectory, I'd recommend Option C.

Trade-offs to consider:
- Migration effort: ~50 import statements to update
- Estimated time: 2-3 hours
- Risk: Medium (lots of imports, but no logic changes)
- Benefit: Much better organization for future growth

Should I document this refactoring plan in peer/refactoring-plan.md
with the directory structure diagram and migration checklist?"
```

**After documentation:**
```
You → Mentor:
"I've planned a component refactoring with Peer (see
peer/refactoring-plan.md). Can you craft a safe implementation
approach for Developer?"

Mentor:
"Here's the phased approach for Developer:
'Phase 1: Create new directory structure (no file moves yet)
Phase 2: Move files one feature at a time, updating imports
Phase 3: Run tests after each feature migration
See full plan in docs/refactoring-plan.md'"
```

#### 6. Planning Artifacts and Decision Documentation

**When:** After conversational brainstorming, you need to document decisions and transfer them to the project for implementation.

**The Pattern:**
Peer's conversational ideation produces insights that need to be captured, transferred, and acted upon. This workflow bridges the gap between brainstorming and execution.

**Example workflow:**

**Phase 1: Conversational Brainstorming**
```
You → Peer:
"Let's think through the authentication architecture. I'm torn between
session-based and JWT approaches. Let's talk through the tradeoffs for
our specific use case."

Peer:
[Engaging conversation exploring:
- Security implications for your app
- User experience considerations
- Infrastructure constraints
- Team expertise level
- Maintenance overhead]

"Based on our discussion, here's my recommendation: JWT with refresh
tokens because..."
```

**Phase 2: Document the Decision**
```
You → Peer:
"Create a decision document capturing what we just discussed—the chosen
approach, rationale, implementation considerations, and why we rejected
the alternatives."

Peer:
[Creates peer/decisions/auth-architecture-decision.md with:
- Chosen Approach: JWT with refresh tokens
- Key Rationale: [specific reasons from your discussion]
- Implementation Considerations: [technical details]
- Rejected Alternatives: Session-based (why: ...), OAuth only (why: ...)
- Open Questions: [any remaining uncertainties]
]

"I've created the decision document in peer/decisions/. Would you like me
to copy it to the project docs directory?"
```

**Phase 3: Transfer to Project**
```
You → Peer:
"Yes, copy it to my-app/docs/decisions/"

Peer:
[Copies peer/decisions/auth-architecture-decision.md →
 my-app/docs/decisions/auth-architecture-decision.md]

"Done. The decision document is now in your project documentation."
```

**Alternative:** You can ask Developer to copy the file instead of Peer.

**Phase 4: Implementation**
```
You → Mentor:
"Based on the architecture decision document in docs/decisions/
auth-architecture-decision.md, craft an implementation prompt for Developer."

Mentor:
[Reviews decision document with project context]
"Here's the prompt for Developer:

'Implement JWT authentication with refresh tokens as specified in
docs/decisions/auth-architecture-decision.md. Follow the existing API
pattern in src/api/, use error handling from utils/errors.ts, and match
the testing style in __tests__/api/. Key requirements from decision doc:
- Access token: 15min expiry
- Refresh token: 7 day expiry, stored httpOnly
- Rate limiting on token endpoints
...'
"

You → Developer:
[paste Mentor's prompt]
```

**Document Types That Flow This Way:**
- **Architecture decisions** (stay in project docs permanently)
- **Feature planning** (temporary, can be archived after implementation)
- **Strategic direction** (stays in peer if private, moves to project if shared with team)
- **Market positioning** (usually stays in peer unless public-facing)
- **Technical research findings** (copy conclusions to project, keep detailed exploration in peer)

**Best Practices:**
- Use peer for the conversational exploration (unconstrained thinking)
- Create the document in peer first (safe space for drafting)
- Copy to project only when decision is firm (avoid premature commitment)
- Keep detailed exploration notes in peer (for future reference)
- Move final decisions to project (for implementation and team visibility)

**Why This Works:**
- Brainstorming stays unconstrained (peer context)
- Decisions get documented (explicit rationale)
- Implementation has clear direction (decision doc provides spec)
- History is preserved (both peer notes and project docs)

### Best Practices for Peer

✅ **Do:**
- Explore ideas freely without worrying about git history
- Draft documents before adding to project
- Discuss risky or unconventional approaches
- Brainstorm and ideate without constraints
- Keep in plan mode for deliberate thinking
- Request project permission when you need context

❌ **Don't:**
- Implement production features here (use Developer)
- Write code files (create markdown documentation instead)
- Edit project files directly
- Use as permanent documentation (move to project when ready)

### Typical Session Structure

```
1. Open Peer: cd ~/code-projects/my-app-mentor/my-app-peer/ && claude-code -c --plan
2. Describe ideation or planning goal
3. Peer engages in conversational exploration
4. Document decisions and insights in markdown
5. Evaluate conclusions together
6. Copy validated documents to project (via Developer)
7. Keep planning documents for future reference
```

---

## Developer Workflows

**Location:** Project directory
**Context:** Full project file context
**Role:** Implementation and execution

### Primary Use Cases

#### 1. Feature Implementation

**When:** Building new features or functionality.

**Best approach:** Get prompts from Mentor first.

**Example workflow:**
```
[Get prompt from Mentor - see Mentor→Developer Workflow doc]

You → Developer:
[Paste Mentor's crafted prompt]

Developer:
[Implements with full context and clear direction]
"Implemented authentication with:
- JWT tokens with refresh flow
- Middleware following existing pattern
- Tests matching existing structure
- Error handling consistent with utils/errors.ts
All tests passing. Ready for review."
```

#### 2. Bug Fixing

**When:** Fixing issues in existing code.

**Example workflow:**
```
You → Developer:
"The shopping cart total is calculating incorrectly when applying
discount codes. Debug and fix."

Developer:
[Has full project context to investigate]
"Found the issue:
- calculateTotal was applying discount before tax
- Should apply discount after tax calculation

Fixed in src/utils/cart.ts:42
Added test case to prevent regression
All tests passing."
```

#### 3. Code Review and Refactoring

**When:** Improving existing code quality.

**Example workflow:**
```
You → Developer:
"Review the user profile implementation and suggest improvements."

Developer:
[Reviews with full codebase context]
"Review findings:

Current implementation:
- Profile component is 500 lines (too large)
- Mixing data fetching and UI logic
- Inconsistent with our other pages

Recommended refactoring:
1. Extract data fetching to useUserProfile hook
2. Break into ProfileHeader, ProfileForm, ProfileAvatar
3. Move API calls to services/profile.ts

This matches patterns from our dashboard implementation.
Want me to refactor now?"
```

#### 4. Testing

**When:** Writing tests for features.

**Example workflow:**
```
You → Developer:
"Add comprehensive test coverage for the authentication module."

Developer:
[Understands existing test patterns]
"Adding tests for auth module:

Following test structure from __tests__/api/:
- Unit tests for authService.ts
- Integration tests for auth endpoints
- E2E tests for login/logout flow

Using existing test utilities from __tests__/utils/

Coverage before: 45%
Coverage after: 92%
All tests passing."
```

#### 5. Documentation

**When:** Documenting code or APIs.

**Example workflow:**
```
You → Developer:
"Add JSDoc comments to the API utilities and update the API documentation."

Developer:
[Has full context of API structure]
"Documentation added:

1. JSDoc comments on all public functions in src/api/
2. Updated docs/api.md with new endpoints
3. Added usage examples matching existing doc style
4. Updated README with API changes

Followed existing documentation patterns from docs/"
```

### Best Practices for Developer

✅ **Do:**
- Focus on execution and implementation
- Use prompts from Mentor for strategic features
- Reference existing code patterns
- Run tests after changes
- Ask for clarification when prompts are unclear
- Use `-c` flag if you want context continuity

❌ **Don't:**
- Make strategic decisions without consulting Mentor
- Experiment with risky approaches (use Peer)
- Work on multiple unrelated features simultaneously
- Ignore existing code patterns
- Skip testing

### Typical Session Structure

```
1. Open Developer: cd ~/code-projects/my-app-mentor/my-app/ && claude-code
2. Receive prompt from Mentor (or direct for small tasks)
3. Implement with full project context
4. Run tests, verify functionality
5. Report results (to you, or back to Mentor for multi-step)
6. Move to next task
```

---

## Coordination Patterns

### Pattern 1: Ideation → Implementation

```
1. Peer: Discuss approaches conversationally
2. Peer: Document evaluation in markdown
3. Mentor: Review ideation docs and project needs
4. Mentor: Craft implementation prompt based on validated approach
5. Developer: Implement the chosen solution
```

### Pattern 2: Strategic Feature Development

```
1. Mentor: Plan feature architecture
2. Peer: Discuss complex aspects if needed
3. Mentor: Craft series of prompts for Developer
4. Developer: Implement step by step
5. Mentor: Review progress, adjust next prompts
6. Developer: Continue until complete
```

### Pattern 3: Cross-Project Learning

```
1. Highest Self: Identify pattern from previous projects
2. Mentor: Adapt pattern to current project context
3. Developer: Implement adapted pattern
```

### Pattern 4: Problem Solving

```
1. Developer: Encounter issue
2. Peer: Brainstorm alternative approaches
3. Mentor: Evaluate alternatives in project context
4. Mentor: Craft solution prompt for Developer
5. Developer: Implement solution
```

---

## Decision Matrix

### "Which Mind should I use?"

| Situation | Decision Logic | Mind |
|---|---|---|
| Need to implement feature | Is it strategic/complex? | Yes→Mentor, then Developer |
| | Is it simple/routine? | Developer directly |
| Want to try new approach | Ready to commit? | No→Peer |
| | Needs strategic eval? | Peer, then Mentor |
| Making architecture choice | Affects whole project? | Mentor |
| | Just local refactor? | Developer |
| Learning Claude Code | About tooling itself? | Highest Self |
| | About using in project? | Mentor |
| Writing documentation | Technical project docs? | Developer |
| | Planning/marketing? | Peer |
| Debugging | Understand issue? | Yes→Developer |
| | Need exploration? | Peer, then Developer |

---

## Common Scenarios

### Scenario: Starting a New Feature

```
1. You → Mentor:
   "I want to add real-time notifications. Help me plan the approach."

2. Mentor reviews project structure, suggests architecture

3. You → Peer:
   "Let's discuss the WebSocket connection approach Mentor suggested."

4. Peer discusses approach, documents considerations

5. You → Mentor:
   "Peer and I discussed the approach (see peer/websocket-plan.md). Craft implementation prompts for Developer."

6. Mentor provides step-by-step prompts

7. You → Developer:
   [Execute prompts one by one]

8. Complete feature with strategic coordination across all minds
```

### Scenario: Debugging Complex Issue

```
1. You → Developer:
   "The payment processing is failing intermittently."

2. Developer investigates, finds potential causes

3. You → Peer:
   "Let's create isolated test cases for each potential cause."

4. Peer creates test scenarios

5. You → Mentor:
   "Based on Peer's tests, what's the best debugging strategy?"

6. Mentor crafts systematic debugging prompt

7. You → Developer:
   [Execute debugging steps, fix issue]
```

### Scenario: Choosing Technologies

```
1. You → Highest Self:
   "What testing frameworks have worked well in my previous projects?"

2. Highest Self analyzes cross-project patterns

3. You → Peer:
   "Let's try the top two recommendations in peer."

4. Peer evaluates both options

5. You → Mentor:
   "Given Peer's evaluation and project needs, which should we use?"

6. Mentor makes strategic recommendation

7. You → Developer:
   "Set up [chosen framework] following Mentor's guidance."
```

---

## Tips for Effective Coordination

1. **Use conversation continuity (`-c`) for advisory Minds** (Highest Self, Mentor, Peer)
2. **Keep advisory Minds in plan mode** (`--plan`)
3. **Let each Mind focus on its strength** (don't force Developer to strategize)
4. **Pass information between Minds** (Peer findings → Mentor → Developer)
5. **Trust the context separation** (Mentor shouldn't edit project files)
6. **Maintain clear boundaries** (experiments in Peer, execution in Developer)
7. **Document decisions in appropriate locations** (strategy in Peer/Mentor, implementation in Developer)

---

**Next Steps:**
- [Mentor→Developer Workflow](mentor-developer-workflow.md) - Deep dive on most powerful pattern
- [Troubleshooting](troubleshooting.md) - Common issues and solutions
- [Why This Works](why-this-works.md) - Cognitive science explanation
