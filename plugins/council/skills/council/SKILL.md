---
name: council
description: >
  Spawn a council of five agents, each reasoning through a fixed, distinct
  lens (simplicity, risk, cost-benefit, long-term maintenance, contrarian),
  to surface genuine disagreement on ambiguous or high-stakes judgment
  calls. Invoke via /council <question> for decisions with no single
  correct answer — architecture tradeoffs, "should we do X or Y", subjective
  calls. Do not invoke for factual lookups or well-defined technical
  questions with one correct answer; they don't benefit from the 5x cost.
---

# Council

Get five independent takes on a genuine judgment call by having five agents
argue fixed, opposing lenses, then report where they converge and where the
real disagreement lies.

## Step 1 — Gate before spawning

This costs roughly 5x a normal answer. Before spawning anything, check
whether the question actually has room for reasonable people to disagree:

- **Skip the council** if the question has a single correct, checkable
  answer (a factual lookup, a well-defined technical task, "what does this
  function do"). Answer it directly instead, and say in one line why a
  council wasn't warranted.
- **Run the council** if it's a genuine tradeoff, a subjective call, or a
  high-stakes decision where the "right" answer depends on what you weight
  most heavily.

If you're unsure which side it falls on, err toward running it — the user
invoked `/council` deliberately.

## Step 2 — Fix the question

State the exact question being sent to the council in one line (use the
argument if given, otherwise the topic currently under discussion). Every
agent gets this identical question — only the lens differs.

## Step 3 — Spawn all five, in parallel, in one message

Launch five `Agent` calls with `subagent_type: "fork"` in a single message
so they run concurrently. Each gets the same question plus one fixed
persona directive, verbatim below — do not adapt the lens wording to the
topic, that's what keeps the five genuinely independent instead of
converging on the same "balanced" answer:

1. **Simplicity** — "Argue for the simplest, smallest approach to this
   question: {question}. Treat any extra abstraction, dependency, moving
   part, or step as a cost that must justify itself. What's the version of
   this with the fewest moving parts? Answer in under 200 words, ending with
   a one-line recommendation."
2. **Skeptic / Risk** — "Consider this question: {question}. Assume the
   obvious answer goes wrong. Find the failure modes, edge cases, and
   hidden costs it doesn't mention — what breaks, and under what
   conditions? Answer in under 200 words, ending with a one-line
   recommendation."
3. **Pragmatist / Cost-benefit** — "Consider this question: {question}.
   Weigh effort against payoff. Is this worth doing at all, and is now the
   right time? Weigh it against the opportunity cost of spending the same
   effort elsewhere. Answer in under 200 words, ending with a one-line
   recommendation."
4. **Long-term maintainer** — "Consider this question: {question}. Assume
   someone else maintains the result in two years with no memory of today's
   context. How does this age? What does it lock in or foreclose? Answer in
   under 200 words, ending with a one-line recommendation."
5. **Contrarian** — "Consider this question: {question}. Take the position
   opposite the obvious or default answer and argue it as strongly as you
   honestly can — don't hedge back toward consensus. Answer in under 200
   words, ending with a one-line recommendation."

Name the forks so they're identifiable in step 4, e.g.
`council-simplicity`, `council-skeptic`, `council-pragmatist`,
`council-maintainer`, `council-contrarian`.

## Step 4 — Wait for all five

Each fork reports back independently as its own notification, in its own
turn. Do not synthesize, summarize, or guess any agent's position before its
notification has actually arrived — never fabricate or predict a fork's
answer. If the user asks for a status update while forks are still running,
report how many of the five have reported back, not a guess at what they'll
say.

## Step 5 — Synthesize

Once all five are in, report:

- **Consensus** — what most or all of the five land on, even via different
  reasoning paths.
- **Disagreement** — where the lenses genuinely diverge, and *why* — name
  the underlying tradeoff driving the split rather than just noting that
  they disagree.
- **Your call** — a short recommendation given the above. The council
  informs the decision; it doesn't replace making one.

Keep the synthesis tight — the value is the comparison, not five full essays
reproduced in full.
