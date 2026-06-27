# Payoff-Weighted Tail

ID: idea_02

## Summary
Replace beta by the payoff-weighted tail gamma(h)=sup_t sup_a esssup a Pr(h<tau_t(a)<infty | history). Prove the same upper bound with T gamma(H) in place of T beta(H), and show equivalence to uniform tightness over positive-scale actions a>=epsilon for every epsilon>0. Then test whether gamma(h)->0 is necessary or only sufficient.

## Why Promising
It directly repairs the solver's obstruction: long delays at a=0 or tiny quote levels should not matter for regret.

## Risks
The essential supremum over histories may still be too strong; rare histories or isolated times can violate gamma without causing linear expected regret.

## Suggested Lenses
- proof strategy
- condition refinement
- counterexample search
