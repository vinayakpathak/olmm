# Canonical Summary

The original essential-sup tail condition
$$
\beta(h)=\sup_{t,a}\operatorname*{ess\,sup}_{P_{1:t}}
\Pr(h<\tau_t(a)<\infty\mid P_{1:t})
$$
is a strong sufficient condition, not a necessary process-wise characterization as stated. In fact, under a finite-horizon known exogenous law, a horizon-aware oracle learner can get regret at most $T/K$ by maximizing the conditional reward curve over a $K$-grid at each time. Taking $K=T$ gives $O(1)$ regret for every known exogenous law, regardless of hitting-tail behavior.

Accepted upper-bound route for unknown/minimax exogenous classes: truncate rewards after $H$ future prices, discretize quotes to a $K$-grid, and run delayed full-information experts. A self-contained version uses $H+1$ Hedge instances by time residue. With
$$
r_t^H(a)=a\mathbf{1}\{\tau_t(a)\le \min(H,T-t)\},
$$
and comparator-gap truncation loss
$$
\delta_T^P(H)=\sup_a \mathbb E_P\sum_t r_t(a)-\sup_a\mathbb E_P\sum_t r_t^H(a),
$$
one gets, for a horizon-indexed class $\mathcal C_T$,
$$
\sup_{P\in\mathcal C_T}R_T^P
\lesssim \sqrt{T (H+1)\log K}+T/K+\sup_{P\in\mathcal C_T}\delta_T^P(H).
$$
The older worst-action loss
$$
\Delta_T^P(H)=\sup_a\sum_t\mathbb E_P[r_t(a)-r_t^H(a)]
$$
also works and is bounded by $T\beta(H)$, but can be much stronger than needed.

Thus sublinear uniform regret follows if there are schedules $H_T,K_T$ with $(H_T+1)\log K_T=o(T)$, $T/K_T=o(T)$, and uniform truncation loss $o(T)$. For power tails $\Delta_T(H)\le T H^{-\alpha}$, the existing proof gives rate $T^{(\alpha+1)/(2\alpha+1)}(\log T)^{\alpha/(2\alpha+1)}$ with $K=T$.

Necessity currently requires a different object: not raw long delay, but valuable delayed reward that remains unpredictable or indistinguishable between environments with separated optimal quotes. The finite-horizon hidden-terminal construction gives a sound minimax class-level lower bound, but not a fixed-law/process-wise necessity theorem.

Iteration 3 sharpened this lower-bound side into a Bayes-gap certificate. For unknown exogenous classes, if a prior over laws leaves the learner unable to identify which conditional reward curve is active before many decisions, then Bayes/Yao averaging lower-bounds minimax regret by the comparator value minus the best posterior-mixture quote value. In the identical-prefix terminal case this gives
$$
D\left(\mathbb E_\pi\sup_a g_\theta(a)-\sup_a\mathbb E_\pi g_\theta(a)\right).
$$
A $q$-scaled hidden-terminal pair gives regret at least $qD/8$ at horizon $T=D+1$, and, with absorbing post-horizon prices, has $\beta(h)=q$ for $h<D$ and truncation loss $\asymp q(D-H)$. This is a useful lower-bound atom, but not a matching power-tail rate theorem: under a power envelope $q\lesssim D^{-\alpha}$, the one-block lower bound is only $\Omega(D^{1-\alpha})$.

Iteration 4 clarified the Bayes/predictability route. For a fixed prior over public exogenous laws and a finite quote grid $G$, Bayes-optimal reward is pointwise myopic:
$$
\sup_A \mathbb E_{\bar P_\pi,A}\sum_t r_t(a_t)
=
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
This validates the posterior-predictive term used in Bayes-gap lower bounds. Iteration 5 repaired the finite-grid minimax step at the reward-vector level. For finite $\Theta$, finite $G$, randomized policies, and grid comparator $V_\theta^G$, let
$$
C=\{(L_\theta(A))_{\theta\in\Theta}: A\text{ is an admissible grid policy}\}\subset\mathbb R^\Theta .
$$
Because $C$ is convex and bounded, applying finite-dimensional minimax to $\overline C$ gives
$$
\inf_A\sup_\theta(V_\theta^G-L_\theta(A))
=
\sup_{\pi\in\Delta(\Theta)}
\left[\sum_\theta\pi_\theta V_\theta^G-\sup_A\sum_\theta\pi_\theta L_\theta(A)\right],
$$
and the fixed-prior myopic lemma identifies the last supremum with the finite-grid Bayes reward. Thus the corrected finite-grid identity is accepted under the stated finite, public-exogenous, randomized-policy assumptions. This is still a minimax-value characterization, not a scalar tail characterization or a matching power-tail rate theorem.

For continuum quotes, the minimax value is within $T/K$ of the $K$-grid minimax value by downward rounding both comparator quotes and learner actions. This avoids exact continuum selector issues, but any continuum Bayes-gap formula must still carry discretization errors explicitly.

Iteration 6 turns this into a clean finite-class learnability equivalence. For a finite horizon-indexed public-exogenous class $\Theta_T$, randomized policies, signed continuum minimax value $\mathcal R_T^{[0,1]}$, and grid $G_T=\{0,1/T,\ldots,(T-1)/T\}$,
$$
\left|
(\mathcal R_T^{[0,1]})_+
-
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+
\right|\le 1.
$$
Thus sublinear upper regret for finite classes is equivalent to $(\sup_\pi\Psi_{G_T}(\pi))_+=o(T)$. This is an exact value characterization up to discretization, not a scalar tail condition and not an infinite-class theorem.

Iteration 6 also formalized a deterministic tiny-price obstruction to raw delay-probability necessity. Let block $m$ contain $L_m=2^m$ zeros followed by spike $p_m=2^{-2m}$. Then the infinite-process raw $\beta(h)=1$ for every finite $h$, because arbitrarily long zero blocks have a certain future hit for quotes below the next spike. Nevertheless
$$
\sup_T\sup_a\sum_{t\le T}r_t(a)\le 1/2,
$$
so the zero-quote learner has $O(1)$ regret. This shows raw hitting-delay probability can fail simply because all long-delayed rewards are tiny.

Iteration 7 added a second raw-$\beta$ separation where the delayed rewards are not tiny, but the bad histories are rare. Draw $N$ with $\Pr(N=n)=3\cdot4^{-n}$, reveal $P_1=x_N\in(0,1/4)$, then run $2^N$ zeros, one spike at $1$, and zeros forever. The infinite-process essential-sup tail has $\beta(h)=1$ for every finite $h$, while
$$
\sup_T V_T\le 4,\qquad \sup_T\Delta_T(H)=O(1/H),
$$
and the zero-quote learner has bounded expected regret. The deterministic tiny-price example also has the stronger value-weighted estimate $\sup_T\Delta_T(H)=O(1/H)$.

For infinite unknown classes, the finite-class Bayes value has a conditional extension. On a fixed finite grid $G$, the finite-subclass modulus equals the minimax value over the product-closure of the attainable reward set $C\subset[0,T]^\Theta$. Thus finite-subclass certificates characterize the full class exactly when $C$ is product closed. Iteration 8 sharpened the most plausible no-gap hypothesis: common domination of the payoff-weighted prefix measures
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}]
$$
is weaker than domination of prefix laws and is exactly what the weak-* compactness proof needs. Under fixed finite $T,G$, public exogenous prices, and policies formalized as measurable public-prefix kernels $q_t(P_{1:t})\in\Delta(G)$, such domination should make $C$ product compact. The remaining proof obligations are policy-to-kernel reduction, Borel/completion version choices, and writing the finite-grid/continuum comparison for arbitrary infinite classes. Without a no-gap condition, compactness/measurability gaps are real.

Iteration 9 refined this status. The reward-measure domination proof is essentially complete for a relaxed completed-measure $L^\infty(\lambda_t;\Delta(G))$ prefix-kernel policy class: density representation, weak-* compactness, product compactness, and finite-intersection no-gap all work. For the original Borel private-randomized policy class, the theorem is still conditional on policy-class alignment: prove the induction from private-randomized histories to public-prefix marginal kernels, and prove that weak-* limit kernels have admissible Borel/completed implementations. Iteration 9 also strengthened the infinite-class obstruction: with a non-Borel label set $A\subset[0,1]$, horizon $T=D+1$, and grid $\{1/3,2/3\}$, every finite subclass has grid value $0$ but the full Borel-policy class has value $D/6$. This is a genuine linear measurability/product-closure obstruction, not a natural Borel statistical lower bound.

Iteration 10 clarified the remaining policy-alignment work. Under a tightly stated finite-grid public-exogenous model, an original private-randomized Borel policy should reduce to law-independent public-prefix marginal kernels $q_t(P_{1:t})$ at the level of expected reward coordinates, not necessarily at the level of joint behavior. Conversely, completed $L^\infty(\lambda_t;\Delta(G))$ kernels likely have Borel $\Delta(G)$-valued representatives under standard Borel prefix spaces and finite $G$, preserving all reward integrals because $\mu^\theta_{t,a}\ll\lambda_t$. This is promising but not yet a fully written original-policy theorem: it still requires an exact policy definition, the recursive seed/prefix induction, the completed-measurable-to-Borel-version lemma, and using one policy class consistently for finite-subclass and full-class values. The theorem preserves expected additive reward vectors, not pathwise policy behavior.

Iteration 11 adds a clean tail-profile no-go proposition. Compare the q-scaled hidden-terminal two-world class with a labeled version where $P_1$ reveals the world before any payoff-relevant quote, while $P_{2:T}$ is unchanged world by world. Under the stated protocol, legal quote rewards and per-world $\beta,\Delta,\delta$ profiles are identical in the hidden and labeled classes. Nevertheless the hidden class has minimax regret at least $qD/8$ at $T=D+1$, while the labeled class has zero continuum regret (and zero grid regret on grids containing $1/2,3/4$, otherwise only discretization error). Thus scalar criteria depending only on individual-law delay/truncation profiles cannot characterize unknown-class learnability; public observability/predictability is essential.

Iteration 12 accepts two narrow measure-theoretic closures. First, the density-form support term in the payoff-measure dominated $L^\infty$ proof equals the conditional Bayes envelope in $\Psi_{G,F}$ for finite $F,G$: common-dominator invariance lets one compute the same finite-measure functional using either $\lambda_t$ or the mixture prefix law. Second, the forward Borel-policy alignment lemma is proved under an explicit finite-grid public-exogenous seed/state model: common Borel policies with independent private uniforms, standard Borel internal state, full public observation, and reconstructible feedback induce law-independent Borel public-prefix kernels preserving expected reward vectors. This is not pathwise equivalence, and primitive stochastic-kernel policies still require a standard randomization lemma if not defined directly by seed maps.

Iterations 8-12 did not solve the full problem. The accepted package is a finite-class/product-closed or payoff-measure dominated finite-grid value characterization, with the original Borel-policy version conditional on using the exact common Borel policy model and the Borel/completed implementation lemma. It is not a scalar tail characterization, not an arbitrary-infinite-class theorem without no-gap hypotheses, and not a matching lower-rate theorem. Matching power-tail lower bounds remain open.

Iteration 13 sharpened two open fronts without closing either. On lower bounds, naive multi-scale repetition of q-scaled terminal atoms still fails: a shared hidden type with full reveal gives only about $D$ useful regret after roughly $1/q$ informative blocks, independent hidden bits make a single fixed comparator gain only fluctuation size $(\sum_j w_j^2)^{1/2}$, and in the actual persistent-quote protocol same-level repeated atoms can create long-delay hits with probability near one, breaking the intended tail envelope. A noisy common-parameter / limited-leakage construction is the next concrete test, but no matching power-tail lower bound is known.

On upper bounds, a clean tail-adaptive truncation route reduces the market problem to an unproved heterogeneous-delay full-information experts lemma. Treat each pair $(H,b)$ as an arm with surrogate reward $r_t^H(b)$, revealed after delay at most $H$. If regret to comparator arm $(H,b)$ scaled like $\sqrt{T(H+1)\log(K\log T)}$, then
$$
R_T^P\le T/K+\min_{H\in\mathcal H}\{\delta_T^P(H)+B_T(H)\}
$$
over dyadic windows. Standard max-delay delayed Hedge only pays the largest candidate $H$, so this remains conditional.

Iteration 14 adds useful reductions but no closing theorem. First, fixed-quote rewards have the pathwise last-exceedance form: for $L_a=\max\{s\le T:P_s>a\}$, $r_t(a)=a\mathbf{1}\{L_a>t\}$ and $\sum_t r_t(a)=a(L_a-1)_+$. This is a clean algebraic reason that comparator value is about last future exceedances, not raw first hitting tails.

Second, the two-arm fast/slow heterogeneous-delay test reduces exactly to a delayed advantage game. With fast reward $f_t$, slow reward $s_t$, $\Delta_t=s_t-f_t$, slow-play probability $q_t$, $S_T=\sum_t\Delta_t$, and $A_T=\sum_t q_t\Delta_t$, the regrets are $R_F=-A_T$ and $R_S=S_T-A_T$. The desired theorem becomes the still-unproved pair $A_T\gtrsim-\sqrt T$ and $A_T\gtrsim S_T-\sqrt{TD}$. Safe delayed wealth/coin-betting is a candidate route, but no proof or many-arm extension is available.

Third, nested truncation windows have a corrected horizon-censored increment decomposition
$$
z_t^m(b)=b\mathbf{1}\{H_{m-1}<\tau_t(b)\le H_m,\ \tau_t(b)\le T-t\}.
$$
This suggests replacing generic heterogeneous-delay experts by a nested-window oracle that charges short-window regret to the full-versus-truncated value gap. However, the iteration 14 critique found a pathwise-versus-expected comparator ambiguity: a pathwise charge $\mathbb E[V_M(\omega)-V_m(\omega)]$ is not controlled by $\delta_T^P(H_m)$, while the expected-value oracle would need a new online proof. Tail-adaptive truncation therefore remains open.

Iteration 15 adds one solid piece to the two-arm delayed-advantage program: a solvency invariant. If $O_t=\sum_{u\le t-D}q_u\Delta_u$, $P_t=\sum_{t-D<u<t}q_u$, and a predictable learner enforces $q_t\le [B+O_t-P_t]_+$, then $A_T=\sum_tq_t\Delta_t\ge -B$ pathwise. This proves fast-comparator safety under the delayed full-information advantage model. It does not prove slow capture. In particular, the naive safe-clipped delayed-Hedge rule $q_t=\min\{p_t,C_t,1\}$ can spend its capacity to zero and then fail to recover on later positive advantages, giving linear slow regret.

Iteration 15 also refutes the strongest simultaneous expected nested-window oracle. On a deterministic finite-grid market with $G=\{\ell,h\}$, $h=\ell+d$, $H_1=1$, $H_2=D$, periodic medium prices $m\in(\ell,h)$, and high spikes every $D$ rounds, $V_1^G=\ell ND$, $V_2^G=hND$, and $V_2^G-V_1^G=dND$. Near-optimal long-window performance forces high quotes on almost all active rounds, which creates short-window regret about $\ell ND$. For fixed oracle constant $c$, choosing $d\ll \ell/c$ and then $N,D$ large violates
$$
V_m^G-\mathbb E L^m(A)\le B_m+c(V_2^G-V_m^G)
$$
with standard $B_1=O(\sqrt{ND})$, $B_2=O(D\sqrt N)$. This kills that nested-oracle route, but not every possible adaptive-truncation algorithm.

Iteration 16 did not add a stopping theorem. The finite-grid finite-class Bayes identity, $T/K$ grid-to-continuum comparison, product-closure no-gap theorem, and completed $L^\infty$ payoff-measure dominated kernel theorem survive as a referee-style partial package. But the solver's "best current iff" was rejected as a solution to the original problem: arbitrary infinite classes, scalar tail iff conditions, and matching power-tail lower rates remain open. All finite-horizon reward-curve notation should use the horizon-censored maximum $M_t=\max_{t<s\le T}P_s$, with empty future giving zero reward; post-horizon prices must not enter $r_t$. The original Borel-policy no-gap upgrade is still conditional until both inclusions between common Borel seed/state policies and completed prefix kernels are written, with standard randomization/Borel-version facts and weak-* simplex closedness. Any such upgrade preserves expected additive reward coordinates only, not pathwise behavior.

Iteration 19 adds an abstract arbitrary-class finite-grid value duality. For fixed finite $T,G$, public exogenous prices, and a convex randomized policy reward set $C=\{L(A)\}\subset\ell^\infty(\Theta)$,
$$
\inf_{c\in C}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta)
=
\sup_{\nu\in ba_1^+(\Theta)}
\left\{\langle V^G,\nu\rangle-\sup_{c\in C}\langle c,\nu\rangle\right\}.
$$
The critics accept this as a norm-duality/Hahn-Banach or Sion theorem, assuming ex-ante randomization and a fixed finite grid. It is not an ordinary Bayes/posterior formula: a finitely additive prior need not induce a countably additive mixture law or conditional reward envelope. Finite-support priors recover only the product-closure/finite-subclass relaxation; $ba$ witnesses true infinite-class gaps at the cost of losing statistical interpretability. Thus the learnability statement is $(\mathcal R_T^G)_+=o(T)$, with continuum quotes still handled by the existing $T/K$ comparison, not a scalar tail characterization or a rate theorem.

Technical hygiene for future statements: use $\sup_a$ instead of $\max_a$ unless attainment is proved; state whether prices are exogenous or action-dependent; state whether the learner knows the law or must be uniform over an unknown class; state whether algorithms may depend on the horizon $T$; and specify whether "sublinear regret" means an upper-regret/positive-part convention, since adaptive learners can beat the best fixed quote. The known-law oracle lemma is horizon-aware and does not settle anytime, computational, unknown-law, or action-dependent models.

Iteration 20 rejects a second "SOLVED: maybe" claim based on the $\mathrm{ba}$ dual. What survives is a referee-safe proof route for the same abstract value theorem: separate $V-\alpha\mathbf{1}$ from the norm closure of $C-X_+$, use downward closedness to force a positive separator, normalize it to a finitely additive probability, and keep the support term $\sup_{c\in C}\langle c,\nu\rangle$ abstract. The resulting condition $(\mathcal R_T^{G_T})_+=o(T)$, even in dual form, is essentially the minimax value being sublinear; it is not a structural tail criterion or a matching-rate theorem. Iteration 20 also makes the original Borel-policy payoff-domination bridge more precise: under the exact finite-grid public-exogenous common seed/state policy model, $C_{\rm Borel}=C_{L^\infty}$ is likely provable as expected additive reward-coordinate equality via public-prefix marginals plus Borel versions of completed kernels, but it still needs standard measurable-version/randomization facts and must not be stated as behavioral or pathwise equivalence.

Iteration 21 adds no new solution claim. It confirms that the $\mathrm{ba}$ dual is proof-ready as an abstract convex reward-set theorem once standard functional-analysis facts are cited, and that the Borel-policy bridge remains a credible but still unwritten theorem under the exact finite-grid public-exogenous seed/state model. Both tracks are theorem-hygiene/value-characterization progress only: no scalar tail iff, no ordinary posterior formula for arbitrary $\mathrm{ba}$ priors, no matching power-tail lower rate, and no action-dependent or anytime theorem.

Iteration 22 again adds no stopping theorem. On adaptive truncation, the two-arm delayed-advantage target remains open: solvency gives fast safety, but single-account schemes are too weak. In particular, even for $D=1$, a no-restart fractional-capital rule $q_t=C_t/2$ can be exponentially depleted by a long negative prefix and then miss linearly many rewards on a positive suffix. Interval/restart testers are a plausible next proof strategy, but their aggregation under the constraint $\sum q_t\le1$ is unproved.

On matching lower rates, a limited-leakage common-type construction works as an abstract block-local Bayes diagnostic. If each block of length $D$ has reward separation $\gamma$ and per-block information leakage at most $\kappa$, then the block-local Bayes gap is about $D\gamma\min\{N,1/\kappa\}$. A simple terminal-price perturbation can realize $\kappa\asymp\gamma^2/q$ for one block. However, this has not produced a market lower bound: same-level repeated market blocks are not block-local because old quotes persist and can be hit by later terminal prices. With $n$ remaining terminal draws the reward curve is $a[1-(1-r_{\theta,a})^n]$, and in the useful regime $Nq\gg1$ the intended $q$-tail envelope can explode. Any future lower-rate construction must prove a localization gadget or compute this coupled market Bayes value directly.
