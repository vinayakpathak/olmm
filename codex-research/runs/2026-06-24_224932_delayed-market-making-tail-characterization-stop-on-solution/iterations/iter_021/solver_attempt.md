## Verdict

SOLVED: no

I do not see a valid scalar tail characterization. The strongest defensible result is a predictability/value characterization for public exogenous minimax classes, plus a tail-based sufficient upper bound. Matching lower rates for tail envelopes remain open.

## Candidate Solution Or Main Attempt

Work in the public exogenous finite-horizon model and set
$$
M_t=\max_{t<s\le T}P_s,\qquad r_t(a)=a\mathbf{1}\{M_t>a\}.
$$

For a horizon-indexed unknown class $\Theta_T$, finite grid $G$, and randomized grid policies, define
$$
V_\theta^G=\sup_{a\in G}\sum_t \mathbb E_\theta r_t(a),\qquad
C_T^G=\{(L_\theta(A))_{\theta\in\Theta_T}: A \text{ admissible randomized }G\text{-policy}\}.
$$
Then the exact finite-grid signed minimax value is
$$
\mathcal R_T^G
=
\inf_{c\in C_T^G}\sup_{\theta}(V_\theta^G-c_\theta).
$$

For finite $\Theta_T$,
$$
\mathcal R_T^G
=
\sup_{\pi\in\Delta(\Theta_T)}
\left[
\sum_\theta \pi_\theta V_\theta^G
-
\sum_t \mathbb E_{\bar P_\pi}
\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t})
\right].
$$
Thus finite-class sublinear regret is characterized by this Bayes predictability gap being $o(T)$, after using $G_T=\{0,1/T,\ldots,(T-1)/T\}$ and the grid-continuum bound
$$
|\mathcal R_T^{[0,1]}-\mathcal R_T^{G_T}|\le 1.
$$

For arbitrary infinite $\Theta_T$, the exact finite-grid value has the abstract dual
$$
\mathcal R_T^G
=
\sup_{\nu\in ba_1^+(\Theta_T)}
\left\{
\langle V^G,\nu\rangle-\sup_{c\in C_T^G}\langle c,\nu\rangle
\right\}.
$$
This is necessary and sufficient as a value identity, but it is not a structural tail condition or an ordinary posterior Bayes formula.

## Concrete Lemmas Or Reductions

1. Tail sufficient upper bound:
$$
\sup_{\theta\in\Theta_T}R_T^\theta
\lesssim
\sqrt{T(H+1)\log K}+T/K+\sup_\theta \delta_T^\theta(H),
$$
where
$$
\delta_T^\theta(H)=
\sup_a\mathbb E_\theta\sum_t r_t(a)
-
\sup_a\mathbb E_\theta\sum_t r_t^H(a).
$$
If $\Delta(H)\le T H^{-\alpha}$, this gives
$$
R_T\lesssim
T^{(\alpha+1)/(2\alpha+1)}(\log T)^{\alpha/(2\alpha+1)}
$$
with $K=T$.

2. Known-law boundary:
for every known finite-horizon exogenous law, a horizon-aware conditional grid oracle achieves $R_T\le T/K$. So no nontrivial fixed-law tail condition is necessary under known-law quantifiers.

3. Hidden-terminal lower atom:
the $q$-scaled two-world terminal construction gives minimax regret at least $qD/8$, with $\beta(h)=q$ for $h<D$ and $\Delta,\delta\asymp q(D-H)$. This proves valuable hidden delayed mass can force regret, but only at one scale.

4. No scalar per-law profile theorem:
hidden and labeled versions have identical per-world reward, delay, $\beta,\Delta,\delta$ profiles, but hidden regret is $\Omega(qD)$ while labeled regret is zero up to discretization.

## Gaps And Failure Points

The finite/no-gap Bayes package is not a scalar tail characterization. It encodes the statistical experiment through public prefixes.

The arbitrary-class $\mathrm{ba}$ dual is exact but abstract. It is essentially the minimax value written in dual form.

No matching lower bound is known for power-tail envelopes. The one-block lower atom gives only $\Omega(D B(D))$, too weak for the current upper exponent.

Tail-adaptive truncation is still conditional on an unproved comparator-specific heterogeneous-delay experts theorem.

Action-dependent prices are outside the proved reductions.

## Counterexamples Or Obstructions

- iid uniform prices: raw $\beta(h)=1$ for all $h$, but known-law regret can be zero.
- Tiny-price long blocks: raw $\beta(h)=1$, yet total comparator value is bounded.
- Rare-history process: raw essential-sup $\beta(h)=1$, but $\sup_T V_T<\infty$ and $\Delta_T(H)=O(1/H)$.
- Hidden/labeled pair: identical per-law tail profiles but different minimax regret.
- Infinite-class product-closure gap: finite subclasses can be learnable while the full Borel-policy class has linear value.

## Promising Ideas To Explore

1. Finish the Borel-policy no-gap bridge under the exact common seed/state model.
2. Prove or refute comparator-specific delayed experts:
$$
\text{regret to arm }i \stackrel{?}{\lesssim}\sqrt{T(d_i+1)\log N}.
$$
3. Build lower-rate examples via limited-leakage or noisy common-parameter constructions, not naive repeated terminal atoms.
4. Develop last-exceedance/value-tail calculus, but only with public-prefix predictability included.

## Notes For Critics

Key assumptions to audit: public exogenous prices, randomized common policies, finite-grid consistency, positive-part regret convention, horizon-censored $M_t$, and use of $\sup_a$ rather than $\max_a$. The main theorem package is valid partial progress, but I would not label the original problem solved.