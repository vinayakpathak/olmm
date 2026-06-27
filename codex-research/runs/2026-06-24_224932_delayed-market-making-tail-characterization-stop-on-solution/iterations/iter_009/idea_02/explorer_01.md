## Summary
I found a clean public-exogenous market realization of the abstract finite-subclass/product-closure gap, and it can be made linear in $T$. It still relies on a non-Borel label set, so it is not the “natural” counterexample the idea asks for. The search suggests a real obstruction: in fully identifiable standard-Borel examples, if the optimal-action label is Borel, the full class is easy; if the class is dominated or TV-separable in the payoff-weighted sense, the accepted no-gap theorem also rules out the desired example.

## Concrete Progress
Fix horizon $T=D+1$ and grid
$$
G=\{1/3,2/3\}.
$$
Let $A\subset[0,1]$ be non-Borel. For each $x\in[0,1]$, define a deterministic public-exogenous law:
$$
P_1=x,\qquad P_2=\cdots=P_D=0,
$$
and
$$
P_{D+1}=
\begin{cases}
1,&x\in A,\\
1/2,&x\notin A.
\end{cases}
$$
Only the first $D$ quotes can matter. If $x\in A$, quote $2/3$ is optimal on each early round. If $x\notin A$, quote $1/3$ is optimal.

For every finite subclass $F\subset[0,1]$, a Borel policy can memorize $A\cap F$, so the grid minimax regret on $F$ is $0$.

For the full class, every Borel randomized policy has minimax regret at least $D/6=(T-1)/6$, and randomizing $1/2$-$1/2$ between the two grid quotes attains this. Thus
$$
\sup_{F\Subset\Theta}\mathcal R_G(F)=0
\quad\text{but}\quad
\mathcal R_G(\Theta)=\frac{T-1}{6}.
$$

## Claims Or Lemmas
**Lemma 1: Non-Borel label gap.**  
Under Borel randomized prefix-kernel policies, the construction above has finite-subclass value $0$ and full-class grid minimax value $(T-1)/6$.

**Lemma 2: Identifiable Borel labels do not give this gap.**  
In the same deterministic-identifiable template, if $A$ is Borel, the policy “play $2/3$ on $A$, play $1/3$ off $A$” has zero regret on the full class.

**Lemma 3: Countable identifiable versions do not work.**  
If the observed identifiers form a countable set, every subset of identifiers is Borel. So a countable version of the construction is fully learnable by a Borel policy.

## Proof Attempts
Let $q_t(x)$ be the marginal probability that a Borel randomized policy plays $2/3$ at early round $t$, after observing prefix $(x,0,\ldots,0)$.

For $x\in A$, the grid comparator value is $2D/3$, and the policy reward is
$$
\sum_{t=1}^D \left((1-q_t(x))\frac13+q_t(x)\frac23\right)
=
\frac D3+\frac13\sum_{t=1}^D q_t(x).
$$
So regret is
$$
\frac{D-\sum_t q_t(x)}3.
$$

For $x\notin A$, the comparator value is $D/3$, and quote $2/3$ never trades, so regret is
$$
\frac{\sum_t q_t(x)}3.
$$

If a policy had regret $<D/6$ for every $x$, then with
$$
\bar q(x)=\frac1D\sum_{t=1}^D q_t(x),
$$
we would have $\bar q(x)>1/2$ on $A$ and $\bar q(x)<1/2$ on $A^c$. Since $\bar q$ is Borel, this would make
$$
A=\{x:\bar q(x)>1/2\}
$$
Borel, contradiction. Hence full regret is at least $D/6$. The constant policy $\bar q\equiv1/2$ gives regret exactly $D/6$.

For finite $F$, choose a Borel set $B_F$ agreeing with $A$ on $F$, for instance the finite union of points in $A\cap F$. Playing $2/3$ on $B_F$ and $1/3$ otherwise gives zero regret on $F$.

## Gaps And Risks
This is still a measurability pathology. If policies are allowed to be arbitrary nonmeasurable maps, the gap vanishes. If the admissible policy class is universally measurable rather than Borel, one should choose $A$ outside that policy sigma-field.

I did not find a natural Borel-label counterexample. The evidence points the other way: identifiable Borel labels are easy, countable labels are easy, and dominated or TV-separable reward-measure classes are ruled out by the no-gap theorem already in the notes.

## Counterexamples Or Obstructions
The construction above is a valid market-flavored counterexample to arbitrary infinite-class finite-subclass extension, but not a natural one.

A natural countable “unbounded hidden delay” family gives a different quantifier warning: every fixed finite subclass can be $o(T)$, while the full class is linear by choosing a delay scale $D\approx T$. But this does not create the fixed-$T$ product-closure gap, because the hard two-world subclass at delay $T$ is itself finite.

## Sources Consulted
No external sources. I used the provided run notes, especially the finite-subclass/product-closure obstruction, reward-measure domination no-gap theorem, and existing non-Borel label stress test.