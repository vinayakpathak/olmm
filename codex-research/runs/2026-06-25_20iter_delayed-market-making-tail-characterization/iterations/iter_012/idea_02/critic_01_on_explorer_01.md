## Summary

The explorer’s core finite-prefix dual is worth pursuing. I do not see a fatal flaw in the LP/minimax formula under the intended setting: deterministic exogenous known prefix, horizon-oblivious randomized marginal strategy, expected pseudo-regret, and left-limit/infimum treatment of strict crossing.

The main critique is scope. The dual is an exact finite-prefix value, not yet a learnability characterization. The unresolved hard point is projective consistency: finite-prefix optimizers may depend on \(n\), so \(D_n(P)=o(n)\) is necessary for anytime sublinear regret but not proved sufficient.

## Issue List

- **Missing assumption:** The formula needs deterministic/exogenous known path. For stochastic paths it must be conditioned pathwise or probability-weighted; for endogenous prices \(M_{t,T}\) can depend on the quote, breaking the reduction.

- **Missing assumption:** The value is for expected pseudo-regret and randomized marginals. Correlations across actions are irrelevant only because rewards are linear in marginal laws on a fixed path.

- **Plausible but incomplete:** The finite action reduction should be written carefully. For each \(t\), actions can be reduced to formal left-limit quotes \(c^-\) for \(c\in C_t^n=\{M_{t,T}:T>t\}\), plus \(0\). In the original strict-crossing action space this is an infimum, not necessarily a minimum.

- **Plausible but incomplete:** The statement “\(D_n(P)=o(n)\) is necessary” is correct under the expected anytime model, but sufficiency is open. The explorer correctly flags this; it should be treated as the main gap.

- **Missing proof detail:** The recovery of same-path multi-threshold blocks should explicitly show how the dual’s horizon weights reproduce the CL-026 cancellation of intermediate threshold-round rewards. This is plausible but should not be asserted without the algebra.

- **Unsupported-as-proof citation:** Sion/minimax or LP duality supports the formal interchange. Caldentey-Liu-Lobel and adjacent market-making papers are background only, not proof support for this exact delayed-fill dual.

## Counterexamples Or Stress Tests

- **Alternating path:** \(P_{2k-1}=1/2,\ P_{2k}=1\). The explorer’s stress test survives: formal posting \(1^-\) at every time gives \(D_n=0\), while \(\sum_t\delta(C_t)\) is linear. Good evidence that this dual removes CE-018’s false positive.

- **Singleton terminal block:** \(0^N,c\). The dual should give \(D_{N+1}=0\), matching \(\kappa(\{c\})=0\). This checks that a known single threshold is not falsely hard.

- **Increasing two-threshold block:** \(0^N,1/2,1\). The dual should give \(D_{N+2}=N/4+O(1)\) in the strict implementation and exactly \(N/4\) in left-limit form. This is the minimal regression test.

- **Rare branch:** A large pathwise \(D_n\) on a small-probability branch does not imply large expected regret unless multiplied by branch probability. This is the same obstruction as CE-006/CE-011.

- **Optimizer consistency stress test:** Look for paths where \(D_n/n\to0\) but finite-prefix near-optimizers oscillate incompatibly. No counterexample found, but this is the right way to attack sufficiency.

## Literature Or Known-Result Conflicts

No conflict found. The finite-prefix dual is basically finite zero-sum game/LP duality, consistent with Sion-style minimax background. Luo-Schapiro’s unknown-horizon minimax work is conceptually relevant to horizon randomization, but it does not prove this path-specific delayed-fill dual. Robust/intertemporal pricing sources remain adjacent.

## What Survives The Critique

The following lemma is safe to promote, with caveats:

\[
D_n(P)=
\max_{\lambda\in\Delta_n}
\left[
\sum_{T\le n}\lambda_TV_T^*
-
\sum_{t<n}\sup_a\sum_{T>t}\lambda_T a1\{a<M_{t,T}\}
\right].
\]

It should be stated as a finite-prefix left-limit infimum theorem for deterministic exogenous paths. It also gives valid lower-bound certificates: if \(D_n(P)\ge \epsilon n\) infinitely often, then any horizon-oblivious expected-regret policy has \(\limsup_T R_T/T\ge\epsilon\).

## Bibliography Candidates

No new bibliography entries are necessary. Existing entries suffice:

- Maurice Sion, “On general minimax theorems,” *Pacific Journal of Mathematics*, 1958. https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-8/issue-1/On-general-minimax-theorems/pjm/1103040253.short. Relevance: minimax background for the finite dual.

- Haipeng Luo and Robert Schapire, “Towards Minimax Online Learning with Unknown Time Horizon,” ICML/PMLR 2014. https://proceedings.mlr.press/v32/luo14.html. Relevance: adjacent horizon-randomization/minimax framing.

- René Caldentey, Ying Liu, Ilan Lobel, “Intertemporal Pricing Under Minimax Regret,” *Operations Research*, 2017. https://doi.org/10.1287/opre.2016.1548. Relevance: adjacent robust dynamic pricing, not direct proof support.

## Recommended Next Checks

1. Write the finite-menu LP proof with explicit left-limit actions and the original-action \(\eta\)-implementation.
2. Compute \(D_n\) on \(0^N,c\), \(0^N,1/2,1\), equal-revenue blocks, alternating paths, and sparse spikes.
3. Investigate sufficiency via a stronger projective condition, not just \(D_n=o(n)\).
4. Keep stochastic and rare-event versions probability-weighted; do not reinterpret \(\lambda\) as process randomness.