## Accepted Progress
- Promoted a conditional \(\kappa\)-transfer lemma with explicit hypotheses: same prefix action law, payoff factorization, comparator lower bound, outside-surplus cap, and rare-event probability weighting.
- Promoted the multi-threshold zero-block LP dual:
\[
\kappa(C)=\max_{\lambda\in\Delta(C)}\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right),
\]
with local cap \(1/e\).
- Recorded finite-grid strict-crossing caveats: grid \(\kappa\) applies only to grid-restricted learners unless passed through dense-grid or \(\eta\)-comparator limits.

## Candidate Routes
- Prove or refute the finite-support constant \(((m-1)/m)^m\).
- Lift multi-threshold \(\kappa(C)\) to universal block and same-path horizon-oblivious lower bounds with explicit \(M_i+m_i=o(N_i)\) accounting.
- Study known deterministic paths as simultaneous-prefix design problems.

## Refuted Or Weakened Claims
- A positive local \(\kappa\) is not a standalone lower bound.
- The dual threshold distribution is not a hard stochastic instance under pseudo-regret.
- The finite-\(m\) constant is not the value for every fixed threshold set.

## Literature Updates
Verified/imported sources including:
- Maran-Restelli 2026: https://arxiv.org/abs/2605.19584 and COLT page https://learningtheory.org/colt2026/accepted.html
- Ryabchenko-Attias-Roy 2026: https://arxiv.org/abs/2606.11711
- Hu-Tian-Yang 2026: https://arxiv.org/abs/2602.17577
- Frongillo-Luo-Mehta-Schneider 2026: https://arxiv.org/abs/2606.18527
- Roesler-Szentes 2017: https://doi.org/10.1257/aer.20160145
- Shen-Tang-Zeng 2018: https://dl.acm.org/doi/10.5555/3237383.3237926
- Condorelli-Szentes 2020: https://doi.org/10.1086/704574
- Hartline notes: https://jasonhartline.com/MDnA/MDnA-ch4.pdf

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Write LB-016 and LB-017 as polished propositions.
2. Resolve the finite-\(m\) upper bound.
3. Apply the conditional transfer lemma to multi-threshold lower bounds with all outside-reward caps explicit.