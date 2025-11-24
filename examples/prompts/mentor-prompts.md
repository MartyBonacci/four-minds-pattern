# Example Mentor Prompts

Collection of effective prompts to use with the Mentor Mind.

---

## Crafting Implementation Prompts

### Basic Template

```
Given the available tools, commands, skills, agents and other helpful
resources and the current state of [project-directory], please help me
make a prompt or series of prompts to give the Claude Code instance
currently open in [project-directory-path] to prompt it to make
[feature-description].
```

### Example 1: New Feature

```
Given the available tools, commands, skills, agents and other helpful
resources and the current state of my-ecommerce-app/, please help me
make a prompt to give the Claude Code instance currently open in
~/code-projects/my-ecommerce-app/ to implement a shopping cart feature
with add/remove items, quantity adjustment, and persistent storage.
```

### Example 2: Bug Fix

```
Given the current state of my-app-mentor/my-app/, please help me craft a
debugging prompt for the Developer instance. The issue: user authentication
tokens are expiring too quickly. Need to investigate the JWT configuration
and adjust the expiration time.
```

### Example 3: Refactoring

```
Looking at my-dashboard/ project structure, help me craft a prompt for
Developer to refactor the monolithic Dashboard component into smaller,
reusable components following our established patterns.
```

---

## Architectural Planning

### Choosing Technologies

```
I'm starting a new feature that requires [functionality]. Please review
my project structure and existing dependencies, then recommend the best
approach. Consider:
1. Consistency with existing patterns
2. Bundle size impact
3. Team familiarity
4. Long-term maintainability
```

### Design Pattern Selection

```
I need to implement [feature] in my-app-mentor/my-app/. Please review similar
patterns in my existing code and recommend which design pattern to use. Explain
the trade-offs and provide a structured implementation plan.
```

---

## Coordinating with Peer

### Evaluating Experiments

```
I've been experimenting with [approaches] in peer/. Please review
both the peer experiments and the project requirements, then:
1. Compare the approaches
2. Recommend which to implement
3. Identify risks or gaps
4. Craft an implementation prompt for Developer
```

### Validating Approach

```
Before I commit to [technical decision], please review:
1. The experimental code in peer/
2. The current project architecture
3. The long-term implications

Then advise whether to proceed and how to integrate it.
```

---

## Multi-Step Feature Development

### Series of Prompts Request

```
Please create a series of prompts for Developer to implement [complex-feature].
Break it down into logical steps, with each prompt building on the previous
one. I'll paste Developer's results back to you after each step so you can
adjust the next prompt based on actual progress.
```

### Iterative Development

```
Developer just completed [step-1] with these results:
[paste Developer output]

Based on this, what should the next prompt be? Please account for any
issues or deviations from the original plan.
```

---

## Code Review Coordination

### Strategic Review

```
Developer has implemented [feature]. Please review it strategically:
1. Does it align with our architecture?
2. Does it follow our existing patterns?
3. Are there missing aspects (error handling, tests, docs)?
4. Should anything be refactored before moving forward?

Don't review syntax (Developer handles that). Focus on strategic alignment.
```

### Pattern Consistency

```
Review the recent changes in [directory] and identify any deviations
from our established patterns. If you find inconsistencies, craft
prompts for Developer to align the code with our standards.
```

---

## Prompt Refinement

### Making Prompts More Specific

```
I'm planning to ask Developer to [vague-goal]. Help me craft a more
specific prompt that:
1. References exact file paths in the project
2. Identifies existing patterns to follow
3. Specifies error handling and testing requirements
4. Provides clear acceptance criteria
```

### Adding Context

```
Before I ask Developer to implement [feature], what context should I
include in the prompt? Review the project and tell me what existing
patterns, utilities, and conventions Developer should reference.
```

---

## Problem Solving

### Debugging Strategy

```
We're experiencing [problem]. Please craft a systematic debugging
prompt for Developer that:
1. Identifies potential causes
2. Outlines investigation steps
3. References relevant code sections
4. Includes diagnostic logging or testing
```

### Alternative Approaches

```
Developer tried [approach] but encountered [issue]. Please:
1. Review what was tried
2. Analyze why it didn't work
3. Suggest alternative approaches
4. Craft a new prompt for a different strategy
```

---

## Meta-Workflow Optimization

### Improving Prompting

```
I've been using you to craft prompts for Developer. Please review our
recent conversation and suggest how I can:
1. Ask better questions to you
2. Provide more useful context
3. Structure requests more effectively
4. Improve the overall Mentor→Developer workflow
```

### Workflow Assessment

```
Based on our work together on [project], what patterns do you notice in:
1. What types of features I build
2. What I struggle with
3. What I do well
4. How I could optimize my Four Minds usage
```

---

## Integration Planning

### Connecting Peer and Project

```
In peer/, I've explored [feature] with these findings:
[summary of explorations]

Please review both peer and project, then create an integration
plan that adapts the peer approach to fit the project's architecture.
Craft the first implementation prompt for Developer.
```

---

## Best Practices for Mentor Prompts

### Do:
- ✅ Reference specific project directories
- ✅ Mention that Mentor should review project structure
- ✅ Ask for both analysis AND actionable prompts
- ✅ Provide context about project goals
- ✅ Request consideration of existing patterns
- ✅ Ask for step-by-step breakdowns for complex features

### Don't:
- ❌ Ask Mentor to implement directly (that's Developer's job)
- ❌ Provide vague feature descriptions
- ❌ Skip mentioning the project directory name
- ❌ Forget to paste Developer results back for multi-step workflows
- ❌ Ask for code without strategic context

---

## Template Prompts by Scenario

### 1. "I want to build X"
```
Given the available tools and current state of [project], help me
craft a prompt for Developer to implement [feature]. Consider our
existing architecture and patterns.
```

### 2. "Something is broken"
```
There's an issue with [component]: [description]. Please craft a
debugging and fix prompt for Developer that addresses this systematically.
```

### 3. "I need to decide between options"
```
I'm considering [option A] vs [option B] for [purpose]. Please:
1. Review the project context
2. Analyze trade-offs
3. Recommend an approach
4. Craft implementation prompt if proceeding
```

### 4. "Complex feature needs planning"
```
I need to implement [complex feature]. Please break this into a series
of prompts for Developer, each building on the previous. I'll provide
feedback after each step.
```

### 5. "Code review needed"
```
Developer implemented [feature]. Please review strategically for:
- Architecture alignment
- Pattern consistency
- Missing aspects
Then provide refinement prompts if needed.
```

---

## Advanced Patterns

### Priming Mentor with Context

```
Before I ask for implementation prompts, please review:
1. The project architecture in [directory]
2. Our testing patterns in [tests directory]
3. The experimental approach in peer/[experiment]

Let me know when you have context, then I'll describe the feature.
```

### Cross-Project Learning

```
I'm implementing [feature] in [current-project]. I've built similar
features in other projects. Please:
1. Request access to view relevant past projects if needed
2. Identify successful patterns from my history
3. Adapt those patterns to current project
4. Craft implementation prompt incorporating lessons learned
```

### Workflow Orchestration

```
I need to coordinate work across Developer and Peer for [feature]:
1. What should Peer experiment with first?
2. What should I tell you after Peer's results?
3. How should we structure the Developer prompts?
4. What's the overall workflow sequence?
```

---

Remember: Mentor is your strategic partner. The better context you provide,
the better prompts Mentor can craft for Developer.
