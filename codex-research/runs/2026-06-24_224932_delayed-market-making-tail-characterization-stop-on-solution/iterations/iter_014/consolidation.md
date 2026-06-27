## Accepted Progress
- Promoted the last-exceedance identity: $\sum_t r_t(a)=a(L_a-1)_+$.
- Promoted the two-arm fast/slow delay reduction to delayed advantage control: $R_F=-A_T$, $R_S=S_T-A_T$.
- Promoted the corrected horizon-censored nested-window increment formula.

## Candidate Routes
- Prove/refute the delayed advantage inequalities via safe delayed wealth/coin-betting.
- Develop a nested-window oracle using expected comparator values, then test it on small finite reward tables.
- Use last-exceedance calculus for truncation/value-tail rewrites without treating it as a full characterization.

## Refuted Or Weakened Claims
- Iteration 14 does not prove heterogeneous-delay experts or tail-adaptive truncation.
- The two-arm result does not yet imply the many-arm dyadic-window theorem.
- The nested-window reduction must not mix pathwise comparator maxima with expected $\delta_T^P(H)$.
- The initial nested increment formula needed a finite-horizon cutoff.

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Settle the two-arm delayed advantage theorem with exact feedback timing.
2. Test the expected nested-window oracle on two-window adversarial examples.
3. Keep pathwise and expected value conventions separate.
4. Continue noisy common-type/codebook lower-bound work separately from adaptive upper bounds.