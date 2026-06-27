## Summary

The rare-history construction works after one small formal repair: encode the revealed symbol $s_N$ as a distinct price atom $x_N\in(0,1/4)$ at time 1. Then the infinite-process raw essential-sup tail satisfies $\beta(h)=1$ for every finite $h$, while the value-weighted truncation loss is uniformly $O(1/H)$, and the total fixed-comparator value is uniformly bounded. This is a clean counterexample to any necessity proof based on raw essential-sup hitting tails.

## Concrete Progress

Take $N\in\{1,2,\ldots\}$ with
$$
\Pr(N=n)=p_n=3\cdot 4^{-n}.
$$
Let $L_n=2^n$, choose distinct $x_n\in(0,1/4)$, e.g. $x_n=2^{-(n+2)}$, and define one infinite exogenous price process:
$$
P_1=x_N,\qquad
P_2=\cdots=P_{L_N+1}=0,\qquad
P_{L_N+2}=1,
$$
with $P_t=0$ thereafter. Write
$$
S_n=L_n+2=2^n+2
$$
for the spike time on atom $N=n$.

For every $a<1$, every quote before the spike trades at the spike; $a=1$ never trades because the rule is strict, $P>a$. Thus for horizon $T$,
$$
\sup_{a\in[0,1]}\mathbb E\sum_{t\le T}r_t(a)
=
\sum_{n:S_n\le T}p_n(S_n-1),
$$
where the supremum is approached by $a\uparrow1$. Hence
$$
\sup_T\sup_a \mathbb E\sum_{t\le T}r_t(a)
\le
\sum_{n\ge1}3\cdot4^{-n}(2^n+1)
=
4.
$$
So the zero-quote learner has regret at most $4$ for every horizon.

## Claims Or Lemmas

**Lemma 1: raw $\beta$ is maximally bad.**  
For every finite $h$, $\beta(h)=1$.

Proof: condition on the positive-probability atom $P_1=x_n$. At $t=1$, quote $a=1/2$. If $2^n+1>h$, then
$$
\tau_1(1/2)=2^n+1
$$
with conditional probability 1. Such $n$ exists for every $h$. Since these are positive-probability atoms, the essential supremum over histories is 1.

**Lemma 2: worst-action truncation loss is $O(1/H)$, uniformly in $T$.**  
For integer $H\ge1$,
$$
\Delta_T(H)
=
\sup_a\sum_{t\le T}\mathbb E[r_t(a)-r_t^H(a)]
\le
\sum_{n\ge1}p_n(2^n+1-H)_+
=
O(1/H).
$$
Indeed, if $H\in[2^m,2^{m+1})$, then
$$
\sum_{n\ge m}3\cdot4^{-n}(2^n+1)
\lesssim
\sum_{n\ge m}2^{-n}
\lesssim
2^{-m}
\lesssim
1/H.
$$

The same construction also gives $\delta_T(H)\le\Delta_T(H)=O(1/H)$. In fact, with suprema rather than maxima, the two truncation gaps coincide here.

## Proof Attempts

The key accounting is simple. On atom $N=n$, a quote at time $t<S_n$ has delay $S_n-t$. Its reward is lost by $H$-truncation exactly when
$$
S_n-t>H.
$$
Thus the number of lost quotes is
$$
(S_n-H-1)_+=(2^n+1-H)_+.
$$
Multiplying by $p_n=3\cdot4^{-n}$ gives contribution roughly
$$
4^{-n}(2^n-H)_+\le 2^{-n},
$$
and summing over $2^n\gtrsim H$ yields $O(1/H)$.

## Gaps And Risks

The original “symbol” language must be formalized. If observations are only prices in $[0,1]$, use the atom $P_1=x_N$; if extra public side information is allowed, the construction is even cleaner.

The bounded-regret statement is in expectation under this singleton exogenous law. Pathwise regret on rare atoms $N=n$ can be large, of order $2^n$. That is not a bug for the stated expected-regret model, but it would not give a high-probability or adversarial-path guarantee.

For finite-horizon versions of $\beta$, one must say this is an infinite-process raw-tail counterexample. Any finite horizon has trivial cutoff once $h\ge T$.

## Counterexamples Or Obstructions

No fatal obstruction found. The construction does exactly what idea_02 claims, provided the revealed symbol is encoded as a legitimate price atom or explicitly allowed as public side information.

It also improves on the tiny-price obstruction in one respect: the delayed spike has value 1, so the failure of raw $\beta$ is due to rare histories, not tiny payoffs.

## Sources Consulted

Project-local files only: `problem.md`, `working_notes/canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `iteration_summaries.md`, and `iterations/iter_007/idea_02/idea.md`.

No external web sources consulted.

## Recommended Next Steps

Add this as a formal “rare-history beta separation” counterexample. State it as:
$$
\beta(h)\equiv1,\qquad
\sup_T V_T\le4,\qquad
\sup_T\Delta_T(H)=O(1/H).
$$

This should be used only to refute raw essential-sup necessity. It does not refute value-weighted truncation sufficiency, and it does not provide a minimax lower-bound construction for unknown classes.