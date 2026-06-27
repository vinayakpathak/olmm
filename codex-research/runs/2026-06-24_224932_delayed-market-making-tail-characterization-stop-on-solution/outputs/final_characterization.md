# Characterization After The Stop-On-Solution Research Loop

This note summarizes the strongest characterization supported by the 20-iteration
research loop restarted with `--stop-on-solution`. The run completed through
iteration 22 because iterations 17 and 18 were contaminated by quota failures in
the first pass. The solution gates rejected the two "maybe solved" candidates,
and the final run state is `accepted_solution: false`.

The conclusion is therefore deliberately conservative:

- The original raw tail conjecture based on $\beta(h)\to0$ is false as a
  necessary-and-sufficient condition.
- There is an exact necessary-and-sufficient condition, but it is a minimax
  predictability/Bayes-gap condition, not a scalar tail condition.
- The lower and upper bounds match in terms of this value characterization.
- The truncation/tail argument gives a useful one-sided upper bound. A matching
  lower bound in terms of scalar tail envelopes remains open, and in several
  natural forms is impossible.

## Model And Horizon-Censored Rewards

Fix a horizon $T$. The learner observes the public price prefix $P_{1:t}$ before
choosing quote $a_t$. Prices are public, exogenous, and action-independent. The
active law is an unknown element $\theta$ of a known horizon-indexed class
$\Theta_T$. Policies may randomize using law-independent private randomness.

For a quote posted at time $t$, only future prices before the horizon matter:
$$
M_t^T=\max_{t<s\le T}P_s,
\qquad
r_t(a)=a\mathbf{1}\{M_t^T>a\}.
$$

Equivalently, with
$$
\tau_t(a)=\min\{s>0:P_{t+s}>a\},
$$
the reward is $a\mathbf{1}\{\tau_t(a)\le T-t\}$.

For an action set $G$, usually a finite grid, define
$$
V_\theta^G=\max_{a\in G}\sum_{t=1}^T
\mathbb{E}_\theta[r_t(a)]
$$

and, for a randomized $G$-valued policy $A$,
$$
L_\theta(A)=\mathbb{E}_{\theta,A}\sum_{t=1}^T r_t(a_t).
$$

The minimax upper-regret value is
$$
\mathcal{R}_T^G(\Theta_T)
=
\inf_A\sup_{\theta\in\Theta_T}\{V_\theta^G-L_\theta(A)\}.
$$

Sublinear regret is possible exactly when the positive part of the continuum
value satisfies
$$
\bigl(\mathcal{R}_T^{[0,1]}(\Theta_T)\bigr)_+=o(T).
$$

This is the primitive condition. The results below identify it in usable dual
forms.

## Exact Arbitrary-Class Characterization

Let
$$
C_T^G
=
\{(L_\theta(A))_{\theta\in\Theta_T}: A \text{ is an admissible randomized }
G\text{-policy}\}
\subset \ell^\infty(\Theta_T).
$$

For arbitrary, possibly infinite, $\Theta_T$, the exact finite-grid value is
$$
\mathcal{R}_T^G(\Theta_T)
=
\sup_{\nu\in \mathrm{ba}_1^+(\Theta_T)}
\left\{
\langle V^G,\nu\rangle
-
\sup_{c\in C_T^G}\langle c,\nu\rangle
\right\}.
\tag{1}
$$

Here $\mathrm{ba}_1^+(\Theta_T)$ is the set of positive norm-one finitely additive
probabilities on $\Theta_T$. This is an exact convex-duality formula for the
minimax value. It is not an ordinary Bayesian posterior formula: a finitely
additive prior need not generate a countably additive mixture law or conditional
posterior process.

Let
$$
G_T=\{0,1/T,2/T,\ldots,(T-1)/T\}.
$$

The continuum and grid values differ by at most one:
$$
\left|
\mathcal{R}_T^{[0,1]}(\Theta_T)
-
\mathcal{R}_T^{G_T}(\Theta_T)
\right|\le 1.
\tag{2}
$$

Therefore an exact necessary-and-sufficient condition for sublinear regret in
the public-exogenous horizon-aware minimax model is
$$
\left[
\sup_{\nu\in \mathrm{ba}_1^+(\Theta_T)}
\left\{
\langle V^{G_T},\nu\rangle
-
\sup_{c\in C_T^{G_T}}\langle c,\nu\rangle
\right\}
\right]_+
=o(T).
\tag{3}
$$

This is the most general characterization found by the loop.

## Finite-Class Bayes Predictability Characterization

When $\Theta_T$ is finite, the finitely additive dual reduces to an ordinary
least-favorable-prior formula.

For a prior $\pi$ on $\Theta_T$, let $\bar P_\pi$ be the mixture law. Define
$$
\Psi_{G,\Theta_T}(\pi)
=
\sum_{\theta\in\Theta_T}\pi_\theta V_\theta^G
-
\sum_{t=1}^T
\mathbb{E}_{\bar P_\pi}
\left[
\max_{a\in G}
a\,\bar P_\pi(M_t^T>a\mid P_{1:t})
\right].
\tag{4}
$$

Then
$$
\mathcal{R}_T^G(\Theta_T)
=
\sup_{\pi\in\Delta(\Theta_T)}
\Psi_{G,\Theta_T}(\pi).
\tag{5}
$$

Combining (2) and (5), for finite classes,
$$
\left|
\bigl(\mathcal{R}_T^{[0,1]}(\Theta_T)\bigr)_+
-
\left(
\sup_{\pi\in\Delta(\Theta_T)}
\Psi_{G_T,\Theta_T}(\pi)
\right)_+
\right|
\le 1.
\tag{6}
$$

Thus for finite horizon-indexed public-exogenous classes:
$$
\boxed{
\text{sublinear regret is possible}
\iff
\left(
\sup_{\pi\in\Delta(\Theta_T)}
\Psi_{G_T,\Theta_T}(\pi)
\right)_+
=o(T).
}
\tag{7}
$$

Interpretation: the obstruction is not delayed hits per se. The obstruction is
unpredictable fixed-quote value under a least-favorable prior. At each public
history, the learner can earn the posterior-predictive myopic value
$$
\max_{a\in G_T}a\,\bar P_\pi(M_t^T>a\mid P_{1:t}),
$$

while the comparator receives the prior average of the world-specific fixed
quote optima. The gap between these two quantities is exactly the minimax
regret value up to the $O(1)$ discretization loss.

## Infinite Classes With No-Gap Hypotheses

For infinite classes, ordinary finite priors may miss full-class obstructions.
Define the finite-subclass Bayes modulus
$$
B_T(G)
=
\sup_{F\Subset\Theta_T}
\sup_{\pi\in\Delta(F)}
\Psi_{G,F}(\pi).
\tag{8}
$$

Under product-closure/no-gap hypotheses on the attainable reward set, or under
the payoff-measure domination plus Borel policy bridge developed in the loop,
$$
\mathcal{R}_T^G(\Theta_T)=B_T(G).
\tag{9}
$$

Consequently, under those no-gap hypotheses,
$$
\boxed{
\text{sublinear regret is possible}
\iff
\bigl(B_T(G_T)\bigr)_+=o(T).
}
\tag{10}
$$

Without such a no-gap assumption, (8) can be strictly smaller than the true
value. Formula (1) with finitely additive priors remains the exact arbitrary
class statement.

## Matching Lower And Upper Bounds

The characterization gives matching lower and upper bounds in value form.

For arbitrary classes:
$$
\left|
\mathcal{R}_T^{[0,1]}(\Theta_T)
-
D_T
\right|\le 1,
$$

where
$$
D_T=
\sup_{\nu\in \mathrm{ba}_1^+(\Theta_T)}
\left\{
\langle V^{G_T},\nu\rangle
-
\sup_{c\in C_T^{G_T}}\langle c,\nu\rangle
\right\}.
$$

Equivalently, for every policy there is a law $\theta$ with regret at least
$D_T-1-o(1)$, and there is a policy with worst-case regret at most
$D_T+1+o(1)$.

For finite classes, or infinite no-gap classes:
$$
\left|
\mathcal{R}_T^{[0,1]}(\Theta_T)
-
\sup_{\pi}\Psi_{G_T,\Theta_T}(\pi)
\right|\le 1
$$

in the finite case, and the same statement holds with $\sup_\pi$ replaced by
$B_T(G_T)$ in the no-gap infinite case.

This is the clean matched lower/upper theorem produced by the loop.

## Tail Upper Bound

The original $\beta$ condition is still a useful sufficient condition through
truncation. For a truncation window $H$, define
$$
r_t^H(a)=a\mathbf{1}\{\tau_t(a)\le \min(H,T-t)\}.
$$

Let the comparator truncation loss be
$$
\delta_T^\theta(H)
=
\sup_{a\in[0,1]}\sum_{t=1}^T\mathbb{E}_\theta r_t(a)
-
\sup_{a\in[0,1]}\sum_{t=1}^T\mathbb{E}_\theta r_t^H(a).
$$

A grid-based delayed-experts algorithm gives, uniformly over a class,
$$
\sup_{\theta\in\Theta_T} R_T^\theta
\lesssim
\sqrt{T(H+1)\log K}
+{T\over K}
+\sup_{\theta\in\Theta_T}\delta_T^\theta(H).
\tag{11}
$$

If
$$
\Delta_T(H)
=
\sup_{\theta,a}
\sum_{t=1}^T
\mathbb{E}_\theta
\left[
a\mathbf{1}\{H<\tau_t(a)\le T-t\}
\right],
$$

then $\delta_T^\theta(H)\le \Delta_T(H)$. The raw essential-sup tail in
`delays.tex` implies
$$
\Delta_T(H)\le T\beta(H).
$$

Hence uniform $\beta(H)\to0$ is sufficient for sublinear regret by choosing
$H=H(T)\to\infty$ with $T\beta(H)=o(T)$ and
$\sqrt{T H\log K}=o(T)$.

If a sharper envelope satisfies
$$
\Delta_T(H)\le C T H^{-\alpha},
$$

then choosing $K=T$ and
$$
H\asymp (T/\log T)^{1/(2\alpha+1)}
$$

gives
$$
\sup_\theta R_T^\theta
\lesssim
T^{(\alpha+1)/(2\alpha+1)}
(\log T)^{\alpha/(2\alpha+1)}.
\tag{12}
$$

Exponential truncation tails similarly give essentially $\sqrt T$ regret up to
logarithmic factors.

## Why The Raw Tail Conjecture Fails

The condition $\beta(h)\to0$ is not necessary.

1. Known-law oracle obstruction. For any single known finite-horizon
   public-exogenous law, the learner can choose at each history a conditional
   grid maximizer of $a\,\mathbb{P}(M_t^T>a\mid P_{1:t})$, giving regret at
   most the grid discretization error, $O(1)$ with $K=T$.
   This can hold even when the raw first-hitting tail $\beta(h)$ is identically
   one.

2. Value-weight obstruction. Long delayed hits at tiny quotes can keep raw
   $\beta(h)$ large while contributing only bounded comparator value.

3. Hidden versus labeled obstruction. There are paired classes with the same
   per-law tail and value profiles, but different learnability. In the hidden
   class two worlds are observationally identical until a delayed terminal
   reveal and force regret $\Omega(qD)$. In the labeled class the active world is
   revealed publicly at time 1, so regret is zero on the relevant grid. Thus no
   condition depending only on individual laws' $\beta$, $\Delta$, $\delta$, or
   fixed-quote value profiles can characterize unknown-class learnability.

The hidden-terminal atom gives a useful lower-bound calibration:
$$
R_T\ge qD/8
$$

for a two-world construction with horizon $T=D+1$. With an absorbing extension,
it has roughly $\beta(h)=q$ for $h<D$ and zero after $D$, and
$\Delta(H),\delta(H)\asymp q(D-H)$. However, the loop did not turn this into a
matching lower bound for the power-tail upper rate (12). Attempts using repeated
same-level blocks fail because old quotes remain live and are hit by later
blocks, which destroys the intended tail envelope.

## Practical Answer To The User's Questions

Necessary and sufficient condition:

- In full generality, use the finitely additive minimax condition (3).
- For finite classes, use the ordinary least-favorable Bayes predictability gap
  (7).
- For infinite classes satisfying a no-gap/product-compactness condition, use
  the finite-subclass Bayes modulus (10).

Lower and upper bound:

- The matched lower/upper bound is the exact value $D_T$, or the Bayes modulus
  $\sup_\pi\Psi$/$B_T$, up to the additive grid error $1$.
- A simpler sufficient upper bound is the truncation bound (11), yielding the
  power-tail rate (12).
- A matching lower bound purely in terms of scalar tail envelopes is not
  established; the run found structural obstructions showing that such a scalar
  per-law characterization cannot be correct in general.
