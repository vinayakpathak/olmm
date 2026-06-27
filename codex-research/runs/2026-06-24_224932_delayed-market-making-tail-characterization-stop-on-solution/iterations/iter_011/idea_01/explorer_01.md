## Summary

The assigned idea survives the counterexample search with one important modeling caveat.

A clean tail-profile no-go pair can be built by adding a payoff-harmless first public price. In the hidden class, that first price is common. In the labeled class, it reveals the world. Since rewards for quote $a_t$ depend only on future prices $P_{t+1:T}$, changing $P_1$ changes the learner's information at the first decision but does not change any per-world reward, delay, $\beta$, $\Delta$, or $\delta$ calculation for decisions $t\ge1$.

Thus two classes can have identical per-world tail/truncation profiles while having minimax values differing by $\Omega(qD)$: hidden has regret at least $qD/8$, labeled has zero grid regret and zero continuum regret up to attainment conventions.

## Concrete Progress

Fix $D\ge1$, horizon $T=D+1$, and $q\in(0,1]$. Let
$$
Y_L\sim (1-q)\delta_0+q\,{\rm Unif}[1/2,5/8],
\qquad
Y_H\sim (1-q)\delta_0+q\,{\rm Unif}[3/4,7/8].
$$

Use two classes over worlds $\theta\in\{L,H\}$.

Hidden class:
$$
P_1=c,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta,
$$
with the same $c$ in both worlds.

Labeled class:
$$
P_1=\ell_\theta,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta,
$$
where $\ell_L\ne \ell_H$, e.g. $\ell_L=1/8,\ell_H=1/4$.

For every world $\theta$, the future process after each decision time $t=1,\dots,D$ is identical in the hidden and labeled versions. Hence all per-world reward and truncation objects are identical.

The difference is informational: in the hidden class, all observations before the terminal reveal are the same across worlds; in the labeled class, the learner knows $\theta$ before choosing $a_1$.

## Claims Or Lemmas

**Lemma 1: per-world profiles match.**  
For each fixed $\theta\in\{L,H\}$, the hidden law and labeled law have identical functions
$$
a\mapsto \mathbb E_\theta r_t(a),\qquad
a\mapsto \mathbb E_\theta r_t^H(a)
$$
for every $t=1,\dots,T$. Therefore they have identical $V_\theta$, $V_\theta^H$, $\Delta_\theta(H)$, and $\delta_\theta(H)$.

For integer $H<D$,
$$
\Delta_L(H)=\delta_L(H)=q(D-H)/2,
\qquad
\Delta_H(H)=\delta_H(H)=3q(D-H)/4.
$$

With absorbing post-horizon prices $P_s=0$ for $s>T$,
$$
\beta_\theta(h)=q\quad\text{for }h<D,
\qquad
\beta_\theta(h)=0\quad\text{for }h\ge D
$$
in both hidden and labeled versions.

**Lemma 2: hidden class has minimax regret $\Omega(qD)$.**  
Before $P_{D+1}$, the hidden worlds are observationally identical. The unscaled revenue-curve values satisfy
$$
\sup_a f_L(a)=1/2,\qquad
\sup_a f_H(a)=3/4,\qquad
\sup_a \frac{f_L(a)+f_H(a)}2=1/2.
$$
Scaling by $q$, the Bayes gap under the uniform prior is $q/8$ per unresolved quote round. Across $D$ quote rounds,
$$
\inf_A\sup_{\theta\in\{L,H\}} R_T^\theta(A)\ge qD/8.
$$

**Lemma 3: labeled class has zero regret.**  
In the labeled class, $P_1=\ell_\theta$ identifies $\theta$ before the first payoff-relevant action. The learner can play the world-optimal quote every round:
$$
a_L=1/2,\qquad a_H=3/4.
$$
This matches the best fixed quote in each world, so the labeled class has minimax regret $0$ on the natural grid containing $\{1/2,3/4\}$, and also in the continuum.

## Proof Attempts

The core proof is short.

For profile matching: $r_t(a)=a\mathbf{1}\{\max_{s>t}P_s>a\}$. The only changed coordinate between hidden and labeled versions is $P_1$, and $P_1$ is never in the future of any legal decision time $t\ge1$. Thus all reward and delay variables for legal quotes are unchanged world by world.

For hidden lower bound: the learner sees the same prefix in both worlds for all $D$ useful decisions, so its action distribution is world-independent before the terminal price. The best Bayes mixture quote has value $q/2$, while the average world-specific comparator value is
$$
\frac{q/2+3q/4}{2}=5q/8.
$$
The per-round Bayes gap is $q/8$, giving $qD/8$.

For labeled zero regret: the first observed price is a side-information code embedded as a public price. Since it is observed before $a_1$ and does not affect payoffs, the learner knows which revenue curve is active and plays its optimizer.

## Gaps And Risks

The main caveat is definitional. The profile match is exact for the protocol as stated, where there is no quote before $P_1$. If someone extends $\tau_t(a)$ to a pre-game quote at $t=0$, then the label price can become a future hit and alter raw delay profiles.

The construction refutes scalar criteria depending only on individual laws' delay/truncation profiles. It does not refute criteria that include observability, posterior predictability, class-level Bayes gaps, or the full joint law of public histories.

If the quote grid omits $1/2$ and $3/4$, labeled regret is not exactly zero but is at most the usual grid discretization error $O(T/K)$. Use a grid containing these two quotes if exact zero is desired.

## Counterexamples Or Obstructions

I did not find a fatal counterexample to the idea under the current protocol.

The strongest obstruction is the initial-label issue: using $P_1$ as a label is payoff-harmless only because quotes begin after $P_1$ is observed. This should be stated explicitly.

A second obstruction is scope: if a proposed “tail profile” includes the learner’s posterior information or the distribution of observable prefixes as a labeled statistical experiment, then hidden and labeled classes are distinguishable. The no-go only targets profiles such as per-world $\beta,\Delta,\delta$ or envelopes derived from them.

## Sources Consulted

No web sources consulted. Local files read: `problem.md`, all requested `working_notes/*.md`, and `iterations/iter_011/idea_01/idea.md`.

## Recommended Next Steps

Formalize this as a proposition:

“Per-world delay/truncation profiles do not characterize unknown-class learnability.”

Use the hidden/labeled pair above, with $D=T-1$ and constant $q$, to get identical profiles but hidden linear regret and labeled zero regret. Add the explicit caveat that the protocol has no pre-$P_1$ quote.