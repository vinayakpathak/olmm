## Summary

Idea 02 is ready to formalize as a sufficient upper theorem. The clean proof should replace the old $T\beta(H)$ term by the sharper comparator-gap term
$$
\delta_T^P(H)=V_T^P-V_{T,H}^P,
$$
and state all quantifiers for an unknown exogenous class $\mathcal C_T$. Under that model,
$$
\sup_{P\in\mathcal C_T}R_T^P
\le
C\sqrt{T(H+1)\log K}+\frac{T}{K}
+\sup_{P\in\mathcal C_T}\delta_T^P(H).
$$
This is a proof-ready sufficient theorem, not a necessity result.

## Concrete Progress

A self-contained proof strategy avoids relying heavily on an external delayed-experts theorem: split time into $H+1$ residue classes modulo $H+1$, run one Hedge instance per residue class, and observe that feedback from a round has arrived before that same instance is reused.

This gives the needed delayed finite-grid bound:
$$
R^H_{T,K}\le C\sqrt{T(H+1)\log K}.
$$

Then combine:

1. Delayed grid experts on $r_t^H(b)$.
2. Downward grid rounding:
$$
V_{T,H}^P\le V_{T,H,K}^P+T/K.
$$
3. Comparator-gap truncation:
$$
R_T^P\le R_{T,H}^P+\delta_T^P(H).
$$

## Claims Or Lemmas

**Theorem candidate.** Fix $T,H,K$. Let $\mathcal C_T$ be a class of exogenous laws on $P_{1:T}$, independent of learner actions. There is a horizon-aware learner, not knowing $P$, such that for every $P\in\mathcal C_T$,
$$
R_T^P
\le
C\sqrt{T(H+1)\log K}+T/K+\delta_T^P(H).
$$

**Sublinear corollary.** If there exist schedules $H_T,K_T$ with
$$
(H_T+1)\log K_T=o(T),\qquad T/K_T=o(T),
$$
and
$$
\sup_{P\in\mathcal C_T}\delta_T^P(H_T)=o(T),
$$
then uniform sublinear regret is achievable over $\mathcal C_T$.

Also, since $\delta_T^P(H)\le \Delta_T^P(H)\le T\beta(H)$ when $\beta$ is available, the old $\beta$-based theorem follows as a corollary.

## Proof Attempts

The strongest proof route is straightforward.

Define
$$
r_t^H(a)=a\mathbf 1\{\tau_t(a)\le \min(H,T-t)\}.
$$
For grid arms $b\in\mathcal G_K$, the full vector $(r_t^H(b))_{b\in\mathcal G_K}$ is determined by public future prices by time $t+\min(H,T-t)$, so delay is at most $H$.

Use $H+1$ Hedge copies by time residue. Each copy sees no delayed feedback on its subsequence. Summing standard Hedge regret over copies and applying Cauchy gives
$$
\sum_{j=0}^{H}\sqrt{n_j\log K}
\le
\sqrt{(H+1)T\log K}.
$$

Then downward rounding handles the continuum comparator, and the comparator-gap lemma transfers truncated regret to true regret.

## Gaps And Risks

The theorem must explicitly assume exogenous prices. If future prices can depend on learner actions, the counterfactual reward vectors for unplayed grid quotes are not fixed objects.

Use $\sup_a$, not $\max_a$, in the continuum theorem.

The result is only sufficient. Large $\delta_T(H)$ can be harmless for law-aware singleton processes, so this theorem should not be advertised as a characterization.

Adaptivity to unknown $\delta$ remains open. The current statement needs $H_T,K_T$ chosen from a known class-level envelope.

## Counterexamples Or Obstructions

The known terminal-spike singleton shows $\delta_T(H)=\Omega(T)$ for $H=o(T)$ while a law-aware learner has zero regret. So $\delta$ is a proof term, not a necessary condition.

Action-dependent prices remain the main model obstruction to the delayed full-information reduction.

## Sources Consulted

Local run notes: `problem.md`, working notes, assigned [idea.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/iterations/iter_002/idea_02/idea.md), and [inputs/delays.tex](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/inputs/delays.tex).

External: Joulani, Gyorgy, Szepesvari, [Online Learning under Delayed Feedback](https://proceedings.mlr.press/v28/joulani13.pdf); Joulani, Gyorgy, Szepesvari, [Delay-Tolerant Online Convex Optimization](https://ojs.aaai.org/index.php/AAAI/article/view/10320).

## Recommended Next Steps

Write this as the main upper theorem with the residue-splitting delayed-experts lemma included inline. Then add a short corollary recovering the older $T\beta(H)$ result via $\delta\le\Delta\le T\beta(H)$.