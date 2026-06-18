# Delayed Market Making II: Fast Making, Slow Clearing

This note solves the version where the maker trades with the taker immediately, but can clear the resulting position in the reference market only after a delay.

Without an explicit inventory constraint, this is still just a delayed-feedback version of the market-making problem from `latex/colt.tex`.

## Model

Let

$$
\mathcal U = \{(B,A)\in[0,1]^2 : B\le A\}.
$$

At round $t$, the learner posts $(B_t,A_t)\in\mathcal U$ and immediately interacts with the taker of valuation $Z_t$.

If $B_t\ge Z_t$, the maker buys one unit at price $B_t$.

If $A_t<Z_t$, the maker sells one unit short at price $A_t$.

The maker clears this trade only after an exogenous delay $D_t\in\{0,1,\dots,\tau\}$, at round

$$
c_t = t + D_t.
$$

The reward attributable to the action chosen at round $t$ is therefore

$$
u_t^{\mathrm{clear}}(B,A)
=
(P_{c_t}-B)\mathbf 1\{B\ge Z_t\}
+
(A-P_{c_t})\mathbf 1\{A<Z_t\}.
$$

Trade direction is known immediately, but the full reward is known only once $P_{c_t}$ is observed.

The regret against the best fixed pair is

$$
R_T^{\mathrm{clear}}
=
\sup_{(B,A)\in\mathcal U}
\mathbb E\!\left[\sum_{t=1}^T u_t^{\mathrm{clear}}(B,A)\right]
-
\mathbb E\!\left[\sum_{t=1}^T u_t^{\mathrm{clear}}(B_t,A_t)\right].
$$

## Why Inventory Accumulation Does Not Change The Static-Regret Problem

Suppose trades opened in a block of rounds $I_j$ are all cleared at the same later price $P_{c_j}$.

Then the total PnL of that block under a fixed pair $(B,A)$ is

$$
\sum_{t\in I_j}
\bigl(-B\mathbf 1\{B\ge Z_t\} + A\mathbf 1\{A<Z_t\}\bigr)
+
P_{c_j}
\sum_{t\in I_j}
\bigl(\mathbf 1\{B\ge Z_t\} - \mathbf 1\{A<Z_t\}\bigr).
$$

Rearranging,

$$
\sum_{t\in I_j}
\Bigl(
(P_{c_j}-B)\mathbf 1\{B\ge Z_t\}
+
(A-P_{c_j})\mathbf 1\{A<Z_t\}
\Bigr)
=
\sum_{t\in I_j} u_t^{\mathrm{clear}}(B,A).
$$

So even though inventory is nonzero between clearing rounds, cumulative reward still decomposes additively into per-round delayed utilities.

That means: if there is no hard inventory cap and no explicit inventory penalty, the learning problem is still a delayed-feedback bandit problem, not a new stateful control problem.

## Reduction To The Base Problem

Define

$$
\widehat P_t := P_{c_t},
\qquad
\widehat Z_t := Z_t.
$$

Then

$$
u_t^{\mathrm{clear}}(B,A)
=
(\widehat P_t-B)\mathbf 1\{B\ge \widehat Z_t\}
+
(A-\widehat P_t)\mathbf 1\{A<\widehat Z_t\},
$$

which is again exactly the one-round utility from `latex/colt.tex`.

Hence delayed clearing is the same market-making objective on the transformed sequence $(\widehat P_t,\widehat Z_t)$, with delayed feedback.

The same assumptions are preserved:

- Under `(adv+lip)`, the valuation side is still $Z_t$, so the Lipschitz assumption is unchanged.
- Under `(iid+iv)`, if the clearing times are exogenous and injective, then $(\widehat P_t,\widehat Z_t)$ is again `(iid+iv)`.

## Delay-Robust Version Of `M3`

Run $\tau+1$ independent copies of `M3`:

$$
\mathcal M_0,\mathcal M_1,\dots,\mathcal M_\tau.
$$

At real round $t$, use copy

$$
j = t \bmod (\tau+1).
$$

When the clearing price for round $t$ is finally observed at time $c_t$, feed the completed feedback of round $t$ to the same copy $\mathcal M_j$.

Because each copy is reused only every $\tau+1$ rounds, and every delay is at most $\tau$, every copy again experiences immediate feedback on its own subsequence.

## Theorem

Assume the base algorithm `M3` from `latex/colt.tex` satisfies

$$
R_n \le c\,n^{2/3}
$$

for every horizon $n$ under either `(adv+lip)` or `(iid+iv)`.

Then the delayed wrapper satisfies

$$
R_T^{\mathrm{clear}}
\le
c\,(\tau+1)^{1/3}T^{2/3}.
$$

Using the constants from `latex/colt.tex`, this gives

$$
R_T^{\mathrm{clear}}
\le
(2L+100)(\tau+1)^{1/3}T^{2/3}
\qquad\text{under `(adv+lip)`},
$$

and

$$
R_T^{\mathrm{clear}}
\le
102(\tau+1)^{1/3}T^{2/3}
\qquad\text{under `(iid+iv)`}.
$$

## Proof

Let $n_j$ be the number of rounds assigned to copy $\mathcal M_j$.

Copy $j$ sees an ordinary immediate-feedback market-making problem of horizon $n_j$, so its regret is at most

$$
c\,n_j^{2/3}.
$$

Summing over all copies,

$$
R_T^{\mathrm{clear}}
\le
c\sum_{j=0}^{\tau} n_j^{2/3}.
$$

Applying Hölder's inequality,

$$
\sum_{j=0}^{\tau} n_j^{2/3}
\le
(\tau+1)^{1/3}\left(\sum_{j=0}^{\tau} n_j\right)^{2/3}
=
(\tau+1)^{1/3}T^{2/3}.
$$

Therefore

$$
R_T^{\mathrm{clear}}
\le
c\,(\tau+1)^{1/3}T^{2/3}.
$$

## What Changes If You Really Want Risk Control?

If you want the phrase "accumulates risk" to matter mathematically, then you must add a state constraint or a state penalty.

For example, let $Q_t$ be open inventory and write

$$
Q_{t+1}
=
Q_t
+
\mathbf 1\{B_t\ge Z_t\}
-
\mathbf 1\{A_t<Z_t\}
-
C_t,
$$

where $C_t$ is the quantity cleared at round $t$.

If we require $|Q_t|\le M$, or penalize large $|Q_t|$, then:

- feasibility depends on the current state $Q_t$,
- the best fixed pair is no longer the right benchmark,
- the problem becomes a constrained or stateful bandit problem.

That version is closer to bandits with replenishable knapsacks than to the static market-making problem from `latex/colt.tex`.

So the correct split is:

- No inventory constraint: delayed clearing is solved by delayed `M3`.
- With inventory control: it is a different problem and needs a different benchmark and algorithmic machinery.

## References

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari, [*Online Learning under Delayed Feedback*](https://proceedings.mlr.press/v28/joulani13.html), ICML 2013.
  This is the main delayed-feedback reference behind the bounded-delay wrapper used here.

- Andras Gyorgy, Pooria Joulani, [*Adapting to Delays and Data in Adversarial Multi-Armed Bandits*](https://proceedings.mlr.press/v139/gyorgy21a.html), ICML 2021.
  This is the right reference if one wants to move from bounded-delay toy wrappers to delay-adaptive adversarial bandit guarantees.
