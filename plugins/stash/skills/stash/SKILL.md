---
name: stash
description: >
  Save everything the next session will need before the context is cleared —
  progress, decisions, gotchas, and next steps — into the project's
  documentation and markdown files, and into memory where that fits better.
  Invoke it via /stash right before /clear, or whenever the user says they are
  about to clear, reset, or compact the context, start a fresh session, or move
  on to the next phase, and asks you to write down what you will need.
---

# Stash

The user is about to clear the context. Everything in this conversation that is
not written down will be gone. Your job is to make sure a fresh session — one
that starts with only the repository, its `CLAUDE.md` files, and memory — can
pick the work up without asking the user to re-explain anything.

Optional arguments name what comes next (e.g. `/stash before phase 3`). Use them
to decide what the next session most needs.

## Step 1 — Take stock

Review the conversation and list what a cold session would need but could not
recover by reading the code or git history:

- **Where the work stands** — what is done, what is half-done, what is next.
- **Decisions and their reasons** — choices made, alternatives rejected, and why.
- **Constraints and gotchas** — things learned the hard way: a flaky test, a
  quirk of the build, an API that does not behave as documented, a command that
  must be run a certain way.
- **User preferences and corrections** — how the user wants you to work, stated
  or shown during this session.
- **Open questions** — anything unresolved, and what would settle it.

Drop anything the code, tests, or commit history already record. Do not stash a
summary of the conversation; stash only what would otherwise be lost.

## Step 2 — Put each item in the right place

Read the destination before writing to it, and update an existing entry rather
than adding a duplicate.

| What it is | Where it goes |
|------------|---------------|
| Progress on a planned piece of work | The existing plan or design doc for it — tick off finished phases, note where the current one stopped, and correct the plan where reality diverged |
| Durable facts about the project — build/run/test commands, architecture, conventions, gotchas any contributor would hit | The project's `CLAUDE.md`, or the README / docs if the fact belongs to humans too |
| Things about the user, how they want you to work, or project context that is not suited to the repo | Memory, if a memory system is available in this session — follow its own format and indexing rules |
| Transient session state with no plan doc to hold it — the next step, a half-finished change | A plan doc if one fits; otherwise a project-type memory. Only create a new markdown file in the repo if neither exists and the user would want one |

Rules:

- **Prefer existing files.** Extend the plan, `CLAUDE.md`, or docs already in
  the repo. Do not create a new docs directory or a `HANDOFF.md` unless nothing
  suitable exists.
- **Keep `CLAUDE.md` durable.** It is loaded every session; do not fill it with
  this week's progress notes. Progress belongs in the plan doc or memory.
- **Be specific.** File paths, function names, exact commands, exact error
  messages. "Fix the parser bug" is useless to a cold session; "`parse_frame`
  in `src/proto.c` drops the last byte when `len == 64` — test
  `test_frame_boundary` reproduces it" is not.
- **Convert relative dates to absolute ones.** "Yesterday" means nothing next
  week.
- **Remove what is now wrong.** If this session disproved something already in
  the docs or memory, fix or delete it.
- **Do not commit or stage anything.** Leave the changes for the user to review.

If there is genuinely nothing worth saving, say so and stop — do not write for
the sake of it.

## Step 3 — Hand it back

Report briefly:

- Each file you wrote or changed, with one line on what went into it.
- A **resume prompt** — one or two sentences the user can paste after clearing,
  pointing the next session at the right files, e.g.:
  > Read `docs/plans/telemetry.md` — phase 2 is done; start phase 3. Note the
  > UART gotcha recorded in `CLAUDE.md`.

Then stop. You cannot clear the context yourself; tell the user it is safe to
run `/clear`.
