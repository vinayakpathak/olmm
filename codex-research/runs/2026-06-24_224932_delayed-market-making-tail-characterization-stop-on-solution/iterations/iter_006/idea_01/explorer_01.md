## Summary

The finite-grid iff claim is valid under the precise finite-class, public-exogenous, randomized-policy, upper-regret formulation:
$$
\left(\mathcal R^{[0,1]}_T(\Theta_T)\right)_+=o(T)
\quad\Longleftrightarrow\quad
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+=o(T),
$$

provided $G_T=\{0,1/T,\ldots,(T-1)/T\}$ and the continuum regret value is the minimax signed upper-regret value. The discrepancy is at most $T/K=1$, so positive parts are equivalent asymptotically.

This is a minimax value characterization, not a scalar tail characterization, and not an exact continuum least-favorable-prior formula.

## Concrete Progress

For each finite horizon-indexed class $\Theta_T$, define
$$
\mathcal R^{[0,1]}_T
=
\inf_A \sup_{\theta\in\Theta_T}
\left(V_\theta-\mathbb E_{\theta,A}\sum_t r_t(a_t)\right),
$$

with $V_\theta=\sup_{a\in[0,1]}\mathbb E_\theta\sum_t r_t(a)$. Define the grid value $\mathcal R^{G_T}_T$ analogously with both learner and comparator restricted to $G_T$.

The accepted finite-grid identity gives
$$
\mathcal R^{G_T}_T
=
\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi).
$$

The accepted grid-continuum comparison gives
$$
\left|\mathcal R^{[0,1]}_T-\mathcal R^{G_T}_T\right|\le T/K.
$$

With $K=T$,
$$
\left|
\left(\mathcal R^{[0,1]}_T\right)_+
-
\left(\sup_\pi \Psi_{G_T}(\pi)\right)_+
\right|
\le 1,
$$

because $x\mapsto x_+$ is 1-Lipschitz. This proves the desired iff for sublinear upper regret.

## Claims Or Lemmas

1. **Finite-grid minimax/Bayes identity:** proved under finite $\Theta_T$, finite $G_T$, randomized policies, and public exogenous prices.

2. **Grid-to-continuum minimax comparison:** proved with error $T/K$ by downward rounding comparator quotes and learner actions.

3. **Positive-part convention is necessary:** the signed minimax value can be negative when adaptive policies beat the best fixed quote, so the correct learnability object is $(\mathcal R_T)_+$, not $\mathcal R_T$ as a signed number.

## Proof Attempts

The clean proof chain is:
$$
\mathcal R^{[0,1]}_T
=
\mathcal R^{G_T}_T + O(T/K)
=
\sup_\pi \Psi_{G_T}(\pi)+O(T/K).
$$

The finite-grid identity should be proved via the attainable reward set
$$
C=\{(L_\theta(A))_{\theta\in\Theta_T}:A\text{ randomized grid policy}\}\subset\mathbb R^{\Theta_T}.
$$

Convexity comes from ex-ante randomization. Passing to $\overline C$, finite-dimensional minimax gives
$$
\inf_{x\in C}\max_\theta(V_\theta^G-x_\theta)
=
\sup_\pi
\left[
\sum_\theta \pi_\theta V_\theta^G
-
\sup_A\sum_\theta\pi_\theta L_\theta(A)
\right].
$$

Then the fixed-prior Bayes-myopic lemma identifies the support function term with the posterior predictive grid envelope defining $\Psi_G$.

## Gaps And Risks

The theorem is only finite-class and finite-grid before approximation. Infinite classes need compactness or finite-subclass reductions.

Do not state an exact continuum formula $\mathcal R^{[0,1]}_T=\sup_\pi\Psi_{[0,1]}(\pi)$ unless measurable selectors and strict-threshold nonattainment are handled.

The result assumes public exogenous prices. It does not cover action-dependent markets.

Randomized policies are essential. Deterministic-policy minimax values can differ.

## Counterexamples Or Obstructions

- Grid identity with continuum $V_\theta$ is false: a singleton law with $P_2=3/4$ and $G=\{0,1/2\}$ has grid comparator $1/2$ but continuum supremum $3/4$.
- Deterministic policies break minimax/Bayes equality in the two-world $G=\{0.5,0.9\}$ test.
- Signed regret can be negative, so positive-part upper regret is the right convention.

## Sources Consulted

Local project files only: `problem.md`, all listed `working_notes/*.md`, and `iterations/iter_006/idea_01/idea.md`. No web search used.

## Recommended Next Steps

Write this as a theorem with three separated objects: continuum minimax value, grid minimax value, and grid Bayes value $\sup_\pi\Psi_G$. State the final asymptotic iff only after applying positive parts and $K=T$. Avoid calling it a tail characterization.