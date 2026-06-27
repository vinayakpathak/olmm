# Audit the Refutation

ID: idea_01

## Summary
Verify the solver's sparse vanishing-spike refutation line by line: beta(h)=1 via action a=0 at spike times, the best fixed comparator has expected payoff at most 1 for every horizon, and the continuum maximum exists. Then try to strengthen it to a family with beta=1 and regret bounded by any prescribed sublinear envelope.

## Why Promising
This is the shortest path to a rigorous conclusion about the stated iff: the unweighted tail condition appears to count long delays at actions with negligible payoff.

## Risks
If the intended theorem is minimax over a class of processes rather than literal per-process learnability, the sparse-spike counterexample may only expose a quantifier mismatch.

## Suggested Lenses
- proof audit
- quantifier analysis
- counterexample generalization
