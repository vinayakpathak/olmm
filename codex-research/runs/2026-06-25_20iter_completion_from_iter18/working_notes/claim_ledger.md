# Claim Ledger

## Accepted Or Strongly Supported

**CL-001: Truncated-grid sufficiency under full-information assumptions.**  
Status: accepted modulo standard delayed-expert theorem and explicit model assumptions.  
Claim: If public exogenous prices allow the learner to compute every grid arm's truncated reward \(r_t^H(b)\) by time \(t+H\), then a \(K\)-grid delayed full-information learner satisfies
\[
R_T \le O(\sqrt{T(H+1)\log K})+T/K+T\beta(H).
\]
Dependencies: public full price observation; exogenous or realized-path counterfactual rewards; bounded rewards; deterministic known \(H,K\); comparator written as \(\sup\) unless attainment is proved.

**CL-002: Payoff-weighted tail suffices.**  
Status: accepted.  
Claim: With
\[
\gamma(h)=\sup_t\sup_a\operatorname*{ess\,sup}_{\mathcal F_t}
a\,\Pr(h<\tau_t(a)<\infty\mid\mathcal F_t),
\]
the same proof gives
\[
R_T \le O(\sqrt{T(H+1)\log K})+T/K+T\gamma(H).
\]
Thus \(\gamma(h)\to0\) is a sufficient condition for sublinear regret after choosing \(K=T\) and \(H(T)\to\infty\) with \(H(T)\log T=o(T)\).

**CL-003: Positive-scale equivalence for \(\gamma\).**  
Status: accepted.  
Let
\[
\beta_\epsilon(h)=\sup_t\sup_{a\in[\epsilon,1]}\operatorname*{ess\,sup}_{\mathcal F_t}
\Pr(h<\tau_t(a)<\infty\mid\mathcal F_t).
\]
Then \(\gamma(h)\to0\) iff \(\beta_\epsilon(h)\to0\) for every \(\epsilon>0\). Proof: \(\beta_\epsilon(h)\le \gamma(h)/\epsilon\), while \(\gamma(h)\le \epsilon+\beta_\epsilon(h)\).

**CL-004: Horizon-tail sufficiency.**  
Status: accepted as a sufficient nonuniform condition.  
Define
\[
\Delta_T(H)=\sup_{a\in[0,1]}\sum_{t\le T}\mathbb E[a\,1\{H<\tau_t(a)\le T-t\}].
\]
Then
\[
R_T \le O(\sqrt{T(H+1)\log K})+T/K+\Delta_T(H).
\]
If known deterministic schedules satisfy \(H_T\log K_T=o(T)\), \(T/K_T=o(T)\), and \(\Delta_T(H_T)=o(T)\), the delayed-grid algorithm has sublinear regret. A sharper comparator-gap variant also works: with
\[
\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a),
\]
one has \(R_T\le R_T^H+\Gamma_T(H)\), hence the same grid bound with \(\Gamma_T(H)\le\Delta_T(H)\). A universal theorem over unknown schedules still needs model selection or skipping.

**CL-005: Sparse vanishing spikes refute instance-wise \(\beta\)-necessity.**  
Status: accepted.  
For \(s_n=2^n\), \(P_{s_n}=U_n/s_n\), \(P_t=0\) otherwise, with iid \(U_n\sim{\rm Unif}(0,1)\), one has \(\beta(h)=1\) for all \(h\), but \(\sup_a\mathbb E\sum_{t\le T}r_t(a)\le1\). The always-zero learner therefore has \(R_T\le1\). This refutes
\[
\exists \pi:\ R_P^\pi(T)=o(T)\Rightarrow \beta_P(h)\to0
\]
for individual processes.

**CL-014: Horizon/process-aware pseudo-regret collapse.**  
Status: accepted with explicit assumptions.  
Let \(P\) be an exogenous, policy-independent price-process law and define pseudo-regret by
\[
R_T^P(\pi)=\sup_{a\in[0,1]}V_T^P(a)-\mathbb E_P\sum_{t\le T}r_t(a_t),
\qquad
V_T^P(a)=\mathbb E_P\sum_{t\le T}r_t(a).
\]
If policies may depend on both \(P\) and \(T\), and no computability/statistical-access restriction is imposed, then for every \(\varepsilon>0\) there is a deterministic constant-quote policy \(\pi_{P,T,\varepsilon}\) with \(R_T^P(\pi_{P,T,\varepsilon})\le\varepsilon\). Choose an \(\varepsilon\)-optimizer of \(\sup_a V_T^P(a)\) and play it every round. Thus every exogenous process is learnable in this oracle regime, independent of \(\beta,\gamma,\Delta,\Gamma\). This does not apply to \(E[\sup]\) pathwise regret, endogenous/adaptive prices, horizon-oblivious policies, or one learner required to work over a class.

**CL-015: Finite two-continuation block lower bound.**  
Status: accepted for universal/minimax interpretations.  
Let \(I_c^N\) be the deterministic horizon-\(N+1\) instance
\[
P_1=\cdots=P_N=0,\qquad P_{N+1}=c,\qquad c\in\{1/2,1\}.
\]
For any randomized learner, the law of its first \(N\) actions is identical under both continuations. With regret against \(\sup_a\), one has
\[
\sup_{c\in\{1/2,1\}}R^\pi(I_c^N)\ge N/4.
\]
Equivalently, an epsilon-comparator version gives \(N(1/4-\eta)\) using quotes \(1/2-\eta\) and \(1-\eta\). This is a lower bound for a learner not knowing the continuation, not an instance-wise lower bound for a process-aware learner.

**CL-017: Finite same-path two-horizon lower bound.**  
Status: accepted finite obstruction for horizon-oblivious policies.  
Consider the deterministic path
\[
P_1=\cdots=P_N=0,\qquad P_{N+1}=1/2,\qquad P_{N+2}=1.
\]
A policy may know this path and the current time/history, but its first \(N\) actions cannot depend on whether regret will be evaluated at \(T_0=N+1\) or \(T_1=N+2\). With
\[
G_0=\mathbb E\sum_{t=1}^N A_t1\{A_t<1/2\},\qquad
G_1=\mathbb E\sum_{t=1}^N A_t1\{A_t<1\},
\]
one has \(G_0+G_1\le N\). Using \(\eta\)-comparators \(1/2-\eta\) and \(1-\eta\) to avoid strict-threshold nonattainment,
\[
R_{N+1}+R_{N+2}\ge N(1/2-2\eta)-O(1),
\]
so \(\max\{R_{N+1},R_{N+2}\}\ge N(1/4-\eta)-O(1)\). This refutes a generic horizon-oblivious oracle collapse, but it is not a raw-tail necessity theorem.

**CL-016: Concatenated block universal lower bound.**  
Status: accepted for universal/process-unaware expected-regret interpretations.  
Fix a randomized learner, or a horizon-aware family \((\pi_T)_T\), that is not given the deterministic continuation sequence/law. Let \(N_i\) be chosen so that
\[
M_i=\sum_{j<i}(N_j+1)=o(N_i),
\]
and consider the class of deterministic sequences formed by blocks \(0^{N_i}c_i\), \(c_i\in\{1/2,1\}\). There exists a choice of \(c_i\)'s, made recursively after fixing the learner, such that at endpoints \(T_i=M_i+N_i+1\),
\[
R^\pi(T_i)\ge N_i/4-M_i
\]
with regret interpreted in expectation over learner randomization and with comparator values as suprema. Hence
\[
\limsup_i R^\pi(T_i)/T_i\ge 1/4.
\]
Proof ingredients: condition on the fixed previous prefix; couple the two continuations \(0^{N_i},1/2\) and \(0^{N_i},1\) with the same learner randomness and same horizon \(T_i\); use
\[
a1\{a<1/2\}+a1\{a<1\}\le1
\]
on current-block actions; lower-bound the comparator by the current block alone; and cap all rewards from earlier actions by \(M_i\). This is a \(\forall\pi\,\exists P\) universal/minimax theorem only. It fails as an instance-wise/process-aware necessity claim.

**CL-018: Concatenated same-path horizon-oblivious lower bound.**  
Status: accepted for process-aware but horizon-oblivious expected-regret policies.  
Let \(N_i\) dominate
\[
M_i=\sum_{j<i}(N_j+2),
\qquad M_i=o(N_i),
\]
and define one deterministic path by blocks
\[
0^{N_i},\,1/2,\,1.
\]
For endpoints
\[
T_i^0=M_i+N_i+1,\qquad T_i^1=M_i+N_i+2,
\]
any single policy whose first \(T\) actions do not depend on the evaluation horizon \(T\) satisfies
\[
\max\{R_{T_i^0},R_{T_i^1}\}\ge N_i/4-M_i-O(1).
\]
Thus
\[
\limsup_T R_T/T\ge 1/4.
\]
The learner may know the entire deterministic path/law and current time, but receives no terminal-round signal and cannot use a different early action rule for the two prefixes. The proof uses the same current-block inequality as CL-017, the old-reward cap \(M_i\), and an extra \(O(1)\) allowance for the quote posted at the intermediate \(1/2\). This separates horizon-aware oracle policies from horizon-oblivious anytime policies, but does not rescue raw \(\beta\)-necessity.

**CL-019: General two-threshold block lemma.**  
Status: accepted under the same common-prefix/sup-comparator assumptions as CL-015 and CL-017.  
Let \(0<c_0<c_1\le1\), and compare two deterministic zero-block continuations \(0^N,c_0\) and \(0^N,c_1\) whose first \(N\) actions have the same joint law. With regret against comparator suprema,
\[
\max\{R_{c_0},R_{c_1}\}
\ge
N\,\alpha(c_0,c_1),
\qquad
\alpha(c_0,c_1)=\frac{c_0(c_1-c_0)}{c_1}.
\]
Proof uses weights
\[
\lambda_0=\frac{c_1-c_0}{c_1},\qquad \lambda_1=\frac{c_0}{c_1}
\]
and the pointwise inequality
\[
\lambda_0 a1\{a<c_0\}+\lambda_1 a1\{a<c_1\}\le c_0.
\]
The coefficient is optimized at \(c_0=c_1/2\), \(c_1=1\), giving \(1/4\). This lemma generalizes CL-015/CL-017 and lifts to CL-016/CL-018 with the same old-reward cap and quantifier caveats. It is not an instance-wise tail-necessity theorem.

**CL-021: Conditional \(\kappa\)-transfer bookkeeping lemma.**  
Status: accepted as a conditional lower-bound lemma, not as a characterization.  
Let \(\mathcal U\) be a finite candidate set and \(I\) a common prefix. For each \(u\), let \(E_u\) be the common-prefix event with probability \(p_u\), define
\[
\phi_{u,t}(a)=\mathbb E_u[r_t(a)\mid E_u],
\qquad
v_u=\sup_b\sum_{t\in I}\phi_{u,t}(b),
\]
over the same action domain available to the learner. Suppose the learner's conditional prefix action law is the same across candidates and satisfies the payoff factorization
\[
\mathbb E_u[1_{E_u}r_t(A_t)]
=p_u\int \phi_{u,t}(a)\,d\mu_t(a).
\]
Also suppose \(V_u^*\ge p_uv_u+C_u\) and the learner's expected reward outside the tested prefix-on-\(E_u\) is at most \(C_u+B_u\). Then
\[
R_u\ge p_u\left[v_u-\sum_{t\in I}\int\phi_{u,t}(a)\,d\mu_t(a)\right]-B_u.
\]
Consequently, if \(p_u\ge p\), \(B_u\le B\), and \(\kappa_I(\mathcal U)\ge0\), then
\[
\max_{u\in\mathcal U}R_u\ge p\,|I|\,\kappa_I(\mathcal U)-B.
\]
The same-prefix-law hypothesis is supplied by process-unaware universal lower bounds or by same-path horizon-oblivious evaluation; it fails for process-aware/horizon-aware candidates unless imposed separately.

**CL-022: Multi-threshold zero-block LP dual and \(1/e\) local cap.**  
Status: accepted for the local zero-block prefix gap, with strict-crossing `sup` conventions.  
For a finite terminal threshold set \(C\subset(0,1]\) and unrestricted continuum actions,
\[
\kappa(C)=
\max_{\lambda\in\Delta(C)}
\left[
\mathbb E_\lambda C-\sup_{a\in[0,1]}a\,\Pr_\lambda(C>a)
\right].
\]
The finite action-grid version is the same finite LP dual with \(\max_{a\in A}\) in place of the continuum supremum; it lower-bounds only grid-restricted learners unless a dense-grid/\(\eta\)-comparator limit is taken. For any threshold law \(C\in[0,1]\), if
\[
R=\sup_{a\in[0,1]}a\,\Pr(C>a),
\]
then \(\Pr(C>x)\le\min(1,R/x)\), so
\[
\mathbb E C-R\le R\log(1/R)\le 1/e.
\]
Use the convention that the left side is \(0\) when \(R=0\), which forces \(C=0\) almost surely.
The \(1/e\) bound is local minimax geometry, not an instance-wise tail necessity theorem. The dual law \(\lambda\) is a certificate over deterministic continuations and should not be treated as a hard stochastic process under pseudo-regret.

**CL-023: Sharp finite-\(m\) multi-threshold constant.**  
Status: accepted as local posted-price/LP geometry, with strict-crossing `sup`/left-limit conventions.  
For \(m\ge1\), let \(Z\in[0,1]\) have at most \(m\) positive support points and define
\[
\rho(Z)=\sup_{a\in[0,1]}a\,\Pr(Z>a).
\]
If \(k\le m\) is the actual number of positive support points, then
\[
\mathbb EZ-\rho(Z)\le \left(\frac{k-1}{k}\right)^k
\le \left(\frac{m-1}{m}\right)^m,
\]
with the \(k=1\) value interpreted as \(0\). The upper bound is tight for \(m\ge2\): set \(r=(m-1)/m\), \(c_i=r^{m-i}\), \(i=1,\ldots,m\), and choose the law with
\[
\Pr(Z\ge c_i)=r^{i-1}.
\]
Then the left-limit posted-price revenue is \(r^{m-1}\) on every support interval, and
\[
\mathbb EZ-r^{m-1}=r^m=\left(\frac{m-1}{m}\right)^m.
\]
Proof outline: condition away zero atoms, scale the top positive support to \(1\), collapse positive values below \(\rho\) up to \(\rho\) without increasing \(\rho\), write the support as \(\rho=c_1<\cdots<c_k=1\), use \(c_i\Pr(Z\ge c_i)\le\rho\), and apply AM-GM to the ratios \(c_{i-1}/c_i\). This proves only a local deterministic-continuation certificate; it is not a stochastic hard instance under pseudo-regret.

**CL-025: Finite multi-continuation terminal-block lower bound and \(1/e\) universal lift.**  
Status: accepted for universal/process-unaware terminal-block lower bounds, modulo standard strict-crossing \(\eta\)-comparator or left-limit cleanup.  
For a finite threshold set \(C\subset(0,1]\), consider deterministic continuations \(0^N,c\), \(c\in C\), with a learner whose first \(N\) action law is common across continuations. With
\[
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right),
\]
weighted averaging over the dual law gives
\[
\max_{c\in C}R_c\ge N\kappa(C)
\]
for the terminal block, interpreting comparator values as suprema. After a fixed previous prefix of length \(M\), all old learner rewards at the endpoint are capped by \(M\), so the corresponding conditional lower bound is \(N\kappa(C)-M\).

Consequently, for any process-unaware randomized learner, choose dominant block lengths with \(M_i=o(N_i)\) and recursively select a worst continuation from an equal-revenue \(m\)-point set \(C_m\). At endpoints,
\[
R_{T_i}\ge N_i\left(\frac{m-1}{m}\right)^m-M_i,
\qquad
\limsup_i R_{T_i}/T_i\ge \left(\frac{m-1}{m}\right)^m.
\]
Letting \(m=m_i\to\infty\) slowly while maintaining \(M_i/N_i\to0\) yields a universal/process-unaware deterministic block lower bound with constant approaching \(1/e\). This remains a minimax/universal lower bound, not an instance-wise necessity theorem and not a hard stochastic mixture.

**CL-026: Same-path multi-threshold anytime lift.**  
Status: accepted under explicit horizon-oblivious/single-fill assumptions.  
Let \(C=\{c_1<\cdots<c_m\}\subset(0,1]\). Consider one deterministic known path consisting of an arbitrary old prefix of length \(M\), then
\[
0^N,c_1,\ldots,c_m,
\]
and evaluate regret at \(T_j=M+N+j\). A process-aware but horizon-oblivious policy uses the same zero-block actions \(A_1,\ldots,A_N\) for all \(j\). With regret against comparator suprema and the single-fill reward convention,
\[
R_{T_j}\ge
N c_j-\mathbb E\sum_{s=1}^N A_s1\{A_s<c_j\}-M.
\]
Proof idea: the comparator \(a\uparrow c_j\) earns \((N+j-1)c_j\) on the zero block and earlier threshold-round posts; the learner earns at most \(M\) from the old prefix, the displayed zero-block payoff, and \((j-1)c_j\) from earlier threshold-round posts, so the intermediate terms cancel. Averaging against any \(\lambda\in\Delta(C)\) gives
\[
\max_j R_{T_j}\ge
N\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right)-M,
\]
and optimizing over \(\lambda\) yields
\[
\max_j R_{T_j}\ge N\kappa(C)-M.
\]
Required caveats: thresholds must appear in increasing order, the learner must not receive the evaluation horizon, strict crossing is handled by `sup` or \(a\uparrow c_j\), and old/intermediate reward caps use that each quote pays at most once. This is a same-path simultaneous-prefix lower bound, not a tail characterization.

**CL-027: Same-path equal-revenue \(1/e\) anytime lower bound.**  
Status: accepted as a corollary of CL-026 and CL-023.  
Construct one deterministic known path from blocks
\[
0^{N_i}, C_i,
\qquad
C_i=\{c_{i,1}<\cdots<c_{i,m_i}\},
\]
where \(m_i\to\infty\), \(r_i=(m_i-1)/m_i\), and
\[
c_{i,j}=r_i^{m_i-j}.
\]
Let
\[
M_i=\sum_{\ell<i}(N_\ell+m_\ell),
\]
and choose \(N_i\) so that \((M_i+m_i)/N_i\to0\). For any process-aware but horizon-oblivious policy, CL-026 and the equal-revenue value from CL-023 give some \(j_i\) with
\[
R_{M_i+N_i+j_i}
\ge
N_i\left(\frac{m_i-1}{m_i}\right)^{m_i}-M_i.
\]
Since \(M_i+N_i+j_i\le M_i+N_i+m_i\),
\[
\limsup_T R_T/T\ge 1/e.
\]
The result sharply separates horizon-oblivious anytime policies from horizon-aware oracle policies on a known path. By itself it is only a lower bound; CL-029 supplies the matching randomized worst-case upper bound. It does not imply any instance-wise raw-tail necessity theorem.

**CL-028: Explicit finite-menu local value formula.**  
Status: accepted as local zero-block minimax geometry, with strict-crossing left-limit conventions.  
Let \(C=\{0<c_1<\cdots<c_m\}\), set \(c_0=0\), and define
\[
F_C(\delta)=\sum_{i=1}^m
\frac{(c_i-\delta)_+-(c_{i-1}-\delta)_+}{c_i}.
\]
Then \(F_C\) has a unique root \(\delta_*(C)\in[0,c_m]\) satisfying \(F_C(\delta_*)=1\), and
\[
\kappa(C)=
\inf_{\mu\in\Delta([0,1])}\sup_{c\in C}
\left(c-\int a1\{a<c\}\,d\mu(a)\right)
=\delta_*(C),
\]
where the infimum is interpreted using left-limit quotes or \(\eta\)-optimal actions just below thresholds.
The primal certificate places mass
\[
q_i=\frac{(c_i-\delta_*)_+-(c_{i-1}-\delta_*)_+}{c_i}
\]
on \(c_i^-\), so active deficits are equalized and inactive thresholds \(c_j\le\delta_*\) have deficit at most \(\delta_*\). The dual certificate starts at \(k=\min\{i:c_i>\delta_*\}\) and uses the active-suffix law
\[
\Pr(Z\ge c_i)=c_k/c_i,\qquad i\ge k,
\]
whose left-limit posted-price revenue is \(c_k\) and whose welfare is \(c_k+\delta_*\). This recovers CL-019 for two thresholds and LB-022 for equal-revenue menus. It is a local infimum theorem, not an attained optimizer in the original strict-crossing action space and not a global path characterization by itself.

**CL-029: Universal equal-revenue \(1/e\) upper bound and sharp known-path anytime constant.**  
Status: accepted under exogenous deterministic-path, randomized-policy, horizon-oblivious, single-fill assumptions.  
Let a learner independently draw every quote from
\[
d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da.
\]
For a deterministic exogenous path and horizon \(T\), define
\[
M_{t,T}=\max_{t<s\le T}P_s.
\]
Then \(r_t(a;T)=a1\{M_{t,T}>a\}\), and the policy's expected per-quote payoff is
\[
g_\mu(c)=\int_{[0,c)}a\,d\mu(a)=(c-e^{-1})_+.
\]
Thus
\[
c-g_\mu(c)=\min\{c,e^{-1}\}\le e^{-1}.
\]
Since every fixed comparator earns at most \(\sum_{t<T}M_{t,T}\),
\[
R_T\le \sum_{t<T}\left(M_{t,T}-g_\mu(M_{t,T})\right)\le (T-1)/e.
\]
Together with CL-027, this gives the sharp worst-case constant
\[
\sup_P \inf_{\pi\in\Pi_{\rm rand,ho}}
\limsup_{T\to\infty} R_T^\pi(P)/T=1/e
\]
for deterministic exogenous paths, expected regret over learner randomization, `sup` comparators, and horizon-oblivious randomized policies. The upper bound actually uses a process-unaware policy and extends to exogenous stochastic paths by conditioning on the realized path. It fails as stated for endogenous prices that react to quotes; deterministic-policy existence is handled separately in CL-031.

**CL-031: Nonconstructive deterministic derandomization of the \(1/e\) known-path upper bound.**  
Status: accepted as a known-path/horizon-oblivious theorem, not as a tail characterization.  
There exists a fixed deterministic sequence \(a_1,a_2,\ldots\in(e^{-1},1)\) and a finite constant \(C\) such that for every \(n\ge1\) and every nonincreasing sequence \(c_1\ge\cdots\ge c_n\) in \([0,1]\),
\[
\sum_{t=1}^n a_t1\{a_t<c_t\}
\ge
\sum_{t=1}^n (c_t-e^{-1})_+
- C n^{2/3}\sqrt{\log(n+2)}.
\]
Proof: sample \(a_t\) iid from the equal-revenue law \(d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da\), union-bound Hoeffding deviations over nonincreasing \(m_n\)-grid threshold sequences with \(m_n=\lceil n^{1/3}\rceil\), round arbitrary thresholds downward, and use Borel-Cantelli to freeze one good realization.

For any deterministic exogenous path, set \(M_{t,T}=\max_{t<s\le T}P_s\). Since \(M_{1,T}\ge\cdots\ge M_{T-1,T}\), the fixed deterministic sequence satisfies
\[
R_T\le (T-1)/e + C T^{2/3}\sqrt{\log(T+2)}.
\]
Combined with CL-027, the sharp worst-case limsup constant for deterministic horizon-oblivious policies on deterministic exogenous paths is also \(1/e\). The result is nonconstructive, uses `sup` comparators, strict crossing, single-fill rewards, and exogeneity. It does not apply to endogenous/reactive prices and does not revive raw-tail necessity.

**CL-032: Compact suffix-menu local value formula.**  
Status: accepted as a local left-limit/infimum theorem; the explicit infinite dual law remains optional and needs separate measure-theoretic polishing.  
Let \(C\subset[0,1]\) be compact, set \(C_+=C\cap(0,1]\), and if \(C_+=\emptyset\) define \(\delta(C)=0\). Otherwise let \(m=\max C_+\) and
\[
s_C(x)=\min(C_+\cap[x,m]),\qquad x\in(0,m].
\]
Define \(\delta(C)\in[0,m]\) as the unique root of the improper integral equation
\[
F_C(\delta):=\int_\delta^m \frac{dx}{s_C(x)}=1.
\]
Then \(\delta(C)\le m/e\), and in the formal left-limit action space
\[
\inf_{\nu\in\Delta([0,1])}\sup_{c\in C_+}
\left[
c-\int_{[0,c]}x\,d\nu(x)
\right]
=\delta(C).
\]
For actual strict-crossing quotes, this is an infimum statement: the upper certificate samples \(X\) on \([\delta,m]\) with density \(1/s_C(x)\,dx\) and posts \((1-\eta)s_C(X)\), losing at most \(O(\eta m)\) uniformly over \(c\in C\). The lower bound follows by finite submenus/Hausdorff approximations and CL-028/LB-023; arbitrary dense finite sets need only a.e. successor convergence, not pointwise convergence at every endpoint. This extends the finite-menu formula and singleton cases must be read with the same left-limit convention.

**CL-033: Compact suffix-menu known-path upper theorem.**  
Status: accepted as a sufficient theorem for deterministic known exogenous paths, not as a characterization.  
For a deterministic exogenous path and horizon \(T\), let
\[
M_{t,T}=\max_{t<s\le T}P_s,\qquad
C_t=\overline{\{M_{t,T'}:T'>t\}}.
\]
Assume the learner is path-aware/horizon-oblivious and may choose at time \(t\) an actual quote distribution whose payoff against every \(c\in C_t\) is at least \(c-\delta(C_t)-\varepsilon_t\), where \(\sum_{t<T}\varepsilon_t=o(T)\). Then for every horizon,
\[
R_T\le \sum_{t<T}\delta(C_t)+\sum_{t<T}\varepsilon_t.
\]
The proof uses \(r_t(a;T)=a1\{a<M_{t,T}\}\), the local menu guarantee at \(c=M_{t,T}\), and the comparator upper bound
\[
\sup_a\sum_{t<T}a1\{a<M_{t,T}\}\le\sum_{t<T}M_{t,T}.
\]
Thus \(\sum_{t<T}\delta(C_t)=o(T)\) is sufficient for sublinear known-path anytime regret. The theorem is noncausal/path-oracle, requires exogeneity and `sup` comparators, and does not cover endogenous prices.

**CL-035: Exact marginal reduction for deterministic known paths.**  
Status: accepted under deterministic exogenous known-path, horizon-oblivious randomized-policy, expected pseudo-regret assumptions.  
For a fixed deterministic exogenous path define
\[
M_{t,T}=\max_{t<s\le T}P_s,\qquad
V_T^*=\sup_{b\in[0,1]}\sum_{t<T}b1\{b<M_{t,T}\}.
\]
Then
\[
r_t(a;T)=a1\{a<M_{t,T}\},
\]
and for any horizon-oblivious randomized policy with marginal law \(\mu_t\) for \(A_t\),
\[
R_T
=V_T^*-\sum_{t<T}\int_{[0,M_{t,T})}x\,d\mu_t(x).
\]
Thus correlations among the learner's actions do not affect expected regret on a fixed deterministic path; only the one-time marginals matter. The same formalism gives a simple stable-comparator sufficient condition: if for some left-limit quote \(b\)
\[
V_T^*-b\,|\{t<T:M_{t,T}\ge b\}|=o(T),
\]
then posting \(b-\varepsilon_t\) with \(\sum_{t<T}\varepsilon_t=o(T)\) yields \(o(T)\) regret. This explains why the alternating path is easy despite linear suffix-menu cost. The reduction fails for endogenous/reactive prices and is not a causal online algorithm.

**CL-036: Finite-prefix dual horizon-conflict modulus.**  
Status: accepted as a finite-prefix left-limit/infimum theorem; sufficiency of its normalized asymptotics is open.  
For a deterministic prefix \(P_{1:n}\), define the left-limit finite-prefix simultaneous value
\[
D_n(P)=
\inf_{\mu_1,\ldots,\mu_{n-1}}
\max_{T\le n}
\left[
V_T^*-\sum_{t<T}\int_{[0,M_{t,T}]}x\,d\mu_t(x)
\right].
\]
Then finite LP duality gives
\[
D_n(P)=
\max_{\lambda\in\Delta_n}
\left[
\sum_{T\le n}\lambda_TV_T^*
-
\sum_{t<n}\sup_{a\in[0,1]}
\sum_{T>t}\lambda_T\,a1\{a<M_{t,T}\}
\right],
\]
where the supremum is equivalently a maximum over formal left-limit thresholds
\[
C_t^n=\{M_{t,T}:T>t,\ M_{t,T}>0\}.
\]
In the original strict-crossing action space this is an infimum statement, implemented with quotes just below finitely many thresholds. If \(D_n(P)\ge\epsilon n\) infinitely often, every horizon-oblivious expected-regret policy on that path has \(\limsup_T R_T/T\ge\epsilon\). The dual recovers singleton terminal blocks as easy, the \(0^N,1/2,1\) block as the basic \(1/4\) conflict, and equal-revenue blocks as the accepted \(1/e\)-type obstruction after the existing block accounting.

**CL-037: Fixed-envelope compactness criterion for known-path anytime marginals.**  
Status: accepted modulo standard compactness/Tychonoff facts, in the formal left-limit model; still tautological rather than structural.  
Fix a deterministic exogenous path and a nonnegative envelope \(e_T\). There exists a formal horizon-oblivious randomized marginal sequence \((\mu_t)_{t\ge1}\) with
\[
V_T^*-\sum_{t<T}\int_{[0,M_{t,T}]}x\,d\mu_t(x)\le e_T
\qquad\forall T
\]
iff for every \(n\) there are finite-prefix marginals \(\mu_1,\ldots,\mu_{n-1}\) satisfying the same inequalities for all \(T\le n\), with the same envelope \(e_T\) independent of \(n\). The proof uses compactness of \(\mathcal P([0,1])^\mathbb N\) and closedness of the constraints: \(x1\{x\le c\}\) is bounded upper semicontinuous, so the payoff is upper semicontinuous and the superlevel constraints are closed. If \(e_T=o(T)\), actual strict-crossing \(o(T)\) regret follows by replacing formal quote \(A_t\) with \((1-\eta_t)A_t\) and choosing \(\sum_{t<T}\eta_t=o(T)\). The weaker scalar condition \(D_n(P)=o(n)\) is necessary but not known sufficient.

**CL-038: Last-exceedance structure and prefix-splicing robustness.**  
Status: accepted as structural bookkeeping for deterministic known exogenous paths.  
For a fixed quote \(b\), define
\[
L_b(T)=\max\{s\le T:P_s>b\},
\]
with \(L_b(T)=0\) if there is no such \(s\). Then
\[
M_{t,T}>b\iff t<L_b(T),
\qquad
\sum_{t<T}b1\{b<M_{t,T}\}=b(L_b(T)-1)_+.
\]
Thus the fixed-comparator value can be written as
\[
V_T^*=\sup_{b\in[0,1]} b(L_b(T)-1)_+,
\]
with the usual strict-crossing `sup`/left-limit convention. Also, if two marginal sequences \(\mu,\nu\) agree for all \(t>m\), then their horizon deficits
\[
d_T(\mu)=V_T^*-\sum_{t<T}\bar g_{\mu_t}(M_{t,T})
\]
satisfy \(|d_T(\mu)-d_T(\nu)|\le m\) for every \(T>m\). This is only a crude upper bound on possible damage from prefix repair, not a lower bound saying such repair must cost \(m\).

**CL-039: Increasing-threshold finite-prefix \(D_n\) stress test.**  
Status: accepted as a finite-prefix bound in the formal left-limit model; exact value for general \(m\) remains open.  
For the deterministic prefix
\[
0^N,c_1,\ldots,c_m,\qquad 0<c_1<\cdots<c_m\le1,
\]
let \(C=\{c_1,\ldots,c_m\}\), \(n=N+m\), and define \(D_n\) as in CL-036. Then
\[
N\kappa(C)\le D_n(P)\le N\kappa(C)+m.
\]
The lower bound is the same cancellation used in the same-path multi-threshold lower bound: averaging the horizons \(T_j=N+j\) against a dual law for \(\kappa(C)\) leaves the zero-block deficit. The upper bound uses a local primal law for \(C\) on the first \(N\) quotes and pays at most \(m\) for all threshold-round slack. For \(m=2\), the intermediate threshold-round action can be chosen just below \(c_2\), so the left-limit value is exactly
\[
D_{N+2}=N\,\frac{c_1(c_2-c_1)}{c_2}.
\]
For \(m>2\), removing the additive \(m\)-scale slack or identifying the exact correction is still a useful finite LP problem.

**CL-041: Exact separated two-threshold finite-prefix value and dual scale splitting.**  
Status: accepted in the formal left-limit model, with strict-crossing implemented by \(a\mapsto(1-\eta)a\).  
For the deterministic prefix
\[
0^N,c_0,0^L,c_1,\qquad 0<c_0<c_1\le1,
\]
with \(n=N+L+2\), the finite-prefix value from CL-036 is exactly
\[
D_n(P)=N\,\frac{c_0(c_1-c_0)}{c_1}.
\]
The lower bound restricts to the horizons \(T_0=N+1\) and \(T_1=n\); the post-\(c_0\) quote opportunities cancel at \(T_1\), leaving the first \(N\) zero-block two-threshold conflict. The upper bound uses the two-threshold local primal law on the first \(N\) quote times and posts \(c_1^-\) on all later quote times.

For the finite-prefix dual functional
\[
\Phi(w)=\sum_Tw_TV_T^*
-\sum_t f_t(w),\qquad
f_t(w)=\sup_a a\sum_{T>t}w_T1\{a<M_{t,T}\},
\]
if \(w=u+v\), \(u\) is supported on \(T\le m\), and \(v\) on \(T>m\), then
\[
\Phi(u+v)=\Phi(u)+\Phi(v)+
\sum_{t<m}\bigl(f_t(u)+f_t(v)-f_t(u+v)\bigr).
\]
Moreover the boundary term is bounded by
\[
\sum_{t<m}\min\left\{\sum_{T>t}u_T,\sum_Tv_T\right\}
\le m\min(\|u\|_1,\|v\|_1).
\]
This identity shows the boundary term is a genuine cross-scale incompatibility, not a proof artifact.

**CL-042: Finite-alphabet left-limit dual reduction.**  
Status: accepted as an exact finite-prefix formula; no localization theorem follows yet.  
For a deterministic prefix whose positive prices lie in
\[
0<c_1<\cdots<c_k,
\]
work in the formal left-limit model where action \(c_j^-\) earns \(c_j\) when the suffix maximum is at least \(c_j\). Let
\[
N_j(t)=\min\{s>t:P_s\ge c_j\},
\quad
L_j(T)=\max\{s\le T:P_s\ge c_j\},
\]
with \(N_j(t)=\infty\) and \(L_j(T)=0\) when the corresponding event is absent, and write
\[
\Lambda_s=\sum_{T=s}^n\lambda_T,\qquad \Lambda_\infty=0.
\]
Then the finite-prefix dual in CL-036 becomes
\[
D_n(P)=\max_{\lambda\in\Delta_n}
\left[
\sum_{T\le n}\lambda_T
\max_j c_j(L_j(T)-1)_+
-
\sum_{t<n}\max_j c_j\Lambda_{N_j(t)}
\right].
\]
The one-positive-level case has \(D_n(P)=0\) for every prefix. For two levels \(\ell<h\), set
\[
A_T=(L_\ell(T)-1)_+,\quad B_T=(L_h(T)-1)_+,
\]
\[
U_t=\lambda\{T:L_\ell(T)>t\},\quad
W_t=\lambda\{T:L_h(T)>t\}.
\]
For any dual law \(\lambda\),
\[
\Phi(\lambda)
=
\mathbb E_\lambda[(\ell A_T-hB_T)_+]
-
\sum_{t<n}(\ell U_t-hW_t)_+.
\]
This is the cleanest finite-alphabet test bed for the open \(D_n=o(n)\) gluing problem, but the desired uncrossing/localization theorem is still unproved.

**CL-044: Two-level single-drought damping identity.**  
Status: accepted as a local finite-prefix identity in the formal left-limit model.  
For \(0<\ell<h\), consider the deterministic prefix
\[
h^M,0^N,\ell,h
\]
of length \(n=M+N+2\). Then
\[
D_n(P)=
\bigl[\ell(M+N)-h(M-1)_+\bigr]_+
\left(1-\frac{\ell}{h}\right).
\]
Here \(D_n\) is the finite-prefix value from CL-036 in the left-limit model, with `sup` comparators and single-fill rewards. The proof uses only the two active horizons \(T_0=M+N+1\) and \(T_1=n\). Let
\[
H=(M-1)_+,\qquad G=N+\mathbf 1_{\{M\ge1\}},
\qquad S=[\ell(M+N)-hH]_+.
\]
The primal quotes \(h^-\) off the \(G\) drought coordinates and places total \(\ell^-\)-mass \(S/h\) on those coordinates; the low-horizon and final-high deficits both become \(S(1-\ell/h)\). The matching dual puts weights \(1-\ell/h\) and \(\ell/h\) on \(T_0,T_1\) and uses
\[
(1-\ell/h)a1\{a\le\ell\}+(\ell/h)a1\{a\le h\}\le\ell
\]
in the formal threshold compactification. Strict crossing in the original action space requires \(\eta\)-implementation. The identity is local and does not imply additive decomposition across many droughts.

**CL-045: Stable-high exact regret on two-level paths.**  
Status: accepted as a simple consequence of the last-exceedance representation.  
On a deterministic path whose positive levels are \(0<\ell<h\), define \(L_\ell(T)\) and \(L_h(T)\) as the last times by \(T\) at which the path reaches the corresponding level, with value \(0\) if absent. In the formal left-limit model,
\[
V_T^*=\max\{\ell(L_\ell(T)-1)_+,\,h(L_h(T)-1)_+\}.
\]
The policy that always posts \(h^-\) earns \(h(L_h(T)-1)_+\), hence has exact regret
\[
Q_T=[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+.
\]
Thus if highs recur and \(Q_T=o(T)\), stable \(h^-\) gives \(o(T)\) regret; if highs eventually stop, an eventual stable \(\ell^-\) policy is enough. This is an upper-bound observation about stable policies, not a lower-bound certificate.

**CL-047: Post-low single-drought value is independent of the post-low gap.**  
Status: accepted as a local finite-prefix identity in the formal left-limit model.  
For \(0<\ell<h\), consider
\[
h^M,0^N,\ell,0^L,h
\]
of length \(n=M+N+L+2\). Then
\[
D_n=
[\ell(M+N)-h(M-1)_+]_+\left(1-\frac{\ell}{h}\right).
\]
Let \(r=M+N+1\), \(H=(M-1)_+\),
\[
G=N+\mathbf 1_{\{M\ge1\}},\qquad
S=[\ell(M+N)-hH]_+.
\]
At horizons \(T=r,\ldots,r+L\),
\[
V_T^*=\max\{hH,\ell(M+N)\}=hH+S,
\]
and quote times after the low have no positive future before the final high. The primal quotes \(h^-\) by default and replaces total mass \(S/h\) by \(\ell^-\) on the \(G\) conflict coordinates. This makes the low/intermediate-horizon deficit and final-high deficit both equal \(S(1-\ell/h)\). The dual uses weights \(1-\ell/h\) on the low horizon \(r\) and \(\ell/h\) on the final high \(n\); old high and post-low final-only coordinates cancel, while each conflict coordinate contributes the pointwise support cost \(\ell\). The result is an infimum statement under strict crossing, implemented by \(\ell-\eta_t,h-\eta_t\). It is local and does not imply additivity across multiple droughts.

**CL-048: Equal-low multi-low single-drought last-low formula.**  
Status: accepted as a local finite-prefix identity in the formal left-limit model; equal-low only.  
For
\[
h^M,0^{N_0},\ell,0^{N_1},\ell,\ldots,0^{N_r},\ell,0^L,h,
\qquad 0<\ell<h,
\]
let \(s_j\) be the \(j\)-th low time, indexed \(j=0,\ldots,r\), set \(A_j=s_j-1\), and let \(H=(M-1)_+\). Then
\[
D_n=[\ell A_r-hH]_+\left(1-\frac{\ell}{h}\right).
\]
Equivalently, with \(S_j=[\ell A_j-hH]_+\) and useful segment capacities
\[
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad
B_i=N_i+1\quad(1\le i\le r),
\]
the finite-prefix LP reduces to cumulative low-mass variables \(x_i\), where \(x_i\) is total \(\ell^-\)-mass in segment \(i\):
\[
z\ge S_j-\ell\sum_{i\le j}x_i,\quad j=0,\ldots,r,\qquad
z\ge(h-\ell)\sum_{i=0}^r x_i,\qquad
0\le x_i\le B_i.
\]
The upper bound chooses cumulative masses \(X_j=\sum_{i\le j}x_i=S_j/h\), feasible because \(S_0\le hB_0\) and \(S_j-S_{j-1}\le \ell B_j\le hB_j\). The lower bound uses only the last low and final high constraints:
\[
\max\{S_r-\ell X_r,(h-\ell)X_r\}\ge S_r(1-\ell/h).
\]
Old high protected coordinates are matched by \(h^-\); post-last-low coordinates are final-high-only and are optimally \(h^-\); intermediate zero horizons duplicate the latest low-horizon constraint. In the original strict-crossing action space this is an infimum statement implemented with \(\ell-\eta_t,h-\eta_t\). The last-low rule must not be generalized to unequal low levels.

**CL-049: Unequal-low one-drought reduced LP.**  
Status: accepted as a local finite-prefix identity in the formal left-limit model; no closed-form pooling rule yet.  
For
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\qquad 0<\ell_j<h,
\]
let \(s_j\), \(j=1,\ldots,r\), be the low times, let
\(\mathcal L=\{\ell_1,\ldots,\ell_r\}\), set \(H=(M-1)_+\), and define useful segment capacities
\[
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad
B_i=N_i+1\quad(1\le i\le r-1).
\]
For \(0\le i<j\le r\), set
\[
m_{i,j}=\max_{q=i+1,\ldots,j}\ell_q,\qquad
S_j=V^*_{s_j}-hH.
\]
Then the formal left-limit finite-prefix value \(D_n\) equals the optimum of
\[
\begin{aligned}
\min\quad &z\\
\text{s.t.}\quad
&z\ge S_j-\sum_{i=0}^{j-1}
\sum_{\substack{c\in\mathcal L\\ c\le m_{i,j}}}c\,x_{i,c},
\qquad j=1,\ldots,r,\\
&z\ge\sum_{i=0}^{r-1}\sum_{c\in\mathcal L}(h-c)x_{i,c},\\
&\sum_{c\in\mathcal L}x_{i,c}\le B_i,\qquad x_{i,c}\ge0.
\end{aligned}
\]
Proof spine: the first \(H\) old-high quote coordinates are protected by future old highs and are optimally \(h^-\); post-last-low coordinates are final-high-only and are optimally \(h^-\); on each useful segment \(I_i\), every action \(a<h\) is weakly dominated by rounding up to the next element of \(\mathcal L\cup\{h\}\), since all retained low-horizon thresholds are values \(m_{i,j}\in\mathcal L\) and the final high reward weakly increases. Coordinates within a segment have identical payoff vectors, so aggregate masses \(x_{i,c}\) are sufficient. Horizons before the first low have zero deficit after the protected baseline, and zero horizons after low \(s_j\) duplicate the deficit at \(s_j\). Final-horizon loss is exactly the high debt \(\sum(h-c)x_{i,c}\). Strict crossing in the original action space requires the standard \(\eta\)-implementation.

The LP dual is
\[
\max_{\alpha,\beta\ge0,\ \sum_j\alpha_j+\beta=1}
\left[
\sum_j\alpha_jS_j-\sum_{i=0}^{r-1}B_i\psi_i(\alpha,\beta)
\right],
\]
where
\[
\psi_i=
\left[
\max_{c\in\mathcal L}
\left\{
c\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j-\beta(h-c)
\right\}
\right]_+ .
\]
For \(P=(0,0.4,0.9,1)\), \(h=1\), the value is
\[
D_4=68/225,
\]
with one primal optimizer
\[
x_{0,0.4}=11/45,\quad x_{0,0.9}=34/45,\quad x_{1,0.9}=4/5.
\]
This confirms, now at the full finite-prefix level, that unequal lows can make earlier low horizons bind.

**CL-050: Two-unequal-low one-drought closed form.**  
Status: accepted as a local finite-prefix identity in the formal left-limit model, conditional on CL-049.  
For the one-drought two-low path
\[
h^M,0^{N_0},p,0^{N_1},q,0^L,h,
\qquad 0<p,q<h,\quad p\ne q,
\]
set
\[
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad B_1=N_1+1,\qquad H=(M-1)_+,
\]
and let
\[
S_j=V^*_{s_j}-hH,\qquad j=1,2,
\]
where \(s_1,s_2\) are the two low times. For actual paths,
\[
0\le S_1\le S_2,\qquad S_1\le pB_0,\qquad S_2/h\le B_0+B_1.
\]

If \(p<q\), define \(\theta=(h-q)S_2/h\). Then
\[
D_n=
\begin{cases}
\theta, & S_1\le \theta,\\[3pt]
\dfrac{(q-p)S_1+p\theta}{q}, & \theta<S_1\le \theta+qB_0,\\[8pt]
S_1-pB_0, & S_1>\theta+qB_0.
\end{cases}
\]
For actual market paths with \(p<q\), the third displayed branch is unreachable: \(S_1\le pB_0<qB_0\le\theta+qB_0\). It remains useful only as an algebraic reduced-LP branch after path-feasibility is relaxed.

If \(p>q\), then
\[
D_n=
\begin{cases}
\dfrac{(h-p)S_2}{h}, & S_2/h\le B_0,\\[8pt]
\max\left\{S_1-pB_0,\ \dfrac{(h-q)S_2}{h}-(p-q)B_0\right\}, & S_2/h>B_0.
\end{cases}
\]
The boundary \(p=q\) is covered by the equal-low formula CL-048. Evidence: solver derivation plus explorer and critic audit in iteration 19; both reductions have matching primal and dual certificates, and random vertex-enumeration smoke tests found no counterexample. Dependencies: CL-049 reduced LP, formal left-limit action space, `sup` comparators, single-fill rewards, and the usual strict-crossing \(\eta\)-implementation for actual quotes. This is not a pooling theorem, repeated-drought composition theorem, or \(D_n=o(n)\Rightarrow o(T)\) gluing theorem.

**CL-051: Strictly increasing-low one-drought closed form.**  
Status: accepted as a local finite-prefix identity in the formal left-limit model, conditional on CL-049 and actual path-feasibility.  
For the one-drought path
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\qquad 0<\ell_1<\cdots<\ell_r<h,
\]
set
\[
H=(M-1)_+,\qquad
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad
B_i=N_i+1\quad(1\le i\le r-1),
\]
\[
C_j=\sum_{i=0}^{j-1}B_i,\qquad
S_j=[\ell_j(H+C_j)-hH]_+,\qquad S_0=0,\qquad
\Delta_j=S_j-S_{j-1}.
\]
Then
\[
D_n=Z_{\rm inc}:=\max_{1\le k\le r}Z_k,
\]
where
\[
Z_k=
\left(1-\frac{\ell_k}{h}\right)S_k
+\sum_{j>k}\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j .
\]
Dual proof spine: for fixed \(k\), take \(\beta=\ell_k/h\) and tail weights
\[
A_j=\sum_{q\ge j}\alpha_q=
\begin{cases}
1-\ell_k/h, & j\le k,\\
\ell_k/\ell_j-\ell_k/h, & j>k,
\end{cases}
\]
with \(\ell_{r+1}=h\). Then \(\alpha_j=A_j-A_{j+1}\ge0\), \(\sum_j\alpha_j+\beta=1\), and strict monotonicity gives \(m_{i,j}=\ell_j\), making every segment pressure \(\psi_i=0\). The dual objective is \(Z_k\).

Upper proof spine: choose a maximizing \(k\) with \(S_{k-1}\le Z_k\le S_k\), define \(y_k=S_k-Z_k\) and \(y_j=\Delta_j\) for \(j>k\), and allocate mass \(y_j/\ell_j\) to quote level \(\ell_j^-\). The final high debt telescopes to \(Z_k\). The nested Hall constraints
\[
\sum_{j=k}^t\frac{y_j}{\ell_j}\le C_t
\]
follow from the identity
\[
Z_k-\left(S_k+\ell_k\sum_{j=k+1}^t\frac{\Delta_j}{\ell_j}-\ell_k C_t\right)
=
\frac{\ell_k}{h}(hC_t-S_t)
+\sum_{j>t}\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j\ge0.
\]
Thus the primal matches the dual. Strict crossing in the original action space requires the usual \(\eta\)-implementation. This theorem does not cover duplicate lows, nonmonotone lows, arbitrary reduced-LP data, repeated droughts, or the global anytime gluing problem.

## Refuted Or Weakened

**CL-006: Original iff conjecture.**  
Status: refuted under literal instance-wise reading; unresolved under class-uniform/minimax readings.  
Reason: CL-005.

**CL-007: \(\gamma(h)\to0\) as an instance-wise necessary condition.**  
Status: refuted for process-aware/instance-wise learnability.  
Reason: coded-delay construction can have \(\gamma(h)\ge1/4\) for all \(h\), yet the process makes \(a=1/2\) always optimal and an always-\(1/2\) learner has zero regret.

**CL-008: \(\Delta_T(H_T)=o(T)\) as an instance-wise necessary condition.**  
Status: refuted or at least strongly weakened.  
Reason: predictable sparse spike examples have linear horizon-tail loss along infinitely many horizons while a horizon/process-aware learner can quote the known near-optimal level and get \(o(T)\) regret.

**CL-009: \(\Delta_T\) is the weakest visible truncation gap.**  
Status: false as stated.  
A smaller comparator-level quantity is
\[
\Gamma_T(H)=\sup_a V_T(a)-\sup_a V_T^H(a),
\]
with \(\Gamma_T(H)\le\Delta_T(H)\). Even \(\Gamma_T\)-type raw reward tails may not be necessary if delayed mass is predictable.

**CL-010: Comparator maxima always exist.**  
Status: false.  
With strict crossing \(P_s>a\), atoms can make the best fixed quote unattained; e.g. deterministic future price \(c\) gives payoff approaching \(c\) as \(a\uparrow c\) but not at \(a=c\). Use \(\sup\) or add assumptions ensuring attainment.

**CL-034: Suffix-menu smallness is not necessary.**  
Status: refuted as a necessary condition for known-path anytime learnability.  
On the deterministic alternating path
\[
P_{2k-1}=1/2,\qquad P_{2k}=1,
\]
the suffix menus are \(C_t=\{1\}\) for odd \(t\) and \(C_t=\{1/2,1\}\) for even \(t\), so
\[
\sum_{t<T}\delta(C_t)\sim T/8.
\]
Nevertheless the horizon-oblivious path-aware policy posting \(1-\varepsilon_t\), with average \(\frac1T\sum_{t\le T}\varepsilon_t\to0\), has \(o(T)\) regret for all horizons: it nearly matches the comparator \(1^-\), losing only the accumulated \(\varepsilon_t\)'s plus \(O(1)\) near horizons ending at a \(1/2\). Hence CL-033 is only a sufficient condition; the local bound can be loose because it compares the fixed comparator to \(\sum_tM_{t,T}\), not to the exact \(\sup_a\sum_t a1\{a<M_{t,T}\}\).

**CL-043: Boundary defect does not imply a shorter-prefix \(D_m\) certificate.**  
Status: refuted as a localization route.  
For the separated block in CL-041, split at \(m=N+1\) and choose two-threshold dual weights on \(T_0=N+1\) and \(T_1=N+L+2\). The boundary defect on the first \(N\) quote coordinates equals
\[
N\,\frac{c_0(c_1-c_0)}{c_1},
\]
while the shorter prefix \(0^N,c_0\) has \(D_m=0\) in the left-limit model. Thus a large support-function additivity defect may come from late shadow thresholds invisible inside the prefix. Any successful localization proof must either keep a boundary-augmented certificate or prove that repeated cross-scale defects force large \(D_n\) at some comparable scale.

**CL-046: The raw stable-high gap is not a two-level localization certificate.**  
Status: refuted as a dichotomy route.  
For a two-level path define
\[
Q_T=[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+.
\]
By CL-045 this is exactly the regret of the stable \(h^-\) quote, but \(Q_T=\Omega(T)\) at a low horizon does not force a comparable-scale finite-prefix conflict. The finite stress test
\[
0^N,\ell,0^L,h,\qquad L\gg N,
\]
has \(Q_{N+1}=\ell N\), while the low-only prefix \(0^N,\ell\) has \(D_{N+1}=0\) by quoting \(\ell^-\), and the full prefix has
\[
D_{N+L+2}=N\ell(1-\ell/h)
\]
by CL-041, which is \(o(N+L)\) if \(L\gg N\). Thus a successful two-level gluing proof must track when low-surplus is resolved by a later high and how low-quote debt accumulates; \(Q_T/T\) alone is too coarse.

## Candidate Claims Needing More Work

**CL-011: Envelope-strengthened sparse spikes.**  
Status: plausible with finite-prefix and monotonicity conditions.  
For eventually positive nondecreasing \(q(T)=o(T)\), one can choose spike amplitudes \(c_n\) after the eventual threshold so regret is at most \(q(T)/2\) for all sufficiently large \(T\), while \(\beta\equiv1\). Needs a clean statement with \(c_n>0\), \(c_n/s_n\le1\), and finite-prefix handling.

**CL-012: Rare-history essential-sup obstruction.**  
Status: plausible but not yet proved.  
Rare positive-probability branches may keep \(\beta\) or \(\gamma\) large via essential sup while contributing negligible expected regret. Need a fully specified process and horizon calculations.

**CL-013: Information-theoretic necessity condition.**  
Status: promising direction.  
A lower bound should use two processes/classes with identical observations before delayed feedback resolves, but different best fixed quotes. Long tail mass must be payoff-relevant, sufficiently frequent, and unpredictable.

**CL-020: Prefix-compatibility modulus.**  
Status: promising candidate abstraction, not yet a global theorem/characterization.  
For a common prefix \(I\) and candidate continuations or horizons \(u\in\mathcal U\), define conditional expected prefix payoffs
\[
\phi_{u,t}(a)=\mathbb E_u[a\,1\{\exists s\in(t,T_u]:P_s>a\}\mid\text{common prefix}]
\]
and \(v_u=\sup_b\sum_{t\in I}\phi_{u,t}(b)\). A local simultaneous-payoff gap is
\[
\kappa_I(\mathcal U)=\frac1{|I|}\inf_{\mu_t}\sup_{u\in\mathcal U}
\left[v_u-\sum_{t\in I}\int \phi_{u,t}(a)\,d\mu_t(a)\right].
\]
For homogeneous zero-block deterministic thresholds \(\{c_0,c_1\}\), the finite-grid/limit calculation gives \(\kappa=\alpha(c_0,c_1)\). To transfer this gap to regret, one must add: same prefix action law across candidates, candidates interpreted as conditional expected payoff laws rather than realized hidden futures, a cap \(B_u\) on outside/post-divergence learner surplus, and probability weighting for rare prefix events. Small \(\kappa\) is not by itself a learnability theorem.

**CL-030: Path-dependent suffix-menu upper framework.**  
Status: finite version accepted and compact-menu cleanup promoted to CL-032/CL-033; necessity and computable selectors remain open.  
For a deterministic exogenous path, define each quote time's future suffix-max menu
\[
C_t=\{M_{t,T'}:T'>t\}.
\]
If a horizon-oblivious learner chooses \(\mu_t\) with
\[
\int_{[0,c)}a\,d\mu_t(a)\ge c-\delta_t
\qquad\text{for all }c\in C_t,
\]
then for every horizon
\[
R_T\le\sum_{t<T}\delta_t.
\]
For finite \(C_t\), CL-028 identifies the optimal local \(\delta_t\) as \(\delta_*(C_t)=\kappa(C_t)\). For compact menus, CL-032/CL-033 provide the approximation cleanup and strict-crossing \(\eta\)-implementation route. Noncompact menus, computable selectors, and necessity remain open. This is an upper framework for known deterministic paths, not a necessity theorem for raw delay tails.

**CL-040: Market-specific gluing from \(D_n=o(n)\).**  
Status: open conjectural route, not proved.  
The desired theorem would say that for deterministic known exogenous paths, the scalar condition \(D_n(P)=o(n)\), together with market-specific structure of the suffix maxima, implies a projectively consistent horizon-oblivious marginal sequence with \(o(T)\) regret. Iteration 13 narrowed the plausible route to dual localization: if no global fixed sublinear envelope exists, prove that some finite-prefix dual certificate can be supported on comparable-scale horizons, forcing \(D_n(P)=\Omega(n)\). The generic compactness argument does not prove this, and an abstract non-market parity example shows scalar finite-prefix smallness alone is insufficient in arbitrary compact feasibility problems. Any proof must exploit more than mere monotonicity of \(M_{t,T}\), which every exogenous path already has; possible stronger handles are last-exceedance laminarity, finite price alphabets, record-level stability, or scale-sensitive dual constraints.

Iteration 14 weakens the naive dual-localization route. The exact boundary identity in CL-041 shows cross-scale conflict can live entirely in early quote coordinates without producing a shorter-prefix \(D_m\) certificate, and CL-043 refutes the direct "boundary defect implies local conflict" inequality. The finite-alphabet reduction CL-042 is now the best positive test bed; a two-level localization theorem remains open, and even alternating two-level prefixes require care because exact \(D_n=0\) is not true for all ratios \(\ell/h\), only in stable-comparator/easy cases up to bounded effects.

Iteration 15 adds a sharper two-level local regression test, CL-044, and refutes the proposed \(Q_T\)-based dichotomy via CL-046. The revised positive target is a resolved-surplus or debt recursion: low-horizon surplus \(S\) should matter only relative to the prefix length at the high that resolves it, and low-level quote mass creates persistent high debt that must be controlled cumulatively across droughts. This remains unproved, especially with multiple lows in one drought or overlapping drought intervals.

Iteration 16 promotes the post-low single-drought extension CL-047: post-low zeros do not add local conflict beyond the resolving high debt. This strengthens the evidence that simple dilution is exact for one drought. The remaining gluing target shifts to multiple lows, unequal lows, and repeated droughts, where front-loading constraints and shared high debt may interact.

Iteration 17 promotes the equal-low multi-low drought formula CL-048, and iteration 18 promotes the unequal-low one-drought reduced LP to CL-049. For
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\]
with low set \(\mathcal L=\{\ell_1,\ldots,\ell_r\}\), useful segment capacities \(B_0=N_0+\mathbf 1_{\{M\ge1\}}\), \(B_i=N_i+1\) for \(1\le i\le r-1\), and segment/low maxima \(m_{i,j}=\max_{q=i+1,\ldots,j}\ell_q\), the exact one-drought LP is
\[
S_j=V^*_{s_j}-h(M-1)_+,
\]
\[
\begin{aligned}
\min z\quad\text{s.t.}\quad
&z\ge S_j-\sum_{i=0}^{j-1}\sum_{\substack{c\in\mathcal L\\ c\le m_{i,j}}}c\,x_{i,c},
\qquad j=1,\ldots,r,\\
&z\ge\sum_{i=0}^{r-1}\sum_{c\in\mathcal L}(h-c)x_{i,c},\\
&\sum_{c\in\mathcal L}x_{i,c}\le B_i,\qquad x_{i,c}\ge0.
\end{aligned}
\]
This is now accepted only for one drought in the formal left-limit model. It does not give a closed-form pooling rule, and it should not be assumed to compose across repeated droughts sharing high-debt coordinates. It refutes any naive unequal-low "last low only" closed form as a full finite-prefix statement: the two-low path \(0,0.4,0.9,1\) has value \(68/225\), larger than the last-low value \(0.18\).

Iteration 19 promotes the two-low closed form CL-050 as a base case for any future pooling rule. It also gives a valid complementary-slackness support rule for CL-049: for dual weights \((\alpha,\beta)\), define
\[
W_i(c)=\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j,\qquad
\psi_i=\left[\max_{c\in\mathcal L}\{cW_i(c)-\beta(h-c)\}\right]_+.
\]
Any positive primal mass \(x_{i,c}>0\) must satisfy
\[
cW_i(c)-\beta(h-c)=\psi_i.
\]
This supports an active-set/pooling program, but only as a candidate. The three-low regression path
\[
0,\ 0.2,\ 0^8,\ 0.3,\ 0,\ 0.4,\ 1
\]
has certified reduced-LP value \(291/100\), with lows \(0.3,0.4\) dual-active and the first low slack, but this does not prove a scalar adjacent-merge or PAVA rule. Capacity binding and positive dual pressure are distinct: in that certificate some segment capacities bind while all \(\psi_i\) vanish.

Iteration 20 promotes CL-051, the strictly increasing-low one-drought closed form. This gives a clean zero-pressure active set for actual path-feasible increasing lows and explains the \(291/100\) regression without invoking positive segment pressure. It also narrows the next targets: prove a robust active-set rule for nonmonotone or duplicate lows, and understand repeated droughts where high-debt coordinates interact across episodes. The two-low \(p<q\) third branch should now be treated as a non-path-feasible reduced-LP stress test, not as an actual increasing-low capacity obstruction.
