# Prefix-Compatibility Modulus

ID: idea_02

## Summary
Define a prefix-compatibility modulus on a common unrevealed prefix: given possible continuation thresholds c_j and horizons T_j, ask whether one empirical distribution of prefix quotes can be near-optimal for all continuations/prefixes simultaneously. For zero-block gadgets this becomes a small LP over quote distributions; test whether its dual recovers the two-threshold lower bound and whether it is small on sparse vanishing spikes and coded-delay examples.

## Why Promising
It targets the real obstruction in the accepted lower bounds: incompatible prefix optima, not large delay tails alone.

## Risks
The modulus can become tautological if it is defined directly as regret. It may also be hard to extend beyond zero blocks and deterministic threshold continuations.

## Suggested Lenses
- definition design
- linear programming duality
- counterexample testing
