## Accepted Progress
- Promoted the exact deterministic known-path marginal reduction:
  \[
  R_T=V_T^*-\sum_{t<T}\int_{[0,M_{t,T})}x\,d\mu_t(x).
  \]
- Added the finite-prefix LP dual \(D_n(P)\) as an exact left-limit horizon-conflict certificate.
- Added the fixed-envelope compactness criterion: a single formal anytime policy exists iff one fixed sublinear envelope is feasible for every finite-prefix LP.

## Candidate Routes
- Study whether \(D_n=o(n)\) plus a projective/gluing condition gives a true anytime characterization.
- Compute \(D_n\) on standard paths: singleton blocks, \(0^N,1/2,1\), equal-revenue blocks, sparse spikes, and alternating paths.
- Extend the exact LP to stochastic exogenous processes via conditional suffix-max laws and probability-weighted hard histories.

## Refuted Or Weakened Claims
- \(D_n=o(n)\) alone is necessary but not proved sufficient.
- The new LP/compactness results are path-oracle and noncausal, not online algorithms or raw-tail characterizations.
- Strict crossing still requires left-limit or \(\eta_t\)-implementation language.

## Literature Updates
- Added Lagziel-Lehrer 2015, [“Approachability with delayed information”](https://doi.org/10.1016/j.jet.2015.01.010), as delayed-approachability background.
- Added Xie-Zhu-Shishkin 2025, [“On the limitations of data-based price discrimination”](https://doi.org/10.3982/TE5916), as adjacent pricing context.
- Added Bistritz-Zhou-Chen-Bambos-Blanchet 2022, [“No Weighted-Regret Learning in Adversarial Bandits with Delays”](https://www.jmlr.org/papers/v23/20-411.html), as weighted delayed-regret background.

## Working Notes Updated
Updated all requested `working_notes/` files:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Polish CL-035/CL-036/LB-030/LB-031 into theorem-proof blocks.
2. Prove or refute a gluing theorem from \(D_n=o(n)\).
3. Use finite-prefix dual certificates to identify structural horizon-conflict conditions.