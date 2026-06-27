## Summary

Under the finite-horizon public exogenous-price model, the Bayes myopic optimality claim is valid and should be promoted as a lemma. For a fixed prior $\pi$ over exogenous laws, actions have no exploration value because they do not affect future prices or reveal extra information beyond the public price history. Therefore the Bayes-optimal expected reward decomposes over times:
$$
\sup_A \mathbb E_{\bar P_\pi,A}\sum_{t=1}^T r_t(a_t)
=
\sum_{t=1}^T
\mathbb E_{\bar P_\pi}\left[
\sup_{a\in[0,1]}
a\,\bar P_\pi(M_t>a\mid P_{1:t})
\right],
$$
up to the usual measurable-selection caveat; on a finite grid this is exact.

This supports the posterior-predictive term in $\Psi_T(\pi)$, but it does not by itself prove the later minimax equality $\inf_A\sup_\theta R_T^\theta=\sup_\pi\Psi_T(\pi)$.

## Concrete Progress

A clean proof route is available.

Let
$$
M_t=\max_{t<s\le T}P_s,\qquad r_t(a)=a\mathbf{1}\{M_t>a\},
$$
and let $\bar P_\pi$ be the mixture law induced by prior $\pi$. Define
$$
g_t^\pi(h_t,a)
=
\mathbb E_{\bar P_\pi}[r_t(a)\mid P_{1:t}=h_t]
=
a\,\bar P_\pi(M_t>a\mid P_{1:t}=h_t).
$$

For any possibly randomized learner, conditional on its decision-time information $\mathcal I_t$, its action distribution $\mu_t(\cdot\mid \mathcal I_t)$ satisfies
$$
\mathbb E[r_t(a_t)\mid \mathcal I_t]
=
\int g_t^\pi(P_{1:t},a)\,\mu_t(da\mid \mathcal I_t)
\le
\sup_a g_t^\pi(P_{1:t},a),
$$
provided prices are exogenous and the learner’s private randomness is independent of the price law.

Summing over $t$ gives the Bayes reward upper bound. A policy that chooses a measurable maximizer, or an $\varepsilon$-maximizer, at each time attains this bound, or approaches it arbitrarily closely. On a finite action grid, the maximizer exists and measurability is straightforward.

## Claims Or Lemmas

**Lemma: Bayes Myopic Optimality For Exogenous Prices.**  
Fix finite $T$, a prior $\pi$ over exogenous public-price laws, and a learner that observes $P_{1:t}$ before choosing $a_t$. If learner actions do not affect future prices or future observations beyond deterministic trade events implied by public prices, then the Bayes-optimal policy maximizes
$$
a\,\bar P_\pi(M_t>a\mid P_{1:t})
$$
separately at each time $t$.

**Finite-Grid Version.**  
For a finite grid $\mathcal G$,
$$
\sup_A \mathbb E_{\bar P_\pi,A}\sum_t r_t(a_t)
=
\sum_t
\mathbb E_{\bar P_\pi}
\left[
\max_{a\in\mathcal G} g_t^\pi(P_{1:t},a)
\right].
$$
This is theorem-ready.

**Continuum Version.**  
For $[0,1]$, replace maxima by suprema unless extra regularity gives attainment. Finite-grid downward rounding gives a $T/K$ approximation, consistent with the known-law oracle lemma.

## Proof Attempts

The strongest proof is not full dynamic programming but a direct conditional envelope argument.

For any learner,
$$
\mathbb E_{\bar P_\pi,A}\sum_t r_t(a_t)
=
\sum_t \mathbb E_{\bar P_\pi,A}
\left[
\mathbb E[r_t(a_t)\mid \mathcal I_t]
\right].
$$
Since $a_t$ cannot change $M_t$’s conditional law under exogeneity,
$$
\mathbb E[r_t(a_t)\mid \mathcal I_t,a_t=a]
=
g_t^\pi(P_{1:t},a).
$$
Thus randomized actions are convex combinations of $g_t^\pi(P_{1:t},a)$, never better than the pointwise supremum. Choosing the pointwise maximizer at every time attains all per-time envelopes simultaneously because current actions do not alter future public histories.

This proves the no-exploration claim exactly in the finite-grid model and as a value statement in the continuum model.

## Gaps And Risks

The lemma requires public exogenous prices. If future prices depend on quotes, the conditional law of $M_t$ can depend on $a_t$, and myopic optimality can fail.

The continuum action space needs care. Strict thresholds can prevent maximizers from existing, so final statements should use $\sup_a$, finite grids, or measurable $\varepsilon$-selectors.

The result validates the Bayes reward term in $\Psi_T(\pi)$, but not the asserted minimax equality. A separate minimax theorem is still needed for finite classes/grids, and compactness/measurability assumptions are needed beyond that.

Conditioning only on $P_{1:t}$ is valid only because the learner’s private randomness and past actions carry no information about $\theta$ beyond the public price history.

## Counterexamples Or Obstructions

No obstruction appears under the stated exogenous public-price model.

Obstructions arise if:
- prices are action-dependent;
- actions reveal hidden information to the market;
- the learner observes censored/private feedback not determined by $P_{1:t}$;
- rewards are coupled across quotes by inventory, budget, or capacity constraints;
- exact maximizers are claimed in $[0,1]$ without an attainment assumption.

## Sources Consulted

No web sources.

Local sources consulted: `problem.md`, all requested `working_notes/*.md`, `inputs/delays.tex`, `iterations/iter_004/idea_02/idea.md`, `iterations/iter_004/solver_attempt.md`, `iterations/iter_004/solution_critic_01.md`, `iterations/iter_004/solution_critic_02.md`, and `iterations/iter_004/solution_gate.md`.

## Recommended Next Steps

State this as a standalone lemma in the final write-up before defining $\Psi_T(\pi)$.

Prove the finite-grid version first. Then add a continuum corollary with $T/K$ discretization error or $\varepsilon$-optimal selectors.

Keep the minimax equality separate: Bayes myopic optimality proves the Bayes value for a fixed prior, not least-favorable-prior exactness.