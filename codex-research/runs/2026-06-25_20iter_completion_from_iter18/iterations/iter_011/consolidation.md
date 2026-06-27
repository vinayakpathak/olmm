## Accepted Progress
Promoted the compact suffix-menu local value formula as CL-032/LB-028 and the compact known-path upper theorem as CL-033/LB-029:
\[
R_T\le \sum_{t<T}\delta(C_t)+o(T)
\]
for deterministic known exogenous paths, with explicit path-oracle, horizon-oblivious, `sup` comparator, exogeneity, and strict-crossing \(\eta\)-implementation assumptions.

## Candidate Routes
Polish CL-032/LB-028 into a proof block via finite compact approximations and root convergence. Keep the direct infinite dual survival law as optional until fully audited.

## Refuted Or Weakened Claims
Recorded CL-034/CE-018/FA-023: \(\sum_{t<T}\delta(C_t)=o(T)\) is not necessary. The alternating path \(1/2,1,1/2,1,\ldots\) has linear suffix-menu sum but admits \(o(T)\) regret by quoting near \(1\).

Also recorded FA-024: arbitrary dense finite submenus do not give pointwise successor convergence everywhere.

## Literature Updates
Added two verified adjacent robust-pricing sources, both marked as context only, not proof support:
- Kocyigit, Rujeerapaiboon, Kuhn 2022, DOI: https://doi.org/10.1007/s10107-021-01615-4
- Wang, Liu, Zhang 2024, DOI: https://doi.org/10.1287/msom.2023.0072

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Write the compact local theorem carefully with left-limit versus strict-crossing actions separated.
2. Write the known-path suffix-menu theorem as a clean sufficient condition.
3. Search for a less loose path-dependent quantity using CE-018 as the first stress test.