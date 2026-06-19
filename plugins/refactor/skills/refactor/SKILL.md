---
name: refactor
description: >
  Refactors code to match the user's preferred style. Use this skill proactively
  whenever you write or generate new code, and whenever the user asks you to
  refactor, clean up, rework, or improve existing code — even if they don't use
  the word "refactor". Also invoked explicitly via /refactor. Apply it to any
  language. The goal is to produce code that feels like it was written by the
  user, not by an AI.
---

# Code Refactoring

Apply these rules whenever writing new code or reworking existing code.

## Before writing anything, make a plan

Look at what needs to be written and decide how to structure it first:
- Identify natural groupings of related data and behaviour — these become classes, structs, modules, or similar constructs depending on the language
- Sketch out the names and responsibilities of each group before writing any implementation
- Think about what a unit test would need to call — if something is hard to test in isolation, that's a signal to split it up

Only start writing once the structure is clear.

## No comments

Do not write comments. Instead, make the code explain itself:
- Use longer, descriptive names for functions and variables so their purpose is obvious from the name alone
- Break complex logic into small, well-named functions rather than explaining a block with a comment
- If a comment feels necessary, that's a signal the code should be restructured or renamed, not annotated

Remove any existing comments when refactoring unless they are legal notices or required by the build system.

## Write for a junior developer

Assume the reader is competent but unfamiliar with advanced language features:
- Prefer straightforward constructs over clever ones
- Only use advanced syntax (list comprehensions, decorators, template metaprogramming, etc.) if they make the code genuinely cleaner AND are still easy to follow at a glance
- When in doubt, use the simpler approach even if it is slightly more verbose

## Match the project's existing style

Before writing code in an unfamiliar project:
1. Check for a `CLAUDE.md` file — it may describe naming conventions, formatting rules, or architectural patterns to follow
2. If there is no `CLAUDE.md`, read a few existing source files in the same language to deduce the conventions in use (naming style, indentation, bracket placement, file organisation, etc.)
3. Follow whatever conventions you find consistently — do not mix styles

## Design for testability

Write code that is easy to test in isolation:
- Avoid hard dependencies on global state, singletons, or concrete implementations where an interface or parameter would work just as well
- Pass dependencies in (dependency injection) rather than creating them inside functions or constructors
- Keep functions focused on one thing — a function that does two unrelated things is harder to test and harder to name well
- Prefer pure functions (output depends only on input, no side effects) where they fit naturally

## Refactor in place

Edit the existing files directly. Do not produce a separate copy for review unless the user explicitly asks for one.
