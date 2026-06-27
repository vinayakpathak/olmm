## Verdict

SOLVED: no

The original iff is false under the literal instance-wise pseudo-regret reading. The strongest clean progress is a replacement picture: truncation tails are sufficient, but necessity requires a prefix-incompatibility / indistinguishability quantifier, not raw delay tails.

## Candidate Solution Or Main Attempt

A useful replacement theorem is:

1. If prices are public/exogenous and truncated grid rewards are full-information delayed feedback, then
\[
R_T \le C\sqrt{T(H+1)\log K}+T/K+\Gamma_T(H),
\]
where
\[
\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a).
\]
Since \(\Gamma_T(H)\le \Delta_T(H)\le T\gamma(H)\le T\beta(H)\), \(\beta(h)\to0\) still implies sublinear regret.

2. Necessity should be stated as a lower-bound transfer theorem: if several candidate continuations/horizons force the learner to use the same prefix action law, and outside-prefix rewards are capped, then a local simultaneous-payoff gap forces regret.

For a prefix \(I\), candidates \(u\in\mathcal U\), payoff functions \(\phi_{u,t}(a)\), and
\[
v_u=\sup_b\sum_{t\in I}\phi_{u,t}(b),
\]
define
\[
\kappa_I(\mathcal U)
=\frac1{|I|}\inf_{\mu_t}\sup_{u\in\mathcal U}
\left[
v_u-\sum_{t\in I}\int \phi_{u,t}(a)\,d\mu_t(a)
\right].
\]
If the learner’s prefix marginals are the same for all \(u\), and all non-prefix learner reward is at most \(B\), then
\[
\max_{u\in\mathcal U}R_u\ge |I|\kappa_I(\mathcal U)-B.
\]

## Concrete Lemmas Or Reductions

For finite action grid and finite \(\mathcal U\), minimax gives
\[
|I|\kappa_I(\mathcal U)
=
\max_{\lambda\in\Delta(\mathcal U)}
\left[
\sum_u\lambda_u v_u
-
\sum_{t\in I}\max_a\sum_u\lambda_u\phi_{u,t}(a)
\right].
\]

For two zero-block terminal thresholds \(0<c_0<c_1\le1\),
\[
\phi_c(a)=a1\{a<c\},\qquad v_c=Nc,
\]
so
\[
\kappa(\{c_0,c_1\})
=
\frac{c_0(c_1-c_0)}{c_1}.
\]
The optimum uses weight \(\lambda_1=c_0/c_1\). This recovers the accepted \(1/4\) constant at \(c_0=1/2,c_1=1\).

This also sharpens the same-path horizon-oblivious block: for path \(0^N,c_0,c_1\), horizons \(N+1,N+2\), old prefix length \(M\),
\[
\max\{R_{N+1},R_{N+2}\}
\ge
N\frac{c_0(c_1-c_0)}{c_1}-M
\]
using sup comparators. The previous \(O(1)\) intermediate-round loss can be removed because at horizon \(N+2\) the comparator’s extra quote at time \(N+1\) has supremum \(c_1\), canceling the learner’s possible intermediate payoff bounded by \(c_1\).

## Gaps And Failure Points

This is not a global characterization. A positive local \(\kappa\) only transfers to regret when:

- the learner really has the same prefix action law across candidates;
- post-divergence rewards cannot compensate the prefix loss;
- rare hard-prefix events are probability-weighted;
- regret uses \(\sup_a\), or strict-crossing nonattainment is handled by \(\eta\)-comparators.

Raw \(\beta,\gamma,\Delta_T,\Gamma_T\) still do not look necessary instance-wise.

## Counterexamples Or Obstructions

The horizon/process-aware oracle collapse remains decisive: for any exogenous law \(P\) and horizon \(T\), a learner that knows both can play an \(\varepsilon_T\)-optimal fixed quote for \(V_T^P(a)\), giving regret \(\le\varepsilon_T\) for every process.

Sparse vanishing spikes still refute raw \(\beta\)-necessity: \(\beta(h)=1\) for all \(h\), but always quoting zero has \(O(1)\) regret.

A uniform-spike variant also stresses \(\gamma\) and \(\Delta_T\): put \(P_{S_n}=U_n\sim{\rm Unif}[0,1]\), zeros otherwise. Fixed-action value is proportional to \(a(1-a)\), so always quoting \(1/2\) is optimal, while long positive-payoff delays keep \(\gamma\) nonvanishing and \(\Delta_{S_n}(H)=\Omega(S_n)\) for \(H=o(S_n)\).

## Literature And Bibliography Candidates

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari, “Online Learning under Delayed Feedback,” ICML 2013. Relevant for the delayed full-information reduction. https://proceedings.mlr.press/v28/joulani13.html
- Davide Maran, Marcello Restelli, “Online Market Making and the Value of Observing the Order Book,” arXiv:2605.19584, accepted COLT 2026. Adjacent market-making regret model with action-dependent order-book feedback, not this delayed-fill characterization. https://arxiv.org/abs/2605.19584
- Alexander Ryabchenko, Idan Attias, Daniel M. Roy, “Capacity-Constrained Online Convex Optimization with Delayed Feedback,” arXiv:2606.11711, 2026. New delayed/capacity/OCO source; reinforces outstanding-information and tracking-capacity viewpoints over raw delay length. https://arxiv.org/abs/2606.11711
- Alexander Ryabchenko, Idan Attias, Daniel M. Roy, “A Reduction from Delayed to Immediate Feedback for Online Convex Optimization with Improved Guarantees,” arXiv:2602.02634, 2026. Supports adaptive total-delay/outstanding-observation framing. https://arxiv.org/abs/2602.02634

## Promising Ideas To Explore

Formalize the \(\kappa\)-transfer theorem as the next accepted lemma, then test it against CE-001, CE-003, CE-005, CE-006, and CE-011.

A plausible characterization should involve decision-relevant missing information: indistinguishable prefixes with incompatible fixed-quote optima, weighted by event probability and protected from suffix compensation.

## Notes For Critics

Check the no-\(O(1)\) sharpening for the same-path block carefully under strict crossing. It is clean with sup comparators; an \(\eta\)-comparator proof will lose \(O(\eta N)\), not a fixed intermediate constant.

The lower bounds remain universal/minimax or horizon-oblivious prefix-conflict results. They must not be restated as instance-wise tail necessity.