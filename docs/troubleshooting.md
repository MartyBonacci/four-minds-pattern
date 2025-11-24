# Troubleshooting the Four Minds Pattern

Common issues and solutions for using the Four Minds Pattern effectively.

---

## Table of Contents

1. [Setup Issues](#setup-issues)
2. [Context Problems](#context-problems)
3. [Coordination Challenges](#coordination-challenges)
4. [Performance Issues](#performance-issues)
5. [Workflow Confusion](#workflow-confusion)
6. [Tool-Specific Problems](#tool-specific-problems)

---

## Setup Issues

### Problem: Can't keep track of which terminal is which Mind

**Best Solution:** Use tmux with labeled panes

```bash
# Create named session
tmux new -s four-minds

# Split into 4 panes and label each:
# Top-left: Highest Self
# Top-right: Mentor
# Bottom-left: Peer
# Bottom-right: Developer

# Rename panes with: Ctrl+b , (then type name)
```

**Alternatives:** Custom terminal colors or PS1 prompts (see [Advanced Tips](advanced-tips.md))

---

### Problem: Forgot which directory to open each Mind in

**Solution:** Use this checklist every time

```bash
# Verify with pwd in each terminal:
Highest Self: ~/
Mentor: ~/code-projects/my-app-mentor/
Peer: ~/code-projects/my-app-mentor/my-app-peer/
Developer: ~/code-projects/my-app-mentor/my-app/
```

**Prevention:** Create startup script or use `4minds` launcher (when available)

---

### Problem: Peer directory doesn't exist

**Solution:** Create it before launching Peer

```bash
cd ~/code-projects/my-app-mentor/
mkdir my-app-peer
```

---

## Context Problems

### Problem: Mentor can't see project files

**Diagnosis:** Mentor opened in wrong directory

**Solution:** Verify Mentor can see both subdirectories

```bash
# In Mentor terminal:
pwd  # Should show: ~/code-projects/my-app-mentor/
ls   # Should show: my-app/ and my-app-peer/
```

If not, close Claude Code and reopen from correct directory.

---

### Problem: Developer context getting too large

**Best Solution:** Start fresh session without `-c` flag

```bash
# Close current Developer
# Reopen without history:
cd ~/code-projects/my-app-mentor/my-app/
claude-code
```

**Prevention:** Don't use `-c` for Developer, keep project clean with `.claudeignore`

---

### Problem: Lost conversation context in Mentor/Peer

**Cause:** Forgot `-c` flag

**Solution:** Always use `-c` for advisory Minds

```bash
# Correct:
Highest Self: claude-code -c --plan
Mentor: claude-code -c --plan
Peer: claude-code -c --plan

# Developer: claude-code (optional -c)
```

**Can't fix retroactively** - remember for next session

---

## Coordination Challenges

### Problem: Mentor trying to edit project files

**Solution:** Keep Mentor in `--plan` mode and establish this rule early

```
You → Mentor (first session):
"Important: Never edit files in my-app/ directly. Always craft prompts
for Developer instead. I'll copy them to Developer for execution."
```

If Mentor suggests a change, ask for a prompt instead.

---

### Problem: Not sure when to use which Mind

**Solution:** Use this decision flow

```
1. "Is this strategic or tactical?"
   → Strategic: Mentor or Highest Self
   → Tactical: Developer

2. "Am I ready to commit to this approach?"
   → No: Peer (experiment first)
   → Yes: Developer (implement)

3. "Is this about Claude Code itself?"
   → Yes: Highest Self
   → No: Other Minds
```

See [Workflow Guide](workflow-guide.md) for detailed decision matrix.

---

### Problem: Prompts from Mentor not working in Developer

**Solution:** Make Mentor more specific

```
You → Mentor:
"Make the prompt very specific with exact file paths and references
to existing code patterns Developer can see."
```

Test the prompt. If Developer is confused, go back to Mentor with Developer's questions.

---

## Performance Issues

### Problem: All instances running slow

**Best Solution:** Don't run all four simultaneously

**Typical workflow:**
- Open Mentor and Developer (always)
- Open Peer only when experimenting
- Open Highest Self only for meta-work

Close unused instances with Ctrl+C

---

### Problem: Responses getting truncated

**Solution:** Focus requests and start fresh if needed

```
# Instead of: "Review all the code"
# Say: "Review src/components/Auth/ only"

# Or start fresh session:
claude-code  # (without -c)
```

---

## Workflow Confusion

### Problem: Forgetting to copy prompts between Minds

**Solution:** Establish clipboard habit

**Workflow:**
1. Mentor provides prompt between markers:
   ```
   [PROMPT START]
   Implement authentication...
   [PROMPT END]
   ```
2. Select and copy
3. Paste into Developer
4. Copy Developer's response
5. Paste back to Mentor (for multi-step)

**Tool:** Use clipboard manager (Parcellite, CopyQ) for history

---

### Problem: Mixing strategic and tactical thinking

**Solution:** Remember role boundaries

```
Strategic (SHOULD I?):
- "Should I use this library?"       → Mentor
- "What architecture is best?"       → Mentor

Experimental (WHAT IF?):
- "What if we tried this?"           → Peer
- "Let's test this approach"         → Peer

Tactical (HOW DO I?):
- "Implement login form"             → Developer
- "Fix this bug"                     → Developer

Meta (HOW DO I USE CLAUDE CODE?):
- "How do I create a plugin?"        → Highest Self
```

---

## Tool-Specific Problems

### Problem: Claude Code specific flag issues

**Solution:** Verify flag syntax

```bash
# Correct:
claude-code -c --plan

# Also correct:
claude-code --continue --plan

# Wrong:
claude-code -c -plan  # (single dash)
```

Check version: `claude-code --version`

---

### Problem: Using with tools other than Claude Code

**Solution:** Adapt to tool capabilities

**Core principle remains:**
- Different directory levels = different contexts
- Strategic vs tactical separation
- Experimentation vs implementation separation

Flags may differ, but the pattern works with any tool supporting:
- Multiple instances
- Directory-based context
- Terminal access

---

## Prevention Checklist

### Before Starting a Session

```
[ ] Created peer directory (if not exists)
[ ] Labeled terminals clearly
[ ] Using correct flags:
    [ ] Highest Self: -c --plan
    [ ] Mentor: -c --plan
    [ ] Peer: -c --plan
    [ ] Developer: (none or -c)
[ ] Verified each Mind in correct directory (pwd)
[ ] Established role boundaries in first prompt
```

### During Development

```
[ ] Using clipboard workflow for Mentor→Developer
[ ] Copying results back for multi-step tasks
[ ] Keeping Peer separate from project files
[ ] Not letting Mentor edit project files
[ ] Using decision matrix to choose correct Mind
```

---

## Success Indicators

**You're using Four Minds effectively when:**

✅ Clear which Mind to use for each task
✅ Smooth Mentor→Developer workflow
✅ Peer experiments don't pollute project
✅ Context stays manageable
✅ Less rework, better first-time implementations

**Still optimizing if:**

⚠️ Frequently using wrong Mind
⚠️ Mentor and Developer contexts conflicting
⚠️ Unclear when to open which Mind
⚠️ Forgetting to copy prompts

---

## Getting Additional Help

**For advanced scenarios and alternative solutions:**
- See [Advanced Tips](advanced-tips.md) for edge cases
- Check [Workflow Guide](workflow-guide.md) for detailed workflows
- Review [Mentor→Developer Workflow](mentor-developer-workflow.md) for prompt crafting

**The pattern takes practice.** Start simple, add complexity as you get comfortable.

---

**Remember:** Four Minds is a cognitive tool. Adapt it to your thinking style. There's no single "right way"—find what works for you.
