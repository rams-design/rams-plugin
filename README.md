# Rams — Design Review for Claude Code

A design review for UI code the way a senior designer would give one: craft
and visual quality first, accessibility built in (WCAG 2.2), with concrete
fixes. Made by [rams.ai](https://www.rams.ai/?utm_source=skill&utm_medium=github-readme).

## Install

As a Claude Code plugin (community marketplace):

```bash
claude plugin marketplace add anthropics/claude-plugins-community
claude plugin install rams@claude-community
```

Via the open skills ecosystem ([skills.sh](https://www.skills.sh/) — installs into 20+ agents):

```bash
npx skills add rams-design/rams-plugin
```

As a Codex plugin (this repo is its own marketplace):

```bash
codex plugin marketplace add rams-design/rams-plugin
codex plugin install rams@rams
```

Or the one-line installer (Claude Code, Cursor, Codex, Windsurf, Amp, OpenCode, Gemini CLI):

```bash
curl -fsSL https://rams.ai/install | bash
```

## Use

Ask for a review naturally ("review this component for design issues") or run
`/rams path/to/Component.tsx`. The review covers accessibility (alt text,
labels, keyboard access, focus, contrast, touch targets) and visual design
(spacing, typography, color, component states), each finding with a fix.

## The full engine

Without the hosted engine, this plugin runs locally as a heuristic review. The
hosted engine at [rams.ai](https://www.rams.ai/?utm_source=skill&utm_medium=github-readme)
reviews with the full scored rule set (live list at
[rams.ai/rules](https://www.rams.ai/rules)), verified re-reviews, and one-click
fix suggestions.

### Rams MCP (the hosted engine as a tool)

The plugin also bundles the [Rams MCP](https://www.rams.ai/mcp?utm_source=skill&utm_medium=github-readme),
the hosted engine as three tools:

- `quick_review`: the check to run while editing. Top issues with severity,
  category and file:line in about ten seconds.
- `review_files`: before committing. A 0-100 score and patches your agent can
  apply, the same judgment a pull request gets.
- `verify_fixes`: after applying fixes. Confirms they landed, and is free.

To connect it in Claude Code, run `/mcp`, pick `rams`, and approve access in
the browser. You sign in or create a free account as part of that step, and
there is no key to paste. The free plan includes 30 reviews to try it; a quick
check costs a fifth of a review on paid plans and half on the free plan.

Without it connected, the local skill still works as a checklist review.

MIT licensed.
