# Increasing-Low Zero-Pressure Theorem

ID: idea_01

## Summary
Audit and sharpen the solver's increasing-low zero-pressure lemma. Prove carefully that the proposed dual tail weights have nonnegative alpha_j, sum alpha_j + beta = 1, and psi_i = 0 for strictly increasing lows. Then determine whether Z_inc is exact under natural capacity assumptions, and record the minimal counterexample when it is not.

## Why Promising
It directly extends the accepted two-low p<q non-capacity branches and explains the three-low 291/100 certificate; it is the cleanest new structure in the solver attempt.

## Risks
The lower bound may be correct but far from tight when segment capacities bind; duplicates or merely nondecreasing lows may introduce boundary cases that obscure the clean tail-weight formula.

## Suggested Lenses
- proof strategy
- counterexample search
