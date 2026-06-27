# Value-Tail Modulus

ID: idea_01

## Summary
Formalize the solver's value-tail modulus theorem: define B_T(H)=sup_a V_T(a)-sup_a V_T^H(a), replace max by sup, and prove the bound inf_{H,K}{sqrt(T(H+1)log K)+T/K+B_T(H)} with exact quantifiers. Then compare B_T(H) to the stronger raw tail quantity D_T(H)=sup_a E sum_t a 1{H<tau_t(a)<infty}. Look for examples separating beta, D_T, and B_T.

## Why Promising
This turns the false beta-necessity conjecture into a precise positive theorem and gives a clean object that may be close to the right characterization.

## Risks
It is likely only sufficient, not necessary, because predictable long-tail rewards can be exploitable. It may also hide learnability assumptions inside process-specific quantities unavailable to a universal learner.

## Suggested Lenses
- proof strategy
- sharp upper bound
- counterexample search
