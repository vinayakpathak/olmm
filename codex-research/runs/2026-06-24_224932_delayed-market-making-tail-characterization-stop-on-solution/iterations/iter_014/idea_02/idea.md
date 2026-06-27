# Nested-Window Adaptation

ID: idea_02

## Summary
If the general heterogeneous-delay theorem fails, exploit the special nested structure of market truncations: for fixed quote b, r_t^H(b) is monotone in H. Try a decomposition into short-window base rewards plus delayed bonus increments, or a multiscale FTRL/Hedge analysis charging only the comparator window.

## Why Promising
The market surrogate rewards have more structure than arbitrary delayed experts. This could recover the oracle min_H {delta_T(H)+sqrt(T H)} bound without solving an impossible general problem.

## Risks
The monotonicity y_t(H,b) <= y_t(H',b) may not control adversarial late bonuses, and the useful algorithm may still pay the largest H.

## Suggested Lenses
- algorithm design
- proof strategy
