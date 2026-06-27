# Counterexamples And Obstructions

## iid uniform prices refute raw beta necessity
Construction: $P_t\stackrel{iid}{\sim}\mathrm{Unif}[0,1]$.
Facts: For $a<1$, $\tau_t(a)$ is geometric with success probability $1-a$, so
$$
\Pr(h<\tau_t(a)<\infty\mid P_{1:t})=a^h.
$$
Thus $\beta(h)=\sup_{a<1}a^h=1$ for every $h$.
Why it matters: If the law is known, playing a maximizer of $G_T(a)=\sum_{L=0}^{T-1}a(1-a^L)$ every round matches the fixed comparator in expectation, giving zero regret despite failed $\beta$.
Status: Valid counterexample to process-wise/law-aware necessity.
Source: solver attempt.

## Arbitrary known finite-horizon exogenous laws refute fixed-law tail necessity
Construction: Any law on $P_{1:T}$ independent of learner actions, revealed to a horizon-aware learner through conditional probabilities.
Facts: The learner can choose a grid maximizer of
$$
g_t(a)=\mathbb E[a\mathbf{1}\{\max_{t<s\le T}P_s>a\}\mid P_{1:t}]
$$
at each time. Downward grid rounding gives regret at most $T/K$, hence $O(1)$ with $K=T$.
Why it matters: This subsumes iid-uniform and terminal-spike singleton examples: no nontrivial raw-delay or truncation-tail condition can be necessary under these quantifiers.
Status: Valid theorem-level obstruction; horizon-aware and non-computational.
Source: iteration 2 solver, idea_01 explorer, and idea_01 critique.

## Strict-threshold nonattainment
Construction: $T=2$, deterministic $P_2=1$.
Facts: For the first quote, $r_1(a)=a\mathbf{1}\{a<1\}$. The supremum over $a\in[0,1]$ is $1$, but no maximizer exists.
Why it matters: Final statements should use $\sup_a$, not $\max_a$, unless extra attainment assumptions are imposed.
Status: Valid stress test.
Source: `iterations/iter_002/idea_01/explorer_01.md` and critique.

## Grid/continuum mismatch in finite-grid identities
Construction: $T=2$, singleton law with deterministic $P_2=3/4$, and quote grid $G=\{0,1/2\}$.
Facts: The grid comparator value is $V^G=1/2$, but the continuum comparator supremum is $3/4$. Thus an exact finite-grid minimax identity using continuum $V$ or a continuum Bayes envelope is off by $1/4$.
Why it matters: Finite-grid theorems must restrict learner actions, comparator, and Bayes predictive envelope to the same grid. Passing to $[0,1]$ requires a separate discretization error.
Status: Valid stress test.
Source: `iterations/iter_004/idea_01/critic_01_on_explorer_01.md`.

## Randomization is necessary for minimax/Bayes identities
Construction: $T=2$, $P_1=0$, grid $G=\{0.5,0.9\}$. Two worlds: in world 0, $P_2=0.6$; in world 1, $P_2=1$.
Facts: The learner cannot distinguish worlds before choosing its only payoff-relevant quote. A deterministic learner choosing $0.5$ has regrets $(0,0.4)$, and choosing $0.9$ has regrets $(0.5,0)$, so deterministic minimax regret is $0.4$. Randomizing with probability $5/9$ on $0.5$ balances regrets at $2/9$.
Why it matters: Least-favorable-prior/minimax equalities must allow randomized policies or mixed kernels.
Status: Valid finite-grid stress test.
Source: `iterations/iter_004/idea_01/critic_01_on_explorer_01.md`.

## Adaptive known-law policies can have negative regret
Construction: $T=2$, grid $G=\{0.5,0.9\}$. Let $P_1\in\{0,1\}$ with probability $1/2$ each; set $P_2=0.6$ if $P_1=0$, and $P_2=1$ if $P_1=1$. The learner knows the law and observes $P_1$ before quoting.
Facts: The best fixed grid quote has value $0.5$. The adaptive known-law learner quotes $0.5$ after $P_1=0$ and $0.9$ after $P_1=1$, receiving expected reward $(0.5+0.9)/2=0.7$. Its regret against the best fixed quote is $-0.2$.
Why it matters: "Sublinear regret" should be stated as an upper-regret/positive-part requirement, not as absolute convergence of a minimax value to zero.
Status: Valid sign-convention stress test.
Source: `iterations/iter_004/idea_01/critic_01_on_explorer_01.md`.

## Known terminal spike refutes necessity of $\Delta$
Construction: Horizon $T$. Let $P_1=\cdots=P_{T-1}=0$, $P_T\sim\mathrm{Unif}[0,1]$, and suppose the learner knows this singleton law.
Facts: For each early quote, expected reward is $a(1-a)$, maximized at $a=1/2$. The learner can quote $1/2$ and get zero regret. For any $H=o(T)$, most early rewards are excluded by truncation, so $\Delta_T(H)\approx (T-H)/4=\Omega(T)$.
Why it matters: Large truncation loss can be harmless when the delayed reward curve is known/predictable.
Status: Valid obstruction to $\Delta$ as a necessary condition.
Source: idea_01 explorer and critique.

## Hidden-terminal minimax lower-bound instance
Construction: Horizon $T=D+1$. Two worlds share $P_1=\cdots=P_D=0$. At terminal time,
$$
Y_L\sim\mathrm{Unif}[1/2,5/8],\qquad
Y_H\sim\mathrm{Unif}[3/4,7/8].
$$
Facts: Before terminal time the learner cannot distinguish worlds. Per early quote $a$, $g_i(a)=a\Pr(Y_i>a)$ has $V_L=1/2$, $V_H=3/4$, while the best Bayes action under a uniform prior has value $1/2$. Bayes gap is $1/8$ per early round.
Why it matters: Shows long delayed rewards can force $\Omega(D)$ regret for a universal/minimax learner over an unknown class.
Status: Valid finite-horizon class-level lower bound; not a fixed-law necessity result.
Source: idea_02 explorer and critique.

## q-scaled hidden-terminal lower-bound atom
Construction: Horizon $T=D+1$. Two worlds share $P_1=\cdots=P_D=0$. At terminal time, world $L$ uses $(1-q)\delta_0+q\,{\rm Unif}[1/2,5/8]$, while world $H$ uses $(1-q)\delta_0+q\,{\rm Unif}[3/4,7/8]$. For infinite-process tail calculations, set $P_s=0$ for $s>T$.
Facts: Every learner has regret at least $qD/8$ on one of the two worlds. With absorbing extension, $\beta(h)=q$ for $h<D$ and $0$ for $h\ge D$. For integer $H<D$,
$$
\Delta_L(H)=\delta_L(H)=q(D-H)/2,\qquad
\Delta_H(H)=\delta_H(H)=3q(D-H)/4.
$$
Why it matters: This is the cleanest quantitative lower-bound atom linking valuable delayed tail mass and indistinguishability.
Status: Valid finite-horizon minimax lower bound. It is not a singleton known-law obstruction, and by itself it does not match power-tail upper rates.
Source: `iterations/iter_003/idea_02/explorer_01.md` and critique.

## One-block power-tail lower-bound weakness
Construction idea: Use the q-scaled atom under a nonincreasing tail envelope $B$ by choosing $q\le B(D)$.
Facts: The resulting lower bound is only $\Omega(D B(D))$. For $B(D)=D^{-\alpha}$, this is $\Omega(D^{1-\alpha})$, sublinear in the wrong exponent and non-growing for $\alpha\ge1$.
Why it matters: Shows the q-scaled atom is not enough for rate matching. Repetition must avoid iid block-splicing collapse and global-type one-reveal learning.
Status: Valid obstruction to a proposed rate-matching route.
Source: `iterations/iter_003/idea_02/explorer_01.md` and critique.

## Rare-history essential-sup separation
Construction: Draw $N\ge1$ with $\Pr(N=n)=3\cdot4^{-n}$. Choose distinct atoms $x_n\in(0,1/4)$, set $L_n=2^n$, and define the infinite public exogenous process
$$
P_1=x_N,\quad P_2=\cdots=P_{L_N+1}=0,\quad P_{L_N+2}=1,\quad P_t=0\text{ thereafter}.
$$
Let $S_n=L_n+2$.
Facts: For every finite $h$, condition on the positive-probability atom $P_1=x_n$ with $2^n+1>h$. At $t=1$, quote $a=1/2$; then $\tau_1(a)=2^n+1$ surely, so the infinite-process raw $\beta(h)=1$. But
$$
V_T=\sup_a\mathbb E\sum_{t\le T}r_t(a)
=\sum_{n:S_n\le T}3\cdot4^{-n}(S_n-1)\le4,
$$
and
$$
\Delta_T(H)=\delta_T(H)
=\sum_{n:S_n\le T}3\cdot4^{-n}(S_n-1-H)_+
\le C/H.
$$
Thus zero quoting has bounded expected regret even though raw essential-sup tails are maximally bad.
Why it matters: This cleanly separates raw essential-sup delay probability from expected value-weighted truncation. The delayed spike has value $1$; the obstruction is rarity of histories, not tiny payoff scale.
Status: Valid expected-regret, singleton-law, infinite-process raw-$\beta$ counterexample. Pathwise regret on rare atoms can be order $2^n$, so this is not a high-probability or adversarial-path result.
Source: `iterations/iter_007/idea_02/explorer_01.md`; `iterations/iter_007/idea_02/critic_01_on_explorer_01.md`.

## Tiny-price long-delay blocks break raw beta without meaningful regret
Construction: Infinite deterministic sequence. For $m\ge1$, let $L_m=2^m$, $p_m=2^{-2m}$, and $S_m=\sum_{j=1}^m(L_j+1)=2^{m+1}-2+m$. Block $m$ has zeros at times $S_{m-1}+1,\ldots,S_m-1$, then spike $P_{S_m}=p_m$.
Facts: For every finite $h$, choose $m$ with $L_m>h$, start at the first zero of block $m$, and quote $a=p_m/2$. The first future price above $a$ is the spike after $L_m$ steps, so the infinite-process raw $\beta(h)=1$. But for any horizon $T$ and quote $a$, let $M=\max\{m:S_m\le T,\ p_m>a\}$, if nonempty. Since $p_m$ decreases strictly, only quote times $t<S_M$ can trade by horizon $T$, hence
$$
\sum_{t\le T}r_t(a)=a(S_M-1)<p_M(S_M-1)
=2^{-2M}(2^{M+1}+M-3)\le 1/2.
$$
If no such $M$ exists, the reward is zero. Thus $\sup_T\sup_a\sum_{t\le T}r_t(a)\le1/2$, and the zero-quote learner has regret at most $1/2$ for every horizon.
Iteration 7 strengthening: for integer $H$,
$$
\sup_T\Delta_T(H)\le C/H.
$$
For $a=0$ the loss is zero. For a fixed quote $a>0$, let $M=\max\{m:p_m>a\}$. Lost $H$-truncated reward is at most
$$
a\sum_{j\le M}(L_j+1-H)_+
\le
p_M\sum_{j\le M:L_j+1>H}(L_j+1)
\le C\,4^{-M}2^M\le C/H,
$$
with zero loss if $L_M+1\le H$.
Why it matters: Raw hitting-delay probability ignores reward magnitude. Long delays can be certain only at quotes whose payoff scale is too small to create meaningful regret, and in fact value-weighted truncation is small.
Status: Valid infinite-process/raw-$\beta$ counterexample. For finite-horizon $\beta_T$, state the result as failure of any uniform raw-tail necessity rather than $\beta_T(h)=1$ for all $h$.
Source: `iterations/iter_006/solver_attempt.md`; `iterations/iter_006/idea_02/explorer_01.md`; `iterations/iter_006/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_007/solver_attempt.md`; synthesis.

## Infinite-class compactness/measurability gap
Construction: Abstractly, take $\Theta=\mathbb N$, $V_\theta=1$, and attainable reward vectors
$$
C=\{c\in[0,1]^\mathbb N:c\text{ has finite support}\}.
$$
Every finite subclass can be controlled with value $0$, but the full value is $1$.
Market-flavored stress test: Let $A\subset[0,1]$ be non-Borel. With $T=2$, $G=\{1/3,2/3\}$, world $x$ has $P_1=x$ and $P_2=1$ if $x\in A$, $P_2=1/2$ otherwise. Finite subclasses can be memorized by Borel policies, but a full-class Borel policy with regret $<1/6$ would need to separate $A$ by a Borel set.
Iteration 9 linear amplification: For $T=D+1$, set $P_1=x$, $P_2=\cdots=P_D=0$, and $P_{D+1}=1$ on $A$, $P_{D+1}=1/2$ off $A$. On $G=\{1/3,2/3\}$, every finite subclass still has value $0$, but the full Borel-policy value is $D/6=(T-1)/6$. If $q_t(x)$ is the Borel probability of quoting $2/3$ on early round $t$, then
$$
R_A(x)=\frac{D-\sum_t q_t(x)}3,\qquad
R_{A^c}(x)=\frac{\sum_t q_t(x)}3.
$$
Regret $<D/6$ everywhere would make $A=\{x:D^{-1}\sum_tq_t(x)>1/2\}$ Borel, while $q_t\equiv1/2$ attains $D/6$.
Why it matters: The finite-subclass Bayes modulus is not automatically a full infinite-class characterization. It characterizes the product-closure relaxation unless the attainable reward set is product closed.
Status: Valid as a compactness/measurability obstruction. The market-flavored example is pathological and depends on Borel-policy restrictions; it disappears if arbitrary nonmeasurable policies are allowed or if $A$ is Borel.
Iteration 8 refinement: payoff-weighted reward-measure domination fails in the non-Borel label example because the relevant class contains uncountably many singular Dirac-type prefix/reward measures. Thus it remains a stress test for any unrestricted infinite-class theorem. Iteration 9 found no natural Borel-label version; identifiable Borel and countable-label variants are easy by direct decoding.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_009/idea_02/explorer_01.md`; `iterations/iter_009/idea_02/critic_01_on_explorer_01.md`.

## Weak/Feller continuity is not a no-gap condition by itself
Construction/stress test: Let $\Theta=[0,1]$ and take deterministic prefixes $P_1=\theta$. Such classes can be weakly compact and Feller-continuous while the prefix laws $\{\delta_\theta\}$ are mutually singular and not total-variation separable.
Facts: In the simple identifiable example $T=2$, $P_1=\theta$, $P_2=1$, the class is easy for a Borel policy because the parameter is publicly revealed. However, finite interpolation can product-converge to arbitrary functions of $\theta$, including non-Borel ones, so product-closedness of the Borel attainable reward set is not implied by weak/Feller continuity alone.
Why it matters: Failure of product closedness and high regret are distinct. Identifiability may solve some nondominated classes, but it is a different mechanism from compactness and does not justify a general no-gap theorem.
Status: Valid stress test against weak-continuity-only no-gap claims; not a lower-bound example by itself.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`.

## Action-dependent prices obstruct full-information reduction
Construction idea: Let future prices depend on the learner's current or future quotes.
Facts: Then counterfactual rewards $r_t^H(b)$ for unplayed grid quotes may not be determined by the realized future price path, or may correspond to a different path under a comparator policy.
Why it matters: The upper-bound theorem is not valid in this model without new causal definitions.
Status: Model obstruction, not a numeric counterexample yet.
Source: idea_01 critique.

## Candidate anytime obstruction via two deadlines
Construction idea: Deterministic known infinite sequence with super-growing blocks: $N_m$ zeros, then price $1/2$, then $N_m$ zeros, then price $1$, with $N_m$ dominating all previous lengths.
Facts sketched by critic: For the first $N_m$ quotes of such a pair, the benchmark by the early deadline is about $N_m/2$, while the benchmark by the later deadline is about $N_m$. For any horizon-free quotes $a_i$,
$$
A=N_m/2-\sum_i a_i\mathbf{1}\{a_i<1/2\},\qquad
B=N_m-\sum_i a_i
$$
satisfy $A+B\ge N_m/2$, so one of the two deadlines has regret at least $N_m/4$ from that block.
Why it matters: The known-law oracle lemma depends on knowing the evaluation horizon. A single anytime policy may not inherit the $O(1)$ guarantee.
Status: Plausible stress test; needs a fully formal infinite-process and horizon-subsequence proof.
Source: `iterations/iter_002/idea_01/critic_01_on_explorer_01.md`.

## Completed-kernel null-set stress test
Construction idea: Let a completed-measurable finite-grid kernel differ from all Borel versions on a $\lambda_t$-null non-Borel set that some prefix law $P^\theta_{1:t}$ may charge. If only payoff-weighted measures $\mu^\theta_{t,a}$ are dominated by $\lambda_t$, then the prefix law itself need not ignore that set.
Facts: Borelizing the kernel can change the policy's behavior, future internal state, or pathwise feedback on such prefix histories. Under public exogenous prices and additive expected rewards, this is harmless for the no-gap theorem only because the reward coordinates use
$$
\int q_{t,a}\,d\mu^\theta_{t,a},
$$
and $\mu^\theta_{t,a}\ll\lambda_t$ makes all changes on $\lambda_t$-null sets invisible to expected payoff.
Why it matters: The iteration 10 Borel implementation lemma should be stated as reward-vector preservation, not behavioral equivalence. It also explains why exogeneity and additive rewards are essential: if actions affected future prices or private feedback carried extra information, changing behavior on a prefix-law-positive null set could matter.
Status: Valid stress test for theorem wording; not a counterexample to payoff-weighted domination because the theorem only needs payoff-coordinate preservation.
Iteration 16 status: This remains the key stress test for upgrading from completed $L^\infty$ prefix kernels to original Borel policies. The upgrade can only claim reward-coordinate equivalence after proving both inclusions $C_{\rm Borel}=C_{L^\infty}$; it must not claim behavioral or pathwise equivalence.
Source: `iterations/iter_010/idea_02/explorer_01.md`; `iterations/iter_010/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_010/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_016/idea_02/explorer_01.md`; `iterations/iter_016/idea_02/critic_01_on_explorer_01.md`.

## Policy-alignment assumption stress tests
Construction ideas:
- Law-by-law policy versions: each singleton law may choose a convenient a.s. representative, but the representatives need not assemble into one common Borel policy on the full public history space.
- Private side signal: two worlds have identical public price laws, but a private learner signal reveals $\theta$ before decisions.
- Law-correlated randomization: the learner's private seed is correlated with the active law.
- Nonadditive/action-dependent market: current quotes affect future prices or rewards include inventory, budget, queue priority, or other cross-time state.

Facts: In these variants, the one-time law-independent public-prefix marginal $q_t(P_{1:t})$ may not exist or may not preserve expected reward coordinates. With a private side signal or law-correlated seed, action marginals conditional on $P_{1:t}$ can depend on $\theta$. With action-dependent prices or nonadditive rewards, a marginal at time $t$ is insufficient because actions alter future paths or rewards.

Why it matters: The iteration 12 forward alignment lemma is valid only for a common Borel finite-grid public-exogenous seed/state policy model with independent private randomness, full public observation, reconstructible feedback, and additive quote rewards.

Status: Model-boundary obstructions, not counterexamples to the stated finite-grid public-exogenous alignment lemma.
Source: `iterations/iter_012/idea_01/explorer_01.md`; `iterations/iter_012/idea_01/critic_01_on_explorer_01.md`.

## Hidden/labeled tail-profile no-go pair
Construction: Fix $T=D+1$, $q\in(0,1]$, and two terminal laws
$$
Y_L\sim(1-q)\delta_0+q\,{\rm Unif}[1/2,5/8],\qquad
Y_H\sim(1-q)\delta_0+q\,{\rm Unif}[3/4,7/8].
$$
Hidden class:
$$
P_1=c,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta.
$$
Labeled class:
$$
P_1=\ell_\theta,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta,\qquad \ell_L\ne\ell_H.
$$
Facts: Under the stated protocol there is no quote before $P_1$, and a quote at time $t$ trades only against future prices $P_s$, $s>t$. Thus changing $P_1$ to a label does not affect any legal quote reward or delay in a fixed world. The hidden and labeled versions have identical per-world reward curves, comparator values, $\beta$, $\Delta$, and $\delta$. With absorbing prices after $T$, $\beta_\theta(h)=q$ for $h<D$ and $0$ for $h\ge D$; for integer $0\le H<D$,
$$
\Delta_L(H)=\delta_L(H)=q(D-H)/2,\qquad
\Delta_H(H)=\delta_H(H)=3q(D-H)/4.
$$
However, the hidden class inherits the q-scaled hidden-terminal lower bound $qD/8$, while in the labeled class the learner observes $\theta$ before $a_1$ and can play the active world's optimum. Continuum regret is zero; grid regret is zero if the grid contains $1/2$ and $3/4$, and otherwise only has the usual discretization loss.
Why it matters: This refutes any unknown-class learnability criterion based only on individual laws' scalar delay/truncation profiles or their envelopes. The missing ingredient is public observability/predictability of the active reward curve.
Status: Valid under public exogenous prices, no pre-$P_1$ quote, and no same-period trade. It does not refute criteria involving posterior information, Bayes gaps, public-prefix laws, or the full statistical experiment.
Source: `iterations/iter_011/solver_attempt.md`; `iterations/iter_011/idea_01/explorer_01.md`; `iterations/iter_011/idea_01/critic_01_on_explorer_01.md`.

## Same-level repeated atoms break the intended tail envelope
Construction idea: Repeat $N$ length-$D$ q-scaled hidden-terminal blocks at the same quote levels. Each block has a terminal spike event with probability $q$, and old quotes remain live after their own block.
Facts: A quote posted in the first block at a threshold below the spike level, conditional on not being hit in its own terminal event, can still be hit by any later block's spike. Thus
$$
\Pr(D<\tau<\infty)
\approx
(1-q)(1-(1-q)^{N-1}),
$$
which is near one when $Nq\gg1$, not order $q$.
Why it matters: A lower-bound construction meant to obey a power envelope $B(D)\approx q$ cannot simply paste q-scaled atoms at the same quote levels. Persistent quotes are a core feature of the protocol and must be accounted for before claiming any tail profile.
Status: Valid stress test against naive repeated-block lower bounds; not a complete lower-bound counterexample.
Source: `iterations/iter_013/idea_01/critic_01_on_explorer_01.md`.

## Independent hidden bits collapse against a single fixed comparator
Construction idea: In an ideal additive two-quote block model, each block $j$ has independent sign $\sigma_j\in\{\pm1\}$ and contributes relative advantage $w_j\sigma_j$ to one of the two quotes.
Facts: The best fixed quote's expected advantage is
$$
\mathbb E\left|\sum_j w_j\sigma_j\right|
\le
\left(\sum_jw_j^2\right)^{1/2}.
$$
Equal block weights therefore give $\Theta(w\sqrt N)$, not $\Theta(Nw)$.
Why it matters: Independent hidden block types avoid one-reveal learning, but they also destroy linear accumulation because the benchmark is one fixed quote, not the per-block best quote.
Status: Valid obstruction in the additive abstraction. Needs separate work to rule out multi-quote/codebook market constructions.
Source: `iterations/iter_013/idea_01/explorer_01.md`; `iterations/iter_013/idea_01/critic_01_on_explorer_01.md`.

## Max-delay contamination for adaptive truncation
Construction idea: Include dyadic truncation-window experts up to $H=T$ in a single delayed-Hedge master.
Facts: Standard delayed-feedback analyses with a common maximum delay pay overhead roughly $\sqrt{T H_{\max}\log N}$. With $H_{\max}=T$, the overhead is essentially linear even if the best analysis window is small.
Why it matters: A tail-adaptive truncation theorem needs comparator-specific delay dependence or extra structure; the accepted fixed-$H$ residue-Hedge lemma cannot be used as-is.
Status: Algorithmic obstruction/stress test, not an impossibility theorem. A heterogeneous-delay experts lemma may still be true.
Source: `iterations/iter_013/idea_02/critic_01_on_explorer_01.md`.

## Delayed advantage safety/capture stress tests
Construction idea: In the two-arm fast/slow delayed experts abstraction, write $\Delta_t=s_t-f_t$, $q_t=\Pr(\text{slow})$, and $A_T=\sum_tq_t\Delta_t$. Fast regret is $-A_T$, slow regret is $S_T-A_T$, where $S_T=\sum_t\Delta_t$.
Facts:
- If $\Delta_t=-1$ for all $t$, fast-regret $O(\sqrt T)$ forces $\sum_tq_t=O(\sqrt T)$.
- If $\Delta_t=1$ for all $t$, slow-regret $O(\sqrt{TD})$ forces $\sum_t(1-q_t)=O(\sqrt{TD})$.
- A bait-and-switch sequence with a long positive observed prefix followed by $D$ hidden negative advantages attacks policies that raise slow exposure based only on observed counterfactual slow rewards rather than banked advantage.
Why it matters: These tests isolate the unresolved safety/capture tradeoff in comparator-specific delayed experts. They do not refute the desired theorem, but any candidate algorithm must pass them.
Status: Valid stress tests; no impossibility theorem yet.
Source: `iterations/iter_014/idea_01/explorer_01.md`; `iterations/iter_014/idea_01/critic_01_on_explorer_01.md`.

## Pathwise nested-window charge can exceed expected truncation gap
Construction idea: Compare a pathwise full-window best quote to an expected fixed comparator. In a one-terminal-price example with $H=0$, the pathwise full-window best quote can adapt to the realized terminal price, while $\delta_T^P(H)$ uses $\sup_b b\Pr(Y>b)$ in expectation.
Facts: For equal-revenue-type terminal distributions, $\mathbb E[\max_b b\mathbf{1}\{Y>b\}]$ can exceed $\sup_b b\Pr(Y>b)$ by logarithmic factors. Thus a pathwise charge $\mathbb E[V_M^G(\omega)-V_m^G(\omega)]$ is not controlled by the expected comparator-gap truncation loss $\delta_T^P(H)$.
Why it matters: Nested-window adaptive truncation proofs must use one value convention consistently. A pathwise oracle may be true but would prove a bound with a stronger, different charge than the accepted $\delta_T^P(H)$.
Status: Valid stress test against pathwise/expected mixing.
Source: `iterations/iter_014/idea_02/critic_01_on_explorer_01.md`.

## Horizon cutoff for nested-window increments
Construction idea: Take $t$ near $T$, no price above $b$ before $T$, but a post-horizon price above $b$.
Facts: The formula $z_t^m(b)=b\mathbf{1}\{H_{m-1}<\tau_t(b)\le H_m\}$ would count this as a late increment if the post-horizon hit lies within $H_m$. The finite-horizon reward should be zero because rewards only count hits with $\tau_t(b)\le T-t$.
Why it matters: Any nested-window decomposition must use horizon-censored increments
$$
z_t^m(b)=b\mathbf{1}\{H_{m-1}<\tau_t(b)\le H_m,\ \tau_t(b)\le T-t\}.
$$
Status: Valid correction to the iteration 14 nested-window formula.
Source: `iterations/iter_014/idea_02/critic_01_on_explorer_01.md`.

## Budget-depletion stress test for safe-clipped delayed Hedge
Construction idea: In the delayed full-information advantage abstraction, let a proposal $p_t=1/2$ before any feedback. Choose $D>2B$ and set
$$
\Delta_1=\cdots=\Delta_{2B}=-1,\qquad
\Delta_{2B+1}=\cdots=\Delta_T=+1.
$$
Use the clipped solvency rule $q_t=\min\{p_t,C_t,1\}$, where
$$
C_t=B+\sum_{u\le t-D}q_u\Delta_u-\sum_{t-D<u<t}q_u.
$$
Facts: Before feedback arrives, the rule plays $q_t=1/2$ for $2B$ rounds and spends all capacity. The subsequent negative reveals do not restore capacity because each reveal changes capacity by $q_t(\Delta_t+1)=0$. Since unplayed positive advantages do not enter the banked payoff, the rule can stay at $q_t=0$ even after the positive regime is observed. Thus $A_T=-B$ but $S_T-A_T$ is linear.
Why it matters: The solvency invariant is useful, but naive clipping can destroy slow capture. Any delayed wealth or reserve algorithm must avoid permanent zero-capacity traps.
Status: Valid refutation of the exact safe-clipped delayed-Hedge sketch, not of all two-arm delayed-advantage algorithms.
Source: `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Periodic finite-grid market obstruction to simultaneous nested oracle
Construction: Fix $G=\{\ell,h\}$, $h=\ell+d<1$, choose $m\in(\ell,h)$, and windows $H_1=1,H_2=D$. Let $T=ND+1$. Put high spikes above $h$ at times $jD+1$, $j=0,\ldots,N$, and set every other price to $m$. Assume $\ell D\ge h$.
Facts: On active rounds $1,\ldots,ND$, low earns short and long reward $\ell$ every round; high earns long reward $h$ every round; high earns short reward only on the $N$ rounds immediately before high spikes. Hence
$$
V_1^G=\ell ND,\qquad V_2^G=hND,\qquad V_2^G-V_1^G=dND.
$$
If $M$ is the expected number of high quotes and long-window regret is at most $B_2$, then $M\ge ND-B_2/d$. Short-window regret is at least
$$
\ell M-hN\ge \ell ND-\ell B_2/d-hN.
$$
For any fixed oracle constant $c$, taking $d\ll\ell/c$, then $D\gg h/\ell$, then $N\gg d^{-2}$ makes this exceed $B_1+c\,dND$ for standard $B_1=O(\sqrt{ND})$, $B_2=O(D\sqrt N)$.
Why it matters: This refutes a strong simultaneous expected nested-window oracle that tries to control every window by $B_m+c(V_2^G-V_m^G)$. The obstruction is deterministic, so there is no pathwise/expected ambiguity in this calculation.
Status: Valid finite-grid stress test. It does not rule out weaker min-over-window adaptive truncation bounds, heterogeneous-delay routes, or continuum variants after adding intermediate quotes.
Source: `iterations/iter_015/idea_02/explorer_01.md`; `iterations/iter_015/idea_02/critic_01_on_explorer_01.md`.

## Finite-support reward vectors separate ordinary priors from $\mathrm{ba}$ priors
Construction: Abstract fixed-grid reward-vector example. Let $\Theta=\mathbb N$, $V_\theta\equiv1$, and
$$
C=\{c\in[0,1]^\mathbb N:c\text{ has finite support}\}.
$$
Facts: The true full-class value is $1$, because every finite-support $c$ misses some coordinate $\theta$ and hence $\sup_\theta(1-c_\theta)=1$. Every finite subclass has value $0$, because one can choose $c=1$ on that finite set. More strongly, every countably additive probability $\pi$ on $\mathbb N$ gives ordinary-prior dual value $0$, since finite supports can capture arbitrarily large $\pi$-mass:
$$
\sup_{c\in C}\langle c,\pi\rangle=1.
$$
A free-ultrafilter finitely additive probability $\nu$ with $\nu(F)=0$ for every finite $F$ gives
$$
\langle V,\nu\rangle=1,\qquad \sup_{c\in C}\langle c,\nu\rangle=0,
$$
and witnesses the full value in the $\mathrm{ba}$ dual.
Why it matters: Finite/countably additive priors recover only the finite-subclass/product-closure relaxation, while finitely additive $\mathrm{ba}$ priors can detect true infinite-class gaps. This explains why the iteration 19 dual is exact but non-statistical.
Status: Valid abstract reward-set obstruction. It is not by itself a natural market class; the non-Borel label market construction is the market-flavored measurability analogue already recorded above.
Source: `iterations/iter_019/idea_01/explorer_01.md`; `iterations/iter_019/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_019/idea_02/explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`.
Iteration 21 status: reaffirmed as the canonical example showing finite/countably additive priors can miss a true infinite-class value that a $\mathrm{ba}$ prior detects.

## Nonconvex deterministic-policy stress test for the $\mathrm{ba}$ dual
Construction: Abstract reward-vector game with $\Theta=\{1,2\}$, comparator vector $V=(1,1)$, and deterministic-policy reward set
$$
C=\{(1,0),(0,1)\}.
$$
Facts: The deterministic primal value is
$$
\inf_{c\in C}\max_\theta(1-c_\theta)=1.
$$
If ex-ante randomization is allowed, the convexified point $(1/2,1/2)$ gives value $1/2$. The support-function dual over a convex reward set therefore characterizes the randomized/convexified value, not the deterministic-policy value.
Why it matters: The arbitrary-class $\mathrm{ba}$ dual requires a nonempty convex $C$, supplied in the market model by ex-ante private randomization between common policies. Without this assumption, the claimed minimax equality can be false for the intended deterministic policy class.
Status: Valid abstract stress test for theorem assumptions.
Source: `iterations/iter_020/idea_01/critic_01_on_explorer_01.md`.
Iteration 21 status: reaffirmed as the mandatory convexity stress test for the $\mathrm{ba}$ dual; ex-ante randomized common policies are needed to make $C$ convex.

## Single-account fractional wealth depletion in delayed advantage
Construction idea: In the two-arm delayed-advantage abstraction with $D=1$, use one solvency capital $C$ and the natural fractional rule $q=C/2$.
Facts: Run $N$ rounds with $\Delta=-1$, then $2N$ rounds with $\Delta=+1$. During the negative prefix, $C$ is multiplied by about $1/2$ each round, leaving $C\approx B2^{-N}$. During the positive suffix, $C$ is multiplied by about $3/2$ each round while small, so it takes $\Theta(N)$ positive rounds to recover meaningful slow exposure. The rule therefore suffers $\Omega(N)$ slow regret although $D=1$ and the desired target would be $\tilde O(\sqrt T)$.
Why it matters: This refutes a natural no-restart fractional-solvency route to comparator-specific delayed experts. It does not refute interval/restart testers or the two-arm theorem itself.
Status: Valid stress test for a specific algorithmic route.
Source: `iterations/iter_022/idea_01/explorer_01.md`; `iterations/iter_022/idea_01/critic_01_on_explorer_01.md`.

## Limited-leakage same-level market coupling
Construction idea: Repeat many same-level terminal-price blocks with a common hidden type and small per-block information leakage. In an abstract block-local model this can give Bayes gap $D\gamma\min\{N,1/\kappa\}$.
Facts: In the actual delayed market, quotes persist across blocks. If a quote $a$ has per-terminal hit probability $r_{\theta,a}$ and $n$ terminal draws remain, the reward curve is
$$
g_{\theta,n}(a)=a[1-(1-r_{\theta,a})^n].
$$
Thus a quote from an early block can trade on later terminal prices. In the useful limited-leakage regime $\kappa\asymp\gamma^2/q$, taking $N\approx1/\kappa$ often gives $Nq\gg1$, so old quotes are hit with probability near one rather than order $q$.
Why it matters: The block-local Bayes calculation is not automatically a delayed-market lower bound. Any construction must prove localization or compute the coupled market Bayes value directly.
Status: Valid obstruction to direct same-level limited-leakage constructions; not an impossibility theorem for all lower-rate designs.
Source: `iterations/iter_022/idea_02/explorer_01.md`; `iterations/iter_022/idea_02/critic_01_on_explorer_01.md`.
