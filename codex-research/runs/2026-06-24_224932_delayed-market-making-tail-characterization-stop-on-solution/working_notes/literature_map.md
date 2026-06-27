# Literature Map

Iteration 2 identified relevant delayed-feedback references. Bibliographic metadata for the two Joulani-Gyorgy-Szepesvari papers was checked during synthesis, but the final upper theorem can avoid relying on a heavy external theorem by proving the finite-grid $H+1$-residue Hedge lemma inline.

## Delayed full-information experts
Role: Needed to justify
$$
R_{T,K}^H=O(\sqrt{T (H+1)\log K})
$$
for reward vectors revealed after delays $d_t\le H$, or a comparable bound in terms of total delay $D_{\rm tot}\le TH$.
Relevant sources:
- Joulani, Gyorgy, and Szepesvari, "Online Learning under Delayed Feedback," ICML/PMLR 2013.
- Joulani, Gyorgy, and Szepesvari, "Delay-Tolerant Online Convex Optimization: Unified Analysis and Adaptive-Gradient Algorithms," AAAI 2016.
Checks needed: Exact statement for finite experts/full information if cited; whether their notation gives multiplicative $\sqrt{H}$-type overhead or total-delay form; update timing conventions. Prefer an inline residue-splitting Hedge proof for this project.

## Yao/minimax lower bounds
Role: The hidden-terminal lower bound uses a two-world prior to prove that some world causes regret at least $D/8$ for every randomized learner.
Search terms: "Yao minimax principle randomized algorithms lower bound", "two point Le Cam online learning lower bound".
Checks needed: Can probably be written self-contained by averaging, without citing heavy machinery. Iteration 3's posterior Bayes-gap lemma is also a Bayes decision/Yao certificate; cite Le Cam or Fano only if approximate or multi-world indistinguishability is needed.

## Finite statistical decision/minimax identities
Role: Needed only if promoting the iteration 4 candidate
$$
\inf_A\sup_{\theta\in\Theta}R_\theta^G(A)=\sup_{\pi\in\Delta(\Theta)}\Psi_G(\pi)
$$
from plausible finite-grid theorem target to accepted result. Iteration 5 found the cleanest route: define the attainable reward set $C\subset\mathbb R^\Theta$, pass to the compact convex closure $\overline C$, apply finite-dimensional minimax/Sion to the bilinear payoff, and use the accepted fixed-prior Bayes myopic lemma to identify the support function. This avoids a direct infinite-dimensional weak-* Sion argument over kernels.
Search terms: "finite statistical decision theory minimax theorem risk set", "least favorable prior finite decision problem", "Wald complete class minimax theorem", "Sion minimax theorem stochastic kernels standard Borel".
Checks needed: If citing externally, verify a clean Sion/von Neumann statement for compact convex subsets of finite-dimensional spaces. Broad Wald/Arrow-Blackwell-Girshick sequential-decision citations are useful background but should not replace the local proof, because the model-specific nonanticipativity and public-exogenous assumptions still need to be stated.
Iteration 6 status: Combining the finite-grid identity with the grid-to-continuum comparison gives the finite-class positive-part value equivalence
$$
\left|
(\mathcal R_T^{[0,1]})_+
-
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+
\right|\le1
$$
for $G_T=\{0,1/T,\ldots,(T-1)/T\}$. This is now an accepted finite-class value characterization, not an exact continuum $\Psi$ theorem or scalar tail theorem.
Iteration 7 status: For infinite classes on a fixed finite grid, the finite-subclass modulus equals the minimax value over the product-closure of the attainable reward set $C\subset[0,T]^\Theta$. Product closedness of $C$ gives no infinite-class gap. Common domination of all public-prefix laws is a promising sufficient condition via weak-* compactness of $L^\infty(\lambda_t;\Delta(G))$ prefix kernels, but the final proof must spell out policy-to-kernel reduction, measurable versions, positivity/simplex weak-* closedness, and the signed/positive-part convention. Without closure, finite-subclass checks can miss compactness or measurability gaps.
Iteration 8 status: The broad stop claim was rejected, but the no-gap route sharpened. The compactness proof only needs common domination of payoff-weighted prefix reward measures
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}],
$$
not full domination of $P^\theta_{1:t}$. This gives a candidate theorem under fixed finite $T,G$, public exogenous prices, and public-prefix $L^\infty(\lambda_t;\Delta(G))$ policy kernels. TV-separability of the finite reward-measure family implies common domination by the standard countable-dense-measures argument. Still needed: policy-to-prefix-kernel reduction, Borel/completed-measure versions, and clean constants for dominated approximation corollaries.
Iteration 9 status: The no-gap proof is now best viewed as complete for the relaxed completed $L^\infty$ prefix-kernel policy class. The proof ingredients are density representation, weak-* compactness of $L^\infty(\lambda_t;\Delta(G))$, weak-* continuity of reward coordinates, product compactness, and finite-intersection no-gap. The remaining step for the original policy model is policy-class alignment: reduce arbitrary private-randomized Borel public-price policies to law-independent public-prefix marginal kernels, and implement weak-* limit kernels by admissible Borel/completed kernels.
Iteration 10 status: Policy-class alignment is now sharply isolated but not fully closed. The forward original-policy-to-prefix-kernel direction should follow from a seed representation and induction under public exogenous prices, full public observations, independent private randomness, and feedback determined by public prices plus past quotes. The reverse completed-kernel-to-Borel-policy direction should follow for finite grids on standard Borel prefix spaces from the standard theorem that completed-measurable functions have Borel versions modulo a Borel measure. The final theorem must say this preserves expected reward vectors, not pathwise behavior.
Iteration 12 status: The density-form finite-prior support term is now identified with the conditional-probability $\Psi_{G,F}$ envelope for finite $F,G$. The proof is Radon-Nikodym common-dominator invariance plus the conditional expectation identity under the mixture prefix law. This removes a notation gap in the payoff-measure dominated no-gap theorem, but does not expand it to continuum quotes or arbitrary infinite priors.
Iteration 16 status: The finite/no-gap Bayes package is best written as a referee-style partial theorem package, not a final solution. Use horizon-censored $M_t=\max_{t<s\le T}P_s$ throughout. The exact finite-grid finite-class identity and $T/K$ positive-part continuum corollary remain the solid core; product-closed and payoff-measure dominated infinite-class statements remain no-gap extensions under explicit policy models.

## Finitely additive minimax duality
Role: Iteration 19 adds an exact arbitrary-class finite-grid signed value dual:
$$
\mathcal R_G(\Theta)
=
\sup_{\nu\in ba_1^+(\Theta)}
\left\{\langle V^G,\nu\rangle-\sup_{c\in C}\langle c,\nu\rangle\right\},
$$
where $C\subset\ell^\infty(\Theta)$ is the convex attainable reward set. This is useful for arbitrary infinite classes because ordinary finite priors only see the product-closure relaxation.
Relevant sources/search terms: "Yosida Hewitt finitely additive measures dual of l infinity", "ba space dual of l infinity", "Hahn Banach separation ordered Banach space positive functional", "Sion minimax theorem compact convex weak star finitely additive probabilities", "least favorable finitely additive priors statistical decision theory".
Checks needed: Verify or prove locally that $\ell^\infty(\Theta)^*=ba(\Theta)$, that $ba_1^+(\Theta)$ is weak-* compact, and that the separation/Sion proof uses norm topology on $C$ rather than product topology. Keep finite $T,G$, randomized-policy convexity, and grid-restricted comparator values explicit. Do not cite this as an ordinary Bayes theorem: finitely additive priors need not induce mixture laws, posteriors, or conditional reward curves.
Iteration 19 status: The dual is accepted as abstract norm-duality value progress. It is not a scalar tail characterization, not a rate theorem, and not a replacement for the ordinary finite-prior $\Psi_G$ formula under no-gap assumptions. Product-closed/payoff-measure dominated classes make the $\mathrm{ba}$ value equal the finite-prior value at the value level, but a particular finitely additive witness need not have ordinary-prior approximants.
Iteration 20 status: The solver's attempt to stop with the $\mathrm{ba}$ dual was rejected. The theorem itself remains accepted as an abstract finite-grid reward-set dual, with the separation proof now the preferred referee route: work in real $X=\ell^\infty(\Theta)$, separate $V-\alpha\mathbf{1}$ from $\overline{C-X_+}^{\|\cdot\|_\infty}$, use downward closedness to force positivity, normalize to $ba_1^+$, and keep $\sigma_C(\nu)$ abstract. Required references or inline proofs: $\ell^\infty(\Theta)^*=ba(\Theta)$, strong Hahn-Banach separation, positive functional facts, and possibly Banach-Alaoglu only if dual optimizer existence is claimed. Also record convexity as a real assumption: deterministic nonconvex $C$ can change the value.
Iteration 21 status: The proof is now best treated as a standalone proposition, "Finite-Grid Arbitrary-Class Finitely Additive Duality." The final write-up should use the ordered separation proof, include the nonconvex and finite-support-at-infinity examples as scope guards, and immediately state that the result is not a Bayes/posterior theorem for arbitrary $\mathrm{ba}$ priors.

## Infinite-class no-gap and measure domination
Role: Needed to turn finite-prior Bayes-gap certificates into full infinite-class minimax values under checkable hypotheses.
Local theorem target: Fixed finite $T$, finite $G$, public exogenous prices. If for each $t$ a sigma-finite $\lambda_t$ dominates all payoff-weighted reward measures $\mu^\theta_{t,a}$, then $L_\theta(q)$ is a weak-* continuous functional of $q_t\in L^\infty(\lambda_t;\Delta(G))$, the attainable reward set is product compact, and
$$
\mathcal R_G(\Theta)=\sup_{F\Subset\Theta}\mathcal R_G(F)=\sup_{F\Subset\Theta}\sup_{\pi\in\Delta(F)}\Psi_{G,F}(\pi).
$$
Checks needed: State the exact common Borel seed/state policy model for the accepted forward policy-to-kernel reduction; cite/prove the randomization lemma if starting from stochastic kernels; cite/prove the standard Borel-version theorem underlying the reverse Borel/completed implementation lemma; prove weak-* closedness of the simplex constraints; keep continuum quotes behind the $T/K$ comparison. Do not rely on weak/Feller continuity alone; uncountable Dirac classes show it is not a domination/no-gap condition.
Iteration 9 obstruction update: A non-Borel deterministic label construction realizes a linear finite-subclass/full-class gap on $G=\{1/3,2/3\}$: every finite subclass has value $0$, while the full Borel-policy value is $(T-1)/6$. This strengthens the measurability warning but is still pathological; Borel identifiable and countable-label variants are easy.

## Measure-theoretic policy alignment
Role: Needed to upgrade the completed $L^\infty$ no-gap theorem to the intended original Borel private-randomized policy class.
Local theorem target: On $X_t=[0,1]^t$, finite $G$, and sigma-finite Borel $\lambda_t$, every completed $L^\infty(\lambda_t;\Delta(G))$ kernel has a Borel simplex-valued version equal $\lambda_t$-a.e.; dominated payoff measures then preserve all reward integrals. Conversely, every original private-randomized Borel policy should induce a law-independent Borel kernel $q_t(P_{1:t})$ preserving reward coordinates.
Checks needed: Cite or prove the completed-measurable-to-Borel-version theorem; write the recursive seed representation in final theorem style; cite/prove randomization for primitive stochastic kernels; state that equality is reward-coordinate equality only; verify weak-* closedness of positivity and simplex constraints; use one policy class in all finite-subclass and full-class values.
Relevant stress test: A $\lambda_t$-null non-Borel set can have positive prefix-law mass if prefix laws are not dominated. Borelization is still safe for expected rewards only because $\mu^\theta_{t,a}\ll\lambda_t$ and actions do not affect future prices.
Iteration 11 status: The forward original-policy-to-prefix-kernel target is sharper. Define policies as common Borel rules (or Borel kernels plus a seed representation) on the whole history space, not law-by-law a.s. objects. The proof should show $a_t=\alpha_t(P_{1:t},U_{1:t})$, use section integrals to make $q_{t,a}$ Borel, and use Fubini to preserve expected additive reward coordinates. Persistent private internal state is allowed only if it is explicitly included in the standard Borel policy model and reduced by the seed induction. This remains a proof target, not a completed theorem.
Iteration 12/13 status: The forward alignment lemma is accepted under an explicit finite-grid public-exogenous common Borel seed/state model: standard Borel internal state, iid private uniforms, deterministic Borel feedback from public prices and past quotes, and additive quote rewards. If randomized policies are primitive stochastic kernels, a standard randomization lemma must still be cited or proved. The reverse completed-$L^\infty$-to-Borel implementation is recorded as a conditional lemma using the standard Borel-version theorem; the final theorem still needs citations/proofs for those measurable-version facts and one consistent policy class.
Iteration 16 status: Do not state $C_{\rm Borel}=C_{L^\infty}$ until both inclusions are written. Forward inclusion needs a seed/prefix induction $a_t=\alpha_t(P_{1:t},U_{1:t})$, Borel section-integral measurability of $q_{t,a}$, and Fubini. Reverse inclusion needs completed-measurable-to-Borel versions and finite-action uniform implementation. Weak-* compactness needs $L^\infty=(L^1)^*$, sigma-finiteness, and weak-* closed positivity/simplex constraints. The result preserves expected reward coordinates only.
Iteration 20 status: The bridge is now a credible conditional theorem target under the exact finite-grid public-exogenous common Borel seed/state model. Forward inclusion should use Borel public-prefix marginals; reverse inclusion should Borelize completed $L^\infty(\lambda_t;\Delta(G))$ kernels and rely on $\mu^\theta_{t,a}\ll\lambda_t$ to preserve payoff integrals. The null-set stress remains central: payoff domination does not imply prefix-law domination, so the theorem must be reward-coordinate only, not behavioral or pathwise.
Iteration 21 status: No fatal flaw was found under the narrow intended model, but the bridge is still not a theorem until the exact policy model, section-integral/Fubini proof, completed-measurable-to-Borel version theorem, finite-action randomization, and weak-* closed simplex constraints are written or cited. Private side information, law-correlated randomness, nonreconstructible feedback, action-dependent prices, nonadditive rewards, and continuum quotes remain outside scope.

## Grid-to-continuum approximation
Role: Needed to connect the finite-grid minimax identity to the original quote set $[0,1]$.
Status: The minimax values satisfy $|\mathcal R_{[0,1]}-\mathcal R_{G_K}|\le T/K$ by downward rounding of both comparator quotes and learner actions. This avoids exact continuum Bayes-envelope selector issues.
Checks needed: Final write-up should keep the continuum minimax value, grid minimax value, and grid $\sup_\pi\Psi_{G_K}$ value separate. Any exact continuum $\Psi$ formula still needs measurable $\varepsilon$-selectors and strict-threshold nonattainment care.

## Bayes decision and information-complexity lower bounds
Role: Candidate framework for the necessary side under unknown exogenous classes. The lower-bound quantity is the gap between world-specific fixed-comparator value and the best posterior-mixture quote value given the learner's decision information.
Search terms: "Bayes risk lower bound decision theory", "Le Cam two point method total variation", "Fano method statistical lower bounds", "sequential information lower bounds online learning".
Checks needed: For the finite hidden-terminal atom and fixed-prior Bayes myopic lemma, write self-contained. For approximate indistinguishability or matching rates, verify the exact TV/KL constants and ensure the fixed-comparator $\sup_a\sum_t g_{t,\theta}(a)$ is handled rather than per-round optima. For continuum $[0,1]$, check measurable $\varepsilon$-selection or avoid it through grids.
Iteration 11 local no-go result: The hidden/labeled q-scaled terminal pair should be written self-contained. It shows per-world $\beta,\Delta,\delta$ profiles do not characterize unknown-class minimax learnability: the hidden class has Bayes-gap lower bound $qD/8$, while adding a payoff-harmless public label at $P_1$ makes the active law known before the first legal quote and removes the regret. No external citation is needed beyond the local Bayes/Yao argument.
Iteration 13 lower-rate update: naive multi-scale repetitions should be treated as failed until proved in the finite-grid Bayes value. Shared full-reveal types saturate, independent block bits collapse against a single fixed comparator, and persistent quotes break block-local tail calculations. The next information-complexity check is a noisy common-type construction where a $q$-mass tail event carries revenue separation $\gamma$ and terminal KL $\kappa$; verify whether $\kappa\gtrsim\gamma^2/q$ is forced and what Fano/Le Cam then gives, including any $\log M$ dependence for multi-hypothesis versions.
Iteration 22 lower-rate update: the noisy common-type route now has a sound abstract block-local Bayes calculation. With two types, per-block reward separation $\gamma$, and per-block KL leakage $\kappa$, the local Bayes gap scales like $D\gamma\min\{N,1/\kappa\}$. A one-block three-atom terminal-price perturbation can realize $\kappa=\Theta(\gamma^2/q)$ under fixed quote parameters. The remaining issue is market realization: persistent quotes couple blocks through $g_{\theta,n}(a)=a[1-(1-r_{\theta,a})^n]$. Any external Le Cam/Fano search should therefore be paired with a localization/tail-envelope audit, not just a statistical information calculation.

## Delayed feedback with adaptive delays
Role: If price paths or delays depend on learner actions, standard delayed-experts reductions may fail.
Search terms: "online learning adversarial delays action dependent", "adaptive delayed feedback online learning".
Checks needed: Whether existing results cover reward vectors generated after future learner actions, or only fixed adversarial reward sequences with delayed observation. Current upper theorem should assume exogenous public prices unless this is resolved.
Iteration 13 adaptive-window update: A tail-adaptive upper bound would follow from a full-information experts theorem with arm-specific/comparator-specific delay dependence. Standard fixed-$H$ residue Hedge and max-delay bounds do not provide this. Search specifically for heterogeneous-delay expert regret to comparator arm $i$ scaling with $d_i$, not $d_{\max}$, or prove/refute it first in the two-expert fast-vs-slow case.
Iteration 14 adaptive-window update: The two-arm fast/slow case reduces to delayed advantage control with $R_F=-A_T$ and $R_S=S_T-A_T$. This is now the canonical abstract test. The target inequalities $A_T\ge-\tilde O(\sqrt T)$ and $A_T\ge S_T-\tilde O(\sqrt{TD})$ remain unproved; safe delayed coin-betting/wealth wrappers are candidate algorithms. For the market-specific nested-window route, horizon-censored increments are valid, but pathwise comparator charges must not be identified with expected $\delta_T(H)$. Search separately for comparator-specific delayed experts, delayed coin-betting with safety constraints, and model-selection bounds for nested delayed reward layers.
Iteration 15 adaptive-window update: The delayed-advantage solvency invariant is accepted as a fast-safety tool: controlling pending slow exposure by $B+$ observed played advantage yields $A_T\ge-B$. However, the naive clipped rule $q_t=\min\{p_t,C_t,1\}$ fails by budget depletion; future searches should look for reserve/fractional-wealth rules or direct potentials that can recover after positive evidence. The strong simultaneous expected nested-window oracle
$$
V_m^G-\mathbb E L^m(A)\le B_m+c(V_M^G-V_m^G)
$$
is refuted on deterministic two-window finite-grid market paths with periodic medium prices and high spikes. Do not search for that exact oracle as a route to adaptive truncation; instead look for weaker min-over-window guarantees, comparator-specific delayed experts, or continuum/dense-grid variants of the obstruction.
Iteration 22 adaptive-window update: a single no-restart fractional wealth account $q=C/2$ fails even for $D=1$, because negative prefixes can exponentially deplete exposure and positive suffixes then incur linear slow regret before recovery. Search terms should emphasize strongly adaptive/interval coin-betting with delayed feedback, solvency-constrained portfolios, and aggregation under a total exposure constraint, rather than single-account multiplicative wealth.

## Dynamic pricing / posted-price learning analogies
Role: The quote $a$ trades when future price exceeds $a$; reward curves $a\Pr(Y>a)$ resemble posted-price revenue curves.
Search terms: "posted price learning demand curve regret", "censored demand dynamic pricing regret".
Checks needed: Whether known lower bounds for separated demand curves can formalize hidden-terminal or limited-leakage lower bounds. The q-scaled one-block atom is clean but too weak for power-tail rate matching.

## Raw delay probability versus payoff scale
Role: Iteration 6's tiny-price deterministic block example shows that raw $\beta$ can fail completely while total comparator value is uniformly bounded. Iteration 7 strengthened this to a value-weighted estimate.
Relevant local construction: Blocks with $L_m=2^m$ zeros followed by $p_m=2^{-2m}$ have $\beta(h)=1$ for all finite $h$, $\sup_T\sup_a\sum_{t\le T}r_t(a)\le1/2$, and $\sup_T\Delta_T(H)=O(1/H)$.
Checks needed: No external citation needed. This construction refutes raw $\beta$ necessity but is consistent with $\Delta$-tail sufficiency.

## Last-exceedance tail calculus
Role: Iteration 14 records the pathwise identity $r_t(a)=a\mathbf{1}\{L_a>t\}$, $\sum_t r_t(a)=a(L_a-1)_+$, where $L_a=\max\{s\le T:P_s>a\}$. This may be a cleaner language for comparator value and truncation gaps than first-hitting tails.
Checks needed: Express $\delta_T(H)$ and $\Delta_T(H)$ in last-exceedance or exceedance-age terms without losing predictability information. Verify whether this is only a reparameterization or yields sharper value-tail sufficient bounds. Do not present it as a scalar iff condition; hidden/labeled examples show observability still matters.

## Rare histories versus essential sup
Role: Iteration 7 formalized a second raw-$\beta$ failure where delayed rewards have full value but occur on rare histories.
Relevant local construction: Draw $N$ with $\Pr(N=n)=3\cdot4^{-n}$, reveal $P_1=x_N$, run $2^N$ zeros, one spike at $1$, and then zeros. Then $\beta(h)=1$ for all finite $h$, while $\sup_TV_T\le4$ and $\sup_T\Delta_T(H)=O(1/H)$.
Checks needed: State expected-regret and infinite-process raw-$\beta$ scope. Do not use this as a high-probability or minimax lower-bound example.

## Anytime prediction with known deterministic sequences
Role: The known-law oracle lemma is horizon-aware. A single horizon-free policy for a known infinite sequence may face two-deadline obstructions.
Search terms: "online learning anytime regret fixed comparator known sequence horizon unknown", "prediction with expert advice unknown horizon lower bound".
Checks needed: Whether standard doubling can recover small regret in this nonstandard delayed terminal-payoff setting, or whether the super-growing two-deadline construction gives a genuine lower bound.
