#!/usr/bin/env bash
# Builds the ZIP for the OpenAI plugin directory (ChatGPT + Codex).
#
# The repo's .mcp.json keeps "type": "http" because Claude Code drops a
# remote server without it. OpenAI's Codex example omits "type", so the ZIP
# gets that exact shape. Everything else ships as-is.
#
# Usage: scripts/build-openai-zip.sh [out.zip]
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
version="$(node -p "require('$root/.codex-plugin/plugin.json').version")"
out="${1:-$root/dist/rams-openai-plugin-$version.zip}"
case "$out" in /*) ;; *) out="$PWD/$out" ;; esac

stage="$(mktemp -d "${TMPDIR:-/tmp}/rams-zip.XXXXXX")"
trap 'rm -rf "$stage"' EXIT
pkg="$stage/rams"
mkdir -p "$pkg"

# The Codex-format package only: manifest, MCP config, skills, assets, license.
# Claude Code files (.claude-plugin, commands), the local Codex marketplace
# (.agents), git, CI and this script stay out.
(cd "$root" && tar cf - --exclude .DS_Store \
  .codex-plugin .mcp.json skills assets LICENSE) | (cd "$pkg" && tar xf -)

node -e '
  const fs = require("fs");
  const f = process.argv[1];
  const cfg = JSON.parse(fs.readFileSync(f, "utf8"));
  for (const s of Object.values(cfg.mcpServers)) delete s.type;
  fs.writeFileSync(f, JSON.stringify(cfg, null, 2) + "\n");
' "$pkg/.mcp.json"

# Every ./ path the manifest references must exist in the package.
node -e '
  const fs = require("fs"), path = require("path");
  const dir = process.argv[1];
  const m = JSON.parse(fs.readFileSync(path.join(dir, ".codex-plugin/plugin.json"), "utf8"));
  const refs = [];
  (function walk(v) {
    if (typeof v === "string" && v.startsWith("./")) refs.push(v);
    else if (v && typeof v === "object") Object.values(v).forEach(walk);
  })(m);
  const missing = refs.filter((r) => !fs.existsSync(path.join(dir, r)));
  if (missing.length) { console.error("missing:", missing.join(", ")); process.exit(1); }
' "$pkg"

mkdir -p "$(dirname "$out")"
rm -f "$out"
(cd "$pkg" && zip -qr -X "$out" .)
echo "$out"
