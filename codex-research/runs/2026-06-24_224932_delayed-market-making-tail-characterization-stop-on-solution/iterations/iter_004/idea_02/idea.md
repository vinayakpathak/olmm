# Bayes Myopic Optimality

ID: idea_02

## Summary
Check carefully that, under exogenous public prices, the Bayes-optimal policy for a fixed prior is pointwise myopic: at time t choose a maximizing a for E[r_t(a) | P_1:t], because actions do not affect future prices or information.

## Why Promising
It justifies the posterior predictive term in Psi_T(pi). A small conditioning error here would invalidate the proposed exact formula.

## Risks
If the protocol contains unmodeled feedback beyond public prices, or if actions can affect observations, the myopic argument breaks.

## Suggested Lenses
- proof strategy
- model audit
