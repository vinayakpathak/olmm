## Verdict

SOLVED: maybe

I think iteration 5 can promote the corrected finite-grid minimax/Bayes-gap identity to a real candidate theorem. This gives a necessary-and-sufficient characterization for finite unknown exogenous classes, up to $T/K$ discretization error for continuum quotes. It does not yet give a clean scalar tail condition or matching power-tail lower rates.

## Candidate Solution Or Main Attempt

For a finite exogenous law class $\Theta$, finite quote grid $G$, and horizon $T$, define
$$
V_\theta^G=\max_{a\in G}\sum_{t=1}^T \mathbb E_\theta r_t(a),
$$

and grid minimax upper-regret value
$$
\mathcal R_G(\Theta,T)=
\inf_A\sup_{\theta\in\Theta}
\left(V_\theta^G-\mathbb E_{\theta,A}\sum_t r_t(a_t)\right),
$$

where $A$ ranges over randomized grid-valued policies observing public prices $P_{1:t}$.

For a prior $\pi\in\Delta(\Theta)$, let $\bar P_\pi=\sum_\theta\pi_\theta P^\theta$, $M_t=\max_{t<s\le T}P_s$, and
$$
\Psi_G(\pi)=
\sum_\theta \pi_\theta V_\theta^G
-
\sum_{t=1}^T
\mathbb E_{\bar P_\pi}
\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$

Candidate theorem:
$$
\boxed{
\mathcal R_G(\Theta,T)=\sup_{\pi\in\Delta(\Theta)}\Psi_G(\pi)
}
$$

This is the exact finite-grid necessary-and-sufficient condition: the obstruction is not raw delay, but the least-favorable Bayes gap between world-specific fixed-comparator value and the best posterior-predictive quote value.

For continuum quotes with $G_K=\{0,1/K,\dots,(K-1)/K\}$,
$$
\boxed{
\left|
\mathcal R_{[0,1]}(\Theta,T)
-
\sup_{\pi\in\Delta(\Theta)}\Psi_{G_K}(\pi)
\right|
\le T/K.
}
$$

Thus sublinear upper regret for finite exogenous classes is equivalent, under the upper-regret convention, to existence of $K_T\to\infty$ such that
$$
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_{K_T}}(\pi)\right)_+=o(T).
$$

This is a characterization, but not a simple tail profile.

## Concrete Lemmas Or Reductions

Finite-grid minimax proof sketch:

1. Because prices are exogenous and public, every randomized policy is reward-equivalent to kernels
$$
   q_t(\cdot\mid P_{1:t})\in\Delta(G).
$$

2. For finite $\Theta$, dominate each prefix law by
$$
   \mu_t=\sum_{\theta\in\Theta}\operatorname{Law}_\theta(P_{1:t}).
$$
   The policy space is a weak-* compact convex subset of finite products of $L^\infty(\mu_t)$.

3. Each expected reward vector
$$
   L_\theta(q)=\mathbb E_{\theta,q}\sum_t r_t(a_t)
$$
   is weak-* continuous affine in $q$.

4. Sion/minimax applies:
$$
   \inf_q\sup_\theta R_\theta^G(q)
   =
   \sup_\pi\inf_q\sum_\theta\pi_\theta R_\theta^G(q).
$$

5. The inner Bayes problem is pointwise myopic:
$$
   \sup_q\sum_\theta\pi_\theta L_\theta(q)
   =
   \sum_t\mathbb E_{\bar P_\pi}
   \max_{a\in G}a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$

Continuum approximation:

For $b=\lfloor a\rfloor_{G_K}$,
$$
a\mathbf{1}\{M_t>a\}
\le
b\mathbf{1}\{M_t>b\}+1/K.
$$

This gives both $V_\theta\le V_\theta^{G_K}+T/K$ and rounded learner reward loss at most $T/K$, hence the displayed $T/K$ equivalence.

Accepted upper bound remains:
$$
\sup_{P\in\mathcal C_T}R_T^P
\lesssim
\sqrt{T(H+1)\log K}+T/K+\sup_{P\in\mathcal C_T}\delta_T^P(H).
$$

If $\delta_T(H)\le T H^{-\alpha}$, take $K=T$ and
$$
H\asymp (T/\log T)^{1/(2\alpha+1)}
$$

to get
$$
R_T\lesssim
T^{(\alpha+1)/(2\alpha+1)}
(\log T)^{\alpha/(2\alpha+1)}.
$$

## Gaps And Failure Points

The exact identity is proved only for finite $\Theta$, finite $G$, randomized policies, public exogenous prices, and grid comparator $V_\theta^G$.

For infinite law classes, one needs compactness/dominating-measure assumptions, or else only finite-subclass Bayes gaps are certified lower bounds.

This does not solve matching lower rates under power-tail envelopes. The exact Bayes-gap value may be the right characterization, but it is not a clean scalar tail condition.

Action-dependent prices remain outside the proof.

## Counterexamples Or Obstructions

Raw $\beta(h)\to0$ is not necessary: known finite-horizon exogenous laws are oracle-learnable with $R_T\le T/K$.

$\Delta_T(H)=o(T)$ is not necessary: known terminal-spike laws can have linear truncation loss but zero law-aware regret.

The $q$-scaled hidden-terminal atom gives a valid finite-horizon lower bound $qD/8$, but under $q\le B(D)=D^{-\alpha}$ it yields only $D^{1-\alpha}$, not the upper-bound exponent.

## Promising Ideas To Explore

Prove the finite-grid minimax identity cleanly in final write-up using the $L^\infty$ compactness argument above.

Use the identity as the official necessary-and-sufficient theorem for finite unknown exogenous classes.

Keep the scalar tail theorem as a sufficient condition via $\delta_T(H)$, not as an iff.

For matching lower rates, pursue multi-scale or limited-leakage Bayes-gap constructions rather than one hidden terminal block.

## Notes For Critics

The main thing to audit is the minimax compactness step: randomized policies as weak-* compact kernels dominated by finite prefix mixtures. The theorem must not mix continuum comparator values into the finite-grid identity. Randomized policies are essential.