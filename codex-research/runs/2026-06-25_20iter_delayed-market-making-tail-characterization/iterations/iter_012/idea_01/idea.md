# Compactness For The Prefix LP

ID: idea_01

## Summary
Turn the solver's finite-prefix LP into an infinite-policy theorem. Define a normalized feasibility quantity such as inf over mu_1,...,mu_{n-1} of max_{T<=n, T>=N} R_T/T, then prove or refute equivalence between this tending to 0 and existence of one horizon-oblivious randomized policy with R_T=o(T) on the deterministic known path.

## Why Promising
This would convert the solver's exact but tautological marginal condition into a precise finite-to-infinite characterization, and it directly targets the main gap in the current solver attempt.

## Risks
The naive condition rho_n=o(n) may be too weak: compactness may only control fixed horizons after subsequence extraction. Strict-crossing discontinuities also need a left-limit compactification or eta-implementation.

## Suggested Lenses
- proof strategy
- topology/compactness
- counterexample search
