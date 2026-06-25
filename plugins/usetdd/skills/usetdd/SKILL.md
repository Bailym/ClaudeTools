---
name: usetdd
description: >
  Drive the Test-Driven Development cycle inline while writing code: write a
  failing test first (RED), the minimum code to make it pass (GREEN), then
  refactor under green tests. Invoke it via /usetdd to start a piece of work
  test-first, or use it proactively whenever you are about to add or change
  behaviour. This skill *drives* the cycle inline; to audit whether the cycle
  was followed after the fact, check for a TDD-related review or audit agent.
---

# Drive the TDD Cycle

This skill steers the work you are doing right now, in this conversation, so
that production code is written test-first. It *drives* the cycle inline as you
write the code.

Auditing whether the cycle was actually followed is a separate, after-the-fact
job best done in an isolated context: if a TDD-related review or audit agent is
installed, use that for the audit and this skill for the writing. Don't assume a
specific agent exists — check what's available first.

## The cycle

Work one small behaviour at a time, repeating RED → GREEN → REFACTOR:

1. **RED — write a failing test first.**
   - Write a single test describing the next observable behaviour you want.
   - Run it and confirm it fails, and that it fails for the *right reason* (the
     missing behaviour) — not a compile error, typo, or unrelated failure.
   - Do not write any production code until this failing test exists.

2. **GREEN — minimum code to pass.**
   - Write the least code that makes the failing test pass.
   - Resist adding functionality no test is driving. If you want more, write the
     next failing test first.
   - Run the suite and confirm everything is green.

3. **REFACTOR — improve under a green bar.**
   - With tests passing, remove duplication and improve names and structure.
   - Re-run tests after each change; they must stay green.
   - Refactor production *and* test code — keep tests readable.

## Test behaviour, not implementation

- Assert on what is observable through the public API, not internal state.
- Don't test private methods directly or mock internal collaborators that are
  really implementation details.
- A test that breaks when you refactor internals (without changing behaviour) is
  testing the wrong thing — rewrite it.
- Don't add production code (getters, setters, constructors, visibility hacks)
  that exists only to let a test see inside.

## Pragmatic edge cases

- **Bug fixes:** first write a failing test that reproduces the bug, then fix it.
- **Legacy / untested code:** add characterization tests to capture current
  behaviour before changing it, then proceed test-first for the new behaviour.
- **Refactor with no existing tests:** write tests that pin current behaviour
  first, then refactor under them.
- **Spikes:** exploratory throwaway code is fine to understand a problem — but
  delete it and redo the work test-first.

## Before moving on

Each loop, check:
- Did the test fail before it passed, for the right reason?
- Is the production code only what a test required?
- Do the tests describe behaviour, and would they survive an internal refactor?

Keep the loops small. One behaviour, one failing test, one step at a time.
