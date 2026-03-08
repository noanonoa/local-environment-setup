Draft a GitLab merge request for the current branch.

$ARGUMENTS - optional: target branch (defaults to main/master)

## Step 1: Gather context

Run these commands to understand the changes:
- `git status` - see current state
- `git log origin/main..HEAD --oneline` (or master) - see commits on this branch
- `git diff origin/main..HEAD` - see all changes

Also check what files changed to detect UI files (for screenshot reminder).

## Step 2: Ask for title

Ask me what the MR title should be. Wait for my response before continuing.

## Step 3: Generate MR description

Based on commit and diff analysis, generate this structure:

### Summary
2-3 sentences explaining what this MR does and why.

If UI files detected (.tsx, .jsx, .vue, .css, .scss, .dart widget/screen files), add screenshot section directly after the summary:

```markdown
## Screenshots/Recordings

> ⚠️ UI changes detected. Add screenshots or recordings before finalizing.

<details>
<summary>Expand for details.</summary>

| Description | Before              | After               |
|-------------|---------------------|---------------------|
|             | <!-- screenshot --> | <!-- screenshot --> |

</details>
```

If no UI files, omit the screenshots section entirely.

### Changes
- Bullet list of specific changes (from diff analysis)

### Breaking Changes
If detected (API changes, schema changes, removed exports), list them.
If none detected, omit this section entirely.

### Checklist
- [ ] Tests pass locally
- [ ] Code is linted/formatted
- [ ] I've self-reviewed my changes
- [ ] Documentation updated (if needed)

### How to Test
Generate test steps based on the changes. Be specific.
If changes are too complex to confidently generate steps, write:
> TODO: Add testing steps

## Step 4: Create draft MR

Use `glab mr create` with:
- `--draft` flag
- `--title` from Step 2
- `--description` from Step 3

Show me the MR URL when done.
