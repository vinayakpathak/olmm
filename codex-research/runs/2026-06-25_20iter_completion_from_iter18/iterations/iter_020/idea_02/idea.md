# Flow Certificate For Exactness

ID: idea_02

## Summary
Turn the solver's exactness certificate for a fixed active k into a max-flow or Hall-type feasibility theorem. Model segment capacities B_i as supply, allowed masses x_{i,j} only on j >= max(k,i+1), low-coverage constraints as nested demands S_t - Z_inc, and final high debt as a weighted budget. Derive min-cut inequalities whose failure identifies the first capacity obstruction.

## Why Promising
It would convert a candidate primal certificate into necessary and sufficient finite inequalities, giving explorers a precise way to prove exactness or produce capacity-saturation counterexamples.

## Risks
The weighted final-debt constraint may prevent a simple Hall theorem, or the resulting cut inequalities may be no simpler than the original LP.

## Suggested Lenses
- algorithmic proof
- certificate extraction
