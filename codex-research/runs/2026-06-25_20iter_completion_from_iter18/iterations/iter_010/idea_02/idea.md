# Empirical-Process Reformulation

ID: idea_02

## Summary
Reformulate the derandomization lemma as a uniform law of large numbers for the class f_c(t,a)=a 1{a<c_t}, where c_t is nonincreasing in t. Try to prove the needed uniform convergence via bracketing entropy for monotone functions or bounded-variation classes, and compare the resulting rate to the solver's finite-grid union bound.

## Why Promising
A reusable entropy proof would be cleaner than an ad hoc grid argument and may also support infinite-menu or nonstationary variants later.

## Risks
Standard empirical-process theorems usually assume iid observations, while here the time coordinates are fixed and the threshold sequence is triangular. The monotone-boundary class may need a custom bracketing argument rather than direct citation.

## Suggested Lenses
- empirical process
- entropy bounds
- rate sharpening
