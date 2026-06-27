## Summary

The Bayes-gap delay modulus is the right proof-strategy object for lower bounds over unknown exogenous classes. It captures “valuable delayed reward plus indistinguishability,” which is exactly what raw $\beta$, $\Delta$, and $\delta$ miss.

The main caveat: if defined generally enough to be necessary, it becomes close to the full minimax value. Its best use is probably as a lower-bound certificate, not as a clean scalar tail characterization.

## Concrete Progress

A useful general lower-bound template is:

Let $\pi$ be a prior over laws $\{P^\theta\}\subseteq\mathcal C_T$. Let $\mathcal I_t$ be the learner’s decision-time information before choosing $a_t$, and define
$$
G_t^\theta(a)
=
\mathbb E_\theta[r_t(a)\mid \mathcal I_t].
$$
Set
$$
V_\theta=\sup_{a\in[0,1]}\sum_{t=1}^T \mathbb E_\theta r_t(a),
$$
and
$$
U_\pi
=
\sum_{t=1}^T
\mathbb E_{\bar P}
\left[
\sup_{a\in[0,1]}
\mathbb E_{\theta\sim\pi(\cdot\mid \mathcal I_t)}
G_t^\theta(a)
\right].
$$
Then every learner satisfies
$$
\inf_A\sup_{\theta} R_T^\theta(A)
\ge
\mathbb E_{\theta\sim\pi}V_\theta-U_\pi.
$$
This is the clean Bayes-gap modulus. It is exact enough to avoid false tail necessity claims.

## Claims Or Lemmas

**Lemma 1: identical-prefix Bayes-gap lower bound.**

If two or more laws have identical decision histories for $D$ rounds, and each early quote has reward curve $g_\theta(a)$, then
$$
\inf_A\sup_\theta R_T^\theta(A)
\ge
D\left(
\mathbb E_\pi \sup_a g_\theta(a)
-
\sup_a \mathbb E_\pi g_\theta(a)
\right).
$$

This recovers the hidden-terminal lower bound.

**Lemma 2: approximate two-point version.**

For two laws with prior $1/2$, if decision-history distributions at time $t$ have total variation distance $d_t$, and early reward curves are $g_{t,0},g_{t,1}\in[0,1]$, then learner Bayes reward at time $t$ is at most
$$
\sup_a \frac{g_{t,0}(a)+g_{t,1}(a)}2+\frac{d_t}{2}.
$$
Thus the exact identical-prefix proof is stable under small distinguishability.

**Lemma 3: $q$-scaled hidden-terminal atom.**

Let $T=D+1$, $P_1=\cdots=P_D=0$, and at terminal time reveal with probability $q$:
$$
Y_L\sim \mathrm{Unif}[1/2,5/8],
\qquad
Y_H\sim \mathrm{Unif}[3/4,7/8],
$$
otherwise set terminal price $0$. Then
$$
\inf_A\sup_{\theta\in\{L,H\}}R_T^\theta(A)
\ge
Dq/8.
$$
For $H<D$, the same instance has tail/truncation mass of order $qD$, so it matches the delayed-value term up to constants.

## Proof Attempts

The proof of the general modulus is straightforward under exogenous prices. Conditional on $\mathcal I_t$, the learner’s randomized quote cannot exceed the best posterior-mixture quote:
$$
\mathbb E[r_t(a_t)\mid \mathcal I_t]
\le
\sup_a
\mathbb E_{\theta\mid\mathcal I_t}G_t^\theta(a).
$$
Summing over $t$, subtracting from the Bayes fixed-comparator value, and applying Yao gives the lower bound.

For the $q$-scaled hidden-terminal construction, the first $D$ histories are identical, so actions are independent of the world. The base curves have
$$
V_L=1/2,\qquad V_H=3/4,\qquad
\sup_a \frac{g_L(a)+g_H(a)}2=1/2,
$$
hence Bayes gap $1/8$, scaled by $q$ and repeated over $D$ early quotes.

## Gaps And Risks

The modulus is not yet a clean necessary-and-sufficient tail condition. If it is defined using full posterior decision information, it is close to the minimax value itself.

Large $\delta_T(H)$ does not imply a large Bayes gap: the known terminal-spike singleton still has large truncation loss but zero law-aware regret.

The lower bound needs rewards outside the hidden prefix to be zero, common, or explicitly controlled. Otherwise later learner rewards can offset the prefix gap.

The proof assumes exogenous prices. In action-dependent markets, $G_t^\theta(a)$ is not a fixed counterfactual reward curve without an explicit causal model.

## Counterexamples Or Obstructions

Known finite-horizon exogenous laws remain the main obstruction to any raw-tail necessity theorem: the conditional grid oracle gives $O(1)$ regret regardless of $\beta,\Delta,\delta$.

Naive iid block-splicing still fails because the comparator is $\sup_a\mathbb E\sum_t r_t(a)$, not $\mathbb E\sup_a\sum_t r_t(a)$.

If reward curves vary by time, the learner can choose different quotes each round while the comparator is fixed. The Bayes gap must account for this; per-round separated optima alone are insufficient.

## Sources Consulted

Local project files only: `problem.md`, `working_notes/*`, and `iterations/iter_003/idea_01/idea.md`.

No web search performed.

## Recommended Next Steps

Formalize the general posterior Bayes-gap lemma as a reusable lower-bound proposition.

Write the $q$-scaled hidden-terminal construction completely, including $\beta(H)$, $\Delta_T(H)$, and $\delta_T(H)$ calculations.

Use the TV two-point corollary for approximate indistinguishability; only move to KL/Fano if multi-world examples become necessary.

Do not claim this gives a full characterization yet. It is currently a strong lower-bound framework and a good diagnostic for which delayed tails are actually harmful.