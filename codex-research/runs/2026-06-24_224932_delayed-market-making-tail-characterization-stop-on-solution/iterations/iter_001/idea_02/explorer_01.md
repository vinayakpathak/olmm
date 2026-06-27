## Summary

The hidden-terminal construction gives a clean finite-horizon minimax lower bound: if two price processes share a long zero prefix and only differ in a terminal price distribution, then no learner can tune quotes for both before the reveal. This proves an $\Omega(D)$ lower bound over horizon $T=D+1$ for a broad unknown-process class.

It does **not** by itself prove a process-wise necessity theorem for the raw tail condition $\beta(h)\to 0$. The main obstruction is quantifiers: the construction is strongest when the hard process may depend on the horizon or when regret is minimax over a class of possible laws unknown to the learner.

## Concrete Progress

A technically cleaner version avoids the strict-threshold “max not attained” issue by replacing deterministic terminal prices with small continuous terminal intervals.

Let horizon $T=D+1$. For $t\le D$, set $P_t=0$. At $t=D+1$, choose one of two worlds:
$$
Y_L \sim \mathrm{Unif}[1/2,5/8],
\qquad
Y_H \sim \mathrm{Unif}[3/4,7/8].
$$

No learner can distinguish $L$ from $H$ before time $D+1$. For a quote $a$, define
$$
g_i(a)=a\Pr(Y_i>a),
\qquad i\in\{L,H\}.
$$

Then
$$
V_L:=\max_a g_L(a)=1/2,
\qquad
V_H:=\max_a g_H(a)=3/4,
$$

but
$$
\max_a \frac{g_L(a)+g_H(a)}2 = 1/2.
$$

Therefore under the uniform prior over the two worlds, every learner has Bayes regret at least
$$
D\left(\frac{V_L+V_H}{2}-\max_a\frac{g_L(a)+g_H(a)}2\right)
=
D(5/8-1/2)
=
D/8.
$$

By Yao/minimax, for every randomized learner, at least one of the two worlds gives regret $\ge D/8$.

## Claims Or Lemmas

**Lemma 1: Single-block hidden-terminal lower bound.**  
For every learner and every $D$, there exists a price process on horizon $T=D+1$ with $P_1=\cdots=P_D=0$ such that
$$
R(T)\ge D/8.
$$

This is a finite-horizon minimax lower bound over the two terminal-distribution worlds above.

**Lemma 2: Tail-scaled variant.**  
If the terminal reveal occurs with probability $q$, and otherwise no positive terminal price appears, the same argument gives
$$
R(T)\ge qD/8.
$$

For $h<D$, the hard worlds have
$$
\beta(h)\ge q,
$$

so this construction supports a lower-bound term of order $T\beta(H)$ when the delayed tail corresponds to genuinely valuable, indistinguishable rewards.

**Lemma 3: Horizon dependence is essential for the cleanest statement.**  
For fixed $D$, the infinite extension of a single-block process can still satisfy $\beta(h)\to0$, since delays are bounded by $D$. Thus the construction proves a lower bound at horizon $T=D+1$, not an asymptotic process-wise impossibility for that one fixed process.

## Proof Attempts

The core proof is direct.

Before time $D+1$, both worlds generate exactly the same observations: only zeros and no trades. Hence the learner’s quote distribution at each $t\le D$ is identical under $L$ and $H$.

For the interval worlds,
$$
g_L(a)=
\begin{cases}
a, & a\le 1/2,\\
8a(5/8-a), & 1/2<a<5/8,\\
0, & a\ge 5/8,
\end{cases}
$$

and similarly
$$
g_H(a)=
\begin{cases}
a, & a\le 3/4,\\
8a(7/8-a), & 3/4<a<7/8,\\
0, & a\ge 7/8.
\end{cases}
$$

So $g_L$ is maximized at $a=1/2$, $g_H$ at $a=3/4$. A case check gives
$$
\max_a \frac{g_L(a)+g_H(a)}2=1/2.
$$

Since the best fixed comparator gets average value $5/8$ under the two-world prior, the per-early-round Bayes gap is $1/8$, hence total gap $D/8$.

## Gaps And Risks

This is a **class-level** lower bound, not yet a necessary-and-sufficient characterization for one fixed stochastic process.

If the learner is allowed to know the exact law, the lower bound disappears: in world $L$, quote $1/2$; in world $H$, quote $3/4$.

Naive block-splicing with fresh random terminal types does not work for the stated regret definition, because the comparator is $\max_a \mathbb E[\sum_t r_t(a)]$, not $\mathbb E[\max_a \sum_t r_t(a)]$. With iid hidden block types, the best fixed comparator may be exactly the same Bayes action available to the learner.

A fixed infinite deterministic block construction might work only under an adversarial or learner-dependent sequence, or along horizons dominated by a final super-long block. That would need separate quantifier work.

## Counterexamples Or Obstructions

The raw condition $\sup_t\sup_a\operatorname{ess\,sup}\Pr(h<\tau_t(a)<\infty\mid P_{\le t})\to0$ is probably too strong as a process-wise necessity condition.

Example obstruction: arbitrarily long delayed hits at tiny prices $p_m\downarrow0$ can keep $\beta(h)=1$ for all $h$, while the total attainable comparator value may still be $o(T)$. Then sublinear regret can be trivial despite failing the raw tail condition.

Another obstruction: if every long-delayed terminal threshold is known from the process law, long delays alone do not force regret. The lower bound needs **indistinguishability between separated valuable optima**, not merely delayed hitting.

## Sources Consulted

Local files only; no web search.

- `problem.md`
- `working_notes/canonical_summary.md`
- `working_notes/claim_ledger.md`
- `working_notes/lemma_bank.md`
- `working_notes/failed_attempts.md`
- `working_notes/counterexamples.md`
- `working_notes/literature_map.md`
- `working_notes/promising_directions.md`
- `working_notes/iteration_summaries.md`
- `iterations/iter_001/idea_02/idea.md`
- `/Users/vinayakpathak/olmm/latex/delays.tex`

## Recommended Next Steps

Formalize the single-block lemma as a minimax theorem with explicit quantifiers over learner knowledge and horizon-dependent process classes.

Try to derive a lower bound in terms of a refined tail condition: not raw $\beta(h)$, but delayed tail mass attached to actions whose reward curves create separated optima.

Investigate whether the right necessity condition is closer to “no long-delayed indistinguishable valuable alternatives” than to uniform decay of all hitting-delay tails.