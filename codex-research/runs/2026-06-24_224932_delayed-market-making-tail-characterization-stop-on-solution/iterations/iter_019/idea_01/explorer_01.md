## Summary

The finitely additive dual is valid as an abstract reward-vector minimax theorem for finite $T$, finite grid $G$, arbitrary set $\Theta$, public exogenous prices, and convex randomized policy class. It gives the signed grid minimax value:
$$
\mathcal R_G(\Theta)=
\sup_{\nu\in ba^+_1(\Theta)}
\left\{\langle V^G,\nu\rangle-\sup_A\langle L(A),\nu\rangle\right\}.
$$

It is not an ordinary Bayes/posterior formula. The support term has no general conditional-probability interpretation for finitely additive $\nu$. The useful learnability statement is therefore:
$$
(\mathcal R_G(\Theta))_+=o(T),
$$
with continuum handled separately by the existing $T/K$ grid comparison.

## Concrete Progress

Define
$$
C=\{L(A): A\text{ admissible randomized }G\text{-policy}\}\subset \ell^\infty(\Theta),
$$
where
$$
L_\theta(A)=\mathbb E_{\theta,A}\sum_{t=1}^T r_t(a_t).
$$
Then $C\subset[0,T]^\Theta$, so it is bounded.

Convexity holds if policies allow ex-ante private randomization: mix policies $A,B$ with an independent coin to realize
$$
\lambda L(A)+(1-\lambda)L(B).
$$

The exact signed value is
$$
R=\inf_{c\in C}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta).
$$

## Claims Or Lemmas

**Lemma 1: ba duality.** Under the above assumptions,
$$
R=
\sup_{\nu\in ba^+_1(\Theta)}
\left(\langle V^G,\nu\rangle-\sigma_C(\nu)\right),
\qquad
\sigma_C(\nu)=\sup_{c\in C}\langle c,\nu\rangle.
$$

**Lemma 2: norm closure is harmless.** Replacing $C$ by its norm closure in $\ell^\infty(\Theta)$ does not change $R$, because $c\mapsto \sup_\theta(V_\theta-c_\theta)$ is 1-Lipschitz in sup norm. The support function over $ba$ also only sees norm closure.

**Lemma 3: weak-* / product closure can be harmful.** If $\ell^\infty=(\ell^1)^*$ is given its weak-* topology, or if $[0,T]^\Theta$ is given product topology, closure can strictly lower the value. This is the old finite-subclass/product-closure relaxation, not the true full-class value.

## Proof Attempts

For weak duality, for any positive finitely additive probability $\nu$ and any $c\in C$,
$$
\langle V,\nu\rangle-\sigma_C(\nu)
\le
\langle V-c,\nu\rangle
\le
\sup_\theta(V_\theta-c_\theta).
$$
Taking infimum over $c$ gives RHS $\le R$.

For the reverse inequality, let $X=\ell^\infty(\Theta)$, $X_+=\{x:x_\theta\ge0\}$, and $S=C-X_+$. Regret $\le\alpha$ is equivalent to
$$
V-\alpha\mathbf{1}\in S.
$$
If $\alpha<R$, then $V-\alpha\mathbf{1}\notin\overline S^{\|\cdot\|_\infty}$. Hahn-Banach separation gives a nonzero $\phi\in X^*=ba(\Theta)$ separating $V-\alpha\mathbf{1}$ from $\overline S$. Since $S$ is downward closed, $\phi$ must be positive. Normalize by $\phi(\mathbf{1})=1$. Then
$$
\langle V,\phi\rangle-\sup_{c\in C}\langle c,\phi\rangle>\alpha.
$$
Letting $\alpha\uparrow R$ proves equality.

## Gaps And Risks

The formula relies on randomized-policy convexity. For deterministic policies, it characterizes the convexified randomized game, not the deterministic minimax value.

The dual is not a stochastic mixture theorem. For finitely additive $\nu$, there is generally no mixture price law, no regular conditional posterior, and no myopic Bayes envelope formula.

Do not use weak-* closure of $C\subset\ell^\infty=(\ell^1)^*$ unless you explicitly want the relaxed finite-subclass value.

Continuum quotes still need the existing grid approximation, or additional selector/nonattainment work.

## Counterexamples Or Obstructions

Take $\Theta=\mathbb N$, $V\equiv1$, and
$$
C=\{c\in[0,1]^\mathbb N:c\text{ has finite support}\}.
$$
Then the true value is $R=1$. Every countably additive probability $\pi\in\ell^1_+$ gives dual value $0$, because finite supports can capture arbitrarily much $\pi$-mass. But a finitely additive probability concentrated “at infinity” gives value $1$. Thus ordinary priors miss the full value, while $ba$ detects it.

This also shows product / $\sigma(\ell^\infty,\ell^1)$ closure can change the game: the constant vector $1$ lies in that closure of $C$, dropping the relaxed value to $0$.

## Sources Consulted

No web search used.

Local files consulted: `problem.md`, all requested `working_notes/*.md`, `iterations/iter_019/idea_01/idea.md`, and `iterations/iter_019/solver_attempt.md`.

## Recommended Next Steps

Record the ba dual as a valid finite-grid arbitrary-class signed value lemma, with the separation proof above.

Add a warning that it is not an ordinary Bayes or posterior-predictability characterization.

Keep ordinary-prior results under product-closure / payoff-measure domination hypotheses.

Use positive part for learnability:
$$
(\sup_{\nu\in ba^+_1}\{\langle V,\nu\rangle-\sup_A\langle L(A),\nu\rangle\})_+=o(T).
$$