---
name: get-started
description: First run with Rams. Connect the Rams design reviewer, run a quick check on one UI file, then a full scored review, then confirm the fixes landed. Use when someone has just installed Rams or asks how to start.
---

# Get started with Rams

Rams reviews UI code (React, Vue, Svelte, CSS, SwiftUI) for visual design and
accessibility. It reads the files you send it and returns findings with
severity, category and file:line. It does not edit files, run code, open pull
requests or touch any repository. Applying a fix is always your step.

Walk the user through these four steps in order. Keep each step short and show
the real tool output.

## 1. Connect

The first Rams tool call asks the user to sign in at rams.ai with Google or
GitHub and approve access. There is no key to paste. If a tool call fails with
an authorization error, ask the user to connect Rams from the plugin settings
and try again.

## 2. Run a quick check

Ask for one UI file the user is working on, or a component they can paste.
Call `quick_review` with the file path and its full content. It answers in
about ten seconds with the top issues. It returns no score and no patch.

Show the issues as a short list: severity, what is wrong, and file:line.

## 3. Run a full review

When the user wants a score or ready-made fixes, call `review_files` once on
the same files. It returns a 0-100 score, a one-line summary, and issues with
fixes. Many issues include a unified diff in `patch` that applies with
`git apply`.

Show the score first, then the issues from most to least severe. Offer to
apply the patches. Only apply one after the user agrees.

## 4. Verify the fixes

After fixes are applied, call `verify_fixes` with the updated files and the
issues from step 3. It reports which issues are fixed and which are still
present.

## Usage

If the user asks how many reviews they have left, call `usage` and relay the
answer as written.

## Limits

- Rams judges UI code only. For backend code, configs or tests, say Rams has
  nothing to review there.
- Rams only sees the content sent in the call. It cannot read a repository on
  its own.
- Rams cannot deploy, merge, change billing or act on anyone's account.
