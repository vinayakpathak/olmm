# Finite-Prefix Dual Certificates

ID: idea_02

## Summary
Derive the exact minimax dual of the finite-prefix problem: min_mu max_{T<=n} [V_T^* - sum_{t<T} g_{mu_t}(M_{t,T})] equals max over horizon weights lambda of sum_T lambda_T V_T^* minus sum_t sup_a sum_{T>t} lambda_T a 1{a<M_{t,T}}. Then interpret dual optimizers as decision-relevant horizon-conflict certificates.

## Why Promising
This generalizes the kappa dual from terminal blocks to arbitrary deterministic paths and may give the right replacement for loose suffix-menu sums.

## Risks
The dual may remain computational rather than structural. Strong duality needs finite support or left-limit action space, and V_T^* must be handled as a supremum under strict crossing.

## Suggested Lenses
- LP duality
- proof strategy
- certificate search
