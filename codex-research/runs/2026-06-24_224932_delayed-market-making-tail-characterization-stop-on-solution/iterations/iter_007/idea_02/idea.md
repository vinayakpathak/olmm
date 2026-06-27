# Rare-History Beta Separation

ID: idea_02

## Summary
Formalize the solver's rare-history example: draw N with P(N=n)=c 4^{-n}, reveal a symbol s_N at time 1, then run L_N=2^n zeros followed by one spike at 1. Prove beta(h)=1 for every h, but Delta_T(H) is O(1/H) uniformly in T and the comparator value is bounded.

## Why Promising
It cleanly separates essential-sup raw delay tails from average value-weighted truncation, blocking a common false necessity route.

## Risks
The essential-sup calculation depends on conditioning on positive-probability atoms; the supremum over quotes and horizons in Delta_T(H) may expose missed contributions; bounded regret for the zero learner must be stated with the correct law-awareness and horizon convention.

## Suggested Lenses
- counterexample proof
- tail calculation
- quantifier audit
