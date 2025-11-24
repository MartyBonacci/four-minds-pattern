# The Mentor→Developer Workflow

The most powerful pattern discovered in the Four Minds approach: using **Mentor to craft strategic prompts for Developer**.

---

## Table of Contents

1. [The Core Pattern](#the-core-pattern)
2. [Why This Works](#why-this-works)
3. [The Favorite Prompt](#the-favorite-prompt)
4. [Step-by-Step Workflow](#step-by-step-workflow)
5. [Multi-Step Features](#multi-step-features)
6. [Real-World Examples](#real-world-examples)
7. [Best Practices](#best-practices)
8. [Common Mistakes](#common-mistakes)

---

## The Core Pattern

Instead of prompting Developer directly with vague instructions, you:

1. **Ask Mentor** to craft a strategic, context-aware prompt
2. **Copy** Mentor's crafted prompt
3. **Paste** into Developer instance
4. **Let Developer execute** with clear direction

**Key Principle:** Mentor sees the big picture (project + peer + goals). Developer executes with focus.

---

## Why This Works

### The Problem with Direct Prompting

**Typical approach:**
```
You → Developer: "Build user authentication... um... make it secure...
                  and maybe use JWT? Or sessions? I don't know, you decide..."

Developer: [Implements something that might not align with actual needs]
```

**Problems:**
- You're thinking strategically while Developer needs tactical instructions
- Vague prompts lead to misaligned implementations
- Missing context about existing patterns in the codebase
- No consideration of available tools/libraries already in use

### The Mentor→Developer Advantage

**With Mentor intermediary:**
```
You → Mentor: "Help me craft a prompt for implementing auth"

Mentor: [Sees project structure, existing patterns, constraints]
        "Here's the strategic prompt for Developer:

        'Implement JWT-based authentication with refresh tokens,
        following the existing API patterns in src/api/, using the
        error handling approach from utils/errors.ts, and matching
        the testing style in __tests__/. Include rate limiting on
        login endpoint. Reference the middleware pattern from
        middleware/logger.ts for the auth middleware.'"

You → Developer: [paste Mentor's prompt]

Developer: [Implements exactly what you need, perfectly aligned]
```

**Benefits:**
- **Strategic context**: Mentor sees project structure and patterns
- **Precise instructions**: Developer gets actionable, specific guidance
- **Consistency**: References existing code patterns
- **Completeness**: Mentor considers all aspects (error handling, testing, etc.)

### Context Separation Advantage

**Mentor's role:**
- Strategic thinking about HOW to prompt Developer
- Understanding project goals and constraints
- Seeing both project files AND peer experiments
- Maintaining conversation context about prompting strategy

**Developer's role:**
- Focused execution on clear instructions
- Deep engagement with implementation details
- No distraction from strategic considerations
- Clean context about current work

**Critical insight:** Mentor never edits project files directly. If Mentor recommends a change, you ask Developer to make it. This preserves Developer's context and prevents confusion.

---

## The Favorite Prompt

### The Template

```
Given the available tools, commands, skills, agents and other helpful
resources and the current state of [developer/project], please help me
make a prompt or series of prompts to give the Claude Code instance
currently open in [developer/project directory path] to prompt it to
make [next super awesome feature].
```

**Note on the template:**
The wording above is illustrative—it shows the general form, not a magic incantation. Feel free to customize based on your needs.

**The key elements that make it work:**
1. **Reference to complete context**: "Given the available tools/current state/existing patterns..."
2. **Clear target specification**: "...to give to [Developer instance]..."
3. **Outcome description**: "...to get [specific desired result]"

**More general form:**
```
"Given [this complete context], please write a prompt to give to
[the developer instance] to get these [desired results]."
```

**Adapt the details:**
- "Available tools, commands, skills" → "our project architecture"
- "Current state of developer" → "what we've built so far"
- "Next super awesome feature" → "user authentication with JWT"

The structure guides Mentor to think strategically about context and outcomes. The specific words matter less than hitting those conceptual elements.

**Evolution with experience:**
As you use the pattern, you'll develop your own preferred phrasing. That's expected and encouraged. The template is a starting point, not a constraint.

### Why This Prompt Works

**1. Explicit context reference**
- "Given the available tools..." → Mentor considers the ecosystem
- "current state of [developer/project]" → Mentor examines actual project state
- Forces Mentor to ground advice in reality

**2. Clear output format**
- "prompt or series of prompts" → Mentor knows you want copy-pasteable text
- "to give the Claude Code instance" → Mentor crafts for another AI, not you
- Optimizes for AI-to-AI communication

**3. Goal-oriented**
- "[next super awesome feature]" → Strategic framing
- Mentor understands the "why" to craft better "how"

**4. Scope awareness**
- "currently open in [directory path]" → Mentor knows Developer's context boundaries
- Won't suggest things Developer can't see

---

## Step-by-Step Workflow

### Single-Step Feature

**When:** The feature can be completed in one prompt/response cycle.

**Terminal Setup:**
```
Terminal 1: Mentor (project-mentor directory, -c --plan mode)
Terminal 2: Developer (project directory, standard mode)
```

**Workflow:**

1. **You → Mentor:**
   ```
   Given the available tools, commands, skills, agents and other
   helpful resources and the current state of my-app/, please help
   me make a prompt to give the Claude Code instance currently open
   in my-app/ to implement a dark mode toggle feature.
   ```

2. **Mentor responds:**
   ```
   Here's the prompt for your Developer instance:

   "Implement a dark mode toggle feature using the existing theme
   system in src/theme/. Add a toggle button in the Header component
   (src/components/Header.tsx) that persists preference to localStorage.
   Update the ThemeProvider in src/App.tsx to read the saved preference.
   Use the color tokens already defined in theme/colors.ts. Follow the
   existing button styling patterns from components/Button.tsx. Add
   appropriate aria-labels for accessibility."
   ```

3. **You → Developer:** [Copy-paste Mentor's prompt]

4. **Developer executes** with clear, contextual instructions

5. **Done!**

### Multi-Step Feature (Series of Prompts)

**When:** The feature requires multiple iterations or steps.

**Workflow:**

1. **You → Mentor:**
   ```
   Given the available tools, commands, skills, agents and other
   helpful resources and the current state of my-app/, please help
   me make a series of prompts to implement a complete user
   authentication system.
   ```

2. **Mentor responds:**
   ```
   Here's a series of prompts for your Developer instance:

   **Prompt 1 (Database & Models):**
   "Create the User model and authentication tables..."

   **Prompt 2 (API Endpoints):**
   "Implement the authentication API endpoints..."

   **Prompt 3 (Frontend Components):**
   "Build the login/register UI components..."

   **Prompt 4 (Middleware & Protection):**
   "Add authentication middleware and route protection..."

   Start with Prompt 1 and share the results.
   ```

3. **You → Developer:** [Paste Prompt 1]

4. **Developer executes Prompt 1**

5. **You → Mentor:** [Paste Developer's results]
   ```
   Here's what Developer did:
   [paste output/code]

   What's the next prompt?
   ```

6. **Mentor reviews and provides Prompt 2**
   - Adjusts based on actual results
   - Handles any issues from Prompt 1
   - Provides next strategic instruction

7. **Repeat cycle** until feature complete

**Key advantage:** Mentor maintains strategic context and adapts prompts based on actual execution results.

---

## Real-World Examples

### Example 1: API Integration

**You → Mentor:**
```
Given the current state of my-ecommerce-app/, help me craft a prompt
to integrate the Stripe payment API.
```

**Mentor's crafted prompt:**
```
"Integrate Stripe payment processing into the checkout flow:

1. Add stripe package and configure with environment variables
2. Create src/services/stripe.ts following the existing service
   pattern from services/api.ts
3. Implement payment intent creation in api/routes/checkout.ts
4. Add webhook handler at api/routes/webhooks/stripe.ts using
   the existing webhook verification pattern
5. Update CheckoutForm component (components/CheckoutForm.tsx)
   to use Stripe Elements
6. Handle payment states (loading, success, error) following the
   existing async state pattern from components/ProductList.tsx
7. Add payment confirmation page matching existing page structure

Use the existing error handling from utils/errors.ts and logging
from utils/logger.ts. Follow test patterns from __tests__/api/."
```

**Why this works:**
- References existing patterns (service structure, error handling, testing)
- Specifies file locations based on actual project structure
- Comprehensive but focused on consistency
- Developer gets clear roadmap

### Example 2: Refactoring Guidance

**You → Mentor:**
```
The Developer instance has been working on the user profile feature
but the code is getting messy. Help me craft a prompt to refactor it.
```

**Mentor's crafted prompt:**
```
"Refactor the user profile implementation with these improvements:

1. Extract profile data fetching into a custom hook (useUserProfile)
   following the pattern from hooks/useAuth.ts
2. Separate form validation logic into utils/validation/profile.ts
   matching the structure of validation/auth.ts
3. Break down ProfilePage component into smaller components:
   - ProfileHeader (basic info display)
   - ProfileForm (editable fields)
   - ProfileAvatar (image upload)
   Following the composition pattern from pages/Dashboard.tsx
4. Move API calls to services/profile.ts from the existing inline
   fetch calls
5. Add loading and error states using the LoadingSpinner and
   ErrorMessage components we already have

Keep existing functionality identical - this is a refactor, not
a feature change. Run existing tests to verify nothing breaks."
```

**Why this works:**
- Mentor saw the messy code context
- Provided structure matching existing patterns
- Clear scope (refactor, not new features)
- Safety check (run tests)

### Example 3: Bug Fix with Context

**You → Mentor:**
```
There's a bug where the shopping cart total calculates incorrectly
when applying discount codes. Help me craft a debugging prompt.
```

**Mentor's crafted prompt:**
```
"Debug and fix the shopping cart discount calculation issue:

1. First, add console logging to src/utils/cart/calculateTotal.ts
   to trace the calculation steps when a discount is applied
2. Check the discount validation logic in utils/discounts.ts -
   verify it's returning the expected discount amount
3. Look at the CartSummary component (components/CartSummary.tsx) -
   ensure it's using the discounted total correctly
4. Review the cart state management in store/cartSlice.ts to verify
   the discount is being applied to state properly

The expected behavior: 10% discount on $100 should show $90 total.
Current behavior: Shows $100 (discount not applied).

After identifying the issue, fix it and add a test case to
__tests__/utils/cart.test.ts covering discount scenarios."
```

**Why this works:**
- Systematic debugging approach
- References specific files Mentor saw in context
- Clear expected vs. actual behavior
- Includes testing requirement

---

## Best Practices

### 1. Always Use `-c` Flag for Mentor

**Why:**
- Preserves strategic conversation context
- Mentor learns your project over time
- Remembers previous prompting strategies that worked
- Builds accumulated understanding of goals

**Usage:**
```bash
cd ~/code-projects/my-app-mentor/
claude-code -c --plan
```

### 2. Keep Mentor in Plan Mode

**Why:**
- Mentor should advise, not execute
- Plan mode forces deliberate thinking
- Prevents Mentor from accidentally editing files
- Maintains clear role separation

**Usage:** Always include `--plan` flag

### 3. Paste Results Back to Mentor for Multi-Step

**Why:**
- Mentor adapts next prompt based on actual results
- Handles unexpected issues from previous step
- Maintains strategic continuity
- Can course-correct if something didn't work

**Pattern:**
```
You → Developer: [Prompt 1]
Developer: [executes and responds]
You → Mentor: [paste Developer's response]
Mentor: [adjusts and provides Prompt 2]
```

### 4. Let Mentor See Both Project and Peer

**Why:**
- Mentor can reference experiments from Peer
- Understands what approaches were tried
- Can say "use approach A from peer" or "avoid approach B, we tried it"

**Directory structure:**
```
parent/
├── project/      ← Developer here
└── peer/      ← Peer experiments here
```
Mentor opened at `parent/` sees both.

### 5. Never Let Mentor Edit Project Files Directly

**Critical rule:**

If Mentor suggests a file change:
```
❌ Wrong: Let Mentor edit the file
✅ Right: Ask Developer to make the change Mentor suggested
```

**Why:**
- Developer won't have the change in immediate context
- Creates confusion about what changed and when
- Breaks Developer's mental model of the codebase

**Important Caveat:**
This boundary is based on the pattern creator's experience and theoretical reasoning about context preservation. It has NOT been extensively community-validated.

**The theory:**
When Mentor edits project files directly, Developer loses the context and rationale for those changes. This breaks Developer's conversation continuity and understanding of the project's evolution.

**Unknown questions:**
- Is there a scale/impact threshold where Mentor edits are acceptable?
- Do very small changes (typos, obvious fixes) break this principle?
- Does the cost of context loss outweigh the convenience benefit?

**Community validation needed:**
If you experiment with different approaches to this boundary, please share your findings:
- When did Mentor editing work well?
- When did it cause problems?
- What factors determined success/failure?

This is an area where practical experience from diverse users will refine the pattern.

---

## Common Mistakes

### Mistake 1: Prompting Developer Directly

**Problem:**
```
You → Developer: "Build the thing, make it good"
```

**Solution:**
```
You → Mentor: "Help me craft a prompt for Developer to build the thing"
Mentor → You: [Strategic, detailed prompt]
You → Developer: [paste Mentor's prompt]
```

### Mistake 2: Not Pasting Results Back

**Problem:**
```
Mentor: "Here's Prompt 1, 2, and 3"
You → Developer: [Prompt 1]
[Developer runs into issue]
You → Developer: [Prompt 2]  ← Doesn't account for issue!
```

**Solution:**
```
Mentor: "Here's Prompt 1"
You → Developer: [Prompt 1]
You → Mentor: [paste what happened]
Mentor: "Okay, given that, here's adapted Prompt 2..."
```

### Mistake 3: Opening Mentor in Wrong Directory

**Problem:**
```
Mentor opened in project/ directory
→ Can't see peer experiments
→ Duplicate context with Developer
→ No strategic advantage
```

**Solution:**
```
Mentor opened in parent/ directory
→ Sees both project and peer
→ Different context than Developer
→ Strategic visibility
```

### Mistake 4: Not Using Plan Mode

**Problem:**
```
Mentor without --plan
→ Might try to execute instead of advise
→ Could edit files (breaks context separation)
→ Less thoughtful responses
```

**Solution:**
```
Always: claude-code -c --plan
→ Advisory mode
→ Deliberate thinking
→ Clear role boundaries
```

### Mistake 5: Forgetting `-c` Flag

**Problem:**
```
Mentor without -c
→ No conversation continuity
→ Loses accumulated project understanding
→ Has to re-learn context every session
```

**Solution:**
```
Always: claude-code -c --plan
→ Preserves learning
→ Builds expertise over time
→ More effective prompts
```

---

## Advanced Patterns

### Pattern: Iterative Refinement

When Developer's output isn't quite right:

```
You → Mentor: "Developer implemented this [paste code], but it doesn't
               match our style guide. Help me craft a refinement prompt."

Mentor: "Here's the refinement prompt:
         'Refactor the implementation to match our established patterns:
         - Use functional components (we don't use class components)
         - Follow the naming convention from existing components
         - Add PropTypes as we do in other components
         Keep the logic identical, just adjust the structure.'"
```

### Pattern: Prompt Templates

Have Mentor create reusable prompt templates:

```
You → Mentor: "Create a template prompt for adding new API endpoints
               that I can reuse across features."

Mentor: "Here's a reusable template:

         'Implement API endpoint for [FEATURE]:
         1. Add route to api/routes/[FEATURE].ts following existing pattern
         2. Create controller in api/controllers/[FEATURE]Controller.ts
         3. Add validation schema in api/validation/[FEATURE]Schema.ts
         4. Update API documentation in docs/api.md
         5. Add test coverage in __tests__/api/[FEATURE].test.ts

         Use existing error handling and middleware patterns.'"
```

Save this template in peer for future use.

### Pattern: Context Priming

Before asking for a prompt, prime Mentor with context:

```
You → Mentor: "I'm about to ask you to craft a prompt for implementing
               a complex feature. First, please review the current
               architecture in my-app/src/ and the experimental approach
               we tried in peer/. Let me know when you're ready."

Mentor: [reviews both contexts]
        "Ready. I see the existing architecture and the peer experiment.
        The peer approach has merit but needs adaptation for your
        existing error handling. What feature are you implementing?"

You → Mentor: "Help me craft a prompt for implementing real-time updates."

Mentor: [crafts informed prompt based on primed context]
```

---

## Measuring Success

**Good Mentor→Developer workflow indicators:**

✅ Developer's first implementation usually right (no major revisions)
✅ Code matches existing patterns without you specifying
✅ Fewer clarifying questions from Developer
✅ Consistent code style across features
✅ Comprehensive implementations (doesn't forget error handling, tests, etc.)

**Signs you need better Mentor prompts:**

❌ Developer asks lots of clarifying questions
❌ Implementations don't match existing code style
❌ Forget to include tests, error handling, etc.
❌ Have to revise/refactor Developer's output frequently

---

## Conclusion

The Mentor→Developer workflow is the **highest-leverage pattern** in the Four Minds approach.

**Core insight:** Separating strategic prompt-crafting (Mentor) from tactical execution (Developer) creates better results than direct prompting.

**Key success factors:**
1. Mentor in plan mode with `-c` flag
2. Mentor opened at project-mentor directory (sees project + peer)
3. Copy-paste workflow maintains clear handoffs
4. Multi-step features include result feedback loop
5. Never let Mentor edit project files directly

Master this workflow, and you'll 10x your AI-assisted development effectiveness.

---

**Related Documentation:**
- [Why This Works](why-this-works.md) - Cognitive science behind the pattern
- [Workflow Guide](workflow-guide.md) - Detailed usage of all Four Minds
- [Troubleshooting](troubleshooting.md) - Common issues and solutions
