## Verdict
SOLVED: maybe

For horizon-aware public-exogenous finite classes, and for infinite classes with a no-gap/product-closure condition, there is a clean necessary-and-sufficient characterization: sublinear regret is equivalent to a sublinear least-favorable Bayes predictability gap. This is not a scalar tail characterization, and matching tail-profile lower rates remain open.

## Candidate Solution Or Main Attempt

Fix a horizon-indexed public-exogenous class $\Theta_T$. Let
$$
M_t=\max_{s>t}P_s,\qquad
V_\theta^G=\max_{a\in G}\sum_{t=1}^T \mathbb E_\theta[a\mathbf{1}\{M_t>a\}].
$$
For a prior $\pi$ on a finite class, define
$$
\Psi_G(\pi)=
\sum_\theta \pi_\theta V_\theta^G
-
\sum_{t=1}^T
\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$

Then for finite $\Theta_T$, finite $G$, randomized policies, and grid comparator:
$$
\mathcal R_T^G(\Theta_T)
=
\inf_A\sup_{\theta\in\Theta_T}(V_\theta^G-L_\theta(A))
=
\sup_{\pi\in\Delta(\Theta_T)}\Psi_G(\pi).
$$

With $G_T=\{0,1/T,\dots,(T-1)/T\}$,
$$
\left|
(\mathcal R_T^{[0,1]})_+
-
\left(\sup_\pi \Psi_{G_T}(\pi)\right)_+
\right|\le 1.
$$
So, under these assumptions,
$$
\text{sublinear regret}
\iff
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+=o(T).
$$

This is the best current “iff”: it says learnability is controlled by public-prefix predictability of the active reward curve, not by raw hitting-delay tails.

The accepted tail upper bound remains:
$$
\sup_{P\in\mathcal C_T}R_T^P
\lesssim
\sqrt{T(H+1)\log K}+T/K+\sup_{P\in\mathcal C_T}\delta_T^P(H),
$$
where
$$
\delta_T^P(H)=
\sup_a\mathbb E_P\sum_t r_t(a)
-
\sup_a\mathbb E_P\sum_t r_t^H(a).
$$
If $\delta_T(H)\lesssim T H^{-\alpha}$, then with $K=T$,
$$
R_T\lesssim
T^{(\alpha+1)/(2\alpha+1)}(\log T)^{\alpha/(2\alpha+1)}.
$$

## Concrete Lemmas Or Reductions

- Known finite-horizon exogenous laws are oracle-learnable: conditional grid maximization gives $R_T\le T/K$, hence $O(1)$ with $K=T$.
- Fixed-$H$ truncation plus $H+1$ residue-class Hedge gives the upper bound above.
- The finite-class minimax identity follows from finite-dimensional reward-set minimax plus fixed-prior Bayes myopic optimality.
- Infinite-class extension works when the attainable reward set is product closed; payoff-weighted reward-measure domination is a sufficient no-gap hypothesis.
- Hidden/labeled terminal examples prove per-world $\beta,\Delta,\delta$ profiles cannot characterize unknown-class learnability.

## Gaps And Failure Points

Matching power-tail lower bounds are still open. The $q$-scaled terminal atom gives only $\Omega(qD)$, too weak to match the truncation upper rate for power tails.

Adaptive truncation is unresolved. It would follow from a heterogeneous-delay experts theorem with comparator-specific delay dependence, but that theorem is unproved.

The arbitrary infinite-class theorem needs no-gap assumptions. Without product closedness or domination, finite-subclass Bayes gaps can miss full-class measurability/compactness obstructions.

Action-dependent prices are outside the accepted theorem package; the delayed full-information reduction breaks there.

## Counterexamples Or Obstructions

- Raw $\beta(h)\to0$ is not necessary: iid uniform prices and known-law oracle learning already refute it.
- Tiny-price and rare-history examples have $\beta(h)=1$ for all finite $h$ but bounded or small expected regret.
- Hidden/labeled q-terminal classes have identical per-world tail/truncation profiles but regret $\Omega(qD)$ in the hidden case and zero in the labeled case.
- Repeated q-terminal atoms fail naively because old quotes can trade on later spikes, corrupting the intended tail envelope.
- The strong simultaneous nested-window oracle is refuted by the periodic two-window finite-grid construction.

## Promising Ideas To Explore

- Finish the original Borel-policy no-gap theorem by polishing the completed-kernel-to-Borel implementation step.
- Attack comparator-specific heterogeneous-delay experts via the two-arm delayed-advantage game.
- Try noisy common-parameter or codebook lower bounds, using the finite-grid $\Psi_G$ value before realizing them as price processes.
- Develop last-exceedance/value-tail calculus, but only as an upper-bound language, not as a scalar iff condition.

## Notes For Critics

Check all finite-grid statements keep learner action set, comparator, and Bayes envelope on the same grid. Randomized policies are essential. Use $\sup_a$, not $\max_a$, in continuum statements. The learnability convention should be positive-part upper regret, since adaptive policies can beat the best fixed quote.