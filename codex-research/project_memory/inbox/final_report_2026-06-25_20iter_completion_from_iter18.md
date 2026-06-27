# Delayed Market Making With Horizon-Censored Fills

## Abstract

This report gives a self-contained account of the mathematical conclusions of this research task.  The original proposed characterization, which asserted that sublinear regret is possible if and only if a uniform tail condition on fill delays holds, is not correct under the literal instance-wise pseudo-regret interpretation; see Proposition 2 and Proposition 3.  The positive results that remain are conditional but useful: Theorem 1 gives a delayed full-information sufficiency theorem, Theorem 2 identifies a sharp `1/e` worst-case constant for horizon-oblivious policies on deterministic exogenous paths, Theorem 3 gives an exact finite-prefix linear-programming dual, Proposition 5 gives a fixed-envelope compactness criterion, and Theorem 4 plus Corollary 1 give local one-drought formulas for finite-prefix conflicts.

The report does not claim that the original problem is solved.  The main open issue is a genuine characterization of when one horizon-oblivious policy can achieve `o(T)` regret on a known exogenous path, and more generally which delay quantities are decision-relevant rather than merely long-tailed.

## Problem Setup

**Definition 1 (Delayed Market-Making Process).** A delayed market-making instance consists of a filtered probability space, an adapted price process `(P_t)_{t>=1}` with `P_t in [0,1]`, and a learner.  At round `t`, the price `P_t` is publicly revealed, and the learner then posts a quote `A_t in [0,1]`, possibly randomized as a function of the observed history and its internal randomness.

**Definition 2 (Fill Time And Single-Fill Reward).** For a quote `a in [0,1]` posted at time `t`, define
\[
\tau_t(a)=\inf\{s>=1:P_{t+s}>a\},
\]
with `tau_t(a)=infty` if the set is empty.  For horizon `T`, the reward attributed to that quote is
\[
r_{t,T}(a)=a\,1\{\tau_t(a)<=T-t\}.
\]
Each quote pays at most once.  When the horizon is clear, write `r_t(a)` for `r_{t,T}(a)`.

**Definition 3 (Fixed-Quote Value And Pseudo-Regret).** For an exogenous price law and a fixed quote `a`, define
\[
V_T(a)=E\sum_{t=1}^T r_{t,T}(a).
\]
The expected pseudo-regret of a learner is
\[
R_T=\sup_{a in [0,1]}V_T(a)-E\sum_{t=1}^T r_{t,T}(A_t).
\]
On a deterministic path, the expectation is only over the learner's randomization.

**Definition 4 (Policy Information Regimes).** A policy is horizon-aware if its action rule may depend on the evaluation horizon `T`; otherwise it is horizon-oblivious.  A policy is process-aware if it may depend on the exogenous price law or a deterministic path; otherwise it is process-unaware or universal.  The term anytime refers to one horizon-oblivious policy evaluated along all horizons.

**Proposition 1 (Suprema Are Necessary Under Strict Crossing).** In Definition 3, `sup` cannot generally be replaced by `max`.

**Intuition.** A quote exactly equal to a future price does not trade, but quotes just below that future price do trade.  This creates left-limit values.

**Proof.** Consider a deterministic horizon with one future price equal to `c in (0,1]`.  A fixed quote `a<c` earns `a`, while `a>=c` earns `0` from that future price.  The attainable payoffs approach `c` as `a` increases to `c` from below, but no action attains payoff `c`.  Therefore the comparator value is a supremum, not necessarily a maximum.  This example is already contained in the delayed market-making model.  QED.

**Definition 5 (Truncation And Tail Quantities).** For an integer `H>=0`, define the `H`-truncated reward
\[
r^H_{t,T}(a)=a\,1\{\tau_t(a)<=min(H,T-t)\}.
\]
Let `F_t` be the history through the revealed price `P_t`.  The unweighted tail from the original conjecture is
\[
\beta(h)=\sup_t\sup_{a in [0,1]}\operatorname*{ess\,sup}
Pr(h<\tau_t(a)<infty\mid F_t).
\]
The payoff-weighted tail is
\[
\gamma(h)=\sup_t\sup_{a in [0,1]}\operatorname*{ess\,sup}
a\,Pr(h<\tau_t(a)<infty\mid F_t).
\]
The horizon-tail and comparator-gap truncation losses are
\[
\Delta_T(H)=\sup_{a in [0,1]}\sum_{t<=T}E\bigl[a\,1\{H<\tau_t(a)<=T-t\}\bigr],
\]
and
\[
\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a),
\qquad
V_T^H(a)=E\sum_{t<=T}r^H_{t,T}(a).
\]

**Assumption 1 (Exogenous Full-Information Truncation Feedback).** Prices are public and exogenous, so the learner can compute counterfactual rewards for every quote in any finite grid.  For a fixed truncation horizon `H`, the full vector of grid rewards `r^H_{t,T}(b)` is available by time `t+H`.  Rewards are bounded in `[0,1]`, and the learner may run a standard full-information delayed-expert algorithm on the grid.

## Main Results And Proofs

**Lemma 1 (Truncation Comparison).** Under Definition 5, for every learner and every `H`,
\[
R_T<=R_T^H+T\gamma(H),
\]
where `R_T^H` is the pseudo-regret computed with truncated rewards.  Also
\[
R_T<=R_T^H+\Delta_T(H)
\qquad\text{and}\qquad
R_T<=R_T^H+\Gamma_T(H).
\]

**Intuition.** Truncation only removes late fills.  It can reduce the comparator's value, but it cannot increase the learner's reward shortfall because the learner's true reward dominates its truncated reward pathwise.

**Proof.** For each fixed quote `a`,
\[
0<=r_{t,T}(a)-r^H_{t,T}(a)
=a\,1\{H<\tau_t(a)<=T-t\}
<=a\,1\{H<\tau_t(a)<infty\}.
\]
Taking conditional expectations and using the definition of `gamma` gives
\[
V_T(a)<=V_T^H(a)+T\gamma(H).
\]
Taking the supremum over `a`, and using
\[
\sum_t r_{t,T}(A_t)>=\sum_t r^H_{t,T}(A_t)
\]
pathwise, proves the `T gamma(H)` bound.  The `Delta_T(H)` bound is the same argument without replacing the comparator's total late-fill loss by a uniform per-round bound.  The `Gamma_T(H)` bound follows from
\[
\sup_a V_T(a)=\sup_a V_T^H(a)+\Gamma_T(H)
\]
and the same learner-side pathwise domination.  QED.

**Lemma 2 (Downward Grid Discretization).** Let
\[
G_K=\{0,1/K,\ldots,(K-1)/K\}.
\]
For truncated rewards,
\[
\sup_{a in [0,1]}E\sum_{t<=T}r^H_{t,T}(a)
<=
\sup_{b in G_K}E\sum_{t<=T}r^H_{t,T}(b)+T/K.
\]

**Intuition.** Rounding a quote downward makes it easier to fill, and loses at most `1/K` in price per round.

**Proof.** For each `a`, let `b(a)` be the largest grid point with `b(a)<=a`.  Then `a-b(a)<=1/K`.  If quote `a` fills by the truncated deadline, quote `b(a)` also fills by that deadline, since every price above `a` is above `b(a)`.  Hence
\[
r^H_{t,T}(a)<=r^H_{t,T}(b(a))+1/K
\]
pathwise.  Summing over `t`, taking expectations, and then taking the supremum over `a` proves the claim.  QED.

**Lemma 3 (Bounded-Delay Full-Information Grid Regret).** Under Assumption 1, for any grid of size `K`, there is a full-information learner whose truncated grid regret satisfies
\[
R^H_{T,K}<=C\sqrt{T(H+1)\log K}
\]
for a universal constant `C`.

**Intuition.** Splitting time into `H+1` residue classes turns delayed rewards into ordinary full-information rewards within each residue class.

**Proof.** Run an independent Hedge instance on each residue class modulo `H+1`.  When the next time in the same residue class arrives, all rewards from the previous time in that class have matured.  If the class has `n_j` rounds, the usual full-information regret bound gives `O(sqrt(n_j log K))`.  Summing over classes and applying Cauchy-Schwarz,
\[
\sum_{j=0}^H O(\sqrt{n_j\log K})
<=O\left(\sqrt{(H+1)T\log K}\right).
\]
This proves the displayed bound.  The argument is the standard bounded-delay expert reduction used in delayed online learning.  QED.

**Theorem 1 (Truncated Full-Information Sufficiency).** Under Assumption 1, for every horizon `T`, grid size `K`, and truncation horizon `H`, there is a learner satisfying
\[
R_T<=C\sqrt{T(H+1)\log K}+T/K+T\gamma(H).
\]
The same statement holds with `T gamma(H)` replaced by `Delta_T(H)` or by `Gamma_T(H)`.  Consequently, if `gamma(h)->0`, then some schedules `H_T->infty` and `K_T->infty` give `R_T=o(T)`.

**Intuition.** Once late fills after `H` rounds are ignored, the problem becomes ordinary full-information learning with delay `H` on a finite grid.  The three error terms are delayed learning, discretization, and truncation.

**Proof.** Apply Lemma 3 to the truncated grid problem, then Lemma 2 to compare the continuum comparator to the grid comparator, and finally Lemma 1 to compare true rewards to truncated rewards.  This gives the displayed bound and its `Delta_T` and `Gamma_T` variants.  If `gamma(h)->0`, choose a diagonal schedule with `H_T->infty`, `H_T log T=o(T)`, and `gamma(H_T)->0`, and take for instance `K_T=T`.  Dividing the bound by `T` then sends all three terms to zero.  QED.

**Proposition 2 (Sparse Vanishing Spikes Refute Raw-Tail Necessity).** There is an exogenous price process with `beta(h)=1` for every `h`, but the always-zero learner has `R_T<=1` for every horizon `T`.

**Intuition.** The tail condition sees arbitrarily long waiting times for quote `0`, but the positive prices are so small and sparse that no fixed positive quote can accumulate large value.

**Proof.** Let `s_n=2^n`.  Let `U_n` be iid uniform random variables on `[0,1]`, and set
\[
P_{s_n}=U_n/s_n,\qquad P_t=0\quad\text{otherwise}.
\]
At time `s_n`, quote `a=0` has next positive price at `s_{n+1}` almost surely, so for every `h` one can choose `n` with `s_{n+1}-s_n>h`; hence `beta(h)=1`.

Now fix `a>0` and horizon `T`.  A future spike can exceed `a` only if `1/s_m>a`.  Let `m_*` be the last spike index up to `T` with this property, if such an index exists.  Then only quotes posted before `s_{m_*}` can earn, and their total reward is at most `a s_{m_*}<1`.  If no such index exists, the reward is zero.  The quote `a=0` earns zero.  Thus `sup_a V_T(a)<=1`.  The always-zero learner earns zero, so `R_T<=1`.  QED.

**Proposition 3 (Horizon-Aware Process-Aware Collapse).** Fix any exogenous price-process law.  If a policy may depend on both the law and the horizon `T`, then for every `epsilon>0` there is a deterministic constant-quote policy with pseudo-regret at most `epsilon` at horizon `T`.

**Intuition.** The comparator is one fixed quote in expectation.  A learner that knows the law and the horizon can simply play an almost-best fixed quote.

**Proof.** By the definition of supremum, choose `a_{T,epsilon}` with
\[
V_T(a_{T,epsilon})>=\sup_a V_T(a)-epsilon.
\]
The policy that posts `a_{T,epsilon}` at every time earns exactly `V_T(a_{T,epsilon})` in expectation.  Its regret is therefore at most `epsilon`.  QED.

**Definition 6 (Formal Left-Limit Local Threshold Game).** For a finite threshold menu `C={0<c_1<...<c_m} subset (0,1]`, define
\[
\kappa(C)=
\inf_{\mu in \Delta([0,1])}\sup_{c in C}
\left[c-\int_{[0,c]}x\,d\mu(x)\right].
\]
The integral over `[0,c]` is the formal left-limit convention: mass at `c` represents quotes just below `c`.  In the original strict-crossing model, the same value is an infimum implemented by quotes `c-\eta`.

**Proposition 4 (Finite-Menu Local Value Formula).** Let `C={0<c_1<...<c_m}` and set `c_0=0`.  Define
\[
F_C(delta)=\sum_{i=1}^m
\frac{(c_i-delta)_+-(c_{i-1}-delta)_+}{c_i}.
\]
There is a unique `delta_*(C) in [0,c_m]` satisfying `F_C(delta_*)=1`, and
\[
\kappa(C)=delta_*(C).
\]

**Intuition.** The learner's optimal local randomized quote equalizes the largest threshold deficits.  The dual distribution is a truncated equal-revenue law over the active suffix of thresholds.

**Proof.** The function `F_C` is continuous, nonincreasing, equals at least `1` at `0`, and equals `0` at `c_m`; on the active interval before the root it decreases strictly, giving uniqueness.

For the upper bound, define
\[
q_i=\frac{(c_i-delta_*)_+-(c_{i-1}-delta_*)_+}{c_i}.
\]
The equation `F_C(delta_*)=1` says that `(q_i)` is a probability distribution.  Put mass `q_i` on the formal quote `c_i^-`.  For threshold `c_j`,
\[
\sum_{i<=j}q_i c_i=(c_j-delta_*)_+,
\]
so the deficit is `min(c_j,delta_*)<=delta_*`.

For the lower bound, let `k` be the first index with `c_k>delta_*`.  Put a dual law on the active suffix by
\[
Pr(Z>=c_i)=c_k/c_i,\qquad i>=k.
\]
Its left-limit posted-price revenue is `c_k`, while summation by parts and `F_C(delta_*)=1` give `E Z=c_k+delta_*`.  The finite zero-sum game dual therefore lower-bounds `kappa(C)` by `E Z-c_k=delta_*`.  The upper and lower bounds match.  QED.

**Lemma 4 (Same-Path Multi-Threshold Lift).** Consider a deterministic exogenous path consisting of an arbitrary old prefix of length `M`, followed by
\[
0^N,c_1,c_2,\ldots,c_m,
\qquad 0<c_1<...<c_m<=1.
\]
Let `T_j=M+N+j`.  For every horizon-oblivious policy, possibly randomized and possibly aware of the whole path,
\[
\max_{1<=j<=m} R_{T_j}>=N\kappa(C)-M,
\qquad C={c_1,\ldots,c_m}.
\]

**Intuition.** The same `N` zero-block quotes must serve all horizons `T_j`.  A quote low enough to work for small thresholds under-earns for large thresholds, while a high quote misses the smaller thresholds.

**Proof.** At horizon `T_j`, the fixed comparator `a` tending up to `c_j` earns supremum `(N+j-1)c_j` from the zero block and the `j-1` earlier threshold-round posts.  The learner earns at most `M` from the old prefix, at most
\[
\sum_{s=1}^N A_s1\{A_s<c_j\}
\]
from the zero block, and at most `(j-1)c_j` from the earlier threshold-round posts.  Thus
\[
R_{T_j}>=
N c_j-E\sum_{s=1}^N A_s1\{A_s<c_j\}-M.
\]
Average these inequalities against any law `lambda` on `C`.  For each zero-block action `a`,
\[
a\,Pr_\lambda(C>a)<=\sup_{x in [0,1]}x\,Pr_\lambda(C>x).
\]
Optimizing over `lambda` and using the dual form of `kappa(C)` from Proposition 4 yields the claim.  QED.

**Theorem 2 (Sharp `1/e` Known-Path Anytime Constant).** In the deterministic exogenous single-fill model with `sup` comparators:

1. There is a process-unaware randomized horizon-oblivious policy such that every deterministic path satisfies
\[
R_T<=(T-1)/e\qquad\text{for all }T.
\]
2. There is a deterministic path such that every horizon-oblivious policy, even one that knows the path, satisfies
\[
\limsup_{T->infty} R_T/T>=1/e.
\]
3. There exists a deterministic horizon-oblivious quote sequence, independent of the path, with
\[
R_T<=(T-1)/e+O(T^{2/3}\sqrt{\log T})
\]
for every deterministic path.

**Intuition.** The equal-revenue quote distribution loses at most `1/e` per quote against every possible future suffix maximum.  Conversely, long zero blocks followed by increasingly fine equal-revenue threshold menus force any single anytime policy to incur a local `1/e` deficit on some prefix.

**Proof.** For the randomized upper bound, draw each quote independently from
\[
d\mu(a)=a^{-1}1\{e^{-1}<=a<=1\}\,da.
\]
For a deterministic path and horizon `T`, set
\[
M_{t,T}=\max_{t<s<=T}P_s.
\]
Then `r_{t,T}(a)=a1\{a<M_{t,T}\}` and
\[
g_\mu(c):=E[A1\{A<c\}]=(c-e^{-1})_+.
\]
Since any fixed quote earns at most `sum_{t<T}M_{t,T}`,
\[
R_T<=\sum_{t<T}(M_{t,T}-g_\mu(M_{t,T}))<=(T-1)/e.
\]

For the lower bound, choose `m_i->infty`, let `r_i=(m_i-1)/m_i`, and use the increasing menu
\[
C_i=\{r_i^{m_i-j}:1<=j<=m_i\}.
\]
Proposition 4 gives `kappa(C_i)=r_i^{m_i}->1/e`.  Concatenate blocks `0^{N_i},C_i`, with previous length `M_i` and menu length `m_i` satisfying `(M_i+m_i)/N_i->0`.  Lemma 4 gives, for each block, some prefix horizon with
\[
R_T>=N_i r_i^{m_i}-M_i.
\]
Dividing by `T<=M_i+N_i+m_i` and taking `limsup` gives the lower bound `1/e`.

For the deterministic upper bound, sample an iid sequence from the equal-revenue distribution above.  For each `n`, union-bound Hoeffding's inequality over all nonincreasing grid sequences `c_1>=...>=c_n` on a grid of mesh `n^{-1/3}`.  The failure probabilities can be made summable, so Borel-Cantelli gives one deterministic realization `(a_t)` such that uniformly over nonincreasing threshold sequences,
\[
\sum_{t<=n}a_t1\{a_t<c_t\}
>=\sum_{t<=n}(c_t-e^{-1})_+-O(n^{2/3}\sqrt{\log n}).
\]
For every deterministic path, `(M_{t,T})_{t<T}` is nonincreasing in `t`, so applying the uniform inequality to `c_t=M_{t,T}` gives the displayed regret bound.  QED.

**Definition 7 (Finite-Prefix Horizon-Conflict Value).** Fix a deterministic exogenous prefix `P_{1:n}`.  For `t<T<=n`, define
\[
M_{t,T}=\max_{t<s<=T}P_s
\]
and
\[
V_T^*=\sup_{b in [0,1]}\sum_{t<T}b\,1\{b<M_{t,T}\}.
\]
In the formal left-limit model, define
\[
\bar g_\mu(c)=\int_{[0,c]}x\,d\mu(x)
\]
and
\[
D_n(P)=
\inf_{\mu_1,\ldots,\mu_{n-1}}
\max_{T<=n}
\left[
V_T^*-\sum_{t<T}\bar g_{\mu_t}(M_{t,T})
\right].
\]

**Theorem 3 (Finite-Prefix Linear-Programming Dual).** In the formal left-limit model of Definition 7,
\[
D_n(P)=
\max_{\lambda in \Delta_n}
\left[
\sum_{T<=n}\lambda_TV_T^*
-
\sum_{t<n}
\sup_{a in [0,1]}\sum_{T>t}\lambda_Ta\,1\{a<M_{t,T}\}
\right],
\]
where `Delta_n` is the probability simplex over horizons `{1,...,n}`.  If `D_n(P)>=epsilon n` for infinitely many `n`, then every horizon-oblivious policy on that deterministic path has `limsup_T R_T/T>=epsilon`.

**Intuition.** Finite-prefix learning against all horizons is a finite zero-sum game: the learner chooses one marginal quote law per time, and the adversarial dual variable chooses the horizon whose deficit is tested.

**Proof.** For each time `t`, only the finite set of suffix maxima `{M_{t,T}:T>t}` matters, because the payoff pattern is constant between adjacent thresholds and the formal payoff is increasing up to a threshold.  Thus the finite-prefix problem is a finite linear program: minimize `z` subject to
\[
z>=V_T^*-\sum_{t<T}\sum_a q_{t,a}\phi_{t,T}(a),
\qquad
\sum_a q_{t,a}=1,
\]
where `phi_{t,T}(a)=a1\{a<=M_{t,T}\}` in the formal model.  Linear-programming duality gives horizon weights `lambda_T>=0` summing to one, and the learner-side variables decouple over `t`, producing the displayed support-function expression.

If a policy had `limsup_T R_T/T<epsilon`, choose `epsilon'<epsilon` such that `R_T<=epsilon' T` for all sufficiently large `T`.  Restricting its first `n` marginal laws gives a feasible finite-prefix solution whose large-horizon deficits are at most `epsilon' n`, while the finitely many earlier horizon deficits contribute `o(n)` to the maximum after normalization by `n`.  Hence `D_n(P)<=epsilon' n+o(n)`, contradicting `D_n(P)>=epsilon n` along an infinite subsequence.  QED.

**Proposition 5 (Fixed-Envelope Compactness Criterion).** Fix a deterministic exogenous path and a nonnegative sequence `(e_T)`.  In the formal left-limit model, there exists a horizon-oblivious marginal sequence `(mu_t)_{t>=1}` satisfying
\[
V_T^*-\sum_{t<T}\bar g_{\mu_t}(M_{t,T})<=e_T
\qquad\text{for all }T
\]
if and only if every finite prefix admits marginal laws satisfying the same inequalities for all horizons inside that prefix.

**Intuition.** A fixed envelope gives closed constraints in the compact product space of all marginal laws.  This is exactly the condition needed for finite-prefix feasibility to glue into one infinite policy.

**Proof.** Necessity follows by restriction.  For sufficiency, note that `P([0,1])` is weakly compact, so the product `P([0,1])^N` is compact.  For fixed `T`, the map
\[
\mu\mapsto\int_{[0,c]}x\,d\mu(x)
\]
is upper semicontinuous because `x1\{x<=c\}` is bounded upper semicontinuous.  Therefore each constraint
\[
\sum_{t<T}\bar g_{\mu_t}(M_{t,T})>=V_T^*-e_T
\]
defines a closed subset of the product space.  The finite-prefix feasibility assumption gives the finite intersection property, so compactness gives a global sequence satisfying all constraints.  Actual strict-crossing quotes are obtained from formal quotes by multiplying by `(1-\eta_t)` with `sum_{t<T}\eta_t=o(T)`.  QED.

**Definition 8 (One-Drought Prefix).** A one-drought prefix with high level `h` and lows `ell_1,...,ell_r` is a deterministic prefix of the form
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\qquad 0<\ell_j<h.
\]
Let `s_j` be the time of low `ell_j`, let `H=(M-1)_+`, let
\[
B_0=N_0+1\{M>=1\},\qquad B_i=N_i+1\quad(1<=i<=r-1),
\]
let `Lset={ell_1,...,ell_r}`, and for `0<=i<j<=r` set
\[
m_{i,j}=\max_{q=i+1,\ldots,j}\ell_q.
\]
Finally set
\[
S_j=V_{s_j}^*-hH,
\]
where `V_{s_j}^*` is the fixed-quote comparator value at the low horizon `s_j`.

**Theorem 4 (Unequal-Low One-Drought Reduced LP).** For the one-drought prefix in Definition 8, the formal left-limit finite-prefix value `D_n` equals the optimum of
\[
\begin{aligned}
\min\quad &z\\
\text{s.t.}\quad
&z\ge S_j-\sum_{i=0}^{j-1}
\sum_{\substack{c in Lset\\ c<=m_{i,j}}}c\,x_{i,c},
\qquad j=1,\ldots,r,\\
&z\ge\sum_{i=0}^{r-1}\sum_{c in Lset}(h-c)x_{i,c},\\
&\sum_{c in Lset}x_{i,c}\le B_i,\qquad x_{i,c}\ge0.
\end{aligned}
\]

**Intuition.** Old high quotes are already protected, and quotes after the last low matter only for the final high.  The only nontrivial decisions are how much mass to place at each low level in each useful segment; low quotes reduce deficits at low horizons but create debt at the final high.

**Proof.** Work in the formal left-limit action space.  The first `H=(M-1)_+` old-high quote coordinates can be fixed to `h^-`, since every low horizon still has a future old high for those coordinates.  Coordinates after the last low and before the final high are final-high-only, so `h^-` is also optimal there.

For each useful segment `i`, all coordinates have the same payoff vector against the retained low horizons and the final high.  Any action below `h` is weakly dominated by rounding it upward to the smallest element of `Lset union {h}` that is at least as large: this preserves all relevant threshold-success indicators and weakly increases payoff.  Therefore it suffices to record aggregate masses `x_{i,c}` assigned to formal quotes `c^-`, with the remaining segment mass assigned to `h^-`.

At low horizon `s_j`, protected high coordinates contribute `hH`, and a mass `x_{i,c}` from segment `i<j` contributes `c` exactly when `c<=m_{i,j}`.  This gives the first family of constraints after subtracting the baseline `hH`.  At the final horizon, the all-`h^-` baseline matches the high comparator, and each unit of mass moved from `h^-` to `c^-` creates debt `h-c`, giving the second constraint.  Horizons before the first low and zero horizons between lows duplicate these constraints or are dominated by them.  This proves the reduced LP.  QED.

**Corollary 1 (Strictly Increasing-Low One-Drought Formula).** In Theorem 4, assume
\[
0<\ell_1<\ell_2<...<\ell_r<h.
\]
Set
\[
C_j=\sum_{i=0}^{j-1}B_i,\qquad
S_j=[\ell_j(H+C_j)-hH]_+,\qquad S_0=0,\qquad
\Delta_j=S_j-S_{j-1}.
\]
Then
\[
D_n=
\max_{1<=k<=r}
\left[
\left(1-\frac{\ell_k}{h}\right)S_k
+
\sum_{j>k}
\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j
\right].
\]

**Intuition.** For increasing lows, the running maximum seen by a segment is simply the later low level.  The dual has a zero-pressure certificate, and the primal schedules exactly enough low-level mass to cover the active low deficits while balancing final-high debt.

**Proof.** The reduced LP in Theorem 4 has `m_{i,j}=ell_j` under strict increase.  For each `k`, define dual weights by setting `beta=ell_k/h` and tail sums
\[
A_j=\sum_{q>=j}\alpha_q=
\begin{cases}
1-\ell_k/h, & j<=k,\\
\ell_k/\ell_j-\ell_k/h, & j>k,
\end{cases}
\]
with `ell_{r+1}=h`.  These weights are nonnegative and sum with `beta` to one.  Direct substitution into the dual of the reduced LP gives zero segment pressure and objective
\[
Z_k=
\left(1-\frac{\ell_k}{h}\right)S_k
+
\sum_{j>k}\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j.
\]
Thus `D_n>=max_k Z_k`.

For the primal upper bound, choose `k` maximizing `Z_k=z` with `S_{k-1}<=z<=S_k`; this follows from the recurrence
\[
Z_{k+1}-Z_k=\frac{\ell_{k+1}-\ell_k}{\ell_k}(Z_k-S_k).
\]
Set `y_k=S_k-z` and `y_j=Delta_j` for `j>k`, and allocate mass `y_j/ell_j` to quote level `ell_j^-` in eligible segments before low `j`.  The nested Hall inequalities
\[
\sum_{j=k}^t y_j/\ell_j<=C_t
\]
follow from
\[
z-\left(S_k+\ell_k\sum_{j=k+1}^t\frac{\Delta_j}{\ell_j}-\ell_k C_t\right)
=
\frac{\ell_k}{h}(hC_t-S_t)
+
\sum_{j>t}\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j>=0.
\]
Hence the mass can be scheduled.  The resulting low-horizon deficits and final-high debt are all at most `z`, matching the dual lower bound.  QED.

## Examples And Obstructions

**Example 1 (Alternating Path And Suffix-Menu Non-Necessity).** On the deterministic path
\[
P_{2k-1}=1/2,\qquad P_{2k}=1,
\]
the local suffix-menu sufficient condition can be linear even though `o(T)` regret is possible.  Even quote times have future suffix menu `{1/2,1}`, whose local value is `1/4`, so the sum of local suffix-menu costs is linear.  Nevertheless, the horizon-oblivious policy posting `1-\epsilon_t` with average `T^{-1}\sum_{t<=T}\epsilon_t->0` has `o(T)` regret, because the fixed comparator `1^-` is asymptotically optimal at almost all horizons.

**Example 2 (Unequal Lows Need More Than The Last Low).** In the formal left-limit model, the path
\[
0,\ 0.4,\ 0.9,\ 1
\]
has one-drought value
\[
D_4=68/225.
\]
The naive last-low expression would give `1.8(1-0.9)=0.18`, which is smaller.  Thus earlier low horizons can remain binding when low levels are unequal.

**Remark 1 (What The Refutations Do And Do Not Say).** Proposition 2 refutes raw `beta` necessity for individual processes, and Proposition 3 rules out any nontrivial instance-wise necessity theorem under horizon-aware process-law oracle policies.  These refutations do not rule out universal, minimax, horizon-oblivious, or information-theoretic lower bounds; Theorem 2 is one such horizon-oblivious lower bound.

## Literature

- Pooria Joulani, Andras Gyorgy, and Csaba Szepesvari, "Online Learning under Delayed Feedback," ICML/PMLR 2013, https://proceedings.mlr.press/v28/joulani13.html.  This is the primary delayed-feedback reference behind the full-information reduction used in Lemma 3.
- Nicolo Cesa-Bianchi and Gabor Lugosi, *Prediction, Learning, and Games*, Cambridge University Press, 2006, https://cesa-bianchi.di.unimi.it/predbook/.  This is the standard background reference for expert advice, pseudo-regret, and online-learning quantifiers.
- Dirk van der Hoeven and Nicolo Cesa-Bianchi, "Nonstochastic Bandits and Experts with Arm-Dependent Delays," AISTATS/PMLR 2022, https://proceedings.mlr.press/v151/van-der-hoeven22a.html.  This gives related delayed experts and arm-dependent delay context; the report uses only the simpler bounded-delay full-information consequence.
- Nicolo Cesa-Bianchi, Tommaso Cesari, Roberto Colomboni, Luigi Foscari, and Vinayak Pathak, "Market Making without Regret," COLT/PMLR 2025, https://proceedings.mlr.press/v291/cesa-bianchi25a.html.  This is adjacent market-making regret literature, but it does not prove the delayed-fill characterization studied here.
- Jacob Abernethy and Satyen Kale, "Adaptive Market Making via Online Learning," NeurIPS 2013, https://papers.neurips.cc/paper/4910-adaptive-market-making-via-online-learning.pdf.  This is relevant background for exogenous-price online-learning market-making models.
- Robert Kleinberg and Frank Leighton, "The Value of Knowing a Demand Curve: Bounds on Regret for Online Posted-Price Auctions," FOCS 2003, https://doi.org/10.1109/SFCS.2003.1238232.  This is foundational posted-price regret background for threshold-style rewards.
- Anne-Katrin Roesler and Balazs Szentes, "Buyer-Optimal Learning and Monopoly Pricing," *American Economic Review* 2017, https://doi.org/10.1257/aer.20160145.  This is relevant equal-revenue posted-price geometry; the exact finite-menu formula in Proposition 4 is proved internally above.
- Wassily Hoeffding, "Probability Inequalities for Sums of Bounded Random Variables," *Journal of the American Statistical Association* 1963, https://doi.org/10.1080/01621459.1963.10500830.  This supplies the concentration inequality used in the deterministic derandomization part of Theorem 2.
- Noga Alon and Joel Spencer, *The Probabilistic Method*, 4th ed., Wiley, 2016, https://www.wiley.com/en-gb/The%2BProbabilistic%2BMethod%2C%2B4th%2BEdition-p-9781119061953.  This is general background for the nonconstructive existence proof in Theorem 2.
- David Gale, "A theorem on flows in networks," *Pacific Journal of Mathematics* 1957, https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-7/issue-2/A-theorem-on-flows-in-networks/pjm/1103043501.full, and D. R. Fulkerson, "A Network-Flow Feasibility Theorem and Combinatorial Applications," *Canadian Journal of Mathematics* 1959, https://doi.org/10.4153/CJM-1959-045-1.  These are the classical flow-feasibility references behind the nested Hall scheduling step in Corollary 1.

## Open Problems

**Open Problem 1 (Decision-Relevant Tail Characterization).** Find a nontrivial condition, if one exists, that characterizes sublinear regret without collapsing under Proposition 2 or Proposition 3.  Such a condition must include payoff scale, predictability, common-prefix information, or some other decision-relevant structure; raw elapsed fill delay is insufficient.

**Open Problem 2 (From `D_n=o(n)` To One Anytime Policy).** For deterministic known exogenous paths, Theorem 3 makes `D_n(P)=o(n)` necessary for `o(T)` anytime regret.  It is open whether this scalar condition is sufficient, or whether one needs the stronger fixed-envelope feasibility condition of Proposition 5.

**Open Problem 3 (Nonmonotone And Repeated Droughts).** Extend Theorem 4 beyond one drought, and extend Corollary 1 beyond strictly increasing low levels.  Nonmonotone lows, duplicate lows, and repeated high-debt interactions are not covered by the zero-pressure formula.

**Open Problem 4 (Constructive Deterministic `1/e` Policy).** The deterministic upper bound in Theorem 2 is nonconstructive.  An explicit low-discrepancy or conditional-expectation construction would turn the existence proof into an implementable universal horizon-oblivious policy.

## Appendix: Run Audit

**Remark 2 (Audit Status).** The run directory was
\[
\texttt{/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_completion_from_iter18}.
\]
The run state recorded `accepted_solution: false` after iteration 20.  The solution gates in iterations 3 and 10 both rejected stopping: the first because the quantifier regime was unresolved, and the second because the `1/e` derandomization theorem did not solve the original tail-characterization problem.  The main text therefore reports accepted local theorems, refutations, and open problems rather than a solved iff characterization.
