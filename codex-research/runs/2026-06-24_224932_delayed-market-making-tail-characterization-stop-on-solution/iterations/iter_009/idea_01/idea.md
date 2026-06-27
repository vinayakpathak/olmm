# Close The No-Gap Proof

ID: idea_01

## Summary
Write a referee-ready proof of the fixed finite T, finite grid G reward-measure domination theorem. Show any private-randomized public-price policy has the same expected rewards as prefix kernels q_t(P_1:t), derive L_theta(q) from payoff-weighted measures, prove weak-star compactness of the feasible kernel set, and conclude product compactness/no-gap.

## Why Promising
This is the main conditional gap in the current solver attempt. If it works, the finite-class Bayes value theorem extends cleanly to dominated infinite classes.

## Risks
The proof may only establish compactness for L-infinity equivalence classes rather than admissible Borel policies. Null sets and measurable representatives may not align across theta. The reduction may also hide assumptions about private randomness and delayed feedback.

## Suggested Lenses
- proof strategy
- measurability audit
- critic stress test
