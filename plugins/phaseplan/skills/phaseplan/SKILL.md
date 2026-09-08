---
name: phaseplan
description: >
  Plan a feature or code module as a sequence of phases, where every phase ends
  in something tangible and demonstrable — a vertical slice, not a layer — and
  write the result to a markdown document. Invoke it via /phaseplan before
  starting non-trivial work, or whenever the user asks for a plan, a design, a
  breakdown, or a roadmap for a feature or module. Prefer it over an ad-hoc plan
  whenever the work is large enough to span more than one sitting.
---

# Phase Plan

Turn a feature or module into an ordered set of phases, each of which ends with
something you can actually run, show, or ship. Write the result to a markdown
file so it outlives the conversation.

The organising rule is the **vertical slice**: a phase cuts through every layer
it needs — storage, logic, interface, wiring — to deliver one narrow capability
end to end. It does not build one whole layer and leave it disconnected. A plan
of vertical slices is never more than one phase away from working software; a
plan of horizontal layers is broken until the very last phase.

## Step 1 — Gate on size

Not all work deserves a document. Before writing anything, judge the size:

- **Skip the plan** if it is a change of one or two files with no real
  sequencing decisions. Say in one line that it is a one-phase change, describe
  the approach in a sentence or two, and get on with it.
- **Write the plan** if the work spans multiple modules or sittings, has an
  order that matters, or involves choices worth recording before code exists.

If you are unsure which side it falls on, err toward writing it — the user
invoked `/phaseplan` deliberately.

## Step 2 — Understand before planning

Never plan against assumptions about a codebase you have not read.

- Read the code the change touches: existing patterns, boundaries, naming, test
  setup, and the build and run commands. The plan must fit what is there, not an
  idealised version of it.
- If the codebase is large or the relevant code is scattered, delegate the
  search to a subagent so the exploration stays out of this conversation, and
  plan from what it reports back.
- If something genuinely blocks the plan's shape — an unstated constraint, or a
  choice between two incompatible directions — ask via `AskUserQuestion`. One
  question at a time, with real options, and only for things that actually
  change the phasing. Do not interview the user about details you could settle
  yourself or discover by reading. (If a dedicated interview skill is installed
  and the requirements are wholly unclear, suggest it rather than reinventing it
  here.)

## Step 3 — Cut the phases

Find the seams. Good phases have these properties:

- **Each ends in a deliverable.** Something a person can exercise, observe, or
  ship. "A user can create an account and log in." "The parser handles the three
  most common frame types and rejects the rest." "The board boots and streams
  telemetry over UART at 1 Hz." Not "the models are defined" or "scaffolding is
  in place."
- **Each is verifiable.** Every phase must name the concrete way to prove it
  works — the command to run, the test that passes, the thing to click, the
  output to observe on hardware. **If you cannot name one, it is not a phase**;
  fold it into a neighbouring phase.
- **Each is narrow.** Prefer the thinnest slice that still delivers something:
  one happy path, one frame type, one endpoint. Breadth comes in later phases.
- **Each is a sensible stopping point.** If the work were abandoned after any
  phase, what exists should be coherent rather than half-wired and broken.
- **Ordered by risk and learning.** Front-load the phase that proves the riskiest
  assumption or resolves the biggest unknown. Do not save the hard part for last.
- **Roughly one sitting each.** A phase that reads like a week of work is really
  several phases wearing a coat.

Three to six phases suits most features. More than that usually means the slices
are too thin, or the feature is really several features.

### When vertical slicing does not apply

Some work genuinely resists it — a protocol parser, a build-system migration, a
driver, a broad refactor. Do not manufacture fake milestones to satisfy the
format. Instead:

- If the change is one indivisible unit, say so and write a one-phase plan.
- If it can only be sequenced internally, phase it that way and let the
  deliverable be a passing test or a demonstrable behaviour rather than a
  user-visible capability.
- On embedded or systems work, "demonstrable on the target hardware" is a
  perfectly good deliverable; it does not have to be shippable to an end user.

Say plainly in the document when you have done this, and why.

## Step 4 — Write the document

Write to `<feature-name>.md` in the repository root, using a kebab-case
filename — unless the user names a different path, or the repository already has
an obvious home for plans (a `docs/plans/` or `design/` directory that already
exists; do not create one). **Do not commit or stage the file** — leave it for
the user.

Use this structure:

```markdown
# <Feature or module name>

## Goal
What this delivers and why, in two or three sentences.

## Context
What already exists that this builds on, and the key constraints — technical,
compatibility, or otherwise — that shape the approach.

## Approach
The shape of the solution in a short paragraph: the main components, where the
boundaries fall, and how data moves between them.

## Phases

### Phase 1 — <short name of the capability delivered>
**Deliverable:** what works at the end of this phase, stated as a capability.
**Verify:** the exact command, test, or observation that proves it.
**Work:** the concrete changes — files, modules, functions — as a short list.
**Not yet:** what is deliberately left out of this phase.

### Phase 2 — <…>
…

## Open questions
Anything unresolved that could change the plan, and what would settle it.

## Rejected alternatives
Approaches considered and why they were not chosen — one or two lines each. Keep
it brief, but do not skip it; this is the part that saves the most time later.
```

Rules for filling it in:

- **Never omit `Not yet:`.** It is what stops phase 1 quietly absorbing phases 2
  and 3 and collapsing the plan back into a big-bang implementation.
- **`Verify:` must be executable or observable**, not a restatement of the
  deliverable. `npm test -- auth`, or "POST /users returns 201 and the row
  appears in the database" — not "authentication works".
- **`Work:` stays at the level of intent** — which files and functions change,
  and why. This is a plan, not the code; do not write out implementations.
- Cut any section that has nothing real in it rather than padding it. If nothing
  was rejected, drop that section.

## Step 5 — Hand it back

After writing, report in the conversation:

- The path you wrote to.
- The phase list — one line each, deliverable only — so the shape is visible
  without opening the file.
- Any open question that genuinely needs an answer before phase 1 starts.

Then stop, and let the user respond. Do not begin implementing unless they ask —
the point of writing the plan down is that they get to change it first.

## Working from the plan afterwards

If the user does go on to implement it, work one phase at a time and stop at each
phase boundary for them to confirm before starting the next. Tick phases off in
the document as they complete, and when reality diverges from the plan, update
the document to match — a stale plan is worse than no plan.
