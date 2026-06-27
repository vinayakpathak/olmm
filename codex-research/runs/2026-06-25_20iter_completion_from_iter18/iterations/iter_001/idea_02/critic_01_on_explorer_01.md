## Summary

No fatal gap in the explorer’s weighted-tail sufficiency proof, assuming the price process is exogenous and the truncated problem is treated as full-information delayed experts. The main theorem that survives is:

\[
\gamma(h)\to 0 \implies R(T)=o(T)
\]

with the stated bound

\[
R(T)\le O(\sqrt{TH\log K})+\frac{T}{K}+T\gamma(H).
\]

The necessity claim does not survive without much sharper quantifiers. The explorer’s counterexample is a credible obstruction to process-specific necessity.

## Issue List

- **Missing assumption:** The upper bound needs an explicit exogeneity/adaptivity condition. The delayed-expert reduction is valid if the full reward vector \(r_t^H(\cdot)\) is determined by the price path independently of the learner’s current random action. If future \(P_s\) can react to \(a_t\), this is no longer a standard delayed full-information problem.

- **Missing assumption:** Replace `max` over \([0,1]\) by `sup`, or assume comparator existence. With strict trade \(a<P_t\), atoms can destroy maximizers. Example: if future prices are constantly \(1/2\), the payoff supremum is approached by \(a\uparrow 1/2\) but not attained.

- **Plausible but incomplete:** The citation to delayed expert learning should be made theorem-level precise. Joulani-Gyorgy-Szepesvari and Quanrud-Khashabi support regret controlled by delays, but the writeup should state the exact full-information bounded-reward theorem being invoked and its convention for delay \(H\).

- **Worth pursuing:** Lemma 2, the equivalence
  \[
  \gamma(h)\to0 \Longleftrightarrow \forall \epsilon>0,\ \beta_\epsilon(h)\to0,
  \]
  appears correct. The proof is short and should be promoted.

- **Plausible but incomplete:** The average-tail condition \(\Delta_T(H)\) is a good weaker sufficient condition, but it should be written horizon-indexedly:
  \[
  \exists H(T):\quad H(T)\log T=o(T),\qquad \Delta_T(H(T))=o(T).
  \]

- **Missing assumption / quantifier gap:** “\(\gamma\not\to0\) is not necessary” is only established under process-specific learnability. For uniform minimax learnability over a class, the counterexample does not rule out a necessity-type lower bound.

## Counterexamples Or Stress Tests

- **Max failure stress test:** Let \(P_t\equiv c\in(0,1)\). A fixed quote \(a<c\) eventually trades, while \(a\ge c\) does not. The best fixed payoff is approached as \(a\uparrow c\), but no maximizing \(a\) exists.

- **Necessity stress test:** The explorer’s coded-delay construction is credible. Conditional on \(P_1=x_m\), a quote \(a=1/2\) has delayed trade probability \(1/2\) at arbitrarily large delays, so \(\gamma(h)\not\to0\). Yet all fixed-action expected rewards are scalar multiples of \(a(1-a)\), so always quoting \(1/2\) has zero regret. This breaks process-specific necessity.

## Literature Or Known-Result Conflicts

No direct conflict found. The delayed-feedback literature supports the finite-arm delayed-learning component: Joulani, Gyorgy, and Szepesvari give black-box delayed-feedback reductions for online learning, and Quanrud-Khashabi give regret bounds in terms of total delay \(D\), consistent with \(D\lesssim TH\) yielding \(O(\sqrt{TH})\)-type scaling. See Joulani et al. ICML 2013 ([proceedings.mlr.press](https://proceedings.mlr.press/v28/joulani13.html)) and Quanrud-Khashabi NeurIPS 2015 ([proceedings.neurips.cc](https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html)).

The Zierahn et al. JMLR 2025 / COLT 2023 line is relevant background for delayed bandit/structured feedback, but less directly necessary for this full-information truncated reduction ([jmlr.org](https://www.jmlr.org/papers/v26/24-0496.html)) ([proceedings.mlr.press](https://proceedings.mlr.press/v195/hoeven23a.html)).

## What Survives The Critique

- Weighted truncation lemma survives.
- Positive-scale equivalence survives.
- \(\gamma(h)\to0\) is a clean sufficient condition.
- The average ex-ante weighted tail \(\Delta_T\) is likely the right refinement if the essential supremum is too strong.
- Necessity should be abandoned or reformulated with explicit minimax/class-uniform quantifiers.

## Bibliography Candidates

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari. “Online Learning under Delayed Feedback.” ICML 2013, PMLR 28(3):1453-1461. https://proceedings.mlr.press/v28/joulani13.html. Relevant for delayed-feedback reductions.

- Kent Quanrud, Daniel Khashabi. “Online Learning with Adversarial Delays.” NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html. Relevant for regret bounds controlled by total delay.

- Lukas Zierahn, Dirk van der Hoeven, Tal Lancewicki, Aviv Rosenberg, Nicolò Cesa-Bianchi. “A Unified Analysis of Nonstochastic Delayed Feedback for Combinatorial Semi-Bandits, Linear Bandits, and MDPs.” JMLR 26(104):1-60, 2025; earlier COLT 2023 version. https://www.jmlr.org/papers/v26/24-0496.html. Background for modern delayed-feedback analysis.

## Recommended Next Checks

1. Formalize the theorem with `sup` regret and explicit exogenous price filtration.
2. Write the exact delayed full-information lemma needed for \(K\) experts and delay at most \(H\).
3. Promote \(\gamma\to0\) as a sufficient condition, not an iff condition.
4. Decide whether the final “only if” target is process-specific or minimax over a class; these are different problems.