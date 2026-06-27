## Summary

The explorer’s concrete finite-alphabet dual reduction mostly survives. Lemma 1, Lemma 2, and the two-level positive-part formula look correct in the formal left-limit model with exogenous deterministic paths and `sup` comparators.

The main weakness is that the desired uncrossing/localization theorem is still not proved. The consecutive-ones structure is real, but it does not by itself control the two nested maxima. I found one clear false sanity-check claim: alternating \(\ell,h,\ell,h,\ldots\) does not have exact finite-prefix value \(0\) for arbitrary \(0<\ell<h\).

## Issue List

- **Missing assumption:** The finite-alphabet formula needs explicit conventions:
  \(L_j(T)=0\) if no level-\(c_j\) price appears by \(T\); \(N_j(t)=\infty\) or \(>n\) if no future level-\(c_j\) price appears in the prefix; and \(\Lambda_s=0\) for \(s>n\) and \(s=\infty\). Without these, the displayed formula is ambiguous at boundary times.

- **Missing assumption:** All exact equalities are in the formal left-limit model. In the original strict-crossing action space, the formulas are infimum statements implemented by \(c_j-\eta\), not generally attained.

- **Plausible but incomplete:** The proposed uncrossing/localization theorem remains unsupported. Consecutive-ones or suffix-interval incidence is not enough once the objective contains \(\max_j\) on both comparator and learner sides.

- **False claim:** The report’s sanity check “alternating \(\ell,h,\ell,h,\ldots\) gives value \(0\)” is false as written for arbitrary \(\ell,h\). It is true for the known easy case \((\ell,h)=(1/2,1)\), more generally when the high quote is always an optimal comparator, but not for all two-level alphabets.

- **Unsupported citation, mild:** Fulkerson-Gross supports consecutive-ones/interval-incidence background, not the desired localization theorem. Rakhlin-Sridharan-Tewari is useful conceptual background for global objectives, but not proof support for this market-specific dual.

## Counterexamples Or Stress Tests

Take the two-level prefix
\[
P_1=\ell,\quad P_2=h,\quad P_3=\ell,\quad P_4=h,
\qquad 0<\ell<h<2\ell .
\]
Then
\[
V_2^*=h,\qquad V_3^*=2\ell,\qquad V_4^*=3h .
\]
Zero deficit at \(T=2\) forces the first quote to be \(h^-\). Zero deficit at \(T=4\) forces the first three quotes to be \(h^-\). But then at \(T=3\), only the first high quote has traded, giving payoff \(h<2\ell=V_3^*\). Thus \(D_4>0\). So exact value \(0\) for alternating \(\ell,h\) is not generally correct.

This is not a separator against the broader gluing program: the conflict may be only \(O(1)\), hence asymptotically negligible. But it matters because the report states an exact finite-prefix check.

## Literature Or Known-Result Conflicts

No direct known-result conflict found. The literature check supports only background use:

- Fulkerson-Gross gives the classical consecutive-ones/interval-incidence setting, but not a theorem converting such structure into dual support localization.
- Rakhlin-Sridharan-Tewari gives a broad framework for non-additive/global online-learning objectives, but does not resolve this finite-prefix gluing problem.

The uniform-value and approachability cautions already in the working notes remain relevant: finite-horizon values often do not glue without extra stability.

## What Survives The Critique

- **Lemma 1 survives:** The finite-alphabet dual formula is exact with the left-limit and boundary conventions above.
- **Lemma 2 survives:** One positive level gives \(D_n=0\) as an infimum.
- **Lemma 3 survives:** For two levels, the positive-part formula follows by subtracting the one-level high-threshold cancellation.
- The finite-alphabet model is still a good test bed for \(D_n=o(n)\) versus fixed-envelope feasibility.
- The correction from strict \(>\) to left-limit \(\ge\) is important and correct.

## Bibliography Candidates

- D. R. Fulkerson and O. A. Gross. “Incidence Matrices and Interval Graphs.” *Pacific Journal of Mathematics* 15(3):835-855, 1965. https://msp.org/pjm/1965/15-3/pjm-v15-n3-p11-s.pdf. Relevance: primary source for consecutive-ones/interval-incidence structure; background only.

- Alexander Rakhlin, Karthik Sridharan, Ambuj Tewari. “Online Learning: Beyond Regret.” COLT 2011, PMLR 19:559-594. https://proceedings.mlr.press/v19/rakhlin11a.html. Relevance: broad online-learning framework for global objectives; conceptual background only.

## Recommended Next Checks

1. Correct the alternating-path sanity check: distinguish exact \(D_n=0\), bounded \(D_n=O(1)\), and normalized \(D_n=o(n)\).
2. Prove the two-level formula as a standalone lemma with all conventions.
3. Run exact LP computations for all two-level paths of small length and several ratios \(\ell/h\), not just \((1/2,1)\).
4. Try localization first for \(k=2\), using the signs of \(\ell U_t-hW_t\).
5. Do not attempt finite-to-general quantization until the finite-alphabet theorem is stable; strict-crossing discontinuities can create \(\Theta(T)\) errors without one-sided \(\eta\)-control.