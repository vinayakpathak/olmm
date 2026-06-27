# Multi-Low Single-Drought LP

ID: idea_02

## Summary
Generalize to one high-free episode with several low prices: h^M,0^{N_0},l,0^{N_1},l,...,0^{N_r},l,0^L,h. Formulate the exact LP with cumulative low-horizon surplus constraints S_j - l P_j and final high debt (h-l)P_total. Determine whether the last low alone binds or whether early lows create additional front-loading constraints.

## Why Promising
This is the smallest nontrivial test of the proposed resolved-surplus/debt picture.

## Risks
Earlier low horizons may not be dominated by the final low; capacity constraints on where low-mass can be placed may make the LP more complex than the solver's sketch suggests.

## Suggested Lenses
- finite LP duality
- cumulative scheduling
