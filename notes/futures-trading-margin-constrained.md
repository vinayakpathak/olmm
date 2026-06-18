# Futures Trading With Margin Constraint, Martingale Mid, And `M3`-Style Valuation Structure

This note isolates the version of the futures-trading problem that seems most natural after the unconstrained case:

- the public mid-price is observed before quoting,
- the mid-price process is a martingale,
- the private valuations satisfy the same kind of structure used by `M3`,
- the learner must satisfy the margin constraint
  $$
  \frac{|p_t|}{g_t}\le C
  \qquad\text{for all }t.
  $$

The main point is:

1. Without the margin constraint, this is easy: after recentering by the mid, the problem is a special case of `latex/colt.tex`.
2. Adding the margin constraint keeps the fixed-delta benchmark, but turns its value into a stopped, path-dependent quantity.
3. With only a martingale assumption on the mid, the hard pathwise constraint is still not well-posed enough to solve cleanly.
4. The smallest useful strengthening is a bound on one-step mid moves, e.g.
   $$
   |m_t-m_{t-1}|\le \sigma.
   $$
5. Under that strengthening, the problem becomes a stateful stopped-process learning problem, and constrained-MDP / safe-RL tools become relevant even though the comparator is still the best fixed deltas.

## 1. Why The Unconstrained Case Is Easy

Let

$$
x_t := m_t-b_t \ge 0,
\qquad
y_t := a_t-m_t \ge 0,
\qquad
z_t := v_t-m_t.
$$

Then the one-step spread-capture reward is

$$
r_t^{\mathrm{mm}}
=
x_t \mathbf 1\{z_t\le -x_t\}
+
y_t \mathbf 1\{z_t>y_t\}.
$$

This has the same per-round reward form as `latex/colt.tex` after the identification

$$
P_t \equiv 0,
\qquad
B_t=-x_t,
\qquad
A_t=y_t,
\qquad
Z_t=z_t.
$$

If the mid is a martingale, then the expected carry term disappears:

$$
\mathbb E[(m_t-m_{t-1})p_{t-1}\mid \mathcal F_{t-1}] = 0,
$$

so maximizing expected cumulative margin is equivalent to maximizing expected cumulative spread capture.

Therefore, without the margin constraint, the problem inherits the `M3` upper bound.

## 2. Which Valuation Assumptions Matter Here

In this recentered futures problem, the relevant random variable is the relative valuation

$$
z_t = v_t-m_t.
$$

The natural analogues of the `M3` assumptions are:

### `iid` version

The sequence $(z_t)_{t\ge 1}$ is i.i.d.

This is the most promising regime for the constrained problem. After recentering, the old `(iid+iv)` condition from `latex/colt.tex` effectively collapses to this, since the clearing benchmark is the constant process $P_t\equiv 0$.

### `adv+lip` version

For each round $t$, the CDF of $z_t$ is $L$-Lipschitz, but the sequence may otherwise vary adversarially.

This still makes the one-step reward learnable in the unconstrained problem, but once the margin state is added the problem becomes a nonstationary online MDP with partial feedback, which is much harder.

## 3. The Benchmark You Actually Want

The comparator class is not the best state-dependent policy. It is the best **fixed delta pair**

$$
(x,y)\in \mathbb R_+^2
$$

used at every round while the strategy is still alive.

So for every fixed pair $(x,y)$, define the constant-delta strategy $\pi^{x,y}$:

- at each live round, post bid $b_t=m_t-x$ and ask $a_t=m_t+y$;
- stop forever when the margin rule is first violated.

Let

$$
\tau_{x,y}
:=
\inf\left\{
t\le T : \frac{|p_t^{x,y}|}{g_t^{x,y}} > C
\right\},
$$

with the convention $\tau_{x,y}=\infty$ if the constraint is never violated.

Then the natural regret is

$$
R_T^{\mathrm{const}}
:=
\sup_{x,y\ge 0}
\mathbb E\!\left[g^{x,y}_{\tau_{x,y}\wedge T}\right]
-
\mathbb E\!\left[g^{\pi}_{\tau_{\pi}\wedge T}\right],
$$

where $\pi$ is the learner's algorithm and $\tau_\pi$ is its own exit time.

So the benchmark is still static in the sense you intended: a single pair of deltas, reused at every round.

## 4. What The Margin Constraint Actually Changes

The margin rule does **not** make the action set state-dependent in the literal protocol.

While the learner is still alive, it is always allowed to post the same deltas regardless of current position and margin. The only effect of the constraint is that some histories lead to earlier exit than others.

So the real difficulty is not that the comparator must adapt to the state. The difficulty is that the value of a fixed pair $(x,y)$ is now

- path-dependent,
- truncated at a stopping time,
- and sensitive to the inventory/margin trajectory it induces.

The same deltas can be harmless from one state and fatal from another. So the constraint changes the **continuation value**, not the syntactic set of deltas you may announce.

## 5. Martingale Reduction Still Works Up To Exit

Let $\tau$ be any stopping time bounded by $T$. Under the usual integrability assumptions for optional stopping,

$$
\mathbb E\!\left[\sum_{t=1}^{\tau}(m_t-m_{t-1})p_{t-1}\right] = 0
$$

whenever $(m_t)$ is a martingale and $p_{t-1}$ is predictable.

Therefore, up to the exit time,

$$
\mathbb E[g_{\tau}-g_0]
=
\mathbb E\!\left[
\sum_{t=1}^{\tau}
\Bigl(
x_t\mathbf 1\{z_t\le -x_t\}
+
y_t\mathbf 1\{z_t>y_t\}
\Bigr)
\right].
$$

In particular, for a fixed comparator $(x,y)$,

$$
\mathbb E[g^{x,y}_{\tau_{x,y}\wedge T}-g_0]
=
\mathbb E\!\left[
\sum_{t=1}^{\tau_{x,y}\wedge T}
\Bigl(
x\mathbf 1\{z_t\le -x\}
+
y\mathbf 1\{z_t>y\}
\Bigr)
\right].
$$

So the martingale assumption still removes the expected carry term. What survives is a stopped spread-capture problem.

## 6. Why This Is Still Hard Even With A Fixed-Delta Benchmark

Although the comparator class is static, the problem is not a standard static bandit over $(x,y)$.

The reason is that a fixed pair $(x,y)$ is evaluated by running it from the initial state until its own exit time. Its value is not the sum of independent one-step rewards that can be estimated by occasionally trying $(x,y)$ in isolation.

Three things are coupled:

- the sequence of buys/sells/no-trades induced by $(x,y)$,
- the resulting inventory path,
- the resulting margin path and exit time.

So even in the `iid` relative-valuation regime, each fixed pair $(x,y)$ defines a stopped stochastic process rather than a single arm with a fixed mean reward.

This is why the constrained problem is genuinely harder than unconstrained `M3`, even though the benchmark remains the best fixed deltas.

## 7. Why A Martingale Mid Alone Is Still Too Weak

Martingality is enough to remove the expected carry term, but it is not enough to characterize survival.

The exit time $\tau_{x,y}$ depends on the actual path of the mid-price, not just its conditional mean. Two martingale models with the same mean-zero property can have very different one-step tails, and therefore very different ruin probabilities for the same deltas.

So if the goal is a clean regret theorem against the best fixed deltas, then martingale structure alone is probably still too weak.

At minimum, one should expect to need some additional control on one-step moves, such as

$$
|m_t-m_{t-1}| \le \sigma,
$$

or a high-probability tail bound of the same flavor.

## 8. A Useful Conservative Surrogate

If one does assume

$$
|m_t-m_{t-1}| \le \sigma
\qquad\text{for all }t,
$$

then a learner can enforce survival by restricting itself to a conservative sufficient condition.

Indeed, before the next quote is executed, the worst-case mark-to-market loss is at most $\sigma |p_t|$. So a sufficient robust-safe state condition is

$$
g_t \ge \left(\sigma + \frac1C\right)|p_t|.
$$

If the learner is in state $(p,g)$ and posts deltas $(x,y)$, a sufficient condition ensuring that the next state remains robust-safe after a buy or a sell is

$$
g+x \ge \left(\sigma + \frac1C\right)|p+1|,
\qquad
g+y \ge \left(\sigma + \frac1C\right)|p-1|.
$$

This is **not** the benchmark. It is just a convenient conservative restriction on the learner's own exploration if one wants a theorem with zero violations.

## 9. What I Would Try To Prove First

If the goal is to understand the exact benchmark you want, the cleanest first theorem would be something like this.

### Assumptions

- The mid-price process $(m_t)$ is a martingale.
- The one-step increments satisfy $|m_t-m_{t-1}| \le \sigma$ almost surely.
- The relative valuations $z_t=v_t-m_t$ are i.i.d.

### Benchmark

Regret against the best fixed pair of deltas $(x,y)$, evaluated until its own exit time.

### Expected proof shape

1. Recenter by the mid and use optional stopping to remove the expected carry term.
2. Discretize the delta space into a grid.
3. View each grid pair as a constant policy whose value is determined by the stopped inventory/margin process it induces.
4. Use the threshold-feedback structure of `M3` to estimate the buy/sell probabilities of each grid pair.
5. Combine these estimates with a state evolution analysis for the stopped process.

I do **not** know a paper that already proves this theorem. My view is that this is the right first open problem.

If you move from `iid` valuations to the `adv+lip` condition, the problem becomes substantially harder and I would not start there.

## 10. Reading List

Below is the reading list I would use, in the order I would read it.

### A. Core papers you definitely need

1. Nicolò Cesa-Bianchi, Tommaso Cesari, Roberto Colomboni, Luigi Foscari, Vinayak Pathak, [*Market Making without Regret*](https://proceedings.mlr.press/v291/cesa-bianchi25a.html), COLT 2025.

   This is the starting point. Read it for:

   - the `M3` decomposition,
   - the `T^{2/3}` upper bound machinery,
   - why the unconstrained problem is learnable under `(adv+lip)` or `(iid+iv)`.

2. Nicolò Cesa-Bianchi, Tommaso Cesari, Roberto Colomboni, Federico Fusco, Stefano Leonardi, [*The Role of Transparency in Repeated First-Price Auctions with Unknown Valuations*](https://arxiv.org/abs/2307.09478), STOC 2024.

   Read this for the one-sided threshold-feedback primitive. Your constrained futures problem contains this problem locally at each state.

### B. If you pursue the `iid` stateful version

3. Honghao Wei, Xin Liu, Lei Ying, [*Triple-Q: A Model-Free Algorithm for Constrained Reinforcement Learning with Sublinear Regret and Zero Constraint Violation*](https://proceedings.mlr.press/v151/wei22a.html), AISTATS 2022.

   This is a useful reference if you turn the survival issue into a conservative safe-exploration problem. It is not your exact benchmark, but it is one of the cleanest regret papers on learning under hard constraints.

4. Francesco Emanuele Stradi, Anna Lunghi, Matteo Castiglioni, Alberto Marchesi, Nicola Gatti, [*Policy Optimization for CMDPs with Bandit Feedback: Learning Stochastic and Adversarial Constraints*](https://proceedings.mlr.press/v267/stradi25b.html), ICML 2025.

   This is especially relevant because it handles stateful constrained learning with bandit feedback. Your futures problem has more structure than generic bandit feedback, but this is one of the closest broad frameworks.

5. Alon Cohen, Haim Kaplan, Tomer Koren, Yishay Mansour, [*Online Markov Decision Processes with Aggregate Bandit Feedback*](https://proceedings.mlr.press/v134/cohen21a.html), COLT 2021.

   Read this for the general stateful online-learning viewpoint with weak feedback. Your feedback model is different, but conceptually this is the nearest nontrivial online-MDP paper.

### C. If you insist on hard pathwise safety

6. Ming Shi, Yingbin Liang, Ness Shroff, [*A Near-Optimal Algorithm for Safe Reinforcement Learning Under Instantaneous Hard Constraints*](https://proceedings.mlr.press/v202/shi23c.html), ICML 2023.

   This is one of the main references for **instantaneous hard constraints**, which is the right phrase for your margin rule.

7. Amirhossein Roknilamouki, Arnob Ghosh, Ming Shi, Fatemeh Nourzad, Eylem Ekici, Ness Shroff, [*Provably Efficient RL for Linear MDPs under Instantaneous Safety Constraints in Non-Convex Feature Spaces*](https://proceedings.mlr.press/v267/roknilamouki25a.html), ICML 2025.

   This is useful if you want to understand how modern safe-RL papers formulate per-step safety, zero-violation guarantees, and safe action filtering.

### D. If you relax the hard margin rule into a budget

8. Ashwinkumar Badanidiyuru, John Langford, Aleksandrs Slivkins, [*Resourceful Contextual Bandits*](https://proceedings.mlr.press/v35/badanidiyuru14.html), COLT 2014.

   This is the classic bandits-with-knapsacks starting point.

9. Matteo Castiglioni, Andrea Celli, Christian Kroer, [*Online Learning with Knapsacks: the Best of Both Worlds*](https://proceedings.mlr.press/v162/castiglioni22a.html), ICML 2022.

   Read this if you decide that a cumulative or soft margin budget is the right surrogate rather than hard pathwise safety.

### E. Secondary background

10. Travis Dick, Andras Gyorgy, Csaba Szepesvári, [*Online Learning in Markov Decision Processes with Changing Cost Sequences*](https://proceedings.mlr.press/v32/dick14.html), ICML 2014.

   This is an older but still useful online-MDP reference.

## 11. Bottom Line

If you want the cleanest next theorem after unconstrained futures trading, I would not attack the exact formulation

- martingale mid,
- hard pathwise margin constraint,
- continuous state,
- continuous actions,
- arbitrary time-varying valuation environment.

I would attack the following version instead:

- martingale mid,
- bounded one-step mid moves,
- i.i.d. relative valuations $z_t=v_t-m_t$,
- regret against the best fixed pair of deltas, evaluated until its own exit time.

That version is still genuinely new, still clearly motivated by the futures model, and much closer to something one can plausibly solve with the current literature.
