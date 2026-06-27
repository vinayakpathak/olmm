## Summary

The idea is viable as a reusable lower-bound lemma, but only with stronger hypotheses than “positive local \(\kappa\).” A correct transfer statement should be conditional and bookkeeping-heavy:

\[
\max_{u\in\mathcal U} R_u \;\ge\; p\,|I|\,\kappa_I(\mathcal U)-B
\]

provided the learner has the same conditional prefix action law across candidates, the common-prefix event has probability at least \(p\), the prefix comparator value really lower-bounds the global fixed-action comparator, and outside-prefix learner surplus is capped by \(B\).

The proof is elementary once those hypotheses are explicit. The main danger is not the algebra; it is applying the lemma in regimes where the same-prefix law, probability weighting, or suffix cap silently fails.

## Concrete Progress

A clean transfer lemma should use this structure.

Let \(\mathcal A\) be a finite action grid and \(\mathcal U\) a finite candidate set. For each \(u\in\mathcal U\), let \(T_u\) be its horizon/law, \(E_u\) a common-prefix event, \(p_u=\Pr_u(E_u)\), and \(I\) the tested prefix times. Define

\[
\phi_{u,t}(a)=\mathbb E_u[r_t(a)\mid E_u],
\qquad
v_u=\sup_{b\in\mathcal A}\sum_{t\in I}\phi_{u,t}(b).
\]

Define

\[
\kappa_I(\mathcal U)
=
\frac1{|I|}
\inf_{\mu_t\in\Delta(\mathcal A)}
\sup_{u\in\mathcal U}
\left[
v_u-\sum_{t\in I}\int \phi_{u,t}(a)\,d\mu_t(a)
\right].
\]

The transfer proof works if, for the learner under comparison:

1. Conditional on \(E_u\), the action marginal at each \(t\in I\) is the same \(\mu_t\), independent of \(u\).
2. More precisely, the payoff factorization holds:
\[
\mathbb E_u[1_{E_u}r_t(A_t)]
=
p_u\int \phi_{u,t}(a)\,d\mu_t(a).
\]
Same action marginals alone are enough only when \(E_u\) fixes the relevant observed prefix, as in deterministic block gadgets.
3. There are constants \(C_u,B_u\) such that
\[
V_u^* \ge p_u v_u+C_u
\]
and the learner’s expected reward outside the tested prefix-on-\(E_u\) is at most
\[
C_u+B_u.
\]

Then

\[
R_u
\ge
p_u\left[
v_u-\sum_{t\in I}\int \phi_{u,t}(a)d\mu_t(a)
\right]
-B_u.
\]

Hence if \(p_u\ge p\) and \(B_u\le B\),

\[
\max_u R_u\ge p\,|I|\kappa_I(\mathcal U)-B.
\]

## Claims Or Lemmas

**Lemma 1: Conditional Kappa Transfer.**  
The transfer inequality above is proved under the explicit prefix-law, comparator-lower-bound, and outside-surplus assumptions. This should be promotable to the lemma bank.

**Lemma 2: Finite-Grid Duality.**  
For finite \(\mathcal A,\mathcal U\),

\[
|I|\kappa_I(\mathcal U)
=
\max_{\lambda\in\Delta(\mathcal U)}
\left[
\sum_u\lambda_u v_u
-
\sum_{t\in I}
\max_{a\in\mathcal A}\sum_u\lambda_u\phi_{u,t}(a)
\right].
\]

This is just finite minimax / LP duality.

**Lemma 3: Two-Threshold Recovery.**  
For deterministic zero-block thresholds \(0<c_0<c_1\le1\),

\[
\phi_c(a)=a1\{a<c\},
\qquad
v_c=c,
\]

and the dual gives

\[
\kappa(\{c_0,c_1\})
=
\frac{c_0(c_1-c_0)}{c_1}.
\]

The maximizing dual weight is \(\lambda_1=c_0/c_1\). This recovers the accepted \(1/4\) at \(c_0=1/2,c_1=1\).

## Proof Attempts

The main proof is a regret decomposition.

For each candidate \(u\),

\[
R_u
=
V_u^*-\mathbb E_u[\text{learner total reward}].
\]

Use the comparator lower bound

\[
V_u^*\ge p_u v_u+C_u.
\]

Split learner reward into tested prefix reward on \(E_u\) plus outside reward. By the prefix payoff identity,

\[
\mathbb E_u[1_{E_u}\sum_{t\in I}r_t(A_t)]
=
p_u\sum_{t\in I}\int \phi_{u,t}(a)d\mu_t(a).
\]

By the outside-surplus cap, outside reward is at most \(C_u+B_u\). Therefore

\[
R_u
\ge
p_u v_u+C_u
-
p_u\sum_{t\in I}\int\phi_{u,t}d\mu_t
-
(C_u+B_u),
\]

which proves

\[
R_u\ge p_u d_u(\mu)-B_u.
\]

Taking the candidate with \(d_u(\mu)\ge |I|\kappa_I(\mathcal U)\) proves the transfer lemma.

For the same-path horizon-oblivious block \(0^N,c_0,c_1\), the no-\(O(1)\) sharpening seems valid with sup comparators: at the longer horizon, the comparator can also earn approximately \(c_1\) on the intermediate quote, canceling the learner’s possible intermediate reward bounded by \(c_1\). With \(\eta\)-comparators, expect an \(O(\eta N)+O(\eta)\) loss instead.

## Gaps And Risks

The biggest missing hypothesis in the solver shorthand is payoff factorization. If \(E\) contains multiple histories and the learner’s action is correlated with future-relevant hidden information inside \(E\), identical action marginals are not enough.

The lemma lower-bounds \(\max_u R_u\), not regret on a stochastic mixture over \(u\). This avoids the known pseudo-regret mixture failure.

For process-aware learners facing different candidate laws, identical observed prefixes do not force identical actions; the learner may use the known law as side information. The lemma applies cleanly to process-unaware universal learners, or to horizon-oblivious same-path policies where the same early action rule is forced.

Strict crossing still requires `sup` comparators or \(\eta\)-comparators. Do not write this with `max` unless grid thresholds avoid nonattainment.

## Counterexamples Or Obstructions

CE-011 is exactly the obstruction: positive local \(\kappa\) is a false positive without suffix/outside control. A long post-divergence suffix can compensate the local prefix deficit.

Rare hard prefixes only contribute their probability. Conditional \(\kappa=\Omega(1)\) on an event of probability \(p_N\) gives at best \(p_N |I|\kappa\) expected regret.

The horizon/process-aware oracle collapse still blocks any instance-wise necessity theorem: a learner knowing both law and horizon can play an approximately optimal fixed quote.

## Sources Consulted

Local run files: `problem.md`, all requested `working_notes/*.md`, `iterations/iter_006/idea_02/idea.md`, and the relevant `iterations/iter_006/solver_attempt.md`.

External background checked:
- Maurice Sion, “On general minimax theorems,” Pacific Journal of Mathematics 8(1):171-176, 1958. Project Euclid: https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-8/issue-1/On-general-minimax-theorems/pjm/1103040253.short
- David Blackwell, “An analog of the minimax theorem for vector payoffs,” Pacific Journal of Mathematics 6(1):1-8, 1956. Project Euclid: https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-6/issue-1/An-analog-of-the-minimax-theorem-for-vector-payoffs/pjm/1103044235.short

## Bibliography Candidates

No new bibliography candidates. Sion 1958 and Blackwell 1956 are already present and remain relevant as minimax/approachability background, not as direct market-making results.

## Recommended Next Steps

1. Promote the conditional kappa transfer lemma with the exact \(p,C_u,B_u\) bookkeeping.
2. Add the finite-grid dual as a separate lemma.
3. Apply it explicitly to the universal block theorem and same-path horizon-oblivious theorem.
4. For stochastic common-prefix events, either restrict \(E\) to a fixed observed history or define a history-indexed \(\kappa\) and integrate it over the prefix-history law.