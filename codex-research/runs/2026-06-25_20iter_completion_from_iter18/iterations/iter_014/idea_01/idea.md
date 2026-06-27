# Boundary Defect Implies Local Conflict

ID: idea_01

## Summary
Attack the solver's exact obstruction: replace the crude cross-scale boundary term m min(||u||_1,||v||_1) by an intrinsic defect term. For f_t(w)=sup_a a sum_T w_T 1{a<M_{t,T}}, study f_t(u)+f_t(v)-f_t(u+v) on t<m and try to prove that a large total boundary defect itself yields a finite-prefix D_m certificate. A target conditional inequality is: dual mass split across scales can only create large positive Phi if either one side already has positive Phi or the boundary prefix has D_m=Omega(m).

## Why Promising
This directly addresses the gap in iteration 14. If true, recursive dyadic splitting would turn failure of a fixed sublinear envelope into comparable-scale finite-prefix certificates, proving D_n=o(n) suffices.

## Risks
The boundary defect may be large for algebraic reasons that do not imply a local market conflict; a false inequality here would likely be exposed by stable-singleton or alternating paths.

## Suggested Lenses
- proof strategy
- dual localization
- counterexample search
