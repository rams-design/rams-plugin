# Rams - Design Review for Claude Code

AI-powered accessibility and visual design reviews for your codebase.

## Installation

```bash
cd ~/.claude/commands
git clone https://github.com/rams-design/rams-plugin.git rams
```

Or copy directly:

```bash
curl -o ~/.claude/commands/rams.md https://raw.githubusercontent.com/rams-design/rams-plugin/main/rams.md
```

## Usage

```
/rams                    # Interactive - asks which file to review
/rams Button.tsx         # Review a specific file
/rams src/components/    # Review all components in a directory
```

## What it checks

### Accessibility (WCAG 2.1)
- Images missing alt text
- Icon-only buttons without aria-label
- Form inputs without labels
- Non-semantic click handlers (div onClick)
- Focus outline removed
- Heading hierarchy issues

### Visual Design
- Inconsistent spacing
- Typography issues
- Color contrast problems
- Missing component states

## Example Output

```
═══════════════════════════════════════════════════
RAMS DESIGN REVIEW: Button.tsx
═══════════════════════════════════════════════════

CRITICAL (2 issues)
───────────────────
[A11Y] Line 24: Button missing accessible name
  <button><CloseIcon /></button>
  Fix: Add aria-label="Close"
  WCAG: 4.1.2

═══════════════════════════════════════════════════
SUMMARY: 2 critical, 1 serious, 0 moderate
Score: 72/100
═══════════════════════════════════════════════════
```

## License

MIT

## More

https://rams.ai

