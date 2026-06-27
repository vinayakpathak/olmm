## Summary

The assigned idea works. Under finite $F$, finite grid $G$, and payoff-weighted domination, the density-form support term is exactly the conditional Bayes envelope used in $\Psi_{G,F}$. The null-set risk is real but harmless if the proof is phrased through a domination-invariant measure functional.

## Concrete Progress

For fixed $t$, let $X_t=[0,1]^t$, let $m_t=\bar P_\pi\circ P_{1:t}^{-1}$, and define
$$
\nu_{t,a}(B)=\sum_{\theta\in F}\pi_\theta\mu^\theta_{t,a}(B)
=
\mathbb E_{\bar P_\pi}\left[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}\right].
$$
If $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$, then
$$
\frac{d\nu_{t,a}}{d\lambda_t}=\sum_{\theta\in F}\pi_\theta f^\theta_{t,a}.
$$
The desired equality is therefore
$$
\int \max_{a\in G}\frac{d\nu_{t,a}}{d\lambda_t}\,d\lambda_t
=
\int \max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}=h)\,dm_t(h).
$$

## Claims Or Lemmas

**Lemma: common-dominator invariance.**  
For a finite family of finite measures $(\nu_a)_{a\in G}$, the quantity
$$
S(\rho)=\int \max_{a\in G}\frac{d\nu_a}{d\rho}\,d\rho
$$
is independent of the chosen sigma-finite common dominating measure $\rho$.

**Consequence.**  
Evaluate $S$ once with $\rho=\lambda_t$ to obtain the density support formula, and once with $\rho=m_t$ to obtain the conditional Bayes envelope.

## Proof Attempts

The clean proof is:

1. Take two common dominating measures $\rho,\rho'$, set $\eta=\rho+\rho'$, and write $u_a=d\nu_a/d\eta$, $r=d\rho/d\eta$.
2. Since $\nu_a\ll\rho$, $u_a=0$ $\eta$-a.e. on $\{r=0\}$.
3. Hence
$$
   \int \max_a \frac{d\nu_a}{d\rho}\,d\rho
   =
   \int \max_a u_a\,d\eta,
$$
   and the same expression is obtained from $\rho'$.
4. Under $m_t$,
$$
   \frac{d\nu_{t,a}}{dm_t}(h)
   =
   \mathbb E_{\bar P_\pi}[a\mathbf{1}\{M_t>a\}\mid P_{1:t}=h]
   =
   a\,\bar P_\pi(M_t>a\mid P_{1:t}=h)
$$
   $m_t$-a.e.

This proves the equality after summing over $t$.

## Gaps And Risks

The lemma is finite-grid only. For continuum quotes, measurable suprema and selector issues return.

It assumes finite $F$ and a standard Borel finite-horizon path space so that regular conditional probabilities exist.

It identifies only the Bayes reward/support term in $\Psi$. It does not by itself prove policy-class alignment or product closedness.

## Counterexamples Or Obstructions

No obstruction appears inside the finite-grid assumptions. Prefix-law mass outside $\lambda_t$ is not a problem: if it carries positive payoff for some arm, the corresponding payoff measure would not be $\lambda_t$-dominated; otherwise its conditional envelope contribution is zero.

Outside scope, uncountable $G$, action-dependent prices, or arbitrary infinite priors can break the clean argument.

## Sources Consulted

No web sources.

Local files consulted: `problem.md`, `working_notes/canonical_summary.md`, `working_notes/claim_ledger.md`, `working_notes/lemma_bank.md`, `working_notes/failed_attempts.md`, `working_notes/counterexamples.md`, `working_notes/literature_map.md`, `working_notes/promising_directions.md`, `working_notes/iteration_summaries.md`, and `iterations/iter_012/idea_02/idea.md`.

## Recommended Next Steps

Promote this to a proved lemma in the synthesis, with the common-dominator invariance proof included. Then insert it immediately after the density-form finite-prior support formula in the payoff-measure domination no-gap theorem. Keep the statement explicitly finite $F$, finite $G$, public exogenous, and finite horizon.