## Accepted Progress
- The literal instance-wise “only if” direction is refuted: sparse vanishing spikes give \(\beta(h)=1\) for all \(h\), while the always-zero learner has \(R_T\le1\).
- The sufficiency route survives with explicit assumptions: exogenous public prices, full-information truncated grid rewards, known \(H,K\), and `sup` comparator.
- Promoted clean sufficient conditions using \(T\beta(H)\), payoff-weighted \(T\gamma(H)\), and horizon-tail \(\Delta_T(H)\).

## Candidate Routes
- Formalize the sufficient theorem with the residue-class delayed Hedge proof.
- Replace raw tail necessity with a two-environment indistinguishability lower bound.
- Explore adaptive truncation/skipping and threshold geometry for sharper bounds.

## Refuted Or Weakened Claims
- Original iff is false under instance-wise/process-aware learnability.
- \(\gamma(h)\to0\) and \(\Delta_T(H_T)=o(T)\) are not safe as necessity claims without stronger quantifiers.
- The comparator `max` is unsafe under strict crossing and atoms; future statements should use `sup` or prove attainment.

## Literature Updates
Verified and deduplicated core sources including Joulani-Gyorgy-Szepesvari 2013, Quanrud-Khashabi 2015, Thune-Cesa-Bianchi-Seldin 2019, Zimmert-Seldin 2020, Lancewicki et al. 2021, van der Hoeven-Cesa-Bianchi 2022, Zierahn et al. 2025, and market-making references. Unchecked candidates are marked separately.

Key verified sources include: [Joulani et al. 2013](https://proceedings.mlr.press/v28/joulani13.html), [Quanrud-Khashabi 2015](https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html), [Thune et al. 2019](https://papers.nips.cc/paper_files/paper/2019/hash/0e4f5cc9f4f3f7f1651a6b9f9214e5b1-Abstract.html), [van der Hoeven-Cesa-Bianchi 2022](https://proceedings.mlr.press/v151/van-der-hoeven22a.html), [Zierahn et al. 2025](https://www.jmlr.org/papers/v26/24-0496.html), and [Market Making without Regret](https://proceedings.mlr.press/v291/cesa-bianchi25a.html).

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Write the sufficient theorem cleanly with `sup`, filtration, exogeneity, and delayed full-information assumptions.
2. Formalize CE-001, CE-003, and CE-005 with exact quantifiers.
3. Decide the target quantifier regime before attempting any necessity theorem.