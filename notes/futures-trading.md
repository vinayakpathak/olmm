# Futures Trading: Reduction To Market Making And The Right Stateful Formulation

This note solves the futures-trading draft from `latex/more.tex`.

The main conclusion is:

1. If we ignore the leverage constraint and only maximize expected cumulative margin, then after rewriting in relative coordinates the problem becomes a restricted special case of the market-making problem in `latex/colt.tex`.
2. Once we impose the constraint
   $$
   \frac{|p_t|}{g_t} \le C,
   $$
   the problem is no longer a bandit against the best fixed bid-ask pair. It becomes a stateful control problem. The right exact formulation is a Bellman recursion in the state $(p_t,g_t)$.

So the futures draft has a clean split:

- risk-neutral futures trading inherits the `M3` upper bound;
- leverage-constrained futures trading is an online MDP / knapsack-style extension.

## 1. Original Protocol From `latex/more.tex`

Before rewriting anything, here is the original futures protocol from `latex/more.tex`, expressed in words.

Initialize:

- margin `g_0`,
- last known mid-price `m_0`,
- leverage threshold `C`,
- position `p_0 = 0`.

For each round $t=1,\dots,T$:

1. The market reveals the public best bid and ask $b_t^M,a_t^M$.
2. The new public mid-price is
   $$
   m_t = \frac{b_t^M+a_t^M}{2}.
   $$
3. The current position is marked to market:
   $$
   g_t \gets g_{t-1} + (m_t-m_{t-1})p_{t-1}.
   $$
4. The learner chooses offsets $\delta_t^b,\delta_t^a$ and posts
   $$
   b_t = b_t^M + \delta_t^b,
   \qquad
   a_t = a_t^M - \delta_t^a.
   $$
5. A trader arrives with private valuation $v_t$.
6. If $v_t \le b_t$, then the learner buys one unit, the draft updates the position as
   $$
   p_{t+1} \gets p_t+1,
   $$
   and records local reward
   $$
   r_t^\star \gets m_t-b_t.
   $$
7. If $v_t > a_t$, then the learner sells one unit, the draft updates the position as
   $$
   p_{t+1} \gets p_t-1,
   $$
   and records local reward
   $$
   r_t^\star \gets a_t-m_t.
   $$
8. If neither event happens, then $r_t^\star \gets 0$.
9. The margin is updated again by
   $$
   g_t \gets g_t + r_t^\star.
   $$
10. If
    $$
    \frac{|p_t|}{g_t} > C,
    $$
    the game stops.

As written, this draft mixes pre-trade and post-trade versions of both $g_t$ and $p_t$. The next section rewrites the same protocol into a consistent state-update form.

## 2. Cleaned-Up Dynamics

The draft in `latex/more.tex` is easiest to read if we separate the mark-to-market step from the quoting step.

Let

- $m_t = (b_t^M + a_t^M)/2$ be the public mid-price at round $t$,
- $p_t \in \mathbb Z$ be the inventory after round $t$,
- $g_t$ be the margin after round $t$,
- $q_t \in \{-1,0,+1\}$ be the signed trade at round $t$:
  $$
  q_t =
  \mathbf 1\{v_t \le b_t\} - \mathbf 1\{v_t > a_t\}.
  $$

Then the natural state evolution is

$$
\widetilde g_t
=
g_{t-1} + (m_t - m_{t-1})p_{t-1},
$$

$$
r_t^{\mathrm{mm}}
=
(m_t-b_t)\mathbf 1\{v_t \le b_t\}
+
(a_t-m_t)\mathbf 1\{v_t > a_t\},
$$

$$
g_t = \widetilde g_t + r_t^{\mathrm{mm}},
\qquad
p_t = p_{t-1} + q_t.
$$

The leverage requirement is

$$
\frac{|p_t|}{g_t} \le C
\qquad\text{for all } t.
$$

This is the exact stateful version of the model.

## 3. A Useful Identity For The Margin

The cumulative margin can be written as

$$
g_T - g_0
=
\sum_{t=1}^T (m_t-m_{t-1})p_{t-1}
+
\sum_{t=1}^T r_t^{\mathrm{mm}}.
$$

Now expand the inventory term using

$$
p_{t-1} = \sum_{s=1}^{t-1} q_s.
$$

Then

$$
\sum_{t=1}^T (m_t-m_{t-1})p_{t-1}
=
\sum_{s=1}^{T-1} q_s (m_T-m_s).
$$

Therefore

$$
g_T-g_0
=
\sum_{t=1}^T
\Bigl(
(m_T-b_t)\mathbf 1\{v_t\le b_t\}
+
(a_t-m_T)\mathbf 1\{v_t>a_t\}
\Bigr).
$$

So the futures wealth is exactly the marked-to-market wealth of all trades at the terminal mid-price $m_T$.

This identity is useful, but for learning it is better to work one round at a time.

## 4. Relative Coordinates

Define the distance of our quotes from the current mid:

$$
x_t := m_t - b_t \ge 0,
\qquad
y_t := a_t - m_t \ge 0.
$$

Also define the trader's valuation relative to the current mid:

$$
z_t := v_t - m_t.
$$

Then the trade conditions become

$$
v_t \le b_t
\iff
z_t \le -x_t,
\qquad
v_t > a_t
\iff
z_t > y_t.
$$

The market-making reward becomes

$$
r_t^{\mathrm{mm}}
=
x_t \mathbf 1\{z_t \le -x_t\}
+
y_t \mathbf 1\{z_t > y_t\}.
$$

This is exactly the same one-round reward formula as in `latex/colt.tex` with the synthetic identification

$$
P_t \equiv 0,
\qquad
B_t = -x_t,
\qquad
A_t = y_t,
\qquad
Z_t = z_t.
$$

Indeed,

$$
(0-B_t)\mathbf 1\{B_t \ge Z_t\}
+
(A_t-0)\mathbf 1\{A_t < Z_t\}
=
x_t \mathbf 1\{z_t \le -x_t\}
+
y_t \mathbf 1\{z_t > y_t\}.
$$

So in relative coordinates, futures market making has the same per-round reward form as in `latex/colt.tex`.

However, as a learning problem this is only a restricted subclass of `latex/colt.tex`, not the full model class. After recentering:

- the clearing benchmark is fixed at $P_t \equiv 0$;
- feasible actions satisfy $B_t \le 0 \le A_t$;
- the learner observes the public mid $m_t$ before acting and quotes relative to it.

These restrictions can only make the futures subclass easier. So the reduction below should be interpreted as an upper-bound transfer from a more general problem, not as an equivalence of minimax difficulty.

## 5. Risk-Neutral Futures Trading Inherits The `M3` Upper Bound

Assume the public mid-price process is a martingale with respect to the public filtration:

$$
\mathbb E[m_t-m_{t-1}\mid \mathcal F_{t-1}] = 0.
$$

Then for any predictable strategy,

$$
\mathbb E\!\left[(m_t-m_{t-1})p_{t-1}\mid \mathcal F_{t-1}\right] = 0,
$$

and therefore

$$
\mathbb E[g_T-g_0]
=
\mathbb E\!\left[\sum_{t=1}^T r_t^{\mathrm{mm}}\right].
$$

Hence the expected position PnL disappears, and maximizing expected cumulative margin is equivalent to maximizing expected cumulative spread capture.

This gives the clean theorem.

## Theorem 1

Assume:

- the learner chooses quotes through the relative offsets $(x_t,y_t)$,
- the public mid-price process $(m_t)$ is a martingale,
- the relative valuations $z_t = v_t - m_t$ satisfy either the `(adv+lip)` assumption or the `(iid+iv)` assumption from `latex/colt.tex`.

Then the risk-neutral futures-trading problem

$$
\max \mathbb E[g_T]
$$

is a special case of the market-making problem of `latex/colt.tex` on the synthetic sequence $(P_t,Z_t) = (0,z_t)$.

Therefore the `M3` construction from `latex/colt.tex` yields the valid regret upper bound

$$
R_T \le c\,T^{2/3},
$$

with

$$
c \le 2L+100
\qquad\text{under `(adv+lip)`},
$$

and

$$
c \le 102
\qquad\text{under `(iid+iv)`}.
$$

## Proof

By the martingale assumption, the expected cumulative position reward is zero:

$$
\mathbb E\!\left[\sum_{t=1}^T (m_t-m_{t-1})p_{t-1}\right] = 0.
$$

So the expected objective reduces to

$$
\mathbb E\!\left[\sum_{t=1}^T
\bigl(
x_t \mathbf 1\{z_t\le -x_t\}
+
y_t \mathbf 1\{z_t>y_t\}
\bigr)\right].
$$

But this is exactly the market-making reward formula in `latex/colt.tex` after the identification

$$
P_t \equiv 0,
\quad
B_t=-x_t,
\quad
A_t=y_t,
\quad
Z_t=z_t.
$$

So all upper bounds from `latex/colt.tex` transfer directly. This does not show that futures trading has the same intrinsic difficulty as the full `colt.tex` model, only that it belongs to a more structured subclass for which the same algorithm is valid.

## 6. What Changes If The Mid-Price Is Not A Martingale?

The martingale assumption is only used in one place: it removes the expected carry term

$$
\sum_{t=1}^T (m_t-m_{t-1})p_{t-1}.
$$

Without it, the relative-coordinate identity for the spread-capture reward is still true, but the objective

$$
\mathbb E[g_T]
$$

is no longer the same as the `M3` objective.

To see the right decomposition, define the predictable drift

$$
\mu_t := \mathbb E[m_t-m_{t-1}\mid \mathcal F_{t-1}],
$$

and write

$$
m_t-m_{t-1} = \mu_t + \xi_t,
\qquad
\mathbb E[\xi_t\mid \mathcal F_{t-1}] = 0.
$$

Then for every predictable strategy,

$$
\mathbb E[g_T-g_0]
=
\mathbb E\!\left[\sum_{t=1}^T r_t^{\mathrm{mm}}\right]
+
\mathbb E\!\left[\sum_{t=1}^T \mu_t p_{t-1}\right].
$$

So there are really two components:

- the spread-capture term, which is exactly the market-making reward from `latex/colt.tex`;
- the directional inventory term, which depends on the interaction between predictable price drift and inventory.

This has three immediate consequences.

### 6.1. If We Only Care About Spread Capture

If the objective is

$$
\mathbb E\!\left[\sum_{t=1}^T r_t^{\mathrm{mm}}\right],
$$

then no martingale assumption is needed at all. The reduction to the same per-round reward formula as `M3` in relative coordinates is exact.

### 6.2. If The Drift Is Small

Suppose inventory is controlled so that $|p_t|\le M$ for all $t$. Then

$$
\left|
\mathbb E\!\left[\sum_{t=1}^T \mu_t p_{t-1}\right]
\right|
\le
M \sum_{t=1}^T \mathbb E[|\mu_t|].
$$

So if the predictable drift budget $\sum_t \mathbb E[|\mu_t|]$ is small, the non-martingale part is only an additive perturbation of the `M3` objective.

### 6.3. If The Drift Is Material

If the predictable drift is not negligible, then the futures problem is no longer a static regret problem against a fixed bid-ask pair.

The reason is that taking inventory now has directional value. In an upward-trending market, being long is beneficial; in a downward-trending market, being short is beneficial. The learner is therefore solving a stateful control problem in which the reward contains both

$$
r_t^{\mathrm{mm}}
\qquad\text{and}\qquad
\mu_t p_{t-1}.
$$

At that point the right benchmark is not the best fixed pair $(b,a)$ from `latex/colt.tex`, but a policy that uses the current state and whatever public signal predicts $\mu_t$.

Finally, note that the terminal-price identity from Section 3 remains valid even without martingality:

$$
g_T-g_0
=
\sum_{t=1}^T
\Bigl(
(m_T-b_t)\mathbf 1\{v_t\le b_t\}
+
(a_t-m_T)\mathbf 1\{v_t>a_t\}
\Bigr).
$$

This is exact, but it does not directly recover the `colt.tex` model, because now every round is coupled to the same random terminal price $m_T$.

## 7. Why The Leverage Constraint Changes The Problem Class

Now restore the requirement

$$
\frac{|p_t|}{g_t} \le C.
$$

At this point the benchmark from `latex/colt.tex` is no longer the right one.

The reason is simple:

- the feasible set at round $t$ depends on the current state $(p_{t-1},g_{t-1})$,
- current actions affect future feasibility through the inventory update $p_t = p_{t-1}+q_t$,
- therefore we are no longer competing with a single fixed pair of quotes.

This is the point where the problem stops being a bandit over static bid-ask pairs and becomes a stateful control problem.

The right object is a policy

$$
\pi_t : (p_{t-1},g_{t-1},m_t,b_t^M,a_t^M) \mapsto (b_t,a_t).
$$

In other words, the leverage-constrained futures problem is an online MDP.

## 8. Exact Dynamic Program For The Constrained Version

The exact Bellman formulation is easiest to write in relative coordinates.

Let

$$
x = m-b,
\qquad
y = a-m,
\qquad
z = v-m.
$$

Then

$$
q(x,y,z)
=
\mathbf 1\{z\le -x\} - \mathbf 1\{z>y\},
$$

$$
r(x,y,z)
=
x\mathbf 1\{z\le -x\} + y\mathbf 1\{z>y\}.
$$

Let $V_t(p,g,m)$ be the optimal value from round $t$ onward, starting from inventory $p$, current margin $g$, and current mid-price $m$.

Then the exact finite-horizon recursion is

$$
V_t(p,g,m)
=
\mathbb E_{m'}\!\left[
\sup_{(x,y)\in \mathcal A(p,g,m')}
\mathbb E_{z}\!\left[
r(x,y,z)
+
V_{t+1}\bigl(p+q(x,y,z),\, g + (m'-m)p + r(x,y,z),\, m'\bigr)
\right]
\right],
$$

with terminal condition

$$
V_{T+1}(p,g,m) = g.
$$

Here $\mathcal A(p,g,m')$ is the set of relative quotes $(x,y)$ that keep the next state feasible:

$$
\mathcal A(p,g,m')
=
\Bigl\{
(x,y)\ge 0 :
\frac{|p+q(x,y,z)|}{g + (m'-m)p + r(x,y,z)} \le C
\text{ for every possible outcome } z
\Bigr\}.
$$

This is the exact solution of the hard-constrained version.

## 9. A Simpler Surrogate: Fixed Inventory Cap

The ratio constraint is continuous-state because $g_t$ changes over time.

A cleaner surrogate is to replace it with a fixed inventory cap

$$
|p_t| \le M.
$$

Under the same martingale reduction, the state becomes just the inventory level $p_t$.

If the relative valuation $z_t$ is i.i.d. with CDF $F$, then the known-model Bellman equation becomes

$$
V_t(p)
=
\sup_{(x,y)\in \mathcal A_M(p)}
\Bigl[
xF(-x)
+
y\bigl(1-F(y)\bigr)
+
F(-x)V_{t+1}(p+1)
+
\bigl(F(y)-F(-x)\bigr)V_{t+1}(p)
+
\bigl(1-F(y)\bigr)V_{t+1}(p-1)
\Bigr],
$$

where

$$
\mathcal A_M(p)
=
\{(x,y)\ge 0 : p+1\le M \text{ if a buy occurs, and } p-1\ge -M \text{ if a sell occurs}\}.
$$

This is the clean stateful analogue of `latex/colt.tex`: same reward structure, but now the action affects the next state through inventory.

## 10. Final Takeaway

The futures section in `latex/more.tex` contains two different problems.

### Risk-neutral problem

If the mid-price is a martingale and we only maximize expected cumulative margin, then futures trading lies inside a restricted subclass of the `M3` setting.

After passing to relative coordinates, it has the same reward form as in `latex/colt.tex`, and therefore the same $T^{2/3}$ regret upper bounds apply.

If the mid-price is not a martingale, the same reduction still applies to the spread-capture term, but the total-margin objective acquires the extra directional term

$$
\sum_{t=1}^T \mu_t p_{t-1},
\qquad
\mu_t = \mathbb E[m_t-m_{t-1}\mid \mathcal F_{t-1}],
$$

so the problem becomes stateful unless that drift term is negligible.

### Leverage-constrained problem

If we impose

$$
\frac{|p_t|}{g_t} \le C,
$$

then the problem is genuinely stateful.

The right formulation is not regret against the best fixed bid-ask pair. The right formulation is a control problem over the state $(p_t,g_t)$, or equivalently an online MDP / replenishable-knapsack problem.

So the clean answer to the futures draft is:

- `colt.tex` already solves the unconstrained expected-margin problem;
- the constraint turns the problem into a Bellman-control problem, and the exact recursion is the one above.

## References

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari, [*Online Learning under Delayed Feedback*](https://proceedings.mlr.press/v28/joulani13.html), ICML 2013.
  This is the foundational delayed-feedback reduction paper relevant whenever one treats a delayed market-making model as a non-delayed learner wrapped by a delay-handling meta-algorithm.

- Tiancheng Jin, Tal Lancewicki, Haipeng Luo, Yishay Mansour, Aviv Rosenberg, [*Near-Optimal Regret for Adversarial MDP with Delayed Bandit Feedback*](https://proceedings.neurips.cc/paper_files/paper/2022/hash/d850b7e0cdc7f1c0820c6ad85405ae94-Abstract-Conference.html), NeurIPS 2022.
  This is the closest delayed-feedback reference once the futures model is treated as a genuinely stateful control problem rather than a static market-making problem.
