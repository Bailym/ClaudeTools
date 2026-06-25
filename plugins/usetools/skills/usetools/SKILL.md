---
name: usetools
description: >
  Explicitly survey the available agents, skills, and hooks and pick the
  best-fitting one for the current task before doing any work. This is the
  manual, on-demand counterpart to the tooling-reminder hook — invoke it via
  /usetools when you want to force a deliberate tooling decision, or use it
  proactively whenever a request might be better served by a specialized agent
  or skill than by an ad-hoc manual approach.
---

# Use the Right Tool

This skill is the manual, explicit alternative to the `tooling-reminder` hook.
The hook nudges on every prompt but is easy to skip; invoke `/usetools` when you
want to force a deliberate, on-demand tooling decision instead. Use one or the
other — they serve the same purpose by different means.

Before acting on the current request, deliberately decide whether a specialized
agent or skill should handle it instead of an ad-hoc manual approach.

## Survey what is available

1. List the agents available via the Agent tool in this session.
2. List the skills available via the Skill tool in this session.
3. Note any relevant hooks that may already act on this kind of request.

Do not rely on memory or a hard-coded list — read what is actually available in
the current setup, since the installed agents, skills, and hooks vary per user.

## Match the task to a tool

For the current request, work out which single tool is the best fit:
- Match the request against each agent's and skill's stated purpose.
- Prefer the most specific tool that genuinely applies — a specialized agent or
  skill almost always beats doing the work manually.
- If two tools could apply, pick the one whose description matches most closely.

## State the decision, then act

Before any other tool call or substantive work, state one of:
- **"Using `<agent-or-skill>`"** — name the chosen tool and a one-line reason, then invoke it.
- **"None fits — doing it directly"** — give a one-line reason why no available tool applies, then proceed manually.

Never skip this decision silently. The whole point of invoking this skill is to
make the tooling choice explicit.
