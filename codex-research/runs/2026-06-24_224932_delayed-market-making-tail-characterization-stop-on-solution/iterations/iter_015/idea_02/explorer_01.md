## Summary

Finite search suggests the nested-window oracle is **false for arbitrary nested nonnegative reward layers**, but the strongest obstruction I found is only **partly market-realizable**. A market-realizable two-quote, two-window boundary block gives a sharp local stress test: exact or near-exact long-window optimality can force large short-window regret even when $V_2^G-V_1^G$ is small. However, this construction does **not yet refute** the intended adaptive-truncation rate, because the standard long-window budget $B_2\sim \sqrt{T H_2}$ is too large on a single block, and naive repetition destroys the small-gap property.

## Concrete Progress

Consider two windows $H_1=1$, $H_2=D$, two quotes
$$
G=\{\ell,h\},\qquad h=\ell+d<1,
$$
and the deterministic price path
$$
P_1=0,\quad P_2=\cdots=P_D=\ell+d/2,\quad P_{D+1}=1.
$$

For $t=1,\dots,D$:

- quote $\ell$ gets both short and long reward $\ell$;
- quote $h$ gets long reward $h$ at all $D$ times;
- quote $h$ gets short reward only at $t=D$.

Thus
$$
V_1^G=\ell D,\qquad V_2^G=hD=(\ell+d)D,\qquad V_2^G-V_1^G=dD.
$$

If a policy chooses the high quote on $X$ of the first $D-1$ rounds and chooses high at $t=D$, then
$$
V_2^G-L^2=d(D-1-X),
$$
while
$$
V_1^G-L^1=\ell X-d.
$$

So if the long-window oracle requires $V_2^G-L^2\le B_2$, then
$$
X\ge D-1-\frac{B_2}{d},
$$
and hence
$$
V_1^G-L^1\ge \ell\left(D-1-\frac{B_2}{d}\right)-d.
$$

For example, with $B_2=0$, the short regret is about $\ell D$, while the allowed value-gap charge is only $c\,dD$. Taking $d\ll \ell/c$ violates any constant-$c$ oracle with small $B_1$.

## Claims Or Lemmas

**Lemma candidate: boundary-block obstruction.**  
For the above market-realizable single-block path, any policy satisfying
$$
V_2^G-\mathbb E L^2(A)\le B_2
$$
must satisfy
$$
V_1^G-\mathbb E L^1(A)
\ge
\ell\left(D-1-\frac{B_2}{d}\right)-d.
$$
Therefore an oracle
$$
V_1^G-\mathbb E L^1(A)
\le B_1+c(V_2^G-V_1^G)
$$
fails whenever $B_2\le \eta dD$, $B_1=o(D)$, and $d$ is small relative to $\ell(1-\eta)/c$.

**Claim: arbitrary nested layers are easier to refute.**  
For an abstract nested reward table with actions $L,H$,
$$
g^1(L)=\ell,\quad g^2(L)=\ell,\qquad
g^1(H)=0,\quad g^2(H)=\ell+d
$$
on every round, the same obstruction scales over $T$ rounds. This refutes the oracle for general nested nonnegative increments. But this table is not obviously realizable by one delayed market price path.

## Proof Attempts

I first searched deterministic market paths for a static Pareto obstruction. A naive candidate with many medium prices then one high price made the fixed high quote look bad for the short window, but an adaptive per-time quote sequence could often beat both fixed comparators.

Example:
$$
P=(0,.55,.55,.55,.55,.55,.85,0),\quad G=\{.25,.5,.8\},\quad H_1=1,H_2=4.
$$
Here $V_1=3.0$, $V_2=3.2$, but the per-time sequence quoting $.5$ until just before the high spike and $.8$ immediately before it gets $L^1=L^2=3.3$. So this is not an obstruction.

The boundary-block construction above fixes this by making $h-\ell=d$ tiny. Then the free switch immediately before the high spike is not enough to close the full-window gap; near-full long reward forces many early high quotes, which lose short reward.

## Gaps And Risks

This does **not** refute the intended adaptive truncation rate. In the single-block market construction, $T=D+1$, so a standard long-window budget $B_2\sim \sqrt{T D}$ is order $D$, while the gap $dD\le D$. Thus the long-window budget can simply absorb the full gap.

Naively repeating the block does not preserve the obstruction. When I repeated the construction, the low quote’s $H_2$-window value increased because future medium prices become long-window hits for low quotes before each block. In a sample with $D=8,\ell=.5,d=.02,N=5$, the full-window values became approximately
$$
L^2(\ell)=22,\qquad L^2(h)=20.8,
$$
so the high quote stopped being the long-window comparator.

## Counterexamples Or Obstructions

The main obstruction is to a too-strong oracle that charges short-window regret only to $V_2^G-V_1^G$ while also demanding near-exact long-window performance.

The main obstruction to scaling that counterexample is market-specific: the same medium prices that create short-window value for the low quote also create long-window value for that low quote when the pattern is repeated away from the horizon boundary.

## Sources Consulted

- `problem.md`
- `working_notes/canonical_summary.md`
- `working_notes/claim_ledger.md`
- `working_notes/lemma_bank.md`
- `working_notes/failed_attempts.md`
- `working_notes/counterexamples.md`
- `working_notes/literature_map.md`
- `working_notes/promising_directions.md`
- `working_notes/iteration_summaries.md`
- `iterations/iter_015/idea_02/idea.md`

No web sources used.

## Recommended Next Steps

1. Formalize the boundary-block lemma as a stress test for any proposed nested oracle.
2. Search for a scalable market-realizable version with three quotes or staggered late bonuses.
3. Separately try to prove a positive structural statement: repeated market blocks may force $V_2^G-V_1^G$ to grow because low quotes acquire long-window value.
4. Keep arbitrary nested reward tables separate from market-realizable nested reward tables; the former already gives false positives for impossibility.