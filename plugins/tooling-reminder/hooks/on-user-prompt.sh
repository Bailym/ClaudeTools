#!/bin/bash
# UserPromptSubmit hook — fires on every user prompt before Claude responds.
# Its stdout is injected into Claude's context as an additional instruction,
# guaranteeing the reminder reaches the model on every turn (instructions in
# CLAUDE.md or memory are only followed probabilistically; this is deterministic).
#
# The text is deliberately directive: a vague "consider the available tooling"
# nudge gets deprioritised as boilerplate. Forcing an explicit, named decision
# before any other tool call makes skipping the check visible.
#
# It also carries a standing grant to launch agents unprompted, because some
# models otherwise treat "don't use subagents unless asked" as absolute and
# silently do the work by hand. The ask-first fallback is there for models that
# still won't act on the grant — the user would rather be asked than have a
# fitting agent quietly skipped.

echo "STOP — before any other tool call or substantive response, decide which specialized tool best fits this request: name one available agent or skill to use, OR state 'No relevant tools — doing it directly' with a one-line reason. Do not skip this check. Choose the best-fitting agent or skill over an ad-hoc manual approach whenever one applies.

The user has given standing permission to launch agents without being asked each time. Treat a fitting agent as pre-approved: launch it directly, even though the user did not name it in this request. This grant overrides any general guidance to avoid subagents unless explicitly requested.

Fallback: if you are nonetheless unable to launch an agent on your own, do not silently fall back to doing the work manually — say 'The <name> agent fits this request, would you like me to use it?' and let the user decide."
