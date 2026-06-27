## Summary

The two-arm target is not settled, but there is a useful proof-strategy reduction. The fast-regret side should be treated as a **solvency constraint**: never take more pending slow exposure than the current observed advantage plus an allowed fast-regret budget can cover. This gives a clean pathwise proof of
$$
A_T\ge -B
$$
for any chosen budget $B$.

The remaining hard part is proving slow capture,
$$
A_T\ge S_T-\tilde O(\sqrt{TD}),
$$
while respecting that solvency constraint. Standard delayed Hedge gives the slow side but pays $\sqrt{TD}$ also against fast, so it is not enough.

## Concrete Progress

For $\Delta_t=s_t-f_t\in[-1,1]$, let $q_t\in[0,1]$ be the slow-play probability and
$$
A_T=\sum_t q_t\Delta_t,\qquad S_T=\sum_t\Delta_t.
$$
Then regrets are exactly
$$
R_F=-A_T,\qquad R_S=S_T-A_T.
$$

At the beginning of round $t$, after observing $\Delta_u$ for $u\le t-D$, define
$$
O_t=\sum_{u\le t-D}q_u\Delta_u,\qquad
P_t=\sum_{t-D<u<t}q_u .
$$
Here $P_t$ is pending slow exposure whose advantage could still be $-1$. If the algorithm enforces
$$
q_t\le B+O_t-P_t,
$$
then after adding $q_t$ the total pending liability is covered by budget plus observed actual advantage. This is the right invariant for the fast comparator.

## Claims Or Lemmas

**Lemma 1: Solvency Implies Fast Safety.**  
If $q_t\le [B+O_t-P_t]_+$ for every $t$, then for every realized sequence $\Delta_{1:T}\in[-1,1]^T$,
$$
A_T\ge -B.
$$

Proof idea: when an old pending term $q_u$ is revealed, $O_t$ changes by $q_u\Delta_u$ and $P_t$ decreases by $q_u$. Since $\Delta_u\ge -1$, the invariant cannot be broken by revelation. New exposure is added only when covered. At the end, unrevealed pending terms can reduce payoff by at most their total exposure.

**Lemma 2: Any Theorem Needs A $D$-Scale Slow Term.**  
If an algorithm has fast regret at most $B$ on the all-$-1$ sequence, then before any slow feedback arrives,
$$
\sum_{t\le D} q_t\le B.
$$
On the all-$+1$ sequence, the same first $D$ decisions imply slow regret at least $D-B$. Thus an $O(\sqrt{TD})$ slow bound is not contradicted, since $D\le \sqrt{TD}$ for $D\le T$, but no proof can hope for a slow term smaller than order $D$.

## Proof Attempts

A promising route is a **safe-clipped delayed expert/coin-betting algorithm**:

1. Run a delayed no-regret proposal $p_t\in[0,1]$ based on observed $\Delta_{\le t-D}$.
2. Maintain solvency capacity $C_t=B+O_t-P_t$.
3. Play
$$
q_t=\min\{p_t,C_t,1\}.
$$

Fast regret follows immediately from Lemma 1 with $B\asymp\sqrt T$. The slow regret would decompose as
$$
S_T-\sum_t q_t\Delta_t
=
\left(S_T-\sum_t p_t\Delta_t\right)
+
\sum_t(p_t-q_t)\Delta_t.
$$
The first term should be controlled by standard delayed OLO/Hedge at $\tilde O(\sqrt{TD})$. The real proof obligation is the clipping term: show that times when the safety constraint prevents following $p_t$ can be charged to previous losses, pending exposure, or future positive feedback, with total $\tilde O(\sqrt{TD})$.

An alternative is a direct **safe delayed coin-betting potential**: treat $B+A$ as wealth, subtract pending liability, and stake only a controlled fraction of safe wealth. This may prove both inequalities in one potential argument and avoid a separate clipping lemma.

## Gaps And Risks

The clipping penalty is currently unproved. It is exactly where the delayed safety/capture tradeoff lives.

A pure solvency-greedy algorithm is not enough: spending the safety budget before there is evidence can lose early negative advantage and then miss later positive advantage. The proof needs both solvency and a no-regret/evidence mechanism.

A two-arm proof would still not automatically imply the many-arm dyadic-window theorem needed for adaptive truncation in the market problem.

## Counterexamples Or Obstructions

No refutation of the desired theorem emerged.

Stress tests any candidate proof must pass:

- all $\Delta_t=-1$: total slow exposure must be $O(\sqrt T)$;
- all $\Delta_t=+1$: missed exposure must be $O(\sqrt{TD})$;
- bait-and-switch: after positive evidence, a hidden length-$D$ negative block can arrive, so high slow exposure must be backed by actual accumulated advantage, not just observed unplayed evidence.

## Sources Consulted

Local files only: `problem.md`, all requested `working_notes/*.md`, and `iterations/iter_015/idea_01/idea.md`. No web sources consulted.

## Recommended Next Steps

Prove Lemma 1 formally first. Then test the safe-clipped delayed Hedge decomposition; either prove the clipping term is $\tilde O(\sqrt{TD})$, or construct a sequence where clipping creates linear slow regret. If that stalls, switch to a direct safe delayed coin-betting potential with pending liabilities.