# Audit finite-grid value iff

ID: idea_01

## Summary
Verify the solver's finite-class iff claim carefully: for finite horizon-indexed classes Theta_T, finite grid G_T with K=T, randomized policies, public exogenous prices, and upper-regret convention, prove or refute that sublinear continuum regret is equivalent up to O(1) to (sup_pi Psi_G_T(pi))_+ = o(T). Track signed regret, positive part, and both sides of the grid-continuum comparison.

## Why Promising
This could turn the accepted finite-grid Bayes identity into a clean necessary-and-sufficient theorem under precise finite-class quantifiers.

## Risks
May only yield a value characterization close to restating the game, and only for finite classes unless extended separately.

## Suggested Lenses
- proof audit
- model taxonomy
