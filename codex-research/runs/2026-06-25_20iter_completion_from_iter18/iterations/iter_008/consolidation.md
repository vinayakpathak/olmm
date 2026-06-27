## Accepted Progress
- Promoted CL-026/LB-020: same-path multi-threshold anytime lift. For increasing block \(0^N,c_1,\ldots,c_m\), horizon-oblivious policies satisfy \(\max_j R_{M+N+j}\ge N\kappa(C)-M\).
- Promoted CL-027/LB-021: equal-revenue diagonal same-path lower bound gives one deterministic known path with \(\limsup_T R_T/T\ge 1/e\).
- Added LB-022: equal-revenue primal zero-block certificate matching \(((m-1)/m)^m\).

## Candidate Routes
- Polish CL-026/CL-027 into standalone theorem-proof blocks.
- Solve the primal \(\kappa(C)\) game for arbitrary finite threshold sets.
- Continue the known-path anytime characterization program.

## Refuted Or Weakened Claims
- The old \(N\kappa(C)-M-O(m)\) finite-block bound is too conservative; the \(O(m)\) loss cancels.
- Same-path formula requires increasing threshold order.
- The new lower bound still fails for horizon-aware policies and is not an instance-wise raw-tail characterization.

## Literature Updates
- Added verified calibration analogies: [Kleinberg et al. 2023](https://proceedings.mlr.press/v195/kleinberg23a.html), [Hu-Wu 2024](https://arxiv.org/abs/2404.13503), [Luo-Senapati-Sharan 2024](https://openreview.net/forum?id=7aFRgCC8Q7), [Bairaktari-Hu-Nguyen-Ullman 2026](https://arxiv.org/abs/2605.17749).
- Marked them as analogy/terminology sources only, not proof support for delayed market-making.

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Write the same-path multi-threshold theorem and \(1/e\) corollary cleanly.
2. Characterize primal \(\kappa(C)\) for arbitrary finite \(C\).
3. Test whether local \(\kappa\) can support a broader known-path anytime characterization.