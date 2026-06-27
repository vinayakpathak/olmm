# Tiny-price beta counterexample

ID: idea_02

## Summary
Fully formalize the deterministic tiny-price long-delay block counterexample from the solver attempt: blocks of L_m = 2^m zeros followed by spike p_m = 2^{-2m}. Show beta(h)=1 for all h, but sup_T sup_a sum_{t<=T} r_t(a) is bounded, so the zero-quote learner has O(1) regret.

## Why Promising
It would give a sharp, simple obstruction to any raw delay-probability necessity theorem, independent of stochastic estimation issues.

## Risks
The beta definition may need an infinite-process version or finite-horizon beta_T; strict threshold and block-boundary details must be checked.

## Suggested Lenses
- counterexample formalization
- quantifier check
