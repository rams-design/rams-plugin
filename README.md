# Rams — Design Review for Claude Code

Accessibility (WCAG 2.1) and visual design review for UI code, with concrete
fixes. Made by [rams.ai](https://www.rams.ai/?utm_source=skill&utm_medium=github-readme).

## Install

As a Claude Code plugin (community marketplace):

```bash
claude plugin marketplace add anthropics/claude-plugins-community
claude plugin install rams@claude-community
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

This plugin runs locally as a heuristic review. The hosted engine at
[rams.ai](https://www.rams.ai/?utm_source=skill&utm_medium=github-readme)
reviews every pull request with 119 scored rules, verified re-reviews, and
one-click fix suggestions.

MIT licensed.
