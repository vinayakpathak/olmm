# Dualize The Drought LP

ID: idea_02

## Summary
Attack the same theorem from the finite-prefix dual. Restrict dual support to low horizons and the final high, compute the per-segment support terms, and verify that they match the solver's psi_i expression. Then ask whether any omitted horizon can increase the full dual objective in one-drought paths.

## Why Promising
The solver's dual formula is compact and may be the cleanest route to a lower bound. It also directly checks the final-debt term and the S_j normalization.

## Risks
The displayed dual may be only the dual of the reduced LP, not of the full finite-prefix LP; dual mass on intermediate horizons could improve the certificate; low-level menus may need running maxima not included in L.

## Suggested Lenses
- dual certificate
- LP verification
- counterexample search
