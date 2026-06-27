# Density Psi Identification

ID: idea_02

## Summary
Prove rigorously that the density-form support formula under payoff-measure domination equals the conditional Bayes envelope defining Psi_{G,F}. Work with finite F, prior pi, measures nu_{t,a}=sum_theta pi_theta mu^theta_{t,a}, and compare Radon-Nikodym densities using both lambda_t and the mixture prefix law.

## Why Promising
The iteration 12 solver asserts this as a concrete new closure step. A short proof would make the infinite-class no-gap statement use the same Psi notation as the finite-class theorem.

## Risks
Null sets under the mixture prefix law may obscure the equality if the dominating measure is chosen poorly. Need handle zero-density prefixes and verify finite-G measurability cleanly.

## Suggested Lenses
- proof strategy
- measure-theory verification
