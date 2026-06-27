# Audit finite-grid minimax identity

ID: idea_01

## Summary
Prove or refute the finite-Theta, finite-grid minimax identity exactly as stated in the solver attempt. Focus on the reduction to public-prefix randomized kernels, construction of the compact convex policy space as products of L-infinity simplices dominated by prefix mixture measures, weak-* continuity of each L_theta, and the Sion/von Neumann minimax step.

## Why Promising
This is the solver attempt's central new claim. If it survives, it gives a precise necessary-and-sufficient finite-class characterization via least-favorable Bayes gap; if it fails, the failure point will sharply delimit what can be claimed.

## Risks
The weak-* policy-space argument may hide a measurability or continuity gap, especially in reducing arbitrary randomized histories to kernels depending only on public price prefixes. Sion may also be unnecessary but misapplied if compactness is not stated in the right topology.

## Suggested Lenses
- proof strategy
- functional analysis audit
- counterexample search
