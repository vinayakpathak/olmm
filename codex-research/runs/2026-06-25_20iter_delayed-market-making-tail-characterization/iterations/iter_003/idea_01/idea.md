# Prove the concatenated universal block lower bound

ID: idea_01

## Summary
Turn CL-016 into a precise theorem. Fix a universal process-unaware learner, choose dominant deterministic blocks 0^{N_i} c_i with c_i in {1/2,1} and M_i=o(N_i), condition on the fixed prefix and the first N_i zeros, use the finite two-continuation lemma to choose c_i causing at least N_i/4 current-block regret, then prove earlier blocks and pending rewards cost only O(M_i). State separately for anytime learners and horizon-indexed learner families.

## Why Promising
This is the closest current route to a genuine necessity-style statement: it converts the accepted finite indistinguishability gadget into a class-uniform impossibility without reviving the false instance-wise claim.

## Risks
The comparator over the whole prefix is a single fixed quote, so cross-block rewards and previous pending quotes can invalidate a naive per-block regret decomposition. Horizon-aware learner families may require an explicit diagonalization argument.

## Suggested Lenses
- proof strategy
- lower bound formalization
- randomized learner conditioning
