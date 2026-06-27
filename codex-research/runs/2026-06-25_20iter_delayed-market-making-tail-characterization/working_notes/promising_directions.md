# Promising Directions

## 1. Formalize The Clean Sufficient Theorem

Write a theorem with \(\sup\)-regret, exogenous/public prices, full-information truncated grid rewards, integer deterministic \(H,K\), and one of the tail penalties:
\[
T\beta(H),\qquad T\gamma(H),\qquad \Delta_T(H),\qquad \Gamma_T(H).
\]
Include the residue-class Hedge lemma or cite a precise delayed full-information theorem. This is the safest accepted progress to turn into a polished result.

## 2. Fix The Quantifiers Before Any Necessity Work

Create a taxonomy:
- instance-wise/process-aware learner;
- process-known but horizon-oblivious learner;
- one universal learner over a specified class;
- minimax lower bound over processes failing a condition;
- uniform post-history guarantee.

The original only-if statement is false for the first interpretation. A meaningful necessity theorem likely needs one of the latter interpretations.

Also record the collapse theorem explicitly: if the learner may depend on both the process law and horizon under pseudo-regret, every exogenous process is learnable by playing a horizon-optimal fixed quote. This should be stated before any necessity theorem.

## 3. Write The Universal Block Lower Bound Cleanly

The finite block theorem and the dominant-block concatenation are now accepted. Next step is a polished theorem-proof writeup:
\[
\forall \pi\ \exists P\in\mathcal C\quad \limsup_T R_T^\pi(P)/T\ge1/4,
\]
where \(\pi\) is process-unaware, \(P\) is a deterministic sequence of blocks \(0^{N_i}c_i\), \(c_i\in\{1/2,1\}\), and \(M_i=o(N_i)\). Include the randomized coupling after a fixed prefix, the old-reward cap \(M_i\), the `sup`/\(\eta\)-comparator treatment of strict crossing, and the fact that horizon-aware families are handled endpointwise because both continuations share the same \(T_i\).

Use the iteration-5 general two-threshold lemma as the proof block:
\[
\alpha(c_0,c_1)=\frac{c_0(c_1-c_0)}{c_1},
\]
then specialize to \(c_0=1/2,c_1=1\) for the optimal constant \(1/4\).

Also write the iteration-7 finite multi-continuation version. For a finite terminal threshold set \(C\),
\[
\max_{c\in C}R_c\ge N\kappa(C)-M,
\qquad
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right).
\]
Specializing to the \(m\)-point equal-revenue menu gives \(((m-1)/m)^m\), and a diagonal \(m_i\to\infty\) construction should give a universal/process-unaware terminal-block lower bound with constant approaching \(1/e\).

Keep the theorem explicitly universal/minimax. It is not an instance-wise necessity theorem and not a lower bound for learners given the constructed process law.

## 4. Write The Horizon-Oblivious Same-Path Theorem

The finite theorem for \(0^N,1/2,1\) and the dominant-block concatenation are accepted. Write the deterministic known-path theorem with
\[
M_i=\sum_{j<i}(N_j+2)=o(N_i),
\qquad
T_i^0=M_i+N_i+1,\quad T_i^1=M_i+N_i+2,
\]
and prove
\[
\max\{R_{T_i^0},R_{T_i^1}\}\ge N_i/4-M_i-O(1).
\]
Define the policy model carefully: process-aware, current-time-aware, no terminal-round signal, and one action rule shared across evaluation horizons.

This is the cleanest separation between horizon-aware oracle collapse and horizon-oblivious anytime learning. It does not rescue \(\beta\)-necessity; it points instead to simultaneous-prefix compatibility.

Iteration 8 removes the intermediate-round \(O(1)\) loss in the `sup` proof as a special case of the multi-threshold cancellation below.

Iteration 8 resolves the multi-threshold same-path version on increasing blocks \(0^N,c_1,\ldots,c_m\). The accepted finite statement is
\[
\max_j R_{T_j}\ge N\kappa(C)-M,
\qquad
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right),
\]
with no finite \(O(m)\) loss: intermediate threshold-round learner rewards cancel against the comparator's extra threshold-round earning opportunities. Equal-revenue menus with \(m_i\to\infty\) and \(M_i+m_i=o(N_i)\) yield a deterministic known path with \(\limsup_T R_T/T\ge1/e\) for every horizon-oblivious policy.

Next work: polish CL-026/CL-027 as theorem-proof blocks, keep the assumptions explicit (increasing thresholds, no horizon input, `sup` comparator, single-fill rewards), and decide whether there is a matching upper/characterization in the known-path anytime regime.

## 5. Replace Raw Tail Necessity By An Information Condition

Attempt a two-environment lower bound. Construct two price laws/classes with indistinguishable public histories before delayed fills resolve, but different optimal fixed quotes. The lower bound should use payoff-relevant delayed mass that is both frequent and unpredictable.

Candidate formal objects: conditional value-of-information gaps, Le Cam/two-continuation moduli, argmax-stability gaps for \(\sup_a V_T(a)\), or simultaneous-prefix incompatibility moduli. Test any proposed modulus against both accepted block obstructions and CE-001 sparse vanishing spikes. Avoid tautological quantities unless they produce an algorithm or a clean lower bound.

The most concrete current object is the prefix-compatibility gap \(\kappa_I(\mathcal U)\). Iteration 6 promoted the conditional transfer lemma and finite-grid/continuum LP dual as local tools. Next steps: write them as polished propositions, keep action domains explicit, use dense-grid/\(\eta\)-comparator limits for strict thresholds, and apply them only when same-prefix action laws, outside-surplus caps \(B_u\), and rare-event probability weights are present.

For zero-block terminal thresholds, the multi-threshold local gap is welfare minus optimal posted-price revenue:
\[
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right)\le 1/e.
\]
Iteration 7 proves the sharp support-size-\(m\) constant \(((m-1)/m)^m\), with positive-support counting and strict-crossing left limits. Iteration 8 verifies the equal-revenue primal certificate and the same-path lift. Next: polish these as propositions, find the primal minimax action distribution for arbitrary finite \(C\), and search for conditions under which local \(\kappa\) lower bounds compose into broader known-path anytime characterizations.

## 6. Promote And Polish Counterexamples

Formalize CE-001 fully as a proposition. Then write CE-003 and CE-005 with exact horizon quantifiers. In particular, finish the all-horizons proof for the superexponential uniform-spike example and decide whether the binary power-of-two example requires horizon-aware actions. Keep CE-007/CE-009 nearby to prevent the oracle and stochastic-mixture quantifier mistakes.

## 7. Adaptive Truncation And Skipping Algorithms

Translate arbitrary-delay/skipping literature to the grid market-making setting. Goal: avoid a known \(H_T\) by running multi-scale truncations or skip-set algorithms, and bound regret by skipped payoff mass or counted total delay rather than a hard uniform horizon.

Use Gyorgy-Joulani 2021, Flaspohler et al. 2021, and Joulani-Gyorgy-Szepesvari 2016 as verified references, but re-check the model map because most results are bandit/OCO rather than this public-price full-information reduction.

Also check Ryabchenko-Attias-Roy 2025 for tracking-capacity/outstanding-feedback formulations and Masoudian-Zimmert-Seldin 2022/2024 for skipped/outstanding delayed-bandit penalties.

## 8. Threshold Geometry And Discretization

Exploit \(r_t(a)=a\,1\{\max_{s>t}P_s>a\}\). Prices reveal nested threshold information across quotes. Possible payoffs: improved discretization, adaptive grids, or one-sided Lipschitz methods. Keep this separate from delay-tail characterization until the basic theorem is settled.

Use Duetting-Guruganesh-Schneider-Wang 2023 and Kleinberg-Leighton 2003 as background, not direct proof support until the delayed adversarial/time-varying setting is mapped.

## 9. Rare-History Stress Tests

Build a fully specified rare-branch process where \(\operatorname{ess\,sup}\) tails fail but expected regret and \(\Delta_T\) remain small. This will test whether \(\gamma\) is too strong even for positive payoff scale under initial expected regret.

Use the iteration-7 multi-threshold gadget for a sharper version: conditional on a rare event, insert a long block with \(\kappa(C_m)\) close to \(1/e\), but choose event probabilities \(p_i\) so that \(p_iN_i=o(T_i)\). This should keep unweighted conditional/essential-sup hardness large while making its contribution to expected regret negligible, if the horizon accounting can be made clean.

## 10. Known-Path Anytime Characterization

Study the process-aware but horizon-oblivious deterministic-path regime as an offline simultaneous-prefix design problem. Given a known path \(P_1,P_2,\ldots\), characterize when there is one action sequence whose prefix rewards track
\[
V_T^*=\sup_a\sum_{t\le T}r_t(a)
\]
for all \(T\). Test paths \(0^N,c_0,c_1\), multi-threshold paths \(0^N,c_1,\ldots,c_m\), sparse vanishing spikes, and superexponential uniform spikes. This is the quantifier regime where oracle collapse fails but raw \(\beta\)-necessity is still false.

Iteration 7 suggests a concrete subtask: formulate the vector-deficit/approachability problem for a single known block \(0^N,C\), compute the primal optimizer for the equal-revenue \(m\)-threshold set, and then decide whether the local strategy composes over many blocks or only certifies lower bounds.

Iteration 8 verifies the equal-revenue primal certificate for a single block: uniform mass on quotes just below the equal-revenue thresholds gives constant local deficit \(((m-1)/m)^m\), matching the dual \(\kappa(C)\). At that point, the arbitrary finite-\(C\) primal optimizer and compositional known-path upper bound were still open.

Iteration 9 closes the finite-\(C\) local optimizer: \(\kappa(C)=\delta_*(C)\), where \(\delta_*\) is the unique root of
\[
\sum_i\frac{(c_i-\delta)_+-(c_{i-1}-\delta)_+}{c_i}=1.
\]
The remaining work is global: write this as a polished local theorem with left-limit/\(\eta\) implementation, then use it inside finite-menu lower and upper statements without implying automatic composition over arbitrary paths.

## 11. Decision-Relevant Calibration Analogies

The iteration-8 idea JSON surfaced U-calibration and Calibration Decision Loss sources. These are not delayed-market-making theorems, but they are useful analogies for replacing raw error/tail quantities by the worst downstream decision loss they induce. The likely useful translation is: raw delayed mass should matter only through a probability-weighted simultaneous-prefix payoff deficit, minus outside-surplus compensation.

Use these sources only for terminology and conceptual support:
\[
\text{one forecast sequence serving many losses}
\quad\leftrightarrow\quad
\text{one quote sequence serving many horizons/continuations}.
\]
Do not cite them as proof support for CL-026/CL-027.

## 12. Finalize The Known-Path \(1/e\) Theorem

Iteration 9 gives the likely sharp theorem for deterministic exogenous paths under randomized horizon-oblivious expected regret:
\[
\sup_P\inf_\pi \limsup_T R_T^\pi(P)/T=1/e.
\]
The upper bound is the universal equal-revenue quote law \(d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da\); the lower bound is CL-027. Next steps:

- write the theorem with exact quantifiers: deterministic/exogenous path, randomized horizon-oblivious policy, no evaluation-horizon input, single-fill reward, expected regret over learner randomization, and `sup` comparator;
- include the suffix-max proof \(M_{t,T}=\max_{t<s\le T}P_s\);
- decide whether to record the exogenous stochastic extension by conditioning on paths;
- incorporate iteration 10's nonconstructive deterministic derandomization, which gives one fixed quote sequence with
\[
R_T\le (T-1)/e+O(T^{2/3}\sqrt{\log T})
\]
on every deterministic exogenous path;
- decide whether an explicit low-discrepancy/cycling construction can replace the probabilistic-method sequence;
- keep the theorem separate from raw delay-tail characterization.

Also polish the path-dependent upper framework:
\[
R_T\le\sum_{t<T}\delta(C_t),\qquad C_t=\{M_{t,T'}:T'>t\},
\]
using CL-028 for finite menus and CL-032/CL-033 for compact menus. Noncompact menus, computable selectors, and necessity remain separate open issues.

Iteration 10 leaves a cleaner checklist: write the monotone-threshold derandomization lemma with the grid/Hoeffding/Borel-Cantelli proof; optionally write the sharper bracketing \(O(n^{2/3})\) version if a precise monotone-entropy theorem is cited or proved; then state the deterministic-policy \(1/e\) theorem as a nonconstructive existence result. Do not present it as progress on the original iff.

Iteration 11 promotes the compact suffix-menu extension of the finite \(\delta(C)\) formula and the known-path sufficient bound
\[
R_T\le\sum_{t<T}\delta(C_t)+o(T).
\]
Next: write the compact local theorem carefully, separating the formal left-limit action space from actual strict-crossing \(\eta_t\)-implementation; prove the finite-approximation/root-convergence lemma cleanly; and keep the alternating path \(1/2,1,1/2,1,\ldots\) as the warning that \(\sum_t\delta(C_t)=o(T)\) is not necessary.

## 13. Exact Finite-Prefix LP And Projective Consistency

Iteration 12 gives a sharper deterministic known-path object. For a finite prefix, define
\[
D_n(P)=
\inf_{\mu_1,\ldots,\mu_{n-1}}
\max_{T\le n}
\left[
V_T^*-\sum_{t<T}\int_{[0,M_{t,T}]}x\,d\mu_t(x)
\right]
\]
in the left-limit model. Its dual over horizon weights is now accepted as a finite-prefix theorem and supplies decision-relevant horizon-conflict certificates. Next steps:

- write the finite-prefix dual as a polished theorem with left-limit and \(\eta\)-implementation caveats;
- compute \(D_n\) on regression tests: \(0^N,c\), \(0^N,1/2,1\), equal-revenue blocks, sparse vanishing spikes, superexponential spikes, and alternating paths;
- investigate projective consistency: \(D_n=o(n)\) is necessary but not proved sufficient, while a fixed sublinear envelope \(e_T\) feasible for all finite prefixes is equivalent to one formal anytime policy;
- try to find a readable sufficient condition between stable one-quote optimality and the full LP, such as finite comparator menus, slowly varying optimal quotes, or small dual horizon-conflict mass;
- extend carefully to stochastic exogenous processes by conditioning on histories and probability-weighting rare hard branches. Do not reinterpret the dual horizon weights \(\lambda\) as stochastic process randomness.

Iteration 13 narrows the next attack. Add the last-exceedance representation
\[
V_T^*=\sup_b b(L_b(T)-1)_+,\qquad L_b(T)=\max\{s\le T:P_s>b\},
\]
to every known-path calculation, and rewrite finite-prefix dual terms as
\[
\sup_a a\sum_{T:t<L_a(T)}\lambda_T.
\]
The most promising positive route is a dyadic dual-localization theorem: failure of a fixed sublinear envelope should produce, for arbitrarily large \(n\), a dual certificate concentrated on horizons comparable to \(n\), hence \(D_n=\Omega(n)\). This is unproved and should first be tested in finite price alphabets and the formal left-limit model.

The most promising negative route is no longer simple separated terminal blocks; those seem to be diluted when the later horizon is far away. Search instead for non-block interleavings with many overlapping low/high suffix maxima, or moving-scale block paths where no block dominates total time. For every proposed separator, check both \(D_n=o(n)\) for all prefixes and failure of the fixed-envelope criterion.

Useful regression tests for \(D_n\): singleton \(0^N,c\) blocks; close two-threshold \(0^N,c_0,c_1\) blocks; increasing \(0^N,C\) blocks where \(N\kappa(C)\le D_{N+m}\le N\kappa(C)+m\); separated \(0^N,c_0,0^L,c_1\) blocks; alternating \(1/2,1\) paths; sparse vanishing spikes; and superexponential uniform spikes.

Iteration 14 updates this program:

- Separated two-threshold blocks are now an exact regression test:
\[
D_{N+L+2}(0^N,c_0,0^L,c_1)
=N\,\frac{c_0(c_1-c_0)}{c_1}.
\]
This confirms that one old conflict can be made negligible in \(D_n/n\) by a long later block.
- The naive route "boundary defect implies \(D_m=\Omega(m)\)" is refuted. The boundary term in a dual scale split is exact cross-scale incompatibility, but it may depend on late shadow thresholds absent from the shorter prefix.
- A better positive target is a boundary-augmented prefix certificate: keep the late shadow objectives in a local LP, then look for conditions under which such augmented certificates convert into actual \(D_n\) mass at comparable scales.
- Finite alphabets are now the main proof sandbox. Use the exact left-limit dual
\[
D_n(P)=\max_{\lambda\in\Delta_n}
\left[
\sum_T\lambda_T\max_j c_j(L_j(T)-1)_+
-
\sum_{t<n}\max_j c_j\Lambda_{N_j(t)}
\right],
\]
with \(N_j(t)\) the next time after \(t\) that price level \(c_j\) appears and \(L_j(T)\) the last such time by \(T\). First prove or refute localization for two levels using the positive-part formula in LB-039; only then try \(k>2\) or finite-to-general quantization.
- Run finite LP experiments for small two-level paths. Correct regression checks should distinguish exact \(D_n=0\), bounded \(D_n=O(1)\), and normalized \(D_n=o(n)\); arbitrary alternating \(\ell,h\) prefixes do not have exact zero value.

Iteration 15 updates the two-level program:

- The clean single-drought formula is now an accepted regression test:
\[
D_{M+N+2}(h^M,0^N,\ell,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h).
\]
Use it to test any proposed two-level decomposition; old high history can fully damp a later low/high conflict.
- The raw stable-high gap
\[
Q_T=[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+
\]
is only the regret of the stable \(h^-\) policy. It is not a lower-bound certificate. The stress test \(0^N,\ell,0^L,h\), \(L\gg N\), has \(Q_{N+1}=\ell N\) but no comparable-scale \(D_n\) obstruction.
- Replace the \(Q_T\)-dichotomy by a resolved-surplus/debt recursion. A plausible local surplus is
\[
S=[\ell(R-1)-h(H-1)]_+
\]
where \(H\) is the last high before a high-free drought and \(R\) is the relevant low horizon; the surplus matters only relative to the later resolving high prefix. Low-level quote mass creates persistent high debt, so multiple lows and multiple droughts require cumulative bookkeeping.
- Formalize the post-low extension \(h^M,0^N,\ell,0^L,h\) before using it. It is plausible by analogy with the separated-block formula, but the iteration-15 report did not fully prove every intermediate horizon for \(M>0\).

Iteration 16 resolves that post-low extension:
\[
D_{M+N+L+2}(h^M,0^N,\ell,0^L,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h).
\]
Post-low zeros add no local conflict; they only dilute \(D_n/n\). This should now be a standard regression test for any two-level recursion.

Iteration 17 promotes the equal-low multi-low single-drought formula:
\[
D_n=[\ell(s_r-1)-h(M-1)_+]_+(1-\ell/h).
\]
The full reduction to cumulative \(\ell^-\)-mass variables is now accepted in the formal left-limit model. Use this as the base regression test for any two-level surplus/debt recursion.

Iteration 18 promotes the unequal-low one-drought full-to-reduced LP as an accepted local theorem in the formal left-limit model. The next genuinely hard cases are closed-form structure for this LP, repeated droughts sharing future highs, and cumulative high debt across many episodes. The first regression tests are:

- two-low path \(0,0.4,0.9,1\), whose exact one-drought value \(68/225\) exceeds the naive last-low value \(0.18\);
- three-low path \(0,0.2,0^8,0.3,0,0.4,1\), whose reduced-LP value \(2.91\) exceeds the naive last-low value \(2.88\) and should be checked as an exact theorem-level regression case.

Try deriving a pooling/PAVA-like or nested resource-allocation rule from the accepted unequal-low dual. Keep it local: the one-drought LP should not be assumed to compose across repeated droughts until high-debt interactions are explicitly controlled.
