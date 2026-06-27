# Iteration Summaries

## Iteration 1

Main outcome: the stated iff is false under the literal instance-wise interpretation. The sparse vanishing-spike process has \(\beta(h)=1\) for all \(h\), but the always-zero learner has \(R_T\le1\).

Accepted progress: the "if" proof can be made rigorous with explicit exogenous/public-price and full-information delayed-grid assumptions. The truncation term can be \(T\beta(H)\), \(T\gamma(H)\), or the sharper horizon-tail \(\Delta_T(H)\). The positive-scale equivalence for \(\gamma\) is sound.

Refuted/weakened: \(\beta\)-necessity, \(\gamma\)-necessity, and \(\Delta_T\)-necessity all fail or are unproved for process-aware instance-level learnability. Comparator `max` is also unsafe under strict crossing; use `sup`.

Next focus: formalize the sufficient theorem and counterexamples, then choose the intended quantifiers. If pursuing necessity, switch to a two-environment indistinguishability lower bound measuring unpredictable, decision-relevant tail mass.


# Iteration 1 Consolidation

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


# Iteration 2 Consolidation

## Accepted Progress
- Promoted the horizon/process-aware collapse: under exogenous policy-independent prices and the problem's pseudo-regret, if a learner may depend on both the law \(P\) and horizon \(T\), it can play an \(\varepsilon_T\)-optimal fixed quote for \(V_T^P(a)\) and get \(R_T^P\le\varepsilon_T=o(T)\) for every process.
- Accepted the finite two-continuation lower bound: for \(0^N c\), \(c\in\{1/2,1\}\), every randomized learner has regret at least \(N/4\) on one continuation, using `sup` comparator or an epsilon-comparator variant.
- Added the sharper comparator-gap truncation penalty \(\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a)\le\Delta_T(H)\), which gives \(R_T\le R_T^H+\Gamma_T(H)\).

## Candidate Routes
- Formalize the concatenated deterministic block-class lower bound with dominant lengths \(M_i=o(N_i)\), careful cross-block reward accounting, and explicit universal/minimax quantifiers.
- Develop a decision-relevant delayed-tail quantity based on indistinguishable continuations, conditional value of information, or argmax stability.
- Translate adaptive skipping/optimism delayed-learning results to the finite-grid market-making reduction.

## Refuted Or Weakened Claims
- Any nontrivial tail necessity claim is vacuous under horizon-aware, process-law-aware pseudo-regret policies.
- The two-continuation construction should not be presented as a hard stochastic mixture under the current regret definition; it is a deterministic-class/minimax lower-bound gadget.
- The lower-bound route does not revive instance-wise necessity, because a process-aware learner may know the deterministic continuation sequence.

## Literature Updates
- Verified and imported Gyorgy-Joulani 2021, Flaspohler et al. 2021, Duetting et al. 2023, Cesa-Bianchi-Gentile-Mansour-Minora 2016, Joulani-Gyorgy-Szepesvari 2016, Cesa-Bianchi-Lugosi 2006, Yao 1977, and Kleinberg-Leighton 2003.
- Updated the literature map to distinguish direct delayed full-information support from adaptive bandit/OCO, threshold-geometry, and minimax-background references.

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Write the sufficient theorem with `sup`, full-information delayed grid feedback, and tail penalties \(T\beta\), \(T\gamma\), \(\Delta_T\), and \(\Gamma_T\).
2. Formalize the horizon/process-aware collapse proposition and state exactly which regret notions and model assumptions it excludes.
3. Prove the finite two-continuation proposition cleanly, then attempt the concatenated universal-class theorem with all quantifiers explicit.


# Iteration 2 Consolidation

## Accepted Progress

- Promoted the horizon/process-aware collapse: under exogenous prices and pseudo-regret, a law-and-horizon-aware learner can play an \(\varepsilon_T\)-optimal fixed quote and get \(o(T)\) regret for every process.
- Accepted the finite two-continuation block lower bound: for \(0^N c\), \(c\in\{1/2,1\}\), every randomized learner has regret at least \(N/4\) on one continuation.
- Added the sharper sufficient truncation gap \(\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a)\le \Delta_T(H)\).

## Candidate Routes

- Formalize the concatenated deterministic block-class lower bound with \(M_i=o(N_i)\).
- Develop a decision-relevant delayed-tail quantity based on indistinguishable continuations or value of information.
- Map adaptive skipping/optimism delayed-learning algorithms to the finite-grid market-making reduction.

## Refuted Or Weakened Claims

- Any nontrivial tail necessity is vacuous under horizon-aware, process-law-aware pseudo-regret policies.
- The two-continuation random mixture should not be presented as a hard stochastic process under the current regret definition.
- The block lower bound is universal/minimax, not instance-wise.

## Literature Updates

Verified/imported sources including [Gyorgy-Joulani 2021](https://proceedings.mlr.press/v139/gyorgy21a.html), [Flaspohler et al. 2021](https://proceedings.mlr.press/v139/flaspohler21a.html), [Duetting et al. 2023](https://proceedings.mlr.press/v202/duetting23b.html), [Cesa-Bianchi et al. 2016](https://proceedings.mlr.press/v49/cesa-bianchi16.html), [Joulani-Gyorgy-Szepesvari 2016](https://doi.org/10.1609/aaai.v30i1.10320), [Cesa-Bianchi-Lugosi 2006](https://cesa-bianchi.di.unimi.it/predbook/), [Yao 1977](https://doi.org/10.1109/SFCS.1977.24), and [Kleinberg-Leighton 2003](https://doi.org/10.1109/SFCS.2003.1238232).

## Working Notes Updated

Updated all requested `working_notes/` files: `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the clean sufficient theorem with `sup`, exogeneity, full-information delayed grid feedback, and penalties \(T\beta\), \(T\gamma\), \(\Delta_T\), \(\Gamma_T\).
2. Formalize the oracle-collapse proposition with exact exclusions.
3. Prove the finite two-continuation proposition cleanly, then attempt the concatenated universal-class theorem.


# Iteration 3 Consolidation

## Accepted Progress

- Kept the solver's main conclusion: the original iff is false under literal instance-wise pseudo-regret, while the delayed-grid sufficiency theorem remains sound under explicit public/exogenous full-information assumptions.
- Promoted two reusable finite lower-bound fragments: a conditional two-continuation lemma with prefix cap, and a same-path two-horizon incompatibility lemma for horizon-oblivious policies on \(0^N,1/2,1\).
- Confirmed that horizon-oblivious, process-aware learning is nontrivial: horizon-aware oracle collapse does not automatically extend to one anytime policy.

## Candidate Routes

- Formalize the concatenated universal/process-unaware block theorem using dominant blocks \(0^{N_i}c_i\), \(c_i\in\{1/2,1\}\), with old learner rewards capped by \(M_i=o(N_i)\).
- Formalize the deterministic known-process, horizon-oblivious concatenation \(0^{N_i},1/2,1\), proving a \(\limsup\) linear-regret obstruction along paired endpoints.
- Replace raw tail conditions by a prefix-compatibility or information-obstruction quantity.

## Refuted Or Weakened Claims

- The concatenated universal lower bound is not yet accepted as a theorem; it still needs exact quantifiers, coupling of randomized learners, induction, and horizon-indexed variants.
- Raw \(\beta\)-necessity remains false even for horizon-oblivious policies because sparse vanishing spikes admit an anytime always-zero learner with \(O(1)\) regret.
- A stochastic mixture of hard continuations remains unsafe under \(\sup_a\mathbb E-\mathbb E\) pseudo-regret.

## Literature Updates

- Verified/imported Esposito et al. 2023, Pike-Burke et al. 2018, Weinberger-Ordentlich 2002, Ryabchenko-Attias-Roy 2026, Zhang et al. 2024, Xu et al. 2025/2026, Abernethy-Bartlett-Hazan 2011, Daniely-Gonen-Shalev-Shwartz 2015, and Hazan-Seshadhri 2009.
- Updated the literature map to distinguish intermediate-observation, adaptive-reduction, censored-threshold, and adaptive-regret sources from direct proof support.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Prove the concatenated universal block theorem with exact process-unaware quantifiers and prefix accounting.
2. Prove the same-path horizon-oblivious concatenation theorem, or find the precise obstruction in the all-prefix accounting.
3. Keep the clean sufficiency theorem and formal counterexamples moving toward polished propositions.


# Iteration 3 Consolidation

## Accepted Progress
Accepted the finite proof fragments from iteration 3: the conditional two-continuation lower bound with a prefix cap, and the same-path two-horizon obstruction on \(0^N,1/2,1\). The clean sufficiency theorem remains accepted only under explicit public/exogenous full-information assumptions.

## Candidate Routes
The concatenated universal block lower bound is now “likely formalizable” but still unproved. The new horizon-oblivious known-process route is also promising: concatenate \(0^{N_i},1/2,1\) blocks to test whether prefix incompatibility forces \(\limsup R_T/T>0\).

## Refuted Or Weakened Claims
Raw \(\beta\)-necessity is still false, even for horizon-oblivious policies, because sparse vanishing spikes admit an anytime always-zero learner. The infinite concatenation arguments were not promoted to proved theorems. Stochastic mixtures remain unsafe under \(\sup_a \mathbb E-\mathbb E\) pseudo-regret.

## Literature Updates
Verified and imported iteration-3 candidates including [Esposito et al. 2023](https://proceedings.mlr.press/v202/esposito23a.html), [Pike-Burke et al. 2018](https://proceedings.mlr.press/v80/pike-burke18a.html), [Weinberger-Ordentlich 2002](https://doi.org/10.1109/TIT.2002.1013136), [Ryabchenko-Attias-Roy 2026](https://arxiv.org/abs/2602.02634), [Zhang et al. 2024](https://openreview.net/forum?id=qaKRfobbTg), [Xu et al. 2025/2026](https://arxiv.org/abs/2502.06168), [Abernethy-Bartlett-Hazan 2011](https://proceedings.mlr.press/v19/abernethy11b.html), [Daniely-Gonen-Shalev-Shwartz 2015](https://proceedings.mlr.press/v37/daniely15.html), and [Hazan-Seshadhri 2009](https://doi.org/10.1145/1553374.1553425).

## Working Notes Updated
Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
Prove the concatenated universal block theorem with exact process-unaware quantifiers and prefix accounting. In parallel, prove or break the same-path horizon-oblivious concatenation theorem. Keep the sufficiency theorem and core counterexamples moving toward polished standalone propositions.


# Iteration 4 Consolidation

## Accepted Progress

- Promoted the concatenated universal/process-unaware block lower bound. For any randomized learner, including a horizon-aware family that is not given the deterministic continuation sequence, there exists a deterministic block sequence \(0^{N_i}c_i\), \(c_i\in\{1/2,1\}\), with \(M_i=o(N_i)\), such that \(R_{T_i}\ge N_i/4-M_i\) at endpoints \(T_i=M_i+N_i+1\). Hence \(\limsup_i R_{T_i}/T_i\ge1/4\).
- Promoted the same-path horizon-oblivious lower bound. On one deterministic known path formed by blocks \(0^{N_i},1/2,1\), any process-aware but horizon-oblivious policy has \(\max\{R_{T_i^0},R_{T_i^1}\}\ge N_i/4-M_i-O(1)\), so \(\limsup_T R_T/T\ge1/4\).
- Preserved the central caveat: these are prefix-incompatibility/universal lower bounds, not instance-wise \(\beta\)-tail necessity theorems.

## Candidate Routes

- Turn the two accepted lower bounds into polished theorem-proof blocks with exact policy models, `sup` comparators or \(\eta\)-comparators, randomized coupling, endpoint feedback order, and old-reward accounting.
- Define a non-tautological prefix-incompatibility or value-of-information modulus that explains why the block examples are hard but sparse vanishing spikes are easy.
- Continue adaptive truncation/skipping sufficiency work using outstanding-observation and skipped-feedback concepts from delayed-bandit literature.

## Refuted Or Weakened Claims

- It remains invalid to read the block lower bounds as instance-wise necessity. Process-aware horizon-specific pseudo-regret policies still collapse the problem, and CE-001 still gives an anytime learner with \(O(1)\) regret despite \(\beta\equiv1\).
- The horizon-oblivious theorem depends on no terminal-round signal. A horizon-aware policy can avoid the same-path prefix conflict by choosing the horizon-optimal quote.
- New literature is adjacent only; none supplies a known theorem characterizing this delayed market-making tail condition.

## Literature Updates

- Verified/imported Graf-Mastrolia 2026, Schlisselberg-Lancewicki-Auer-Mansour 2025, Masoudian-Zimmert-Seldin 2024, Luo-Schapire 2014, Gofer-Mansour 2016, Guzman-Mehta-Mortazavi 2021, and Mannor-Tsitsiklis-Yu 2009.
- Updated the literature map to emphasize outstanding/missing observations, unknown-horizon terminology, and anytime-prefix lower-bound context, while marking these sources as background rather than proof support.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the universal block theorem and same-path horizon-oblivious theorem as clean propositions with full quantifiers.
2. Keep the sufficiency theorem moving toward a final writeup with public/exogenous full-information assumptions and \(\Gamma_T,\Delta_T,\gamma,\beta\) variants.
3. Design and test a prefix-incompatibility/information modulus against CE-001, CE-003, CE-005, and the accepted block obstructions.


# Iteration 4 Consolidation

## Accepted Progress

Promoted two iteration 004 lower bounds to accepted notes:

- Universal/process-unaware block lower bound: for any learner, even horizon-aware family, there is a deterministic block sequence \(0^{N_i}c_i\) with \(\limsup R_T/T \ge 1/4\).
- Same-path horizon-oblivious obstruction: on one deterministic path \(0^{N_i},1/2,1\), any horizon-oblivious policy has linear regret along paired prefixes.

Both are prefix-incompatibility lower bounds, not instance-wise tail characterizations.

## Candidate Routes

- Write both accepted lower bounds as polished theorem-proof blocks.
- Define a useful prefix-incompatibility or value-of-information modulus.
- Continue adaptive truncation/skipping sufficiency using missing/outstanding-observation ideas.

## Refuted Or Weakened Claims

- Still invalid: “\(\beta\not\to0\) implies instance-wise hardness.”
- Still invalid: reading the block lower bounds as a necessity theorem for process-aware learners.
- Horizon-aware oracle policies still collapse pseudo-regret; sparse vanishing spikes still refute raw \(\beta\)-necessity.

## Literature Updates

Verified/imported new sources, including:

- Graf–Mastrolia 2026, arXiv: https://arxiv.org/abs/2601.17247
- Schlisselberg–Lancewicki–Auer–Mansour, NeurIPS 2025: https://proceedings.neurips.cc/paper_files/paper/2025/hash/02f0ac0a323dc17d964d4bbf8a62e01b-Abstract-Conference.html
- Masoudian–Zimmert–Seldin, NeurIPS 2024/OpenReview: https://openreview.net/forum?id=LDzrQB4X5w
- Luo–Schapire 2014: https://proceedings.mlr.press/v32/luo14.html
- Gofer–Mansour 2016: https://doi.org/10.1007/s10994-015-5531-y
- Guzman–Mehta–Mortazavi 2021: https://proceedings.neurips.cc/paper/2021/hash/b7da6669894867f04b8727876a69ffc0-Abstract.html
- Mannor–Tsitsiklis–Yu 2009: https://jmlr.org/beta/papers/v10/mannor09a.html

Marked these as adjacent/background unless directly supporting delayed-feedback terminology.

## Working Notes Updated

Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the two accepted lower bounds formally with exact quantifiers.
2. Keep the clean sufficiency theorem moving toward final form.
3. Test any proposed information/prefix-incompatibility modulus against CE-001, CE-003, CE-005, and the block obstructions.


# Iteration 5 Consolidation

## Accepted Progress

- Accepted the general two-threshold block lemma. For \(0<c_0<c_1\le1\), if the first \(N\) actions have the same law under continuations \(0^N,c_0\) and \(0^N,c_1\), then
\[
\max\{R_{c_0},R_{c_1}\}\ge N\frac{c_0(c_1-c_0)}{c_1}
\]
against comparator suprema. The coefficient is maximized at \(c_0=1/2,c_1=1\), giving the existing \(1/4\) constant.
- This lemma cleanly unifies the finite two-continuation gadget, the universal/process-unaware concatenation, and the same-path horizon-oblivious prefix conflict, without changing their quantifier restrictions.

## Candidate Routes

- Develop the prefix-compatibility modulus \(\kappa_I(\mathcal U)\) as a local simultaneous-payoff feasibility gap. For zero-block thresholds \(\{c_0,c_1\}\), the finite-grid/limit calculation recovers \(c_0(c_1-c_0)/c_1\).
- Prove finite-grid duality first, then add strict-threshold \(\eta\)-comparator limits.
- State any regret-transfer theorem with same-prefix-law assumptions, an outside-surplus cap \(B_u\), and probability weighting for rare prefix events.

## Refuted Or Weakened Claims

- A local positive \(\kappa\) is not a standalone lower bound. Post-divergence learner rewards can compensate the prefix deficit, and rare hard prefixes contribute only their probability to expected regret.
- The two-threshold lemma remains a universal/minimax or horizon-oblivious prefix-incompatibility tool, not an instance-wise tail characterization.
- No iteration-5 report repairs raw \(\beta\)-necessity, \(\gamma\)-necessity, or \(\Delta_T\)-necessity.

## Literature Updates

- Verified/imported Ryabchenko-Attias-Roy 2025 and Masoudian-Zimmert-Seldin 2022 for capacity, skipping, and outstanding-feedback delayed-learning context.
- Verified/imported Blackwell 1956, Sion 1958, Kwon-Perchet 2017, and Kwon 2021 as approachability/minimax/vector-payoff background for the \(\kappa\) program.
- Verified/imported Luo-Senapati-Sharan 2025 as simultaneous-regret analogy, plus Jiang et al. 2025 and Xue-Du-Xu 2025 as adjacent market-making background.
- Left Dugast-Marta-Riva 2026 SSRN as a candidate needing full verification.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the general two-threshold lemma and its two concatenation corollaries as polished theorem-proof blocks.
2. Prove the finite-grid prefix-compatibility dual and the two-threshold formula with strict-threshold cleanup.
3. Test \(\kappa\) against CE-001, CE-003, CE-005, CE-006, CE-011, and the accepted block lower bounds before proposing any global information-tail condition.


# Iteration 5 Consolidation

## Accepted Progress
Accepted the general two-threshold block lemma:
\[
\max\{R_{c_0},R_{c_1}\}\ge N\frac{c_0(c_1-c_0)}{c_1},
\]
with optimal constant \(1/4\) at \(c_0=1/2,c_1=1\). This unifies the existing finite block and same-path prefix-conflict arguments, without changing their quantifier caveats.

## Candidate Routes
Recorded the prefix-compatibility modulus \(\kappa_I(\mathcal U)\) as a promising local LP/duality object. It recovers the two-threshold coefficient on zero blocks, but still needs finite-grid duality, strict-threshold cleanup, outside-surplus accounting, and rare-event probability weighting.

## Refuted Or Weakened Claims
A positive local \(\kappa\) is not a standalone lower bound. Post-divergence rewards and rare hard-prefix events can erase or dilute the local obstruction. No iteration-5 report repairs raw \(\beta\), \(\gamma\), or \(\Delta_T\) necessity.

## Literature Updates
Imported verified adjacent sources including Ryabchenko-Attias-Roy 2025, Masoudian-Zimmert-Seldin 2022, Blackwell 1956, Sion 1958, Kwon-Perchet 2017, Kwon 2021, Luo-Senapati-Sharan 2025, Jiang et al. 2025, and Xue-Du-Xu 2025. Dugast-Marta-Riva 2026 SSRN remains marked as needing verification.

Sources checked include: https://proceedings.mlr.press/v291/ryabchenko25a.html, https://arxiv.org/abs/2206.14906, https://openreview.net/forum?id=Ib4ZXPXpss, https://doi.org/10.1609/aaai.v39i20.35492, https://arxiv.org/abs/2505.12465, https://proceedings.mlr.press/v54/kwon17a.html, and https://jmlr.org/papers/v22/20-1019.html.

## Working Notes Updated
Updated all requested `working_notes/` files: `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Write the general two-threshold lemma and both concatenation corollaries as polished theorem-proof blocks.
2. Prove finite-grid \(\kappa\) duality and the two-threshold formula rigorously.
3. Test \(\kappa\) against CE-001, CE-003, CE-005, CE-006, CE-011, and the accepted block obstructions before proposing any global information-tail condition.


# Iteration 6 Consolidation

## Accepted Progress

- Promoted a conditional \(\kappa\)-transfer lemma as a reusable lower-bound bookkeeping tool. It requires same conditional prefix action laws, payoff factorization, comparator prefix lower bounds, outside-surplus caps, and probability weighting for rare prefix events.
- Promoted the multi-threshold zero-block LP dual:
\[
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right).
\]
For arbitrary threshold laws on \([0,1]\), the local welfare-minus-posted-revenue gap is at most \(1/e\), approached by equal-revenue tails.
- Recorded finite-grid strict-crossing caveats: grid \(\kappa\) lower-bounds only grid-restricted learners unless a dense-grid or \(\eta\)-comparator limit is taken.

## Candidate Routes

- Prove the sharp finite-support constant \(((m-1)/m)^m\) for the best \(m\)-threshold local gap, or demote it if the missing upper bound fails.
- Lift multi-threshold \(\kappa(C)\) to universal block lower bounds and same-path horizon-oblivious lower bounds, with explicit old-reward and intermediate-round caps such as \(M_i+m_i=o(N_i)\).
- Study known deterministic paths as simultaneous-prefix design problems to understand the process-aware horizon-oblivious regime.

## Refuted Or Weakened Claims

- A positive local \(\kappa\) remains insufficient by itself; suffix compensation and rare-prefix dilution must be controlled.
- The dual distribution over thresholds is not a hard stochastic process under the current pseudo-regret. It is a minimax certificate over deterministic continuations.
- The finite-\(m\) constant is not the value for every fixed \(m\)-threshold set; e.g. two thresholds \(\{0.9,1\}\) have gap \(0.09\), not \(1/4\).

## Literature Updates

- Verified/imported Maran-Restelli 2026 for adjacent order-book-feedback market making, Ryabchenko-Attias-Roy 2026 for capacity-constrained delayed OCO, Hu-Tian-Yang 2026 and Frongillo-Luo-Mehta-Schneider 2026 for simultaneous-objective analogies, and Roesler-Szentes 2017, Shen-Tang-Zeng 2018, Condorelli-Szentes 2020, and Hartline's notes for equal-revenue posted-price geometry.
- These sources support terminology and analogies for adaptive delayed learning, simultaneous feasibility, and \(1/e\) equal-revenue geometry. None provides a direct delayed market-making tail characterization.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write LB-016 and LB-017 as polished propositions with exact action-domain and strict-crossing conventions.
2. Prove or refute the finite-\(m\) upper bound \(((m-1)/m)^m\).
3. Apply the conditional transfer lemma to multi-threshold universal and same-path lower bounds, keeping all outside-reward caps explicit.


# Iteration 6 Consolidation

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


# Iteration 7 Consolidation

## Accepted Progress

- Promoted the finite-\(m\) equal-revenue theorem. If \(Z\in[0,1]\) has at most \(m\) positive support points and \(\rho(Z)=\sup_a a\Pr(Z>a)\), then
\[
\mathbb EZ-\rho(Z)\le \left(\frac{m-1}{m}\right)^m.
\]
The sharp example is the discrete equal-revenue law \(c_i=r^{m-i}\), \(\Pr(Z\ge c_i)=r^{i-1}\), \(r=(m-1)/m\). Strict crossing requires `sup`/left-limit revenue language.
- Accepted the finite multi-continuation terminal-block lower bound for universal/process-unaware quantifiers:
\[
\max_{c\in C}R_c\ge N\kappa(C)-M.
\]
For equal-revenue \(m\)-point menus this gives \(((m-1)/m)^m\), and diagonalizing \(m_i\to\infty\) gives a universal terminal-block constant approaching \(1/e\).

## Candidate Routes

- Write the finite-\(m\) theorem as a polished proposition with base cases, zero-atom conditioning, scaling, low-value collapse, and AM-GM.
- Prove the same-path multi-threshold anytime lift on \(0^N,c_1,\ldots,c_m\), with explicit intermediate-threshold reward bookkeeping.
- Derive the primal optimizer for the finite equal-revenue zero-block game and test whether it informs a known-path simultaneous-prefix framework.
- Build a rare-event multi-threshold stress test to show why local/essential-sup hardness must be probability-weighted.

## Refuted Or Weakened Claims

- The finite-\(m\) dual law is still not a hard stochastic process under \(\sup_a\mathbb E-\mathbb E\) pseudo-regret.
- The constant \(((m-1)/m)^m\) is not the gap of every fixed \(m\)-threshold set; e.g. \(\{0.9,1\}\) has two-threshold gap \(0.09\).
- Any lift from local \(\kappa\) to regret still requires same-prefix action laws and outside-surplus caps.

## Literature Updates

- Added verified adjacent sources: Bergemann-Brooks-Morris 2015, Bergemann-Schlag 2008, Chen-Hu-Wang 2024, Cummings-Devanur-Huang-Wang 2020, and Ko-Munagala 2022/2024.
- No direct source for the exact finite-positive-support constant was found; current notes treat it as an internal AM-GM result.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Polish CL-023/LB-018 and CL-025/LB-019 into theorem-proof blocks.
2. Formalize the \(1/e\) universal terminal-block diagonal construction.
3. Work on the same-path multi-threshold anytime lift, keeping the \(O(m)\) intermediate-round terms explicit.


# Iteration 7 Consolidation

## Accepted Progress
Promoted the finite-\(m\) equal-revenue theorem: for \(Z\in[0,1]\) with at most \(m\) positive support points,
\[
\mathbb EZ-\sup_a a\Pr(Z>a)\le \left(\frac{m-1}{m}\right)^m.
\]
Also accepted the finite multi-continuation terminal-block lift for universal/process-unaware lower bounds, with constants approaching \(1/e\) via \(m\to\infty\).

## Candidate Routes
Same-path multi-threshold anytime lift remains promising but not proved; it still needs intermediate threshold-round bookkeeping. Primal equal-revenue action laws and rare-event multi-threshold stress tests are now good next targets.

## Refuted Or Weakened Claims
Recorded that the finite-\(m\) dual law is not a hard stochastic process under pseudo-regret. Also added warnings: strict crossing needs left limits, zero atoms must be handled separately, and the sharp constant is not the value of every fixed \(m\)-threshold set.

## Literature Updates
Added verified adjacent sources: Bergemann-Brooks-Morris 2015, Bergemann-Schlag 2008, Chen-Hu-Wang 2024, Cummings-Devanur-Huang-Wang 2020, and Ko-Munagala 2022/2024. No direct source for the exact finite-support constant was found; notes mark it as an internal AM-GM result.

Sources checked include: https://doi.org/10.1257/aer.20130848, https://doi.org/10.1162/JEEA.2008.6.2-3.560, https://doi.org/10.1287/opre.2022.0016, https://doi.org/10.1137/1.9781611975994.149, https://doi.org/10.1145/3490486.3538335.

## Working Notes Updated
Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Polish CL-023/LB-018 and CL-025/LB-019 into theorem-proof blocks.
2. Formalize the \(1/e\) universal terminal-block diagonal construction.
3. Prove or break the same-path multi-threshold anytime lift with explicit \(O(m)\) terms.


# Iteration 8 Consolidation

## Accepted Progress

- Promoted the same-path multi-threshold anytime lift. For a deterministic known block
\[
0^N,c_1,\ldots,c_m,\qquad 0<c_1<\cdots<c_m\le1,
\]
after an old prefix of length \(M\), any process-aware but horizon-oblivious policy satisfies
\[
\max_j R_{M+N+j}\ge N\kappa(C)-M.
\]
The intermediate threshold-round learner rewards cancel against the comparator's extra threshold-round opportunities; no finite \(O(m)\) loss is needed.
- Promoted the equal-revenue same-path diagonal corollary. With blocks \(0^{N_i},C_i\), equal-revenue menus \(m_i\to\infty\), and \(M_i+m_i=o(N_i)\), one deterministic known path forces every horizon-oblivious policy to have
\[
\limsup_T R_T/T\ge1/e.
\]
- Added the equal-revenue primal zero-block certificate: uniform mass on quotes just below the equal-revenue thresholds gives the matching local deficit \(((m-1)/m)^m\).

## Candidate Routes

- Polish CL-026/CL-027 and LB-020/LB-021 as theorem-proof blocks with all assumptions visible: increasing thresholds, horizon-oblivious policy, `sup` comparators, and single-fill rewards.
- Use the equal-revenue primal certificate as a starting point for the arbitrary finite-\(C\) primal minimax problem and for known-path anytime upper/characterization attempts.
- Continue developing probability-weighted decision-relevant tail or prefix-compatibility moduli; the new calibration references are useful analogies only.

## Refuted Or Weakened Claims

- The old \(N\kappa(C)-M-O(m)\) same-path finite-block bound is weakened as unnecessarily conservative; the accepted finite bound is \(N\kappa(C)-M\).
- The same-path formula is invalid for unsorted threshold order unless one rewrites it in terms of running maxima.
- The result fails for horizon-aware policies and remains unrelated to instance-wise raw-tail necessity.

## Literature Updates

- Verified/imported four calibration and simultaneous-objective analogies: Kleinberg-Paes Leme-Schneider-Teng 2023 on U-calibration, Hu-Wu 2024 on Calibration Decision Loss, Luo-Senapati-Sharan 2024 on multiclass U-calibration, and Bairaktari-Hu-Nguyen-Ullman 2026 on actionable/testable calibration.
- No direct external theorem was found for the same-path multi-threshold delayed-market-making lift; CL-026/CL-027 remain internal results.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the accepted same-path multi-threshold theorem and \(1/e\) diagonal corollary in polished form.
2. Solve or characterize the primal local \(\kappa(C)\) game for arbitrary finite threshold sets.
3. Test whether local \(\kappa\) lower bounds can support any known-path anytime upper/lower characterization beyond block gadgets.


# Iteration 8 Consolidation

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


# Iteration 9 Consolidation

## Accepted Progress

- Promoted the explicit finite-menu local formula. For \(C=\{0<c_1<\cdots<c_m\}\), \(c_0=0\), and
\[
F_C(\delta)=\sum_i\frac{(c_i-\delta)_+-(c_{i-1}-\delta)_+}{c_i},
\]
the unique root \(F_C(\delta_*)=1\) equals \(\kappa(C)\) as a local infimum value. The primal uses left-limit weights on \(c_i^-\), and the dual is a truncated equal-revenue law on the active suffix \(c_i>\delta_*\).
- Promoted the universal equal-revenue upper bound. The randomized horizon-oblivious policy with density \(d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da\) satisfies \(R_T\le(T-1)/e\) on every deterministic exogenous path.
- Combining this upper bound with CL-027 gives the sharp worst-case deterministic known-path horizon-oblivious constant \(1/e\), for randomized policies and expected regret with `sup` comparators.

## Candidate Routes

- Polish CL-028/LB-023 as a standalone finite-\(C\) local theorem with boundary cases, left-limit actions, and \(\eta\)-implementation.
- Polish CL-029/LB-024 as the sharp known-path \(1/e\) theorem with exact quantifier order.
- Develop the path-dependent suffix-menu bound \(R_T\le\sum_{t<T}\delta(C_t)\), using CL-028 for finite menus and adding infinite-menu approximation.

## Refuted Or Weakened Claims

- The finite-menu primal law is generally not attained under strict crossing; it is an infimum/left-limit result.
- The \(1/e\) upper bound requires exogenous prices and randomized policies as stated. Endogenous/reactive prices and deterministic-only policies are separate models.
- The new upper bound is a worst-case anytime result, not a raw-tail characterization. Sparse easy paths can have much smaller regret.

## Literature Updates

- Verified/imported Bergemann-Schlag 2011, "Robust Monopoly Pricing," as adjacent robust/minimax-pricing context.
- Verified/imported Caldentey-Liu-Lobel 2017, "Intertemporal Pricing Under Minimax Regret," as dynamic minimax-pricing background for future known-path upper work.
- Verified/imported Anagnostides-Farina-Fishelson-Luo-Schneider 2026, "Swap Regret Minimization Through Response-Based Approachability," as a weak simultaneous-regret/approachability analogy.
- No direct external source was found for the exact finite-\(C\) root formula or the delayed-market-making \(1/e\) theorem; both are currently internal results.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the finite-\(C\) local theorem and the known-path \(1/e\) theorem as polished propositions.
2. Add an infinite-menu approximation lemma for the suffix-menu upper framework.
3. Investigate deterministic-only horizon-oblivious policies and whether randomization can be replaced by an explicit cycle.


# Iteration 9 Consolidation

## Accepted Progress

Promoted the finite-menu local formula: for finite \(C\), \(\kappa(C)=\delta_*(C)\), where \(\delta_*\) is the unique root of the iteration-9 \(F_C(\delta)=1\) equation. Recorded the left-limit/\(\eta\)-implementation caveat.

Promoted the universal equal-revenue upper bound: randomized horizon-oblivious quotes from density \(a^{-1}1\{e^{-1}\le a\le1\}\,da\) give \(R_T\le (T-1)/e\) on every deterministic exogenous path. Combined with CL-027, this gives the sharp randomized known-path worst-case constant \(1/e\).

## Candidate Routes

Polish CL-028/LB-023 and CL-029/LB-024 into theorem-proof blocks.

Develop the path-dependent suffix-menu upper framework \(R_T\le\sum_{t<T}\delta(C_t)\), with infinite-menu approximation still needed.

## Refuted Or Weakened Claims

Recorded that the finite-menu primal law is not generally attained under strict crossing.

Kept the \(1/e\) upper bound limited to exogenous prices and randomized policies; endogenous/reactive prices and deterministic-only policies remain separate.

No raw-tail necessity claim was revived.

## Literature Updates

Verified/imported as adjacent context only:

- Bergemann-Schlag 2011, “Robust Monopoly Pricing,” DOI: https://doi.org/10.1016/j.jet.2011.10.018
- Caldentey-Liu-Lobel 2017, “Intertemporal Pricing Under Minimax Regret,” DOI: https://doi.org/10.1287/opre.2016.1548
- Anagnostides-Farina-Fishelson-Luo-Schneider 2026, arXiv:2602.06264, https://arxiv.org/abs/2602.06264

No direct external source was found for the finite-\(C\) root formula or the delayed-market-making \(1/e\) theorem.

## Working Notes Updated

Updated all requested files under `working_notes/`:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the finite-\(C\) local theorem and known-path \(1/e\) theorem cleanly.
2. Add infinite-menu approximation for suffix menus.
3. Investigate deterministic-only horizon-oblivious policies and possible cycling/derandomization.


# Iteration 10 Consolidation

## Accepted Progress

- Promoted a nonconstructive deterministic derandomization of the known-path \(1/e\) upper bound. There exists one fixed deterministic horizon-oblivious quote sequence \(a_t\in(e^{-1},1)\) such that, uniformly over every nonincreasing threshold sequence \(c_1\ge\cdots\ge c_n\),
\[
\sum_{t\le n}a_t1\{a_t<c_t\}
\ge
\sum_{t\le n}(c_t-e^{-1})_+
-O(n^{2/3}\sqrt{\log n}).
\]
- Applying this to suffix maxima \(M_{t,T}=\max_{t<s\le T}P_s\) gives, for every deterministic exogenous path,
\[
R_T\le (T-1)/e+O(T^{2/3}\sqrt{\log T}).
\]
Together with the accepted same-path lower bound, the sharp worst-case limsup constant \(1/e\) now holds for deterministic horizon-oblivious policies as well as randomized ones, in the nonconstructive existence sense.

## Candidate Routes

- Write the derandomization lemma as a polished proposition with explicit events, grid size \(m_n=\lceil n^{1/3}\rceil\), Hoeffding constants, and Borel-Cantelli diagonalization.
- Optional: replace the elementary grid proof by a monotone-bracketing proof to remove the \(\sqrt{\log n}\) factor, but only after proving or citing the exact bracketing theorem.
- Seek an explicit low-discrepancy, cycling, or conditional-expectation construction for the deterministic sequence.
- Continue the path-dependent suffix-menu framework and infinite-menu approximation, now separate from the worst-case \(1/e\) theorem.

## Refuted Or Weakened Claims

- The iteration-10 result is not a solution to the original tail-characterization problem. The original iff remains false under the established counterexamples and oracle-collapse obstruction.
- The theorem remains limited to exogenous/pathwise prices, strict crossing, single-fill rewards, horizon-oblivious policies, and `sup` comparators. Endogenous/reactive prices are outside the proof.
- A naive VC-uniform-convergence route is not the right proof strategy for monotone time-varying thresholds; use the grid or monotone-bracketing argument.

## Literature Updates

- Added verified proof-technology references: Hoeffding 1963 for bounded-sum concentration; Alon-Spencer 2016 for probabilistic-method background; van der Vaart-Wellner 1996 and Gao-Wellner 2007 for empirical-process/monotone-bracketing context; Niederreiter 1992 for possible explicit low-discrepancy replacements; and Vapnik-Chervonenkis 1971 as background only.
- No external delayed-market-making source was found for the deterministic \(1/e\) derandomization; treat it as an internal result.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Polish CL-031/LB-026/LB-027 into a standalone theorem-proof block.
2. Decide whether to pursue a constructive deterministic sequence or stop at nonconstructive existence.
3. Continue the finite/infinite suffix-menu path-dependent characterization without conflating it with raw delay-tail necessity.


# Iteration 10 Consolidation

## Accepted Progress

Promoted iteration 10’s deterministic derandomization of the known-path \(1/e\) upper bound. The accepted statement is narrow: there exists a nonconstructive deterministic horizon-oblivious quote sequence with
\[
R_T \le (T-1)/e + O(T^{2/3}\sqrt{\log T})
\]
on every deterministic exogenous path. Together with the existing lower bound, the sharp deterministic-policy worst-case limsup constant is also \(1/e\).

## Candidate Routes

Next useful work is to polish CL-031/LB-026/LB-027 into a standalone theorem-proof block, then decide whether to pursue an explicit low-discrepancy or cycling construction. The sharper \(O(n^{2/3})\) bracketing route remains optional until written carefully.

## Refuted Or Weakened Claims

Recorded that this does not solve the original iff or any raw-tail necessity problem. Also recorded that a naive VC proof is unsafe for the monotone time-varying threshold class.

## Literature Updates

Added verified proof-technology references: Hoeffding 1963, Alon-Spencer 2016, van der Vaart-Wellner 1996, Gao-Wellner 2007, Niederreiter 1992, and Vapnik-Chervonenkis 1971. Key links include:
https://doi.org/10.1080/01621459.1963.10500830, https://doi.org/10.1007/978-1-4757-2545-2, https://doi.org/10.1016/j.jmva.2006.09.003, https://doi.org/10.1137/1.9781611970081, https://doi.org/10.1137/1116025.

## Working Notes Updated

Updated all requested files under `working_notes/`: canonical summary, claim ledger, lemma bank, failed attempts, counterexamples, literature map, promising directions, bibliography, and iteration summaries.

## Next Iteration Focus

1. Polish the deterministic derandomization theorem.
2. Decide whether explicit construction matters.
3. Continue the suffix-menu/path-dependent characterization without conflating it with raw delay-tail necessity.


# Iteration 11 Consolidation

## Accepted Progress

- Promoted the compact suffix-menu local value formula. For compact \(C\subset[0,1]\), \(C_+=C\cap(0,1]\), \(m=\max C_+\), and successor \(s_C(x)=\min(C_+\cap[x,m])\), the left-limit local value is \(\delta(C)\), where
\[
\int_{\delta(C)}^m \frac{dx}{s_C(x)}=1.
\]
Actual strict-crossing quotes implement the value only up to \(\eta\)-errors.
- Promoted the compact suffix-menu known-path upper theorem. For deterministic known exogenous paths,
\[
R_T\le\sum_{t<T}\delta(C_t)+o(T),\qquad
C_t=\overline{\{M_{t,T'}:T'>t\}},
\]
provided the learner is path-aware, horizon-oblivious, and uses summably accurate local implementations.

## Candidate Routes

- Polish the compact local theorem via finite compact approximations/Hausdorff submenus and root convergence; postpone the explicit infinite dual survival law unless needed for exposition.
- Write the strict-crossing implementation as a separate corollary from the formal left-limit theorem.
- Investigate whether any sharper known-path characterization can use the exact comparator \(\sup_a\sum_t a1\{a<M_{t,T}\}\) rather than the loose upper bound \(\sum_tM_{t,T}\).

## Refuted Or Weakened Claims

- Refuted necessity of \(\sum_{t<T}\delta(C_t)=o(T)\). On the alternating path \(P_{2k-1}=1/2,\ P_{2k}=1\), the suffix-menu sum is linear, but quoting \(1-\varepsilon_t\) with vanishing average \(\varepsilon_t\) has \(o(T)\) regret.
- Rejected the naive proof claim that arbitrary finite dense submenus give pointwise successor convergence everywhere. Use a.e. convergence/root convergence or finite lower-net arguments.
- The compact suffix-menu theorem remains path-oracle and exogenous; it is not an online universal algorithm and does not revive raw-tail necessity.

## Literature Updates

- Added verified adjacent robust-pricing sources: Kocyigit-Rujeerapaiboon-Kuhn 2022, "Robust Multidimensional Pricing: Separation Without Regret," DOI https://doi.org/10.1007/s10107-021-01615-4; and Wang-Liu-Zhang 2024, "Minimax Regret Robust Screening with Moment Information," DOI https://doi.org/10.1287/msom.2023.0072.
- Marked both as analogy/context for minimax pricing, LP structure, and finite approximation; neither is direct proof support for delayed market making.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Turn CL-032/LB-028 into a polished proposition-proof block with compact approximation and strict-crossing details.
2. Turn CL-033/LB-029 into a known-path theorem and corollary for \(\sum_t\delta(C_t)=o(T)\).
3. Study whether a less loose path-dependent quantity can characterize known-path anytime regret, using CE-018 as the first stress test.


# Iteration 11 Consolidation

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


# Iteration 12 Consolidation

## Accepted Progress

- Promoted the exact marginal reduction for deterministic known exogenous paths: for \(M_{t,T}=\max_{t<s\le T}P_s\), horizon-oblivious randomized expected regret is
\[
R_T=V_T^*-\sum_{t<T}\int_{[0,M_{t,T})}x\,d\mu_t(x),
\qquad
V_T^*=\sup_b\sum_{t<T}b1\{b<M_{t,T}\}.
\]
This fixes the looseness in the iteration-11 suffix-menu bound by comparing to the exact fixed-comparator value.
- Promoted the finite-prefix dual \(D_n(P)\) as a left-limit/infimum theorem:
\[
D_n(P)=
\max_{\lambda\in\Delta_n}
\left[
\sum_{T\le n}\lambda_TV_T^*
-
\sum_{t<n}\sup_a\sum_{T>t}\lambda_Ta1\{a<M_{t,T}\}
\right].
\]
Large \(D_n\) gives valid horizon-oblivious lower-bound certificates.
- Promoted the fixed-envelope compactness criterion: one formal \(o(T)\)-regret marginal sequence exists iff some fixed sublinear envelope \(e_T=o(T)\) is feasible for every finite-prefix LP. Actual strict-crossing policies follow by \((1-\eta_t)\)-shrinking with \(\sum_{t<T}\eta_t=o(T)\).

## Candidate Routes

- Use \(D_n(P)\) as the exact finite-prefix horizon-conflict modulus and compute it on standard test paths.
- Investigate whether \(D_n=o(n)\) plus an additional projective or interval-consistency condition implies an infinite anytime policy.
- Develop readable sufficient conditions between stable one-quote optimality and the full LP: finite stable quote menus, slowly varying comparator argmax, or small dual conflict mass.
- Extend the exact LP carefully to stochastic exogenous processes through conditional suffix-max laws and probability-weighted hard histories.

## Refuted Or Weakened Claims

- The naive compactness route from \(D_n=o(n)\) alone is not proved. It is necessary, but finite-prefix optimizers may be incompatible across \(n\).
- The exact LP/compactness results are noncausal path-oracle statements, not online algorithms and not raw delay-tail characterizations.
- Strict crossing still forces left-limit or \(\eta\)-implementation language; formal mass at a threshold is not an attained literal quote.

## Literature Updates

- Verified and added Lagziel-Lehrer 2015, "Approachability with delayed information," as delayed-approachability background for vector-deficit formulations.
- Verified and added Xie-Zhu-Shishkin 2025, "On the limitations of data-based price discrimination," as adjacent data-driven pricing/minimax context.
- Verified and added Bistritz-Zhou-Chen-Bambos-Blanchet 2022, "No Weighted-Regret Learning in Adversarial Bandits with Delays," as delayed weighted-regret background relevant to horizon-weighted certificates.
- No direct external source was found for the deterministic known-path finite-prefix dual or compactness criterion.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write CL-035/CL-036/LB-030/LB-031 as polished theorem-proof blocks.
2. Search for a path separating \(D_n=o(n)\) from the fixed-envelope compactness criterion, or prove a gluing theorem.
3. Dualize and compute finite-prefix examples to identify interpretable horizon-conflict certificates.


# Iteration 12 Consolidation

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


# Iteration 13 Consolidation

## Accepted Progress

- Added the last-exceedance representation for deterministic known paths:
\[
\sum_{t<T}b1\{b<M_{t,T}\}=b(L_b(T)-1)_+,\qquad
L_b(T)=\max\{s\le T:P_s>b\}.
\]
This rewrites exact comparator values and exposes more structure than generic monotonicity of \(M_{t,T}\).
- Added a prefix-splicing robustness bound: changing only the first \(m\) marginal laws changes any later horizon deficit by at most \(m\). This is an upper bound on damage, not an unavoidable cost.
- Recorded the increasing-block finite-prefix stress test:
\[
0^N,c_1,\ldots,c_m
\quad\Rightarrow\quad
N\kappa(C)\le D_{N+m}\le N\kappa(C)+m,
\]
with exact equality for \(m=2\) in the formal left-limit model.

## Candidate Routes

- Prove or refute a dyadic dual-localization theorem: if no fixed sublinear envelope exists, force a finite-prefix dual certificate on comparable-scale horizons and hence \(D_n=\Omega(n)\).
- Work first in finite price alphabets/formal left-limit actions and rewrite dual terms using last-exceedance sets \(t<L_a(T)\).
- Compute \(D_n\) on moving-scale and non-block interleaving paths where no single conflict dominates.

## Refuted Or Weakened Claims

- No proof of \(D_n=o(n)\Rightarrow o(T)\) was found. Generic compactness is still insufficient.
- The abstract parity obstruction is not a market counterexample; it only shows scalar finite-prefix values alone are insufficient in arbitrary compact feasibility problems.
- The simple separated-block market parity attempt does not separate \(D_n=o(n)\) from fixed-envelope feasibility; old conflicts appear diluted when the later horizon is far away.

## Literature Updates

- Added verified approachability/vector-feasibility background: Dann-Mansour-Mohri-Schneider-Sivan 2025; Mannor-Perchet-Stoltz 2014; Lehrer 2002/2003 and 2003; Bernstein-Shimkin 2015.
- Added verified uniform-value/gluing background: Mertens-Neyman 1981; Renault 2011; Li-Venel 2016.
- Added Flesch-Laraki-Perchet 2016 as weak quitting-games approachability background.
- None of these sources proves the delayed-market-making finite-prefix LP, the gluing conjecture, or a market-path separator.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Prove or refute dyadic dual localization in a finite alphabet model.
2. Compute \(D_n\) for moving-scale block paths and non-block low/high interleavings.
3. Formalize the separated-block all-horizon calculation only if it helps the gluing/separator question.


# Iteration 13 Consolidation

## Accepted Progress

Added iteration 13 synthesis: last-exceedance comparator representation, prefix-splicing bound, and the increasing-threshold \(D_n\) sandwich
\[
N\kappa(C)\le D_{N+m}\le N\kappa(C)+m,
\]
with exact \(m=2\) left-limit value.

## Candidate Routes

The main open route is dyadic dual localization: show failure of a fixed envelope forces a comparable-scale finite-prefix dual certificate. I also recorded finite alphabet LP experiments and non-block interleaving paths as the next useful stress tests.

## Refuted Or Weakened Claims

No proof of \(D_n=o(n)\Rightarrow o(T)\) was found. Generic compactness is still too weak. The abstract parity obstruction is not a market counterexample, and the simple separated-block market parity attempt appears diluted rather than hard.

## Literature Updates

Added verified background sources only, not proof support: [Dann et al. 2025](https://proceedings.mlr.press/v291/dann25a.html), [Mannor-Perchet-Stoltz 2014](https://jmlr.org/papers/v15/mannor14a.html), [Bernstein-Shimkin 2015](https://jmlr.org/papers/v16/bernstein15a.html), [Renault 2011](https://doi.org/10.4171/JEMS/254), [Li-Venel 2016](https://doi.org/10.1007/s00182-015-0496-4), [Mertens-Neyman 1981](https://doi.org/10.1007/BF01769259), and [Flesch-Laraki-Perchet 2016](https://proceedings.mlr.press/v49/flesch16.html).

## Working Notes Updated

Updated only files under `working_notes/`, including [canonical_summary.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/working_notes/canonical_summary.md:134), [claim_ledger.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/working_notes/claim_ledger.md:466), [lemma_bank.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/working_notes/lemma_bank.md:778), [failed_attempts.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/working_notes/failed_attempts.md:113), [counterexamples.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/working_notes/counterexamples.md:205), [bibliography.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/working_notes/bibliography.md:181), and [iteration_summaries.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/working_notes/iteration_summaries.md:890).

## Next Iteration Focus

1. Prove or refute dyadic dual localization in a finite alphabet model.
2. Compute \(D_n\) for moving-scale block paths and non-block low/high interleavings.
3. Formalize the separated-block all-horizon calculation only if it helps the gluing/separator question.


# Iteration 14 Consolidation

## Accepted Progress

- Promoted the separated two-threshold finite-prefix formula. For
\[
0^N,c_0,0^L,c_1,\qquad 0<c_0<c_1\le1,
\]
the formal left-limit finite-prefix value is exactly
\[
D_{N+L+2}=N\,\frac{c_0(c_1-c_0)}{c_1}.
\]
This confirms that simple far-separated conflicts are exactly diluted by later quote opportunities.
- Promoted the dual scale-splitting identity:
\[
\Phi(u+v)=\Phi(u)+\Phi(v)+
\sum_{t<m}\{f_t(u)+f_t(v)-f_t(u+v)\}.
\]
The boundary term is genuine cross-scale support-function defect, not proof slack.
- Promoted the finite-alphabet dual reduction in the left-limit model, including the one-level \(D_n=0\) consequence and the two-level positive-part formula.

## Candidate Routes

- Develop a boundary-augmented prefix LP that keeps late shadow objectives, then test whether repeated boundary defects force large \(D_n\) at comparable scales.
- Attack gluing first in finite alphabets, especially the two-level case using the positive-part formula.
- Run exact finite LP experiments for small two-level paths and non-block interleavings, distinguishing exact zero, bounded, and sublinear normalized values.

## Refuted Or Weakened Claims

- The direct localization route "large boundary defect implies \(D_m=\Omega(m)\)" is false: the separated block has boundary defect \(\Theta(N)\) while the shorter prefix \(0^N,c_0\) has \(D_m=0\).
- Consecutive-ones/interval structure alone does not prove uncrossing; the nested comparator-side and learner-side maxima remain the obstruction.
- The sanity check that alternating \(\ell,h\) prefixes have exact \(D_n=0\) is false for arbitrary \(\ell,h\); stable-comparator easy paths are a narrower phenomenon.

## Literature Updates

- Verified/imported Renault 2014, Dann et al. 2023, Kuntz et al. 2021, Fulkerson-Gross 1965, and Rakhlin-Sridharan-Tewari 2011.
- These are background only: uniform-value/gluing caution, pseudonorm approachability, countably infinite LP approximation, interval-incidence structure, and global-objective online learning. No direct external delayed-market-making gluing theorem was found.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Prove or refute the two-level finite-alphabet localization theorem.
2. Define and analyze the boundary-augmented prefix certificate.
3. Implement finite-prefix LP searches for small two-level paths and cumulative diluted-conflict constructions.


# Iteration 14 Consolidation

## Accepted Progress
- Promoted exact separated-block formula:
  \[
  D_{N+L+2}(0^N,c_0,0^L,c_1)=N\,\frac{c_0(c_1-c_0)}{c_1}
  \]
  in the formal left-limit model.
- Promoted the dual scale-splitting boundary identity and recorded that the boundary term is real cross-scale incompatibility.
- Promoted the finite-alphabet dual reduction, plus the one-level \(D_n=0\) case and two-level positive-part formula.

## Candidate Routes
- Boundary-augmented prefix LPs with late shadow objectives.
- Two-level finite-alphabet localization as the next clean proof target.
- Finite LP experiments for small two-level paths and cumulative diluted-conflict constructions.

## Refuted Or Weakened Claims
- Refuted: large boundary defect implies a shorter-prefix \(D_m=\Omega(m)\) certificate.
- Weakened: consecutive-ones/interval structure alone is not enough for localization.
- Corrected: alternating \(\ell,h\) finite prefixes do not always have exact \(D_n=0\).

## Literature Updates
Verified/imported as background only:
- Renault 2014, “General limit value in dynamic programming”: https://doi.org/10.3934/jdg.2014.1.471
- Dann et al. 2023, “Pseudonorm Approachability…”: https://proceedings.mlr.press/v201/dann23a.html
- Kuntz et al. 2021, countably infinite LP approximation: https://doi.org/10.1137/19M1268847
- Fulkerson-Gross 1965, interval-incidence structure: https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-15/issue-3/Incidence-matrices-and-interval-graphs/pjm/1102995572.full
- Rakhlin-Sridharan-Tewari 2011: https://proceedings.mlr.press/v19/rakhlin11a.html

No direct external theorem for the delayed-market-making gluing problem was found.

## Working Notes Updated
Updated only files under `working_notes/`: `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Prove or refute two-level finite-alphabet localization.
2. Define the boundary-augmented prefix certificate.
3. Implement finite-prefix LP searches for small two-level and cumulative diluted-conflict paths.


# Iteration 15 Consolidation

## Accepted Progress

- Promoted the two-level single-drought damping identity. In the formal left-limit model,
\[
D_{M+N+2}(h^M,0^N,\ell,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h),
\qquad 0<\ell<h.
\]
The proof has a matching primal construction and two-horizon dual certificate. It is local and does not imply additivity across many droughts.
- Promoted the stable-high exact regret formula. On a two-level path, always quoting \(h^-\) has regret
\[
[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+.
\]
This is useful as an upper-bound/stability test.

## Candidate Routes

- Replace the failed \(Q_T\)-dichotomy with a resolved-surplus/debt recursion for two-level paths. The right scale appears to be the later high that resolves a low-surplus drought, not just the low horizon where stable-high regret is large.
- Prove or refute the post-low extension \(h^M,0^N,\ell,0^L,h\) with a full primal-dual check over all intermediate horizons.
- Build exact finite-prefix LP experiments for multi-low droughts and repeated diluted-drought patterns, extracting dual supports and cumulative debt terms.

## Refuted Or Weakened Claims

- Refuted: linear stable-high regret \(Q_T\) at a low horizon implies a comparable-scale \(D_n=\Omega(n)\) certificate. The path \(0^N,\ell,0^L,h\), \(L\gg N\), has \(Q_{N+1}=\ell N\), but the low-only prefix has \(D=0\) and the full conflict is only \(N\ell(1-\ell/h)=o(N+L)\).
- Weakened: local drought formulas do not yet compose. Shared marginals, multiple lows inside one drought, and persistent high debt from low quotes remain the hard bookkeeping.

## Literature Updates

- Verified/imported fixed-design and formulation background: Wu-Heidari-Grama-Szpankowski 2022, Assos-Attias-Dagan-Daskalakis-Fishelson 2023, Wu-Grama-Szpankowski 2023, Kontonis-Ma-Tzamos 2023, and Rakhlin-Sridharan 2013.
- Verified/imported Lindley 1952 as queue/reflected-recursion background for surplus/debt analogies.
- No external source found for the single-drought identity, the two-level gluing theorem, or a \(D_n=o(n)\Rightarrow o(T)\) implication.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Prove the \(h^M,0^N,\ell,0^L,h\) extension or find the first intermediate-horizon failure.
2. Formalize a resolved-surplus/debt recursion for two-level paths, including multi-low droughts.
3. Implement finite-prefix LP searches for repeated diluted-drought paths and compare \(D_n\) to stable-policy gaps and cumulative high debt.


# Iteration 15 Consolidation

## Accepted Progress
Promoted the local two-level single-drought identity:
\[
D_{M+N+2}(h^M,0^N,\ell,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h).
\]
Also promoted the stable-high regret formula:
\[
Q_T=[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+.
\]
Both are recorded as formal left-limit results with strict-crossing caveats.

## Candidate Routes
The next viable route is a resolved-surplus/debt recursion for two-level paths. The post-low extension \(h^M,0^N,\ell,0^L,h\) remains plausible but not yet proved for all intermediate horizons.

## Refuted Or Weakened Claims
Refuted the raw \(Q_T\)-dichotomy. In \(0^N,\ell,0^L,h\) with \(L\gg N\), \(Q_{N+1}=\ell N\), but the low-only prefix has \(D=0\), and the full conflict is only \(N\ell(1-\ell/h)=o(N+L)\).

## Literature Updates
Added verified background-only sources: Wu et al. 2022 fixed-design regret, Assos et al. 2023 infinite games, Wu-Grama-Szpankowski 2023 dynamic environments, Kontonis-Ma-Tzamos 2023 ordering, Rakhlin-Sridharan 2013 predictable sequences, and Lindley 1952 queue recursions. No source proves the market-making gluing theorem.

Links include: https://proceedings.mlr.press/v195/assos23a.html, https://proceedings.mlr.press/v195/wu23a.html, https://proceedings.mlr.press/v30/Rakhlin13.html, https://doi.org/10.1017/S0305004100027638.

## Working Notes Updated
Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus
1. Prove or disprove the \(h^M,0^N,\ell,0^L,h\) extension.
2. Formalize two-level resolved-surplus/debt bookkeeping, including multi-low droughts.
3. Run finite-prefix LP experiments for repeated diluted-drought paths.


# Iteration 16 Consolidation

## Accepted Progress

- Promoted the post-low single-drought identity. In the formal left-limit model,
\[
D_{M+N+L+2}(h^M,0^N,\ell,0^L,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h).
\]
Post-low zeros create no additional local conflict; they only dilute \(D_n/n\). The proof uses a two-horizon primal-dual certificate and explicit cancellation of final-only post-low coordinates.

## Candidate Routes

- Keep the equal-low multi-low drought formula as a candidate, not accepted. The proposed last-low value
\[
[\ell(s_r-1)-h(M-1)_+]_+(1-\ell/h)
\]
has a clean reduced LP and dual certificate, but still needs a rigorous reduction from the full finite-prefix LP to \(\ell^-/h^-\) marginals and a dominance proof for intermediate horizons.
- Use the accepted post-low formula as a regression test for any resolved-surplus/debt recursion. The next real stress tests are unequal low levels, multiple lows sharing one resolving high, repeated diluted droughts, and cumulative high debt.

## Refuted Or Weakened Claims

- Refuted the idea that a long post-low zero tail adds local conflict in a one-low drought. The value is independent of \(L\).
- Stable-high regret and raw waiting time remain invalid localization certificates; the obstruction is resolved low surplus versus future high debt.

## Literature Updates

- Verified Heliou, Mertikopoulos, and Zhou, "Gradient-free Online Learning in Continuous Games with Delayed Rewards," ICML/PMLR 2020, as adjacent delayed continuous-action payoff-feedback background.
- Verified Cao, Siska, Szpruch, and Treetanthiploet, "Logarithmic regret in the ergodic Avellaneda-Stoikov market making model," arXiv:2409.02025 / SIAM Journal on Financial Mathematics 2026 accepted-in-press, as adjacent stochastic-control market-making context.
- Verified Albers, Cucuringu, Howison, and Shestopaloff, "The Market Maker's Dilemma: Navigating the Fill Probability vs. Post-Fill Returns Trade-Off," arXiv:2502.18625, as empirical fill-quality motivation only.
- No external source was found for the post-low or equal-low drought finite-prefix identities.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Prove the equal-low multi-low drought formula by reducing the full finite-prefix LP to the displayed cumulative low-mass LP.
2. Test unequal-low droughts, where early low horizons may genuinely bind.
3. Run exact finite-prefix LP experiments for repeated diluted droughts and compare the outputs to candidate surplus/debt recursions.


# Iteration 16 Consolidation

## Accepted Progress
Promoted the post-low single-drought identity:
\[
D_{M+N+L+2}(h^M,0^N,\ell,0^L,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h).
\]
The post-low zero tail adds no local finite-prefix conflict; it only dilutes normalized \(D_n/n\).

## Candidate Routes
Kept the equal-low multi-low drought formula as candidate only. It has a clean reduced LP and dual certificate, but still needs the full reduction from \(D_n\) to \(\ell^-/h^-\) marginals and a proof that earlier low horizons are dominated.

## Refuted Or Weakened Claims
Recorded that “long post-low wait creates extra local conflict” is false for one low. Stable-high regret and raw waiting time remain invalid localization certificates.

## Literature Updates
Verified and added adjacent-only sources:
- [Heliou, Mertikopoulos, Zhou 2020](https://proceedings.mlr.press/v119/heliou20a.html)
- [Cao, Siska, Szpruch, Treetanthiploet 2024/2026](https://arxiv.org/abs/2409.02025)
- [Albers, Cucuringu, Howison, Shestopaloff 2025](https://arxiv.org/abs/2502.18625)

No external theorem was found for the new drought identities.

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

`git diff --check -- working_notes` reported no whitespace errors.

## Next Iteration Focus
1. Prove the equal-low multi-low drought formula rigorously.
2. Test unequal-low droughts, where early lows may genuinely bind.
3. Run exact finite-prefix LP experiments for repeated diluted droughts and compare against surplus/debt recursions.


# Iteration 17 Consolidation

## Accepted Progress

- Promoted the equal-low multi-low single-drought formula. In the formal left-limit deterministic known-path model, for
\[
h^M,0^{N_0},\ell,0^{N_1},\ell,\ldots,0^{N_r},\ell,0^L,h,
\]
with \(s_r\) the last low and \(H=(M-1)_+\),
\[
D_n=[\ell(s_r-1)-hH]_+(1-\ell/h).
\]
The proof reduces the finite-prefix LP to cumulative \(\ell^-\)-mass variables; the upper bound front-loads \(X_j=S_j/h\), and the lower bound uses only the last low and final high.

## Candidate Routes

- Unequal-low single-droughts now have a candidate reduced LP over segment masses \(x_{i,c}\), with final-high debt \((h-c)x_{i,c}\) and low-horizon payoffs determined by segment suffix maxima.
- The reduced LP suggests a possible pooling/PAVA or nested resource-allocation rule, but the full-to-reduced LP proof must be written before any closed form is promoted.
- Repeated droughts and cumulative high debt remain the main route toward the two-level \(D_n\)-gluing problem.

## Refuted Or Weakened Claims

- The equal-low last-low rule does not extend naively to unequal lows. In the reduced LP, \(0,0.4,0.9,1\) has value \(68/225\), above the last-low-only value \(0.18\); earlier low horizons can bind.
- The unequal-low LP is not yet an accepted full \(D_n\) theorem. The missing step is the explicit full finite-prefix LP reduction: action-menu dominance, segment exchangeability, coordinate elimination, and intermediate-horizon dominance.

## Literature Updates

- Added verified proof-technology background for pooling and nested allocation: Ayer-Brunk-Ewing-Reid-Silverman 1955, Chakravarti 1989, and Federgruen-Groenevelt 1986.
- No external theorem was found for the equal-low finite-prefix identity; it remains internal LP progress.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Prove the unequal-low full-to-reduced LP reduction rigorously.
2. Derive or refute a pooling/resource-allocation rule for the unequal-low reduced LP.
3. Run exact finite-prefix LP experiments for repeated droughts and nonmonotone low sequences, extracting primal and dual certificates.


# Iteration 17 Consolidation

## Accepted Progress
Promoted CL-048/LB-043: the equal-low multi-low single-drought formula is now accepted in the formal left-limit deterministic known-path model:
\[
D_n=[\ell(s_r-1)-h(M-1)_+]_+(1-\ell/h).
\]
This remains equal-low only and strict crossing still needs \(\eta\)-implementation.

## Candidate Routes
Recorded the unequal-low single-drought reduced LP as a candidate, not a theorem. It may lead to a pooling/PAVA or nested resource-allocation rule after the full-to-reduced LP proof is written.

## Refuted Or Weakened Claims
Recorded that the equal-low “last low only” rule does not extend to unequal lows. The reduced-LP path \(0,0.4,0.9,1\) has value \(68/225\), exceeding the naive last-low value \(0.18\).

## Literature Updates
Added verified proof-technology references only:
[Ayer et al. 1955](https://doi.org/10.1214/aoms/1177728423), [Chakravarti 1989](https://doi.org/10.1287/moor.14.2.303), and [Federgruen-Groenevelt 1986](https://doi.org/10.1287/opre.34.6.909). No external theorem was found for the equal-low identity.

## Working Notes Updated
Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

Verification: `git diff --check -- working_notes` passed.

## Next Iteration Focus
1. Prove the unequal-low full-to-reduced LP reduction.
2. Derive or refute a pooling/resource-allocation rule for unequal lows.
3. Run exact finite-prefix LP experiments for repeated droughts and nonmonotone low sequences.


# Iteration 18 Consolidation

## Accepted Progress

- Promoted CL-049/LB-044: the unequal-low one-drought full-to-reduced LP is accepted in the formal left-limit deterministic known-path model. For
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\qquad 0<\ell_j<h,
\]
the finite-prefix value equals the reduced LP over segment masses \(x_{i,c}\), \(c\in\mathcal L=\{\ell_1,\ldots,\ell_r\}\), with low constraints using \(m_{i,j}=\max_{q=i+1,\ldots,j}\ell_q\) and final-high debt \(\sum(h-c)x_{i,c}\).
- Recorded the dual
\[
\max_{\alpha,\beta\ge0,\ \sum_j\alpha_j+\beta=1}
\left[
\sum_j\alpha_jS_j-\sum_iB_i\psi_i(\alpha,\beta)
\right],
\]
where
\[
\psi_i=
\left[
\max_{c\in\mathcal L}
\left\{
c\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j-\beta(h-c)
\right\}
\right]_+ .
\]
- Confirmed the regression value for \(0,0.4,0.9,1\): \(D_4=68/225\), with primal masses \(x_{0,0.4}=11/45\), \(x_{0,0.9}=34/45\), \(x_{1,0.9}=4/5\).

## Candidate Routes

- Derive a pooling/PAVA-like or nested-resource-allocation rule from the accepted unequal-low dual.
- Build an exact finite-prefix LP regression suite for small unequal-low droughts, especially \(M>1\), zero-length gaps, duplicate lows, and nonmonotone low sequences.
- Study repeated droughts and cumulative high debt; the one-drought LP should not be assumed composable.

## Refuted Or Weakened Claims

- The equal-low last-low rule is refuted as a full finite-prefix rule for unequal lows. In \(0,0.4,0.9,1\), the exact value \(68/225\) exceeds the naive last-low value \(0.18\), and earlier low constraints bind.
- The iteration-18 explorer value \(14/45\) for this path is only a feasible point, not the optimum.
- No progress was made on the global \(D_n=o(n)\Rightarrow o(T)\) gluing problem or on the original raw-tail characterization.

## Literature Updates

- Added verified proof-technology references only: Vidal-Jaillet-Maculan 2016, Vidal-Gribel-Jaillet 2019, de Leeuw-Hornik-Mair 2009, Ahuja-Orlin 2001, and Wu-Nip-He 2021.
- No external source was found for the unequal-low market-making reduction; it remains an internal finite-prefix LP theorem.

## Working Notes Updated

Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Derive or refute a pooling/nested-allocation rule for the accepted unequal-low one-drought LP.
2. Implement exact rational LP regression tests for unequal-low droughts and compare primal/dual certificates.
3. Analyze repeated droughts sharing resolving highs to see how high debt composes or fails to compose.


# Iteration 18 Consolidation

## Accepted Progress
Promoted the unequal-low one-drought reduction as `CL-049` / `LB-044`: in the formal left-limit model, the one-drought finite-prefix value equals the reduced LP over segment masses \(x_{i,c}\). This is a local theorem, not a gluing theorem.

Confirmed the regression case \(0,0.4,0.9,1\):
\[
D_4=68/225
\]
with primal masses \(x_{0,0.4}=11/45\), \(x_{0,0.9}=34/45\), \(x_{1,0.9}=4/5\).

## Candidate Routes
Derive a pooling/PAVA-like or nested-resource-allocation rule from the accepted unequal-low dual.

Build exact rational LP regression tests for unequal-low droughts, especially edge cases with \(M>1\), zero gaps, duplicate lows, and nonmonotone low sequences.

Study repeated droughts sharing resolving highs; the one-drought LP should not be assumed composable.

## Refuted Or Weakened Claims
The equal-low “last low only” rule is now refuted as a full finite-prefix rule for unequal lows.

The iteration-18 \(14/45\) value is recorded as a failed computation: it is feasible but not optimal.

No progress was made on the global \(D_n=o(n)\Rightarrow o(T)\) gluing problem or the original raw-tail characterization.

## Literature Updates
Added verified proof-technology references only, not theorem support for the market-making reduction:

[Vidal-Jaillet-Maculan 2016](https://doi.org/10.1137/140965119), [Vidal-Gribel-Jaillet 2019](https://doi.org/10.1287/ijoo.2018.0004), [de Leeuw-Hornik-Mair 2009](https://doi.org/10.18637/jss.v032.i05), [Ahuja-Orlin 2001](https://doi.org/10.1287/opre.49.5.784.10601), and [Wu-Nip-He 2021](https://doi.org/10.1287/ijoc.2020.1006).

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

`git diff --check -- working_notes` passed. Note: `working_notes/` is untracked in this run directory.

## Next Iteration Focus
1. Derive or refute a pooling/nested-allocation rule for the accepted unequal-low LP.
2. Implement exact rational LP regression tests with primal/dual certificates.
3. Analyze repeated droughts to understand how high debt composes or fails to compose.


# Iteration 19 Consolidation

# Codex Job Failed

Label: iter_019_synthesis

Return code: 1

See logs:
- /Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/logs/iter_019_synthesis.stdout.log
- /Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/logs/iter_019_synthesis.stderr.log



# Iteration 20 Consolidation

# Codex Job Failed

Label: iter_020_synthesis

Return code: 1

See logs:
- /Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/logs/iter_020_synthesis.stdout.log
- /Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_delayed-market-making-tail-characterization/logs/iter_020_synthesis.stderr.log


# Iteration 19 Consolidation (Recovered)

## Accepted Progress

- Promoted the two-unequal-low one-drought closed form as CL-050/LB-045. For
\[
h^M,0^{N_0},p,0^{N_1},q,0^L,h,\qquad 0<p,q<h,\quad p\ne q,
\]
the formal left-limit value has explicit branch formulas for \(p<q\) and \(p>q\), conditional on CL-049 and the path-feasibility inequalities \(0\le S_1\le S_2\), \(S_1\le pB_0\), and \(S_2/h\le B_0+B_1\).
- Promoted the CL-049 KKT support rule as LB-046: if \(x_{i,c}>0\), then \(cW_i(c)-\beta(h-c)=\psi_i\). This is an LP complementary-slackness fact, not a pooling algorithm.
- Added the three-low exact certificate \(0,0.2,0^8,0.3,0,0.4,1\) with value \(291/100\) as a regression test for future active-set rules.

## Candidate Routes

- Use the two-low closed form as a regression base case for a certificate-producing active-set or nested-allocation algorithm.
- Formalize zero-pressure equal-revenue pools only after specifying the isolation assumptions and the meaning of "pool."
- Build exact rational LP tests for nonmonotone lows, duplicate lows, zero gaps, \(M>1\), and capacity-saturated branches.

## Refuted Or Weakened Claims

- The two-low formula does not imply a scalar adjacent-merge/PAVA rule.
- The three-low example refutes only permanent left-to-right finalization of adjacent pairs; revisable active-set methods remain possible.
- Capacity binding is not equivalent to positive dual pressure: the three-low certificate has binding segment capacities but all \(\psi_i=0\).
- No progress was made on repeated-drought composition, the global \(D_n=o(n)\Rightarrow o(T)\) gluing problem, or the original raw-tail characterization.

## Literature Updates

- Verified/imported Hochbaum 1994 as allocation proof-technology background:
  Dorit S. Hochbaum, "Lower and Upper Bounds for the Allocation Problem and Other Nonlinear Optimization Problems," *Mathematics of Operations Research* 19(2):390-409, 1994, DOI https://doi.org/10.1287/moor.19.2.390.
- Existing PAVA/nested-allocation sources remain analogies only; none proves the market-making LP reduction or a pooling rule.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write CL-050/LB-045 as a polished theorem with explicit primal and dual certificates for every branch.
2. Formalize LB-046 and use it to design an active-set algorithm that outputs certificates.
3. Run exact rational regression tests, especially nonmonotone and capacity-saturated three-low cases.


# Iteration 19 Consolidation

## Accepted Progress

Promoted the two-unequal-low one-drought closed form as `CL-050` / `LB-045`, conditional on the accepted `CL-049` reduced LP and formal left-limit model.

Also recorded the `CL-049` KKT support rule as `LB-046`, and added the three-low certificate
\(0,0.2,0^8,0.3,0,0.4,1\) with value \(291/100\) as a regression test.

## Candidate Routes

The active-set / pooling direction remains promising, but only with exact primal-dual certificates. A scalar adjacent-merge or PAVA rule is not established.

## Refuted Or Weakened Claims

The two-low formula does not imply repeated-drought composition, a global pooling rule, or \(D_n=o(n)\Rightarrow o(T)\). Capacity binding is also not equivalent to positive dual pressure.

## Literature Updates

Verified Hochbaum 1994 via INFORMS/DOI as proof-technology background only: https://doi.org/10.1287/moor.19.2.390. No external source was found for the market-making two-low formula or pooling rule.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and appended a recovered entry to `iteration_summaries.md`.

## Next Iteration Focus

1. Write `CL-050/LB-045` as a polished theorem with branchwise primal-dual certificates.
2. Formalize `LB-046` and design a certificate-producing active-set algorithm.
3. Run exact rational LP tests for nonmonotone lows, duplicate lows, zero gaps, \(M>1\), and capacity-saturated cases.


# Iteration 20 Consolidation (Recovered)

## Accepted Progress

Promoted the strictly increasing-low one-drought theorem as `CL-051` / `LB-047`. For
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ldots,\ell_r,0^L,h,
\qquad 0<\ell_1<\cdots<\ell_r<h,
\]
with \(H=(M-1)_+\), \(C_j=\sum_{i<j}B_i\), \(S_j=[\ell_j(H+C_j)-hH]_+\), and \(\Delta_j=S_j-S_{j-1}\),
\[
D_n=
\max_k\left[
\left(1-\frac{\ell_k}{h}\right)S_k+
\sum_{j>k}\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j
\right]
\]
in the formal left-limit model.

The proof now has both sides: the solver/explorer zero-pressure dual certificate and the critic's nested Hall scheduling inequality for the primal construction. The theorem is local and path-feasible; it does not cover nonmonotone lows, duplicate lows, repeated droughts, or global anytime gluing.

## Candidate Routes

Use `LB-047` as the clean solved base case for an active-set program. The next useful targets are nonmonotone lows, duplicate lows, positive-pressure active sets, and repeated droughts with shared high debt.

Turn the sufficient fixed-\(k\) flow certificate into a reusable proof tool, but do not promote its converse outside the increasing path-feasible setting until the canonical latest-increment reduction is written.

## Refuted Or Weakened Claims

The \(p<q\) two-low "third branch" is not an actual market-path capacity obstruction. It occurs only for arbitrary reduced-LP data after dropping \(S_1\le pB_0\). This is now recorded as `FA-035` and `CE-027`.

The flow/Hall certificate is not yet a general pooling theorem. Gallo/Picard-style parametric cut ideas remain proof technology, not support for a market-making formula.

## Literature Updates

Imported verified flow references:

- David Gale, "A theorem on flows in networks," *Pacific Journal of Mathematics* 7(2):1073-1082, 1957.
- D. R. Fulkerson, "A Network-Flow Feasibility Theorem and Combinatorial Applications," *Canadian Journal of Mathematics* 11:440-451, 1959.
- Giorgio Gallo, Michael D. Grigoriadis, and Robert E. Tarjan, "A Fast Parametric Maximum Flow Algorithm and Applications," *SIAM Journal on Computing* 18(1):30-55, 1989.
- Jean-Claude Picard and Maurice Queyranne, "On the structure of all minimum cuts in a network and applications," *Mathematical Programming* 22:121, 1982.

Gale/Fulkerson are directly relevant to Hall/flow feasibility. Gallo-Tarjan and Picard-Queyranne are optional background for future parametric/active-set algorithms.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and appended this recovered entry to `iteration_summaries.md`.

## Next Iteration Focus

1. Write `CL-051/LB-047` as a polished theorem-proof block with strict-crossing implementation.
2. Test nonmonotone and duplicate lows with exact rational primal-dual certificates.
3. Derive the first positive-pressure residual rule, or prove that repeated droughts require a different high-debt ledger.


# Iteration 20 Consolidation

## Accepted Progress

Promoted the strictly increasing-low one-drought theorem as `CL-051` / `LB-047`. The exact formal left-limit value is now recorded with the zero-pressure dual certificate and the nested Hall scheduling proof.

## Candidate Routes

Use `LB-047` as the solved base case. Next useful work is nonmonotone lows, duplicate lows, positive-pressure active sets, repeated droughts, and exact rational LP regression with primal/dual certificates.

## Refuted Or Weakened Claims

Recorded that the \(p<q\) two-low “third branch” is not path-feasible for actual market paths; it is only an artificial reduced-LP stress test. Added this as `FA-035` and `CE-027`.

Also kept the flow/Hall certificate as a local tool, not a general pooling theorem.

## Literature Updates

Imported verified flow references:
- [Gale 1957](https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-7/issue-2/A-theorem-on-flows-in-networks/pjm/1103043501.full)
- [Fulkerson 1959](https://doi.org/10.4153/CJM-1959-045-1)
- [Gallo-Grigoriadis-Tarjan 1989](https://doi.org/10.1137/0218003)
- [Picard-Queyranne 1982](https://doi.org/10.1007/BF01581031)

Gale/Fulkerson are directly relevant to Hall/flow feasibility; the latter two are proof-technology background only.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and appended a recovered iteration 20 entry to `iteration_summaries.md`.

Verification: `git diff --check -- working_notes` passed.

## Next Iteration Focus

1. Write `CL-051/LB-047` as a polished theorem-proof block.
2. Test nonmonotone and duplicate lows with exact rational certificates.
3. Develop the first positive-pressure residual rule or a repeated-drought high-debt ledger.
