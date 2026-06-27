# Delayed Market Making: Tail Characterization and Regret Rates

We need solve the problem described in `latex/delays.tex`.

Protocol:

- At step `t`, the market reveals `P_t in [0,1]`.
- The learner picks a quote `a_t in [0,1]`.
- For all `t' < t`, if `a_{t'} < P_t`, then quote `a_{t'}` trades and earns reward `a_{t'}`.

For a quote `a` posted at time `t`, define

```tex
\tau_t(a) := \min \{s > 0 : P_{t+s} > a\}.
```

The reward from posting quote `a` at time `t` over horizon `T` is

```tex
r_t(a) = a \mathbf 1\{\tau_t(a) \le T-t\}.
```

The regret is

```tex
R(T)
=
\max_{a \in [0,1]} \mathbb E\left[\sum_{t=1}^T r_t(a)\right]
-
\mathbb E\left[\sum_{t=1}^T r_t(a_t)\right].
```

The current conjectured tail condition is

```tex
\beta(h)
:=
\sup_t \sup_a
\operatorname*{ess\,sup}_{P_1,\dots,P_t}
\Pr\bigl[h < \tau_t(a) < \infty \mid P_1,\dots,P_t\bigr],
```

with assumption $\lim_{h\to\infty}\beta(h)=0$.

Goals:

1. Find a necessary and sufficient condition for when sublinear regret is possible.
2. Then give lower and upper bounds on achievable regret.
3. Ideally make the lower and upper bounds match, at least up to logarithmic factors if exact matching is impossible.
4. Be careful about the quantifiers: stochastic/adaptive/adversarial process for `P_t`, learner randomization, conditional histories, horizon dependence, and whether the process may depend on `T`.
5. Existing `latex/delays.tex` already contains a plausible sufficient direction using truncation:

```tex
R(T) \lesssim \sqrt{T H \log K} + T/K + T \beta(H).
```

Investigate whether the stated tail assumption is truly necessary, or whether there is a weaker characterization such as an average/tail-at-relevant-actions condition, horizon-wise effective delay condition, tightness of the essential supremum, or a condition involving the induced reward process rather than raw hitting delays.

Desired output:

- A candidate theorem statement with assumptions and quantifiers.
- A proof sketch for the upper bound.
- A proof sketch or counterexample for the lower/necessity direction.
- Explicit rate formulas in terms of the tail profile when possible.
- Clear notes on any gaps and what should be verified next.
