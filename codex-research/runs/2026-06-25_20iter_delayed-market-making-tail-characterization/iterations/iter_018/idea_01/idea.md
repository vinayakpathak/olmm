# Audit Unequal-Low LP Reduction

ID: idea_01

## Summary
Prove or disprove the solver's full-to-reduced LP reduction for one unequal-low drought. Start from the accepted finite-prefix D_n primal in the formal left-limit model, partition quote coordinates into protected old-high, useful segment, and final-only classes, justify the action menu L union {h}, derive the low-horizon constraints and final-high debt constraint, and show all intermediate zero horizons are dominated by the latest low constraint.

## Why Promising
This is the immediate bottleneck in iteration 18. A clean proof promotes the candidate LP to an accepted local theorem; a failure gives a precise counterexample to the solver attempt.

## Risks
The rounding-to-low-levels dominance may fail at a strict-crossing boundary, the old-high subtraction S_j=V^*_{s_j}-hH may miss a comparator regime, or intermediate zero horizons may create constraints not represented by the low horizons.

## Suggested Lenses
- proof strategy
- strict-crossing cleanup
- finite-prefix LP duality
