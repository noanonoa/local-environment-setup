Wrap up my working session with a summary for future me.

$ARGUMENTS - optional context (ticket number, feature name, focus area)

## Before generating the summary

**Run a thorough code review of all changes made this session.**

### Step 1: Build your review checklist from project context

READ the project's CLAUDE.md and any files in `.claude/rules/`. These define the standards you MUST check against. Common things to look for:
- Design system rules (tokens for spacing, colors, typography, radius)
- Code style conventions (naming, imports, file organization)
- Testing requirements
- Accessibility requirements

**Do not skip this step.** Your review checklist comes from here.

### Step 2: Get the list of changed files

Run `git status` to see modified and untracked files. If already committed, check all commits from this session. Review ALL files you created or modified.

### Step 3: Review each changed file against your checklist

For EACH file, actively check (don't just skim):

1. **Security & Secrets**
   - Hardcoded credentials, API keys, tokens
   - PII exposure (emails, names, IDs in logs/comments)
   - Injection vulnerabilities, unsafe inputs

2. **Correctness & Quality**
   - Comments that don't match the code
   - Documentation that's outdated or wrong
   - Dead code, unused imports, TODOs left behind
   - Code duplication that should be extracted

3. **Project-Specific Rules** (from Step 1 - THIS IS CRITICAL)
   - Check EVERY rule from CLAUDE.md/.claude/rules/ that applies to this file type
   - **Actually search the diff for violations** - don't eyeball it, grep/search for patterns
   - Design tokens: search for hardcoded numeric values in spacing, sizing, colors, typography

4. **Accessibility & Performance**
   - Missing semantic labels, touch targets, screen reader support
   - Unnecessary rebuilds, expensive operations, memory leaks

If any issues found, list them in the ⚠️ section below. If no issues found after searching, state what you searched for.

---

## Summary format

### ✅ Accomplished
- Bullet list of concrete wins (files, features, fixes, decisions)

### 🌟 Shoutouts
- Call out anything impressive, clever, or well-executed
- Celebrate growth, good instincts, and quality work
- Be genuine and specific - shower with compliments when deserved!

### 🎯 Key Takeaways
- What I learned or reinforced today
- Concepts, patterns, or skills worth remembering

### 🌱 Growth Opportunities
- Areas to improve or explore further
- Patterns worth practicing, concepts to deepen
- Honest, constructive, specific - help me level up

### ⚠️ Needs Attention
- Code review findings (security, accuracy, a11y, perf, patterns)
- Unresolved blockers or open questions
- Use 🔴 for urgent, 🟡 for important, 🟠 for minor

### 📍 Where I Left Off
- What was I working on when we stopped?
- Clear next step to pick up next session

---

## Style
- Concise, not verbose
- Tables when comparing or listing multiple items
- Emojis to signal urgency and celebrate wins
- No git commands or workflow reminders
