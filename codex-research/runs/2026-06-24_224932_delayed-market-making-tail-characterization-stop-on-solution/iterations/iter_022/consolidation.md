## Accepted Progress
- Consolidated iter_022 as “unsolved, but useful progress.”
- Accepted the single-account fractional wealth depletion stress test for the two-arm delayed-advantage route.
- Accepted the limited-leakage Bayes calculation only as an abstract block-local diagnostic, not a market lower bound.
- Recorded the actual same-level market coupling curve $g_{\theta,n}(a)=a[1-(1-r_{\theta,a})^n]$.

## Candidate Routes
- Try interval/restart solvency-constrained testers for two-arm delayed advantage.
- Compute the exact same-level market Bayes value before claiming any limited-leakage lower bound.
- Search for localization gadgets that prevent cross-block hits while preserving one fixed comparator quote.

## Refuted Or Weakened Claims
- Refuted the no-restart fractional-capital rule $q_t=C_t/2$ as a solution to delayed advantage.
- Rejected direct transfer from block-local limited-leakage lower bounds to the delayed-market protocol.
- Reaffirmed that the $\mathrm{ba}$ dual is a value characterization, not a scalar tail iff or matching-rate theorem.

## Working Notes Updated
Updated:
- `working_notes/canonical_summary.md`
- `working_notes/claim_ledger.md`
- `working_notes/lemma_bank.md`
- `working_notes/failed_attempts.md`
- `working_notes/counterexamples.md`
- `working_notes/literature_map.md`
- `working_notes/promising_directions.md`
- `working_notes/bibliography.md`
- `working_notes/iteration_summaries.md`

## Next Iteration Focus
1. Prove/refute interval-restart testers with total exposure $q_t\le1$.
2. Compute $V_\theta^G=\max_{a\in G}D\sum_{n=1}^N a[1-(1-r_{\theta,a})^n]$.
3. Formalize the $(q,\gamma,\kappa)$ one-block perturbation constraints.
4. If prioritizing theorem hygiene, finish the $\mathrm{ba}$ dual proof and Borel bridge obligations.