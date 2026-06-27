# Promising Directions

## 0. Write the finite/no-gap Bayes theorem package with scope guards
Goal: Convert the accepted partial results into a referee-style package: finite-grid finite-class minimax/Bayes identity, $T/K$ grid-to-continuum comparison, positive-part finite-class learnability corollary, product-closure no-gap theorem, and payoff-measure dominated completed-kernel no-gap theorem.
Why promising: Iteration 16 confirmed this is the closest valid necessary-and-sufficient statement currently available.
Critical checks: State public exogenous prices, known horizon and class, randomized policies, finite $G$, finite $\Theta$ for exact $\Psi_G$, and horizon-censored $M_t=\max_{t<s\le T}P_s$. Include a "not claimed" paragraph: no scalar tail iff, no arbitrary infinite-class theorem, no matching power-tail lower rates, no action-dependent prices.

## 1. Lock the model taxonomy
Goal: Write a short theorem map separating four regimes: known finite-horizon exogenous laws, unknown/minimax exogenous classes, horizon-free anytime policies, and action-dependent markets.
Why promising: Iteration 2 shows known finite-horizon exogenous laws are always oracle-learnable, while the existing upper and lower bounds are really about unknown classes.
Critical checks: State whether the learner knows $T$, knows the law, observes all public prices, and whether prices are independent of actions.

## 2. Formalize the known-law oracle boundary
Goal: Add a clean lemma to the final write-up: conditional grid maximization gives $R_T\le T/K$ for every known exogenous law on $P_{1:T}$.
Why promising: This decisively rules out nontrivial fixed-law tail necessity under horizon-aware law-aware quantifiers.
Critical checks: Use $\sup_a$, handle $a=1$, state measurability via finite-grid conditional expectations, and label the result non-computational/oracle.

## 3. Write the clean sufficient theorem with $\delta_T(H)$
Goal: State and prove the exogenous unknown-class theorem using
$$
\delta_T^P(H)=\sup_a\mathbb E_P\sum_t r_t(a)-\sup_a\mathbb E_P\sum_t r_t^H(a).
$$
Why promising: This is the strongest accepted upper-bound route and subsumes the older $T\beta(H)$ theorem.
Critical checks: Include the $H+1$-residue Hedge lemma inline, use $\sup_a$, horizon-indexed classes $\mathcal C_T$, one uniform schedule $H_T,K_T$, and public exogenous prices.

## 4. Formalize the Bayes-gap lower-bound certificate
Goal: Turn the posterior Bayes-gap and identical-prefix constructions into theorem-ready propositions with exact quantifiers:
$$
\Gamma=
\frac12(\sup_a g_0(a)+\sup_a g_1(a))
-\sup_a\frac{g_0(a)+g_1(a)}2.
$$
If two laws are observationally identical for $D$ rounds and later rewards are controlled, minimax regret is at least $D\Gamma$. More generally, Bayes regret is lower-bounded by world-specific comparator value minus the posterior-mixture quote envelope.
Why promising: It captures the real lower-bound mechanism: valuable delayed reward plus indistinguishability.
Critical checks: Specify $\mathcal I_t$, mixture law, posterior, and regular conditionals; keep it finite-horizon/class-level unless a separate infinite-process argument is proved; do not replace $\sup_a\sum_t g_{t,\theta}(a)$ by $\sum_t\sup_a g_{t,\theta}(a)$ when curves vary over time.

## 5. Use the $q$-scaled hidden-terminal atom carefully
Goal: Incorporate the completed construction: terminal revelation with probability $q$ gives regret $qD/8$, $\beta(h)=q$ for $h<D$ under absorbing extension, and $\Delta,\delta\asymp q(D-H)$.
Why promising: It is the cleanest finite-horizon quantitative certificate that valuable delayed tail mass can force minimax regret when the active law is hidden.
Critical checks: Always state unknown-class quantifiers and absorbing post-horizon extension for $\beta$. Do not claim power-tail rate matching from this atom alone; it gives only $D B(D)$ under envelope $B$.

## 6. Seek multi-scale or limited-leakage lower rates
Goal: Build lower-bound families that accumulate more than one $qD$ atom without iid comparator collapse or learning a global type after the first reveal.
Why promising: This is the main route left for matching the truncation upper rate under power tails.
Critical checks: Candidate tools include Le Cam/Fano families, terminal observations with small TV/KL, multi-scale hidden states, or block designs where the best fixed quote remains separated across unresolved parts. Iteration 13 adds three checks before any construction is trusted: shared full-reveal types saturate after about $1/q$ informative blocks; independent bits give only fixed-comparator fluctuation $(\sum_jw_j^2)^{1/2}$; and same-level repeated atoms can violate the intended tail envelope because old quotes trade on later spikes. The next concrete test is a noisy common-parameter construction with per-round gap $\gamma$ and terminal KL $\kappa$, checking whether an unavoidable $\kappa\gtrsim\gamma^2/q$ tradeoff holds.
Iteration 22 update: In an abstract block-local two-type model, limited leakage can accumulate Bayes gap
$$
D\gamma\sum_{j=0}^{N-1}\mathbb E\min(p_j,1-p_j)
\gtrsim D\gamma\min\{N,1/\kappa\}.
$$
But this is not yet a market construction. Same-level delayed-market blocks have coupled reward curves
$$
g_{\theta,n}(a)=a[1-(1-r_{\theta,a})^n],
$$
and in the useful regime $Nq\gg1$ old quotes are likely to be hit by later terminal prices. Next lower-bound work should compute this coupled market Bayes value or prove a localization gadget that preserves one fixed comparator quote, prevents cross-block hits, and keeps information leakage small.

## 7. Formalize counterexample suite for false necessity
Goal: Maintain complete examples for rare histories, known terminal spikes, strict-threshold nonattainment, and the candidate anytime two-deadline obstruction. Tiny-price long-delay blocks are now formalized with $L_m=2^m$, $p_m=2^{-2m}$, raw $\beta(h)=1$, uniformly bounded comparator value, and $\sup_T\Delta_T(H)=O(1/H)$. Rare-history blocks are also formalized: $\Pr(N=n)=3\cdot4^{-n}$, $2^N$ zeros, one spike at $1$, raw $\beta(h)=1$, $\sup_TV_T\le4$, and $\sup_T\Delta_T(H)=O(1/H)$.
Why promising: These examples prevent future proofs from targeting false tail characterizations.
Critical checks: Mark the anytime construction as plausible until the infinite sequence and horizon-subsequence proof are complete. For the rare-history construction, state expected-regret and infinite-process raw-$\beta$ scope; it is not a high-probability result.

## 8. Audit action-dependent markets
Goal: Decide whether the intended market protocol allows future prices to depend on learner quotes. If yes, define counterfactual comparator paths and feedback carefully.
Why promising: The current delayed full-information reduction is invalid if unplayed quotes would have induced different future prices.
Output needed: A formal filtration/causal protocol, or an explicit restriction to exogenous public prices.

## 9. Write the corrected finite-grid minimax identity and finite-class value iff cleanly
Goal: For finite $\Theta$, finite quote grid $G$, public exogenous prices, and randomized measurable policies, present
$$
\inf_A\sup_{\theta\in\Theta}R_\theta^G(A)
=
\sup_{\pi\in\Delta(\Theta)}\Psi_G(\pi),
$$
where both $V_\theta^G$ and the Bayes envelope are grid-restricted.
Then state the iteration 6 corollary for $G_T=\{0,1/T,\ldots,(T-1)/T\}$:
$$
\left|
(\mathcal R_T^{[0,1]})_+
-
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+
\right|\le1.
$$
Why promising: This is now the credible exact finite-class value characterization. The clean proof uses the attainable reward set $C\subset\mathbb R^\Theta$, its compact convex closure, finite-dimensional minimax, the accepted fixed-prior Bayes myopic lemma, and the grid-to-continuum comparison.
Critical checks: State the admissible randomized policy class, public-exogenous assumptions, signed upper-regret convention, and positive-part learnability convention. Do not mix continuum comparator values into the finite-grid identity. Do not call this a scalar tail characterization or infinite-class theorem.

## 9a. Polish the abstract $\mathrm{ba}$ dual for arbitrary finite-grid classes
Goal: State and prove the iteration 19 finitely additive value dual for arbitrary $\Theta$:
$$
\mathcal R_G(\Theta)
=
\sup_{\nu\in ba_1^+(\Theta)}
\left\{\langle V^G,\nu\rangle-\sup_{c\in C}\langle c,\nu\rangle\right\},
$$
with $C\subset\ell^\infty(\Theta)$ the convex randomized-policy reward set.
Why promising: This gives an exact arbitrary-class finite-grid signed minimax value, avoiding the product-closure gap that finite priors can miss.
Critical checks: Use fixed finite $T,G$, grid-restricted $V^G$, a nonempty bounded convex reward set $C\subset\ell^\infty(\Theta)$, ex-ante randomized common policies for convexity, and norm-duality topology. Iteration 20 identifies the safest proof: separate $V-\alpha\mathbf{1}$ from $\overline{C-X_+}^{\|\cdot\|_\infty}$, prove the separator is positive by downward closedness, normalize to $ba_1^+$, and let $\alpha$ approach the primal value. Cite or prove $\ell^\infty(\Theta)^*=ba(\Theta)$, strong separation, and positive functional facts. Add a prominent caveat: this is not an ordinary Bayes/posterior $\Psi_G$ theorem, has no conditional reward envelope for general $ba$ priors, gives no rates, and continuum quotes still require $T/K$ discretization. Do not call $(\mathcal R_T^{G_T})_+=o(T)$ in dual form a structural tail characterization.
Iteration 21 update: This is now proof-ready enough to write as a standalone proposition. Include the nonconvex deterministic-policy example and the finite-support-at-infinity example immediately after the theorem to fix the convexity and $\mathrm{ba}$ scope.

## 9b. Formalize the infinite-class no-gap extension
Goal: On a fixed finite grid $G$, write the finite-subclass product-closure theorem:
$$
\Phi_G(\Theta)
=
\inf_{c\in\overline C^{pt}}\sup_\theta(V_\theta^G-c_\theta).
$$
Then state the no-gap corollary when $C$ is product closed. Use iteration 8's sharper sufficient condition: common domination of the payoff-weighted reward measures
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}]
$$
via $L^\infty(\lambda_t;\Delta(G))$ prefix kernels. Prefix-law domination is still a simple sufficient special case, but it is stronger than needed.
Why promising: This is the most direct extension of the finite-class value characterization to meaningful infinite classes without invoking finitely additive priors. Iteration 9 essentially completes the proof for the relaxed completed $L^\infty$ prefix-kernel model.
Critical checks: Separate the relaxed-kernel theorem from the original Borel private-randomized policy theorem. For the latter, state the exact common Borel seed/state policy model, cite/prove the randomization lemma if starting from stochastic kernels, prove a Borel/completed implementation lemma for weak-* limit kernels, and use the same policy class in finite-subclass and full-class values. The finite-$F,G$ density support formula is now identified with conditional $\Psi_{G,F}$; include that proof, but do not use it to bypass policy-class alignment. Keep continuum quotes behind the $T/K$ grid comparison. Record compactness/measurability gap examples as obstructions, not natural lower bounds.

## 9c. Prove reward-measure corollaries
Goal: Add theorem-ready corollaries for total-variation separable reward-measure families, dominated approximations, and identifiable nondominated classes.
Why promising: TV separability gives common domination by a countable dense-measure construction, dominated approximation may give approximate no-gap, and identifiable classes explain why some nondominated deterministic families are still easy.
Critical checks: State TV separability for finite measures, not weak/Feller continuity. Dominated approximation needs explicit constants and uniformity over all policies. Identifiable classes need standard Borel parameter spaces, measurable decoding, and measurable finite-grid argmax.

## 10. Write the fixed-prior Bayes myopic lemma cleanly
Goal: State the theorem-ready finite-grid lemma:
$$
\sup_A \mathbb E_{\bar P_\pi,A}\sum_t r_t(a_t)
=
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
Why promising: This is accepted iteration 4 progress and supplies the Bayes reward term in $\Psi_G$.
Critical checks: Define the decision-time sigma-field, independence of private randomness, regular conditional probabilities, and public exogenous observations. For $[0,1]$, use $\varepsilon$-selectors or a grid approximation.

## 11. Normalize sign and discretization conventions
Goal: Before final theorem statements, decide how to phrase sublinear regret when adaptive policies beat the best fixed quote, and how to pass from grid $G_K$ to continuum $[0,1]$.
Why promising: Iteration 4 produced concrete stress tests: regret can be negative, deterministic policies can have the wrong minimax value, and grid/continuum mismatch breaks exact identities.
Critical checks: Use an upper-regret or positive-part convention for learnability. The minimax values satisfy $|\mathcal R_{[0,1]}-\mathcal R_{G_K}|\le T/K$, but exact continuum Bayes-envelope formulas still need selector/nonattainment care. Track $O(T/K)$ errors separately for comparator value, learner action set, Bayes envelope, and minimax value.

## 12. Keep rate lower bounds separate from value characterization
Goal: Use the finite-grid identity as a diagnostic tool for lower-bound design, but do not present it as a power-tail rate theorem.
Why promising: It may help compute Bayes gaps for multi-scale or limited-leakage constructions while preserving the existing $\delta_T(H)$ upper theorem as the clean sufficient tail result.
Critical checks: Avoid reusing the one-block $qD$ atom as if it matched power-tail upper rates. Any rate theorem needs accumulated indistinguishable delayed value without iid comparator collapse or one-reveal learning.

## 13. Search for natural no-gap hypotheses beyond domination
Goal: Find less restrictive infinite-class conditions than payoff-weighted reward-measure domination, such as dominated approximations, identifiable parametric classes, or compactness assumptions that directly imply product closedness of the attainable reward set.
Why promising: Common domination excludes many deterministic or nondominated classes. A natural no-gap theorem would make the Bayes-value characterization substantially more useful.
Critical checks: Avoid direct $\ell^\infty$ duality unless finitely additive priors are intended. Weak/Feller continuity alone is not enough for Borel-policy no-gap; verify that any compactness assumption is on the attainable reward set or implies product closedness. Keep identifiable nondominated examples separate from compactness proofs. Iteration 9 found only a non-Borel linear gap; the next counterexample search should target Borel, nondominated, non-identifiable classes, since Borel identifiable labels and countable identifier sets are easy.

## 14. Keep the linear non-Borel gap in the obstruction suite
Goal: Use the $T=D+1$, $G=\{1/3,2/3\}$ non-Borel label construction as the standard stress test for arbitrary infinite-class finite-subclass claims.
Why promising: It shows the finite-subclass modulus can be off by $\Theta(T)$ for Borel policies, so no-gap/product-closed hypotheses are not merely cosmetic.
Critical checks: Always label it a measurability pathology. It vanishes for arbitrary nonmeasurable policies, Borel $A$, or countable identifiers, and it does not contradict reward-measure domination because domination fails.

## 15. Finish policy-class alignment for dominated no-gap
Goal: Write the original-policy alignment theorem in final form and complete the reverse implementation side: forward common Borel seed/state policies induce law-independent public-prefix reward marginals; completed $L^\infty(\lambda_t;\Delta(G))$ finite-grid kernels have Borel reward-preserving implementations under domination.
Why promising: Iteration 12 accepts the forward lemma under an explicit common Borel seed/state model. The remaining work is theorem hygiene plus standard measurable-version/randomization citations and the reverse completed-kernel implementation.
Critical checks: Fix the policy model first. The proof needs public exogenous prices, full public observation, independent private randomness, feedback determined by public prices and past quotes, finite $G$, standard Borel prefix spaces, additive rewards, and $\mu^\theta_{t,a}\ll\lambda_t$. State reward-vector preservation only, not pathwise behavioral equivalence.
Iteration 12 refinement: Define algorithms as common Borel seed/state rules on the entire history space. If starting from Borel stochastic kernels, invoke a randomization lemma to get $a_t=\alpha_t(P_{1:t},U_{1:t})$. Then use Borel section integrals for $q_{t,a}(h)=\lambda^t\{u:\alpha_t(h,u)=a\}$ and Fubini for reward-coordinate equality. Do not use law-by-law a.s. policy equivalence classes.
Iteration 16 update: The bridge remains plausible but not closed. Prove both inclusions $C_{\rm Borel}\subseteq C_{L^\infty}$ and $C_{L^\infty}\subseteq C_{\rm Borel}$; cite/prove completed-measurable-to-Borel versions, finite-action randomization, and weak-* closed simplex constraints. Do not claim behavioral equivalence or continuum formulas.
Iteration 20 update: The bridge is now a credible conditional theorem target, but still not written. Forward inclusion should be a seed/prefix induction plus Borel section-integral measurability and Fubini. Reverse inclusion should Borelize $L^\infty(\lambda_t;\Delta(G))$ kernels, repair simplex failures on a Borel null set, implement by fresh uniforms, and use $\mu^\theta_{t,a}\ll\lambda_t$ to preserve integrals. The completed-kernel null-set stress test remains the main caveat: prefix laws may charge $\lambda_t$-null sets, so the result is only expected additive reward-coordinate equality.
Iteration 21 update: Still credible, still not closed. Before stating a no-gap theorem for original Borel policies, write the exact common Borel seed/state model and prove both inclusions $C_{\rm Borel}\subseteq C_{L^\infty}$ and $C_{L^\infty}\subseteq C_{\rm Borel}$. The theorem statement should explicitly exclude private side information, law-correlated seeds, nonreconstructible feedback, action-dependent prices, nonadditive rewards, and continuum quotes.

## 16. Identify density-form support with conditional $\Psi$
Goal: Write the now-proved finite-$F,G$ identity into the theorem package:
$$
\sum_t\int\max_{a\in G}\sum_{\theta\in F}\pi_\theta f^\theta_{t,a}\,d\lambda_t
=
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}a\,\bar P_\pi(M_t>a\mid P_{1:t})
$$
for finite $F$ under payoff-measure domination.
Why promising: This connects the compactness/no-gap proof's density support formula to the accepted conditional Bayes-gap notation and is no longer a major open gap.
Critical checks: Present the common-dominator invariance proof cleanly: compare $\lambda_t$ and the mixture prefix law $m_t$ through a common dominating measure, identify $d\nu_{t,a}/dm_t$ with the conditional reward curve, and keep $G$ finite to avoid selector and strict-threshold issues.

## 17. Tail-profile no-go pair and scalar-tail impossibility
Goal: Use the now-accepted hidden/labeled q-scaled terminal pair to formulate a clean impossibility proposition: no criterion depending only on individual laws' $\beta,\Delta,\delta$ or similar per-world delay/truncation profiles can characterize unknown-class minimax learnability.
Why promising: The hidden and labeled classes have identical per-world profiles, but hidden regret is at least $qD/8$ and labeled regret is zero in continuum (zero on grids containing $1/2,3/4$, otherwise discretization-small).
Critical checks: State the model caveat explicitly: no quote before $P_1$, no same-period trade, and profiles computed only for legal decision times. Phrase the no-go narrowly; it does not refute posterior-predictability, Bayes-gap, public-prefix, reward-set, or full statistical-experiment characterizations.

## 18. Adaptive truncation upper bound
Goal: Design an algorithm competing with the best truncation level in the oracle analysis, aiming for
$$
\inf_H\{\sqrt{T H\log K}+T/K+\delta_T(H)\}
$$
plus lower-order overhead.
Why promising: It would make the sufficient theorem tail-adaptive and may reveal whether the present upper bound is loose.
Critical checks: Prefer the iteration 13 one-level reduction over arms $(H,b)$ with surrogate reward $r_t^H(b)$; it avoids double-counting base and meta regret. The missing piece is an abstract heterogeneous-delay experts theorem whose regret to comparator arm $(H,b)$ scales with $H$, not with $H_{\max}$. Iteration 14 reduces the two-expert fast-vs-slow test to delayed advantage control: prove or refute whether an algorithm can ensure $A_T\ge-\tilde O(\sqrt T)$ and $A_T\ge S_T-\tilde O(\sqrt{TD})$. Candidate proof route: a safe delayed wealth/coin-betting wrapper with explicit pending-exposure caps and a ramp-up analysis on sustained positive advantage. Standard max-delay delayed Hedge is insufficient.
Iteration 15 update: The solvency invariant gives a rigorous fast-safety component: if pending slow exposure is bounded by budget plus observed played advantage, then $A_T\ge-B$. The naive clipped delayed-Hedge rule fails by capacity depletion, so future algorithms should keep a reserve, use fractional staking $q_t\le \alpha C_t$, or prove a direct delayed wealth potential that both protects fast and ramps up after positive evidence.
Iteration 21 update: Promising-ideas generation keeps this as the minimal adaptive-truncation test. The next useful output is either a reserve/fractional-wealth potential proving both $A_T\ge-\tilde O(\sqrt T)$ and $A_T\ge S_T-\tilde O(\sqrt{TD})$, or a crisp counterexample showing comparator-specific delay dependence is false.
Iteration 22 update: The simplest no-restart fractional rule $q_t=C_t/2$ is also refuted: for $D=1$, a long negative prefix makes $C$ exponentially small, and a later positive suffix gives linear slow regret before capital recovers. The surviving algorithmic route is interval/restart safe testers or a different potential. Before claiming progress, prove a single delayed tester lemma for arbitrary sequences and an aggregation lemma keeping total exposure at most one.

## 18b. Nested-window adaptation
Goal: Exploit the market-specific nesting
$$
r_t^{H_m}(b)=\sum_{j\le m}z_t^j(b),\qquad
z_t^j(b)=b\mathbf{1}\{H_{j-1}<\tau_t(b)\le H_j,\ \tau_t(b)\le T-t\},
$$
instead of treating $(H,b)$ as unrelated arms.
Why promising: The generic heterogeneous-delay theorem may be false or too hard, while nested truncation layers have nonnegative disjoint increments and a natural value-improvement charge.
Critical checks: Fix the value convention before proving anything. A pathwise oracle charges $\mathbb E[V_M(\omega)-V_m(\omega)]$, not $\delta_T^P(H_m)$. An expected-value oracle could imply
$$
R_T^P\le O(T/K)+\min_m\{B_m+(1+c)\delta_T^P(H_m)\},
$$
but no algorithm is known. Test two-window, two- or three-quote adversarial tables, including decoy late bonuses dispersed across many non-comparator quotes.
Iteration 15 update: The strong simultaneous expected oracle above is refuted on deterministic finite-grid market paths with two quotes and periodic medium/high prices. Keep the periodic construction as a stress test. A weaker nested route would need either a true min-over-windows guarantee, a different charge than $V_M^G-V_m^G$, or an argument that dense/continuum quotes change the obstruction.

## 19. Last-exceedance value-tail calculus
Goal: Develop the iteration 14 identity
$$
\sum_{t=1}^T r_t(a)=a(L_a-1)_+,\qquad L_a=\max\{s\le T:P_s>a\},
$$
into cleaner formulas for comparator value, truncation loss, and possible value-tail upper bounds.
Why promising: It explains why first-hitting $\beta$ is often the wrong raw object: fixed-quote value is controlled by last future exceedances and payoff scale.
Critical checks: Treat this as algebraic calculus, not a full characterization. Hidden/labeled classes with identical per-world tails still differ by public observability. Any last-exceedance tail condition must be value-weighted and predictability-aware if it is meant to be necessary.
