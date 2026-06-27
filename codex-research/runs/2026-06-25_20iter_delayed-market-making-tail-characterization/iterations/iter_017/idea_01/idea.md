# Promote Equal-Low Drought Formula

ID: idea_01

## Summary
Audit the solver's equal-low multi-low drought proof by deriving the full finite-prefix primal LP for h^M,0^{N_0},ell,0^{N_1},ell,...,0^{N_r},ell,0^L,h and explicitly eliminating dominated actions and dominated horizons. The target is to prove the exact reduction to variables x_i with constraints z >= S_j - ell sum_{i<=j} x_i and z >= (h-ell) sum_i x_i, including all capacities and strict-crossing left-limit conventions.

## Why Promising
This is the most immediate partial theorem from the solver attempt, and it would turn CL-048 from candidate into an accepted reusable regression test for the two-level gluing program.

## Risks
The dominance reduction may hide a boundary case: quotes at low times, M=0, zero S_j, or post-low coordinates might create a horizon constraint not represented by the cumulative x_i variables.

## Suggested Lenses
- proof audit
- edge-case verification
