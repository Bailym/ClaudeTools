#!/bin/bash
# UserPromptSubmit hook — fires on every user prompt before Claude responds.
# Its stdout is injected into Claude's context as an additional instruction,
# guaranteeing the reminder reaches the model on every turn (instructions in
# CLAUDE.md or memory are only followed probabilistically; this is deterministic).
#
# The text is deliberately directive: a vague "consider the available tooling"
# nudge gets deprioritised as boilerplate. Forcing an explicit, named decision
# before any other tool call makes skipping the check visible.

echo "STOP — before any other tool call or substantive response, decide which specialized tool best fits this request: name one available agent or skill to use, OR state 'No relevant tools — doing it directly' with a one-line reason. Do not skip this check. Choose the best-fitting agent or skill over an ad-hoc manual approach whenever one applies."
