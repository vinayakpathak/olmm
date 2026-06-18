# Between Stochastic and Adversarial: Two Models That Actually Work

This note replaces the previous vague one.

I only keep ideas for which I can prove a regret bound by modifying the analysis already in `latex/colt.tex`.

The baseline from `latex/colt.tex` is:

- under pure adversarial realistic feedback, regret is linear,
- under `(iid+iv)`, `M3` achieves

$$
R_T \le 102\,T^{2/3},
$$

- under `(adv+lip)`, `M3` achieves

$$
R_T \le (2L+100)\,T^{2/3}.
$$

The question here is: can we relax exact independence `(iv)` in a quantitative way and still retain a bound better than the linear adversarial one?

My answer is yes, but only for a narrow class of relaxations that fit the existing proof.

## Setup

The one-round utility is

$$
u(b,a,P,Z)
=
(P-b)\mathbf 1\{Z\le b\}
+
(a-P)\mathbf 1\{Z>a\},
$$

with

$$
\mathcal U = \{(b,a)\in[0,1]^2 : b\le a\}.
$$

As in `latex/colt.tex`, `M3` reduces market making to:

- a bid-side first-price-auction subproblem,
- an ask-side dynamic-pricing subproblem.

The proof of the `(iid+iv)` theorem in `latex/colt.tex` has two parts:

1. a `K`-armed adversarial bandit term, which is already robust,
2. a discretization term, where exact independence is used.

So the only place to attack is the discretization step.

## Idea 1: Quantitative Relaxation Of Independence

The right parameter is not generic total variation or Wasserstein distance. The exact quantity used by the current proof is the covariance between the market price and threshold events of the form `Z <= x`.

Define

$$
\rho
:=
\sup_{x\in[0,1]}
\left|
\operatorname{Cov}\!\left(P,\mathbf 1\{Z\le x\}\right)
\right|.
$$

Under exact independence, `rho = 0`.

This parameter is natural because the bid-side and ask-side expected rewards can be written exactly in terms of it.

Let

$$
\mu := \mathbb E[P],
\qquad
F(x) := \mathbb P[Z\le x].
$$

Then for any bid `b`,

$$
\mathbb E[(P-b)\mathbf 1\{Z\le b\}]
=
(\mu-b)F(b)
+
\operatorname{Cov}\!\left(P,\mathbf 1\{Z\le b\}\right),
$$

and for any ask `a`,

$$
\mathbb E[(a-P)\mathbf 1\{Z>a\}]
=
(a-\mu)(1-F(a))
-
\operatorname{Cov}\!\left(P,\mathbf 1\{Z\le a\}\right).
$$

So exact independence is used in `colt.tex` only to kill the covariance term. If the covariance term is small uniformly in the threshold, the same proof survives.

## Theorem 1: I.I.D. Near-Independence

Assume `(P_t,Z_t)_{t=1}^T` is i.i.d. with common law equal to that of `(P,Z)`.

Let

$$
\rho
:=
\sup_{x\in[0,1]}
\left|
\operatorname{Cov}\!\left(P,\mathbf 1\{Z\le x\}\right)
\right|.
$$

Run exactly the same algorithm as in the `(iid+iv)` part of `latex/colt.tex`:

- `M3`,
- bid-side and ask-side discretization with `K = \lceil T^{1/3}\rceil + 1`,
- Poly-INF on the `K` grid points in each one-dimensional subproblem.

Then

$$
R_T \le 102\,T^{2/3} + 4\rho T.
$$

In particular:

- if `rho = 0`, we recover the theorem in `latex/colt.tex`,
- if `rho = o(1)`, then `R_T = o(T)`,
- if `rho \le T^{-1/3}`, then `R_T = O(T^{2/3})`.

## Proof Of Theorem 1

I only need to revisit the discretization argument in the proof of the `(iid+iv)` theorem.

### Bid side

Let

$$
\phi(b) := \mathbb E[(P-b)\mathbf 1\{Z\le b\}].
$$

Write

$$
\phi(b) = \psi(b) + c(b),
$$

where

$$
\psi(b) := (\mu-b)F(b),
\qquad
c(b) := \operatorname{Cov}\!\left(P,\mathbf 1\{Z\le b\}\right).
$$

By definition, `|c(b)| <= rho` for every `b`.

Let the bid grid be `q_1,\dots,q_K`. In the exact-independence proof from `latex/colt.tex`, the discretization error for `psi` is

$$
\sup_{b\in[0,1]} \psi(b) - \max_{k\in[K]} \psi(q_k)
\le
\frac{1}{K-1}.
$$

Therefore

$$
\sup_{b\in[0,1]} \phi(b)
- \max_{k\in[K]} \phi(q_k)
$$

is at most

$$
\sup_{b\in[0,1]} (\psi(b)+\rho)
- \max_{k\in[K]} (\psi(q_k)-\rho)
\le
\frac{1}{K-1} + 2\rho.
$$

So the bid-side discretization error over `T` rounds is at most

$$
\left(\frac{1}{K-1} + 2\rho\right)T.
$$

The bandit-analysis part of `latex/colt.tex` is unchanged, so for the bid-side subproblem the same Poly-INF bound gives

$$
R_T^{\mathrm{bid}}
\le
50\,T^{2/3}
+
\left(\frac{1}{K-1} + 2\rho\right)T.
$$

With `K = \lceil T^{1/3}\rceil + 1`, this becomes

$$
R_T^{\mathrm{bid}}
\le
51\,T^{2/3} + 2\rho T.
$$

### Ask side

Now define

$$
\gamma(a) := \mathbb E[(a-P)\mathbf 1\{Z>a\}].
$$

Write

$$
\gamma(a) = \xi(a) + d(a),
$$

where

$$
\xi(a) := (a-\mu)(1-F(a)),
\qquad
d(a) := -\operatorname{Cov}\!\left(P,\mathbf 1\{Z\le a\}\right).
$$

Again `|d(a)| <= rho` for every `a`.

The exact-independence proof in `latex/colt.tex` gives

$$
\sup_{a\in[0,1]} \xi(a) - \max_{k\in[K]} \xi(q_k)
\le
\frac{1}{K-1}.
$$

So the same sandwiching argument gives ask-side discretization error

$$
\left(\frac{1}{K-1} + 2\rho\right)T,
$$

and therefore

$$
R_T^{\mathrm{ask}}
\le
51\,T^{2/3} + 2\rho T.
$$

### Sum the two subproblems

`latex/colt.tex` proves that the regret of `M3` is at most the sum of the regrets of the bid-side and ask-side subproblems. Hence

$$
R_T
\le
R_T^{\mathrm{bid}} + R_T^{\mathrm{ask}}
\le
102\,T^{2/3} + 4\rho T.
$$

That is the claim.

## Why Theorem 1 Is The Right Kind Of Relaxation

This bound is not magic. It works for one specific reason:

- the only place where `(iv)` is used in `latex/colt.tex` is in turning the expected reward into the one-dimensional functions

$$
(\mu-b)F(b)
\qquad\text{and}\qquad
(a-\mu)(1-F(a)),
$$

- small threshold-covariance perturbs these functions by at most `rho`,
- therefore the discretization step degrades by only `2rho` per subproblem.

So this is not a speculative analogy with the OCO paper. It is a direct perturbation of the existing proof.

## Corollary 1: Mixture Of Uninformed And Informed Traders

The previous theorem becomes more interpretable if we express it through a trader-type mixture.

Assume the data are i.i.d. and generated as follows:

- first sample a latent type `H_t in {0,1}` with `P(H_t=1) = alpha`,
- if `H_t = 0`, then `P_t` and `Z_t` are independent,
- if `H_t = 1`, then `(P_t,Z_t)` has an arbitrary joint law.

So:

- `H_t = 0` means an uninformed trader,
- `H_t = 1` means an informed or adversarially selected trader.

Then

$$
\rho \le \frac{5}{4}\alpha.
$$

Hence Theorem 1 implies

$$
R_T \le 102\,T^{2/3} + 5\alpha T.
$$

### Proof

Fix `x in [0,1]` and let `Y_x := 1{Z <= x}`.

By the law of total covariance,

$$
\operatorname{Cov}(P,Y_x)
=
\mathbb E[\operatorname{Cov}(P,Y_x \mid H)]
+
\operatorname{Cov}(\mathbb E[P\mid H], \mathbb E[Y_x\mid H]).
$$

For the first term:

- when `H=0`, the covariance is `0`,
- when `H=1`, its absolute value is at most `1/4` because `P in [0,1]` and `Y_x in {0,1}`.

So

$$
\left|
\mathbb E[\operatorname{Cov}(P,Y_x \mid H)]
\right|
\le
\frac{\alpha}{4}.
$$

For the second term, `\mathbb E[P\mid H]` and `\mathbb E[Y_x\mid H]` both lie in `[0,1]`, and `H` is Bernoulli with mean `alpha`, so

$$
\left|
\operatorname{Cov}(\mathbb E[P\mid H], \mathbb E[Y_x\mid H])
\right|
\le
\alpha(1-\alpha)
\le
\alpha.
$$

Therefore

$$
\left|\operatorname{Cov}(P,Y_x)\right|
\le
\frac{\alpha}{4} + \alpha
=
\frac{5}{4}\alpha.
$$

Take the supremum over `x`.

### Interpretation

This is a clean "between stochastic and adversarial" model:

- `alpha = 0` is exactly `(iid+iv)`,
- `alpha = 1` allows arbitrary dependence.

The current proof gives a sublinear guarantee only in the regime `alpha = o(1)`. If `alpha` is a fixed absolute constant, the bound above is still linear, so I do not count that as a genuine order improvement over the adversarial theorem.

## Idea 2: Piecewise-Stationary Near-Independence

The previous result is still i.i.d. across the whole horizon. The next step that I can actually prove is piecewise stationarity with known segment boundaries.

I do not know how to prove the same thing with unknown change points using only the machinery in `latex/colt.tex`, so I will not claim it.

Assume the horizon is partitioned into known segments

$$
[1,T_1],\ [T_1+1,T_1+T_2],\ \dots,\ [T-T_S+1,T],
$$

with

$$
T_1 + \cdots + T_S = T.
$$

On segment `s`, the pairs `(P_t,Z_t)` are i.i.d. from some distribution `D_s`.

Define

$$
\rho_s
:=
\sup_{x\in[0,1]}
\left|
\operatorname{Cov}_{D_s}\!\left(P,\mathbf 1\{Z\le x\}\right)
\right|.
$$

Run a fresh copy of the algorithm from Theorem 1 on each segment.

## Theorem 2: Known Piecewise-Stationary Regimes

Under the model above,

$$
R_T
\le
102\sum_{s=1}^S T_s^{2/3}
+
4\sum_{s=1}^S \rho_s T_s.
$$

Using Hölder,

$$
\sum_{s=1}^S T_s^{2/3}
\le
S^{1/3}T^{2/3},
$$

so

$$
R_T
\le
102\,S^{1/3}T^{2/3}
+
4\sum_{s=1}^S \rho_s T_s.
$$

In particular, if each segment satisfies exact independence, `rho_s = 0`, then

$$
R_T \le 102\,S^{1/3}T^{2/3}.
$$

So a bounded number of regime changes still yields sublinear regret.

## Proof Of Theorem 2

Apply Theorem 1 separately on each segment.

The regret on segment `s` is at most

$$
102\,T_s^{2/3} + 4\rho_s T_s.
$$

Because we restart the algorithm at every known boundary, the total regret is the sum of the segment regrets:

$$
R_T
\le
\sum_{s=1}^S \left(102\,T_s^{2/3} + 4\rho_s T_s\right)
=
102\sum_{s=1}^S T_s^{2/3}
+
4\sum_{s=1}^S \rho_s T_s.
$$

Now apply Hölder:

$$
\sum_{s=1}^S T_s^{2/3}
\le
S^{1/3}\left(\sum_{s=1}^S T_s\right)^{2/3}
=
S^{1/3}T^{2/3}.
$$

Done.

## Corollary 2: Piecewise Mixtures Of Informed And Uninformed Traders

On each segment `s`, suppose there is a latent type variable `H_t` such that:

- `P(H_t=1)=alpha_s`,
- conditional on `H_t=0`, `P_t` and `Z_t` are independent,
- conditional on `H_t=1`, the joint law is arbitrary,
- the segment boundaries are known.

Then the same covariance calculation as above gives

$$
\rho_s \le \frac{5}{4}\alpha_s,
$$

and therefore

$$
R_T
\le
102\,S^{1/3}T^{2/3}
+
5\sum_{s=1}^S \alpha_s T_s.
$$

This is sublinear whenever:

- the number of regimes is `o(T)`,
- the total informed-flow mass `\sum_s \alpha_s T_s` is `o(T)`.

## What I Am Not Claiming

I am not claiming any new bound for:

- unknown change points,
- arbitrary per-round drift,
- random-order models,
- fully adversarial mixtures without additional structure.

Those may be interesting, but I do not currently see a proof from the machinery in `latex/colt.tex`.

## Bottom Line

Two concrete interpolations between `(iid+iv)` and the fully adversarial case do survive the current proof:

1. i.i.d. data with small threshold-covariance:

$$
R_T \le 102\,T^{2/3} + 4\rho T,
$$

2. known piecewise-stationary regimes with per-segment threshold-covariance `rho_s`:

$$
R_T \le 102\,S^{1/3}T^{2/3} + 4\sum_{s=1}^S \rho_s T_s.
$$

The key point is that these are not generic analogies. They work because they perturb exactly the one step of the existing proof where independence was needed.
