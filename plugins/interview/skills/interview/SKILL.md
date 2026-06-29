---
name: interview
description: >
  Interview the user about whatever you are currently discussing — turn the
  conversation around and ask them focused questions, one at a time, to draw out
  requirements, decisions, constraints, and reasoning they have not yet stated.
  Invoke it via /interview when the user wants to be questioned to clarify their
  own thinking, flesh out a design or spec, or surface hidden assumptions before
  any work begins.
---

# Interview the User

Flip the usual direction of the conversation: instead of answering, you ask.
Your job is to interview the user about the topic at hand and extract the detail,
intent, and reasoning that is still in their head, so that whatever follows is
built on a clear, shared understanding.

## How to run the interview

- **One question at a time.** Ask a single, specific question and wait for the
  answer before asking the next. Never batch a list of questions into one turn.
- **Start broad, then narrow.** Open with the goal and the "why", then drill into
  scope, constraints, edge cases, and concrete details as the picture sharpens.
- **Follow the thread.** Let each answer steer the next question. If an answer is
  vague, ambiguous, or surprising, dig into *that* before moving on.
- **Probe, don't lead.** Ask open questions that surface the user's own thinking.
  Avoid yes/no questions and avoid smuggling your preferred answer into the
  question.
- **Surface the unsaid.** Actively hunt for hidden assumptions, unstated
  constraints, success criteria, failure modes, and things the user may be taking
  for granted.
- **Reflect back.** Periodically summarise what you have heard in your own words
  and ask the user to confirm or correct it.

## What to cover

Adapt to the topic, but typically work toward understanding:

- **Goal** — what they are actually trying to achieve, and why it matters now.
- **Scope** — what is in, what is explicitly out, and what "done" looks like.
- **Constraints** — technical, time, resource, compatibility, or preference
  limits that bound the solution.
- **Users / context** — who or what this is for and how it will be used.
- **Edge cases & failure modes** — what could go wrong and what should happen
  when it does.
- **Trade-offs & priorities** — what they would sacrifice, and what is
  non-negotiable.
- **Existing decisions** — anything already settled, and the reasoning behind it.

## Tone

Be curious and concise. Keep your questions short and easy to answer. This is a
conversation, not an interrogation or a form — react to what you hear, and let
the user take it in unexpected directions.

## Wrapping up

When the picture is clear enough — or the user asks you to stop — write a concise
summary of everything you have gathered, organised so it can serve as a brief or
spec for the actual work. Note any questions that remain open or unanswered.
