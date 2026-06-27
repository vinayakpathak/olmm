## Summary

The strongest generalization I found is to replace **common domination of prefix laws** by **common domination of payoff-weighted prefix measures**. This is strictly weaker and is exactly what the compactness proof needs.

For fixed finite $T$ and finite grid $G$, define
$$
\mu^\theta_{t,a}(B)
=
\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}],
\qquad M_t=\max_{s>t}P_s .
$$
If for each $t$ there is $\sigma$-finite $\lambda_t$ dominating all $\mu^\theta_{t,a}$, then the attainable reward set is product compact, hence the infinite-class finite-subclass no-gap theorem goes through. This avoids requiring domination of all public prefix laws $P^\theta_{1:t}$.

A second useful route is perturbative: if the reward measures are uniformly approximable in total variation by dominated reward measures, then the no-gap conclusion holds up to the approximation error.

Feller or weak continuity alone is not enough to prove product closedness for full Borel policy classes. Nondominated deterministic classes can still have no gap when the parameter is publicly identifiable, but that is a different mechanism from compactness.

## Concrete Progress

For fixed $T,G$, every public-prefix randomized policy can be represented by kernels
$$
q_{t,a}(h_t)=\Pr(a_t=a\mid P_{1:t}=h_t),
$$
once prices are exogenous. Its expected reward in world $\theta$ is
$$
L_\theta(q)
=
\sum_{t=1}^T\sum_{a\in G}\int q_{t,a}(h)\,d\mu^\theta_{t,a}(h).
$$

Thus domination of the $\mu^\theta_{t,a}$, not of $P^\theta_{1:t}$, suffices. If $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$, then
$$
L_\theta(q)=
\sum_{t,a}\int q_{t,a}(h)f^\theta_{t,a}(h)d\lambda_t(h),
$$
and weak-* compactness of $L^\infty(\lambda_t;\Delta(G))$ gives product compactness of
$$
C=\{(L_\theta(q))_{\theta\in\Theta}:q\text{ admissible}\}\subset[0,T]^\Theta.
$$

Consequently, for such classes,
$$
\mathcal R_G(\Theta)
=
\sup_{F\Subset\Theta}\mathcal R_G(F)
=
\sup_{F\Subset\Theta}\sup_{\pi\in\Delta(F)}\Psi_{G,F}(\pi).
$$
With $G_T=\{0,1/T,\dots,(T-1)/T\}$, the continuum positive-part value is within $1$ of this grid value.

## Claims Or Lemmas

**Lemma 1: Reward-Measure Domination No-Gap.**  
Under fixed finite $T,G$, public exogenous prices, randomized measurable policies, and common domination of all payoff-weighted measures $\mu^\theta_{t,a}$, the grid attainable reward set $C$ is product compact. Therefore finite-subclass Bayes gaps characterize the full infinite-class grid minimax value.

**Lemma 2: TV-Compact Parametric Corollary.**  
If for each $t,a$, the family $\{\mu^\theta_{t,a}:\theta\in\Theta\}$ is compact or separable in total variation, then it is commonly dominated. In particular, compact metric $\Theta$ plus total-variation continuity of $\theta\mapsto\mu^\theta_{t,a}$ implies Lemma 1.

**Lemma 3: Dominated Approximation.**  
If for every $\varepsilon>0$ there is a dominated surrogate game with
$$
\sup_\theta\max\Bigl\{\sup_q|L_\theta(q)-\tilde L_\theta(q)|,\ |V_\theta^G-\tilde V_\theta^G|\Bigr\}\le\varepsilon,
$$
then the infinite-class no-gap error is $O(\varepsilon)$. Letting $\varepsilon\to0$ gives exact no-gap.

**Lemma 4: Identifiable Nondominated Classes.**  
Common domination is not necessary. If $P_1$ reveals $\theta$ through a Borel injective code and future conditional laws are Borel in $\theta$, then a single Borel policy can run the known-law grid oracle for every $\theta$. This gives nonpositive grid regret, despite uncountably many mutually singular prefix laws.

## Proof Attempts

For Lemma 1, use
$$
Q_t=L^\infty(\lambda_t;\Delta(G)).
$$
The positivity and simplex constraints are weak-* closed, so $Q_t$ is weak-* compact. Since $f^\theta_{t,a}\in L^1(\lambda_t)$, each coordinate $q\mapsto L_\theta(q)$ is weak-* continuous. The finite product $Q=\prod_tQ_t$ is compact, and its image in $[0,T]^\Theta$ is product compact.

For Lemma 2, choose a countable TV-dense set $\nu_n$ in the reward-measure family and set $\lambda=\sum_n2^{-n}\nu_n$. If $\lambda(B)=0$, then all $\nu_n(B)=0$, and TV approximation implies every $\mu(B)=0$.

For Lemma 3, regret functions change by at most $2\varepsilon$, and the same holds on every finite subclass. Since the surrogate has no gap, the original full-vs-finite gap is bounded by $O(\varepsilon)$.

## Gaps And Risks

The policy-to-prefix-kernel reduction still needs to be written carefully for arbitrary private-randomized policies.

The weak-* proof requires explicit Borel/version conventions: kernels are only defined $\lambda_t$-a.e., which is harmless for rewards but must be stated.

Reward-measure domination is weaker than prefix-law domination, but still excludes many deterministic Dirac classes.

Feller or weak continuity alone does not imply product closedness for the full Borel policy class. It may support a continuous-policy game, but comparing that to Borel policies needs extra regularity.

All claims here are fixed-grid. Continuum quotes must still use the existing $T/K$ minimax comparison.

## Counterexamples Or Obstructions

A simple nondominated Feller class can fail product closedness without causing regret gap: take $P_1=\theta$, $P_2=1$. Policies can realize Borel reward functions of $\theta$, but finite interpolation nets product-converge to arbitrary functions, including non-Borel ones.

The non-Borel label construction remains the clean obstruction: $P_1=x$, $P_2=1$ on non-Borel $A$, $P_2=1/2$ off $A$. Finite subclasses are learnable, but Borel policies cannot separate $A$.

Uniform dominated approximation cannot cover arbitrary Dirac classes under full Borel policies, because uniform approximation over all Borel policies is essentially total variation approximation.

## Sources Consulted

Local files only: `problem.md`, all requested `working_notes/*` files, `iterations/iter_008/idea_02/idea.md`, and iteration 7 no-gap reports. No web search used.

## Recommended Next Steps

1. Promote payoff-weighted reward-measure domination as the main infinite-class no-gap theorem.
2. Add the TV-compact and dominated-approximation corollaries.
3. Keep identifiable nondominated classes as a separate positive example.
4. Do not claim Feller/weak continuity is sufficient for Borel-policy no-gap without an additional approximation or selector theorem.