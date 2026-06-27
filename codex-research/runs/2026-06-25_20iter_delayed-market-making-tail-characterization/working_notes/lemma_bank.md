# Lemma Bank

## LB-001: Downward Grid Discretization

For \(\mathcal G_K=\{0,1/K,\ldots,(K-1)/K\}\), round any \(a\in[0,1]\) down to \(b(a)\in\mathcal G_K\). Since \(b\le a\), every future price exceeding \(a\) also exceeds \(b\), and
\[
r_t^H(a)\le r_t^H(b)+1/K.
\]
Therefore \(R_T^H\le R_{T,K}^H+T/K\). This is accepted.

## LB-002: Bounded-Delay Full-Information Experts By Residues

If each reward vector in \([0,1]^K\) is revealed after at most \(H\) rounds, split time into \(H+1\) residue classes and run independent full-information Hedge instances. On each class, previous rewards have matured before the next action in the class. Summing the per-class regrets and applying Cauchy-Schwarz gives
\[
R_{T,K}^H=O(\sqrt{T(H+1)\log K}).
\]
Status: accepted as standard/provable, but final writeup should state adversary/adaptivity conventions.

## LB-003: Weighted Truncation

For fixed \(H\),
\[
0\le r_t(a)-r_t^H(a)=a\,1\{H<\tau_t(a)\le T-t\}
\le a\,1\{H<\tau_t(a)<\infty\}.
\]
Taking conditional expectations and using \(\gamma(H)\) gives
\[
R_T\le R_T^H+T\gamma(H).
\]
Status: accepted.

## LB-004: Horizon-Tail Truncation

Let
\[
\Delta_T(H)=\sup_a\sum_{t\le T}\mathbb E[a\,1\{H<\tau_t(a)\le T-t\}].
\]
For every fixed comparator \(a\), truncation loses exactly the summand above, while the learner's true reward pathwise dominates its truncated reward. Hence
\[
R_T\le R_T^H+\Delta_T(H).
\]
Combining with LB-001 and LB-002 gives the \(\Delta_T\)-sufficiency bound. Status: accepted.

## LB-005: Positive-Scale Equivalence

For
\[
\beta_\epsilon(h)=\sup_t\sup_{a\in[\epsilon,1]}\operatorname*{ess\,sup}_{\mathcal F_t}
\Pr(h<\tau_t(a)<\infty\mid\mathcal F_t),
\]
\[
\gamma(h)\to0\quad\Longleftrightarrow\quad
\forall\epsilon>0,\ \beta_\epsilon(h)\to0.
\]
Status: accepted.

## LB-006: Sparse Vanishing-Spike Counterexample

Let \(s_n=2^n\), \(P_{s_n}=U_n/s_n\), \(P_t=0\) otherwise. Then at \(t=s_n\), \(a=0\) has \(\tau_{s_n}(0)=s_{n+1}-s_n=2^n\) almost surely, so \(\beta(h)=1\) for all \(h\). For fixed \(a>0\), if \(m^*=\max\{m:s_m\le T,\ a<1/s_m\}\) exists, only \(t<s_{m^*}\) can earn and \(\mathbb E\sum_t r_t(a)\le a s_{m^*}<1\); if it does not exist, reward is zero. Thus \(R_T\le1\) for the always-zero learner. Status: accepted.

## LB-007: Comparator-Gap Truncation

Let
\[
V_T(a)=\mathbb E\sum_{t\le T}r_t(a),
\qquad
V_T^H(a)=\mathbb E\sum_{t\le T}r_t^H(a),
\]
and
\[
\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a).
\]
Since the learner's true reward pathwise dominates its truncated reward,
\[
R_T
=\sup_a V_T(a)-\mathbb E\sum_t r_t(a_t)
\le
\sup_a V_T(a)-\mathbb E\sum_t r_t^H(a_t)
=R_T^H+\Gamma_T(H).
\]
Moreover \(\Gamma_T(H)\le\Delta_T(H)\). Status: accepted; still only sufficient, not known necessary.

## LB-008: Horizon/Process-Aware Pseudo-Regret Collapse

For an exogenous policy-independent law \(P\), define
\[
V_T^P(a)=\mathbb E_P\sum_{t=1}^T r_t(a),
\qquad
V_T^{*,P}=\sup_{a\in[0,1]}V_T^P(a).
\]
For every \(\varepsilon>0\), choose \(a_{T,\varepsilon}\) with
\[
V_T^P(a_{T,\varepsilon})\ge V_T^{*,P}-\varepsilon.
\]
The deterministic policy that posts \(a_{T,\varepsilon}\) every round has pseudo-regret at most \(\varepsilon\). This uses the problem's \(\sup_a\mathbb E-\mathbb E\) regret, law and horizon awareness, and no computability constraint. Status: accepted.

## LB-009: Two-Continuation Finite-Block Lower Bound

Let \(I_c^N\) have \(N\) zeros followed by terminal price \(c\in\{1/2,1\}\). For the first \(N\) rounds the two instances are observationally identical. If
\[
G_c=\mathbb E_\pi\sum_{t=1}^N A_t\,1\{A_t<c\},
\]
then \(R_{1/2}=N/2-G_{1/2}\) and \(R_1=N-G_1\), with comparator values interpreted as suprema. For every \(a\in[0,1]\),
\[
\frac12 a1\{a<1/2\}+\frac12 a1\{a<1\}\le\frac12,
\]
so \((G_{1/2}+G_1)/2\le N/2\) and therefore
\[
\sup_{c\in\{1/2,1\}}R^\pi(I_c^N)\ge\frac{R_{1/2}+R_1}{2}\ge N/4.
\]
An epsilon version comparing to \(1/2-\eta\) and \(1-\eta\) gives \(N(1/4-\eta)\). Status: accepted for universal/minimax lower-bound use.

## LB-010: Conditional Two-Continuation With Prefix Cap

Fix a deterministic prefix of length \(M\), then append \(N\) zeros and one terminal continuation \(c\in\{1/2,1\}\). Couple the two continuations using the same learner random seed. During the \(N\) zero rounds the histories are identical, so the current-block actions \(A_1,\ldots,A_N\) have the same law under both continuations. The LB-009 calculation gives one continuation with current-block regret at least \(N/4\) relative to the current-block comparator supremum.

At the endpoint, all learner rewards attributable to actions posted in the previous prefix are at most \(M\), since each previous action can pay at most once and rewards are bounded by \(1\). Therefore the selected continuation satisfies the crude but useful endpoint lower bound
\[
R_T\ge N/4-M
\]
when the total comparator is lower-bounded using only the current block. Status: accepted proof fragment; the infinite concatenation theorem is now recorded as LB-012 under universal/process-unaware quantifiers.

## LB-011: Same-Path Two-Horizon Incompatibility

Consider the deterministic path
\[
P_1=\cdots=P_N=0,\qquad P_{N+1}=1/2,\qquad P_{N+2}=1.
\]
For any horizon-oblivious policy, the first \(N\) actions are the same whether regret is evaluated at \(T_0=N+1\) or \(T_1=N+2\). Define
\[
G_0=\mathbb E\sum_{t=1}^N A_t1\{A_t<1/2\},
\qquad
G_1=\mathbb E\sum_{t=1}^N A_t1\{A_t<1\}.
\]
For every action \(a\),
\[
a1\{a<1/2\}+a1\{a<1\}\le1,
\]
so \(G_0+G_1\le N\). Using \(\eta\)-comparators, the two regrets obey
\[
R_{N+1}+R_{N+2}\ge N(1/2-2\eta)-O(1),
\]
where the \(O(1)\) term covers endpoint actions such as the quote posted at time \(N+1\). Hence one of the two prefix regrets is at least \(N(1/4-\eta)-O(1)\). Status: accepted finite lemma for horizon-oblivious policies; the dominant-block concatenation is now recorded as LB-013.

## LB-012: Concatenated Universal Block Lower Bound

Fix a randomized process-unaware learner, or a process-unaware horizon-aware family \((\pi_T)_T\). Choose block lengths with
\[
M_i=\sum_{j<i}(N_j+1)=o(N_i).
\]
After blocks \(1,\ldots,i-1\) are fixed, compare the two continuations
\[
\text{prefix},0^{N_i},1/2
\qquad\text{and}\qquad
\text{prefix},0^{N_i},1
\]
at the same endpoint \(T_i=M_i+N_i+1\), using the same learner randomness and the same horizon-indexed policy if applicable. During the \(N_i\) zero rounds the histories coincide. If
\[
G_c=\mathbb E\sum_{s=1}^{N_i} A_s1\{A_s<c\},
\]
then \(G_{1/2}+G_1\le N_i\), so one continuation has current-block regret at least \(N_i/4\) relative to the current-block comparator supremum. Rewards from earlier actions are at most \(M_i\). Recursively choosing the worse continuation gives a single deterministic block sequence with
\[
R_{T_i}\ge N_i/4-M_i,\qquad
\limsup_i R_{T_i}/T_i\ge1/4.
\]
Status: accepted for expected regret under universal/process-unaware quantifiers. Not valid against process-aware learners that know the constructed sequence/law. Use \(\sup\) or \(\eta\)-comparators for strict crossing.

## LB-013: Concatenated Same-Path Horizon-Oblivious Lower Bound

Let
\[
M_i=\sum_{j<i}(N_j+2)=o(N_i),
\]
and define one deterministic path by blocks
\[
P_{M_i+1},\ldots,P_{M_i+N_i}=0,\quad
P_{M_i+N_i+1}=1/2,\quad
P_{M_i+N_i+2}=1.
\]
For a process-aware but horizon-oblivious policy, the zero-block actions are the same random variables when regret is evaluated at
\[
T_i^0=M_i+N_i+1,\qquad T_i^1=M_i+N_i+2.
\]
With
\[
X_i=\mathbb E\sum_{t=M_i+1}^{M_i+N_i}A_t1\{A_t<1/2\},\qquad
Y_i=\mathbb E\sum_{t=M_i+1}^{M_i+N_i}A_t1\{A_t<1\},
\]
we have \(X_i+Y_i\le N_i\). The current-block comparator values are \(N_i/2\) and \(N_i\) as suprema; previous learner rewards contribute at most \(M_i\) at each endpoint, and the quote posted at the intermediate \(1/2\) contributes at most \(1\) by \(T_i^1\). Hence
\[
R_{T_i^0}\ge N_i/2-M_i-X_i,
\qquad
R_{T_i^1}\ge N_i-M_i-1-Y_i,
\]
and therefore
\[
\max\{R_{T_i^0},R_{T_i^1}\}\ge N_i/4-M_i-O(1).
\]
If \(M_i/N_i\to0\), then \(\limsup_T R_T/T\ge1/4\). Status: accepted for horizon-oblivious expected-regret policies; false if the policy receives the evaluation horizon.

## LB-014: General Two-Threshold Block Lemma

Let \(0<c_0<c_1\le1\). Consider two finite instances consisting of \(N\) common zero prices followed by terminal price \(c_j\), \(j\in\{0,1\}\). Suppose the learner's first \(N\) actions have the same joint law under the two continuations. With comparator values interpreted as suprema,
\[
\max\{R_{c_0},R_{c_1}\}
\ge
N\frac{c_0(c_1-c_0)}{c_1}.
\]

Proof: set
\[
\lambda_0=\frac{c_1-c_0}{c_1},\qquad
\lambda_1=\frac{c_0}{c_1}.
\]
For every \(a\in[0,1]\),
\[
\lambda_0 a1\{a<c_0\}+\lambda_1 a1\{a<c_1\}\le c_0.
\]
The weighted comparator value per zero-round is
\[
\lambda_0 c_0+\lambda_1 c_1
=c_0+\frac{c_0(c_1-c_0)}{c_1}.
\]
Thus \(\lambda_0R_{c_0}+\lambda_1R_{c_1}\ge N c_0(c_1-c_0)/c_1\), and the maximum regret is at least the same number. For fixed \(c_1\), the coefficient is maximized at \(c_0=c_1/2\); globally it is maximized at \(c_1=1\), giving \(1/4\). Status: accepted; specializes to LB-009 and LB-011.

Concatenation corollaries: after a prefix of length \(M_i\), the universal/process-unaware construction gives
\[
R_{T_i}\ge N_i\frac{c_0(c_1-c_0)}{c_1}-M_i
\]
for a recursively chosen continuation. The same-path horizon-oblivious construction on blocks \(0^{N_i},c_0,c_1\) gives the analogous paired-prefix lower bound. In a polished `sup` proof the intermediate-round \(O(1)\) term can likely be removed by including the comparator's intermediate quote, whose supremum payoff \(c_1\) cancels the learner's possible intermediate payoff bounded by \(c_1\); the cruder \(O(1)\) bound remains safe.

## LB-015: Prefix-Compatibility LP Candidate

For a finite action grid and finite candidate set \(\mathcal U\), define a common-prefix simultaneous-payoff gap
\[
\kappa_I(\mathcal U)=\frac1{|I|}\inf_{\mu_t}\sup_{u\in\mathcal U}
\left[
v_u-\sum_{t\in I}\int \phi_{u,t}(a)\,d\mu_t(a)
\right],
\]
where \(\phi_{u,t}(a)\) is the conditional expected payoff of posting \(a\) at prefix time \(t\) under candidate \(u\), and
\[
v_u=\sup_b\sum_{t\in I}\phi_{u,t}(b).
\]
On homogeneous zero blocks, \(\phi_{u,t}=\phi_u\), the dual candidate is
\[
\kappa(\mathcal U)=
\max_{\lambda\in\Delta(\mathcal U)}
\left[
\sum_u\lambda_u v_u-\sup_a\sum_u\lambda_u\phi_u(a)
\right],
\]
first on finite grids, then by \(\eta\)-comparator/limit arguments for strict thresholds.

For \(\mathcal U=\{c_0,c_1\}\) with \(\phi_c(a)=a1\{a<c\}\), the dual yields
\[
\kappa(\{c_0,c_1\})=\frac{c_0(c_1-c_0)}{c_1}.
\]

Status: promising but not accepted as a global characterization. A regret-transfer lemma needs the same prefix action law across candidates and an outside-surplus cap \(B_u\):
\[
R_{T_u}\ge |I|\kappa_I(\mathcal U)-B_u
\]
for at least one candidate, under appropriate indistinguishability. Rare prefix events must be weighted by their probability in expected regret.

## LB-016: Conditional Kappa Transfer

Let \(\mathcal U\) be finite, \(I\) a tested prefix, and \(E_u\) a common-prefix event under candidate \(u\) with probability \(p_u\). Define
\[
\phi_{u,t}(a)=\mathbb E_u[r_t(a)\mid E_u],
\qquad
v_u=\sup_b\sum_{t\in I}\phi_{u,t}(b),
\]
over the same action domain being lower-bounded. Suppose the learner has common conditional prefix action laws \(\mu_t\) across all \(u\), and the stronger payoff factorization
\[
\mathbb E_u[1_{E_u}r_t(A_t)]
=p_u\int\phi_{u,t}(a)\,d\mu_t(a).
\]
Suppose also that \(V_u^*\ge p_uv_u+C_u\) and the learner's expected reward outside the tested prefix-on-\(E_u\) is at most \(C_u+B_u\). Then
\[
R_u\ge p_u\left[v_u-\sum_{t\in I}\int\phi_{u,t}(a)\,d\mu_t(a)\right]-B_u.
\]
If \(p_u\ge p\), \(B_u\le B\), and
\[
\kappa_I(\mathcal U)=\frac1{|I|}\inf_{\mu_t}\sup_u
\left[v_u-\sum_{t\in I}\int\phi_{u,t}(a)\,d\mu_t(a)\right]\ge0,
\]
then
\[
\max_u R_u\ge p\,|I|\kappa_I(\mathcal U)-B.
\]
Status: accepted as a conditional bookkeeping lemma. Same action marginals alone are insufficient unless the payoff factorization is true. The action domain must match the learner or be handled by a dense-grid/\(\eta\)-comparator limit.

## LB-017: Multi-Threshold Zero-Block LP Duality

For a zero block followed by a terminal threshold \(c\in C\subset(0,1]\), the local continuum prefix gap is
\[
\kappa(C)=
\inf_{\mu\in\Delta([0,1])}\sup_{c\in C}
\left[c-\int a1\{a<c\}\,d\mu(a)\right].
\]
For a finite action grid \(A\), finite LP duality gives
\[
\kappa_A(C)=
\max_{\lambda\in\Delta(C)}
\left[\mathbb E_\lambda C-\max_{a\in A}a\,\Pr_\lambda(C>a)\right].
\]
Taking dense-grid/left-limit suprema gives the continuum formula
\[
\kappa(C)=
\max_{\lambda\in\Delta(C)}
\left[\mathbb E_\lambda C-\sup_{a\in[0,1]}a\,\Pr_\lambda(C>a)\right].
\]
For any law \(C\in[0,1]\), with \(R=\sup_a a\Pr(C>a)\),
\[
\mathbb E C=\int_0^1\Pr(C>x)\,dx
\le R+R\log(1/R),
\]
and therefore
\[
\mathbb E C-R\le R\log(1/R)\le 1/e.
\]
When \(R=0\), this is interpreted as the trivial \(C=0\) almost surely case.
The bound is approached by the truncated equal-revenue tail
\[
\Pr(C>x)=1\quad (x<1/e),\qquad
\Pr(C>x)=1/(ex)\quad (1/e\le x<1),
\]
with an atom at \(1\). Status: accepted as local LP/minimax geometry only. The dual distribution is not itself a hard stochastic process under \(\sup_a\mathbb E-\mathbb E\) pseudo-regret.

## LB-018: Finite-\(m\) Equal-Revenue Theorem

For \(m\ge1\), let \(Z\in[0,1]\) have at most \(m\) positive support points and define
\[
\rho(Z)=\sup_{a\in[0,1]}a\Pr(Z>a).
\]
If \(k\le m\) is the number of positive support points, then
\[
\mathbb EZ-\rho(Z)\le \left(\frac{k-1}{k}\right)^k
\le \left(\frac{m-1}{m}\right)^m,
\]
where the \(k=1\) value is \(0\). The bound for \(m\) is attained for \(m\ge2\) by the discrete equal-revenue law
\[
r=\frac{m-1}{m},\qquad c_i=r^{m-i},\qquad \Pr(Z\ge c_i)=r^{i-1},\qquad i=1,\ldots,m.
\]
For this law the left-limit posted-price revenue is \(r^{m-1}\) throughout the relevant support intervals and
\[
\mathbb EZ-r^{m-1}=r^m=\left(\frac{m-1}{m}\right)^m.
\]

Proof skeleton: zero atoms are harmless because conditioning on \(Z>0\) scales both \(\mathbb EZ\) and \(\rho(Z)\). Scaling by the top positive support scales the gap. After these reductions, replacing \(Z\) by \(\max\{Z,\rho(Z)\}\) increases \(\mathbb EZ\), preserves the positive support count, and does not increase \(\rho\). Thus write the support as
\[
\rho=c_1<c_2<\cdots<c_k=1.
\]
With \(p_i=\Pr(Z\ge c_i)\), strict crossing gives \(c_ip_i\le\rho\) as a left-limit revenue bound. Hence
\[
\mathbb EZ
=c_1+\sum_{i=2}^k(c_i-c_{i-1})p_i
\le
\rho+\rho\sum_{i=2}^k\left(1-\frac{c_{i-1}}{c_i}\right).
\]
Set \(y_i=c_{i-1}/c_i\). Since \(\prod_{i=2}^k y_i=\rho\), AM-GM gives \(\sum y_i\ge (k-1)\rho^{1/(k-1)}\). Maximizing
\[
\rho(k-1)\left(1-\rho^{1/(k-1)}\right)
\]
over \(\rho\in[0,1]\) gives the stated constant. Status: accepted local posted-price geometry; not a stochastic hard instance under pseudo-regret.

## LB-019: Finite Multi-Continuation Terminal Block

Let \(C\subset(0,1]\) be finite and consider deterministic terminal-block instances \(0^N,c\), \(c\in C\). Suppose the learner's first \(N\) action law is common across all continuations. Define
\[
\kappa(C)=
\max_{\lambda\in\Delta(C)}
\left[
\mathbb E_\lambda C-\sup_{a\in[0,1]}a\Pr_\lambda(C>a)
\right].
\]
For each fixed continuation \(c\), the zero-block comparator value is \(Nc\) as a supremum. If \(\mu_t\) is the common law of the learner's \(t\)-th zero-block quote, then averaging regret with any \(\lambda\in\Delta(C)\) gives
\[
\sum_c\lambda_c R_c
\ge
N\mathbb E_\lambda C
-
\sum_{t=1}^N
\int a\Pr_\lambda(C>a)\,d\mu_t(a)
\ge
N\kappa(C).
\]
Therefore \(\max_{c\in C}R_c\ge N\kappa(C)\). After a fixed old prefix of length \(M\), the same proof gives \(N\kappa(C)-M\) by capping all old learner rewards by \(M\).

Specializing to the \(m\)-point equal-revenue set in LB-018 yields the constant \(((m-1)/m)^m\). In a universal/process-unaware dominant-block construction, recursively selecting a worst continuation gives
\[
R_{T_i}\ge N_i\left(\frac{m-1}{m}\right)^m-M_i.
\]
If \(m=m_i\to\infty\) and \(M_i/N_i\to0\), the lower-bound constant approaches \(1/e\). Status: accepted for universal/process-unaware terminal-block lower bounds; use `sup`/left-limit or \(\eta\)-comparator conventions for strict crossing.

## LB-020: Same-Path Multi-Threshold Anytime Lift

Let an arbitrary deterministic old prefix have length \(M\), then append
\[
0^N,c_1,\ldots,c_m,\qquad 0<c_1<\cdots<c_m\le1.
\]
Set \(T_j=M+N+j\). Consider one horizon-oblivious policy, possibly process-aware and randomized, whose zero-block actions \(A_1,\ldots,A_N\) are the same random variables for all evaluations \(T_j\). Regret is against comparator suprema, and each quote pays at most once.

For each \(j\),
\[
R_{T_j}\ge
N c_j-\mathbb E\sum_{s=1}^N A_s1\{A_s<c_j\}-M.
\]
Indeed, a fixed quote \(a\uparrow c_j\) earns supremum \((N+j-1)c_j\) from the \(N\) zero-block posts and the \(j-1\) earlier threshold-round posts. The learner's reward by \(T_j\) is at most \(M\) from the old prefix, plus
\[
\mathbb E\sum_{s=1}^N A_s1\{A_s<c_j\}
\]
from the current zero block, plus \((j-1)c_j\) from the earlier threshold-round posts. The latter term cancels the comparator's extra threshold-round value.

For any \(\lambda\in\Delta(C)\),
\[
\sum_j\lambda_j R_{T_j}
\ge
N\mathbb E_\lambda C
-
\sum_{s=1}^N
\mathbb E[A_s\Pr_\lambda(C>A_s)]
-M
\ge
N\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right)-M.
\]
Optimizing over \(\lambda\) gives
\[
\max_j R_{T_j}\ge N\kappa(C)-M.
\]
Status: accepted for same-path horizon-oblivious lower bounds. The increasing order of thresholds is essential; otherwise the effective threshold by \(T_j\) is \(\max_{\ell\le j}c_\ell\), not \(c_j\). Horizon-aware policies, comparator `max`, or repeated-fill rewards invalidate the stated proof.

## LB-021: Same-Path Equal-Revenue Diagonal Corollary

Let \(m_i\to\infty\), \(r_i=(m_i-1)/m_i\), and
\[
c_{i,j}=r_i^{m_i-j},\qquad j=1,\ldots,m_i.
\]
Build one deterministic path by concatenating blocks \(0^{N_i},c_{i,1},\ldots,c_{i,m_i}\). With
\[
M_i=\sum_{\ell<i}(N_\ell+m_\ell),
\]
choose \(N_i\) so that \((M_i+m_i)/N_i\to0\). Applying LB-020 and LB-018 to block \(i\) gives some \(j_i\) with
\[
R_{M_i+N_i+j_i}
\ge
N_i r_i^{m_i}-M_i.
\]
Since \(M_i+N_i+j_i\le M_i+N_i+m_i\) and \(r_i^{m_i}\to1/e\),
\[
\limsup_T R_T/T\ge1/e.
\]
Status: accepted for process-aware but horizon-oblivious expected-regret policies on this deterministic known path. This is the lower-bound half of the sharp randomized worst-case \(1/e\) theorem; LB-024 supplies the matching upper bound. It is not a full path-dependent characterization.

## LB-022: Equal-Revenue Primal Zero-Block Certificate

For the \(m\)-point equal-revenue menu in LB-018, the local zero-block game is tight from the primal side. Let \(r=(m-1)/m\), \(c_i=r^{m-i}\), and use the action law that is uniform over quotes \(a_i\uparrow c_i\). For threshold \(c_j\),
\[
\frac1m\sum_{i\le j}c_i
=c_j-r^m,
\]
so the zero-block deficit is \(r^m=((m-1)/m)^m\) for every \(j\), matching the dual value. Status: accepted as a finite equal-revenue local certificate with the usual left-limit convention; LB-023 generalizes the primal optimizer to arbitrary finite \(C\).

## LB-023: Explicit Finite-Menu Local Formula

Let \(C=\{0<c_1<\cdots<c_m\}\), set \(c_0=0\), and define
\[
F_C(\delta)=\sum_{i=1}^m
\frac{(c_i-\delta)_+-(c_{i-1}-\delta)_+}{c_i}.
\]
Then \(F_C\) has a unique root \(\delta_*=\delta_*(C)\in[0,c_m]\) with \(F_C(\delta_*)=1\). The local zero-block value is
\[
\kappa(C)=
\inf_{\mu\in\Delta([0,1])}\sup_{c\in C}
\left[c-\int a1\{a<c\}\,d\mu(a)\right]
=\delta_*,
\]
with values understood as left limits or as infima over \(\eta\)-quotes below thresholds.

Upper bound: put formal mass
\[
q_i=\frac{(c_i-\delta_*)_+-(c_{i-1}-\delta_*)_+}{c_i}
\]
on \(c_i^-\). Since \(\sum_iq_i=F_C(\delta_*)=1\), this is a probability law in the left-limit compactification. For threshold \(c_j\),
\[
\sum_{i\le j}q_i c_i=(c_j-\delta_*)_+,
\]
so the deficit is \(\min\{c_j,\delta_*\}\le\delta_*\). Actual actions \(c_i-\eta_i\) give the same bound up to \(o(1)\).

Lower bound: let \(k=\min\{i:c_i>\delta_*\}\). On the active suffix define
\[
\Pr(Z\ge c_i)=c_k/c_i,\qquad i\ge k.
\]
Then the left-limit posted-price revenue is \(\rho(Z)=c_k\), and tail summation plus \(F_C(\delta_*)=1\) gives \(\mathbb EZ=c_k+\delta_*\). The LP dual formula LB-017 gives \(\kappa(C)\ge\mathbb EZ-\rho(Z)=\delta_*\).

Boundary checks: for \(m=1\), \(\delta_*=0\) and the value is an infimum; for \(C=\{c,d\}\), \(\delta_*=c(d-c)/d\); if \(\delta_*=c_r\), thresholds \(c_j\le\delta_*\) are nonbinding and the active suffix begins at the first \(c_i>\delta_*\). Status: accepted local geometry.

## LB-024: Suffix-Max Representation And Universal Equal-Revenue Upper Bound

For a deterministic exogenous path and horizon \(T\), define
\[
M_{t,T}=\max_{t<s\le T}P_s.
\]
Under the single-fill reward convention,
\[
r_t(a;T)=a1\{M_{t,T}>a\}.
\]
For a quote distribution \(\mu_t\), write
\[
g_{\mu_t}(c)=\int_{[0,c)}a\,d\mu_t(a).
\]
The learner's expected reward from quote \(t\) by horizon \(T\) is \(g_{\mu_t}(M_{t,T})\).

The universal equal-revenue distribution
\[
d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da
\]
has
\[
g_\mu(c)=0\quad(c\le e^{-1}),\qquad
g_\mu(c)=c-e^{-1}\quad(c>e^{-1}).
\]
Therefore \(c-g_\mu(c)\le e^{-1}\) for all \(c\in[0,1]\). Since
\[
\sup_a\sum_{t<T}a1\{M_{t,T}>a\}\le\sum_{t<T}M_{t,T},
\]
the policy satisfies
\[
R_T\le\sum_{t<T}\left(M_{t,T}-g_\mu(M_{t,T})\right)\le (T-1)/e.
\]
Status: accepted for exogenous deterministic paths and randomized expected regret. By conditioning on the realized path, the same upper bound applies to exogenous stochastic paths. It is not valid for price processes that react to the realized quote.

## LB-025: Local Suffix-Menu Upper Bound

For a deterministic exogenous path, let
\[
C_t=\{M_{t,T'}:T'>t\}.
\]
If the learner chooses \(\mu_t\) satisfying
\[
g_{\mu_t}(c)\ge c-\delta_t
\quad\text{for every }c\in C_t,
\]
then for every horizon
\[
R_T\le\sum_{t<T}\delta_t.
\]
Indeed,
\[
\mathbb E\sum_{t<T}r_t(A_t;T)
=\sum_{t<T}g_{\mu_t}(M_{t,T})
\ge\sum_{t<T}M_{t,T}-\sum_{t<T}\delta_t,
\]
while the fixed comparator supremum is at most \(\sum_{t<T}M_{t,T}\). For finite menus, the best \(\delta_t\) is \(\delta_*(C_t)\) from LB-023. Compact menus are handled by LB-028/LB-029 with left-limit/\(\eta\)-implementation conventions. Status: accepted as a conditional upper lemma; noncompact menus and computable selectors remain open.

## LB-026: Monotone-Threshold Deterministic Derandomization

Let \(\mu\) be the equal-revenue law
\[
d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da,
\qquad
g(c)=\mathbb E_\mu[A1\{A<c\}]=(c-e^{-1})_+.
\]
There exists a deterministic sequence \(a_1,a_2,\ldots\in(e^{-1},1)\) and a finite constant \(C\) such that for every \(n\) and every nonincreasing \(c_1\ge\cdots\ge c_n\in[0,1]\),
\[
\sum_{t=1}^n a_t1\{a_t<c_t\}
\ge
\sum_{t=1}^n g(c_t)-C n^{2/3}\sqrt{\log(n+2)}.
\]

Proof skeleton. Draw \(A_t\stackrel{iid}{\sim}\mu\). For fixed \(n\), set \(m_n=\lceil n^{1/3}\rceil\) and let \(\mathcal D_{n,m}\) be all nonincreasing sequences in the grid \(\{0,1/m,\ldots,1\}\). Then
\[
|\mathcal D_{n,m}|\le {n+m\choose m}.
\]
For fixed \(d\in\mathcal D_{n,m}\), the variables
\[
X_t(d)=A_t1\{A_t<d_t\}
\]
are independent and lie in \([0,1]\), with mean \(g(d_t)\). Hoeffding gives
\[
\Pr\left\{
\sum_t X_t(d)<\sum_t g(d_t)-u
\right\}\le \exp(-2u^2/n).
\]
Choose
\[
u_n=\sqrt{\frac n2\left(\log|\mathcal D_{n,m_n}|+4\log(n+2)\right)}.
\]
A union bound gives failure probability at most \((n+2)^{-4}\), hence summable. By Borel-Cantelli, with positive probability all but finitely many grid events hold. Freeze one realization satisfying them and absorb the finitely many exceptional \(n\)'s into \(C\).

For arbitrary nonincreasing \(c_t\), set \(d_t=\lfloor m_nc_t\rfloor/m_n\). Then \(d_t\le c_t\), \(c_t-d_t\le1/m_n\),
\[
a_t1\{a_t<c_t\}\ge a_t1\{a_t<d_t\},
\qquad
g(d_t)\ge g(c_t)-1/m_n.
\]
Thus the total loss is \(u_n+n/m_n=O(n^{2/3}\sqrt{\log n})\).

Status: accepted as a nonconstructive probabilistic-method lemma. A bracketing-entropy proof may improve the displayed rate to \(O(n^{2/3})\), but that sharper rate is not needed and should be treated as optional until written.

## LB-027: Deterministic \(1/e\) Known-Path Upper Bound

Let \(a_t\) be a deterministic sequence from LB-026. For any deterministic exogenous path and horizon \(T\), define
\[
M_{t,T}=\max_{t<s\le T}P_s,\qquad t<T.
\]
Under the single-fill reward convention,
\[
r_t(a_t;T)=a_t1\{a_t<M_{t,T}\}.
\]
The sequence \(M_{1,T}\ge\cdots\ge M_{T-1,T}\) is nonincreasing, so LB-026 gives
\[
\sum_{t<T}r_t(a_t;T)
\ge
\sum_{t<T}g(M_{t,T})-C T^{2/3}\sqrt{\log(T+2)}.
\]
For any fixed comparator \(a\),
\[
\sum_{t<T}a1\{a<M_{t,T}\}\le \sum_{t<T}M_{t,T},
\]
and for every \(c\in[0,1]\), \(c-g(c)\le e^{-1}\). Therefore
\[
R_T\le (T-1)/e+C T^{2/3}\sqrt{\log(T+2)}.
\]
Status: accepted for deterministic exogenous paths, horizon-oblivious deterministic policies, `sup` comparators, strict crossing, and single-fill rewards. By conditioning on the realized path, the same pathwise upper bound yields the corresponding exogenous stochastic pseudo-regret bound. It is not valid for endogenous/reactive prices.

## LB-028: Compact Suffix-Menu Local Formula

Let \(C\subset[0,1]\) be compact. If \(C_+=C\cap(0,1]\) is empty, set \(\delta(C)=0\). Otherwise let \(m=\max C_+\) and
\[
s_C(x)=\min(C_+\cap[x,m]),\qquad x\in(0,m].
\]
There is a unique \(\delta=\delta(C)\in[0,m]\) with
\[
\int_\delta^m \frac{dx}{s_C(x)}=1,
\]
where the integral is improper at \(0\) when needed. Moreover \(\delta\le m/e\).

In the formal left-limit action space,
\[
\inf_{\nu\in\Delta([0,1])}\sup_{c\in C_+}
\left(c-\int_{[0,c]}x\,d\nu(x)\right)=\delta(C).
\]

Upper certificate: draw \(X\) on \([\delta,m]\) with density \(1/s_C(x)\,dx\), and post the formal quote \(s_C(X)^-\). For \(c\in C_+\),
\[
\mathbb E[s_C(X)1\{s_C(X)\le c\}]=(c-\delta)_+,
\]
so the deficit is at most \(\delta\). Actual strict-crossing quotes \((1-\eta)s_C(X)\) implement the same guarantee up to \(O(\eta m)\).

Lower proof route: for finite \(F\subset C_+\), LB-023 gives the finite value \(\delta(F)\), and the compact value is at least \(\sup_F\delta(F)\). Finite Hausdorff approximations \(F_n\subset C_+\) with \(m\in F_n\) give \(s_{F_n}\to s_C\) a.e. on active intervals, so \(\delta(F_n)\to\delta(C)\) by convergence of the integral roots. Boundary cases with \(\delta(C)=0\) are handled by nonnegativity. Status: accepted; the direct infinite dual survival law is useful intuition but not needed for the proof.

## LB-029: Compact Suffix-Menu Known-Path Upper Bound

For a deterministic exogenous path, define
\[
M_{t,T}=\max_{t<s\le T}P_s,\qquad
C_t=\overline{\{M_{t,T'}:T'>t\}}.
\]
Suppose a path-aware, horizon-oblivious policy chooses at time \(t\) a quote distribution such that for all \(c\in C_t\),
\[
\mathbb E[A_t1\{A_t<c\}]\ge c-\delta(C_t)-\varepsilon_t,
\]
with \(\sum_{t<T}\varepsilon_t=o(T)\). Then for every horizon \(T\),
\[
R_T\le \sum_{t<T}\delta(C_t)+\sum_{t<T}\varepsilon_t.
\]

Proof: under exogeneity and single-fill rewards,
\[
r_t(a;T)=a1\{a<M_{t,T}\}.
\]
Summing the local guarantee at \(c=M_{t,T}\) gives learner reward at least
\[
\sum_{t<T}M_{t,T}-\sum_{t<T}\delta(C_t)-\sum_{t<T}\varepsilon_t.
\]
For every fixed comparator \(a\),
\[
\sum_{t<T}a1\{a<M_{t,T}\}\le\sum_{t<T}M_{t,T}.
\]
Taking the comparator supremum proves the bound. Status: accepted as a sufficient known-path theorem only; it is noncausal/path-oracle and can be loose as a characterization.

## LB-030: Exact Marginal Reduction For Deterministic Known Paths

For a deterministic exogenous path and horizon \(T\), set
\[
M_{t,T}=\max_{t<s\le T}P_s.
\]
Then under the single-fill convention
\[
r_t(a;T)=a1\{a<M_{t,T}\}.
\]
If a horizon-oblivious randomized policy has marginal law \(\mu_t\) for \(A_t\), then
\[
\mathbb E\sum_{t<T}r_t(A_t;T)
=
\sum_{t<T}\int_{[0,M_{t,T})}x\,d\mu_t(x).
\]
Consequently, with
\[
V_T^*=\sup_{b\in[0,1]}\sum_{t<T}b1\{b<M_{t,T}\},
\]
the exact expected regret is
\[
R_T=V_T^*-\sum_{t<T}\int_{[0,M_{t,T})}x\,d\mu_t(x).
\]
Correlations and adaptation to previous deterministic-path fills do not affect expected pseudo-regret beyond these one-time marginals. Status: accepted for deterministic exogenous known paths; not valid for endogenous/reactive prices.

Stable-comparator corollary: if there is a left-limit quote \(b\in(0,1]\) with
\[
V_T^*-b|\{t<T:M_{t,T}\ge b\}|=o(T),
\]
then actual quotes \(b-\varepsilon_t\), \(\sum_{t<T}\varepsilon_t=o(T)\), give \(o(T)\) regret. This explains the alternating path \(1/2,1,1/2,1,\ldots\), where \(b=1\) is asymptotically optimal.

## LB-031: Finite-Prefix LP Dual

For a deterministic prefix \(P_{1:n}\), define the formal left-limit payoff
\[
\bar g_{\mu_t}(c)=\int_{[0,c]}x\,d\mu_t(x)
\]
and
\[
D_n(P)=
\inf_{\mu_1,\ldots,\mu_{n-1}}
\max_{T\le n}
\left[
V_T^*-\sum_{t<T}\bar g_{\mu_t}(M_{t,T})
\right].
\]
Then
\[
D_n(P)=
\max_{\lambda\in\Delta_n}
\left[
\sum_{T\le n}\lambda_TV_T^*
-
\sum_{t=1}^{n-1}
\sup_{a\in[0,1]}\sum_{T>t}\lambda_Ta1\{a<M_{t,T}\}
\right].
\]
For each \(t\), the per-time supremum equals the maximum over formal quotes just below
\[
C_t^n=\{M_{t,T}:T>t,\ M_{t,T}>0\},
\]
because between adjacent thresholds the indicator pattern is fixed and the objective is increasing in \(a\). In the original strict-crossing action space, the same value is an infimum, approximated by quotes \(c-\eta\).

Proof: reduce each time \(t\) to the finite left-limit menu \(C_t^n\cup\{0\}\). The primal LP minimizes \(z\) subject to
\[
z\ge V_T^*-\sum_{t<T}\sum_aq_{t,a}\phi_{t,T}(a),\qquad
\sum_aq_{t,a}=1.
\]
Dualizing gives horizon weights \(\lambda_T\ge0\), \(\sum_T\lambda_T=1\), and independent per-time maximization terms, yielding the displayed formula. Status: accepted finite-prefix theorem.

Certificate consequence: any \(\lambda\in\Delta_n\) gives a lower bound on \(\max_{T\le n}R_T\). In particular, if \(D_n(P)\ge\epsilon n\) for infinitely many \(n\), then every horizon-oblivious expected-regret policy on that deterministic path has \(\limsup_T R_T/T\ge\epsilon\). The converse direction \(D_n=o(n)\Rightarrow\) existence of one \(o(T)\)-regret policy is open because finite-prefix optimizers may be projectively inconsistent.

## LB-032: Fixed-Envelope Compactness Criterion

Fix a deterministic exogenous path and a sequence \(e_T\ge0\). In the formal left-limit model, there exists a horizon-oblivious randomized marginal sequence \((\mu_t)_{t\ge1}\) such that
\[
V_T^*-\sum_{t<T}\bar g_{\mu_t}(M_{t,T})\le e_T
\qquad\forall T
\]
iff for every \(n\) there exist \(\mu_1,\ldots,\mu_{n-1}\) satisfying these inequalities for all \(T\le n\), with the same envelope \(e_T\) independent of \(n\).

Proof sketch: \(\mathcal P([0,1])\) is weakly compact, hence so is the countable product. For fixed \(T\), \(x1\{x\le c\}\) is bounded upper semicontinuous, so \(\mu\mapsto\bar g_\mu(c)\) is upper semicontinuous. Therefore the constraint
\[
\sum_{t<T}\bar g_{\mu_t}(M_{t,T})\ge V_T^*-e_T
\]
is closed. The finite-prefix feasibility assumptions give the finite intersection property, hence a global point. Necessity is immediate by restriction.

Strict-crossing implementation: if the formal policy satisfies envelope \(e_T\), posting \((1-\eta_t)A_t\) with \(A_t\sim\mu_t\) loses at most \(\eta_t\) per quote. Thus
\[
R_T^{\rm actual}\le e_T+\sum_{t<T}\eta_t.
\]
Choosing \(\sum_{t<T}\eta_t=o(T)\) converts any formal \(e_T=o(T)\) policy into an actual strict-crossing \(o(T)\)-regret policy. Status: accepted modulo standard compactness facts; exact but tautological.

## LB-033: Last-Exceedance Comparator Representation

For a deterministic exogenous path and fixed quote \(b\), define
\[
L_b(T)=\max\{s\le T:P_s>b\},
\]
with \(L_b(T)=0\) when no price exceeds \(b\) by time \(T\). Then
\[
M_{t,T}>b\iff t<L_b(T),
\]
and therefore
\[
\sum_{t<T}b1\{b<M_{t,T}\}=b(L_b(T)-1)_+.
\]
Consequently,
\[
V_T^*=\sup_{b\in[0,1]} b(L_b(T)-1)_+.
\]
Status: accepted for deterministic exogenous paths with strict crossing and `sup`/left-limit comparator conventions. The identity rewrites comparator values only; the learner-side finite-prefix dual still involves weighted terms
\[
\sup_a a\sum_{T>t}\lambda_T1\{a<M_{t,T}\}
=
\sup_a a\sum_{T:t<L_a(T)}\lambda_T.
\]

## LB-034: Prefix-Splicing Deficit Bound

For a deterministic known path, define the formal left-limit deficit of marginal sequence \(\mu\) at horizon \(T\) by
\[
d_T(\mu)=V_T^*-\sum_{t<T}\bar g_{\mu_t}(M_{t,T}),
\qquad
\bar g_{\mu_t}(c)=\int_{[0,c]}x\,d\mu_t(x).
\]
If two marginal sequences \(\mu,\nu\) agree for all \(t>m\), then for every \(T>m\),
\[
|d_T(\mu)-d_T(\nu)|\le m.
\]
Only the first \(m\) payoff terms can change, and each term lies in \([0,1]\). Status: accepted as a crude robustness upper bound. It does not say that repairing an old prefix must cost \(m\); later suffix maxima may make the repaired marginals nearly payoff-equivalent.

## LB-035: Increasing-Threshold \(D_n\) Sandwich

For the deterministic prefix
\[
0^N,c_1,\ldots,c_m,\qquad 0<c_1<\cdots<c_m\le1,
\]
let \(C=\{c_1,\ldots,c_m\}\), \(n=N+m\), and use the formal left-limit finite-prefix value \(D_n(P)\) from LB-031. Then
\[
N\kappa(C)\le D_n(P)\le N\kappa(C)+m.
\]
Lower bound: restrict the finite-prefix max to horizons \(T_j=N+j\). At \(T_j\), the comparator \(a\uparrow c_j\) has value \((N+j-1)c_j\), while the learner's rewards from the \(j-1\) threshold-round posts are at most \((j-1)c_j\). Averaging over a dual law for \(\kappa(C)\) leaves the zero-block local game, giving \(N\kappa(C)\).

Upper bound: use an optimal local left-limit primal law for \(C\) on the \(N\) zero-block quote times. Handle the \(m\) threshold-round quote times crudely, losing at most \(1\) per such round at every horizon. This gives \(N\kappa(C)+m\). For \(m=2\), the single intermediate threshold-round post can be placed just below \(c_2\), so the additive slack vanishes and
\[
D_{N+2}(P)=N\,\frac{c_1(c_2-c_1)}{c_2}.
\]
Status: accepted as a stress-test computation in the formal left-limit model. For \(m>2\), the exact additive correction remains open.

## LB-036: Separated Two-Threshold \(D_n\) Formula

For the deterministic prefix
\[
0^N,\ c_0,\ 0^L,\ c_1,\qquad 0<c_0<c_1\le1,
\]
set \(n=N+L+2\). In the formal left-limit model,
\[
D_n(P)=N\,\frac{c_0(c_1-c_0)}{c_1}.
\]

Lower bound. Restrict the finite-prefix max to \(T_0=N+1\) and \(T_1=n\). At \(T_0\), the first \(N\) quote times face threshold \(c_0\). At \(T_1\), all quote times before the final \(c_1\) face threshold \(c_1\), but the \(L+1\) quote opportunities after \(c_0\) can be matched by the learner and comparator at \(c_1^-\). The remaining unavoidable conflict is exactly the first \(N\) quote times serving thresholds \(c_0\) and \(c_1\), whose value is \(Nc_0(c_1-c_0)/c_1\) by LB-014/LB-023.

Upper bound. Use the optimal two-threshold local primal law on the first \(N\) quote times and use the formal quote \(c_1^-\) for all quote times after \(c_0\). Intermediate horizons before \(c_1\) have comparator value \(Nc_0\), so only the first block matters there; at the final horizon the post-\(c_0\) quote times are matched. Status: accepted; actual strict-crossing actions require replacing formal threshold quotes by \(c_j-\eta\) and letting total \(\eta\)-loss be sublinear.

## LB-037: Dual Scale-Splitting Boundary Identity

For the finite-prefix dual functional
\[
\Phi(w)=\sum_Tw_TV_T^*
-\sum_t f_t(w),
\qquad
f_t(w)=\sup_a a\sum_{T>t}w_T1\{a<M_{t,T}\},
\]
let \(w=u+v\), where \(u\) is supported on horizons \(T\le m\) and \(v\) on horizons \(T>m\). Then
\[
\Phi(u+v)=\Phi(u)+\Phi(v)+B_m(u,v),
\]
where
\[
B_m(u,v)=
\sum_{t<m}\bigl(f_t(u)+f_t(v)-f_t(u+v)\bigr).
\]
The terms with \(t\ge m\) vanish because \(f_t(u)=0\). Each summand is nonnegative by subadditivity of support functions and satisfies
\[
f_t(u)+f_t(v)-f_t(u+v)
\le \min\{f_t(u),f_t(v)\}
\le
\min\left\{\sum_{T>t}u_T,\sum_Tv_T\right\}.
\]
Consequently
\[
B_m(u,v)
\le
\sum_{t<m}\min\left\{\sum_{T>t}u_T,\sum_Tv_T\right\}
\le m\min(\|u\|_1,\|v\|_1).
\]
Status: accepted. The boundary term is an exact cross-scale support-function additivity defect, not a mere slack term. LB-036 shows it cannot generally be charged to \(D_m\) of the shorter real prefix.

## LB-038: Finite-Alphabet Dual Reduction

Assume a deterministic prefix has positive prices in a finite alphabet
\[
0<c_1<\cdots<c_k.
\]
Use the formal left-limit convention: action \(c_j^-\) earns \(c_j\) exactly when the relevant suffix maximum is at least \(c_j\). For \(t<n\), let
\[
N_j(t)=\min\{s>t:P_s\ge c_j\},
\]
with \(N_j(t)=\infty\) if no such future time exists in the prefix. For \(T\le n\), let
\[
L_j(T)=\max\{s\le T:P_s\ge c_j\},
\]
with \(L_j(T)=0\) if absent. For dual weights \(\lambda\in\Delta_n\), write
\[
\Lambda_s=\sum_{T=s}^n\lambda_T,\qquad \Lambda_\infty=0.
\]
Then the per-time dual term in LB-031 is
\[
\sup_a\sum_{T>t}\lambda_Ta1\{a<M_{t,T}\}
=
\max_{1\le j\le k} c_j\Lambda_{N_j(t)}.
\]
The comparator term is
\[
V_T^*=\max_{1\le j\le k}c_j(L_j(T)-1)_+.
\]
Thus
\[
D_n(P)=
\max_{\lambda\in\Delta_n}
\left[
\sum_{T\le n}\lambda_T
\max_j c_j(L_j(T)-1)_+
-
\sum_{t<n}\max_j c_j\Lambda_{N_j(t)}
\right].
\]
Status: accepted in the left-limit model. In the original strict-crossing action space it is an infimum formula, implemented by quotes \(c_j-\eta\).

## LB-039: One-Level And Two-Level Finite-Alphabet Consequences

For \(k=1\), the formula in LB-038 gives \(D_n(P)=0\) for every prefix: the single comparator level and the learner-side single level cancel exactly.

For \(k=2\), write the levels as \(0<\ell<h\). Define
\[
A_T=(L_\ell(T)-1)_+,\qquad B_T=(L_h(T)-1)_+,
\]
and for a dual law \(\lambda\),
\[
U_t=\lambda\{T:L_\ell(T)>t\},\qquad
W_t=\lambda\{T:L_h(T)>t\}.
\]
Then
\[
\Phi(\lambda)
=
\mathbb E_\lambda[(\ell A_T-hB_T)_+]
-
\sum_{t<n}(\ell U_t-hW_t)_+.
\]
This follows by subtracting the one-level high-threshold cancellation from the two-level dual expression. Status: accepted as a finite-alphabet test-bed identity, not a gluing theorem.

Warning: the alternating two-level path need not have exact \(D_n=0\) for arbitrary \(\ell,h\). For example, on \(\ell,h,\ell,h\) with \(0<\ell<h<2\ell\), zero deficit at the high-dominated horizons forces high quotes, creating positive deficit at the intermediate low-dominated horizon. The conflict is bounded in this tiny example, but exact zero should not be used as a blanket sanity check.

## LB-040: Two-Level Single-Drought Damping Formula

Work in the formal left-limit model with two positive levels \(0<\ell<h\). For the deterministic prefix
\[
h^M,0^N,\ell,h
\]
of length \(n=M+N+2\), the finite-prefix value is
\[
D_n=
\bigl[\ell(M+N)-h(M-1)_+\bigr]_+
\left(1-\frac{\ell}{h}\right).
\]

Let
\[
T_0=M+N+1,\quad T_1=n,\quad
H=(M-1)_+,\quad
G=N+\mathbf 1_{\{M\ge1\}},
\]
and
\[
S=[\ell(M+N)-hH]_+.
\]
At the low horizon \(T_0\),
\[
V_{T_0}^*=\max\{hH,\ell(M+N)\}=hH+S,
\]
and at \(T_1\),
\[
V_{T_1}^*=h(H+G+1).
\]

Primal: quote \(h^-\) outside the \(G\) drought coordinates, and place total \(\ell^-\)-mass \(P=S/h\) on those drought coordinates. Feasibility follows from \(S\le hG\). The two active deficits are
\[
S-\ell P=S(1-\ell/h),\qquad (h-\ell)P=S(1-\ell/h).
\]
Earlier horizons are matched by the \(h^-\) quotes on old high coordinates, with the \(M=0\) and \(M=1\) boundary cases covered by the definitions of \(H,G\).

Dual: put weights \(\alpha=1-\ell/h\) and \(\beta=\ell/h\) on \(T_0,T_1\). On active drought coordinates,
\[
\alpha a1\{a\le\ell\}+\beta a1\{a\le h\}\le\ell
\]
in the formal threshold compactification; old high coordinates and the low-time coordinate cancel exactly. The weighted comparator minus learner payoff is \(\alpha S\), matching the primal. In the original strict-crossing model, this is an infimum statement implemented by \(\ell-\eta_t\) and \(h-\eta_t\).

Status: accepted as a local finite-prefix identity. It does not imply that drought contributions add across a general two-level path.

## LB-041: Stable-High Regret Formula

For a deterministic path with positive levels \(0<\ell<h\), define
\[
L_\ell(T)=\max\{s\le T:P_s\ge\ell\},\qquad
L_h(T)=\max\{s\le T:P_s\ge h\},
\]
with value \(0\) if the set is empty. In the formal left-limit model,
\[
V_T^*=\max\{\ell(L_\ell(T)-1)_+,h(L_h(T)-1)_+\}.
\]
The policy that posts \(h^-\) at every time earns \(h(L_h(T)-1)_+\), so its exact regret is
\[
[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+.
\]
Consequently, if highs recur and this quantity is \(o(T)\), the stable-high policy has \(o(T)\) regret. If highs eventually stop, a path-aware policy can eventually post \(\ell^-\). Status: accepted as an upper-bound lemma, not a lower-bound or localization certificate.

## LB-042: Post-Low Single-Drought Formula

Work in the formal left-limit two-level model \(0<\ell<h\). For the deterministic prefix
\[
h^M,0^N,\ell,0^L,h
\]
of length \(n=M+N+L+2\), the finite-prefix value is
\[
D_n=
[\ell(M+N)-h(M-1)_+]_+
\left(1-\frac{\ell}{h}\right).
\]

Set
\[
r=M+N+1,\quad H=(M-1)_+,\quad
G=N+\mathbf 1_{\{M\ge1\}},
\]
and
\[
S=[\ell(M+N)-hH]_+.
\]
For every intermediate horizon \(T=r,\ldots,r+L\),
\[
V_T^*=\max\{hH,\ell(M+N)\}=hH+S,
\]
and the quote times \(r,\ldots,T-1\) have no positive future price before \(T\), so they create no new low-side constraint. At the final horizon,
\[
V_n^*=h(H+G+L+1).
\]

Primal: quote \(h^-\) everywhere, then replace total mass
\[
P=S/h
\]
by \(\ell^-\) on the \(G\) conflict coordinates. Feasibility follows from \(S\le hG\). The low/intermediate deficit is
\[
S-\ell P=S(1-\ell/h),
\]
and the final-high debt is
\[
(h-\ell)P=S(1-\ell/h).
\]

Dual: put weights
\[
\alpha=1-\ell/h,\qquad \beta=\ell/h
\]
on the low horizon \(r\) and final horizon \(n\). The support costs are \(hH+\ell G+\ell(L+1)\), using
\[
\alpha a1\{a\le\ell\}+\beta a1\{a\le h\}\le\ell
\]
on conflict coordinates and \(\beta h=\ell\) on final-only post-low coordinates. The dual objective is
\[
\alpha(hH+S)+\beta h(H+G+L+1)-hH-\ell G-\ell(L+1)
=\alpha S,
\]
matching the primal. In the original strict-crossing action space this is an infimum statement, implemented by \(\ell-\eta_t\) and \(h-\eta_t\). Status: accepted local identity; it extends LB-040 from \(L=0\) to arbitrary \(L\).

## LB-043: Equal-Low Multi-Low Single-Drought Formula

For the one-drought equal-low path
\[
h^M,0^{N_0},\ell,0^{N_1},\ell,\ldots,0^{N_r},\ell,0^L,h,
\qquad 0<\ell<h,
\]
let \(s_j\) be the \(j\)-th low time, \(A_j=s_j-1\), \(H=(M-1)_+\), and
\[
S_j=[\ell A_j-hH]_+.
\]
In the formal left-limit finite-prefix model,
\[
D_n=S_r\left(1-\frac{\ell}{h}\right),
\]
where \(s_r\) is the last low time.

The finite-prefix LP reduces to useful coordinate segments with total \(\ell^-\)-masses \(x_i\) and capacities
\[
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad B_i=N_i+1\quad(1\le i\le r).
\]
The reduced LP is
\[
z\ge S_j-\ell\sum_{i=0}^jx_i,\qquad j=0,\ldots,r,
\]
\[
z\ge(h-\ell)\sum_{i=0}^rx_i,\qquad 0\le x_i\le B_i.
\]
Here segment \(0\) consists of the last old-high quote if \(M\ge1\) plus the \(N_0\) zeros before the first low; segment \(i\ge1\) consists of the previous low-time quote plus the \(N_i\) zeros before low \(i\).

Proof of reduction. In the two-level left-limit model, actions can be restricted to \(\{\ell^-,h^-\}\): below-\(\ell\) actions are dominated by \(\ell^-\), actions in \((\ell,h]\) have the same low-horizon success pattern as \(h^-\) but no larger high payoff, and actions above \(h\) are dominated by \(h^-\). The first \(H=(M-1)_+\) old-high quote coordinates are protected by a future old high before every low horizon and are matched by \(h^-\). Coordinates after the last low and before the final high are final-high-only and are also \(h^-\). All remaining coordinates are exchangeable inside their segment, so only total \(\ell^-\)-mass \(x_i\) matters. At low horizon \(s_j\), the all-\(h^-\) baseline earns \(hH\), the exact comparator value is \(\max\{hH,\ell A_j\}=hH+S_j\), and each unit of \(\ell^-\)-mass in segments \(i\le j\) buys \(\ell\) payoff. At the final high, each such unit creates debt \(h-\ell\). Intermediate zero horizons after a low and before the next low duplicate the latest low-horizon constraint; initial high and pre-low zero horizons are matched by \(h^-\).

Upper bound. Choose cumulative masses \(X_j=\sum_{i\le j}x_i=S_j/h\). This is feasible because \(S_0\le \ell B_0\le hB_0\) and, for \(j\ge1\),
\[
S_j-S_{j-1}\le \ell(A_j-A_{j-1})=\ell B_j\le hB_j.
\]
Then all low deficits are
\[
S_j-\ell X_j=S_j(1-\ell/h)\le S_r(1-\ell/h),
\]
and the final-high debt is exactly \((h-\ell)X_r=S_r(1-\ell/h)\).

Lower bound. Use only the last low and final high constraints. For \(X_r=\sum_i x_i\),
\[
\max\{S_r-\ell X_r,(h-\ell)X_r,0\}
\ge S_r(1-\ell/h),
\]
with equality at \(X_r=S_r/h\). Equivalently, the dual puts weights
\[
\lambda_r=(h-\ell)/h,\qquad \mu=\ell/h
\]
on the last low and final high.

Status: accepted local identity in the formal left-limit model. In the original strict-crossing action space it is an infimum statement implemented by \(\ell-\eta_t\) and \(h-\eta_t\) with cumulative \(\eta\)-loss controlled. The last-low rule is specific to equal low levels.

## LB-044: Unequal-Low Single-Drought Reduced LP

For
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\qquad 0<\ell_j<h,
\]
let \(\mathcal L=\{\ell_1,\ldots,\ell_r\}\), \(s_j\) be the low times, and \(H=(M-1)_+\). Define useful capacities
\[
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad B_i=N_i+1\quad(1\le i\le r-1),
\]
and for segment \(i<j\)
\[
m_{i,j}=\max_{q=i+1,\ldots,j}\ell_q.
\]
Let \(S_j=V_{s_j}^*-hH\), where \(V_{s_j}^*\) is the exact fixed-comparator value at low horizon \(s_j\). The reduced LP is
\[
\begin{aligned}
\min\quad & z\\
\text{s.t.}\quad
&z\ge S_j-\sum_{i=0}^{j-1}
\sum_{\substack{c\in\mathcal L\\ c\le m_{i,j}}}c\,x_{i,c},
\qquad j=1,\ldots,r,\\
&z\ge\sum_{i=0}^{r-1}\sum_{c\in\mathcal L}(h-c)x_{i,c},\\
&\sum_{c\in\mathcal L}x_{i,c}\le B_i,\qquad x_{i,c}\ge0.
\end{aligned}
\]
The dual has low-horizon weights \(\alpha_j\), final-high weight \(\beta\), \(\sum_j\alpha_j+\beta=1\), and segment pressure terms
\[
\psi_i=\left[
\max_{c\in\mathcal L}
\left\{
c\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j-\beta(h-c)
\right\}
\right]_+.
\]

Status: accepted as an exact one-drought finite-prefix theorem in the formal left-limit model. In the original strict-crossing action space this is an infimum statement, implemented by quotes \(c-\eta_t\) and \(h-\eta_t\).

Proof of the full-to-reduced reduction. Work from the accepted finite-prefix primal \(D_n\). Let \(I_0\) be the last old-high quote coordinate when \(M\ge1\), together with the \(N_0\) zeros before the first low; for \(1\le i<r\), let \(I_i\) be the quote coordinate at low \(s_i\) together with the \(N_i\) zeros before low \(s_{i+1}\). Then \(|I_i|=B_i\). The first \(H=(M-1)_+\) old-high coordinates are protected by a future high at every low horizon and are optimally fixed to \(h^-\). Coordinates at and after the last low and before the final high have no future positive price before the final high, and are optimally fixed to \(h^-\).

On a useful segment \(I_i\), every action \(a<h\) is weakly dominated by rounding up to
\[
\min\{c\in\mathcal L\cup\{h\}:c\ge a\}.
\]
All relevant low-horizon thresholds seen by segment \(i\) are \(m_{i,j}\in\mathcal L\); therefore if the rounded action exceeds \(m_{i,j}\), the original action already exceeded \(m_{i,j}\), while if it is at most \(m_{i,j}\), the payoff weakly increases. At the final high, rounding also weakly increases payoff. Thus the only useful actions are formal \(c^-\), \(c\in\mathcal L\), and the default \(h^-\). All coordinates inside a segment have the same payoff vector against the retained low horizons and the final high, so aggregate masses \(x_{i,c}\) are sufficient and exactly constrained by \(\sum_cx_{i,c}\le B_i\).

At low horizon \(s_j\), the protected old-high coordinates contribute \(hH\), and useful segment \(I_i\), \(i<j\), contributes \(c\) from mass \(x_{i,c}\) iff \(c\le m_{i,j}\). This gives the low constraints with \(S_j=V^*_{s_j}-hH\). At the final horizon, all-\(h^-\) matches the comparator value \(h(n-1)\), and each unit of \(c^-\) mass in a useful segment creates debt \(h-c\), giving the final constraint. Horizons before the first low have no residual deficit after the protected baseline, and a zero horizon after low \(s_j\) has the same comparator value and same suffix-max profile on already posted useful coordinates as \(s_j\); newly posted post-low zero coordinates have no positive future before that horizon. Hence only low horizons and the final high need constraints.

Dual. The displayed dual is the LP dual of the reduced primal and also agrees with the full finite-prefix dual restricted to low horizons and the final high. For useful segment \(i\), low-horizon weights \(\alpha_j\) and final-high weight \(\beta\) produce support pressure
\[
\psi_i(\alpha,\beta)=
\left[
\max_{c\in\mathcal L}
\left\{
c\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j-\beta(h-c)
\right\}
\right]_+,
\]
after cancellation of the baseline \(\beta h\). This dual is useful for future pooling or nested-resource-allocation rules, but no closed form is accepted yet.

Regression test. For \(h=1\), \(M=0\), path \(0,0.4,0.9,1\), the exact value is
\[
D_4=68/225.
\]
One primal optimum is
\[
x_{0,0.4}=11/45,\qquad x_{0,0.9}=34/45,\qquad x_{1,0.9}=4/5.
\]
Dual weights
\[
\alpha_1=5/9,\qquad \alpha_2=2/45,\qquad \beta=2/5
\]
give the same value. This is larger than the naive last-low value \(1.8(1-0.9)=0.18\), so unequal lows can make earlier low horizons bind.
