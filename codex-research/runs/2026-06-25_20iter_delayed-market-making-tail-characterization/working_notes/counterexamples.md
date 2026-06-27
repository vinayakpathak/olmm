# Counterexamples And Obstructions

## CE-001: Sparse Vanishing Spikes Refute \(\beta\)-Necessity

Status: accepted.

Let \(s_n=2^n\), \(U_n\stackrel{iid}{\sim}{\rm Unif}(0,1)\), and
\[
P_t=\begin{cases}
U_n/s_n,&t=s_n,\\
0,&\text{otherwise}.
\end{cases}
\]
For \(a=0\) at \(t=s_n\), the next positive price occurs at \(s_{n+1}\) almost surely, so \(\tau_{s_n}(0)=2^n\). Therefore \(\beta(h)=1\) for every \(h\). Yet for every horizon \(T\), every fixed \(a>0\) has expected reward \(<1\) by comparing against the last possible crossing spike, and \(a=0\) has zero reward. The always-zero learner has \(R_T\le1\). This refutes the stated only-if direction for individual processes.

Notes: This uses \(0\in[0,1]\). If actions are restricted to \([\epsilon,1]\), the specific witness disappears once all spike heights are below \(\epsilon\). If \(0\) is excluded but arbitrarily small actions remain, a related supremum pathology remains but needs a separate admissible learner argument.

## CE-002: Comparator Maximum Can Fail

Status: accepted.

If a future public price is deterministically \(c\in(0,1]\), then quotes \(a<c\) trade while \(a\ge c\) do not. The fixed-action payoff approaches the value at \(c\) as \(a\uparrow c\) but is not attained at \(a=c\). Thus the problem should use \(\sup_a\) or add conditions ensuring a maximum exists.

## CE-003: Coded Delay Refutes Instance-Wise \(\gamma\)-Necessity

Status: accepted as a stress-test construction; writeup still needs final polishing.

Draw \(M=m\) with \(p_m>0\), reveal a code \(P_1=x_m\), set \(P_2=\cdots=P_{L_m}=0\), set \(P_{L_m+1}=U\sim{\rm Unif}[0,1]\), and set later prices to zero, with \(L_m\to\infty\). For any \(h\), choose \(m\) with \(L_m>h\). Conditional on \(P_1=x_m\), for \(a=1/2\),
\[
\Pr(h<\tau_1(a)<\infty\mid P_1=x_m)=1/2,
\]
so \(\gamma(h)\ge1/4\). But for each horizon the expected fixed-action value is \(a(1-a)S_T\) for some scalar \(S_T\ge0\), so \(a=1/2\) is optimal and the always-\(1/2\) learner has zero regret.

## CE-004: Sparse Blocks Break Uniform-In-Time Tail Necessity

Status: plausible; needs formal all-prefix proof if used.

Consider deterministic epochs \(0^n1^{n^3}\). For any \(h\), choose \(n>h\) and a quote \(a=1/2\) at the first zero of that block; the delay to a one exceeds \(h\), so \(\gamma(h)\ge1/2\). But through epoch \(N\), zero-block positions are \(O(N^2)\) while total time is \(O(N^4)\), so ex-ante averaged long-tail mass is plausibly \(o(T)\). This shows \(\sup_t\) conditions can be too strong for initial expected regret.

## CE-005: Predictable Sparse Spikes Refute \(\Delta_T\)-Necessity

Status: accepted as obstruction, with exact variant to formalize.

Binary power-of-two variant: \(P_t=1\) iff \(t\) is a power of two, otherwise \(P_t=0\). At horizons \(T=2^m\), any \(H=o(T)\) leaves \(\Delta_T(H)=\Omega(T)\) because a constant fraction of quotes before the terminal spike trade only after more than \(H\). Yet a horizon-aware learner posting close to \(1\), e.g. \(1-1/T\), gets within \(O(1)\) of the fixed-action supremum on binary paths.

Uniform superexponential variant: let \(S_n=2^{2^n}\), \(P_{S_n}=U_n\sim{\rm Unif}[0,1]\), and \(P_t=0\) otherwise. The always-\(1/2\) learner is optimal on the dominant resolved block at \(T=S_n\), while older blocks have length \(S_{n-1}=o(S_n)\). However \(\Delta_{S_n}(H_T)\ge (S_n-S_{n-1}-H_T)/4=\Omega(S_n)\) for any \(H_T=o(T)\). Need a clean all-horizons regret bound for \(S_n\le T<S_{n+1}\).

## CE-006: Rare-History Essential-Sup Obstruction

Status: conjectural stress test.

A tiny-probability branch containing arbitrarily long positive-payoff delays can keep an essential-sup tail condition large while contributing negligible ex-ante expected regret. A concrete one-spike heavy-tail construction was suggested but not fully verified; future work should compute both the residual conditional tail and \(\Delta_T(H)\).

## CE-007: Horizon/Process-Aware Oracle Collapse

Status: accepted obstruction to any instance-wise necessity theorem under oracle quantifiers.

For any exogenous law \(P\) and horizon \(T\), define
\[
V_T^P(a)=\mathbb E_P\sum_{t\le T}r_t(a).
\]
Choose an \(\varepsilon_T\)-optimizer of \(\sup_a V_T^P(a)\) and post it in every round. The learner's expected reward equals \(V_T^P(a_T)\), so its pseudo-regret is at most \(\varepsilon_T=o(T)\), regardless of \(\beta,\gamma,\Delta_T,\Gamma_T\), or any other tail statistic. This is not an algorithmic result unless the process law and horizon are known and approximate optimization is allowed.

Notes: This obstruction is specific to the problem's \(\sup_a\mathbb E-\mathbb E\) regret. It need not hold for \(E[\sup_a]\) pathwise regret; a hidden common state can make the best pathwise fixed quote substantially better than the best fixed quote in expectation.

## CE-008: Two-Continuation Block Lower-Bound Gadget And Universal Concatenation

Status: accepted finite-block lower bound; universal/process-unaware concatenation accepted in iteration 4.

Let \(P_1=\cdots=P_N=0\) and \(P_{N+1}=c\), where \(c\in\{1/2,1\}\). Before the terminal price, the learner sees identical histories in the two instances. Any randomized learner must split between quotes below \(1/2\), which work on both continuations but under-earn when \(c=1\), and quotes above \(1/2\), which fail when \(c=1/2\). With regret against suprema,
\[
\sup_{c\in\{1/2,1\}}R^\pi(I_c^N)\ge N/4.
\]

Iteration 4 verifies the dominant-block concatenation. For any process-unaware randomized learner, or process-unaware horizon-aware family, choose \(N_i\) with previous length \(M_i=o(N_i)\) and recursively pick the worse continuation \(c_i\). At endpoint \(T_i=M_i+N_i+1\),
\[
R_{T_i}\ge N_i/4-M_i,
\]
so \(\limsup_i R_{T_i}/T_i\ge1/4\). The proof caps all rewards from earlier quotes by \(M_i\), since each old quote pays at most once and at most \(1\).

This is a universal-class/minimax obstruction, not an instance-wise theorem. It does not refute learnability by a learner that knows the deterministic continuation sequence or law.

Every constructed block sequence has \(\beta(h)=1\) and \(\gamma(h)\ge1/4\) for all \(h\): choose a block with \(N_i>h\) and quote \(a=1/4\) at its first zero, which trades deterministically only after more than \(h\) steps.

## CE-009: Random Continuations Are Not Automatically Hard

Status: accepted warning.

If the terminal bit \(c\in\{1/2,1\}\) is drawn randomly and the regret remains \(\sup_a\mathbb E[\text{fixed-action reward}]-\mathbb E[\text{learner reward}]\), the stochastic instance can be easy: the learner can target the best fixed quote in expectation. Thus the two-continuation construction should be used as an adversarial deterministic class or minimax/Yao lower-bound device, not as a hard stochastic process without changing the regret notion.

## CE-010: Same-Path Two-Horizon Prefix Conflict

Status: accepted finite obstruction; dominant-block same-path concatenation accepted in iteration 4.

Take the deterministic path
\[
P_1=\cdots=P_N=0,\qquad P_{N+1}=1/2,\qquad P_{N+2}=1.
\]
Even if the learner knows this path, a horizon-oblivious policy must choose the same first \(N\) quotes whether regret is later evaluated at \(T=N+1\) or \(T=N+2\). Quotes below \(1/2\) trade by both prefixes but under-earn at the longer prefix; quotes in \([1/2,1)\) fail at \(N+1\) but earn at \(N+2\). LB-011 gives
\[
\max\{R_{N+1},R_{N+2}\}\ge N(1/4-\eta)-O(1)
\]
with \(\eta\)-comparators.

Concatenating dominant blocks \(0^{N_i},1/2,1\) yields a deterministic known process with no horizon-oblivious anytime \(o(T)\)-regret policy, provided \(M_i=\sum_{j<i}(N_j+2)=o(N_i)\). At paired endpoints \(T_i^0=M_i+N_i+1\) and \(T_i^1=M_i+N_i+2\),
\[
\max\{R_{T_i^0},R_{T_i^1}\}\ge N_i/4-M_i-O(1).
\]
The \(O(1)\) term covers the possible reward by \(T_i^1\) of the quote posted at the intermediate \(1/2\). This obstruction is about incompatible prefix optima, not raw tail length. Sparse vanishing spikes still show \(\beta\)-failure is not necessary for anytime learnability.

## CE-011: Local Prefix Gap False Positives Without Transfer Controls

Status: accepted obstruction to overusing the prefix-compatibility modulus.

The zero-block threshold pair \(\{1/2,1\}\) has positive local compatibility gap \(1/4\), but this alone does not force endpoint regret in a larger process. If, after the threshold is revealed, there is a long suffix in which the learner can exploit the revealed environment and earn enough reward, the local prefix deficit can be offset unless the theorem caps post-divergence learner surplus. Similarly, if the hard common prefix occurs only on a branch of probability \(p_n\ll1\), the conditional gap may stay large while its expected contribution is only \(p_n |I|\kappa\).

This obstruction is distinct from the accepted block lower bounds, which avoid it by making the continuation terminal or by bounding all outside-prefix rewards by \(M_i+O(1)\). Any global information-tail theorem based on \(\kappa\) must include an outside-surplus term and probability weighting.

## CE-012: Finite-Grid Strict-Crossing Trap For \(\kappa\)

Status: accepted warning about action domains.

With strict crossing, finite-grid prefix values can be much smaller than continuum `sup` values if the grid lacks points just below a threshold. For example, with action grid \(\{0,1/2,1\}\) and terminal threshold \(c=1/2\), the best grid quote below \(c\) is \(0\), so the grid prefix value is \(0\), while the continuum comparator supremum is \(1/2\). For \(C=\{1/2,1\}\), this finite grid gives no \(1/4\) two-threshold gap. A slightly finer but still coarse grid such as \(\{0,1/4,1/2,3/4\}\) changes the local value again. Therefore finite-grid LP duals must be stated for grid-restricted learners, or converted to continuum statements by dense-grid/\(\eta\)-comparator limits.

## CE-013: Finite-\(m\) Constant Wording Stress Tests

Status: accepted warning about the scope of CL-023/LB-018.

The sharp value
\[
\left(\frac{m-1}{m}\right)^m
\]
is the supremum over \(m\)-positive-support threshold laws, not the value of every fixed \(m\)-threshold set. For example, the fixed two-threshold set \(\{0.9,1\}\) has two-threshold local gap
\[
\alpha(0.9,1)=0.9(1-0.9)=0.09,
\]
not \(1/4\).

Zero atoms are also only a scaling device. If \(\Pr(Z=0)=1-q\) and \(\Pr(Z=1)=q\), then \(\rho(Z)=q\) and \(\mathbb EZ-\rho(Z)=0\). Treating the zero atom as consuming one of the \(m\) support points or collapsing \(0\) to \(\rho\) before conditioning on \(Z>0\) changes the problem being bounded.

Finally, strict crossing means statements like "revenue at support threshold \(c_i\)" must be read as left-limit revenue \(a\uparrow c_i\). At \(a=c_i\) itself, the event \(Z>a\) excludes mass at \(c_i\).

## CE-014: Unsorted Thresholds Break The Same-Path Multi-Threshold Formula

Status: accepted warning for CL-026/LB-020.

The finite same-path lemma assumes the threshold menu appears in increasing order. For example, on the path
\[
0^N,1,1/2,
\]
at horizon \(T_2=N+2\), a zero-block action \(A_s=3/4\) has already traded at the first threshold \(1\). But \(A_s<c_2\) is false when \(c_2=1/2\). Thus the zero-block learner payoff by \(T_j\) is governed by \(\max_{\ell\le j}c_\ell\), not by the displayed \(c_j\), unless the path order is increasing.

This does not refute the accepted same-path multi-threshold lift; it records a necessary hypothesis.

## CE-015: Horizon-Aware Policies Break Same-Path Multi-Horizon Averaging

Status: accepted warning for horizon-oblivious lower bounds.

In the block
\[
0^N,c_1,\ldots,c_m,
\]
if the learner is told the evaluation horizon \(T_j=M+N+j\), it can tailor its zero-block quotes to \(c_j\). The common zero-block action law across \(j\), which is the input to the \(\kappa(C)\) averaging argument, is then absent. This is the same obstruction as the horizon/process-aware oracle collapse: CL-026 and CL-027 apply only to one infinite horizon-oblivious policy.

## CE-016: Boundaries Of The Universal \(1/e\) Upper Bound

Status: accepted warning for CL-029/LB-024.

The universal equal-revenue policy is worst-case sharp but can be very loose on easy known paths. On a path \(0^N,c\) with \(c<1/e\), the universal policy gets zero from zero-block quotes until the terminal price and loses about \(Nc\), while a process-aware horizon-oblivious policy that quotes just below \(c\) has essentially zero regret on that path.

The proof also relies on exogenous prices. If a future price can be chosen as a function of the learner's realized quote \(A_t\), then \(M_{t,T}\) is no longer a fixed scalar independent of \(A_t\), and the identity \(\mathbb E[r_t(A_t)\mid P]=g_\mu(M_{t,T})\) may fail. Deterministic-policy existence is now handled by CL-031, but explicit computability/cycling remains a separate question.

## CE-017: Boundaries Of The Deterministic Derandomized \(1/e\) Upper Bound

Status: accepted warning for CL-031/LB-026/LB-027.

The iteration-10 deterministic upper bound is an existence theorem for one fixed horizon-oblivious quote sequence. It is not an explicit computable policy unless a low-discrepancy or conditional-expectation construction is later supplied. It also gives a worst-case limsup constant, not a path-dependent characterization: on easy paths such as \(0^N,c\) with \(c<e^{-1}\), the equal-revenue-type sequence may lose order \(Nc\), while a process-aware policy tailored to the path can do essentially better.

The proof is pathwise and exogenous. If future prices react to the learner's realized quotes, the suffix maximum \(M_{t,T}\) is no longer a fixed scalar independent of the action at time \(t\), and the reduction to monotone thresholds can fail. Strict crossing must also remain explicit: all indicators are \(a_t<M_{t,T}\), and the deterministic sequence is obtained through a continuous distribution so endpoint equalities can be avoided in the probabilistic-method proof.

## CE-018: Alternating Path Refutes Necessity Of Suffix-Menu Smallness

Status: accepted warning for CL-033/LB-029.

Let
\[
P_{2k-1}=1/2,\qquad P_{2k}=1.
\]
For odd \(t\), every future horizon with a larger price sees suffix maximum \(1\), so \(C_t=\{1\}\) and \(\delta(C_t)=0\). For even \(t\), the next horizon has suffix maximum \(1/2\) and later horizons have suffix maximum \(1\), so \(C_t=\{1/2,1\}\) and \(\delta(C_t)=1/4\). Hence
\[
\sum_{t<T}\delta(C_t)\sim T/8.
\]
But the horizon-oblivious known-path policy \(a_t=1-\varepsilon_t\), with \(\frac1T\sum_{t\le T}\varepsilon_t\to0\), has \(o(T)\) regret. At even horizons it nearly matches the comparator \(1^-\) on all previous quotes. At odd horizons it loses only the same accumulated \(\varepsilon_t\)'s plus an \(O(1)\) boundary effect near the final \(1/2\). Thus the compact suffix-menu bound is sufficient only, not necessary.

Iteration 12's exact finite-prefix LP passes this stress test: in the formal left-limit model, posting \(1^-\) at every time gives \(D_n(P)=0\) for every finite prefix, because the exact fixed-comparator value is matched rather than upper-bounded by \(\sum_tM_{t,T}\).

## CE-019: Projective-Consistency Obstruction For Finite-Prefix Values

Status: open obstruction, not yet an example.

The finite-prefix horizon-conflict value \(D_n(P)\) is necessary for known-path anytime learnability: one \(o(T)\)-regret policy implies \(D_n(P)=o(n)\). However \(D_n=o(n)\) alone has not been shown sufficient. The possible obstruction is that near-optimal finite-prefix marginal families for increasing \(n\) may be incompatible: an optimizer for a long prefix can sacrifice an older horizon by an amount small relative to \(n\) but large relative to that older horizon. The fixed-envelope compactness criterion avoids this by imposing the same bounds \(e_T=o(T)\) for every finite LP.

Future work should either construct a deterministic path with \(D_n=o(n)\) but no projectively consistent \(o(T)\)-regret marginals, or prove a gluing theorem converting small \(D_n\) into a fixed sublinear envelope.

## CE-020: Abstract Parity Obstruction Is Not Yet A Market Path

Status: accepted warning; not a delayed-market-making counterexample.

The abstract parity construction from iteration 13 shows why scalar normalized finite-prefix values do not imply projective consistency in arbitrary compact feasibility problems. With special horizons \(N_k\) and a single decision \(x\in\{0,1\}\), finite prefixes can always choose the current parity and pay only the previous special-horizon loss \(o(n)\), while every fixed decision fails on infinitely many special horizons.

This obstruction cannot be imported directly into the market model. A market path has fresh quote coordinates at every time, and future payoff menus are constrained by suffix maxima. The closest simple block attempts behave differently:
\[
0^N,c_0,c_1
\]
creates a close two-threshold conflict and linear \(D_n\), while
\[
0^N,c_0,0^L,c_1,\qquad L\gg N,
\]
dilutes the old conflict and appears easy for a path-aware horizon-oblivious policy. Thus CE-019 remains open: either find a subtler market path with \(D_n=o(n)\) but no fixed envelope, or prove a market-specific gluing/localization theorem.

## CE-021: Boundary Defect Without A Shorter-Prefix Conflict

Status: accepted obstruction to a naive dual-localization proof.

Consider the separated block
\[
0^N,c_0,0^L,c_1,\qquad 0<c_0<c_1\le1,
\]
and split after the first threshold, \(m=N+1\). Let \(T_0=N+1\), \(T_1=N+L+2\), and use the two-threshold weights
\[
\lambda_0=\frac{c_1-c_0}{c_1},\qquad
\lambda_1=\frac{c_0}{c_1}.
\]
For the dual split \(u=\lambda_0e_{T_0}\), \(v=\lambda_1e_{T_1}\), the first \(N\) quote coordinates have boundary defect
\[
N\,\frac{c_0(c_1-c_0)}{c_1}.
\]
However the real shorter prefix \(0^N,c_0\) has \(D_m=0\) in the formal left-limit model. The late horizon contributes a shadow threshold \(c_1\) that is not visible inside the shorter prefix. Hence a large boundary defect cannot be directly charged to \(D_m\).

## CE-022: Alternating Two-Level Prefixes Need Not Have Exact \(D_n=0\)

Status: accepted warning for finite-alphabet sanity checks.

The infinite alternating path \(1/2,1,1/2,1,\ldots\) is easy because a stable high quote is asymptotically optimal. But the stronger statement that every alternating two-level finite prefix has exact \(D_n=0\) is false.

For a four-step prefix
\[
P_1=\ell,\quad P_2=h,\quad P_3=\ell,\quad P_4=h,
\qquad 0<\ell<h<2\ell,
\]
the relevant comparator values are
\[
V_2^*=h,\qquad V_3^*=2\ell,\qquad V_4^*=3h.
\]
Zero deficit at \(T=2\) and \(T=4\) forces high-level left-limit quotes on the active early coordinates, but then the \(T=3\) payoff is only \(h<2\ell\). Thus \(D_4>0\) in the left-limit model. This does not produce an asymptotic separator; it only prevents using exact zero as a blanket finite-prefix check.

## CE-023: Diluted Drought Refutes A Raw \(Q_T\)-Localization Test

Status: accepted finite obstruction to a proposed dichotomy; infinite separator still open.

For \(0<\ell<h\), consider
\[
0^N,\ell,0^L,h,\qquad L\gg N.
\]
At the low horizon \(T=N+1\), the stable-high regret from LB-041 is
\[
Q_T=\ell N,
\]
so \(Q_T/T\) is bounded away from zero. However this does not imply a comparable-scale finite-prefix conflict: the low-only prefix \(0^N,\ell\) has \(D=0\), since quoting \(\ell^-\) on the zero block matches the fixed comparator in the left-limit model. At the full resolving-high prefix, CL-041/LB-036 gives
\[
D_{N+L+2}=N\ell(1-\ell/h),
\]
which is \(o(N+L)\) if \(L\gg N\). The late high creates only an \(O(N)\) debt for the earlier low quotes, and the long post-low zero tail dilutes it in normalized finite-prefix value.

This blocks the route "linear \(Q_T\) at some low horizon implies a large \(D_n/n\) certificate." It does not yet give a market path with \(D_n=o(n)\) but no fixed sublinear envelope; an infinite construction would need to show that switching policies cannot keep cumulative high debt sublinear.

## CE-024: Post-Low Zero Tails Are Exactly Diluting In One Drought

Status: accepted local obstruction to over-reading drought length.

For \(0<\ell<h\), the formal left-limit finite-prefix value of
\[
h^M,0^N,\ell,0^L,h
\]
is
\[
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h),
\]
independent of \(L\). Hence the long gap after the low price and before the resolving high can make normalized \(D_n/n\) arbitrarily small without changing the local conflict.

This is not a counterexample to the fixed-envelope criterion by itself; it is a regression test. Any proposed two-level localization theorem that charges the post-low waiting time, or treats stable-high regret at the low horizon as intrinsic conflict, fails on this family.

## CE-025: Unequal Lows Break The Last-Low-Only Rule

Status: accepted as a full finite-prefix regression test for the one-drought unequal-low theorem in the formal left-limit model.

The equal-low formula from iteration 17 says that for one drought with repeated low level \(\ell\), the last low controls the local value. This does not extend naively to unequal low levels.

In the proposed reduced drought LP for
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,0^L,h,
\]
take
\[
h=1,\qquad M=0,\qquad (N_0,N_1)=(1,0),
\qquad (\ell_1,\ell_2)=(0.4,0.9),
\]
so the path is \(0,0.4,0.9,1\). The low-horizon surpluses are \(S=(0.4,1.8)\). The naive last-low-only value would be
\[
1.8(1-0.9)=0.18.
\]
The accepted one-drought LP gives
\[
z=68/225\approx0.3022,
\]
with the earlier low horizon, later low horizon, and final high all active. Iteration 18 promotes the full-to-reduced LP for one drought, so this is no longer merely a reduced-model warning. Any closed form for unequal lows must account for front-loading and earlier low constraints; the equal-low last-low formula is not a pooling-free template.
