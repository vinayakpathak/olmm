## Accepted Progress
- Accepted the finite-class positive-part value equivalence:
$$
  |(\mathcal R_T^{[0,1]})_+-(\sup_\pi \Psi_{G_T}(\pi))_+|\le 1
$$
  for finite public-exogenous classes, randomized policies, and $G_T=\{0,1/T,\ldots,(T-1)/T\}$.
- Formalized the tiny-price deterministic counterexample: raw infinite-process $\beta(h)=1$ for all finite $h$, but the fixed-comparator value is uniformly bounded, so zero quoting has $O(1)$ regret.

## Candidate Routes
- Write the finite-grid identity, grid-to-continuum comparison, and positive-part finite-class equivalence as a theorem package.
- Extend or approximate the finite-class value characterization for infinite classes.
- Continue multi-scale or limited-leakage Bayes-gap lower-bound work for power-tail rates.

## Refuted Or Weakened Claims
- The finite-class equivalence is not a scalar tail characterization, exact continuum $\Psi$ formula, or infinite-class theorem.
- Raw delay probability is further weakened as a necessity candidate: it can fail purely because long-delay rewards have tiny payoff scale.
- The optional tiny-price claim $\sup_T\Delta_T(H)=O(1/H)$ remains unproved.

## Working Notes Updated
Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Draft final theorem statements for the finite-class value equivalence and $\delta_T(H)$ upper theorem.
2. Work on infinite-class extensions or finite-subclass reductions.
3. Build multi-scale or limited-leakage lower bounds.
4. Formalize rare-history essential-sup versus average-truncation separation.