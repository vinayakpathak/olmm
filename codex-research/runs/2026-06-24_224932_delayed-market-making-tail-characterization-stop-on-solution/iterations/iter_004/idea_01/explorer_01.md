## Summary

The finite-grid minimax identity looks provable under clean finite assumptions. The right proof strategy is not tail-based: it is a finite statistical decision game where the Bayes-optimal learner acts myopically because actions do not affect future prices or information.

The solver’s displayed formula must be rewritten with a finite quote grid throughout. With continuum $\sup_{a\in[0,1]}$ inside a “finite-grid” theorem, exact equality is false.

## Concrete Progress

A safe theorem target is:

Let $\Theta$ be finite, $G\subset[0,1]$ finite, prices exogenous, and policies randomized with actions in $G$. Define
$$
V_\theta^G=\max_{a\in G}\sum_{t=1}^T \mathbb E_\theta r_t(a).
$$
For prior $\pi$,
$$
\Psi_G(\pi)=
\sum_\theta \pi_\theta V_\theta^G
-
\sum_{t=1}^T
\mathbb E_{\bar P_\pi}
\left[
\max_{a\in G} a\,\bar P_\pi(M_t>a\mid P_{1:t})
\right].
$$
Then the intended identity should be
$$
\inf_A\sup_{\theta\in\Theta}
\left(V_\theta^G-\mathbb E_\theta\sum_t r_t(a_t)\right)
=
\sup_{\pi\in\Delta(\Theta)} \Psi_G(\pi).
$$

## Claims Or Lemmas

- **Policy marginalization lemma:** under exogenous prices, any policy can be replaced, for expected reward purposes, by kernels $q_t(a\mid P_{1:t})$. Past learner randomness/actions carry no extra information about $\theta$ given public prices.

- **Fixed-prior Bayes lemma:** for a prior $\pi$, Bayes reward decomposes by time and history. The optimal action at $t$ maximizes
$$
  a\,\bar P_\pi(M_t>a\mid P_{1:t})
$$
  over $a\in G$. No exploration value exists.

- **Finite minimax lemma:** with finite $\Theta$, finite $G$, bounded rewards, and randomized policies, Sion/von Neumann style minimax should give equality between minimax regret and least-favorable Bayes regret.

- **Grid approximation lemma:** after proving the grid theorem, continuum actions can likely be compared within $O(T/K)$ by downward rounding, but that is approximate, not exact.

## Proof Attempts

Proof route:

1. Define $g_{t,\theta}(h,a)=\mathbb E_\theta[r_t(a)\mid P_{1:t}=h]$.

2. For a randomized Markov kernel policy $q$,
$$
   L_\theta(q)=\sum_t \mathbb E_\theta\sum_{a\in G}q_t(a\mid P_{1:t})g_{t,\theta}(P_{1:t},a).
$$

3. For fixed $\pi$, maximize $\sum_\theta\pi_\theta L_\theta(q)$. Since $q_t$ only affects the $t$-summand, choose a pointwise maximizer over $G$. Finite $G$ makes the selector measurable.

4. Apply minimax:
$$
   \inf_q\sup_\theta R_\theta(q)
   =
   \sup_\pi\inf_q\sum_\theta\pi_\theta R_\theta(q).
$$
   The right side becomes $\sup_\pi\Psi_G(\pi)$.

A robust formalization can use the convex compact set of attainable risk vectors rather than the full policy space directly.

## Gaps And Risks

- Need a precise compactness/minimax argument for measurable kernels over continuous price histories.

- The theorem requires randomized policies. Deterministic-only minimax equality is not expected.

- The current solver formula mixes grid and continuum quantities. Fix before proving anything.

- For continuum actions, strict thresholds can prevent maximizers. Use $\sup$, $\varepsilon$-selectors, or grid approximation.

- The identity is an information-value characterization, close to the minimax value itself. It is not a scalar tail characterization.

- Action-dependent prices break the proof because policies may affect future observations and rewards.

## Counterexamples Or Obstructions

- If $G=\{0,1/2\}$ but $V_\theta$ uses $[0,1]$, a deterministic terminal price above $1/2$ already shifts the comparator value, so exact finite-grid equality fails.

- Singleton known-law classes can have negative Bayes regret because adaptive posterior-predictive play may beat the best fixed quote. For “sublinear regret,” use positive part or limsup upper-regret convention.

- Infinite law classes may lack a least favorable prior without compactness or closure assumptions.

## Sources Consulted

Local files only; no web search.

- `problem.md`
- `working_notes/canonical_summary.md`
- `working_notes/claim_ledger.md`
- `working_notes/lemma_bank.md`
- `working_notes/failed_attempts.md`
- `working_notes/counterexamples.md`
- `working_notes/literature_map.md`
- `working_notes/promising_directions.md`
- `working_notes/iteration_summaries.md`
- `iterations/iter_004/idea_01/idea.md`
- `iterations/iter_004/solver_attempt.md`
- `iterations/iter_004/solution_critic_01.md`
- `iterations/iter_004/solution_critic_02.md`
- `iterations/iter_004/solution_gate.md`

## Recommended Next Steps

1. Write the finite $\Theta$, finite $G$ theorem with grid-restricted $V_\theta^G$ and $\Psi_G$.

2. Prove minimax via attainable risk vectors or weak-* compactness of stochastic kernels.

3. Add a separate $O(T/K)$ continuum approximation lemma.

4. Test the identity on singleton known-law and hidden-terminal examples before using it as final characterization language.