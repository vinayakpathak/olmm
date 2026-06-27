## Summary

The assigned idea is sound and important: if “sublinear regret is possible” allows the learner to depend on both the process law \(P\) and the horizon \(T\), the learning problem collapses. For every process and every horizon, a learner can simply play an \(\varepsilon_T\)-optimal fixed comparator quote at every round. This gives regret at most \(\varepsilon_T=o(T)\), regardless of \(\beta\), \(\gamma\), or any tail condition.

So any nontrivial “only if” theorem must change the quantifier order: e.g. one universal learner over a class, a minimax guarantee, a horizon-oblivious process-aware learner, or a post-history uniform guarantee.

## Concrete Progress

Define, for a law \(P\) and horizon \(T\),
\[
V_T^P(a)=\mathbb E_P\sum_{t=1}^T a\,1\{\exists s\in\{t+1,\dots,T\}:P_s>a\},
\qquad
V_T^{*,P}=\sup_{a\in[0,1]}V_T^P(a).
\]

Because rewards are bounded by \(T\), \(V_T^{*,P}<\infty\). For every \(\varepsilon>0\), there exists \(a_{T,\varepsilon}\in[0,1]\) with
\[
V_T^P(a_{T,\varepsilon})\ge V_T^{*,P}-\varepsilon.
\]
The deterministic policy that posts \(a_{T,\varepsilon}\) at every time has expected reward exactly \(V_T^P(a_{T,\varepsilon})\), hence regret at most \(\varepsilon\).

This uses no delayed-feedback theorem, no tail assumption, and no future realization. It only uses process-law and horizon dependence.

## Claims Or Lemmas

**Lemma 1: Horizon/process-aware collapse.**  
For every price-process law \(P\), every horizon \(T\), and every \(\varepsilon>0\), there exists a deterministic constant-quote policy \(\pi_{P,T,\varepsilon}\) with
\[
R_T^P(\pi_{P,T,\varepsilon})\le \varepsilon.
\]
If the comparator supremum is attained, the regret can be \(0\).

**Corollary 1: No nontrivial tail condition is necessary in this regime.**  
Under the quantifier order
\[
\forall P\ \exists(\pi_{P,T})_{T\ge1}:\quad R_T^P(\pi_{P,T})=o(T),
\]
every process is learnable. Thus \(\beta(h)\to0\), \(\gamma(h)\to0\), and \(\Delta_T(H_T)=o(T)\) cannot be necessary.

**Definition audit conclusion.**  
The phrase “sublinear regret is possible” must specify at least:
- whether the learner may depend on \(P\);
- whether it may depend on \(T\);
- whether one policy must work for a whole class;
- whether regret is initial expected regret or conditional/post-history regret;
- whether guarantees are pointwise in \(P\) or uniform over a class.

## Proof Attempts

The collapse proof is complete.

Let \(\varepsilon_T=1\), or any \(o(T)\) sequence. For each \(T\), pick \(a_T\) satisfying
\[
V_T^P(a_T)\ge \sup_{a\in[0,1]}V_T^P(a)-\varepsilon_T.
\]
The learner posts \(a_t=a_T\) for all \(t\le T\). Then pathwise its reward is exactly the fixed-action reward of \(a_T\), so
\[
\mathbb E_P\sum_{t=1}^T r_t(a_t)
=
V_T^P(a_T)
\ge
V_T^{*,P}-\varepsilon_T.
\]
Therefore \(R_T^P\le\varepsilon_T=o(T)\).

This also handles the existing maximum-attainment issue: no max is needed, only a supremum and an \(\varepsilon_T\)-optimizer.

## Gaps And Risks

The collapse relies on a strong oracle interpretation: the learner may depend on the full process law and the terminal horizon. If “process-aware” is meant to include computability constraints, finite descriptions, or only partial distributional knowledge, those must be defined explicitly.

The horizon-oblivious process-aware regime does not collapse by this exact argument, because the chosen near-optimal quote \(a_T\) may vary with \(T\). It may still be too oracle-like, but that requires a separate argument.

A class-universal theorem has two variants:
\[
\forall P\in\mathcal C,\ R_T^P(\pi)=o(T)
\]
pointwise in \(P\), versus
\[
\sup_{P\in\mathcal C}R_T^P(\pi)=o(T)
\]
uniformly. These are materially different. A per-process tail condition \(\beta_P(h)\to0\) may support pointwise guarantees with universal schedules \(H_T\to\infty\), but uniform regret needs a uniform tail modulus over \(P\in\mathcal C\).

## Counterexamples Or Obstructions

The collapse is stronger than CE-001: sparse vanishing spikes are not merely a counterexample to \(\beta\)-necessity; under horizon/process-aware policies, every process is a counterexample to any nontrivial necessary tail condition.

The essential-sup form of \(\beta\) is aligned with post-history uniform guarantees, not ordinary initial expected regret. Rare histories can keep essential-sup tails large while contributing negligible expected regret, so this quantifier mismatch should be fixed before proving necessity.

The strict crossing condition still requires `sup`, not `max`, because comparator optima can fail to exist.

## Sources Consulted

Project files consulted: `problem.md`, all listed `working_notes/*.md`, and `iterations/iter_002/idea_01/idea.md`.

No new external web sources were needed for this definition audit; the argument is a direct quantifier check.

## Bibliography Candidates

None.

## Recommended Next Steps

1. Add the horizon/process-aware collapse as a formal proposition in the claim ledger.

2. Rewrite the target theorem using one explicit nontrivial regime, preferably one of:
\[
\exists \pi\ \forall P\in\mathcal C,\quad R_T^P(\pi)=o(T)
\]
or
\[
\inf_{\pi_T}\sup_{P\in\mathcal C}R_T^P(\pi_T)=o(T).
\]

3. If keeping \(\operatorname{ess\,sup}\)-style tails, define a matching post-history regret guarantee. If using ordinary initial expected regret, prefer averaged or horizon-level tail quantities.

4. Keep all comparator statements in `sup` form unless an attainment condition is added.