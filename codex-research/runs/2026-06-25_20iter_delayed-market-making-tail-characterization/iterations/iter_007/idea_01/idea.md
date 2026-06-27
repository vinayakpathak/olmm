# Certify The Finite-m Equal-Revenue Theorem

ID: idea_01

## Summary
Turn the solver's finite-m result into a polished proposition: for any nonnegative threshold law with at most m positive support points, E[Z] - sup_a a Pr(Z>a) <= ((m-1)/m)^m, with equality for the discrete equal-revenue support. Check every reduction step: removing zero atoms, scaling top support to 1, raising values below rho to rho without increasing rho, preserving support size, using left-limit revenue under strict crossing, and proving tightness from the proposed tail probabilities.

## Why Promising
This is the main new progress in the solver attempt; if accepted, it upgrades CL-023 and supplies a reusable exact constant for all multi-threshold lower-bound lifts.

## Risks
The theorem may need small corrections for normalization, zero mass, or strict crossing; the solver's proof might prove only a slightly different support-count convention if support at 0 is mishandled.

## Suggested Lenses
- proof audit
- strict-crossing edge cases
- LP duality
