## Accepted Progress
- Full problem remains unsolved; accepted theorem package unchanged.
- Added a conditional adaptive-truncation reduction: it works if a heterogeneous-delay experts lemma gives regret scaling with comparator window $H$.
- Recorded iteration 13 lower-rate diagnostics: naive repeated q-scaled atoms fail via shared-type reveal saturation, independent-bit comparator collapse, and persistent-quote tail-envelope failures.

## Candidate Routes
- Prove/refute comparator-specific heterogeneous-delay experts, starting with a two-expert fast-vs-slow case.
- Analyze noisy common-type lower bounds with exact KL/TV and Bayes-gap calculations.
- Use finite-grid $\Psi_G$ before trying to realize any multi-scale construction as prices.

## Refuted Or Weakened Claims
- Same-level repeated atoms do not preserve a $q$-tail envelope.
- Independent hidden bits do not accumulate linearly against one fixed comparator in the two-quote abstraction.
- Standard max-delay delayed Hedge does not prove tail-adaptive truncation.

## Working Notes Updated
Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Heterogeneous-delay experts lemma.
2. Noisy common-type lower-bound calculation.
3. Persistent-quote effects in any block construction.
4. Keep no-gap/value characterization separate from power-tail lower-rate work.