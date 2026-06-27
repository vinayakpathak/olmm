## Summary

The law-aware oracle lemma is valid in the finite-horizon, known-law, exogenous/action-independent model, with `sup_a` rather than `max_a`. For every known exogenous law on $P_{1:T}$, a horizon-aware learner can achieve regret at most $T/K$ by maximizing conditional expected reward over a $K$-grid at each time. Taking $K=T$ gives $O(1)$ regret, so no nontrivial fixed-law tail condition can be necessary under these quantifiers.

This is an oracle/information-theoretic result. It does not survive unknown laws, action-dependent prices, or possibly an anytime requirement where the policy cannot depend on $T$.

## Concrete Progress

Verified the core proof route:

Let
$$
M_t=\max_{t<s\le T}P_s
$$
with empty max giving no trade at $t=T$. For a known exogenous law and current history $\mathcal F_t=\sigma(P_1,\dots,P_t)$, define
$$
g_t(a)=\mathbb E[r_t(a)\mid \mathcal F_t]
= a\,\Pr(M_t>a\mid \mathcal F_t).
$$

Use grid
$$
\mathcal G_K=\{0,1/K,\dots,(K-1)/K\}.
$$
At time $t$, choose a measurable grid maximizer
$$
a_t\in \arg\max_{b\in\mathcal G_K} g_t(b).
$$

For every fixed $a\in[0,1]$, let $b=\lfloor Ka\rfloor/K$, capped at $(K-1)/K$. Then $b\le a$, $a-b\le 1/K$, and pathwise
$$
a\mathbf{1}\{M_t>a\}
\le
b\mathbf{1}\{M_t>b\}+1/K.
$$
Thus conditionally,
$$
g_t(a)\le g_t(b)+1/K\le g_t(a_t)+1/K.
$$
Summing and taking expectations:
$$
\mathbb E\sum_{t=1}^T r_t(a_t)
\ge
\mathbb E\sum_{t=1}^T r_t(a)-T/K.
$$
Taking $\sup_a$,
$$
R_T
=
\sup_{a\in[0,1]}\mathbb E\sum_t r_t(a)
-
\mathbb E\sum_t r_t(a_t)
\le T/K.
$$

## Claims Or Lemmas

**Verified lemma.** For any finite-horizon known exogenous law on $[0,1]^T$, there exists a horizon-aware deterministic learner with regret $\le T/K$ against the best fixed quote in supremum value.

**Measurability is fine.** Since $[0,1]^T$ is standard Borel, regular conditional probabilities exist. For finite $\mathcal G_K$, choosing the smallest grid maximizer is measurable up to null-history choices.

**Strict threshold causes no problem.** Downward rounding is exactly the right direction: $M_t>a\Rightarrow M_t>b$. Atoms only create discontinuities/nonattainment, not a failure of the grid inequality.

**Nonattainment matters for statements.** The theorem should use $\sup_a$, not $\max_a$. Example: $T=2$, deterministic $P_2=1$. Then $r_1(a)=a\mathbf{1}\{a<1\}$, whose supremum is $1$ but is not attained.

## Proof Attempts

The proof above appears complete under these assumptions:

1. finite horizon $T$ is known;
2. the learner knows the law or at least the conditional probabilities $\Pr(M_t>b\mid\mathcal F_t)$ for all grid $b$;
3. prices are exogenous/action-independent;
4. regret comparator is $\sup_a\mathbb E\sum_t r_t(a)$.

The proof also works for non-iid, adaptive-in-history, nonstationary, and horizon-dependent exogenous laws, as long as the relevant horizon-$T$ law is known to the learner.

## Gaps And Risks

This is not computational unless the conditional expectations can actually be computed. As a learning-theoretic oracle result, it is solid; as an efficient algorithmic result, it needs representation assumptions.

It does not address unknown-law or minimax-over-class learning. In those settings the learner cannot use the conditional reward curve, and the hidden-terminal lower bound remains relevant.

It fails or becomes ill-defined if future prices depend on learner actions. Then $M_t$ under a counterfactual quote $b$ may not be distributed like $M_t$ under the realized policy.

It is horizon-aware. If one demands a single anytime policy that cannot depend on $T$, this exact proof does not apply.

## Counterexamples Or Obstructions

The iid uniform example remains a valid obstruction to raw $\beta$-necessity: $\beta(h)=1$ for all $h$, yet the known-law oracle has $O(1)$ regret.

The terminal-spike singleton remains a valid obstruction to $\Delta_T(H)=o(T)$ as necessity: truncation loss can be linear while known-law regret is zero.

The deterministic $P_2=1$ example shows why `max_a` is unsafe with strict threshold trades.

## Sources Consulted

No web sources consulted.

Read local files: `problem.md`, all requested `working_notes/*.md`, `iterations/iter_002/idea_01/idea.md`, plus `iterations/iter_002/solver_attempt.md`, `iterations/iter_001/solver_attempt.md`, and `inputs/delays.tex`.

## Recommended Next Steps

State the oracle lemma formally in the notes with explicit quantifiers: known finite-horizon exogenous law, horizon-aware learner, `sup_a`, regret $\le T/K$.

Use it as a hard boundary: any necessity theorem must be minimax/unknown-law, computational, action-dependent, or anytime. For the current project’s main theorem, this strongly favors a characterization based on valuable unpredictable delayed reward, not raw delay tails.