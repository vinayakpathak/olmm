## Summary

The explorer’s core LP idea is worth pursuing. The two-threshold calculation is basically correct and does recover the \(1/4\) block obstruction, modulo strict-threshold/supremum cleanup.

The main weakness is not the LP. It is the transfer from a local prefix gap \(\kappa\) to actual market-making regret. That transfer needs strong policy-model and accounting assumptions: same prefix action law, candidates indistinguishable through the prefix, and bounded learner surplus outside the tested prefix. Without those, \(\kappa\) can be positive while total regret is not forced to be large.

## Issue List

1. **Fatal gap for any general lower-bound transfer:**  
   A local prefix deficit need not imply endpoint regret. After the candidate continuation is revealed, the learner may earn enough later reward to offset the prefix deficit. The accepted block proofs avoid this because divergence is terminal or post-divergence reward is \(O(1)\), and old rewards are capped by \(M_i\). A general lemma needs an explicit outside-surplus term:
   \[
   R_{T_u}\ge |I|\kappa_I(\mathcal U)-B_u.
   \]

2. **Missing assumption:**  
   The same prefix action law must be forced across all \(u\in\mathcal U\). This holds for universal/process-unaware learners facing indistinguishable continuations, and for horizon-oblivious same-path policies evaluated at multiple prefixes. It does not hold for horizon-aware, process-law-aware oracle learners.

3. **Plausible but incomplete:**  
   The LP dual is fine on finite grids, but the infinite-action strict-threshold version needs a precise limiting argument. Since \(a1\{a<c\}\) is discontinuous and optima are often unattained, state the theorem first with finite grids or \(\eta\)-comparators.

4. **Missing assumption / false-positive risk:**  
   Conditional \(\kappa\) must be weighted by the probability of the prefix event for expected regret. Rare histories can have large conditional compatibility gaps while contributing negligible ex-ante regret.

5. **Plausible but incomplete:**  
   The candidate set \(\mathcal U\) is doing most of the work. It must consist of alternative laws/horizons relevant to the lower-bound quantifier, not realized hidden futures under one stochastic law. Otherwise this repeats the “random continuation is hard” mistake already recorded in FA-009/CE-009.

6. **Unsupported citation if used as proof support:**  
   Blackwell/approachability papers are conceptually relevant but do not by themselves prove this LP modulus or its market-making transfer. For the dual itself, Sion/von Neumann minimax is the more direct citation.

## Counterexamples Or Stress Tests

- **Post-divergence compensation:** common zero prefix with thresholds \(\{1/2,1\}\), followed by a long suffix after the threshold is revealed. Local \(\kappa\) is positive, but endpoint regret can disappear unless suffix learner rewards are capped.

- **Rare-history branch:** with probability \(p_n\ll1\), enter a long hard block with positive \(\kappa\). Conditional essential-sup style \(\kappa\) is large, but expected contribution is \(p_n |I|\kappa\), possibly \(o(T)\).

- **Stochastic mixture trap:** if \(c\in\{1/2,1\}\) is randomly drawn inside one known law, treating realized \(c\)’s as candidates gives positive \(\kappa\), but pseudo-regret may be easy because the comparator is \(\sup_a \mathbb E[\cdot]\).

- **Sparse vanishing spikes:** explorer’s test passes: thresholds of scale \(\epsilon\) give \(\kappa\le \epsilon\), unlike raw \(\beta\).

- **Coded delay:** also passes only if candidates are conditional expected payoff laws. If realized random thresholds are used as candidates, it gives a false obstruction.

## Literature Or Known-Result Conflicts

No direct literature conflict found. The cited approachability sources are background, not a ready-made theorem for this modulus.

Primary-source checks:
- Blackwell 1956 is indeed the vector-payoff approachability origin: Project Euclid/MSP pages list Pacific J. Math. 6(1):1-8.
- Kwon and Perchet 2017 is correctly a PMLR/AISTATS paper on approachability with partial monitoring.
- Kwon 2021 is correctly JMLR 22(200):1-38 on refined approachability/global costs.
- Sion 1958 is the cleaner minimax reference for the dual: Project Euclid lists Pacific J. Math. 8(1):171-176.

## What Survives The Critique

- The local simultaneous-payoff feasibility gap is a good abstraction for the accepted block lower bounds.
- The formula
  \[
  \kappa(\{c,d\})=\frac{c(d-c)}{d}
  \]
  is correct as a supremum/limit statement.
- The warning to use conditional expected payoff laws rather than realized stochastic futures is important and should be kept.
- The modulus is useful as a lower-bound ingredient, not as a standalone learnability characterization.

## Bibliography Candidates

- David Blackwell. “An analog of the minimax theorem for vector payoffs.” Pacific Journal of Mathematics 6(1):1-8, 1956. https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-6/issue-1/An-analog-of-the-minimax-theorem-for-vector-payoffs/pjm/1103044235.short. Relevance: conceptual origin of vector-payoff approachability.

- Maurice Sion. “On general minimax theorems.” Pacific Journal of Mathematics 8(1):171-176, 1958. https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-8/issue-1/On-general-minimax-theorems/pjm/1103040253.short. Relevance: direct minimax support for LP/duality formulations under continuity/compactness assumptions.

- Joon Kwon and Vianney Perchet. “Online Learning and Blackwell Approachability with Partial Monitoring: Optimal Convergence Rates.” AISTATS 2017, PMLR 54:604-613. https://proceedings.mlr.press/v54/kwon17a.html. Relevance: possible framework if prefix compatibility becomes an online vector-payoff/partial-monitoring problem.

- Joon Kwon. “Refined approachability algorithms and application to regret minimization with global costs.” JMLR 22(200):1-38, 2021. https://jmlr.org/papers/v22/20-1019.html. Relevance: background for global-cost/vector-deficit formulations.

## Recommended Next Checks

1. Prove finite-grid \(\kappa_I\) duality first; then pass to strict-threshold limits with \(\eta\)-comparators.
2. State a transfer lemma with an explicit outside-surplus cap \(B\).
3. Define exactly when candidates force the same prefix action law.
4. Build a probability-weighted global version to avoid rare-history false positives.
5. Re-test on CE-001, CE-003, CE-005, CE-006, and both accepted block lower bounds.