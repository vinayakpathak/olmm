# Canonical Summary

We study delayed market making where each public price \(P_t\in[0,1]\) is revealed, the learner posts \(a_t\in[0,1]\), and a quote \(a\) posted at \(t\) pays once, \(r_t(a)=a\,1\{\tau_t(a)\le T-t\}\), if some future price strictly exceeds it. Regret should usually be written against \(\sup_{a\in[0,1]}\), not \(\max\), unless comparator attainment is separately proved; strict crossing and atoms can destroy maxima.

The stated "only if" direction is false under literal instance-wise/process-aware readings. The sparse vanishing-spike process \(P_{2^n}=U_n/2^n\), \(P_t=0\) otherwise, has \(\beta(h)=1\) for every \(h\) via \(a=0\), but the always-zero learner has regret at most \(1\) for every horizon. Stronger: if the learner may depend on both the exogenous process law and the horizon, and regret is the problem's pseudo-regret \(\sup_a\mathbb E[\cdot]-\mathbb E[\cdot]\), every process is trivially learnable by playing an \(\varepsilon_T\)-optimal fixed quote for that horizon. This collapse does not apply to endogenous prices, \(E[\sup]\) pathwise regret, horizon-oblivious learners, or universal/minimax guarantees.

The sufficiency side survives under explicit assumptions: public exogenous prices define counterfactual truncated rewards for all grid quotes, the learner uses full-information delayed-expert feedback, \(H,K\) are known/chosen, and regret uses a supremum comparator. Then
\[
R_T \lesssim \sqrt{T(H+1)\log K}+T/K+T\beta(H).
\]
This improves to \(T\gamma(H)\) for the payoff-weighted tail
\[
\gamma(h)=\sup_{t,a}\operatorname*{ess\,sup}_{\mathcal F_t} a\,\Pr(h<\tau_t(a)<\infty\mid\mathcal F_t),
\]
and further to a horizon-tail loss
\[
\Delta_T(H)=\sup_a\sum_{t\le T}\mathbb E[a\,1\{H<\tau_t(a)\le T-t\}].
\]
An even smaller truncation penalty is the comparator gap
\[
\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a)\le\Delta_T(H),
\]
which also suffices for the same reduction. However neither \(\gamma(h)\to0\), \(\Delta_T(H_T)=o(T)\), nor \(\Gamma_T(H_T)=o(T)\) is established as necessary; reports give counterexamples where long positive-payoff tails are sparse, predictable, or process-known.

The main unresolved issue is quantifiers. A true necessity theorem must specify whether "possible" means instance-wise existence of a process-aware learner, a horizon-oblivious process-aware learner, a universal learner over a process class, a minimax/distribution-free guarantee, or a post-history conditional guarantee. Under universal/process-unaware quantifiers there is now an accepted block obstruction: for every randomized learner, even a horizon-aware family, one can choose a deterministic sequence of dominant blocks \(0^{N_i}c_i\), \(c_i\in\{1/2,1\}\), \(M_i=o(N_i)\), such that at endpoints \(T_i=M_i+N_i+1\),
\[
\limsup_i R_{T_i}/T_i\ge 1/4.
\]
The proof is the finite two-continuation indistinguishability argument plus the old-reward cap \(M_i\). This is a class-uniform/minimax lower bound, not an instance-wise characterization.

Iteration 5 generalized the block algebra. For any \(0<c_0<c_1\le1\), the common-prefix two-continuation lower bound has sharp coefficient
\[
\alpha(c_0,c_1)=\frac{c_0(c_1-c_0)}{c_1},
\]
maximized at \(c_0=1/2,c_1=1\). This unifies the finite block and same-path prefix-conflict lemmas; it does not change the quantifier caveats.

There is also an accepted same-path obstruction for process-aware but horizon-oblivious policies. On the deterministic path formed by dominant blocks \(0^{N_i},1/2,1\), with endpoints \(T_i^0=M_i+N_i+1\) and \(T_i^1=M_i+N_i+2\), the same early quotes must serve both prefixes, and
\[
\max\{R_{T_i^0},R_{T_i^1}\}\ge N_i/4-M_i-O(1).
\]
Thus horizon-aware oracle collapse does not extend to anytime policies. Sparse vanishing spikes still show that raw \(\beta\)-failure is not necessary for anytime learnability; the obstruction is prefix incompatibility, not delay length alone.

Iteration 6 made the prefix-compatibility abstraction more concrete. A conditional transfer lemma is valid once the hypotheses are explicit: the policy must have the same conditional prefix action law across candidates, prefix payoffs must factor through that law, the comparator value must include the tested prefix value, outside learner surplus must be capped, and rare prefix events must be probability-weighted. This is a reusable lower-bound bookkeeping lemma, not a characterization.

For zero-block terminal thresholds \(C\), the local gap has the dual form
\[
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\,\Pr_\lambda(C>a)\right),
\]
with strict crossing handled by `sup`/left limits. Any threshold law on \([0,1]\) satisfies \(\mathbb E C-\sup_a a\Pr(C>a)\le 1/e\), approached by an equal-revenue tail.

Iteration 7 promotes the finite-support constant. If \(Z\in[0,1]\) has at most \(m\) positive support points and
\[
\rho(Z)=\sup_{a\in[0,1]}a\Pr(Z>a),
\]
then
\[
\mathbb E Z-\rho(Z)\le \left(\frac{m-1}{m}\right)^m,
\]
with equality for the discrete equal-revenue support \(c_i=r^{m-i}\), \(r=(m-1)/m\), and tail probabilities \(\Pr(Z\ge c_i)=r^{i-1}\). This is local posted-price/LP geometry; zero atoms, support counting, and strict crossing must be handled by conditioning on \(Z>0\) and using left-limit revenues.

The finite multi-continuation terminal-block lift is also accepted for universal/process-unaware lower bounds: for a common zero block and finite threshold set \(C\), some deterministic continuation has regret at least \(N\kappa(C)-M\), where \(M\) caps old rewards. Choosing \(m\)-point equal-revenue menus and diagonalizing \(m\to\infty\) gives a universal terminal-block lower-bound constant approaching \(1/e\). This still does not imply an instance-wise tail characterization.

Iteration 8 closes that bookkeeping for increasing threshold blocks. On a deterministic known path with an old prefix of length \(M\), followed by
\[
0^N,c_1,\ldots,c_m,\qquad 0<c_1<\cdots<c_m\le1,
\]
any process-aware but horizon-oblivious policy satisfies, at horizons \(T_j=M+N+j\),
\[
\max_j R_{T_j}\ge N\kappa(C)-M.
\]
The intermediate threshold-round rewards cancel against the comparator's extra threshold-round opportunities, using `sup` comparators and the single-fill reward convention. Equal-revenue menus with \(m_i\to\infty\) and \(M_i+m_i=o(N_i)\) therefore give one deterministic known path on which every horizon-oblivious policy has \(\limsup_T R_T/T\ge 1/e\). This is a simultaneous-prefix/anytime lower bound, not a raw-tail or instance-wise characterization.

Iteration 9 solves the finite local zero-block game for an arbitrary finite threshold menu \(C=\{0<c_1<\cdots<c_m\}\). With \(c_0=0\), define
\[
F_C(\delta)=\sum_{i=1}^m
\frac{(c_i-\delta)_+-(c_{i-1}-\delta)_+}{c_i}.
\]
There is a unique root \(\delta_*(C)\in[0,c_m]\) with \(F_C(\delta_*)=1\), and
\[
\kappa(C)=\delta_*(C)
\]
as a local infimum value. The primal uses left-limit quotes \(c_i^-\) with weights
\[
q_i=\frac{(c_i-\delta_*)_+-(c_{i-1}-\delta_*)_+}{c_i},
\]
while the dual is a truncated equal-revenue law on the active suffix \(c_i>\delta_*\). Strict crossing means actual actions give only \(\eta\)-implementations unless a left-limit compactification is introduced.

Iteration 9 also gives a matching upper bound for the deterministic/exogenous known-path horizon-oblivious worst case. The universal randomized policy drawing every quote from density \(d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da\) satisfies, for every exogenous deterministic path and every horizon,
\[
R_T\le (T-1)/e.
\]
Indeed, with \(M_{t,T}=\max_{t<s\le T}P_s\), the policy earns \(g_\mu(M_{t,T})=(M_{t,T}-e^{-1})_+\) from quote \(t\), while any fixed comparator earns at most \(\sum_{t<T}M_{t,T}\). Combined with the iteration-8 lower bound, the sharp worst-case constant for randomized horizon-oblivious expected regret on deterministic exogenous paths is \(1/e\). This randomized proof does not cover endogenous/reactive prices and does not by itself handle deterministic-only policy classes; it also does not revive any raw-tail necessity claim.

Iteration 10 derandomizes the known-path upper bound in a nonconstructive sense. A probabilistic-method grid/Hoeffding/Borel-Cantelli argument gives a fixed deterministic quote sequence \(a_t\in(e^{-1},1)\) such that, uniformly over all nonincreasing threshold sequences \(c_1\ge\cdots\ge c_n\),
\[
\sum_{t\le n}a_t1\{a_t<c_t\}
\ge
\sum_{t\le n}(c_t-e^{-1})_+ - O(n^{2/3}\sqrt{\log n}).
\]
Applying this to \(c_t=M_{t,T}\) yields
\[
R_T\le (T-1)/e+O(T^{2/3}\sqrt{\log T})
\]
on every deterministic exogenous path. Hence the sharp worst-case limsup constant is also \(1/e\) for deterministic horizon-oblivious policies, in the existence/nonconstructive sense. This is a strengthening of the known-path anytime theorem only; the original tail-characterization conjecture remains false.

Iteration 11 extends the finite suffix-menu local formula to compact menus. For compact \(C\subset[0,1]\), \(m=\max(C\cap(0,1])\), successor \(s_C(x)=\min(C\cap[x,m])\), and \(\delta(C)\) defined by
\[
\int_{\delta(C)}^m \frac{dx}{s_C(x)}=1,
\]
the left-limit local value is \(\delta(C)\). This yields a path-aware, horizon-oblivious sufficient condition on deterministic exogenous paths:
\[
R_T\le \sum_{t<T}\delta(C_t)+o(T),\qquad
C_t=\overline{\{\max_{t<s\le T'}P_s:T'>t\}}.
\]
It is not necessary: the alternating path \(1/2,1,1/2,1,\ldots\) has \(\sum_{t<T}\delta(C_t)\asymp T\) but admits \(o(T)\) regret by quoting near \(1\).

Iteration 12 replaces the loose suffix-envelope comparison by an exact finite-prefix object for deterministic known exogenous paths. With
\[
M_{t,T}=\max_{t<s\le T}P_s,\qquad
V_T^*=\sup_b\sum_{t<T}b1\{b<M_{t,T}\},
\]
horizon-oblivious randomized expected regret depends only on the time marginals \(\mu_t\):
\[
R_T=V_T^*-\sum_{t<T}\int_{[0,M_{t,T})}x\,d\mu_t(x).
\]
For a finite prefix, the left-limit simultaneous-regret value
\[
D_n(P)=\inf_{\mu_1,\ldots,\mu_{n-1}}\max_{T\le n}
\left[V_T^*-\sum_{t<T}\int_{[0,M_{t,T}]}x\,d\mu_t(x)\right]
\]
has an exact LP dual over horizon weights \(\lambda\). Large \(D_n(P)\) along infinitely many \(n\) gives lower-bound certificates; \(D_n=o(n)\) is necessary but not proved sufficient for an infinite anytime policy because finite-prefix optimizers may be projectively inconsistent. A stronger fixed-envelope compactness criterion is valid in the formal left-limit model: one \(o(T)\)-regret policy exists iff some sublinear envelope \(e_T\) is feasible for every finite-prefix LP. Actual strict-crossing policies follow by posting \((1-\eta_t)A_t\) with \(\sum_{t<T}\eta_t=o(T)\).

Iteration 13 did not prove the gluing conjecture. It added useful structure for attacking it: for fixed \(b\), if \(L_b(T)=\max\{s\le T:P_s>b\}\), then
\[
\sum_{t<T} b1\{b<M_{t,T}\}=b(L_b(T)-1)_+,
\]
and changing only the first \(m\) marginal laws changes every later horizon deficit by at most \(m\). For increasing blocks \(0^N,c_1,\ldots,c_m\), the finite-prefix value satisfies the stress-test bound \(N\kappa(C)\le D_{N+m}\le N\kappa(C)+m\), with exact equality for \(m=2\) in the formal left-limit model. A direct market analogue of the abstract parity obstruction was not found; separated conflicts appear to be diluted by the new quote opportunities that make \(D_n/n\) small. The main open target remains a market-specific localization/gluing theorem, or a genuine market-path separator between \(D_n=o(n)\) and the fixed-envelope criterion.

Iteration 14 confirms that simple separated conflicts are exactly diluted. For
\[
0^N,c_0,0^L,c_1,\qquad 0<c_0<c_1\le1,
\]
the formal finite-prefix value is
\[
D_{N+L+2}=N\,\frac{c_0(c_1-c_0)}{c_1}.
\]
A dual split across early and late horizons has an exact boundary defect
\[
\Phi(u+v)=\Phi(u)+\Phi(v)+
\sum_{t<m}\{f_t(u)+f_t(v)-f_t(u+v)\},
\]
so cross-scale incompatibility is real but cannot be charged to the shorter prefix: the prefix \(0^N,c_0\) has \(D=0\). Finite alphabets give a useful reduced dual using next/last exceedance times, and the one-level case has \(D_n=0\); for two levels there is an exact positive-part formula. No uncrossing/localization theorem is proved yet.

Iteration 15 adds a local two-level damping identity. In the formal left-limit model, for
\[
h^M,0^N,\ell,h,\qquad 0<\ell<h,
\]
with \(n=M+N+2\),
\[
D_n=\bigl[\ell(M+N)-h(M-1)_+\bigr]_+\left(1-\frac{\ell}{h}\right).
\]
Old high prices can therefore eliminate a later low/high conflict when the low-horizon comparator is already high-dominated. The stable \(h^-\) quote has exact regret
\[
[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+,
\]
but this quantity is only the regret of that stable policy, not an intrinsic conflict certificate. The path \(0^N,\ell,0^L,h\), \(L\gg N\), has linear stable-high regret at the low horizon while the low-only prefix has \(D=0\) and the full conflict is only \(N\ell(1-\ell/h)\). The two-level gluing target should use resolved-surplus/debt bookkeeping, not a raw \(Q_T\) dichotomy.

Iteration 16 verifies the post-low extension. In the formal left-limit model,
\[
D_{M+N+L+2}(h^M,0^N,\ell,0^L,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h).
\]
The post-low zero tail contributes no extra local conflict; it only dilutes normalized \(D_n\). An equal-low multi-low drought formula with the last low as the only binding low constraint is promising, but remains candidate until the full LP reduction to \(\ell^-/h^-\) marginals and horizon dominance is written.

Iteration 17 promotes that equal-low formula. For
\[
h^M,0^{N_0},\ell,0^{N_1},\ell,\ldots,0^{N_r},\ell,0^L,h,
\qquad 0<\ell<h,
\]
with last low time \(s_r\) and \(H=(M-1)_+\), the formal left-limit finite-prefix value is
\[
D_n=[\ell(s_r-1)-hH]_+(1-\ell/h).
\]
The proof reduces the LP to cumulative \(\ell^-\)-mass before each low; only the last low and final high are needed for the lower bound. This is equal-low only. Unequal lows already break the last-low rule in the reduced drought LP, so the next target is a full unequal-low reduction or pooling/debt rule.

Iteration 18 promotes the one-drought unequal-low reduction in the formal left-limit model. For
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\qquad 0<\ell_j<h,
\]
the finite-prefix value equals a reduced LP over segment masses \(x_{i,c}\), \(c\in\mathcal L=\{\ell_1,\ldots,\ell_r\}\), with low-horizon constraints determined by segment running maxima \(m_{i,j}=\max_{q=i+1,\ldots,j}\ell_q\) and final-high debt \(\sum(h-c)x_{i,c}\). This gives an exact local theorem, not a closed form and not a gluing theorem. The path \(0,0.4,0.9,1\) has \(D_4=68/225\), confirming that unequal lows can make earlier low horizons bind and refuting the naive last-low-only rule as a full finite-prefix statement.

Iteration 19 promotes the exact two-unequal-low closed form for the accepted one-drought LP. With \(p=\ell_1\), \(q=\ell_2\), \(B_0=N_0+\mathbf 1_{\{M\ge1\}}\), \(B_1=N_1+1\), \(H=(M-1)_+\), and \(S_j=V^*_{s_j}-hH\), assume the path-feasibility relations \(0\le S_1\le S_2\), \(S_1\le pB_0\), and \(S_2/h\le B_0+B_1\). If \(p<q\) and \(\theta=(h-q)S_2/h\), then
\[
D_n=
\begin{cases}
\theta, & S_1\le \theta,\\
\bigl((q-p)S_1+p\theta\bigr)/q, & \theta<S_1\le \theta+qB_0,\\
S_1-pB_0, & S_1>\theta+qB_0.
\end{cases}
\]
If \(p>q\), then
\[
D_n=
\begin{cases}
(h-p)S_2/h, & S_2/h\le B_0,\\
\max\{S_1-pB_0,\ (h-q)S_2/h-(p-q)B_0\}, & S_2/h>B_0.
\end{cases}
\]
The boundary \(p=q\) is handled by the equal-low theorem. This remains a local formal-left-limit result. The broader pooling/PAVA route is still only a candidate: complementary slackness gives a valid support rule for the CL-049 dual, and the three-low path \(0,0.2,0^8,0.3,0,0.4,1\) has certified value \(291/100\), but no scalar merge rule or repeated-drought gluing theorem is proved.

Iteration 20 promotes the strictly increasing-low one-drought closed form. For
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ldots,\ell_r,0^L,h,
\qquad 0<\ell_1<\cdots<\ell_r<h,
\]
set \(H=(M-1)_+\), \(B_0=N_0+\mathbf 1_{\{M\ge1\}}\), \(B_i=N_i+1\), \(C_j=\sum_{i<j}B_i\), \(S_j=[\ell_j(H+C_j)-hH]_+\), \(S_0=0\), and \(\Delta_j=S_j-S_{j-1}\). Then in the formal left-limit model
\[
D_n=\max_k\left[
\left(1-\frac{\ell_k}{h}\right)S_k+
\sum_{j>k}\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j
\right].
\]
The proof uses a zero-pressure dual certificate plus a nested Hall scheduling argument. The theorem is path-feasible and strictly increasing-low only; duplicate/nonmonotone lows, repeated droughts, and global \(D_n=o(n)\Rightarrow o(T)\) gluing remain open.
