# Failed Attempts

## FA-001: Proving Necessity From Unweighted \(\beta\)

Failed. The sparse vanishing-spike process has \(\beta(h)=1\) for all \(h\) because \(a=0\) waits across arbitrarily long gaps, yet all fixed comparator value is \(O(1)\). Long finite hitting times at zero or vanishing payoff scale do not imply regret hardness.

## FA-002: Treating \(\gamma(h)\to0\) As Necessary

Failed for instance-wise/process-aware learnability. A coded-delay process can reveal which long delay will occur, keep \(\gamma(h)\ge1/4\), and still make \(a=1/2\) the known optimal quote for every horizon. Positive-payoff delayed tails alone are not a learning obstruction.

## FA-003: Treating Horizon-Tail Loss \(\Delta_T\) As A Characterization

Failed or strongly weakened. Predictable sparse spikes can make \(\Delta_T(H_T)=\Omega(T)\) along infinitely many horizons for every \(H_T\log T=o(T)\), while a process-aware learner posts a known near-optimal quote and gets sublinear regret. Raw delayed reward mass is not the same as information needed for learning.

## FA-004: Using Comparator `max` Without Checking Attainment

Failed. Strict trade condition \(P_s>a\) and atomic prices can make the best fixed action unattained. Future price constantly equal to \(c\) gives a payoff supremum as \(a\uparrow c\), but action \(a=c\) does not trade. Future writeups should use \(\sup\) unless continuity/no-atom conditions are proved.

## FA-005: Citing Delayed-Feedback Literature Without The Model Map

Incomplete. Delayed-learning results support the finite-grid step only after stating that prices are public/exogenous and that all truncated grid rewards are computable after at most \(H\) rounds. Bandit, anonymous, and composite-delay references are often adjacent rather than direct support for this full-information reduction.

## FA-006: Rare-History Obstruction As A Lemma

Not yet proved. Reports repeatedly suggest that rare positive-probability histories can keep an essential supremum large while contributing negligible expected regret, but no complete process and horizon calculation has been written. Keep as a candidate stress test.

## FA-007: Overstrong Envelope Claim

The claim "regret bounded by any prescribed sublinear envelope" was overbroad if the envelope is not eventually positive/nondecreasing or if it tends to zero. A corrected version should be stated only for sufficiently large horizons and with explicit spike amplitudes \(c_n>0\), \(c_n/s_n\le1\), and \(c_n\le q(s_n)/4\) after the finite prefix.

## FA-008: Necessity Under Horizon-Aware Process-Law Oracle Policies

Failed completely for the problem's pseudo-regret. If a policy may depend on both the exogenous law \(P\) and the horizon \(T\), it can choose an \(\varepsilon_T\)-optimal fixed quote for \(V_T^P(a)=\mathbb E_P\sum_t r_t(a)\) and play it every round. This gives \(R_T^P\le\varepsilon_T=o(T)\) for every process, so no nontrivial tail condition can be necessary under this quantifier order. This failure relies on pseudo-regret, exogeneity, and horizon/law awareness.

## FA-009: Presenting The Two-Continuation Mixture As A Hard Stochastic Process

Failed under the current expected-comparator regret definition. Randomizing the terminal continuation \(c\in\{1/2,1\}\) is useful as a minimax/Yao-style proof device for deterministic instances, but the stochastic mixture itself may be easy because the comparator is \(\sup_a \mathbb E[\text{reward of }a]\). A learner can often match the best expected fixed quote up to epsilon. The block construction should be stated as a universal-class or minimax lower bound, not as an instance-wise stochastic-process lower bound.

## FA-010: Generic Horizon-Oblivious Oracle Collapse

Failed. Removing horizon awareness from the process-aware oracle regime is a real restriction. On the known deterministic path \(0^N,1/2,1\), the same early quotes must serve both prefixes \(N+1\) and \(N+2\), whose best fixed quotes approach \(1/2\) and \(1\), respectively. LB-011 shows one of the two prefix regrets is \(\Omega(N)\). Thus the horizon-aware collapse CL-014 does not automatically extend to one anytime policy.

## FA-011: Restoring Raw \(\beta\)-Necessity By Requiring Horizon-Oblivious Policies

Failed. The horizon-oblivious regime is nontrivial, but sparse vanishing spikes still give \(\beta(h)=1\) for all \(h\) and the always-zero policy is an anytime policy with \(O(1)\) regret. Any necessity theorem in this regime must measure prefix incompatibility or decision-relevant delayed information, not the unweighted uniform tail alone.

## FA-012: Reading Concatenated Lower Bounds As Instance-Wise Necessity

Failed. Iteration 4 promotes two real lower bounds, but both depend on stronger quantifiers: a process-unaware universal learner facing a sequence chosen after the learner is fixed, or one horizon-oblivious policy evaluated at incompatible prefixes. Neither theorem says that every process with \(\beta\not\to0\) or \(\gamma\not\to0\) is hard. Process-aware horizon-specific oracle policies and sparse vanishing spikes remain decisive obstructions to any raw instance-wise tail necessity statement.

## FA-013: Treating A Local Prefix-Compatibility Gap As A Standalone Lower Bound

Failed as a general principle. A positive local gap \(\kappa_I(\mathcal U)\) only lower-bounds regret when the policy model forces the same prefix action law across candidates and when rewards outside the tested prefix cannot compensate the local deficit. After the candidate continuation is revealed, a long suffix can let the learner recover; on rare prefix events, a large conditional gap contributes only its event probability to expected regret. Any transfer lemma must include an outside-surplus cap \(B_u\), probability weighting for the common-prefix event, and a precise definition of the candidate set as alternative laws/horizons rather than realized hidden futures.

## FA-014: Treating The Multi-Threshold Dual Law As A Hard Stochastic Instance

Failed under the current pseudo-regret. The equal-revenue or other dual distribution over terminal thresholds is a minimax certificate showing that some deterministic continuation is bad for a common prefix action law. If that threshold is instead sampled as a stochastic process and regret remains \(\sup_a\mathbb E[\text{fixed-action reward}]-\mathbb E[\text{learner reward}]\), a learner can target the best fixed quote in expectation. This repeats the stochastic-mixture trap from FA-009.

## FA-015: Using Finite-Grid \(\kappa\) Directly Against Continuum Learners

Failed without a limiting argument. A finite-grid prefix gap only lower-bounds learners restricted to that grid. Under strict crossing, a coarse grid may not contain quotes just below thresholds, so even \(v_c=c\) can fail on the grid. To lower-bound the original continuum-action problem, define \(\kappa\) over \([0,1]\) with `sup` conventions or pass through dense grids/\(\eta\)-comparators.

## FA-016: Misstating The Finite-\(m\) Equal-Revenue Theorem

Unsafe without support and strict-crossing conventions. The sharp constant \(((m-1)/m)^m\) is for laws on \([0,1]\) with at most \(m\) positive support points, using
\[
\rho(Z)=\sup_a a\Pr(Z>a).
\]
Zero atoms should be conditioned away first because they only scale the gap; counting a zero atom as one of the \(m\) support points changes the convention. Likewise, under strict crossing, support prices themselves need not attain the revenue; the proof uses left limits \(a\uparrow c_i\). The dual equal-revenue law remains a deterministic-continuation certificate, not a hard stochastic instance under pseudo-regret.

## FA-017: Paying An Unnecessary \(O(m)\) Loss In Same-Path Multi-Threshold Blocks

Overly conservative. Earlier versions of the same-path multi-threshold lift subtracted an \(O(m)\) cap for learner rewards from intermediate threshold-round posts. Iteration 8 shows this loss cancels in the finite block when thresholds are increasing and regret uses comparator suprema: at horizon \(T_j=M+N+j\), the comparator quote \(a\uparrow c_j\) also has \(j-1\) intermediate threshold-round earning opportunities, exactly matching the crude \((j-1)c_j\) cap on the learner's intermediate rewards. The correct finite bound is \(N\kappa(C)-M\), not \(N\kappa(C)-M-O(m)\). The denominator in diagonal concatenations still requires \(m_i=o(N_i)\).

## FA-018: Applying The Same-Path Formula To Unsorted Threshold Menus

Invalid as stated. The identity that a zero-block quote \(A_s\) has traded by \(T_j\) iff \(A_s<c_j\) uses \(0<c_1<\cdots<c_m\) in path order. If the thresholds are unsorted, the effective threshold by \(T_j\) is \(\max_{\ell\le j}c_\ell\), and the \(\kappa(C)\) formula for the displayed order no longer follows directly.

## FA-019: Treating Finite-Menu Primal Weights As Attained Actions

Unsafe under strict crossing. The explicit finite-menu strategy puts mass on formal quotes \(c_i^-\). In the original action space, quote \(a=c_i\) does not trade at threshold \(c_i\), so the displayed equalities are only left-limit statements. Correct formulations either work in a left-limit compactification or use actual quotes \(c_i-\eta_i\) and then let \(\eta_i\downarrow0\).

## FA-020: Epoch-By-Epoch Composition As The Only Known-Path Upper Route

Overcomplicated and potentially misleading. Local block mixtures do not obviously compose by concatenating epochs because one fixed comparator spans multiple blocks and old quotes can fill at later records. Iteration 9 gives the cleaner suffix-max representation \(M_{t,T}=\max_{t<s\le T}P_s\), which absorbs old fills into one scalar per quote time and yields the universal \(1/e\) upper bound directly. The sharper path-dependent \(\sum_t\delta(C_t)\) framework still needs infinite-menu/selector cleanup.

## FA-021: Treating The Derandomized \(1/e\) Upper Bound As A Tail Characterization

Failed. Iteration 10 derandomizes the known-path horizon-oblivious \(1/e\) upper bound, but it does not solve the original iff conjecture or provide a necessary tail condition. Sparse vanishing spikes, horizon/process-aware oracle collapse, and stochastic-mixture pitfalls remain unchanged. The deterministic \(1/e\) theorem should be stated only as a worst-case anytime result for exogenous paths, not as evidence that raw \(\beta,\gamma,\Delta_T\), or \(\Gamma_T\) tails are necessary.

## FA-022: Using A Naive VC Argument For Monotone-Threshold Derandomization

Unsafe. The class of indicators \((t,a)\mapsto1\{a<c_t\}\) with \(c_t\) nonincreasing in \(t\) can realize complicated antichains; finite-dimensional VC control is not the clean route. The accepted derandomization uses either an elementary finite grid over monotone sequences, with a union bound and Hoeffding, or a one-dimensional monotone bracketing argument. The latter may improve rates but needs an explicit entropy statement before being cited as a proof.

## FA-023: Treating The Compact Suffix-Menu Bound As A Characterization

Failed. The compact suffix-menu theorem gives a useful sufficient condition
\[
R_T\le\sum_{t<T}\delta(C_t)+o(T),
\]
but \(\sum_{t<T}\delta(C_t)=o(T)\) is not necessary even for deterministic known exogenous paths. The alternating path \(1/2,1,1/2,1,\ldots\) has linear \(\sum_t\delta(C_t)\), while quoting \(1-\varepsilon_t\) with vanishing average \(\varepsilon_t\) gives \(o(T)\) regret. The local proof upper-bounds the comparator by \(\sum_tM_{t,T}\), which can be much larger than the value of one fixed comparator quote.

## FA-024: Naive Pointwise Compact-Menu Approximation And Direct Dual Law

Unsafe as first proof. For arbitrary nested finite dense \(D_n\subset C\), the successor maps \(s_{D_n}\) need not converge pointwise everywhere to \(s_C\); endpoint and gap-boundary points can fail. The compact lower bound should use finite Hausdorff approximations with a.e. successor convergence/root convergence, or finite lower-net arguments plus the accepted finite-menu theorem. A direct infinite dual survival law is plausible only with a strict-successor convention and separate checks of right-continuity, atoms, support, and singleton cases.

## FA-025: Deriving An Infinite Anytime Policy From \(D_n=o(n)\) Alone

Not proved. Iteration 12 defines the finite-prefix horizon-conflict value \(D_n(P)\). If a deterministic known path has one horizon-oblivious randomized policy with \(R_T=o(T)\), then necessarily \(D_n(P)=o(n)\). The converse was tempting, but the compactness proof does not go through from this scalar normalization: a finite optimizer for prefix \(n\) may spend regret that is \(o(n)\) but still linear relative to an older fixed horizon \(T\ll n\), and product compactness preserves fixed closed constraints, not moving outer-prefix-normalized constraints.

The corrected compactness statement uses a fixed sublinear envelope \(e_T=o(T)\) that is feasible for every finite-prefix LP simultaneously. No deterministic path separating \(D_n=o(n)\) from the fixed-envelope criterion is known yet, so \(D_n=o(n)\) should be recorded as necessary and open as a possible sufficient condition only with an additional projective/gluing argument.

## FA-026: Generic Gluing Or Dyadic Localization From Scalar \(D_n=o(n)\)

Still not proved. Iteration 13 tried to turn \(D_n=o(n)\) into a global anytime policy by arguing that any failure of a fixed envelope should yield a finite-prefix dual certificate with mass on comparable-scale horizons, forcing \(D_n=\Omega(n)\). This dyadic localization lemma is the right proof target, but it remains unsupported.

There is also an abstract non-market obstruction to any proof that uses only scalar finite-prefix values. Let \(N_k\) grow with \(N_{k-1}/N_k\to0\), let a compact decision \(x\in\{0,1\}\), and set
\[
f_{N_k}(x)=N_k1\{x\ne k\bmod2\},\qquad f_T(x)=0
\]
otherwise. For \(N_k\le n<N_{k+1}\), choosing \(x=k\bmod2\) makes the finite-prefix value at most \(N_{k-1}=o(n)\), but no fixed \(x\) has \(f_T(x)=o(T)\) along all special horizons. This is not a market-making counterexample, because it ignores the suffix-maximum structure and fresh quote coordinates, but it rules out a model-free compactness proof.

## FA-027: Simple Market Parity Separator Via Separated Blocks

Failed as a counterexample, though useful as a stress test. The natural market analogue
\[
0^N,c_0,0^L,c_1,\qquad 0<c_0<c_1
\]
can make the normalized old conflict small when \(L\gg N\), but then a path-aware horizon-oblivious policy can quote near \(c_0\) in the first zero block and near \(c_1\) in the long later block; the old loss is diluted by the many new quote opportunities. Iteration 14 proves the exact formal value
\[
D_{N+L+2}=N\,\frac{c_0(c_1-c_0)}{c_1}.
\]
Thus this failed route is now better understood: the old conflict is not merely heuristically diluted; its exact contribution remains \(O(N)\) while the later block can make the prefix length \(N+L+2\) much larger. Close conflicts make \(D_n\) linear, while conflicts far enough apart to hide from \(D_n/n\) may also become easy for a fixed path-aware policy.

## FA-028: Boundary Defect Implies A Shorter-Prefix Certificate

Refuted in iteration 14. For a dual split \(w=u+v\), the exact identity
\[
\Phi(u+v)=\Phi(u)+\Phi(v)+
\sum_{t<m}\bigl(f_t(u)+f_t(v)-f_t(u+v)\bigr)
\]
shows that the boundary term is real cross-scale incompatibility. However it does not imply a real prefix conflict visible in \(D_m\).

The separated block
\[
0^N,c_0,0^L,c_1,\qquad 0<c_0<c_1\le1,
\]
split at \(m=N+1\), has boundary defect
\[
N\,\frac{c_0(c_1-c_0)}{c_1}
\]
for the two endpoint dual weights, while the shorter prefix \(0^N,c_0\) has \(D_m=0\) in the left-limit model. Late horizons can create shadow objectives that are invisible inside the shorter prefix.

Surviving route: define a boundary-augmented prefix LP that includes late shadow objectives, or prove that repeated cross-scale defects force large \(D_n\) at some comparable scale. The direct inequality charging boundary defect to \(D_m\) should not be used.

## FA-029: Finite-Alphabet Consecutive-Ones Structure Alone Gives Localization

Not proved. Finite alphabets give an exact laminar/interval dual reduction, but the desired uncrossing theorem remains unsupported because the objective contains nested maxima: a horizon-wise comparator maximum over price levels and a learner-side time-wise maximum over price levels.

The one-level case is easy and has \(D_n=0\). The two-level positive-part formula is accepted as a test bed, but it is not yet a localization theorem. Also, the sanity check "alternating \(\ell,h,\ell,h,\ldots\) has exact \(D_n=0\)" is false for arbitrary \(0<\ell<h\); e.g. the finite prefix \(\ell,h,\ell,h\) with \(h<2\ell\) has a genuine finite-prefix conflict. The correct easy alternating statement is asymptotic/stable-comparator dependent, not exact for every two-level ratio.

## FA-030: Linear Stable-High Regret As A Two-Level \(D_n\) Certificate

Refuted in iteration 15. For two levels \(0<\ell<h\),
\[
Q_T=[\ell(L_\ell(T)-1)_+-h(L_h(T)-1)_+]_+
\]
is exactly the regret of always quoting \(h^-\). It is not an intrinsic horizon-conflict certificate.

The finite path
\[
0^N,\ell,0^L,h,\qquad L\gg N,
\]
has \(Q_{N+1}=\ell N\) at the low horizon, but the low-only prefix \(0^N,\ell\) has \(D=0\) because the learner can quote \(\ell^-\). At the resolving high horizon, the accepted separated-block formula gives
\[
D_{N+L+2}=N\ell(1-\ell/h),
\]
which is sublinear in the full prefix length when \(L\gg N\). Thus the proposed dichotomy "\(Q_T\) linear implies a comparable-scale \(D_n=\Omega(n)\)" is false as stated.

Surviving route: track resolved low-surplus relative to the later high that resolves it, and account for persistent high debt created by low-level quote mass. Multi-low droughts and interactions across droughts remain open.

## FA-031: Treating Post-Low Zero Tails As Additional Single-Drought Conflict

Failed in iteration 16 for the one-low two-level prefix. In the formal left-limit model,
\[
D_{M+N+L+2}(h^M,0^N,\ell,0^L,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h),
\]
independent of \(L\). The horizons after the low and before the resolving high have the same active low-side structure as the low horizon, while post-low quote coordinates have no positive future until the final high and can be quoted \(h^-\). Thus a long post-low zero tail dilutes \(D_n/n\) but does not create a new local obstruction.

This strengthens the warning from FA-030: localization cannot be based on stable-high regret at the low horizon or on the length of the post-low waiting time alone. The next plausible obstruction must involve multiple lows, unequal low levels, overlapping droughts, or cumulative high debt across repeated droughts.

## FA-032: Extending The Equal-Low Last-Low Rule To Unequal Lows

Failed as a reduced-LP heuristic in iteration 17. The accepted equal-low multi-low drought formula depends on all low prices being the same \(\ell\); then cumulative low surplus \(S_j=[\ell(s_j-1)-h(M-1)_+]_+\) is monotone and front-loading \(S_j/h\) low mass dominates earlier low constraints.

For unequal lows this monotonicity breaks. In the proposed reduced drought LP, even the small path
\[
0,\ 0.4,\ 0.9,\ 1
\]
with \(h=1\) has value \(68/225\approx0.3022\), whereas the naive last-low-only expression gives \(1.8(1-0.9)=0.18\). The earlier \(0.4\)-horizon genuinely binds. Iteration 18 promotes the one-drought full-to-reduced LP, so this is now a full finite-prefix regression test against any simple last-low formula for variable low levels.

## FA-033: Miscomputing The Two-Low Regression Value As \(14/45\)

Failed in iteration 18. For the path
\[
0,\ 0.4,\ 0.9,\ 1,
\]
one feasible reduced-LP point gives \(z=14/45\), but it is not optimal. The exact one-drought LP value is
\[
D_4=68/225,
\]
with primal masses
\[
x_{0,0.4}=11/45,\quad x_{0,0.9}=34/45,\quad x_{1,0.9}=4/5.
\]
The mistaken \(14/45\) point leaves the second low constraint slack and overstates the need to fill the second segment with \(0.9^-\). Future finite-LP regression checks should require matching primal and dual certificates before changing recorded constants.
