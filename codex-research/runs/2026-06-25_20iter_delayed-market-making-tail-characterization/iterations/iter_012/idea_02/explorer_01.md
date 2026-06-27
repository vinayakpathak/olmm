## Summary

The finite-prefix dual idea is sound and useful. In the deterministic exogenous known-path setting, it gives an exact LP/minimax value for the best horizon-oblivious randomized marginal strategy on prefixes \(T\le n\). It strictly improves the loose suffix-menu upper framework because it uses the exact comparator value \(V_T^*\), not the upper bound \(\sum_{t<T}M_{t,T}\).

The right formulation is an infimum/left-limit statement because strict crossing makes threshold quotes unattained.

## Concrete Progress

For a deterministic prefix \(P_{1:n}\), define
\[
M_{t,T}=\max_{t<s\le T}P_s,\qquad
V_T^*=\sup_b\sum_{t<T} b\,1\{b<M_{t,T}\}.
\]
For quote marginals \(\mu_t\), define
\[
G_T(\mu)=\sum_{t<T}\int a\,1\{a<M_{t,T}\}\,d\mu_t(a).
\]
The finite-prefix simultaneous regret value is
\[
D_n(P)=\inf_{\mu_1,\ldots,\mu_{n-1}}\max_{T\le n}\left[V_T^*-G_T(\mu)\right].
\]

The proposed dual is correct:
\[
D_n(P)=
\max_{\lambda\in\Delta_n}
\left\{
\sum_{T=1}^n\lambda_TV_T^*
-
\sum_{t=1}^{n-1}
\sup_{a\in[0,1]}
\sum_{T>t}\lambda_T\,a\,1\{a<M_{t,T}\}
\right\}.
\]

With left-limit actions this is a finite LP. For each \(t\),
\[
\sup_a\sum_{T>t}\lambda_Ta1\{a<M_{t,T}\}
=
\max_{c\in C_t^n}
c\sum_{T>t:M_{t,T}\ge c}\lambda_T,
\]
where \(C_t^n=\{M_{t,T}:T>t,\ M_{t,T}>0\}\), interpreted as posting \(c^-\).

## Claims Or Lemmas

**Lemma 1: Finite-prefix LP dual.**  
In the left-limit action compactification, \(D_n(P)\) equals the dual value above. In the original strict-crossing action space, the same equality holds for the infimum value, with \(\varepsilon\)-implementation by quotes just below finitely many thresholds.

**Lemma 2: Dual certificates lower-bound anytime regret.**  
For any \(\lambda\in\Delta_n\) and any horizon-oblivious policy with first \(n\) marginals \(\mu_t\),
\[
\max_{T\le n} R_T
\ge
\sum_T\lambda_T R_T
\ge
\sum_T\lambda_TV_T^*-\sum_t\rho_t(\lambda),
\]
where \(\rho_t(\lambda)\) is the per-time supremum term. Thus if \(D_n(P)\ge \epsilon n\) infinitely often, every horizon-oblivious policy has \(\limsup_T R_T/T\ge \epsilon\).

**Lemma 3: Recovery of known \(\kappa\) blocks.**  
For a terminal zero block with thresholds \(C\), this dual reduces to
\[
N\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right)
=
N\kappa(C).
\]
For increasing same-path blocks \(0^N,c_1,\ldots,c_m\), the same dual recovers the accepted \(N\kappa(C)-M\) lower bound; intermediate threshold-round terms are covered by the same cancellation already in CL-026/LB-020.

## Proof Attempts

The proof is direct finite LP duality. Replace each continuum action at time \(t\) by the finite left-limit menu
\[
\{c^-:c\in C_t^n\}\cup\{0\}.
\]
For fixed \(T\), payoffs are linear in each \(\mu_t\). The primal LP is:
\[
\min z
\]
subject to
\[
z\ge V_T^*-\sum_{t<T}\sum_a q_{t,a}\phi_{t,T}(a)
\quad\forall T,
\qquad
\sum_a q_{t,a}=1.
\]
Dualizing gives horizon weights \(\lambda_T\ge0\), \(\sum_T\lambda_T=1\), and per-time constraints whose optimal slack is exactly
\[
\max_a\sum_{T>t}\lambda_T\phi_{t,T}(a).
\]
This yields the displayed formula.

A useful sanity check is the alternating path \(1/2,1,1/2,1,\ldots\). The suffix-menu sum is linear, but \(D_n(P)=0\) in the left-limit value: posting \(1^-\) at every time matches the exact best fixed comparator for every finite prefix. This confirms the dual avoids CE-018’s false positive.

## Gaps And Risks

The dual is exact for finite deterministic exogenous prefixes and expected pseudo-regret. It is not automatically a stochastic-process theorem, an endogenous-price theorem, or a pathwise \(E[\sup]\) theorem.

The equality is an infimum statement under strict crossing. Actual threshold actions need \(\eta\)-implementation.

\(D_n(P)=o(n)\) is necessary for sublinear known-path anytime regret, but I do not see a proof that it is sufficient. Finite-prefix optimizers may depend on \(n\) incompatibly.

The dual may remain computational rather than structural unless the support of optimizing \(\lambda\)'s has interpretable form.

## Counterexamples Or Obstructions

The alternating path is the key positive stress test: the old local suffix-menu condition is linear, but the finite-prefix dual value is zero.

Rare-event hard prefixes remain an obstruction to essential-sup interpretations. A pathwise \(D_n\) certificate on a rare branch must be probability-weighted before implying expected regret.

The dual horizon distribution \(\lambda\) is a certificate over evaluation horizons, not a hard stochastic price process. Reinterpreting it as process randomness would repeat the stochastic-mixture mistake in FA-009/FA-014.

## Sources Consulted

Project files: all requested working notes plus `iterations/iter_012/idea_02/idea.md`.

External checks:
- Maurice Sion, “On general minimax theorems,” Pacific Journal of Mathematics 8(1):171-176, 1958. https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-8/issue-1/On-general-minimax-theorems/pjm/1103040253.short
- René Caldentey, Ying Liu, Ilan Lobel, “Intertemporal Pricing Under Minimax Regret,” Operations Research 65(1):104-129, 2017. https://doi.org/10.1287/opre.2016.1548
- Nicolò Cesa-Bianchi, Tommaso Cesari, Roberto Colomboni, Luigi Foscari, Vinayak Pathak, “Market Making without Regret,” COLT/PMLR 2025. https://proceedings.mlr.press/v291/cesa-bianchi25a.html

## Bibliography Candidates

No new bibliography entries seem necessary. The relevant external sources are already present in the run bibliography: Sion 1958 for minimax background, Caldentey-Liu-Lobel 2017 for adjacent minimax-regret pricing, and Cesa-Bianchi et al. 2025 for adjacent market-making regret context.

## Recommended Next Steps

1. Promote the finite-prefix dual as a lemma in the working notes, with left-limit and \(\eta\)-implementation caveats.
2. Define \(D_n(P)\) as the exact finite-prefix horizon-conflict modulus.
3. Test \(D_n\) numerically/symbolically on equal-revenue blocks, sparse spikes, superexponential spikes, and alternating paths.
4. Investigate whether \(D_n=o(n)\) plus an additional consistency or interval condition can become sufficient for known-path anytime learnability.