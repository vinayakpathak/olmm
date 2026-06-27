# Claim Ledger

## Claim: Known finite-horizon exogenous laws are learnable by a horizon-aware oracle
Status: proven
Confidence: high
Dependencies: Finite horizon $T$ known to the learner; exogenous/action-independent law on $P_{1:T}$ known through conditional probabilities; regret against $\sup_a\mathbb E\sum_t r_t(a)$; no computational efficiency requirement.
Evidence: With $M_t=\max_{t<s\le T}P_s$, define $g_t(a)=\mathbb E[a\mathbf{1}\{M_t>a\}\mid P_{1:t}]$. Pick a measurable maximizer on $\mathcal G_K=\{0,1/K,\ldots,(K-1)/K\}$. For every $a$, downward rounding to $b\in\mathcal G_K$ gives pathwise
$$
a\mathbf{1}\{M_t>a\}\le b\mathbf{1}\{M_t>b\}+1/K.
$$
Summing yields $R_T\le T/K$; taking $K=T$ gives $O(1)$ regret for every known exogenous law.
Known gaps: Does not apply to unknown/minimax laws, action-dependent prices, efficient computation, or horizon-free anytime policies.
Source: `iterations/iter_002/solver_attempt.md`; `iterations/iter_002/idea_01/explorer_01.md`; `iterations/iter_002/idea_01/critic_01_on_explorer_01.md`.

## Claim: Essential-sup tail condition is sufficient under exogenous prices
Status: proven
Confidence: high
Dependencies: Exogenous/oblivious price sequence; delayed full-information experts bound for fixed reward vectors with delays at most $H$; use $\sup_a$ if comparator maximum may fail.
Evidence: Truncation comparison plus grid discretization plus delayed-experts bound gives
$$
R_T\lesssim \sqrt{T (H+1)\log K}+T/K+T\beta(H).
$$
If $\beta(H_T)\to0$, choose $H_T\to\infty$ slowly with $(H_T+1)\log T=o(T)$ and $K=T$.
Known gaps: Need cite or prove the precise delayed-experts theorem; if future prices depend on learner actions, reward vectors are not fixed delayed full-information rewards.
Source: `inputs/delays.tex`; `iterations/iter_001/solver_attempt.md`; idea_01 reports and critique.

## Claim: Essential-sup tail condition is necessary for sublinear regret
Status: refuted
Confidence: high
Dependencies: Refutation uses process-wise/law-aware interpretation.
Evidence: If $P_t\stackrel{iid}{\sim}\mathrm{Unif}[0,1]$, then for any $a<1$,
$$
\Pr(h<\tau_t(a)<\infty\mid P_{1:t})=a^h,
$$
so $\beta(h)=\sup_{a<1}a^h=1$ for all $h$. A learner that knows the law can play a maximizer of
$$
G_T(a)=\sum_{L=0}^{T-1}a(1-a^L)
$$
at every round and match the fixed comparator in expectation, hence zero regret.
Iteration 2 strengthened this: every finite-horizon known exogenous law admits regret $T/K$ via conditional grid maximization.
Known gaps: This refutes only the stated necessity under law-aware fixed-law quantifiers; minimax-over-unknown-class necessity remains open.
Source: `iterations/iter_001/solver_attempt.md`; `iterations/iter_002/idea_01/explorer_01.md` and critique.

## Claim: Comparator-gap truncation gives a sharper sufficient term than worst-action $\Delta$
Status: proven
Confidence: high
Dependencies: Same exogeneity assumptions as the upper bound.
Evidence: Let $V_T=\sup_a\mathbb E\sum_t r_t(a)$, $V_T^H=\sup_a\mathbb E\sum_t r_t^H(a)$, and $\delta_T(H)=V_T-V_T^H$. Since learner reward only increases when moving from truncated to true rewards,
$$
R_T\le R_T^H+\delta_T(H).
$$
Also $\delta_T(H)\le \Delta_T(H)\le T\beta(H)$ when $\beta$ is available.
Known gaps: Need decide whether final theorem should use $\delta$ only, or keep $\Delta$ for easier estimation.
Source: idea_01 critique; synthesized proof.

## Claim: Uniform $\Delta$- or $\delta$-tail condition yields sublinear uniform regret
Status: proven
Confidence: high
Dependencies: One algorithm and one parameter schedule must work uniformly over $\mathcal C_T$; exogenous public prices; learner observes all prices and can reconstruct truncated counterfactual grid rewards.
Evidence: For horizon-indexed classes,
$$
\sup_{P\in\mathcal C_T}R_T^P
\lesssim \sqrt{T (H+1)\log K}+T/K+\sup_{P\in\mathcal C_T}\delta_T^P(H).
$$
Thus sublinear regret follows from $(H_T+1)\log K_T=o(T)$, $T/K_T=o(T)$, and $\sup_P\delta_T^P(H_T)=o(T)$. The same holds with $\Delta$ in place of $\delta$.
Known gaps: This is sufficient, not known necessary. The final write-up should include the $H+1$-residue Hedge timing proof or cite a precise delayed-feedback theorem.
Source: idea_01 explorer and critique; `iterations/iter_002/idea_02/explorer_01.md`; `iterations/iter_002/idea_02/critic_01_on_explorer_01.md`.

## Claim: $H+1$-residue Hedge gives the needed delayed-grid bound
Status: proven conditional on standard Hedge
Confidence: high
Dependencies: Full reward vector $g_t\in[0,1]^K$ is revealed before the next decision in the same residue class modulo $H+1$; rewards are fixed independently of the learner action.
Evidence: Run one Hedge instance on each residue class. Each instance suffers regret $O(\sqrt{n_j\log K})$ to the best arm on its subsequence. Since a single global comparator is no better than the sum of per-residue best comparators,
$$
\max_b\sum_t g_t(b)-\mathbb E\sum_t g_t(a_t)
\le C\sum_{j=0}^{H}\sqrt{n_j\log K}
\le C\sqrt{T(H+1)\log K}.
$$
Known gaps: Need write the update order explicitly: rewards from round $t$ must be processed before the decision at $t+H+1$.
Source: `iterations/iter_002/idea_02/explorer_01.md`; `iterations/iter_002/idea_02/critic_01_on_explorer_01.md`.

## Claim: Worst-action $\Delta_T(H)=o(T)$ is necessary for sublinear regret
Status: refuted
Confidence: high
Dependencies: Refutation uses a known singleton law.
Evidence: Horizon $T$: set $P_1=\cdots=P_{T-1}=0$, $P_T\sim\mathrm{Unif}[0,1]$. A law-aware learner quotes $1/2$ every early round and gets zero regret, but for $H=o(T)$ most comparator rewards arrive only at $T$, so $\Delta_T(H)\approx (T-H)/4=\Omega(T)$.
Known gaps: This is horizon-dependent; enough to refute necessity of $\Delta$ as a process-wise/law-aware characterization.
Source: idea_01 explorer and critique.

## Claim: Hidden-terminal construction gives finite-horizon minimax linear regret
Status: proven
Confidence: medium-high
Dependencies: Learner is a single algorithm chosen before the world; regret is minimax over an unknown class containing both worlds; horizon $T=D+1$.
Evidence: Worlds share $P_1=\cdots=P_D=0$. Terminal $Y_L\sim\mathrm{Unif}[1/2,5/8]$ or $Y_H\sim\mathrm{Unif}[3/4,7/8]$. For $g_i(a)=a\Pr(Y_i>a)$,
$$
V_L=1/2,\quad V_H=3/4,\quad \sup_a (g_L(a)+g_H(a))/2=1/2.
$$
Bayes gap under the uniform prior is $5/8-1/2=1/8$ per early round, hence $D/8$. Yao gives a world with regret at least $D/8$.
Known gaps: Does not imply fixed-law asymptotic necessity; q-scaled and infinite-block variants need more work.
Source: idea_02 explorer and critique.

## Claim: Posterior Bayes-gap certificate lower-bounds minimax regret over unknown exogenous classes
Status: proven conditional on standard probability formalization
Confidence: medium-high
Dependencies: Exogenous/action-independent price laws $P^\theta$; prior $\pi$ over a class; regular conditional probabilities; decision-time information $\mathcal I_t$ specified before the learner samples $a_t$; comparator value $V_\theta=\sup_a\sum_t\mathbb E_\theta r_t(a)$. If $\mathcal I_t$ includes learner actions/randomness, the posterior object must be defined under the mixture law and any resulting upper bound on learner Bayes reward must hold uniformly over algorithms.
Evidence: For any learner, conditional on $\mathcal I_t$, its randomized action has posterior expected reward at most
$$
\sup_a \mathbb E_{\theta\sim\pi(\cdot\mid\mathcal I_t)}
  \mathbb E_\theta[r_t(a)\mid \mathcal I_t].
$$
Summing gives Bayes regret at least
$$
\mathbb E_{\theta\sim\pi}V_\theta-
\sum_t\mathbb E_{\bar P}\left[
\sup_a \mathbb E_{\theta\mid\mathcal I_t}
  \mathbb E_\theta[r_t(a)\mid \mathcal I_t]
\right],
$$
and minimax regret is at least this Bayes regret by averaging/Yao.
Known gaps: As a fully general object this is close to the Bayes/minimax value itself, so it is best viewed as a lower-bound certificate rather than a clean scalar tail characterization. It is not valid for action-dependent markets without causal counterfactual semantics.
Source: `iterations/iter_003/idea_01/explorer_01.md`; `iterations/iter_003/idea_01/critic_01_on_explorer_01.md`.

## Claim: Fixed-prior Bayes reward is myopically optimized under public exogenous prices
Status: proven on finite quote grids; continuum value statement conditional on standard selector/approximation caveats
Confidence: high for finite grids
Dependencies: Finite horizon; public exogenous prices; learner observes $P_{1:t}$ before choosing $a_t$; learner private randomness is independent of the active law; actions do not affect future prices or future observations; regular conditional probabilities under the mixture law. For exact maximizers, use a finite quote grid $G$, or else use suprema/$\varepsilon$-selectors in $[0,1]$.
Evidence: For prior $\pi$ and mixture law $\bar P_\pi$, set $M_t=\max_{t<s\le T}P_s$ and
$$
g_t^\pi(h_t,a)=a\,\bar P_\pi(M_t>a\mid P_{1:t}=h_t).
$$
Conditional on pre-action information, any randomized learner's expected round-$t$ reward is a convex combination of $g_t^\pi(P_{1:t},a)$, hence at most $\max_{a\in G}g_t^\pi(P_{1:t},a)$ on a finite grid. Choosing a pointwise maximizer at each time attains all these envelopes because current actions do not affect future public histories.
Known gaps: Does not imply minimax equality by itself. The continuum version must handle strict-threshold nonattainment and measurable $\varepsilon$-selection. The lemma fails for action-dependent prices or private/censored feedback not determined by public prices.
Source: `iterations/iter_004/idea_02/explorer_01.md`; `iterations/iter_004/idea_02/critic_01_on_explorer_01.md`.

## Claim: Least-favorable Bayes-gap identity exactly characterizes minimax regret
Status: refuted as originally stated; corrected finite-grid version separated below
Confidence: high that the displayed continuum/grid-mixed statement is invalid as written
Dependencies: Would need finite or compact law class, randomized measurable policies, a consistent action set for learner/comparator/Bayes envelope, compact convex risk set or a precise minimax theorem, standard Borel histories, regular conditional probabilities, and a convention for negative regret.
Evidence: The solver asserted
$$
\inf_A\sup_\theta R_T^\theta(A)=\sup_\pi\Psi_T(\pi),
$$
but did not prove the minimax theorem. Its "finite-grid" version still used $\sup_{a\in[0,1]}$ in $V_\theta$ and in the Bayes envelope; this is false without an explicit $O(T/K)$ discretization error. A corrected candidate is: for finite $\Theta$, finite $G$, and grid comparator
$$
V_\theta^G=\max_{a\in G}\sum_t\mathbb E_\theta r_t(a),
$$
define
$$
\Psi_G(\pi)=\sum_\theta\pi_\theta V_\theta^G
-
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
At the end of iteration 4, this corrected grid-restricted statement was plausible but still lacked a compactness/minimax proof. Iteration 5 supplies the corrected finite-grid reward-set proof route; see the next claim.
Known gaps: The original continuum/grid-mixed identity remains false as stated. The corrected finite-grid version is an information-value/minimax characterization close to the game value, not a scalar tail characterization or matching rate theorem. Deterministic policies need not satisfy the identity; randomized policies are essential.
Source: `iterations/iter_004/solver_attempt.md`; `iterations/iter_004/solution_critic_01.md`; `iterations/iter_004/solution_critic_02.md`; `iterations/iter_004/solution_gate.md`; `iterations/iter_004/idea_01/explorer_01.md`; `iterations/iter_004/idea_01/critic_01_on_explorer_01.md`.

## Claim: Corrected finite-grid minimax/Bayes-gap identity
Status: proved conditional on the accepted finite-grid Bayes-myopic lemma
Confidence: medium-high
Dependencies: Finite horizon; finite law class $\Theta$; finite quote grid $G$; public exogenous/action-independent prices; randomized measurable grid-valued policies with private randomness independent of the active law; learner knows $T,\Theta,G$ but not $\theta$; comparator is grid-restricted:
$$
V_\theta^G=\max_{a\in G}\sum_t\mathbb E_\theta r_t(a).
$$
Evidence: For a policy $A$, write $L_\theta(A)=\mathbb E_{\theta,A}\sum_t r_t(a_t)$ and
$$
C=\{(L_\theta(A))_{\theta\in\Theta}:A\text{ admissible}\}\subset[0,T]^\Theta.
$$
The set $C$ is convex by ex-ante randomization between policies. Passing to the compact convex closure $\overline C$ does not change infima of continuous regret functions or support functions. Finite-dimensional minimax applied to
$$
F(x,\pi)=\sum_\theta\pi_\theta(V_\theta^G-x_\theta)
$$
gives
$$
\inf_A\sup_\theta(V_\theta^G-L_\theta(A))
=
\sup_{\pi\in\Delta(\Theta)}
\left[
\sum_\theta\pi_\theta V_\theta^G-\sup_A\sum_\theta\pi_\theta L_\theta(A)
\right].
$$
The accepted fixed-prior Bayes-myopic lemma identifies
$$
\sup_A\sum_\theta\pi_\theta L_\theta(A)
=
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}),
$$
yielding the corrected $\Psi_G$ identity.
Known gaps: This is not the solver's weak-* compactness proof; the final write-up should present the finite-dimensional reward-set argument explicitly. The identity is finite-grid/finite-class only, uses signed upper regret, and is not a scalar tail condition. Infinite classes need additional compactness or finite-subclass lower bounds. Action-dependent or private/censored feedback models are outside scope.
Source: `iterations/iter_005/solver_attempt.md`; `iterations/iter_005/solution_critic_01.md`; `iterations/iter_005/solution_critic_02.md`; `iterations/iter_005/solution_gate.md`; `iterations/iter_005/idea_01/explorer_01.md`; `iterations/iter_005/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_005/idea_02/explorer_01.md`; `iterations/iter_005/idea_02/critic_01_on_explorer_01.md`; synthesis.

## Claim: Continuum and grid minimax values differ by at most $T/K$
Status: proved
Confidence: high
Dependencies: Public-exogenous model; arbitrary law class $\Theta$ is allowed; signed minimax values over the same randomized measurable policy class; grid $G_K=\{0,1/K,\ldots,(K-1)/K\}$; comparator for the continuum value uses $\sup_{a\in[0,1]}$.
Evidence: For every $a\in[0,1]$, let $\lfloor a\rfloor_K\in G_K$ be downward rounding, with $a=1$ rounded to $(K-1)/K$. Pathwise, for $M_t=\max_{t<s\le T}P_s$,
$$
a\mathbf{1}\{M_t>a\}
\le
\lfloor a\rfloor_K\mathbf{1}\{M_t>\lfloor a\rfloor_K\}+1/K.
$$
Hence $V_\theta\le V_\theta^{G_K}+T/K$. Also rounding every action of any continuum policy loses at most $T/K$ expected reward in every world. These two inequalities give
$$
|\mathcal R_{[0,1]}(\Theta,T)-\mathcal R_{G_K}(\Theta,T)|\le T/K.
$$
Known gaps: This compares minimax values, not an exact continuum least-favorable-prior formula. Combining with $\sup_\pi\Psi_{G_K}$ uses the finite-grid identity above.
Source: `iterations/iter_005/solver_attempt.md`; `iterations/iter_005/solution_critic_01.md`; `iterations/iter_005/solution_critic_02.md`; `iterations/iter_005/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`; synthesis.

## Claim: Finite-class sublinear continuum regret is equivalent to a positive-part grid Bayes value
Status: proved conditional on the accepted finite-grid identity and grid-to-continuum minimax comparison
Confidence: high under finite public-exogenous assumptions
Dependencies: Finite horizon-indexed class $\Theta_T$; public exogenous/action-independent prices; randomized measurable policies with private randomness independent of $\theta$; learner knows $T,\Theta_T,G_T$; signed upper-regret minimax value
$$
\mathcal R_T^{[0,1]}=\inf_A\sup_{\theta\in\Theta_T}\left(V_\theta-L_\theta(A)\right);
$$
positive-part convention for learnability; grid $G_T=\{0,1/T,\ldots,(T-1)/T\}$.
Evidence: The accepted finite-grid identity gives
$$
\mathcal R_T^{G_T}=\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi),
$$
and the accepted rounding comparison gives
$$
|\mathcal R_T^{[0,1]}-\mathcal R_T^{G_T}|\le 1
$$
for this grid. Since $x\mapsto x_+$ is 1-Lipschitz,
$$
\left|
(\mathcal R_T^{[0,1]})_+
-
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+
\right|\le 1.
$$
Hence finite-class sublinear continuum upper regret is equivalent to $(\sup_\pi\Psi_{G_T}(\pi))_+=o(T)$.
Known gaps: This is finite-class only and remains a value characterization close to the game value, not a scalar tail criterion or matching power-tail rate theorem. It is not an exact continuum $\Psi_{[0,1]}$ formula; continuum selector and strict-threshold issues are avoided by grids.
Source: `iterations/iter_006/idea_01/explorer_01.md`; `iterations/iter_006/idea_01/critic_01_on_explorer_01.md`.

## Claim: Finite-subclass modulus equals product-closure relaxed grid minimax value
Status: proven
Confidence: high for the abstract fixed-grid reward-set statement
Dependencies: Fixed finite horizon $T$; fixed finite quote grid $G$; public exogenous class $\Theta$; randomized grid policies induce an attainable reward set
$$
C=\{(L_\theta(A))_{\theta\in\Theta}:A\text{ admissible}\}\subset[0,T]^\Theta .
$$
Let
$$
\mathcal R_G(\Theta)=\inf_{c\in C}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta)
$$
and
$$
\Phi_G(\Theta)=\sup_{F\subset\Theta,\ |F|<\infty}\mathcal R_G(F),
$$
where finite-subclass values use the same policy class restricted to $F$.
Evidence: Finite-intersection compactness in $[0,T]^\Theta$ gives
$$
\Phi_G(\Theta)
=
\inf_{c\in\overline C^{pt}}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta),
$$
where $\overline C^{pt}$ is the product-topology closure. If every finite $F$ can be controlled at level $\alpha+\varepsilon$, the closed constraint sets in $\overline C^{pt}$ have the finite-intersection property and yield a pointwise-limit reward vector controlling all $\theta$. Conversely, any point in $\overline C^{pt}$ controlling all $\theta$ is approximable on each finite $F$ by points of $C$.
Known gaps: This is a relaxed value theorem. It characterizes the true infinite-class value only when $C$ is product closed, or when product-closure relaxation is otherwise known not to improve the value.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`.

## Claim: Product-closed attainable reward sets have no infinite-class finite-subclass gap
Status: proven
Confidence: high for the abstract criterion
Dependencies: Same fixed-grid setup as the product-closure claim.
Evidence: If $C=\overline C^{pt}$, then
$$
\mathcal R_G(\Theta)=\Phi_G(\Theta).
$$
Thus finite-subclass Bayes-gap certificates characterize the full grid minimax value whenever the attainable reward set is product closed.
Known gaps: Product closedness is a structural assumption, not automatic. Without it, finite priors may see only the relaxed value and miss a gap "at infinity."
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`.

## Claim: Common prefix domination gives product compactness for grid-policy reward sets
Status: proved conditional on the natural $L^\infty$ prefix-kernel policy formalization
Confidence: medium-high
Dependencies: Fixed finite $T$, finite $G$, public exogenous prices; policies represented by measurable prefix kernels $q_t(h_t)\in\Delta(G)$; for each prefix length $t$, all $P^\theta_{1:t}$ are dominated by a common sigma-finite $\lambda_t$; policies identified up to $\lambda_t$-null sets.
Evidence: For each $(t,a,\theta)$, the weighted prefix measure
$$
B\mapsto \mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}]
$$
is dominated by $\lambda_t$, with $L^1(\lambda_t)$ density $f^\theta_{t,a}$. Then
$$
L_\theta(q)=\sum_{t,a}\int q_{t,a}(h) f^\theta_{t,a}(h)\,d\lambda_t(h).
$$
The feasible sets $L^\infty(\lambda_t;\Delta(G))$ are weak-* compact, the coordinate maps $q\mapsto L_\theta(q)$ are weak-* continuous, and the image in $[0,T]^\Theta$ is product compact. Hence $C$ is product closed and the no-gap criterion applies.
Known gaps: Final write-up must explicitly prove reduction from arbitrary randomized policies to public-prefix marginal kernels, weak-* closedness of positivity/simplex constraints, and admissible Borel/measurable versions under common domination. The theorem is fixed-grid; continuum quotes still require the existing $T/K$ minimax comparison.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_008/idea_01/explorer_01.md`; `iterations/iter_008/idea_01/critic_01_on_explorer_01.md`; synthesis.

## Claim: Payoff-weighted reward-measure domination suffices for infinite-class no-gap on a finite grid
Status: proved for a completed $L^\infty$ public-prefix-kernel policy class; conditional for original Borel private-randomized policies
Confidence: high for the relaxed-kernel theorem, medium for policy-class alignment
Dependencies: Fixed finite $T$, finite $G$, public exogenous prices; policies represented by measurable public-prefix kernels $q_t(h_t)\in\Delta(G)$, identified up to the relevant dominating measures; for each $t$, there is a sigma-finite Borel measure $\lambda_t$ such that for every $\theta\in\Theta$ and $a\in G$,
$$
\mu^\theta_{t,a}(B)
=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}]
\ll \lambda_t .
$$
Evidence: Write $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$ with $f^\theta_{t,a}\in L^1(\lambda_t)$. Then
$$
L_\theta(q)=\sum_{t,a}\int q_{t,a}(h)f^\theta_{t,a}(h)\,d\lambda_t(h).
$$
The feasible kernel sets $L^\infty(\lambda_t;\Delta(G))$ are weak-* compact; positivity is closed by testing against $L^1_+$, and the simplex constraints are closed by testing against $L^1$. Each coordinate $q\mapsto L_\theta(q)$ is weak-* continuous, so the image reward set $C\subset[0,T]^\Theta$ is product compact and therefore product closed. The product-closed no-gap criterion gives
$$
\mathcal R_G(\Theta)
=\sup_{F\Subset\Theta}\mathcal R_G(F)
=\sup_{F\Subset\Theta}\sup_{\pi\in\Delta(F)}\Psi_{G,F}(\pi).
$$
Iteration 9 clarified that this proof should be presented first as a theorem for the completed $L^\infty$ prefix-kernel class. The original private-randomized Borel policy theorem then needs a separate alignment lemma: induction from arbitrary private-randomized histories to law-independent public-prefix marginal kernels, plus Borel/completed representatives for weak-* limit kernels.
Known gaps: Policy-class alignment is only accepted under the exact common Borel seed/state model recorded below; primitive stochastic-kernel policies require a standard randomization lemma, and completed-kernel Borelization remains a separate conditional lemma. The density support formula is now identified with the conditional-probability $\Psi_{G,F}$ envelope for finite $F,G$. This is finite-grid only; continuum quotes enter only through the separate $T/K$ minimax comparison. Reward-measure domination is weaker than prefix-law domination but still excludes many singular deterministic classes.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_008/idea_01/explorer_01.md`; `iterations/iter_008/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_009/idea_01/explorer_01.md`; `iterations/iter_009/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_01/explorer_01.md`; `iterations/iter_012/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_02/explorer_01.md`; `iterations/iter_012/idea_02/critic_01_on_explorer_01.md`.

## Claim: TV-separable payoff-weighted reward measures give common domination
Status: proven as a measure-theoretic corollary
Confidence: medium-high
Dependencies: For each fixed $t,a$, the finite-measure family $\{\mu^\theta_{t,a}:\theta\in\Theta\}$ has a countable total-variation dense subset; total masses are finite, as here bounded by $1$.
Evidence: Choose a countable TV-dense set $\{\nu_n\}$ and define $\lambda=\sum_n2^{-n}\nu_n$ for each $(t,a)$, or combine over finite $a\in G$. If $\lambda(B)=0$, then every $\nu_n(B)=0$; total-variation approximation implies every $\mu^\theta_{t,a}(B)=0$. Thus the reward-measure domination theorem applies. Compact metric parameter classes with TV-continuous $\theta\mapsto\mu^\theta_{t,a}$ satisfy this separability condition.
Known gaps: This is a total-variation condition, not weak/Feller continuity. It does not cover arbitrary uncountable Dirac/singular classes.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`.

## Claim: The iteration 8 broad "maybe solved" theorem solves the full problem
Status: refuted as stated
Confidence: high
Dependencies: The attempted theorem claimed a necessary-and-sufficient characterization for finite and product-closed infinite public-exogenous classes and suggested this was the best current iff.
Evidence: Both solution critics and the solution gate rejected the stop claim. The finite-class core is accepted, but the infinite-class formula requires an explicit product-closed/no-gap hypothesis and a fully specified policy space; common domination was only a conditional proof route. The result is a minimax/Bayes value characterization, not a scalar tail characterization. It does not cover arbitrary infinite nondominated classes, action-dependent prices, anytime policies, high-probability/pathwise regret, or matching lower bounds for power-tail upper rates.
Known gaps: The finite-class/product-closed theorem package remains valuable partial progress. The full original goal still needs either matching lower-rate constructions or a clarified statement that no scalar tail characterization exists under the intended quantifiers.
Source: `iterations/iter_008/solver_attempt.md`; `iterations/iter_008/solution_critic_01.md`; `iterations/iter_008/solution_critic_02.md`; `iterations/iter_008/solution_gate.md`.

## Claim: Finite-subclass Bayes modulus automatically characterizes arbitrary infinite classes
Status: refuted as stated
Confidence: medium-high
Dependencies: Refutation is abstract for general reward sets; the market-model obstruction is a pathological measurability example under Borel-policy restrictions.
Evidence: Abstractly, take $\Theta=\mathbb N$, $V\equiv1$, and $C=\{c\in[0,1]^\mathbb N:c\text{ has finite support}\}$. Every finite subclass has value $0$, but the full value is $1$. A market-flavored stress test uses $T=2$, $G=\{1/3,2/3\}$, a non-Borel set $A\subset[0,1]$, world $x$ with $P_1=x$, and $P_2=1$ on $A$, $P_2=1/2$ off $A$. Finite subclasses can be memorized by Borel policies, but a full-class Borel policy with regret $<1/6$ would separate $A$ by a Borel set.
Known gaps: The non-Borel construction disappears if arbitrary/nonmeasurable policies are allowed or if $A$ is Borel. Keep it as a compactness/measurability obstruction, not as a natural statistical lower bound.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`.

## Claim: Non-Borel label obstruction can be amplified to linear horizon
Status: proven under Borel public-prefix grid policies
Confidence: high
Dependencies: Fixed horizon $T=D+1$, grid $G=\{1/3,2/3\}$, deterministic public-exogenous laws indexed by $x\in[0,1]$, Borel randomized public-prefix policies, and a non-Borel set $A\subset[0,1]$. Finite-subclass values are computed by policies allowed to depend on the finite subclass.
Evidence: Let $P_1=x$, $P_2=\cdots=P_D=0$, and
$$
P_{D+1}=1\quad(x\in A),\qquad P_{D+1}=1/2\quad(x\notin A).
$$
For $x\in A$, the grid comparator is $2D/3$; for $x\notin A$, it is $D/3$. If $q_t(x)$ is the Borel marginal probability of quoting $2/3$ on early round $t$, then regrets are
$$
R_A(x)=\frac{D-\sum_t q_t(x)}3,\qquad
R_{A^c}(x)=\frac{\sum_t q_t(x)}3.
$$
Regret $<D/6$ everywhere would make $A=\{x:D^{-1}\sum_tq_t(x)>1/2\}$ Borel, contradiction. The constant randomized policy $q_t\equiv1/2$ attains $D/6$. Every finite subclass has value $0$ by choosing a Borel set matching $A$ on that finite set.
Known gaps: This is still a measurability pathology, not a natural Borel statistical lower bound. It vanishes for arbitrary nonmeasurable policies, Borel $A$, or countable identifier sets. The construction is grid-restricted and fails payoff-weighted reward-measure domination because of uncountably many singular label measures.
Source: `iterations/iter_009/idea_02/explorer_01.md`; `iterations/iter_009/idea_02/critic_01_on_explorer_01.md`.

## Claim: q-scaled hidden-terminal pair gives an $\Omega(qD)$ finite-horizon minimax lower-bound atom
Status: proven
Confidence: high
Dependencies: Horizon $T=D+1$; unknown class with two exogenous worlds; learner is not told the active world; $P_1=\cdots=P_D=0$; terminal distribution is $(1-q)\delta_0+q\,{\rm Unif}[1/2,5/8]$ in world $L$, and $(1-q)\delta_0+q\,{\rm Unif}[3/4,7/8]$ in world $H$. For raw $\beta$ claims, extend after $T$ with absorbing prices $P_s=0$.
Evidence: The base revenue curves satisfy
$$
\sup_a f_L(a)=1/2,\qquad \sup_a f_H(a)=3/4,\qquad
\sup_a\frac{f_L(a)+f_H(a)}2=1/2.
$$
Scaling by $q$ gives Bayes gap $q/8$ per unresolved quote round, hence some world has regret at least $qD/8$. With absorbing extension, $\beta(h)=q$ for $h<D$ and $0$ for $h\ge D$. For integer $H<D$,
$$
\Delta_L(H)=\delta_L(H)=q(D-H)/2,\qquad
\Delta_H(H)=\delta_H(H)=3q(D-H)/4.
$$
Known gaps: Class-level and finite-horizon only; singleton known-law versions have zero/O(1) regret by the oracle lemma. The one-block construction gives only $D B(D)$ under a tail envelope $B$, not matching power-tail upper rates.
Source: `iterations/iter_003/idea_02/explorer_01.md`; `iterations/iter_003/idea_02/critic_01_on_explorer_01.md`.

## Claim: One-block q-scaled hidden-terminal examples match power-tail upper rates
Status: refuted as stated
Confidence: high
Dependencies: Tail envelope interpretation for a horizon-indexed class, with $q\le B(D)$ for a nonincreasing finite-horizon or absorbing-extension tail envelope.
Evidence: The one-block lower bound is $\Omega(Dq)$. Under $B(h)=h^{-\alpha}$, choosing $q\le B(D)$ gives only $\Omega(D^{1-\alpha})$, which is below the truncation upper exponent $T^{(\alpha+1)/(2\alpha+1)}$ for $\alpha>0$ and does not even grow for $\alpha\ge1$.
Known gaps: Matching lower rates may require multi-scale hidden information, repeated blocks with limited information leakage, or a Fano/Le Cam construction that avoids iid block-splicing and one-reveal-learning failures.
Source: `iterations/iter_003/idea_02/explorer_01.md`; `iterations/iter_003/idea_02/critic_01_on_explorer_01.md`.

## Claim: Naive block-splicing of hidden-terminal worlds gives fixed-process asymptotic lower bound
Status: refuted
Confidence: medium-high
Dependencies: Uses regret against $\sup_a\mathbb E\sum_t r_t(a)$, not $\mathbb E[\sup_a\sum_t r_t(a)]$.
Evidence: If block types are iid, the expected fixed comparator may choose the same Bayes action available to the learner, erasing the per-block realized-best-action gap.
Known gaps: Super-growing deterministic or adversarial block constructions might still work, but need a new argument.
Source: idea_02 explorer and critique.

## Claim: Raw $\beta$ may fail because of rare histories while average truncation succeeds
Status: proven
Confidence: high for expected-regret/infinite-process raw-$\beta$ interpretation
Dependencies: Singleton public-exogenous infinite process; expected regret; raw $\beta(h)$ defined by essential sup over infinite-process histories; no high-probability guarantee claimed.
Evidence: Let $N\ge1$ have $\Pr(N=n)=3\cdot4^{-n}$, let $L_n=2^n$, and reveal the atom by $P_1=x_N$ for distinct $x_n\in(0,1/4)$. Then
$$
P_2=\cdots=P_{L_N+1}=0,\qquad P_{L_N+2}=1,
$$
and $P_t=0$ afterward. For every finite $h$, conditioning on $P_1=x_n$ with $2^n+1>h$ gives $\tau_1(1/2)=2^n+1$ with probability $1$, hence $\beta(h)=1$. But
$$
V_T=\sup_a\mathbb E\sum_{t\le T}r_t(a)
=\sum_{n:S_n\le T}3\cdot4^{-n}(S_n-1)\le4,
$$
where $S_n=2^n+2$, so zero quoting has bounded expected regret. Also, for integer $H$,
$$
\Delta_T(H)=\delta_T(H)
=\sum_{n:S_n\le T}3\cdot4^{-n}(S_n-1-H)_+
\le C/H.
$$
Known gaps: Pathwise regret on atom $N=n$ can be order $2^n$, so this does not address high-probability or adversarial-path regret. Finite-horizon definitions $\beta_T$ are trivially zero once $h\ge T$; state the example as an infinite-process/uniform raw-tail obstruction.
Source: `iterations/iter_007/idea_02/explorer_01.md`; `iterations/iter_007/idea_02/critic_01_on_explorer_01.md`; synthesis.

## Claim: Raw $\beta$ can fail because long delayed hits have tiny value
Status: proven
Confidence: high
Dependencies: Infinite deterministic exogenous process; raw infinite-process $\beta(h)=\sup_t\sup_a\Pr(h<\tau_t(a)<\infty\mid P_{1:t})$; regret against $\sup_a\sum_{t\le T}r_t(a)$.
Evidence: Let block $m$ consist of $L_m=2^m$ zeros followed by a spike $p_m=2^{-2m}$, and set $S_m=\sum_{j\le m}(L_j+1)$. For any $h$, choose $m$ with $L_m>h$, take $t=S_{m-1}+1$, and quote $a=p_m/2$. Deterministically $\tau_t(a)=L_m>h$, so $\beta(h)=1$. For any horizon $T$ and quote $a$, let $M=\max\{m:S_m\le T,\ p_m>a\}$, if nonempty. Since $p_m$ decreases strictly, only times $t<S_M$ can trade, and
$$
\sum_{t\le T}r_t(a)=a(S_M-1)<p_M(S_M-1)
=2^{-2M}(2^{M+1}+M-3)\le 1/2.
$$
If no such $M$ exists, the reward is zero. Thus $\sup_T\sup_a\sum_{t\le T}r_t(a)\le1/2$, and the zero-quote learner has $O(1)$ regret despite $\beta(h)\equiv1$. Iteration 7 strengthens the value-weighted estimate: for integer $H$,
$$
\sup_T\Delta_T(H)\le C/H.
$$
Indeed, for $a=0$ the loss is zero. For a fixed quote $a>0$, let $M$ be the last spike index with $p_M>a$. Lost $H$-truncated reward is at most
$$
a\sum_{j\le M}(L_j+1-H)_+
\le p_M\sum_{j\le M:L_j+1>H}(L_j+1)
\le C\,4^{-M}2^M\le C/H,
$$
with the case $L_M+1\le H$ giving zero.
Known gaps: This is an infinite-process/raw-$\beta$ obstruction. For finite-horizon $\beta_T$, tails are trivially zero once $h\ge T$; the right finite-horizon reading is that no uniform raw-delay tail is necessary. The example does not refute value-weighted truncation criteria; it satisfies a strong $\Delta$-tail bound.
Source: `iterations/iter_006/solver_attempt.md`; `iterations/iter_006/idea_02/explorer_01.md`; `iterations/iter_006/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_007/solver_attempt.md`; synthesis.

## Claim: Original private-randomized Borel policies reduce to public-prefix reward marginals
Status: proved under an explicit common Borel seed/state policy model; conditional for more primitive stochastic-kernel policy definitions
Confidence: medium-high for the seed/state model
Dependencies: Fixed finite $T$, finite grid $G$, public exogenous/action-independent prices, full observation of $P_{1:t}$ before $a_t$, a single common Borel policy rule on the whole standard Borel history space, iid private uniforms independent of $\theta$ and $P_{1:T}$, standard Borel internal state, and delayed trade feedback before $a_t$ that is a deterministic Borel function of public prices and past quotes. If policies are initially Borel stochastic kernels rather than seed maps, add the standard randomization lemma to realize them by jointly Borel maps and independent uniforms.
Evidence: Under these assumptions, a policy admits Borel maps
$$
a_t=\alpha_t(P_{1:t},U_{1:t})
$$
by induction on $t$, since all policy state, past actions, and delayed trade feedback are Borel functions of public prices and private seeds. Defining
$$
q_{t,a}(h)=\Pr_U(\alpha_t(h,U)=a)
$$
gives a Borel, law-independent prefix kernel with
$$
L_\theta(A)=\sum_{t,a}\int q_{t,a}(h)\,d\mu^\theta_{t,a}(h),
\qquad
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}].
$$
Only the one-time action marginals are needed because rewards are additive and actions do not affect future prices.
Iteration 12 made the model explicit with standard Borel internal states $Z_t$, Borel feedback maps $\Phi_t(P_{1:t},a_{1:t-1})$, and common Borel update maps $(a_t,Z_t)=\Psi_t(Z_{t-1},P_{1:t},a_{1:t-1},\Phi_t,U_t)$. The seed/prefix induction, section-integral theorem, and Fubini prove the displayed reward-coordinate equality. Conversely, every Borel finite-grid prefix kernel is implementable using fresh uniforms and cumulative intervals.
Known gaps: This is an original-policy alignment theorem only for the exact common Borel seed/state model. If policy primitives are stochastic kernels, the randomization lemma must be cited or proved. The theorem must treat algorithms as common Borel rules, not as law-by-law a.s. equivalence classes. It fails or changes for action-dependent prices, private/censored feedback not determined by public prices, law-correlated private randomness, inventory/budget/queue effects, or nonadditive rewards. It is reward-vector equivalence, not joint-law, pathwise, high-probability, or feedback-state equivalence.
Source: `iterations/iter_010/idea_01/explorer_01.md`; `iterations/iter_010/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_010/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_011/idea_02/explorer_01.md`; `iterations/iter_011/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_01/explorer_01.md`; `iterations/iter_012/idea_01/critic_01_on_explorer_01.md`.

## Claim: Density-form support equals the conditional $\Psi$ Bayes envelope
Status: proven for finite $F,G$
Confidence: high
Dependencies: Fixed finite $T$, finite nonempty quote grid $G$, finite $F\subset\Theta$, prior $\pi\in\Delta(F)$, public exogenous prices on standard Borel path spaces, regular conditional probabilities under the mixture law, and payoff-weighted domination $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$.
Evidence: For fixed $t$, let $m_t=\bar P_\pi\circ P_{1:t}^{-1}$ and
$$
\nu_{t,a}(B)=\sum_{\theta\in F}\pi_\theta\mu^\theta_{t,a}(B)
=\mathbb E_{\bar P_\pi}[\mathbf{1}\{P_{1:t}\in B\}a\mathbf{1}\{M_t>a\}].
$$
Then $d\nu_{t,a}/d\lambda_t=\sum_\theta\pi_\theta f^\theta_{t,a}$, while $d\nu_{t,a}/dm_t$ is a version of
$$
a\,\bar P_\pi(M_t>a\mid P_{1:t}=h).
$$
For any finite family of finite measures $(\nu_a)_{a\in G}$, the functional
$$
S(\rho)=\int \max_{a\in G}\frac{d\nu_a}{d\rho}\,d\rho
$$
is independent of the chosen common dominating measure $\rho$: compare two choices through $\eta=\rho+\rho'$, use $u_a=d\nu_a/d\eta$, $r=d\rho/d\eta$, and the Radon-Nikodym chain rule. Evaluating $S$ with $\lambda_t$ gives the density support formula, and evaluating with $m_t$ gives
$$
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
Known gaps: This identifies only the Bayes reward/support term in the no-gap proof. It does not prove product compactness, original-policy alignment, continuum selectors, arbitrary infinite priors, or scalar tail characterization. Finite $G$ is essential for the simple maximum/measurability argument.
Source: `iterations/iter_009/idea_01/explorer_01.md`; `iterations/iter_009/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/solver_attempt.md`; `iterations/iter_012/idea_02/explorer_01.md`; `iterations/iter_012/idea_02/critic_01_on_explorer_01.md`.

## Claim: Completed finite-grid $L^\infty$ prefix kernels have Borel reward-preserving implementations
Status: proved conditional on the standard Borel-version theorem
Confidence: medium-high
Dependencies: Fixed finite $T$, finite grid $G$, standard Borel prefix spaces $X_t=[0,1]^t$, sigma-finite Borel measures $\lambda_t$, and payoff-weighted domination $\mu^\theta_{t,a}\ll\lambda_t$ for every $\theta,t,a$.
Evidence: If $q_t\in L^\infty(\lambda_t;\Delta(G))$ has a completed-measurable representative that is simplex-valued $\lambda_t$-a.e., take Borel coordinate versions $b_{t,a}$. The bad set where some coordinate leaves $[0,1]$ or the coordinates do not sum to $1$ is Borel and $\lambda_t$-null; redefine there to a fixed vertex of $\Delta(G)$. The resulting Borel kernel $\tilde q_t:X_t\to\Delta(G)$ equals $q_t$ $\lambda_t$-a.e. Since each $\mu^\theta_{t,a}\ll\lambda_t$,
$$
\sum_{t,a}\int \tilde q_{t,a}\,d\mu^\theta_{t,a}
=\sum_{t,a}\int q_{t,a}\,d\mu^\theta_{t,a}
$$
simultaneously for all $\theta$. A finite-grid Borel kernel is implementable using fresh uniforms and cumulative probability intervals.
Known gaps: The completed-measurable-to-Borel-version fact should be cited or proved in the final write-up. This preserves expected payoff coordinates only; if prefix laws are singular to $\lambda_t$, Borelization may change behavior on histories with positive prefix-law mass but zero payoff-weighted mass. The result is finite-grid/standard-Borel only; continuum kernels need extra selector work.
Source: `iterations/iter_010/idea_02/explorer_01.md`; `iterations/iter_010/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_010/idea_01/critic_01_on_explorer_01.md`.

## Claim: Iteration 10 closes the original Borel-policy domination theorem
Status: not accepted as a completed theorem
Confidence: high
Dependencies: Would require both the forward policy-to-prefix reduction and reverse Borel implementation lemmas, plus weak-* compactness/closedness and a single policy class used throughout.
Evidence: Iteration 10 made both alignment directions much more plausible and isolated the exact assumptions. Critics still flagged missing proof obligations: exact policy definition, seed/prefix induction, completed-measurable Borel representatives, weak-* feasibility of simplex constraints, and consistency of policy classes in finite-subclass and full-class values.
Known gaps: Iteration 12 supplies the forward alignment lemma under an exact common Borel seed/state model and supplies the density-$\Psi$ identification. The reverse completed-kernel-to-Borel implementation is now recorded as a separate lemma conditional on the standard Borel-version theorem, but the full original Borel-policy domination theorem still needs those standard measurable-version/randomization facts cited or proved, weak-* feasibility details written cleanly, and one policy class used consistently for finite-subclass and full-class values.
Source: `iterations/iter_010/solver_attempt.md`; `iterations/iter_010/idea_01/explorer_01.md`; `iterations/iter_010/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_010/idea_02/explorer_01.md`; `iterations/iter_010/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_01/explorer_01.md`; `iterations/iter_012/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_02/explorer_01.md`; `iterations/iter_012/idea_02/critic_01_on_explorer_01.md`.

## Claim: Per-world delay/truncation profiles do not characterize unknown-class minimax learnability
Status: proven under the stated public-exogenous protocol
Confidence: high
Dependencies: Finite horizon $T=D+1$; two-world unknown class; no quote before $P_1$; $P_t$ is observed before $a_t$; trades use only future prices $P_s$ with $s>t$; public exogenous prices; regret is against the best fixed quote in the active world; per-world profiles mean quantities such as $\beta_\theta,\Delta_\theta,\delta_\theta,V_\theta$ computed law by law, not posterior/predictability objects.
Evidence: Let
$$
Y_L\sim(1-q)\delta_0+q\,{\rm Unif}[1/2,5/8],\qquad
Y_H\sim(1-q)\delta_0+q\,{\rm Unif}[3/4,7/8].
$$
Hidden class:
$$
P_1=c,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta.
$$
Labeled class:
$$
P_1=\ell_\theta,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta,\qquad \ell_L\ne\ell_H.
$$
For each fixed world $\theta$, the future process after every legal decision time is identical in the hidden and labeled versions, so all legal quote reward, delay, truncation, and comparator profiles coincide. With absorbing post-horizon prices, $\beta_\theta(h)=q$ for $h<D$ and $0$ for $h\ge D$. For integer $0\le H<D$,
$$
\Delta_L(H)=\delta_L(H)=q(D-H)/2,\qquad
\Delta_H(H)=\delta_H(H)=3q(D-H)/4.
$$
However, the hidden worlds are observationally identical until the terminal reveal, so the accepted q-scaled hidden-terminal Bayes-gap argument gives minimax regret at least $qD/8$. In the labeled class, $P_1$ identifies $\theta$ before the first payoff-relevant quote, so the learner can play $1/2$ in world $L$ and $3/4$ in world $H$, matching the continuum fixed comparator. On a grid containing these two quotes, grid regret is zero; on arbitrary $K$-grids, use the standard $O(T/K)$ discretization loss.
Known gaps: This refutes only criteria depending on individual-law tail/truncation profiles or their envelopes/multisets. It does not refute conditions that encode public-prefix observability, posterior predictability, Bayes gaps, or the full statistical experiment. If the model allowed a pre-$P_1$ quote or same-period trade against $P_1$, the label could affect rewards/delays and the construction would need adjustment.
Source: `iterations/iter_011/solver_attempt.md`; `iterations/iter_011/idea_01/explorer_01.md`; `iterations/iter_011/idea_01/critic_01_on_explorer_01.md`.

## Claim: Tail-adaptive truncation reduces to comparator-specific heterogeneous-delay experts
Status: plausible conditional reduction
Confidence: medium
Dependencies: Public exogenous prices; finite grid $G_K$; dyadic truncation windows $\mathcal H\subset\{1,\ldots,T\}$, including a ceiling window; surrogate rewards
$$
y_t(H,b)=r_t^H(b)=b\mathbf{1}\{\max_{t<s\le \min(t+H,T)}P_s>b\}
$$
are available after delay at most $H$; an abstract delayed full-information algorithm over arms $(H,b)$ has regret to each fixed arm bounded by $B_T(H)$.
Evidence: If such an expert oracle exists, the learner posts the quote $b_t$ from its chosen arm $(H_t,b_t)$. True reward dominates surrogate reward pathwise:
$$
r_t(b_t)\ge r_t^{H_t}(b_t)=y_t(H_t,b_t).
$$
For a fixed $H$, compare to the best $H$-truncated grid quote $b_H$. Expert regret gives surrogate reward within $B_T(H)$ of $\sum_t r_t^H(b_H)$, while grid rounding and comparator-gap truncation give
$$
V_T^P\le \mathbb E_P\sum_t r_t^H(b_H)+\delta_T^P(H)+T/K.
$$
Thus
$$
R_T^P\le T/K+\min_{H\in\mathcal H}\{\delta_T^P(H)+B_T(H)\}.
$$
Dyadic windows lose only constants because $\delta_T^P(H)$ is nonincreasing.
Known gaps: The required heterogeneous-delay expert theorem is not proved. Iteration 14 reduces the two-arm fast/slow test to a delayed advantage game, but still gives no proof of the needed bounds and no many-arm theorem. Standard delayed-Hedge tools in the notes give either a fixed-$H$ residue bound or a max-delay/total-delay bound, which would pay the largest candidate $H$ and destroy adaptation. The phrase "best $H$ in hindsight" should mean an oracle analysis choice, not a realized-path hindsight comparator unless separately proved.
Source: `iterations/iter_013/idea_02/explorer_01.md`; `iterations/iter_013/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_014/idea_01/explorer_01.md`; `iterations/iter_014/idea_01/critic_01_on_explorer_01.md`.

## Claim: Comparator-specific heterogeneous-delay experts bound
Status: conjecture
Confidence: low-medium
Dependencies: Abstract full-information experts with arm-dependent delays $d_i$, simultaneous feedback for all arms' reward components, and regret measured against a fixed comparator arm $i$.
Evidence: Iteration 13 isolated the exact needed inequality:
$$
\sum_t y_t(i)-\mathbb E\sum_t y_t(i_t)
\stackrel{?}{\lesssim}
\sqrt{T(d_i+1)\log N}
$$
for every arm $i$, rather than a bound involving $d_{\max}$. Arm-specific learning rates or delayed FTRL/Hedge with stale-reward corrections are candidate algorithms.
Known gaps: No proof is available. Iteration 14 shows the two-expert fast-vs-slow case is equivalent to maintaining two lower bounds on delayed advantage $A_T$, but the safety/capture tradeoff is precisely the missing theorem. Existing accepted $H+1$-residue Hedge only covers a common fixed delay bound and cannot be cited for this claim.
Source: `iterations/iter_013/idea_02/explorer_01.md`; `iterations/iter_013/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_014/idea_01/explorer_01.md`; `iterations/iter_014/idea_01/critic_01_on_explorer_01.md`.

## Claim: Last-exceedance identity for fixed-quote rewards
Status: proven
Confidence: high
Dependencies: Finite horizon $T$; public price path fixed; reward $r_t(a)=a\mathbf{1}\{\exists s\in\{t+1,\ldots,T\}:P_s>a\}$.
Evidence: Define
$$
L_a=\max\{s\le T:P_s>a\},
$$
with $L_a=0$ if the set is empty. Then a quote $a$ posted at time $t$ trades by horizon $T$ iff $L_a>t$, so
$$
r_t(a)=a\mathbf{1}\{L_a>t\},\qquad
\sum_{t=1}^T r_t(a)=a(L_a-1)_+.
$$
Known gaps: This is an algebraic identity, not a learnability characterization. It suggests last-passage/value-tail language but does not by itself handle predictability, unknown classes, or learner regret.
Source: `iterations/iter_014/solver_attempt.md`.

## Claim: Two-arm fast/slow delay test reduces to delayed advantage control
Status: proven as a reduction; target bound remains conjectural
Confidence: high for the algebraic reduction, low-medium for the desired theorem
Dependencies: Full-information two-arm rewards $f_t,s_t\in[0,1]$; fast arm has immediate feedback, slow arm has delay $D$; learner plays slow with probability $q_t$; expected regret against always-fast and always-slow.
Evidence: Let
$$
\Delta_t=s_t-f_t,\qquad S_T=\sum_t\Delta_t,\qquad A_T=\sum_t q_t\Delta_t.
$$
The learner's reward relative to always-fast is $A_T$, and always-slow exceeds always-fast by $S_T$. Hence
$$
R_F=-A_T,\qquad R_S=S_T-A_T.
$$
Thus the desired simultaneous bounds reduce to
$$
A_T\ge -B_F,\qquad A_T\ge S_T-B_S,
$$
with $B_F$ on the order of $\sqrt T$ and $B_S$ on the order of $\sqrt{TD}$.
Known gaps: The full algorithm achieving these inequalities is unproved. Iteration 15 proves a solvency invariant for the fast-safety half $A_T\ge-B$, but slow capture remains open. The naive safe-clipped delayed-Hedge rule fails by budget depletion, so any viable wealth/coin-betting wrapper needs a reserve or a different potential. A two-arm proof also would not automatically imply the many-arm dyadic-window theorem needed for adaptive truncation.
Source: `iterations/iter_014/idea_01/explorer_01.md`; `iterations/iter_014/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Claim: Nested-window structure gives a refined adaptive-truncation target
Status: weakened; horizon-censored structure is valid, but the strong simultaneous expected oracle is refuted
Confidence: high for the structure, low for the oracle route
Dependencies: Public exogenous prices; finite grid $G$; dyadic windows $0=H_0<\cdots<H_M=T$; horizon-censored truncated rewards $g_t^m(b)=r_t^{H_m}(b)$; comparator values must be either consistently pathwise or consistently expected.
Evidence: The pathwise increment decomposition
$$
z_t^m(b)=g_t^m(b)-g_t^{m-1}(b)
=b\mathbf{1}\{H_{m-1}<\tau_t(b)\le H_m,\ \tau_t(b)\le T-t\}
$$
is valid. A possible oracle target is an expected-value inequality of the form
$$
V_m^G-\mathbb E L^m(A)
\le B_m+c(V_M^G-V_m^G),
$$
which would make short-window regret chargeable to the value gained by longer windows and could imply an adaptive bound involving $\delta_T^P(H_m)$.
Known gaps: No algorithm proves an adaptive nested-window bound. The explorer initially mixed pathwise $V_m^G(\omega)$ with expected $\delta_T^P(H)$; the critique notes that $\mathbb E[V_M(\omega)-V_m(\omega)]$ can be much larger than the expected comparator gap. Iteration 15 then refutes the strong simultaneous expected oracle
$$
V_m^G-\mathbb E L^m(A)\le B_m+c(V_M^G-V_m^G)
$$
for finite-grid two-window market paths with standard budgets. A weaker min-over-window guarantee or a different charge remains possible but unproved.
Source: `iterations/iter_014/idea_02/explorer_01.md`; `iterations/iter_014/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_015/idea_02/explorer_01.md`; `iterations/iter_015/idea_02/critic_01_on_explorer_01.md`.

## Claim: Naive multi-scale repetition of q-scaled terminal atoms matches power-tail lower rates
Status: refuted for the standard toy repetitions; open for limited-leakage constructions
Confidence: medium-high for the refutations of the naive routes
Dependencies: Power-tail lower-bound goal for unknown public-exogenous classes; q-scaled hidden-terminal atom; regret against one best fixed quote, not a blockwise oracle.
Evidence: Iteration 13 identified three severe obstructions. First, if all blocks share one hidden type and any nonzero terminal event fully reveals it, then useful hidden-prefix contribution is plausibly bounded by
$$
\sum_j D_jq_j\exp\left(-\sum_{k<j}q_k\right),
$$
which is $O(D)$ for equal $D,q$, not $NqD$. Second, with independent hidden bits in an ideal two-quote additive model, a single fixed comparator gains only
$$
\mathbb E\left|\sum_j w_j\sigma_j\right|\lesssim\left(\sum_jw_j^2\right)^{1/2},
$$
so equal blocks give fluctuation size $w\sqrt N$, not $\sum_jw_j$. Third, in the actual market protocol, old quotes persist and can trade on later spikes; repeated same-level atoms can make $\Pr(D<\tau<\infty)$ close to one when $Nq\gg1$, violating a desired envelope $B(D)\approx q$.
Known gaps: These do not rule out noisy common-parameter, multi-hypothesis, codebook, or limited-leakage constructions. The key unproved heuristic is an information-gap tradeoff such as $\kappa\gtrsim\gamma^2/q$ when a revenue separation $\gamma$ is carried by a $q$-mass tail event.
Source: `iterations/iter_013/idea_01/explorer_01.md`; `iterations/iter_013/idea_01/critic_01_on_explorer_01.md`.

## Claim: Solvency invariant gives fast-comparator safety in the delayed advantage game
Status: proven under delayed full-information advantage feedback
Confidence: high
Dependencies: Two-arm fast/slow advantage abstraction; $\Delta_t=s_t-f_t\in[-1,1]$; slow-play probabilities $q_t\in[0,1]$ are predictable from feedback available before round $t$; $\Delta_u$ is revealed after delay $D$ whether or not slow was played. Define
$$
O_t=\sum_{u\le t-D}q_u\Delta_u,\qquad
P_t=\sum_{t-D<u<t}q_u,\qquad C_t=B+O_t-P_t .
$$
Evidence: If the learner enforces $q_t\le [C_t]_+$ before adding new exposure, then $C_t\ge0$ is an invariant. Revealing a pending term $u$ changes capacity by $q_u(\Delta_u+1)\ge0$, and adding $q_t\le C_t$ keeps capacity nonnegative. At the end,
$$
A_T=\sum_tq_t\Delta_t
=O_{\rm end}+\sum_{\rm pending}q_u\Delta_u
\ge O_{\rm end}-P_{\rm end}\ge -B.
$$
Thus fast regret $R_F=-A_T\le B$.
Known gaps: This only proves fast-side safety. It does not prove the slow-capture inequality $A_T\ge S_T-\tilde O(\sqrt{TD})$, and it is a statement about expected action marginals/probabilities rather than realized Bernoulli action paths unless the exposure process is redefined.
Source: `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Claim: Safe-clipped delayed Hedge proves the two-arm delayed advantage theorem
Status: refuted for the naive clipping rule
Confidence: high for the refutation of this algorithm sketch
Dependencies: Delayed full-information advantage abstraction; proposal $p_t$ based on observed delayed advantages; solvency capacity $C_t=B+O_t-P_t$; clipped play $q_t=\min\{p_t,C_t,1\}$.
Evidence: The budget-depletion stress test sets $p_t=1/2$ before any feedback, $D>2B$,
$$
\Delta_1=\cdots=\Delta_{2B}=-1,\qquad
\Delta_{2B+1}=\cdots=\Delta_T=+1.
$$
The clipped rule spends $q_t=1/2$ for $2B$ rounds, driving capacity to zero. Later negative reveals add $q_t(\Delta_t+1)=0$, so capacity remains zero; because unplayed positive advantages do not enter $O_t$, the learner can stay at $q_t=0$ despite later positive evidence. Then $A_T=-B$ but $S_T-A_T$ is linear in $T$.
Known gaps: This refutes the exact clipping sketch, not all solvency/wealth-style algorithms and not the desired two-arm theorem. Fractional reserve rules or direct wealth potentials remain candidates.
Source: `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Claim: Simultaneous expected nested-window oracle with value-gap charge
Status: refuted for finite-grid two-window market paths with standard budgets
Confidence: medium-high
Dependencies: Deterministic public-exogenous market path; finite grid $G=\{\ell,h\}$, $h=\ell+d<1$; windows $H_1=1,H_2=D$; expected comparator values $V_m^G$; oracle form
$$
V_m^G-\mathbb E L^m(A)\le B_m+c(V_2^G-V_m^G)
$$
required simultaneously for $m=1,2$, with $B_1=O(\sqrt T)$ and $B_2=O(\sqrt{TD})$.
Evidence: Let $T=ND+1$. Put high spikes above $h$ at times $jD+1$, $j=0,\ldots,N$, and medium prices $m\in(\ell,h)$ at all other times. On active rounds $1,\ldots,ND$, the low quote earns short-window reward $\ell$ every round; the high quote earns short-window reward only immediately before the $N$ high spikes; and the high quote earns long-window reward $h$ every active round. If $\ell D\ge h$, then
$$
V_1^G=\ell ND,\qquad V_2^G=hND,\qquad V_2^G-V_1^G=dND.
$$
If $M$ is the expected number of high quotes, long-window regret is $d(ND-M)$, so $V_2^G-\mathbb E L^2\le B_2$ forces $M\ge ND-B_2/d$. Since at most $N$ high quotes get short-window reward,
$$
V_1^G-\mathbb E L^1\ge \ell M-hN
\ge \ell ND-\ell B_2/d-hN.
$$
For fixed $c$, choose $d\ll \ell/c$, then $D\gg h/\ell$, then $N\gg d^{-2}$; with standard budgets the last display exceeds $B_1+c\,dND$, contradicting the oracle.
Known gaps: This refutes the strong simultaneous expected oracle, not all adaptive-truncation algorithms and not the one-level heterogeneous-delay reduction. The construction is finite-grid; continuum consequences require a separate threshold/spike audit.
Source: `iterations/iter_015/idea_02/explorer_01.md`; `iterations/iter_015/idea_02/critic_01_on_explorer_01.md`.

## Claim: Iteration 16 finite/no-gap Bayes package solves the original problem
Status: not accepted as a completed solution
Confidence: high
Dependencies: The solver attempt restated the finite-class finite-grid minimax/Bayes identity, grid-to-continuum positive-part comparison, product-closure no-gap extension, payoff-measure dominated completed-kernel theorem, and $\delta_T(H)$ upper bound.
Evidence: Both solution critics and the solution gate rejected the stop claim. The package is valid partial progress under public, exogenous, action-independent prices; known horizon and class; randomized measurable policies; finite grids; finite $\Theta_T$ for the exact $\Psi_G$ identity; and no-gap/product-closure or payoff-measure domination for infinite classes. It does not give an arbitrary infinite-class theorem, scalar tail iff, or matching power-tail lower rates. The displayed power-tail formula from $\delta_T(H)\lesssim T H^{-\alpha}$ is only an upper bound.
Known gaps: A final theorem package must explicitly use $M_t=\max_{t<s\le T}P_s$, keep learner actions/comparator/Bayes envelope on the same finite grid, state the signed minimax versus positive-part learnability convention, and keep continuum quotes behind the $T/K$ comparison.
Source: `iterations/iter_016/solver_attempt.md`; `iterations/iter_016/solution_critic_01.md`; `iterations/iter_016/solution_critic_02.md`; `iterations/iter_016/solution_gate.md`.

## Claim: The finite/no-gap Bayes package is a valid referee-style partial theorem package
Status: accepted under narrow assumptions
Confidence: high for finite classes and completed-kernel no-gap; medium for original Borel-policy upgrade
Dependencies: Fixed finite $T$; horizon-censored $M_t=\max_{t<s\le T}P_s$; public exogenous prices; finite quote grid $G$; randomized measurable policies with independent private randomness; finite $\Theta$ for exact finite-grid minimax/Bayes identity; product-closed attainable reward set or completed $L^\infty(\lambda_t;\Delta(G))$ payoff-measure dominated prefix kernels for infinite no-gap.
Evidence: Iteration 16 explorer 1 gives a proof order that matches accepted lemmas: finite reward-set minimax plus Bayes myopic optimality; two-sided grid-to-continuum minimax comparison; finite-subclass product-closure formula; payoff-weighted domination compactness for completed prefix kernels. The critic found no fatal flaw under these assumptions, only missing theorem hygiene and scope guards.
Known gaps: This remains a value/predictability characterization, not a scalar tail theorem. The original Borel-policy version requires the exact common Borel seed/state policy model, forward seed/prefix induction, completed-measurable-to-Borel versions, finite-action randomization, and weak-* closed simplex constraints.
Source: `iterations/iter_016/idea_01/explorer_01.md`; `iterations/iter_016/idea_01/critic_01_on_explorer_01.md`.

## Claim: Payoff-measure dominated original Borel-policy no-gap theorem is closed by the current bridge sketches
Status: not accepted as closed; credible conditional theorem target
Confidence: medium-high for the reward-coordinate bridge under the exact model; medium as a fully written theorem
Dependencies: Common Borel finite-grid seed/state policies, independent private randomness, standard Borel prefix spaces, sigma-finite Borel $\lambda_t$, payoff-measure domination $\mu^\theta_{t,a}\ll\lambda_t$, and additive public-exogenous rewards.
Evidence: Iteration 16 explorer 2 sketches the desired equality of reward-vector sets
$$
C_{\rm Borel}=C_{L^\infty},
$$
where $C_{\rm Borel}$ is generated by common Borel policies and $C_{L^\infty}$ by completed prefix kernels. The critic agrees the bridge is plausible but not written: the forward inclusion needs a seed/state induction $a_t=\alpha_t(P_{1:t},U_{1:t})$ and Borel section-integral proof for $q_{t,a}$; the reverse inclusion needs completed-measurable-to-Borel versions and finite-grid implementation with independent uniforms. Weak-* compactness also needs the exact $L^\infty=(L^1)^*$ setup and closed simplex constraints.
Iteration 20 sharpens this into a clean two-inclusion target. Forward: common Borel seed/state policies induce Borel public-prefix marginals $q_{t,a}(h)=\Pr_U(\alpha_t(h,U_{1:t})=a)$ preserving reward coordinates by Fubini. Reverse: every $q_t\in L^\infty(\lambda_t;\Delta(G))$ has a Borel simplex-valued representative equal $\lambda_t$-a.e.; finite-action uniforms implement it; payoff domination $\mu^\theta_{t,a}\ll\lambda_t$ preserves all integrals.
Iteration 21's explorer and critic find no fatal counterexample to this bridge under the narrow model, but keep it incomplete until the final proof cites or proves completed-measurable-to-Borel versions, Borel section-integral measurability, finite-action randomization, $L^\infty=(L^1)^*$, and weak-* closed simplex constraints.
Known gaps: The bridge is still not referee-ready until the exact common Borel policy model is written and the standard facts are cited or proved: completed-measurable-to-Borel versions on standard Borel spaces, Borel section integrals, finite-action randomization, and weak-* closed simplex constraints. It preserves only expected additive reward coordinates, not behavior, pathwise guarantees, joint action laws, feedback-state laws, or high-probability statements. It fails or changes for law-by-law a.s. policy representatives, private side information, law-correlated seeds, action-dependent prices, nonadditive rewards, and continuum quotes without discretization.
Source: `iterations/iter_016/idea_02/explorer_01.md`; `iterations/iter_016/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_020/idea_02/explorer_01.md`; `iterations/iter_020/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_021/idea_01/explorer_01.md`; `iterations/iter_021/idea_01/critic_01_on_explorer_01.md`.

## Claim: Payoff-weighted reward-measure domination is necessary for infinite-class no-gap
Status: not established; only sufficient for the current compactness proof
Confidence: high
Dependencies: Fixed finite grid public-exogenous no-gap problem.
Evidence: Iteration 16 critic 1 emphasized that payoff-weighted domination is "right" only for the current weak-* compactness proof. Identifiable nondominated classes can be easy by public decoding, so domination cannot be treated as necessary for learnability or no-gap without further hypotheses.
Known gaps: Natural no-gap hypotheses beyond domination remain open: identifiable Borel classes, dominated approximations with constants, compact statistical experiments, and Borel nondominated non-identifiable obstruction searches.
Source: `iterations/iter_016/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_016/promising_ideas.json`.

## Claim: Finitely additive dual gives the exact arbitrary-class finite-grid signed value
Status: accepted as an abstract reward-vector duality theorem
Confidence: high as an abstract convex reward-set theorem once standard functional-analysis facts are cited
Dependencies: Fixed finite horizon $T$; fixed finite nonempty quote grid $G$; public exogenous prices only insofar as they define bounded reward coordinates; randomized admissible policies allowing ex-ante private mixing, so
$$
C=\{L(A):A\text{ admissible randomized }G\text{-policy}\}\subset[0,T]^\Theta\subset\ell^\infty(\Theta)
$$
is nonempty, bounded, and convex. The theorem uses real $\ell^\infty(\Theta)$ and the norm dual $\ell^\infty(\Theta)^*=ba(\Theta)$, i.e. positive finitely additive probabilities on all subsets of $\Theta$, unless a measurable-space version is explicitly specified.
Evidence: With $V=V^G$, the signed grid value is
$$
\mathcal R_G(\Theta)=\inf_{c\in C}\sup_{\theta\in\Theta}(V_\theta-c_\theta).
$$
Iteration 19's explorer and critics find no fatal flaw in the Hahn-Banach/Sion route proving
$$
\mathcal R_G(\Theta)
=
\sup_{\nu\in ba_1^+(\Theta)}
\left\{\langle V,\nu\rangle-\sup_{c\in C}\langle c,\nu\rangle\right\}.
$$
Iteration 20 endorses the separation proof as the safest referee route. Use $S=C-X_+$. For $\alpha<\mathcal R_G$, prove
$$
V-\alpha\mathbf{1}\notin\overline S^{\|\cdot\|_\infty};
$$
otherwise a uniform approximation by $c-x$, $x\ge0$, would imply $\sup_\theta(V_\theta-c_\theta)\le\alpha+o(1)$. Strong norm separation yields nonzero $\phi\in(\ell^\infty)^*$. Downward closedness of $S$ forces $\phi\ge0$, since $\phi(x)<0$ for some $x\ge0$ would make $\sup_{s\in S}\phi(s)=+\infty$. Normalize by $\phi(\mathbf{1})>0$ to obtain $\nu\in ba_1^+$, giving dual value $>\alpha$, then let $\alpha\uparrow\mathcal R_G$. The optional Sion proof is shorter but requires more topological care because $C$ need not be compact.
Iteration 21 re-audits the proof and leaves the claim accepted under the same assumptions. The essential scope guards are convexity of $C$, supplied by ex-ante randomized common policies; fixed finite $G$; and treating $\sup_{c\in C}\langle c,\nu\rangle$ as an abstract support function, not a posterior-predictive Bayes term.
Known gaps: The theorem is exact but abstract. It gives an infimum/value identity, not policy attainment; approximate policies exist only from the infimum definition unless extra compactness/attainment is imposed. It depends on randomized-policy convexity and a fixed finite grid; deterministic-policy values and continuum quotes require separate work. The final write-up should cite or prove the $ba$ dual representation/Yosida-Hewitt fact, positive functional facts, and strong Hahn-Banach separation.
Source: `iterations/iter_019/solver_attempt.md`; `iterations/iter_019/idea_01/explorer_01.md`; `iterations/iter_019/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_019/idea_02/explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_020/idea_01/explorer_01.md`; `iterations/iter_020/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_021/idea_02/explorer_01.md`; `iterations/iter_021/idea_02/critic_01_on_explorer_01.md`.

## Claim: The iteration 20 $\mathrm{ba}$-dual value condition solves the original problem
Status: not accepted as a completed solution
Confidence: high
Dependencies: The attempted solution states the exact finite-grid $\mathrm{ba}$ dual plus grid-to-continuum comparison under public exogenous finite-horizon assumptions.
Evidence: The solution gate and both critics reject the stop claim. The condition
$$
\left[
\sup_{\nu\in ba_1^+(\Theta_T)}
\{\langle V^{G_T},\nu\rangle-\sup_{c\in C_T^{G_T}}\langle c,\nu\rangle\}
\right]_+=o(T)
$$
is just $(\mathcal R_T^{G_T})_+=o(T)$ written in dual form. This is a valid abstract value characterization only after the $\mathrm{ba}$ theorem is proved; it is not a structural tail condition, not an ordinary posterior-predictive Bayes formula, and not a matching regret-rate theorem.
Known gaps: No scalar tail iff, no matching lower rate for power-tail or truncation-tail classes, no action-dependent or anytime theorem, and no fully written original Borel-policy no-gap bridge. The admissible policy class remains central because the dual applies to whatever reward set $C$ that class generates.
Source: `iterations/iter_020/solver_attempt.md`; `iterations/iter_020/solution_critic_01.md`; `iterations/iter_020/solution_critic_02.md`; `iterations/iter_020/solution_gate.md`.

## Claim: The finitely additive dual is an ordinary Bayes/posterior characterization
Status: refuted / not supported
Confidence: high
Dependencies: Any attempt to replace $\sup_{c\in C}\langle c,\nu\rangle$ by a posterior-predictive $\Psi_G(\nu)$ term for arbitrary finitely additive $\nu$.
Evidence: The iteration 19 critiques emphasize that a finitely additive prior on $\Theta$ need not induce a countably additive mixture law on price paths, regular conditional probabilities, or a myopic Bayes reward envelope. The only accepted support term is the abstract reward-set support function
$$
\sigma_C(\nu)=\sup_{c\in C}\langle c,\nu\rangle.
$$
For ordinary finite priors on finite $F$, the accepted conditional $\Psi_{G,F}$ formula still applies. For arbitrary $ba$ priors it does not.
Known gaps: One could develop a separate finitely additive conditional-expectation theory, but that is not in the current proof and would still not be a scalar tail characterization.
Source: `iterations/iter_019/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`.

## Claim: Finite priors and $\mathrm{ba}$ priors coincide for arbitrary infinite classes
Status: false without no-gap/product-closure assumptions
Confidence: high
Dependencies: Fixed finite-grid reward-set formulation with convex $C\subset[0,T]^\Theta$.
Evidence: Iteration 19 maps the objects as follows. Finite-support priors give
$$
D_{\rm fin}
=\sup_{F\Subset\Theta}\mathcal R_G(F)
=\inf_{c\in\overline C^{pt}}\sup_\theta(V_\theta-c_\theta),
$$
the accepted product-closure relaxed value. Finitely additive priors give
$$
D_{ba}=\mathcal R_G(\Theta),
$$
the true norm-dual full-class value. Hence $D_{\rm fin}\le D_{ba}$, with equality under product closedness/no-gap, e.g. in the completed-kernel payoff-measure dominated setting.
Known gaps: Equality is value-level only; no-gap means finite priors approximate the optimal value, not that a particular $ba$ witness has ordinary-prior approximants. For original Borel policies, the policy-class alignment problem still determines which reward set $C$ is being dualized.
Source: `iterations/iter_019/idea_02/explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`.

## Claim: No-restart fractional solvency rules solve the two-arm delayed-advantage problem
Status: refuted for the natural single-account rule
Confidence: high for the displayed rule; low for broader impossibility
Dependencies: Two-arm delayed-advantage abstraction with delayed full-information advantages; $D=1$; capital $C_t$ equal to the solvency margin; play rule $q_t=C_t/2$ while $C_t\in[0,1]$, with the usual capacity update from played realized advantage.
Evidence: On a prefix of $N$ rounds with $\Delta_t=-1$, the rule halves its capital each round, leaving $C\approx B2^{-N}$. On a following positive suffix with $\Delta_t=+1$, the same rule grows capital only by a factor $3/2$ per round, so it needs $\Theta(N)$ positive rounds before reaching substantial exposure. A sequence of $N$ negatives followed by $2N$ positives therefore causes $\Omega(N)$ slow regret even when $D=1$, violating the desired $\tilde O(\sqrt T)$ slow-regret scale.
Known gaps: This refutes only single-account no-restart fractional-capital rules of this type. It does not refute the two-arm delayed-advantage theorem. Interval/restart testers or other wealth potentials remain plausible but unproved, and any aggregation must respect total exposure $q_t\le1$.
Source: `iterations/iter_022/idea_01/explorer_01.md`; `iterations/iter_022/idea_01/critic_01_on_explorer_01.md`.

## Claim: Block-local limited-leakage common-type models can accumulate Bayes gap
Status: proved for the abstract block-local finite-grid model under explicit assumptions
Confidence: medium-high for the abstraction
Dependencies: Two hidden types $\theta\in\{+,-\}$ with equal prior; two fixed quotes $H,L$; each of $N$ blocks has $D$ decisions whose correct quote beats the wrong quote by exactly $\gamma$; block observations $Z_j\sim Q_\theta$ arrive only after the block and are conditionally iid; the learner's posterior after $j$ observations is $p_j=\Pr(\theta=+\mid Z_{1:j})$.
Evidence: In a block with posterior $p$, the gap between the posterior average of world-specific optima and the best posterior-mixture quote is $\gamma\min(p,1-p)$. Hence the block-local Bayes value is
$$
\Psi_{\rm loc}=D\gamma\sum_{j=0}^{N-1}\mathbb E_{\bar Q}\min(p_j,1-p_j).
$$
Under the equal-prior mixture,
$$
\mathbb E_{\bar Q}\min(p_j,1-p_j)
=\frac12\left(1-\operatorname{TV}(Q_+^j,Q_-^j)\right).
$$
If per-block KL leakage is at most $\kappa$, Pinsker gives $\operatorname{TV}(Q_+^j,Q_-^j)\le\sqrt{j\kappa/2}$, yielding
$$
\Psi_{\rm loc}\gtrsim D\gamma\min\{N,1/\kappa\}
$$
up to constants.
Known gaps: This is not yet a delayed-market lower bound. The model assumes block-local rewards and no persistent quote coupling across blocks. KL direction and absolute-continuity assumptions should be written if used in a proof.
Source: `iterations/iter_022/idea_02/explorer_01.md`; `iterations/iter_022/idea_02/critic_01_on_explorer_01.md`.

## Claim: Limited-leakage block-local lower bounds transfer directly to same-level delayed-market blocks
Status: refuted / not established
Confidence: high that the direct transfer fails
Dependencies: Actual delayed-market protocol with persistent quotes; repeated same-level terminal-price blocks; fixed quote intended to accumulate across blocks; desired tail/truncation envelope of order $q$.
Evidence: In the market, a quote posted in block $j$ can trade on any later terminal price, not only on the current block's terminal price. If $r_{\theta,a}=\Pr_\theta(Y>a)$ is the per-terminal hit probability and $n$ terminal draws remain, the correct finite-grid reward curve is
$$
g_{\theta,n}(a)=a\left[1-(1-r_{\theta,a})^n\right],
$$
not the block-local one-draw curve $a r_{\theta,a}$. In the useful limited-leakage regime, one typically wants $N\approx1/\kappa$ and $\kappa\asymp\gamma^2/q$, so if $\gamma\ll q$ then $Nq\gg1$. Then an old quote's delayed-hit probability after its own block is roughly
$$
(1-p_h)\left[1-(1-p_h)^{N-1}\right],
$$
which is near $1$, not $q$, when $Np_h\gg1$. This can destroy the intended $\beta,\Delta,\delta$ envelope.
Known gaps: A localization gadget might still realize the block-local abstraction, but it must simultaneously preserve one fixed comparator quote, prevent cross-block hits, and keep information leakage small. Changing quote levels by block risks losing fixed-comparator accumulation; clearing quotes with common high prices changes the reward curves.
Source: `iterations/iter_022/idea_02/explorer_01.md`; `iterations/iter_022/idea_02/critic_01_on_explorer_01.md`.
