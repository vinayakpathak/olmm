# Failed Attempts

## Original "only if beta" conjecture
Attempt: Prove that sublinear regret is possible only if the essential-sup hitting tail $\beta(h)\to0$.
Failure: False under law-aware/process-wise quantifiers. For iid uniform prices, $\beta(h)=1$ for all $h$, but a learner knowing the law can play the best fixed quote in expectation and get zero regret. Iteration 2 strengthened this: for every finite-horizon known exogenous law, a horizon-aware conditional grid oracle gets regret at most $T/K$.
Lesson: Necessity cannot be about raw hitting delay alone. It must specify learner ignorance/uniformity over a class, or use a predictability-aware condition.
Source: solver attempt.

## Treating rare essential-sup histories as expected-regret obstruction
Attempt: Salvage raw $\beta(h)\to0$ necessity by arguing that any positive-probability history with a very long certain hit should obstruct sublinear expected regret.
Failure: Iteration 7 formalized a rare-history singleton process. With $\Pr(N=n)=3\cdot4^{-n}$, $P_1=x_N$, $2^N$ zeros, then one spike at $1$, the infinite-process raw $\beta(h)=1$ for every finite $h$. Nevertheless
$$
\sup_T V_T\le4,\qquad \sup_T\Delta_T(H)=O(1/H),
$$
so the zero-quote learner has bounded expected regret.
Lesson: Essential sup ignores the probability weight of bad histories. In the expected-regret model, rare histories must be value-weighted or handled through a minimax/predictability condition.
Source: `iterations/iter_007/idea_02/explorer_01.md`; `iterations/iter_007/idea_02/critic_01_on_explorer_01.md`.

## Nontrivial fixed-law necessity under known finite-horizon exogenous laws
Attempt: Find any non-vacuous tail, truncation, or delay condition necessary for sublinear regret when the learner knows the finite-horizon exogenous law.
Failure: The conditional grid oracle gives $R_T\le T/K$ for every such law. With $K=T$, regret is $O(1)$ independent of $\beta$, $\Delta$, or $\delta$.
Lesson: Any meaningful necessity theorem must change quantifiers: unknown/minimax class, action-dependent prices, computational constraints, or anytime horizon-free policies.
Source: `iterations/iter_002/solver_attempt.md`; idea_01 explorer and critique.

## Treating $\Delta_T(H)=o(T)$ as a characterization
Attempt: Replace $\beta$ by the average/worst-action truncation loss $\Delta_T(H)$ and claim necessity.
Failure: Singleton terminal-spike law has zero law-aware regret but $\Delta_T(H)=\Omega(T)$ for $H=o(T)$.
Lesson: $\Delta$ is a useful sufficient term for a truncation proof, not a general necessary condition.
Source: idea_01 explorer and critique.

## Delayed-experts reduction without exogeneity
Attempt: View $(r_t^H(b))_{b\in\mathcal G_K}$ as a delayed full-information reward vector in the original market protocol.
Failure: If future prices may depend on learner actions, counterfactual reward vectors are not fixed independently of the learner, and it is unclear whether comparator rewards are evaluated on the learner-induced path or comparator-induced path.
Lesson: Upper theorem must assume exogenous/oblivious prices, or explicitly define an action-dependent causal model and prove a different reduction.
Source: idea_01 critique.

## Naive iid block-splicing of hidden-terminal lower bounds
Attempt: Repeat independent hidden-terminal blocks to get an asymptotic fixed-process lower bound.
Failure: Regret compares to $\sup_a\mathbb E\sum_t r_t(a)$. With iid block types, the best fixed expected comparator can be the same Bayes action available to the learner, so per-block realized optimal-action gaps do not add.
Lesson: A fixed-process lower bound needs horizons dominated by one unresolved block, adversarial structure, or a different comparator/loss notion.
Source: idea_02 explorer and critique.

## One-block q-scaled lower bound as a matching power-tail rate
Attempt: Use the q-scaled hidden-terminal atom to match the truncation upper rate under a tail envelope $B(h)$, by setting $q\approx B(D)$.
Failure: The atom yields only $\Omega(Dq)$. For $B(h)=h^{-\alpha}$, this is $\Omega(D^{1-\alpha})$, which is much smaller than the known upper rate $T^{(\alpha+1)/(2\alpha+1)}$ for $\alpha>0$, and does not grow for $\alpha\ge1$.
Lesson: Matching minimax lower rates need a construction that accumulates hidden valuable reward across scales without iid comparator collapse or one-reveal learning. Possible routes are multi-scale hidden states, limited-information terminal reveals, or Le Cam/Fano-style families.
Source: `iterations/iter_003/idea_02/explorer_01.md`; critique.

## Promoting $\Psi_T$ to an exact continuum characterization
Attempt: Declare the finite-horizon exogenous minimax problem solved by the least-favorable Bayes predictability gap
$$
\inf_A\sup_\theta R_T^\theta(A)=\sup_\pi\Psi_T(\pi),
$$
with continuum quotes and
$$
\Psi_T(\pi)=\mathbb E_\pi V_\theta(T)-
\sum_t\mathbb E_{\bar P_\pi}\sup_{a\in[0,1]}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
Failure: Iteration 4 critics rejected this as an asserted minimax theorem, not a proof. The displayed formula also mixed a claimed finite-grid result with continuum comparator/envelope quantities, ignored strict-threshold nonattainment, and did not specify compactness, regular conditional probabilities, randomized policies, or a negative-regret convention.
Lesson: $\Psi$ is useful lower-bound/Bayes-value language, but exact characterization must first be proved on finite $\Theta$ and finite $G$ with grid-restricted comparator $V_\theta^G$. The continuum passage is approximate and must carry $O(T/K)$-type errors.
Source: `iterations/iter_004/solver_attempt.md`; `iterations/iter_004/solution_critic_01.md`; `iterations/iter_004/solution_critic_02.md`; `iterations/iter_004/solution_gate.md`.

## Treating the iteration 5 weak-* proof sketch as a completed solution
Attempt: Stop the loop by asserting the corrected finite-grid minimax identity from an informal weak-* compactness/Sion argument over public-prefix kernels, plus a one-line continuum rounding claim.
Failure: The solution gate rejected this as not referee-ready. The sketch did not precisely define the policy-space topology, prove closedness/compactness of the kernel constraints, handle measurable representatives, or prove the two-sided continuum comparison. It also overstated the result as a necessary-and-sufficient tail characterization, though it is a minimax-value characterization.
Lesson: The right repair is to avoid infinite-dimensional Sion in the main minimax step. Use the finite-dimensional attainable reward set $C\subset\mathbb R^\Theta$, pass to $\overline C$, apply finite-dimensional minimax, and identify the support function with the already accepted fixed-prior Bayes myopic lemma. Treat continuum quotes by a separate grid-to-continuum minimax lemma.
Source: `iterations/iter_005/solver_attempt.md`; `iterations/iter_005/solution_critic_01.md`; `iterations/iter_005/solution_critic_02.md`; `iterations/iter_005/solution_gate.md`; `iterations/iter_005/idea_01/explorer_01.md`; `iterations/iter_005/idea_02/critic_01_on_explorer_01.md`.

## Inferring continuum minimax approximation from a single rounding inequality
Attempt: Claim
$$
|\mathcal R_{[0,1]}-\sup_\pi\Psi_{G_K}(\pi)|\le T/K
$$
directly from downward rounding.
Failure: The one-line argument does not by itself compare comparator values, learner policy classes, minimax values, and the finite-grid Bayes envelope. The comparison is valid only after proving both minimax inequalities
$$
|\mathcal R_{[0,1]}-\mathcal R_{G_K}|\le T/K
$$
and then invoking the finite-grid minimax/Bayes identity for $\mathcal R_{G_K}$.
Lesson: Keep three objects separate: the continuum minimax value, the grid minimax value, and the grid least-favorable Bayes value. Avoid an exact continuum $\Psi$ unless measurable selectors and nonattainment are handled.
Source: iteration 5 solver and critiques; synthesis.

## Using continuum comparator values inside a finite-grid minimax identity
Attempt: Prove a finite-action minimax identity while keeping $V_\theta=\sup_{a\in[0,1]}\sum_t\mathbb E_\theta r_t(a)$ or a continuum Bayes envelope in the displayed $\Psi$.
Failure: Exact equality is false. Example: $T=2$, singleton law $P_2=3/4$, and $G=\{0,1/2\}$. The grid comparator value is $1/2$, while the continuum comparator supremum is $3/4$.
Lesson: Every finite-grid theorem must consistently restrict learner actions, comparator values, and posterior Bayes envelopes to $G$. Continuum statements require a separate discretization lemma.
Source: `iterations/iter_004/idea_01/explorer_01.md`; `iterations/iter_004/idea_01/critic_01_on_explorer_01.md`.

## Treating the finite-class value iff as a scalar tail theorem
Attempt: Read the finite-class equivalence
$$
(\mathcal R_T^{[0,1]})_+=o(T)
\Longleftrightarrow
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+=o(T)
$$
as the requested necessary-and-sufficient tail characterization.
Failure: The equivalence is valid only under finite $\Theta_T$, public exogenous prices, randomized policies, and the grid approximation. The quantity $\sup_\pi\Psi_{G_T}$ is essentially a minimax value/Bayes predictability gap, not a scalar tail profile. It does not cover infinite classes without compactness or approximation, and it does not give matching power-tail rates.
Lesson: Use this result as a precise finite-class value characterization and a diagnostic for lower-bound construction. Keep the separate $\delta_T(H)$ upper theorem as the tail-based sufficient condition.
Source: `iterations/iter_006/idea_01/explorer_01.md`; `iterations/iter_006/idea_01/critic_01_on_explorer_01.md`.

## Assuming finite-subclass Bayes gaps characterize arbitrary infinite classes
Attempt: Extend the finite-class $\sup_\pi\Psi_G$ characterization to an infinite class by taking the supremum over all finite subclasses, with no compactness or closure assumption.
Failure: The finite-subclass modulus equals the minimax value over the product-closure of the attainable reward set, not necessarily over the attainable set itself. Abstractly, $C=\{c\in[0,1]^\mathbb{N}:c\text{ has finite support}\}$ with $V\equiv1$ has every finite-subclass value $0$ but full value $1$. A pathological market-flavored non-Borel label example gives the same warning under Borel-policy restrictions.
Lesson: Infinite-class extensions need a no-gap condition, such as product closedness of $C$. Common prefix domination is a promising sufficient condition, but the policy-kernel and measurability setup must be written explicitly.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`.

## Ignoring randomized policies in minimax/Bayes identities
Attempt: Treat the least-favorable-prior identity as if deterministic policies suffice.
Failure: A two-world one-decision test separates deterministic and randomized minimax values. With $T=2$, $P_1=0$, grid $G=\{0.5,0.9\}$, and worlds $P_2=0.6$ or $P_2=1$, deterministic minimax regret is $0.4$, while randomized play balances the two regrets at $2/9$.
Lesson: Any minimax/Bayes equality must explicitly allow randomized policies or mixed decision kernels.
Source: `iterations/iter_004/idea_01/critic_01_on_explorer_01.md`.

## Fixed finite hidden block as asymptotic obstruction
Attempt: Extend a single hidden-terminal block to an infinite process and use it as a necessity counterexample.
Failure: For fixed $D$, delay is bounded by $D$, so asymptotic regret is $O(D)=o(T)$ and $\beta(h)=0$ for $h\ge D$.
Lesson: The clean lower bound is finite-horizon/horizon-dependent unless a new infinite construction is built.
Source: idea_02 critique.

## Extending the oracle lemma to horizon-free anytime policies
Attempt: Use the known-law conditional oracle to claim all known fixed infinite exogenous processes are trivial for a single policy that does not know the evaluation horizon.
Failure: The proof optimizes $g_t(a)=\mathbb E[a\mathbf{1}\{M_t>a\}\mid\mathcal F_t]$ using the terminal horizon $T$. Critic stress tests with two possible deadlines suggest a fixed horizon-free sequence of quotes can be forced to have large regret at one of the two horizons.
Lesson: Keep "horizon-aware" in the oracle lemma. Anytime known-law learnability is a distinct question and may fail for deterministic super-growing block examples.
Source: `iterations/iter_002/idea_01/critic_01_on_explorer_01.md`.

## Using `max_a` without checking attainment
Attempt: State regret and optimal quotes with $\max_{a\in[0,1]}$.
Failure: Strict trade event $P>a$ can make the comparator value approach a threshold without being attained.
Lesson: Use $\sup_a$ throughout, or impose continuity/no-atom/attainment conditions.
Source: solver attempt; both critiques.

## Treating raw delay probability as necessary even when long delayed rewards are tiny
Attempt: Salvage raw $\beta(h)\to0$ necessity by looking for deterministic long-delay examples with sublinear regret.
Failure: The tiny-price block construction has $L_m=2^m$ zeros followed by $p_m=2^{-2m}$, giving $\beta(h)=1$ for all finite $h$, but $\sup_T\sup_a\sum_{t\le T}r_t(a)\le1/2$. The zero-quote learner therefore has $O(1)$ regret.
Lesson: Raw hitting-delay probability ignores payoff scale. Any necessary condition must be value-weighted and/or predictability-aware. Iteration 7 further checked that this example satisfies $\sup_T\Delta_T(H)=O(1/H)$, so the failure is specifically raw $\beta$, not value-weighted truncation.
Source: `iterations/iter_006/solver_attempt.md`; `iterations/iter_006/idea_02/explorer_01.md`; `iterations/iter_006/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_007/solver_attempt.md`; synthesis.

## Treating the iteration 8 "maybe solved" theorem as a full solution
Attempt: Stop with the statement that finite-class/product-closed Bayes value formulas give the clean necessary-and-sufficient characterization for sublinear regret.
Failure: Both solution critics and the gate rejected this as a full solution. The finite-class value theorem is accepted, but arbitrary infinite classes need an explicit no-gap/product-closed condition and a precise policy space. The dominated-prefix route was still conditional, not written referee-ready. The theorem is a minimax/Bayes value characterization, not a scalar tail characterization, and no matching lower bound for the power-tail upper rate is known.
Lesson: Present the Bayes value theorem as partial progress under finite or no-gap assumptions. Keep the lower-rate problem and the search for natural infinite-class no-gap hypotheses open.
Source: `iterations/iter_008/solver_attempt.md`; `iterations/iter_008/solution_critic_01.md`; `iterations/iter_008/solution_critic_02.md`; `iterations/iter_008/solution_gate.md`.

## Using weak/Feller continuity alone as an infinite-class no-gap condition
Attempt: Replace common domination by qualitative compactness or continuity assumptions such as weak/Feller continuity of $\theta\mapsto P^\theta$.
Failure: Iteration 8 found no proof that weak/Feller continuity alone makes the Borel-policy attainable reward set product closed. Uncountable Dirac classes can be weakly compact or Feller-continuous while failing total-variation separability and common domination. Deterministic identifiable examples may still be easy, but for a different reason: the parameter is publicly decoded, not because the reward set is compact in the needed topology.
Lesson: For the compactness proof, target domination or total-variation separability of the payoff-weighted reward measures $\mu^\theta_{t,a}$, or state a separate identifiable-class mechanism with explicit measurable decoding assumptions. Do not claim weak continuity alone suffices.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`.

## Requiring domination of full prefix laws when reward-measure domination suffices
Attempt: Use common domination of every public prefix law $P^\theta_{1:t}$ as the main checkable hypothesis for infinite-class no-gap.
Failure: This is stronger than the compactness proof needs. The reward coordinates only depend on the payoff-weighted measures
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}],
$$
so histories with no current payoff at time $t$ need not be dominated for that coordinate. Later decisions are handled by their own $s$-prefix reward measures.
Lesson: State prefix-law domination as a simple sufficient condition, but promote payoff-weighted reward-measure domination as the sharper no-gap hypothesis. Still prove policy-to-prefix-kernel reduction carefully so ignoring zero-current-payoff prefixes is legitimate.
Source: `iterations/iter_008/idea_01/explorer_01.md`; `iterations/iter_008/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`.

## Treating the $L^\infty$ kernel compactness theorem as an original Borel-policy theorem
Attempt: Close the dominated reward-measure no-gap theorem by proving weak-* compactness of $L^\infty(\lambda_t;\Delta(G))$ prefix kernels and then directly identifying this with the original class of private-randomized Borel public-price policies.
Failure: Iteration 9's critic agreed that the compactness/no-gap proof works for the completed $L^\infty$ prefix-kernel policy class, but not that this class has been proved identical to the intended original policy class. Two directions remain: every private-randomized policy must induce law-independent public-prefix marginal kernels, and every weak-* limit kernel must have an admissible Borel/completed implementation.
Lesson: State the no-gap theorem first for the relaxed completed kernel model. Add a separate policy-class alignment lemma with exact assumptions on public prices, private randomness, delayed feedback, Borel versions, and null-set conventions before claiming it for original Borel policies.
Source: `iterations/iter_009/idea_01/explorer_01.md`; `iterations/iter_009/idea_01/critic_01_on_explorer_01.md`.

## Looking for a natural infinite-class product-closure gap via identifiable labels
Attempt: Find a natural public-exogenous infinite class where all finite subclasses have small grid minimax value but the full class has positive or linear value, avoiding non-Borel labels.
Failure: Iteration 9 found only a strengthened non-Borel label obstruction. In identifiable deterministic templates, if the optimal-action label is Borel, a Borel policy can decode $x=P_1$ and play the right quote; if identifiers are countable, every label subset is Borel. Dominated or TV-separable payoff-weighted reward-measure classes are already covered by the no-gap theorem.
Lesson: The linear non-Borel construction is useful as a measurability/product-closure warning, but not evidence of a natural Borel statistical gap. The next search should target Borel, nondominated, non-identifiable classes or accept that product-closure failures found so far are pathological.
Source: `iterations/iter_009/idea_02/explorer_01.md`; `iterations/iter_009/idea_02/critic_01_on_explorer_01.md`.

## Treating policy-to-kernel alignment as closed after iteration 10
Attempt: Upgrade the payoff-weighted domination no-gap theorem from the relaxed completed $L^\infty$ prefix-kernel model to the original private-randomized Borel policy model based on the iteration 10 alignment sketches.
Failure: The sketches isolate a likely proof but do not yet provide a referee-ready theorem. The forward direction still needs an exact admissible policy model and an induction showing $a_t=\alpha_t(P_{1:t},U_{1:t})$. The reverse direction needs the completed-measurable-to-Borel-version lemma and explicit finite-grid implementation. The proof must also use the same policy class for finite-subclass and full-class values.
Lesson: State the completed $L^\infty$ no-gap theorem separately from the original Borel-policy theorem. Record policy alignment as the next proof target: forward reward-marginal reduction, Borel implementation of completed kernels, reward-coordinate preservation, and weak-* simplex closedness. Do not claim pathwise or behavioral equivalence; only expected additive reward vectors are preserved.
Source: `iterations/iter_010/idea_01/explorer_01.md`; `iterations/iter_010/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_010/idea_02/explorer_01.md`; `iterations/iter_010/idea_02/critic_01_on_explorer_01.md`.

## Treating iteration 12 alignment and density lemmas as closing arbitrary infinite classes
Attempt: Use the iteration 12 density-$\Psi$ identification and forward Borel policy-alignment lemma to declare the original infinite-class no-gap theorem fully solved.
Failure: The density lemma identifies only the finite-$F,G$ Bayes support term once payoff-measure domination and the prefix-kernel model are already in place. The forward alignment lemma is proved only under an explicit common Borel seed/state policy model with public exogenous prices, independent private uniforms, full public observation, reconstructible feedback, and additive rewards. It does not prove the reverse completed-$L^\infty$-to-Borel implementation theorem, does not cover law-by-law a.s. policy objects, and does not remove the product-closed/no-gap hypothesis.
Lesson: Promote the narrow lemmas, but keep the theorem package as finite-class/product-closed or payoff-measure dominated finite-grid value characterization. The original Borel-policy version still needs standard measurable-version/randomization facts and one consistent policy class. Arbitrary infinite nondominated classes and scalar tail characterizations remain open/refuted.
Source: `iterations/iter_012/solver_attempt.md`; `iterations/iter_012/idea_01/explorer_01.md`; `iterations/iter_012/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_02/explorer_01.md`; `iterations/iter_012/idea_02/critic_01_on_explorer_01.md`.

## Using per-world tail/truncation profiles as a minimax characterization
Attempt: Characterize unknown-class learnability by scalar data attached separately to each law, such as $\{\beta_\theta,\Delta_\theta,\delta_\theta\}_\theta$, their envelopes, or other individual-law delay/truncation profiles.
Failure: Iteration 11 formalized a hidden/labeled q-scaled terminal pair. In the hidden class, $P_1$ is common, $P_2=\cdots=P_D=0$, and $P_{D+1}=Y_\theta$; in the labeled class, only $P_1$ is changed to a world-revealing label $\ell_\theta$. Because legal quote rewards depend only on future prices, every per-world reward, delay, $\beta,\Delta,\delta$, and comparator profile is identical between the two classes. Yet the hidden class has minimax regret at least $qD/8$, while the labeled class has zero continuum regret and zero grid regret on grids containing $1/2,3/4$.
Lesson: Unknown-class learnability depends on observability and predictability, not just the tail profile of each individual law. A valid iff condition must include public-prefix information, posterior Bayes gaps, the statistical experiment, or an equivalent class-level reward-set object.
Source: `iterations/iter_011/solver_attempt.md`; `iterations/iter_011/idea_01/explorer_01.md`; `iterations/iter_011/idea_01/critic_01_on_explorer_01.md`.

## Naively repeating q-scaled atoms for matching power-tail lower rates
Attempt: Take $N=T/D$ hidden-terminal blocks of length $D$, each with tail mass $q=B(D)$. If every block contributed $qD$ regret, then choosing $D$ at the upper-bound balancing scale would give the desired $Tq$ lower rate.
Failure: Iteration 13 identified several collapse modes. With one shared hidden type, a nonzero terminal observation can fully reveal the type, so useful unresolved blocks saturate around $1/q$ and total regret is only about $D$. With independent block bits, the comparator is one fixed quote, so blockwise signs aggregate only as $\mathbb E|\sum_jw_j\sigma_j|\lesssim(\sum_jw_j^2)^{1/2}$, not linearly. In the actual delayed market, block locality is also false: old quotes persist and can be triggered by later spikes.
Lesson: Matching lower rates require a limited-leakage or multi-hypothesis construction whose Bayes value is computed first, and then a careful realization as prices that preserves the intended tail profile despite persistent quotes.
Source: `iterations/iter_013/idea_01/explorer_01.md`; `iterations/iter_013/idea_01/critic_01_on_explorer_01.md`.

## Assuming same-level repeated atoms preserve a $q$-tail envelope
Attempt: Repeat length-$D$ q-scaled terminal atoms at the same quote levels and keep the envelope $B(D)\approx q$.
Failure: A quote posted early and not hit in its own block can trade on a later block's spike. With $N$ blocks and spike probability $q$, a first-block low-threshold quote has
$$
\Pr(D<\tau<\infty)\approx (1-q)(1-(1-q)^{N-1}),
$$
which is near one when $Nq\gg1$. This violates the intended tail envelope even before proving a regret lower bound.
Lesson: Any block lower-bound construction must either localize quote levels without destroying the fixed comparator, add separators that prevent cross-trades, or explicitly account for cross-block hits in $\beta,\Delta,\delta$.
Source: `iterations/iter_013/idea_01/critic_01_on_explorer_01.md`.

## Treating tail-adaptive truncation as solved by a max-delay master
Attempt: Run delayed Hedge over all dyadic windows $H$ and grid quotes $b$, then claim regret to the best $H$ scales as $\sqrt{TH\log(K\log T)}$.
Failure: The standard max-delay analysis pays the largest delay among all candidate arms. If windows up to $T$ are included, this gives essentially linear overhead even when the best $H$ is small. The accepted $H+1$-residue Hedge proof only handles a fixed delay bound, not arm-specific comparator delay.
Lesson: The clean one-level $(H,b)$ reduction is useful only after proving a heterogeneous-delay experts lemma with comparator-specific delay dependence, or after exploiting additional nesting structure of $r_t^H(b)$.
Source: `iterations/iter_013/idea_02/explorer_01.md`; `iterations/iter_013/idea_02/critic_01_on_explorer_01.md`.

## Treating the two-arm advantage reduction as proving heterogeneous-delay experts
Attempt: Settle the missing comparator-specific delay theorem by reducing the fast/slow two-arm case to the advantage variables $\Delta_t=s_t-f_t$, $A_T=\sum_t q_t\Delta_t$, and $S_T=\sum_t\Delta_t$.
Failure: The reduction is correct but only restates the hard part:
$$
A_T\ge-\tilde O(\sqrt T),\qquad
A_T\ge S_T-\tilde O(\sqrt{TD})
$$
must still be proved. The safe wealth-wrapper idea lacks the key ramp-up analysis: fast-regret safety limits unresolved slow exposure, while slow regret requires rapidly exploiting sustained positive $\Delta_t$. A two-arm proof also would not automatically give the many-arm dyadic-window theorem needed for market adaptation.
Lesson: Use the delayed advantage game as the canonical first test, but do not claim tail-adaptive truncation until the safety/capture tradeoff is solved quantitatively and extended beyond two arms.
Source: `iterations/iter_014/idea_01/explorer_01.md`; `iterations/iter_014/idea_01/critic_01_on_explorer_01.md`.

## Treating nested-window structure as a proved adaptive-truncation theorem
Attempt: Use monotonicity $r_t^H(b)\le r_t^{H'}(b)$ and dyadic increments to prove an adaptive bound of the form
$$
R_T^P\lesssim T/K+\min_H\{\sqrt{TH\log K}+\delta_T^P(H)\}.
$$
Failure: The nested increment decomposition is real, but the proposed reduction mixed pathwise comparator values $V_m^G(\omega)=\max_b\sum_t g_t^m(b,\omega)$ with the expected comparator gap $\delta_T^P(H)$. A pathwise oracle would charge $\mathbb E[V_M^G(\omega)-V_m^G(\omega)]$, which can exceed $\delta_T^P(H)$. If $V_m^G$ is defined in expectation instead, the algebraic reduction is plausible but no online algorithm proving the expected oracle is known. The original increment formula also omitted the finite-horizon cutoff $\tau_t(b)\le T-t$.
Lesson: Keep nested windows as a promising special-structure route, but first fix the value convention, prove an actual oracle inequality, and test two-window adversarial tables before returning to the full market.
Source: `iterations/iter_014/idea_02/explorer_01.md`; `iterations/iter_014/idea_02/critic_01_on_explorer_01.md`.

## Treating safe-clipped delayed Hedge as a two-arm delayed-advantage solution
Attempt: Combine a delayed no-regret proposal $p_t$ with the solvency capacity
$$
C_t=B+\sum_{u\le t-D}q_u\Delta_u-\sum_{t-D<u<t}q_u
$$
by playing $q_t=\min\{p_t,C_t,1\}$. The hope was that solvency gives $A_T\ge-B$, while delayed Hedge controls slow regret.
Failure: The solvency lemma is valid, but this clipping rule can deplete capacity to zero and never recover. In the delayed-advantage abstraction, take $p_t=1/2$ before feedback, $D>2B$,
$$
\Delta_1=\cdots=\Delta_{2B}=-1,\qquad
\Delta_{2B+1}=\cdots=\Delta_T=+1.
$$
The learner spends $q_t=1/2$ for $2B$ rounds, reaches $C=0$, and negative reveals do not replenish capacity because $q_t(\Delta_t+1)=0$. Since unplayed positive advantages are not banked in $O_t$, the rule can remain at $q_t=0$ while slow is good, giving linear slow regret $S_T-A_T$.
Lesson: Solvency is a useful fast-safety invariant, but slow capture needs a reserve, fractional wealth rule, or a different potential argument. The clipping term in the delayed-Hedge decomposition is exactly where linear loss can hide.
Source: `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Using all-$\pm1$ advantages as an indistinguishable first-$D$-round lower bound
Attempt: Argue that the all-$+1$ and all-$-1$ advantage sequences force the same first $D$ decisions, so any fast-safe algorithm must suffer $\Omega(D)$ slow regret on the positive sequence.
Failure: In the original fast/slow reward model, immediate fast rewards may distinguish these environments: for $\Delta=+1$, one may have $f_t=0,s_t=1$, while for $\Delta=-1$, one may have $f_t=1,s_t=0$. The learner observes fast rewards immediately, so the first $D$ decisions need not match.
Lesson: The $D$-scale lower-bound stress test is still valid after repair, but it must use an advantage-only feedback abstraction or a common fast baseline such as $f_t\equiv1/2$, $\Delta_t=\pm1/2$.
Source: `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Treating the simultaneous expected nested-window oracle as viable
Attempt: Prove a nested-window oracle that, for all windows $m$, satisfies
$$
V_m^G-\mathbb E L^m(A)\le B_m+c(V_M^G-V_m^G),
$$
with standard budgets $B_m$, then derive adaptive truncation from it.
Failure: Iteration 15 gives a deterministic finite-grid market obstruction for $H_1=1,H_2=D$. Let $G=\{\ell,h\}$, $h=\ell+d$, and use periodic medium prices $m\in(\ell,h)$ with high spikes every $D$ rounds. Over $T=ND+1$, if $\ell D\ge h$,
$$
V_1^G=\ell ND,\qquad V_2^G=hND,\qquad V_2^G-V_1^G=dND.
$$
Long-window near-optimality forces high quotes on all but $B_2/d$ active rounds. But high quotes earn short-window reward only on the $N$ rounds immediately before high spikes, so
$$
V_1^G-\mathbb E L^1\ge \ell ND-\ell B_2/d-hN.
$$
For fixed $c$, choose $d\ll \ell/c$, $D\gg h/\ell$, and $N\gg d^{-2}$; with $B_1=O(\sqrt{ND})$, $B_2=O(D\sqrt N)$, the short-window oracle inequality fails.
Lesson: The strong simultaneous expected oracle is not the right nested-window route. This does not refute weaker min-over-window adaptive truncation guarantees or the one-level heterogeneous-delay reduction.
Source: `iterations/iter_015/idea_02/explorer_01.md`; `iterations/iter_015/idea_02/critic_01_on_explorer_01.md`.

## Treating the iteration 16 Bayes/no-gap package as a solved original problem
Attempt: Stop with a "best current iff" saying that finite-class/product-closed Bayes predictability values characterize sublinear regret, while retaining the $\delta_T(H)$ truncation upper bound for rates.
Failure: The solution critics and gate rejected this as a solution to the original problem. The finite-class finite-grid identity and no-gap extensions are valid partial value characterizations under public-exogenous, randomized-policy, horizon-aware assumptions, but they are not arbitrary infinite-class theorems, scalar tail iff conditions, or matching power-tail rate results. The displayed power-tail formula from $\delta_T(H)\lesssim T H^{-\alpha}$ is only an upper bound.
Lesson: Present the finite/no-gap Bayes package as a theorem package with explicit scope and a "not claimed" paragraph. Keep scalar-tail impossibility, lower-rate matching, arbitrary infinite classes, action-dependent prices, and anytime known-law policies separate. Use horizon-censored $M_t=\max_{t<s\le T}P_s$ in every finite-horizon formula.
Source: `iterations/iter_016/solver_attempt.md`; `iterations/iter_016/solution_critic_01.md`; `iterations/iter_016/solution_critic_02.md`; `iterations/iter_016/solution_gate.md`; `iterations/iter_016/idea_01/explorer_01.md`; `iterations/iter_016/idea_01/critic_01_on_explorer_01.md`.

## Treating the Borel-policy payoff-domination bridge as closed by checklist
Attempt: Upgrade the completed $L^\infty(\lambda_t;\Delta(G))$ payoff-measure dominated no-gap theorem to original Borel private-randomized policies by asserting
$$
C_{\rm Borel}=C_{L^\infty}
$$
from standard measurable-version and randomization facts.
Failure: Iteration 16's critic found the bridge plausible but not written. The forward inclusion requires a formal common Borel seed/state policy model, a seed/prefix induction, Borel section-integral measurability, and Fubini reward-coordinate equality. The reverse inclusion requires a completed-measurable-to-Borel version theorem and finite-action implementation with independent uniforms. Weak-* compactness also needs the exact $L^\infty=(L^1)^*$ setup and weak-* closed simplex constraints.
Lesson: State the completed-kernel no-gap theorem separately from the original-policy theorem. When upgrading, prove both inclusions and say explicitly that only expected additive reward coordinates are preserved, not behavior or pathwise guarantees.
Source: `iterations/iter_016/idea_02/explorer_01.md`; `iterations/iter_016/idea_02/critic_01_on_explorer_01.md`.

## Treating the finitely additive dual as an ordinary Bayes/posterior formula
Attempt: Extend the finite-class $\Psi_G(\pi)$ identity to arbitrary infinite classes by replacing ordinary priors with finitely additive $\nu\in ba_1^+(\Theta)$ and writing a posterior-predictive Bayes envelope.
Failure: Iteration 19 accepts only the abstract reward-vector dual
$$
\mathcal R_G(\Theta)=
\sup_{\nu\in ba_1^+(\Theta)}
\left\{\langle V^G,\nu\rangle-\sup_{c\in C}\langle c,\nu\rangle\right\}.
$$
For a general finitely additive prior there need not be a countably additive mixture price law, regular conditional posterior, or myopic conditional reward curve. The support term $\sup_{c\in C}\langle c,\nu\rangle$ must stay as a support function of the whole attainable reward set.
Lesson: The $\mathrm{ba}$ theorem is a useful arbitrary-class value duality, not a statistical Bayes characterization, scalar tail condition, or rate theorem. Ordinary $\Psi_G$ notation remains justified for finite/countably additive priors only when the mixture law and regular conditionals exist.
Source: `iterations/iter_019/solver_attempt.md`; `iterations/iter_019/idea_01/explorer_01.md`; `iterations/iter_019/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`.

## Using finite or countably additive priors to characterize arbitrary infinite classes without no-gap assumptions
Attempt: Hope that ordinary priors, or the supremum over finite subclasses, give the full infinite-class minimax value.
Failure: Iteration 19 reaffirms the product-closure obstruction. Finite-support priors give only
$$
\sup_{F\Subset\Theta}\mathcal R_G(F)
=
\inf_{c\in\overline C^{pt}}\sup_\theta(V_\theta^G-c_\theta),
$$
which may be strictly below the true value. In the abstract example $\Theta=\mathbb N$, $V\equiv1$, and $C=\{c\in[0,1]^\mathbb N:c\text{ has finite support}\}$, every countably additive prior is captured by finite supports in the limit and gives dual value $0$, but the full value is $1$; a finitely additive mass at infinity detects it.
Lesson: For arbitrary infinite classes, either keep the exact $\mathrm{ba}$ dual or impose a no-gap/product-closure hypothesis. Ordinary-prior/posterior statements need product closedness, payoff-measure domination, identifiable structure, or another condition making finite-prior values approximate the full value.
Source: `iterations/iter_019/idea_02/explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`.

## Treating the iteration 20 $\mathrm{ba}$ dual as a loop-stopping solution
Attempt: Declare the original problem solved, in the public-exogenous minimax sense, by the exact finite-grid finitely additive dual and the $T/K$ grid-to-continuum comparison. The proposed necessary and sufficient condition was the positive part of the $\mathrm{ba}$ dual value being $o(T)$.
Failure: The solution gate rejected the stop claim. The condition is essentially
$$
(\mathcal R_T^{G_T})_+=o(T)
$$
written through a support-function dual. This is an exact abstract value identity once the functional-analytic proof is written, but it is not a structural tail characterization, not an ordinary posterior/Bayes formula, and not a matching regret-rate theorem. The proof also depends on a fixed convex randomized-policy reward set $C$, so policy-class definitions remain substantive for arbitrary infinite classes.
Lesson: Keep the $\mathrm{ba}$ dual as a standalone arbitrary-class finite-grid value theorem. Immediately caveat that the support term $\sup_{c\in C}\langle c,\nu\rangle$ is abstract for general finitely additive priors. Do not present it as solving scalar-tail necessity, power-tail lower rates, action-dependent prices, anytime learning, or the original Borel-policy no-gap bridge.
Source: `iterations/iter_020/solver_attempt.md`; `iterations/iter_020/solution_critic_01.md`; `iterations/iter_020/solution_critic_02.md`; `iterations/iter_020/solution_gate.md`.

## Treating iteration 21 theorem hygiene as a new structural characterization
Attempt: Read the proof-ready $\mathrm{ba}$ dual and credible Borel-policy bridge target as new evidence that the original tail-characterization problem is essentially solved.
Failure: Iteration 21's solver explicitly returns "SOLVED: no." The $\mathrm{ba}$ dual remains the minimax value written as an abstract support-function dual, and the Borel bridge remains conditional on standard measurable-version/randomization facts and an exact common Borel seed/state policy model. Neither gives a scalar tail iff, a posterior formula for arbitrary $\mathrm{ba}$ priors, matching power-tail lower rates, or an action-dependent/anytime theorem.
Lesson: Use iteration 21 to improve proof readiness and theorem scope. Keep structural tail necessity, lower-rate matching, adaptive truncation, natural no-gap hypotheses, and anytime known-law boundaries as separate open fronts.
Source: `iterations/iter_021/solver_attempt.md`; `iterations/iter_021/idea_01/explorer_01.md`; `iterations/iter_021/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_021/idea_02/explorer_01.md`; `iterations/iter_021/idea_02/critic_01_on_explorer_01.md`.

## Treating single-account fractional wealth as a two-arm delayed-advantage solution
Attempt: Use one solvency capital account for both fast safety and slow capture, with a fractional staking rule such as $q_t=C_t/2$, hoping it avoids the zero-capacity trap of clipped Hedge while preserving $A_T\ge-B$.
Failure: Iteration 22 gives a $D=1$ depletion sequence. After $N$ rounds of $\Delta=-1$, the capital is exponentially small, $C\approx B2^{-N}$. On a following $2N$-round positive suffix, $C$ grows only by a factor $3/2$ per round under $q=C/2$, so the learner needs $\Theta(N)$ positive rounds to regain substantial exposure and suffers $\Omega(N)$ slow regret. This violates the desired $\tilde O(\sqrt T)$ scale for that rule.
Lesson: Solvency alone is not enough; slow capture likely needs fresh reserved capital, interval restarts, or a different potential. Any interval-tester portfolio must also handle aggregation under $q_t\le1$.
Source: `iterations/iter_022/idea_01/explorer_01.md`; `iterations/iter_022/idea_01/critic_01_on_explorer_01.md`.

## Transferring block-local limited-leakage lower bounds directly to the market
Attempt: Use a common hidden type over many blocks, with $q$-mass delayed payoff separation $\gamma$ and per-block information leakage $\kappa$, then import the abstract Bayes lower bound $D\gamma\min\{N,1/\kappa\}$ as a delayed-market lower bound.
Failure: The abstract calculation is block-local, but the delayed market is not: quotes posted in one block remain live and can trade on terminal prices from later blocks. Same-level repeated blocks have reward curve
$$
g_{\theta,n}(a)=a[1-(1-r_{\theta,a})^n],
$$
not $a r_{\theta,a}$. In the limited-leakage regime $N\approx1/\kappa$ and often $Nq\gg1$, old quotes are hit with probability near one, so the intended $q$-tail or $\Delta,\delta$ envelope can be destroyed.
Lesson: Future lower-rate attempts must compute the actual same-level market Bayes value or supply a localization gadget that prevents cross-block hits while preserving one fixed comparator quote and small information leakage.
Source: `iterations/iter_022/idea_02/explorer_01.md`; `iterations/iter_022/idea_02/critic_01_on_explorer_01.md`.
