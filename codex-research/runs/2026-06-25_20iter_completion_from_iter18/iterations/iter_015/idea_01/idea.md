# Audit Single-Drought Damping

ID: idea_01

## Summary
Audit the solver's single-drought damping lemma for the two-level formal left-limit path h^M, 0^N, ell, h. Write a complete primal marginal construction and matching dual lambda certificate for D_{M+N+2}=S(1-ell/h), where S=[ell(M+N)-h(M-1)_+]_+. Check all boundary cases and then add the strict-crossing implementation.

## Why Promising
This is the newest concrete claimed progress. If correct, it gives an exact local mechanism explaining how old high prices damp later low/high conflicts; if false, finding the failure will immediately refine the two-level program.

## Risks
The claimed formula may fail in edge cases such as M=1, S=0, h<2 ell, or because the proposed primal mixing ignores an active horizon. Strict crossing also needs eta-loss bookkeeping.

## Suggested Lenses
- proof strategy
- counterexample search
- finite LP regression
