#!/bin/bash
# UserPromptSubmit hook — fires on every user prompt before Claude responds.
# Its stdout is injected into Claude's context as an additional instruction,
# guaranteeing the reminder reaches the model on every turn (instructions in
# CLAUDE.md or memory are only followed probabilistically; this is deterministic).

echo "Before acting on this request, review the available agents, skills, and hooks and use any that fit the task instead of doing the work ad hoc. Prefer a specialized agent or skill over a manual approach when one applies."