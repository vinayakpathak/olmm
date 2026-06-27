## Verdict

SOLVED: no.

The original scalar tail characterization is false. A strong partial solution is available: for finite classes, and for infinite classes with a no-gap/product-closed condition such as payoff-measure domination, sublinear regret is characterized exactly by a Bayes predictability gap, up to the $O(1)$ grid-continuum error. Matching lower rates from tail envelopes remain open.

## Candidate Solution Or Main Attempt

For public exogenous price laws, the right finite-grid object is
$$
\Psi_{T,G}(F,\pi)
=
\sum_{\theta\in F}\pi_\theta V_{\theta,T}^G
-
\sum_{t=1}^T
\mathbb E_{\bar P_\pi}
\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}),
$$

where $F\subset\Theta_T$ is finite, $G$ is a finite quote grid, $M_t=\max_{s>t}P_s$, and
$$
V_{\theta,T}^G=\max_{a\in G}\sum_{t=1}^T\mathbb E_\theta[a\mathbf{1}\{M_t>a\}].
$$

Define
$$
\mathfrak B_{T,G}(\Theta_T)
=
\sup_{F\Subset\Theta_T}\sup_{\pi\in\Delta(F)}\Psi_{T,G}(F,\pi).
$$

Under either finite $\Theta_T$, or an infinite-class no-gap condition such as payoff-weighted reward-measure domination, the candidate characterization is
$$
\left|
(\mathcal R_T^{[0,1]}(\Theta_T))_+
-
(\mathfrak B_{T,G_T}(\Theta_T))_+
\right|\le 1,
\qquad
G_T=\{0,1/T,\dots,(T-1)/T\}.
$$

Hence, in those regimes,
$$
\text{sublinear regret}
\quad\Longleftrightarrow\quad
(\mathfrak B_{T,G_T}(\Theta_T))_+=o(T).
$$

This is not a scalar tail condition. It is a predictability/information-value condition: the learner succeeds exactly when every least-favorable finite prior has small gap between world-specific fixed-comparator value and posterior-predictive quote value.

The accepted tail upper bound remains
$$
\sup_{\theta\in\Theta_T}R_T^\theta
\lesssim
\inf_{H,K}
\left\{
\sqrt{T(H+1)\log K}
+
T/K
+
\sup_{\theta\in\Theta_T}\delta_T^\theta(H)
\right\}.
$$

If $\Delta_T(H)\le T H^{-\alpha}$, choosing $K=T$ gives
$$
R_T\lesssim
T^{(\alpha+1)/(2\alpha+1)}
(\log T)^{\alpha/(2\alpha+1)}.
$$

## Concrete Lemmas Or Reductions

1. Finite-grid minimax identity:
$$
\mathcal R_T^G(\Theta)
=
\sup_{\pi\in\Delta(\Theta)}\Psi_{T,G}(\Theta,\pi)
$$

for finite $\Theta$, finite $G$, randomized policies, and public exogenous prices.

2. Grid-continuum comparison:
$$
|\mathcal R_T^{[0,1]}-\mathcal R_T^{G_K}|\le T/K.
$$

3. Infinite-class no-gap theorem: if the attainable reward set is product closed, then
$$
\mathcal R_T^G(\Theta)
=
\sup_{F\Subset\Theta}\mathcal R_T^G(F)
=
\mathfrak B_{T,G}(\Theta).
$$

4. Payoff-measure domination suffices for product closedness. For each $t,a$, define
$$
\mu^\theta_{t,a}(B)
=
\mathbb E_\theta[
\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}
].
$$

If, for each $t$, all $\mu^\theta_{t,a}$ are dominated by a common $\lambda_t$, then $L^\infty(\lambda_t;\Delta(G))$ prefix kernels give weak-* compactness and product closedness.

5. New closure point: the reverse implementation gap can be closed under the standard Borel-version theorem. A completed $L^\infty(\lambda_t;\Delta(G))$ kernel has a Borel simplex-valued representative equal $\lambda_t$-a.e.; since $\mu^\theta_{t,a}\ll\lambda_t$, this preserves all reward coordinates and is implementable with fresh uniforms.

## Gaps And Failure Points

The full arbitrary infinite-class theorem is still not closed without no-gap assumptions. Product-closure failures and measurability pathologies can create linear gaps between all finite subclasses and the full class.

No matching power-tail lower bound is known. The $q$-scaled hidden-terminal atom gives only $\Omega(Dq)$; under $q\le B(D)=D^{-\alpha}$, this is $\Omega(D^{1-\alpha})$, too weak to match the truncation upper rate.

The theorem is exogenous. If prices depend on learner actions, the delayed full-information reduction and reward-vector formalism need a new causal model.

## Counterexamples Or Obstructions

Raw $\beta(h)\to0$ is not necessary. Known finite-horizon exogenous laws are oracle-learnable with $R_T\le T/K$, hence $O(1)$ with $K=T$, regardless of delay tails.

Per-world tail profiles cannot characterize unknown-class minimax learnability. The hidden/labeled $q$-scaled terminal pair has identical per-law $\beta,\Delta,\delta$ profiles, but hidden minimax regret is $\ge qD/8$, while labeled regret is zero.

Rare-history and tiny-price examples have $\beta(h)=1$ for all finite $h$, yet bounded regret or $\Delta_T(H)=O(1/H)$. Essential sup is too coarse for expected regret.

## Promising Ideas To Explore

Build multi-scale lower bounds where hidden valuable delayed rewards accumulate without one reveal solving all future decisions and without iid block comparator collapse.

Develop an adaptive truncation algorithm competing with
$$
\inf_H\{\sqrt{TH\log K}+T/K+\delta_T(H)\}.
$$

Find natural no-gap conditions beyond domination: dominated approximations, identifiable Borel parameter classes, or direct compactness of the attainable reward set.

## Notes For Critics

Use $\sup_a$, not $\max_a$, in continuum statements.

State positive-part regret conventions, since adaptive learners can beat the best fixed quote.

Keep finite-grid, continuum, finite-class, and infinite-class claims separate.

Do not present $\mathfrak B_T$ as a scalar tail condition. It is a minimax/Bayes value characterization encoding public observability and posterior predictability.