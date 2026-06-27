## Summary

The kernel implementation lemma looks closable under clean assumptions. The key proof move is: on the standard Borel prefix space $X_t=[0,1]^t$, every completed $L^\infty(\lambda_t;\Delta(G))$ kernel has a Borel $\Delta(G)$-valued representative equal $\lambda_t$-a.e. Since all payoff-weighted measures $\mu^\theta_{t,a}$ are dominated by $\lambda_t$, that representative preserves all reward integrals simultaneously over every $\theta,a$.

So the reverse alignment issue is probably not fatal for finite grids. The theorem should be stated for Borel public-prefix randomized kernels, with completed $L^\infty$ used as the compactness device.

## Concrete Progress

Candidate implementation theorem:

Fix finite $T$, finite grid $G=\{g_1,\dots,g_m\}$, $X_t=[0,1]^t$, and sigma-finite Borel measures $\lambda_t$ on $X_t$. Suppose
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}]
\ll \lambda_t
$$
for all $\theta,t,a\in G$.

For any $q_t\in L^\infty(\lambda_t;\Delta(G))$, there is a Borel kernel $\tilde q_t:X_t\to\Delta(G)$ such that $\tilde q_t=q_t$ $\lambda_t$-a.e. Hence, for all $\theta$,
$$
\sum_{t,a}\int \tilde q_{t,a}\,d\mu^\theta_{t,a}
=
\sum_{t,a}\int q_{t,a}\,d\mu^\theta_{t,a}.
$$
The Borel kernels $\tilde q_t$ are implementable by a public-prefix randomized policy using fresh uniforms.

## Claims Or Lemmas

**Lemma 1: Borel Representative.**  
If $X$ is standard Borel, $\lambda$ is sigma-finite Borel, $G$ is finite, and $q\in L^\infty(\lambda;\Delta(G))$, then $q$ has a Borel $\Delta(G)$-valued representative equal $\lambda$-a.e.

**Lemma 2: Reward Preservation.**  
If $\tilde q=q$ $\lambda$-a.e. and $\mu^\theta_{t,a}\ll\lambda_t$, then replacing $q$ by $\tilde q$ preserves every payoff-weighted integral. This is simultaneous over uncountable $\Theta$, since the null set is $\lambda_t$-null.

**Lemma 3: Randomized Implementation.**  
For finite $G$, a Borel kernel $\tilde q_t(h)\in\Delta(G)$ can be implemented by a Borel map $\phi_t(h,u)$ with $u\sim{\rm Unif}[0,1]$, using cumulative probability intervals.

**Lemma 4: Forward Policy Reduction.**  
Under public exogenous prices and independent private randomness, any private-randomized policy induces law-independent prefix kernels $q_t(P_{1:t})$ with the same reward vector. This needs a written induction over $t$.

## Proof Attempts

For Lemma 1, take coordinate representatives $q_a$. Each completed-measurable coordinate has a Borel version $b_a$ equal $\lambda$-a.e. Let
$$
N=\{h: b_a(h)\notin[0,1]\text{ for some }a,\ \text{or } \sum_a b_a(h)\ne1\}.
$$
Then $N$ is Borel and $\lambda(N)=0$. Define $\tilde q=b$ off $N$, and set $\tilde q=e_{a_0}$ on $N$. This gives a Borel $\Delta(G)$-valued kernel.

For forward reduction, fix a private seed $U$. Because prices are exogenous and full public prices are observed, all past feedback and internal state are deterministic functions of $(P_{1:t},U)$. Thus $a_t=\alpha_t(P_{1:t},U)$. Define
$$
q_{t,a}(h)=\Pr_U(\alpha_t(h,U)=a).
$$
Then Fubini gives
$$
\mathbb E_\theta r_t(a_t)
=
\sum_a\int q_{t,a}(h)\,d\mu^\theta_{t,a}(h).
$$

## Gaps And Risks

Completed-$\lambda_t$ measurability alone is not necessarily admissible if prefix laws $P^\theta_{1:t}$ are not dominated by $\lambda_t$. A $\lambda_t$-null non-Borel set may have positive prefix-law mass. The Borel representative fixes this for original Borel policy classes.

The result is finite-grid only. Continuum quotes still need the separate $T/K$ minimax comparison.

The forward reduction fails if prices are action-dependent, if private randomness is correlated with the active law, or if feedback contains information beyond public prices.

Finite-subclass and full-class values must use the same policy class. Otherwise the compact $L^\infty$ theorem proves only a relaxed-kernel no-gap statement.

## Counterexamples Or Obstructions

The non-Borel label example remains the main warning for arbitrary infinite classes without domination/product closedness.

Uncountable Dirac/Feller classes show weak continuity does not imply domination.

A completed-measurable kernel on a $\lambda$-null non-Borel set is not automatically a valid policy under singular prefix laws. Borelization is essential unless prefix laws are also $\lambda_t$-dominated.

## Sources Consulted

No web search used. Consulted the requested run files, the assigned `idea.md`, and prior local reports from iterations 8 and 9 on reward-measure domination and policy-class alignment.

## Recommended Next Steps

1. State the admissible Borel public-prefix randomized policy model.
2. Prove the Borel representative lemma as a standalone measure lemma.
3. Prove forward policy-to-prefix-kernel reduction by induction.
4. Insert the reverse implementation lemma into the reward-measure domination no-gap theorem.
5. Then identify the density-form support formula with the conditional $\Psi_{G,F}$ Bayes envelope.