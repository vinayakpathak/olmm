# Kappa Transfer Lemma

ID: idea_02

## Summary
Turn the solver's kappa transfer into a precise lemma. Work on finite grids and finite candidate set U first: condition on a common-prefix event E, assume the learner's prefix action marginals are identical for all u in U, define prefix payoffs phi_{u,t}, and include an explicit outside-surplus cap B_u plus probability weight Pr(E). Prove max_u regret_u >= |I| kappa_I(U)-B, or identify the missing hypotheses.

## Why Promising
It would convert the current prefix-compatibility heuristic into an accepted reusable lower-bound tool, and every assumption can be criticized directly.

## Risks
The prefix-local comparator v_u must be a valid lower bound on the global fixed-action comparator; same-prefix laws can fail for stochastic candidates; rare events and suffix compensation can otherwise create false positives.

## Suggested Lenses
- proof strategy
- formalization
- counterexample search
