## Summary

Nested windows give a better target than the generic heterogeneous-delay experts lemma, but they do not by themselves solve adaptive truncation.

The useful reformulation is: choose only a quote $b$, not an arm $(H,b)$, and seek one quote sequence that is competitive for nested truncated games up to a charge proportional to the extra value in longer windows. A too-strong simultaneous regret guarantee for every $H$ is false because different windows can favor different quotes. The right possible oracle is more like
$$
V^H-\mathbb E L^H(A)
\le B(H)+c\,(V^T-V^H),
$$

which would imply the desired adaptive market bound up to a constant factor on $\delta_T(H)$.

## Concrete Progress

Let $G$ be a finite quote grid and let dyadic windows be
$$
0=H_0 < H_1 < \cdots < H_M=T.
$$

Define
$$
g_t^m(b)=r_t^{H_m}(b),
\qquad
z_t^m(b)=g_t^m(b)-g_t^{m-1}(b).
$$

Then
$$
z_t^m(b)=b\,\mathbf 1\{H_{m-1}<\tau_t(b)\le H_m\},
$$

so for fixed $(t,b)$, the increments are nonnegative and disjoint across $m$, and
$$
g_t^m(b)=\sum_{j\le m}z_t^j(b).
$$

The increment $z_t^m(b)$ is revealed after delay at most $H_m$. This is the precise nested-chain structure missing from arbitrary heterogeneous-delay experts.

A cleaner adaptive-truncation target is:

If an algorithm choosing quotes $a_t\in G$ satisfies, for every $m$,
$$
V_m^G-\mathbb E\sum_t g_t^m(a_t)
\le
B_m+c\,(V_M^G-V_m^G),
$$

where
$$
V_m^G=\max_{b\in G}\sum_t g_t^m(b),
$$

then the true market regret obeys
$$
R_T^P
\le
O(T/K)+\min_m\{B_m+(1+c)\delta_T^P(H_m)\}.
$$

So it is enough to prove a nested-window quote-learning oracle with
$$
B_m\approx \sqrt{T(H_m+1)\log(KM)}.
$$

This avoids treating $(H,b)$ as distinct action arms and uses the fact that $H$ is only an analysis window.

## Claims Or Lemmas

**Lemma 1: Increment decomposition.**  
The dyadic increment representation above is valid pathwise. Each $z_t^m(b)\in[0,1]$, is nonnegative, is revealed by time $t+H_m$, and sums to $r_t^{H_m}(b)$.

Status: proved.

**Lemma 2: Nested oracle implies adaptive truncation.**  
If the displayed oracle inequality holds for all dyadic $H_m$, then
$$
R_T^P
\le
O(T/K)+\min_m\{B_m+(1+c)\delta_T^P(H_m)\}.
$$

Status: proved as a reduction.

**Claim 3: Simultaneous no-regret for every $H_m$ without the $V_M^G-V_m^G$ charge is too strong.**  
Different windows can favor different quotes. A learner cannot generally have low regret in all truncated games at once.

Status: obstruction, not a full impossibility theorem for the relaxed oracle.

## Proof Attempts

One promising algorithmic route is value-improvement promotion.

Run fixed-$H_m$ Hedge learners in the background. Promote from $H_m$ to $H_{m+1}$ only when the observed mature value increment
$$
\widehat V_{m+1}(t)-\widehat V_m(t)
$$

exceeds a threshold comparable to the current statistical/delay budget. The hope is to charge promotions to telescoping value increments
$$
V_M^G-V_m^G=\sum_{j=m}^{M-1}(V_{j+1}^G-V_j^G),
$$

which is controlled by the truncation gap.

This is more defensible than triggering on raw late bonuses, because a quote can have large late bonus while still not improving the best truncated comparator value.

A second route is event-driven Hedge over quotes using all observed hits as soon as they occur. For any fixed $H$, the $H$-truncated rewards older than $H$ are known, so the comparator’s $H$-lag is controlled. The missing proof is that extra longer-window updates for other quotes only hurt by an amount chargeable to $V^T-V^H$.

## Gaps And Risks

The value-increment process $V_{m+1}(t)-V_m(t)$ need not be monotone in $t$. A transient long-window quote can look best early and then be overtaken later, so irreversible promotion can overpay. Any promotion algorithm likely needs demotion, epochs, or penalized model selection rather than one-way growth.

Fixed layer-weight FTRL over increments seems problematic: if slow layers are underweighted, the algorithm misses worlds where long delays matter; if all layers get full weight, the proof appears to revert to max-delay behavior.

Raw bonus monitoring is unsafe. Large late mass for a bad-base quote need not imply $V_{m+1}-V_m$ is large.

## Counterexamples Or Obstructions

A two-quote nested abstraction already blocks naive simultaneous regret. Short window: quote $b_1$ is best. Long window: quote $b_2$ receives late bonuses and becomes best. No single quote sequence is low-regret for both games unless the regret to the short game is allowed to be charged to the long-window value improvement.

This does not refute the adaptive market goal, because that value improvement is exactly what $\delta_T(H)$ is meant to pay for.

## Sources Consulted

No external web sources consulted.

Local sources read: `problem.md`, all requested `working_notes/*.md`, assigned `iterations/iter_014/idea_02/idea.md`, plus the iteration 13 adaptive-truncation explorer and critique.

## Recommended Next Steps

1. Formalize the nested oracle inequality above as the replacement target for generic heterogeneous-delay experts.

2. Test event-driven Hedge in the two-quote, two-window case and try to prove the relaxed bound with a $V^T-V^H$ charge.

3. Develop a penalized window-selection algorithm based on observed value increments, not raw late bonuses.

4. If the nested oracle fails, look for an explicit two-window market price path where any algorithm must overpay relative to $\delta(H)+\sqrt{TH}$.