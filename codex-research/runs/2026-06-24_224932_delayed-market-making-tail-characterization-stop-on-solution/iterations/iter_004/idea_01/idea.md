# Finite-Grid Minimax Identity

ID: idea_01

## Summary
Prove the solver's exact characterization first for a finite class and finite quote grid: show that inf_A sup_theta regret equals sup_pi Psi_T,K(pi), where the Bayes learner maximizes the posterior predictive grid reward at each time.

## Why Promising
This is the load-bearing claim in the solver attempt. If it is true, the right characterization is predictability/value rather than a tail condition.

## Risks
Minimax equality may fail for infinite law classes or noncompact strategy spaces; measurability of policies over continuous price histories is the main technical point.

## Suggested Lenses
- proof strategy
- measurability audit
