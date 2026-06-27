# Lemma Bank

## Lemma: Known-law conditional grid oracle
Status: proved
Assumptions: Finite horizon $T$; exogenous/action-independent law on $P_{1:T}$ known to the learner; the learner may depend on $T$; comparator is $\sup_a\mathbb E\sum_t r_t(a)$.
Statement: For any $K\ge1$, there is a deterministic horizon-aware learner with
$$
R_T\le T/K.
$$
In particular, $K=T$ gives $O(1)$ regret for every known exogenous law.
Proof sketch: Let $M_t=\max_{t<s\le T}P_s$, with empty maximum giving no trade. Given $\mathcal F_t=\sigma(P_1,\ldots,P_t)$, define
$$
g_t(a)=\mathbb E[a\mathbf{1}\{M_t>a\}\mid\mathcal F_t].
$$
Choose the smallest maximizer of $g_t$ on $\mathcal G_K=\{0,1/K,\ldots,(K-1)/K\}$. For any $a\in[0,1]$, round down to $b\in\mathcal G_K$ with $b\le a$ and $a-b\le1/K$, except $a=1$ where the reward is zero. Pathwise,
$$
a\mathbf{1}\{M_t>a\}\le b\mathbf{1}\{M_t>b\}+1/K.
$$
Taking conditional expectations, summing over $t$, and then taking $\sup_a$ gives the bound.
Known gap: This is an oracle/information-theoretic lemma, not a computational or unknown-law result. It is horizon-aware and does not imply an anytime policy.
Source: `iterations/iter_002/solver_attempt.md`; idea_01 explorer and critique.

## Lemma: Comparator-gap truncation comparison
Status: proved
Assumptions: Fixed exogenous price law $P$; rewards $r_t(a)$ and $r_t^H(a)$ evaluated on the same price path; comparator uses $\sup_a$.
Statement: Define
$$
V_T=\sup_a\mathbb E\sum_{t=1}^T r_t(a),\qquad
V_T^H=\sup_a\mathbb E\sum_{t=1}^T r_t^H(a),
$$
$$
\delta_T(H)=V_T-V_T^H.
$$
For any learner,
$$
R_T\le R_T^H+\delta_T(H).
$$
Proof sketch: $r_t^H(a_t)\le r_t(a_t)$ pathwise, so learner true reward is at least learner truncated reward. Then
$$
R_T=V_T-L_T\le V_T-L_T^H=(V_T^H-L_T^H)+(V_T-V_T^H).
$$
Source: synthesized from idea_01 critique.

## Lemma: Worst-action truncation comparison
Status: proved
Assumptions: Same as comparator-gap lemma.
Statement:
$$
\Delta_T(H)=\sup_a\sum_t\mathbb E[r_t(a)-r_t^H(a)]
$$
implies
$$
R_T\le R_T^H+\Delta_T(H).
$$
Also $\Delta_T(H)\le T\beta(H)$ under the original essential-sup tail condition.
Proof sketch: For each fixed $a$,
$$
0\le r_t(a)-r_t^H(a)\le a\mathbf{1}\{H<\tau_t(a)\le T-t\}\le \mathbf{1}\{H<\tau_t(a)<\infty\}.
$$
Take expectations and sum for the comparator; learner reward is monotone from truncated to true.
Source: `inputs/delays.tex`; solver attempt; idea_01 explorer.

## Lemma: Downward grid discretization
Status: proved
Assumptions: Quote grid $\mathcal G_K=\{0,1/K,\ldots,(K-1)/K\}$; threshold trade event $P>a$.
Statement:
$$
\sup_{a\in[0,1]}\mathbb E\sum_t r_t^H(a)
\le
\max_{b\in\mathcal G_K}\mathbb E\sum_t r_t^H(b)+T/K.
$$
Therefore continuum truncated regret is at most grid truncated regret plus $T/K$.
Proof sketch: Round $a$ down to $b\le a$ with $a-b\le1/K$. If $a$ trades within $H$, then $b$ also trades within $H$, and per-round payoff loss is at most $1/K$.
Source: `inputs/delays.tex`; idea_01 explorer/critic.

## Lemma: Delayed full-information experts with bounded delay
Status: proved via residue splitting, conditional on standard Hedge
Assumptions: Reward vectors $g_t\in[0,1]^K$ are fixed independently of learner actions and are revealed after delays $d_t\le H$; feedback for round $t$ is processed before the decision at $t+H+1$.
Statement:
$$
R_{T,K}^H=O(\sqrt{T (H+1)\log K}).
$$
Proof/use: Run $H+1$ independent Hedge instances indexed by $t\bmod(H+1)$. On a fixed residue subsequence, all previous same-residue rewards have arrived before the next decision, so ordinary Hedge gives regret $O(\sqrt{n_j\log K})$. Summing over residues and applying Cauchy,
$$
\sum_{j=0}^{H}\sqrt{n_j\log K}\le \sqrt{T(H+1)\log K}.
$$
The global best grid arm is bounded by the sum of the best arms on the residue subsequences. Apply to the truncated grid reward vector $(r_t^H(b))_{b\in\mathcal G_K}$, which is known after at most $H$ future prices under exogenous public prices.
Known gap: Final paper should spell out the Hedge convention and constants, or cite a precise delayed-feedback theorem.
Source: local reports; iter_002 idea_02 explorer and critique.

## Lemma: Uniform truncation upper theorem
Status: proved conditional on standard Hedge
Assumptions: Horizon-indexed exogenous public-price class $\mathcal C_T$; one algorithm and schedules $H,K$ used uniformly over $\mathcal C_T$; learner may depend on $T,H,K$, but not on the active $P\in\mathcal C_T$.
Statement:
$$
\sup_{P\in\mathcal C_T}R_T^P
\lesssim
\sqrt{T (H+1)\log K}+T/K+\sup_{P\in\mathcal C_T}\delta_T^P(H).
$$
The same statement holds with $\Delta_T^P(H)$ replacing $\delta_T^P(H)$.
Rate example: If $\Delta_T^{\mathcal C}(H)\le T H^{-\alpha}$ and $K=T$, optimizing gives
$$
H\asymp (T/\log T)^{1/(2\alpha+1)},\quad
R_T\lesssim T^{(\alpha+1)/(2\alpha+1)}(\log T)^{\alpha/(2\alpha+1)}.
$$
Source: idea_01 explorer and critique.

## Lemma: Hidden-terminal two-world lower bound
Status: proved for finite-horizon minimax class
Assumptions: Horizon $T=D+1$; learner does not know which of two laws in the class is active; the same learner must work for both.
Statement: Let $P_1=\cdots=P_D=0$. At terminal time set
$$
Y_L\sim\mathrm{Unif}[1/2,5/8],\qquad
Y_H\sim\mathrm{Unif}[3/4,7/8].
$$
Then every randomized learner has regret at least $D/8$ in one of the two worlds.
Proof sketch: Before the terminal reveal, observations are identical. For $g_i(a)=a\Pr(Y_i>a)$,
$$
V_L=1/2,\quad V_H=3/4,\quad \sup_a(g_L(a)+g_H(a))/2=1/2.
$$
The Bayes regret under a uniform prior is $D((1/2+3/4)/2-1/2)=D/8$; apply Yao.
Known gap: Does not imply a fixed-law asymptotic lower bound.
Source: idea_02 explorer and critique.

## Lemma: Posterior Bayes-gap lower-bound certificate
Status: proved conditional on standard regular-conditional setup
Assumptions: Exogenous price laws $\{P^\theta\}$ with prior $\pi$; decision-time information $\mathcal I_t$ is defined under the mixture law before $a_t$ is sampled; rewards are fixed counterfactual functions of the exogenous price path; comparator value
$$
V_\theta=\sup_{a\in[0,1]}\sum_{t=1}^T\mathbb E_\theta r_t(a).
$$
Statement: For any learner $A$,
$$
\mathbb E_{\theta\sim\pi}R_T^\theta(A)
\ge
\mathbb E_{\theta\sim\pi}V_\theta
-
\sum_{t=1}^T
\mathbb E_{\bar P}\left[
\sup_{a\in[0,1]}
\mathbb E_{\theta\sim\pi(\cdot\mid\mathcal I_t)}
\mathbb E_\theta[r_t(a)\mid\mathcal I_t]
\right].
$$
Therefore $\inf_A\sup_\theta R_T^\theta(A)$ is at least any uniform lower bound obtained from the right-hand side.
Proof sketch: Conditional on $\mathcal I_t$, the learner's action distribution cannot exceed the best single posterior-mixture quote in expected reward. Sum this upper bound on learner Bayes reward, subtract from the Bayes fixed-comparator value, and use that worst-case regret dominates average regret under the prior.
Known gaps: Needs clean notation in final write-up. If the displayed posterior envelope depends on the algorithm through $\mathcal I_t$, applications must upper-bound it uniformly. Not valid for action-dependent prices without a causal model.
Source: `iterations/iter_003/idea_01/explorer_01.md`; critique.

## Lemma: Fixed-prior Bayes myopic optimality on a finite quote grid
Status: proved
Assumptions: Finite horizon $T$; public exogenous prices; finite quote grid $G\subset[0,1]$; prior $\pi$ over exogenous laws; mixture law $\bar P_\pi$; learner observes $P_{1:t}$ before choosing $a_t$; learner randomization is independent of the active law and does not affect prices or observations.
Statement: With
$$
M_t=\max_{t<s\le T}P_s,\qquad
g_t^\pi(h_t,a)=a\,\bar P_\pi(M_t>a\mid P_{1:t}=h_t),
$$
the optimal Bayes expected reward over grid-valued policies is
$$
\sup_A \mathbb E_{\bar P_\pi,A}\sum_{t=1}^T r_t(a_t)
=
\sum_{t=1}^T
\mathbb E_{\bar P_\pi}\left[\max_{a\in G}g_t^\pi(P_{1:t},a)\right].
$$
Proof sketch: Conditional on the pre-action sigma-field generated by $P_{1:t}$, past actions, and private randomness, the conditional law of future public prices is the same as under $\bar P_\pi(\cdot\mid P_{1:t})$. Thus any randomized action has conditional expected reward equal to a convex combination of $g_t^\pi(P_{1:t},a)$ over $a\in G$, bounded by the pointwise maximum. A grid-valued policy choosing a pointwise maximizer at every $t$ attains the bound; finite $G$ gives measurable selectors.
Known gaps: The $[0,1]$ version needs suprema and measurable $\varepsilon$-selectors or a separate $T/K$ grid approximation because strict thresholds can prevent maximizers.
Source: `iterations/iter_004/idea_02/explorer_01.md`; `iterations/iter_004/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Finite reward-set minimax duality
Status: proved
Assumptions: Finite parameter set $\Theta$; nonempty bounded convex attainable reward set $C\subset\mathbb R^\Theta$; vector $V\in\mathbb R^\Theta$.
Statement:
$$
\inf_{x\in C}\max_{\theta\in\Theta}(V_\theta-x_\theta)
=
\sup_{\pi\in\Delta(\Theta)}
\left[
\sum_\theta\pi_\theta V_\theta-\sup_{x\in C}\sum_\theta\pi_\theta x_\theta
\right].
$$
Proof sketch: Replace $C$ by its compact convex closure $\overline C$; continuity leaves the infimum and support functions unchanged. Since
$$
\max_\theta(V_\theta-x_\theta)=\max_{\pi\in\Delta(\Theta)}\sum_\theta\pi_\theta(V_\theta-x_\theta),
$$
finite-dimensional minimax/Sion for the continuous bilinear payoff on $\overline C\times\Delta(\Theta)$ gives the identity.
Source: `iterations/iter_005/idea_02/explorer_01.md`; `iterations/iter_005/idea_02/critic_01_on_explorer_01.md`; synthesis.

## Lemma: Corrected finite-grid minimax/Bayes-gap identity
Status: proved conditional on the fixed-prior Bayes myopic lemma
Assumptions: Finite law class $\Theta$; finite quote grid $G$; randomized measurable grid-valued policies; public exogenous prices; grid comparator
$$
V_\theta^G=\max_{a\in G}\sum_{t=1}^T\mathbb E_\theta r_t(a).
$$
Statement: Define
$$
\Psi_G(\pi)=
\sum_{\theta}\pi_\theta V_\theta^G
-
\sum_{t=1}^T
\mathbb E_{\bar P_\pi}\left[
\max_{a\in G}a\,\bar P_\pi(M_t>a\mid P_{1:t})
\right].
$$
Then
$$
\inf_A\sup_{\theta\in\Theta}
\left(V_\theta^G-\mathbb E_\theta\sum_t r_t(a_t)\right)
=
\sup_{\pi\in\Delta(\Theta)}\Psi_G(\pi).
$$
Proof sketch: Let
$$
C=\{(L_\theta(A))_{\theta\in\Theta}:A\text{ admissible grid policy}\}.
$$
This set is convex by ex-ante randomization between policies and bounded in $[0,T]^\Theta$. Apply finite reward-set minimax duality with $V=V^G$, then use fixed-prior Bayes myopic optimality to identify the support function:
$$
\sup_A\sum_\theta\pi_\theta L_\theta(A)
=
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
Known gaps: The final write-up still needs to state the admissible policy class and public-exogenous model carefully. Cannot be stated with continuum $V_\theta$ or continuum Bayes envelope without carrying discretization error. Randomized policies are essential; deterministic policies fail simple two-world tests. The identity is close to the minimax value and not a scalar tail characterization.
Source: `iterations/iter_004/idea_01/explorer_01.md`; `iterations/iter_004/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_005/idea_01/explorer_01.md`; `iterations/iter_005/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_005/idea_02/explorer_01.md`; `iterations/iter_005/idea_02/critic_01_on_explorer_01.md`; synthesis.

## Lemma: Grid-to-continuum minimax comparison
Status: proved
Assumptions: Public exogenous prices; arbitrary law class $\Theta$; randomized measurable policies; continuum quote set $[0,1]$; grid $G_K=\{0,1/K,\ldots,(K-1)/K\}$. Let $\mathcal R_{[0,1]}$ and $\mathcal R_{G_K}$ be the signed minimax regret values with matching learner/comparator action sets.
Statement:
$$
|\mathcal R_{[0,1]}(\Theta,T)-\mathcal R_{G_K}(\Theta,T)|\le T/K.
$$
Proof sketch: Downward rounding satisfies, pathwise,
$$
a\mathbf{1}\{M_t>a\}\le b\mathbf{1}\{M_t>b\}+1/K,
$$
where $b=\lfloor a\rfloor_K\in G_K$. This gives $V_\theta\le V_\theta^{G_K}+T/K$, and hence $\mathcal R_{[0,1]}\le \mathcal R_{G_K}+T/K$ by evaluating grid policies in the continuum game. Conversely, round every action of any continuum policy; the rounded grid policy loses at most $T/K$ reward in every world, while $V_\theta^{G_K}\le V_\theta$. Taking infima gives $\mathcal R_{G_K}\le \mathcal R_{[0,1]}+T/K$.
Known gaps: This does not define or prove an exact continuum $\Psi$ formula; it only approximates continuum minimax values by grid minimax values.
Source: `iterations/iter_005/solver_attempt.md`; iteration 5 critiques; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`; synthesis.

## Lemma: Finite-class positive-part value equivalence
Status: proved conditional on finite-grid minimax/Bayes identity and grid-to-continuum comparison
Assumptions: Finite horizon-indexed public-exogenous class $\Theta_T$; randomized measurable policies; continuum minimax signed upper-regret value $\mathcal R_T^{[0,1]}$; grid $G_T=\{0,1/T,\ldots,(T-1)/T\}$; grid Bayes value $\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)$.
Statement:
$$
\left|
(\mathcal R_T^{[0,1]})_+
-
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+
\right|\le 1.
$$
Consequently,
$$
(\mathcal R_T^{[0,1]})_+=o(T)
\quad\Longleftrightarrow\quad
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+=o(T).
$$
Proof sketch: The finite-grid minimax/Bayes identity gives $\mathcal R_T^{G_T}=\sup_\pi\Psi_{G_T}(\pi)$. The grid-to-continuum comparison gives $|\mathcal R_T^{[0,1]}-\mathcal R_T^{G_T}|\le T/K=1$. Apply that $x\mapsto x_+$ is 1-Lipschitz.
Known gaps: Finite classes only. This is not an exact continuum least-favorable-prior formula, and it assumes the positive-part/upper-regret convention.
Source: `iterations/iter_006/idea_01/explorer_01.md`; `iterations/iter_006/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Infinite-class finite-subclass product-closure formula
Status: proved
Assumptions: Fixed finite horizon $T$, fixed finite grid $G$, public exogenous class $\Theta$, grid comparator values $V_\theta^G$, and attainable reward set
$$
C=\{(L_\theta(A))_{\theta\in\Theta}:A\text{ admissible randomized grid policy}\}\subset[0,T]^\Theta.
$$
Statement: Let
$$
\mathcal R_G(F)=\inf_{c\in C}\max_{\theta\in F}(V_\theta^G-c_\theta)
$$
for finite $F\subset\Theta$, and
$$
\Phi_G(\Theta)=\sup_{F\Subset\Theta}\mathcal R_G(F).
$$
Then
$$
\Phi_G(\Theta)
=
\inf_{c\in\overline C^{pt}}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta),
$$
where $\overline C^{pt}$ is the product-topology closure of $C$ in $[0,T]^\Theta$.
Proof sketch: For $\alpha>\Phi_G(\Theta)$, every finite set of closed constraints
$$
\{c\in\overline C^{pt}:V_\theta^G-c_\theta\le\alpha,\ \theta\in F\}
$$
is nonempty; compactness of $\overline C^{pt}$ gives a point satisfying all constraints. Conversely, if a point in $\overline C^{pt}$ controls all $\theta$ at level $\alpha$, product-topology approximation by points of $C$ on a finite $F$ gives $\mathcal R_G(F)\le\alpha+\varepsilon$.
Known gaps: This is the value of the product-closure relaxed game. It equals the true infinite-class minimax value only if $C$ is product closed or another no-gap condition is proved.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Product-closed no-gap criterion
Status: proved
Assumptions: Same fixed-grid setup as the product-closure formula.
Statement: If $C$ is product closed in $[0,T]^\Theta$, then
$$
\mathcal R_G(\Theta)=\Phi_G(\Theta).
$$
Proof sketch: Product closedness makes $C=\overline C^{pt}$, so the product-closure formula becomes the true minimax value. Equivalently, finite-intersection compactness turns uniformly feasible finite-subclass controls into one reward vector controlling all worlds.
Known gaps: Product closedness is not automatic for arbitrary infinite classes.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Dominated-prefix compactness for grid policies
Status: proved conditional on natural prefix-kernel policy formalization
Assumptions: Fixed finite $T$ and finite $G$; public exogenous prices; for each $t$, all prefix laws $P^\theta_{1:t}$ are dominated by a common sigma-finite $\lambda_t$; admissible randomized policies are represented, up to $\lambda_t$-null sets, by measurable kernels $q_t(h_t)\in\Delta(G)$.
Statement: Under these assumptions the attainable reward set $C\subset[0,T]^\Theta$ is product compact. Hence $\mathcal R_G(\Theta)=\Phi_G(\Theta)$, and finite-subclass Bayes-gap values characterize the full grid minimax value.
Proof sketch: For each $(\theta,t,a)$, define the finite weighted prefix measure
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}].
$$
Since $\mu^\theta_{t,a}\ll P^\theta_{1:t}\ll\lambda_t$, write $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$ with $f^\theta_{t,a}\in L^1(\lambda_t)$. Then
$$
L_\theta(q)=\sum_{t,a}\int q_{t,a}(h)f^\theta_{t,a}(h)\,d\lambda_t(h).
$$
The feasible set $L^\infty(\lambda_t;\Delta(G))$ is weak-* compact; positivity and simplex constraints are weak-* closed. Coordinate maps $q\mapsto L_\theta(q)$ are weak-* continuous, so the image reward set is compact in the product topology.
Known gaps: The final paper must state the admissible measurable policy class and prove that arbitrary private-randomized policies reduce to prefix marginal kernels because prices are exogenous and rewards are additive. Continuum quotes still require the separate $T/K$ grid comparison.
Source: `iterations/iter_007/idea_01/explorer_01.md`; `iterations/iter_007/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_008/idea_01/explorer_01.md`; `iterations/iter_008/idea_01/critic_01_on_explorer_01.md`; synthesis.

## Lemma: Payoff-weighted reward-measure domination no-gap theorem
Status: proved for completed $L^\infty$ public-prefix kernels; conditional for original Borel private-randomized policies
Assumptions: Fixed finite $T$, finite $G$, public exogenous prices; $M_t=\max_{t<s\le T}P_s$ with empty future at $t=T$ giving zero reward; admissible randomized policies represented by measurable public-prefix kernels $q_t(h_t)\in\Delta(G)$, modulo the relevant null sets. For each $t$, there is a sigma-finite Borel measure $\lambda_t$ such that for all $\theta\in\Theta$ and $a\in G$,
$$
\mu^\theta_{t,a}(B)
=
\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}]
\ll \lambda_t .
$$
Statement: The grid attainable reward set
$$
C=\{(L_\theta(q))_{\theta\in\Theta}:q\text{ admissible prefix-kernel policy}\}\subset[0,T]^\Theta
$$
is product compact. Hence
$$
\mathcal R_G(\Theta)
=
\sup_{F\Subset\Theta}\mathcal R_G(F)
=
\sup_{F\Subset\Theta}\sup_{\pi\in\Delta(F)}\Psi_{G,F}(\pi).
$$
Proof sketch: Write $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$ with $f^\theta_{t,a}\in L^1(\lambda_t)$. Then
$$
L_\theta(q)=\sum_{t,a}\int q_{t,a}(h)f^\theta_{t,a}(h)\,d\lambda_t(h).
$$
Each feasible set $Q_t=L^\infty(\lambda_t;\Delta(G))$ is weak-* compact: boundedness follows from the simplex constraint, positivity is weak-* closed by testing against $L^1_+$, and $\sum_a q_{t,a}=1$ is weak-* closed by testing against $L^1$. The finite product $Q=\prod_tQ_t$ is compact, and each coordinate $q\mapsto L_\theta(q)$ is weak-* continuous. Thus $C$, the continuous image into the product space $[0,T]^\Theta$, is product compact. Apply the product-closed no-gap criterion and the finite-class grid minimax/Bayes identity on finite $F$.
Known gaps: For the original policy class, the forward reduction to law-independent prefix reward marginals is now accepted under the exact common Borel seed/state model, but primitive stochastic-kernel policies still require a standard randomization lemma if not defined by seeds. The reverse Borel-version/completed-measure implementation is recorded below as a lemma conditional on the standard Borel-version theorem. A final original-policy no-gap theorem still needs those standard facts cited/proved and one policy class used consistently for finite-subclass and full-class values. This is fixed-grid only.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_008/idea_01/explorer_01.md`; `iterations/iter_008/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_009/idea_01/explorer_01.md`; `iterations/iter_009/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_01/explorer_01.md`; `iterations/iter_012/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_02/explorer_01.md`; `iterations/iter_012/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Density-form finite-prior support formula under domination
Status: proved for finite priors in the completed prefix-kernel model
Assumptions: Same fixed finite $T,G$, public exogenous, and payoff-weighted reward-measure domination assumptions as the previous lemma; finite $F\subset\Theta$ and prior $\pi\in\Delta(F)$.
Statement:
$$
\sup_{q\in Q}\sum_{\theta\in F}\pi_\theta L_\theta(q)
=
\sum_{t=1}^T\int \max_{a\in G}
\sum_{\theta\in F}\pi_\theta f^\theta_{t,a}(h)\,d\lambda_t(h),
$$
where $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$.
Proof sketch: The objective is linear and separable over $t$ and $h$:
$$
\sum_\theta\pi_\theta L_\theta(q)
=
\sum_t\int\sum_{a\in G}q_{t,a}(h)
\left(\sum_\theta\pi_\theta f^\theta_{t,a}(h)\right)d\lambda_t(h).
$$
For each $(t,h)$, maximizing over the simplex $\Delta(G)$ chooses an arm attaining the finite maximum; finite $G$ gives a measurable argmax. The reverse inequality holds by pointwise comparison.
Known gaps: Iteration 12 identifies this density expression with the earlier conditional-probability Bayes envelope for finite $F,G$; see the density-$\Psi$ lemma below. This support formula still lives inside the completed prefix-kernel model and does not itself prove original-policy alignment.
Source: `iterations/iter_009/idea_01/explorer_01.md`; `iterations/iter_009/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_02/explorer_01.md`; `iterations/iter_012/idea_02/critic_01_on_explorer_01.md`.

## Lemma: TV-separable reward-measure families are dominated
Status: proved
Assumptions: For each fixed $t,a$, the finite-measure family $\{\mu^\theta_{t,a}:\theta\in\Theta\}$ has a countable dense subset in total variation. Since $T$ and $G$ are finite, combine the resulting dominating measures over finitely many $(t,a)$ if desired.
Statement: The payoff-weighted reward-measure domination assumption of the previous lemma holds.
Proof sketch: Let $\{\nu_n\}$ be TV-dense in the family and set $\lambda=\sum_{n\ge1}2^{-n}\nu_n$. If $\lambda(B)=0$, then $\nu_n(B)=0$ for all $n$. For any $\mu^\theta_{t,a}$, choose $\nu_n$ with $\|\mu^\theta_{t,a}-\nu_n\|_{\rm TV}<\varepsilon$; then $\mu^\theta_{t,a}(B)\le\varepsilon$, and $\varepsilon\downarrow0$ gives $\mu^\theta_{t,a}(B)=0$. Compact metric $\Theta$ plus TV-continuity of $\theta\mapsto\mu^\theta_{t,a}$ gives TV separability.
Known gaps: Weak or Feller continuity alone does not imply total-variation separability or domination. Uncountable Dirac families are the basic stress test.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Dominated approximation gives approximate no-gap
Status: plausible
Assumptions: For every $\varepsilon>0$, there is a dominated surrogate finite-grid game with
$$
\sup_\theta\max\{\sup_q|L_\theta(q)-\tilde L_\theta(q)|,\ |V_\theta^G-\tilde V_\theta^G|\}\le\varepsilon .
$$
Statement candidate: The full infinite-class grid value and the finite-subclass modulus differ by at most $O(\varepsilon)$, and exact no-gap follows if $\varepsilon\to0$.
Proof sketch: Each regret coordinate $V_\theta^G-L_\theta(q)$ changes by at most about $2\varepsilon$, both for the full class and for every finite subclass. Apply the exact no-gap theorem to the dominated surrogate and transfer back. Constants still need to be written carefully.
Known gaps: The premise is strong; uniform approximation over all Borel policies is essentially total-variation-like. Keep as a candidate corollary until constants and policy-class alignment are checked.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Identifiable nondominated classes can be easy by a different mechanism
Status: plausible
Assumptions: Standard Borel parameter space; $P_1$ reveals $\theta$ through a Borel injective code with measurable inverse on its image; future conditional laws and finite-grid Bayes maximizers are measurably selectable.
Statement candidate: A single public-prefix policy can decode $\theta$ after the first observation and run the known-law grid oracle for that $\theta$, yielding $O(T/K)$ or nonpositive grid regret depending on how the first round is handled, despite mutually singular prefix laws.
Known gaps: This is not a compactness/product-closedness theorem and needs measurable dependence assumptions. Non-Borel label examples show why those assumptions cannot be omitted.
Source: `iterations/iter_008/idea_02/explorer_01.md`; `iterations/iter_008/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Linear non-Borel label finite-subclass gap
Status: proved under Borel public-prefix grid policies
Assumptions: Horizon $T=D+1$; grid $G=\{1/3,2/3\}$; deterministic public-exogenous laws indexed by $x\in[0,1]$; a non-Borel set $A\subset[0,1]$; Borel randomized public-prefix policies.
Statement:
$$
\sup_{F\Subset[0,1]}\mathcal R_G(F)=0,\qquad
\mathcal R_G([0,1])=D/6.
$$
Construction and proof sketch: Set
$$
P_1=x,\quad P_2=\cdots=P_D=0,\quad
P_{D+1}=1\ {\rm if}\ x\in A,\quad P_{D+1}=1/2\ {\rm if}\ x\notin A.
$$
For $x\in A$, quote $2/3$ is the early-round grid optimum; for $x\notin A$, quote $1/3$ is. Let $q_t(x)$ be the Borel probability that the policy quotes $2/3$ on early round $t$. Then
$$
R_A(x)=\frac{D-\sum_tq_t(x)}3,\qquad
R_{A^c}(x)=\frac{\sum_tq_t(x)}3.
$$
If regret were $<D/6$ for all $x$, then $A=\{x:D^{-1}\sum_tq_t(x)>1/2\}$ would be Borel. Constant randomization $q_t\equiv1/2$ attains $D/6$. For finite $F$, choose a Borel set agreeing with $A$ on $F$ and play the corresponding optimal grid quote.
Known gaps: This is a measurability/product-closure obstruction, not a natural Borel statistical lower bound. It vanishes for arbitrary nonmeasurable policies, Borel $A$, or countable identifier sets. The result is grid-restricted; continuum use requires the separate grid comparison.
Source: `iterations/iter_009/idea_02/explorer_01.md`; `iterations/iter_009/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Tiny-price deterministic raw-$\beta$ counterexample
Status: proved
Assumptions: Infinite deterministic exogenous price process. Blocks are $L_m=2^m$ zeros followed by spike $p_m=2^{-2m}$; $S_m=\sum_{j\le m}(L_j+1)$. Raw tail $\beta(h)$ uses the infinite-process definition.
Statement: $\beta(h)=1$ for every finite $h$, but
$$
\sup_T\sup_{a\in[0,1]}\sum_{t\le T}r_t(a)\le 1/2.
$$
Therefore the zero-quote learner has regret at most $1/2$ for every horizon. Moreover,
$$
\sup_T\Delta_T(H)\le C/H
$$
for integer $H\ge1$.
Proof sketch: For $\beta$, choose a block with $L_m>h$, start at its first zero, and quote $p_m/2$; the first future price above the quote is the spike after $L_m$ steps. For the comparator bound, fix $T,a$ and let $M$ be the last spike time within $T$ with $p_M>a$. Since $p_m$ is strictly decreasing, exactly quote times before $S_M$ can trade by $T$, so the reward is at most $p_M(S_M-1)\le1/2$. If no such spike exists, the reward is zero.
For the $\Delta$ bound, $a=0$ gives zero loss. For $a>0$, let $M=\max\{m:p_m>a\}$. A quote whose first hit is spike $j\le M$ loses under $H$-truncation only if its delay to that spike exceeds $H$, so
$$
\sum_t(r_t(a)-r_t^H(a))
\le
a\sum_{j\le M}(L_j+1-H)_+
\le
p_M\sum_{j\le M:L_j+1>H}(L_j+1).
$$
If $L_M+1\le H$ this is zero; otherwise the last display is at most $C4^{-M}2^M\le C/H$.
Known gaps: Does not refute value-weighted truncation criteria; rather it satisfies a strong value-weighted truncation bound while raw $\beta$ fails.
Source: `iterations/iter_006/idea_02/explorer_01.md`; `iterations/iter_006/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_007/solver_attempt.md`; synthesis.

## Lemma: Rare-history essential-sup separation
Status: proved
Assumptions: Singleton public-exogenous infinite process; expected-regret criterion; raw infinite-process $\beta(h)$; integer $H\ge1$.
Statement: There exists an exogenous process with
$$
\beta(h)=1\quad\forall h<\infty,\qquad
\sup_T V_T\le4,\qquad
\sup_T\Delta_T(H)\le C/H,
$$
and the zero-quote learner has bounded expected regret.
Construction and proof sketch: Let $N\ge1$ have $p_n=\Pr(N=n)=3\cdot4^{-n}$. Choose distinct $x_n\in(0,1/4)$, set $L_n=2^n$, and define
$$
P_1=x_N,\quad P_2=\cdots=P_{L_N+1}=0,\quad P_{L_N+2}=1,\quad P_t=0\text{ afterward}.
$$
Write $S_n=L_n+2$. Conditioning on the positive-probability atom $P_1=x_n$ with $2^n+1>h$, quote $1/2$ at $t=1$; then $\tau_1(1/2)=2^n+1$ surely, so $\beta(h)=1$. For $T$,
$$
V_T=\sup_a\mathbb E\sum_{t\le T}r_t(a)
=\sum_{n:S_n\le T}p_n(S_n-1)\le4,
$$
with the supremum approached by $a\uparrow1$. Truncation loses exactly $(S_n-1-H)_+$ quotes on atom $N=n$, hence
$$
\Delta_T(H)=\delta_T(H)
=\sum_{n:S_n\le T}p_n(S_n-1-H)_+
\le \sum_n 3\cdot4^{-n}(2^n+1-H)_+
\le C/H.
$$
Known gaps: This is expected regret only. On the rare atom $N=n$, pathwise regret at $T=S_n$ is order $2^n$. It is not a finite-horizon $\beta_T$ statement and not a minimax lower-bound construction.
Source: `iterations/iter_007/idea_02/explorer_01.md`; `iterations/iter_007/idea_02/critic_01_on_explorer_01.md`.

## Lemma: General identical-prefix Bayes-gap lower bound
Status: proved for finite-horizon minimax classes
Assumptions: Two laws are observationally identical for $D$ decision rounds; early reward curves are identical copies $g_i(a)$ within each world; later rewards are zero, common, or otherwise controlled so the fixed comparator contribution is exactly the early sum.
Statement: With
$$
V_i=\sup_a g_i(a),\qquad
\Gamma=\frac{V_0+V_1}{2}-\sup_a\frac{g_0(a)+g_1(a)}2,
$$
every randomized learner has regret at least $D\Gamma$ in one of the two worlds.
Proof sketch: Under the uniform prior, the learner's pre-reveal action distribution is world-independent. Per early round its Bayes reward is at most the best mixture-curve value, while the average world-specific comparator value is $(V_0+V_1)/2$. Sum over $D$ rounds and apply averaging.
Known gaps: Do not use this formula when reward curves vary by time unless $V_i$ is replaced by $\sup_a\sum_t g_{t,i}(a)$. Later rewards can offset the prefix gap unless controlled.
Source: `iterations/iter_003/idea_01/explorer_01.md`; critique.

## Lemma: q-scaled hidden-terminal variant
Status: proved for finite-horizon minimax class
Assumptions: Horizon $T=D+1$; unknown two-world exogenous class; $P_1=\cdots=P_D=0$. At $T$, world $L$ has $(1-q)\delta_0+q\,{\rm Unif}[1/2,5/8]$, and world $H$ has $(1-q)\delta_0+q\,{\rm Unif}[3/4,7/8]$. For raw $\beta$, set $P_s=0$ for all $s>T$.
Statement: Every randomized learner has regret at least $qD/8$ in one of the two worlds. With absorbing extension,
$$
\beta(h)=q\ \text{for }h<D,\qquad \beta(h)=0\ \text{for }h\ge D.
$$
For integer $H<D$,
$$
\Delta_L(H)=\delta_L(H)=q(D-H)/2,\qquad
\Delta_H(H)=\delta_H(H)=3q(D-H)/4.
$$
Proof sketch: The unscaled terminal revenue curves have suprema $1/2$ and $3/4$, while their averaged curve has supremum $1/2$. The hidden-prefix Bayes gap $1/8$ scales linearly by $q$. Truncation excludes exactly $D-H$ early quotes whose only possible trade is the terminal reveal.
Known gap: This atom alone gives lower bound $D B(D)$ under tail envelope $B$, too weak to match known power-tail upper rates.
Source: `iterations/iter_003/idea_02/explorer_01.md`; critique.

## Lemma: Approximate two-point Bayes gap via total variation
Status: plausible
Assumptions: Two exogenous laws with equal prior; decision-history distributions at time $t$ have total variation distance $d_t$; reward curves are bounded in $[0,1]$ and do not depend on hidden histories beyond the two laws in an uncontrolled way.
Statement candidate: Per-round Bayes reward is at most
$$
\sup_a\frac{g_{t,0}(a)+g_{t,1}(a)}2+\frac{d_t}{2}.
$$
Known gap: If curves depend on realized histories, the baseline must be history-conditional. This should remain a candidate until written carefully.
Source: `iterations/iter_003/idea_01/explorer_01.md`; critique.

## Lemma: Private-randomized policy to public-prefix reward kernels
Status: proved under an explicit common Borel seed/state policy model; conditional for primitive stochastic-kernel policy definitions
Assumptions: Fixed finite $T$, finite quote grid $G$, public exogenous prices, full observation of $P_{1:t}$ before $a_t$, common Borel policy maps on the whole standard Borel history space, iid private uniforms independent of $\theta$ and $P_{1:T}$, standard Borel internal state, and delayed trade feedback before $a_t$ that is a deterministic Borel function of public prices and past quotes. If policies are primitive stochastic kernels, first realize them by Borel maps and independent uniforms using a standard randomization lemma.
Statement: Every admissible common Borel seed/state policy $A$ induces Borel kernels $q_t:X_t=[0,1]^t\to\Delta(G)$, independent of $\theta$, such that for every world $\theta$
$$
L_\theta(A)
=\sum_{t=1}^T\sum_{a\in G}\int q_{t,a}(h)\,d\mu^\theta_{t,a}(h),
$$
where
$$
\mu^\theta_{t,a}(B)
=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}].
$$
Proof sketch: Use standard Borel state variables $Z_t$, Borel feedback maps $\Phi_t(P_{1:t},a_{1:t-1})$, and common Borel updates $(a_t,Z_t)=\Psi_t(Z_{t-1},P_{1:t},a_{1:t-1},\Phi_t,U_t)$. Recursively, all state used at time $t$, including past actions and delayed trade feedback, is a Borel function of $(P_{1:t},U_{1:t})$. Thus $a_t=\alpha_t(P_{1:t},U_{1:t})$. Set
$$
q_{t,a}(h)=\lambda^t\{u_{1:t}:\alpha_t(h,u_{1:t})=a\}.
$$
This is Borel by the section-integral theorem. Since private randomness is independent of the whole exogenous price path, Fubini gives the reward-coordinate identity. Conversely, any Borel finite-grid public-prefix kernel is implementable by fresh uniforms and cumulative probability intervals.
Known gaps: The final theorem must state the exact admissible policy model. If policies are not defined directly by seed maps, cite or prove the randomization lemma for standard Borel stochastic kernels. Algorithms must be common Borel maps/kernels, not law-by-law a.s. equivalence classes. The lemma fails or changes for action-dependent prices, private/censored feedback, law-correlated private randomness, inventory/budget/queue effects, or nonadditive rewards. It preserves expected additive reward vectors only, not pathwise behavior, joint action laws, high-probability statements, or the full feedback-state law.
Source: `iterations/iter_010/idea_01/explorer_01.md`; `iterations/iter_010/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_010/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_011/idea_02/explorer_01.md`; `iterations/iter_011/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_012/idea_01/explorer_01.md`; `iterations/iter_012/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Borel implementation of completed finite-grid prefix kernels
Status: proved conditional on standard Borel-version theorem
Assumptions: $X=[0,1]^t$ is standard Borel, $\lambda$ is a sigma-finite Borel measure, $G$ is finite, and $q\in L^\infty(\lambda;\Delta(G))$ has a completed-measurable representative that is simplex-valued $\lambda$-a.e.
Statement: There is a Borel map $\tilde q:X\to\Delta(G)$ with $\tilde q=q$ $\lambda$-a.e. Consequently, if $\mu^\theta_{t,a}\ll\lambda_t$, replacing $q_t$ by $\tilde q_t$ preserves all payoff-weighted integrals simultaneously over $\theta,t,a$. The Borel kernels are implementable by fresh private uniforms on finite $G$.
Proof sketch: Choose Borel versions $b_a$ of the finitely many coordinate functions. The set where a coordinate is outside $[0,1]$ or $\sum_a b_a\ne1$ is Borel and $\lambda$-null; redefine $b$ there to a fixed vertex of $\Delta(G)$. Absolute continuity of every $\mu^\theta_{t,a}$ transfers $\lambda$-a.e. equality to equality of reward integrals. For implementation, use cumulative sums of $\tilde q_{t,a}(h)$ and a uniform seed.
Known gaps: The final write-up should either prove or cite the theorem that completed-measurable functions on standard Borel spaces have Borel versions modulo a Borel measure. The lemma is finite-grid only and gives reward-coordinate preservation rather than behavioral equivalence on singular prefix histories.
Source: `iterations/iter_010/idea_02/explorer_01.md`; `iterations/iter_010/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Density-form support equals conditional $\Psi$ envelope under domination
Status: proved for finite $F,G$
Assumptions: Fixed finite $T$, finite nonempty quote grid $G$, finite $F\subset\Theta$, prior $\pi$, public exogenous prices on standard Borel path spaces, regular conditional law of $M_t$ given $P_{1:t}$ under the mixture, and payoff-weighted densities $d\mu^\theta_{t,a}=f^\theta_{t,a}d\lambda_t$.
Statement:
$$
\sum_t\int \max_{a\in G}\sum_{\theta\in F}\pi_\theta f^\theta_{t,a}(h)\,d\lambda_t(h)
=
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
Proof sketch: For fixed $t$, set $m_t=\bar P_\pi\circ P_{1:t}^{-1}$ and
$$
\nu_{t,a}(B)=\sum_{\theta\in F}\pi_\theta\mu^\theta_{t,a}(B)
=\mathbb E_{\bar P_\pi}[\mathbf{1}\{P_{1:t}\in B\}a\mathbf{1}\{M_t>a\}].
$$
Then $d\nu_{t,a}/d\lambda_t=\sum_\theta\pi_\theta f^\theta_{t,a}$, while $d\nu_{t,a}/dm_t$ is $a\,\bar P_\pi(M_t>a\mid P_{1:t}=h)$ $m_t$-a.e. The finite-measure functional
$$
S(\rho)=\int \max_{a\in G}\frac{d\nu_{t,a}}{d\rho}\,d\rho
$$
is invariant over common dominating measures $\rho$: compare $\rho,\rho'$ using $\eta=\rho+\rho'$, $u_a=d\nu_{t,a}/d\eta$, and $r=d\rho/d\eta$; since $\nu_{t,a}\ll\rho$, $u_a=0$ on $\{r=0\}$, and the chain rule gives $S(\rho)=\int\max_a u_a\,d\eta=S(\rho')$. Evaluate with $\rho=\lambda_t$ and $\rho=m_t$, then sum over $t$.
Known gaps: This identifies only the Bayes reward/support term in $\Psi_{G,F}$. It does not prove product compactness, original-policy alignment, continuum selector statements, arbitrary infinite-prior formulas, or any scalar tail characterization. Finite $G$ avoids measurable-sup and nonattainment issues.
Source: `iterations/iter_010/promising_ideas.json`; `iterations/iter_009/idea_01/explorer_01.md`; `iterations/iter_012/solver_attempt.md`; `iterations/iter_012/idea_02/explorer_01.md`; `iterations/iter_012/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Hidden/labeled tail-profile no-go pair
Status: proved under the stated public-exogenous protocol
Assumptions: Horizon $T=D+1$, $q\in(0,1]$, two worlds $\theta\in\{L,H\}$, no quote before $P_1$, no same-period trade, public exogenous prices, and regret against the active world's best fixed quote. Profiles are per-world legal-decision profiles, not posterior or public-history predictability objects.
Statement: There are two two-world classes with identical per-world reward, delay, $\beta,\Delta,\delta$, and comparator profiles but minimax regrets separated by $\Omega(qD)$.
Construction: Let
$$
Y_L\sim(1-q)\delta_0+q\,{\rm Unif}[1/2,5/8],\qquad
Y_H\sim(1-q)\delta_0+q\,{\rm Unif}[3/4,7/8].
$$
The hidden class has
$$
P_1=c,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta,
$$
with common $c$. The labeled class has
$$
P_1=\ell_\theta,\quad P_2=\cdots=P_D=0,\quad P_{D+1}=Y_\theta,
$$
with $\ell_L\ne\ell_H$.
Proof sketch: For each fixed $\theta$, changing only $P_1$ cannot affect any legal quote reward or delay, since a quote at time $t\ge1$ depends only on future prices $P_s$, $s>t$. Thus per-world profiles match. With absorbing post-horizon prices, $\beta_\theta(h)=q$ for $h<D$ and $0$ for $h\ge D$; for integer $0\le H<D$,
$$
\Delta_L(H)=\delta_L(H)=q(D-H)/2,\qquad
\Delta_H(H)=\delta_H(H)=3q(D-H)/4.
$$
In the hidden class, the two worlds are observationally identical until $P_{D+1}$, so the q-scaled hidden-terminal Bayes-gap atom gives regret at least $qD/8$. In the labeled class, $P_1$ identifies $\theta$ before $a_1$, so the learner quotes $1/2$ in world $L$ and $3/4$ in world $H$, matching the continuum comparator. Grid regret is exactly zero on grids containing these quotes and otherwise at most the usual discretization loss.
Known gaps: The lemma does not refute predictability-aware or class-level Bayes-gap characterizations. If a model permits pre-$P_1$ quotes or immediate trade against $P_1$, the label is no longer payoff-harmless.
Source: `iterations/iter_011/solver_attempt.md`; `iterations/iter_011/idea_01/explorer_01.md`; `iterations/iter_011/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Conditional tail-adaptive truncation reduction
Status: proved conditional on a heterogeneous-delay experts oracle
Assumptions: Public exogenous prices; finite quote grid $G_K$; dyadic truncation windows $\mathcal H$, with $T$ or a ceiling dyad included; surrogate expert rewards
$$
y_t(H,b)=r_t^H(b)
=b\mathbf{1}\{\max_{t<s\le \min(t+H,T)}P_s>b\}
$$
are revealed after delay at most $H$. An abstract full-information learner over $\mathcal E=\mathcal H\times G_K$ satisfies, for every arm $(H,b)$,
$$
\sum_t y_t(H,b)-\mathbb E\sum_t y_t(H_t,b_t)\le B_T(H).
$$
Statement:
$$
R_T^P
\le
T/K+\min_{H\in\mathcal H}\{\delta_T^P(H)+B_T(H)\}
$$
for every public exogenous law $P$. If $B_T(H)\lesssim \sqrt{T(H+1)\log(K|\mathcal H|)}$, this gives a tail-adaptive version of the accepted fixed-$H$ truncation upper bound, up to logarithmic factors.
Proof sketch: The learner posts $b_t$ from the selected arm $(H_t,b_t)$. True reward dominates surrogate reward pathwise. For fixed $H$, choose a best $H$-truncated grid quote $b_H$. The expert oracle lower-bounds the learner's surrogate reward by $\sum_t r_t^H(b_H)-B_T(H)$. Grid rounding and the comparator-gap truncation lemma upper-bound $V_T^P$ by $\mathbb E_P\sum_t r_t^H(b_H)+\delta_T^P(H)+T/K$. Combine and minimize over $H$.
Known gaps: The heterogeneous-delay experts oracle is unproved. Existing residue Hedge gives the accepted fixed-window result but not comparator-specific delay dependence. The result is exogenous; unplayed surrogate rewards are not defined from the realized path in action-dependent markets.
Source: `iterations/iter_013/idea_02/explorer_01.md`; `iterations/iter_013/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Last-exceedance fixed-quote identity
Status: proved
Assumptions: Finite horizon $T$; fixed price path; quote $a\in[0,1]$; future-only trade event.
Statement: Let
$$
L_a=\max\{s\le T:P_s>a\},
$$
with $L_a=0$ if no such $s$ exists. Then
$$
r_t(a)=a\mathbf{1}\{L_a>t\},\qquad
\sum_{t=1}^T r_t(a)=a(L_a-1)_+.
$$
Proof sketch: A quote posted at time $t$ trades by horizon $T$ iff some future price $P_s>a$ with $s>t$ exists, which is equivalent to $L_a>t$. Counting $t=1,\ldots,L_a-1$ gives the sum.
Known gaps: Algebraic only. It does not replace the accepted truncation or Bayes-predictability criteria.
Source: `iterations/iter_014/solver_attempt.md`.

## Lemma: Two-arm fast/slow regret equals delayed advantage control
Status: proved as a reduction
Assumptions: Full-information rewards $f_t,s_t\in[0,1]$; learner chooses slow with probability $q_t$; regret is in expectation against always-fast and always-slow.
Statement: With
$$
\Delta_t=s_t-f_t,\qquad S_T=\sum_t\Delta_t,\qquad A_T=\sum_t q_t\Delta_t,
$$
the regrets are exactly
$$
R_F=-A_T,\qquad R_S=S_T-A_T.
$$
Proof sketch: The learner's expected reward is $\sum_t f_t+A_T$. Always-fast receives $\sum_t f_t$, and always-slow receives $\sum_t f_t+S_T$.
Known gaps: The desired inequalities $A_T\ge-\tilde O(\sqrt T)$ and $A_T\ge S_T-\tilde O(\sqrt{TD})$ are unproved. Iteration 15 proves the fast-safety side via a solvency invariant, but the slow-capture side remains open and naive clipping fails by budget depletion. A two-arm proof would still need extension to many arms with different delays.
Source: `iterations/iter_014/idea_01/explorer_01.md`; `iterations/iter_014/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Horizon-censored nested-window increments
Status: proved
Assumptions: Public exogenous finite horizon $T$; fixed quote $b$; dyadic or increasing windows $0=H_0<\cdots<H_M=T$; truncated rewards
$$
g_t^m(b)=r_t^{H_m}(b)=b\mathbf{1}\{\tau_t(b)\le H_m,\ \tau_t(b)\le T-t\}.
$$
Statement: The increments
$$
z_t^m(b)=g_t^m(b)-g_t^{m-1}(b)
$$
satisfy
$$
z_t^m(b)=b\mathbf{1}\{H_{m-1}<\tau_t(b)\le H_m,\ \tau_t(b)\le T-t\},
$$
are nonnegative and disjoint in $m$ for fixed $(t,b)$, and are revealed after delay at most $H_m$.
Proof sketch: Subtract adjacent horizon-censored indicators. A realized first hit $\tau_t(b)$ falls in at most one interval $(H_{m-1},H_m]$, and if it exceeds $T-t$ it yields no finite-horizon reward.
Known gaps: This is only structural. It does not imply a nested-window adaptive algorithm; pathwise comparator charges and expected $\delta_T^P(H)$ must not be mixed.
Source: `iterations/iter_014/idea_02/explorer_01.md`; `iterations/iter_014/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Expected nested oracle would imply adaptive truncation
Status: conditional reduction only; strong simultaneous oracle refuted for standard budgets
Assumptions: Same nested-window setup as above; $V_m^G(P)=\max_{b\in G}\mathbb E_P\sum_t g_t^m(b)$ uses expected comparator values; an online learner satisfies for every $m$
$$
V_m^G(P)-\mathbb E_P L^m(A)
\le B_m+c\bigl(V_M^G(P)-V_m^G(P)\bigr).
$$
Statement candidate: Under this expected oracle,
$$
R_T^P\le O(T/K)+\min_m\{B_m+(1+c)\delta_T^P(H_m)\}.
$$
Proof sketch: Compare the true continuum comparator to the $H_m$-truncated grid comparator using grid rounding and $\delta_T^P(H_m)$. Then apply the oracle at window $m$, and use $V_M^G(P)-V_m^G(P)\le \delta_T^P(H_m)+O(T/K)$.
Known gaps: No algorithm is known to satisfy the expected oracle without knowing $P$. A pathwise oracle would instead give a charge $\mathbb E[V_M^G(\omega)-V_m^G(\omega)]$, which can be much larger than $\delta_T^P(H_m)$. Iteration 15 refutes the strong simultaneous expected oracle with standard $B_m$ on deterministic finite-grid two-window market paths, so this reduction should no longer be pursued in that form.
Source: `iterations/iter_014/idea_02/explorer_01.md`; `iterations/iter_014/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_015/idea_02/explorer_01.md`; `iterations/iter_015/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Independent-bit comparator collapse in an additive two-quote block model
Status: proved for the idealized additive model; not a market realization theorem
Assumptions: There are independent symmetric signs $\sigma_j\in\{\pm1\}$, block weights $w_j\ge0$, and a single fixed comparator chooses between two quotes whose relative advantage across all blocks is $\sum_j w_j\sigma_j$.
Statement:
$$
\mathbb E_\sigma\left|\sum_j w_j\sigma_j\right|
\le
\left(\sum_jw_j^2\right)^{1/2}.
$$
Thus equal independent hidden-bit blocks give only $w\sqrt N$ expected comparator advantage, not $Nw$.
Proof sketch: Jensen and independence give
$$
\mathbb E|S|\le (\mathbb E S^2)^{1/2}
=\left(\sum_jw_j^2\right)^{1/2}.
$$
Known gaps: This applies to an ideal additive two-quote abstraction. It does not rule out multi-quote codebooks, nonsymmetric designs, or constructions whose realized market reward curves do not decompose into independent signed block advantages.
Source: `iterations/iter_013/idea_01/explorer_01.md`; `iterations/iter_013/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Shared-type full-reveal saturation
Status: plausible in the stated toy model
Assumptions: Sequential blocks share one hidden type; block $j$ has length $D_j$, terminal reveal probability $q_j$, and if a nonzero terminal event occurs then the hidden type is fully learned before later blocks. Zero terminal observations are noninformative.
Statement candidate: The total unresolved Bayes-gap contribution is at most on the scale
$$
\sum_j D_jq_j\exp\left(-\sum_{k<j}q_k\right).
$$
For equal $D,q$, this saturates at $O(D)$, not $O(NDq)$.
Known gaps: This is not proved in the notes and does not cover noisy common-parameter or partial-reveal constructions. It also ignores persistent-quote cross-trades in the actual market protocol. Treat as a diagnostic lemma candidate, not an accepted lower-bound theorem.
Source: `iterations/iter_013/idea_01/explorer_01.md`; `iterations/iter_013/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Solvency invariant for delayed advantage fast safety
Status: proved
Assumptions: Delayed full-information two-arm advantage abstraction; $\Delta_t=s_t-f_t\in[-1,1]$; slow-play probabilities $q_t\in[0,1]$ are predictable from information available before round $t$; $\Delta_u$ is observed by time $u+D$ regardless of whether slow was played. At the beginning of round $t$,
$$
O_t=\sum_{u\le t-D}q_u\Delta_u,\qquad
P_t=\sum_{t-D<u<t}q_u,\qquad C_t=B+O_t-P_t .
$$
Statement: If the learner always chooses $q_t\le [C_t]_+$, then for every realized $\Delta_{1:T}$,
$$
A_T=\sum_{t=1}^Tq_t\Delta_t\ge -B.
$$
Equivalently, expected regret to the fast arm satisfies $R_F=-A_T\le B$.
Proof sketch: Maintain $C_t\ge0$. When pending exposure $q_u$ is revealed, $O$ increases by $q_u\Delta_u$ and $P$ decreases by $q_u$, so $C$ changes by $q_u(\Delta_u+1)\ge0$. Adding new exposure $q_t\le C_t$ decreases $C$ by at most $q_t$ and leaves it nonnegative. At the end, unrevealed pending terms can hurt by at most their total exposure:
$$
A_T=O_{\rm end}+\sum_{\rm pending}q_u\Delta_u
\ge O_{\rm end}-P_{\rm end}\ge -B .
$$
Known gaps: This is only the fast-safety half of the two-arm target. It says nothing by itself about $S_T-A_T$, and it is formulated for action probabilities/expected rewards rather than realized Bernoulli plays.
Source: `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Lemma: D-scale slow-regret term is unavoidable under delayed advantage indistinguishability
Status: proved for the repaired common-baseline test
Assumptions: Two-arm delayed advantage model with no information distinguishing two environments for the first $D$ rounds. One convenient realization is $f_t\equiv1/2$ and $\Delta_t=\pm1/2$ for $t\le D$, so fast rewards are identical and slow advantages are delayed.
Statement: If an algorithm has fast regret at most $B$ on the all-negative environment over the first $D$ rounds, then on the all-positive environment its slow regret over the same prefix is at least $D/2-B$.
Proof sketch: On $\Delta_t=-1/2$, fast regret over the first $D$ rounds is $\frac12\sum_{t\le D}q_t$, so the fast-regret bound implies $\sum_{t\le D}q_t\le2B$. The all-positive environment is indistinguishable for the first $D$ decisions under the common baseline, so the same $q_t$'s are used. Slow regret there is
$$
\frac12\sum_{t\le D}(1-q_t)\ge D/2-B.
$$
Known gaps: This is only a lower-bound stress test on the necessary scale of the slow term. The explorer's original all-$\pm1$ version is invalid in the original fast/slow reward model if immediate fast rewards differ and reveal the environment.
Source: `iterations/iter_015/idea_01/explorer_01.md`; `iterations/iter_015/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Periodic finite-grid market refutes the simultaneous expected nested oracle
Status: proved for the stated finite-grid oracle
Assumptions: Deterministic public-exogenous path; finite grid $G=\{\ell,h\}$ with $h=\ell+d<1$; choose $m\in(\ell,h)$; windows $H_1=1,H_2=D$; horizon $T=ND+1$; high spikes above $h$ occur at times $jD+1$, $j=0,\ldots,N$, and all other prices equal $m$. Assume $\ell D\ge h$. Consider the simultaneous expected oracle
$$
V_m^G-\mathbb E L^m(A)\le B_m+c(V_2^G-V_m^G),\qquad m=1,2.
$$
Statement: For fixed $c$ and standard budgets $B_1=O(\sqrt{ND})$, $B_2=O(D\sqrt N)$, the oracle fails for suitable $d,D,N$.
Proof sketch: On active rounds $1,\ldots,ND$, low earns short and long reward $\ell$ every round. High earns long reward $h$ every round, but short reward only on the $N$ rounds immediately preceding high spikes. Therefore
$$
V_1^G=\ell ND,\qquad V_2^G=hND,\qquad V_2^G-V_1^G=dND.
$$
Let $M$ be the expected number of active high quotes. Long regret is $d(ND-M)$, so the $m=2$ oracle forces $M\ge ND-B_2/d$. Since at most $N$ high quotes earn short reward,
$$
V_1^G-\mathbb E L^1
\ge \ell M-hN
\ge \ell ND-\ell B_2/d-hN.
$$
Choose $d\ll \ell/c$, $D\gg h/\ell$, and $N\gg d^{-2}$ (with constants absorbing the budget bounds). Then this lower bound is larger than $B_1+c\,dND$, contradicting the $m=1$ oracle.
Known gaps: This targets a strong simultaneous expected oracle, not every possible adaptive-truncation algorithm. The statement is finite-grid; dense-grid/continuum variants need separate analysis because intermediate quotes may change constants.
Source: `iterations/iter_015/idea_02/explorer_01.md`; `iterations/iter_015/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Horizon-censored future maximum convention
Status: proved / notation correction
Assumptions: Finite horizon $T$; reward $r_t(a)=a\mathbf{1}\{\exists s\in\{t+1,\ldots,T\}:P_s>a\}$.
Statement: Every finite-horizon reward-curve, Bayes-envelope, and payoff-measure formula using a future maximum must use
$$
M_t=\max_{t<s\le T}P_s,
$$
with the empty maximum at $t=T$ interpreted as producing zero reward. Equivalently, $a\mathbf{1}\{M_t>a\}$ denotes $0$ when there is no future time $s\le T$.
Proof sketch: By definition, a quote posted at time $t$ is rewarded over horizon $T$ only if it trades at some future time $s\le T$. Prices after $T$ do not enter $r_t$, truncation, comparator values, Bayes envelopes, or payoff-weighted measures. Using $\max_{s>t}P_s$ for an infinite continuation can count post-horizon hits and changes the game.
Known gaps: Purely notational, but important for theorem statements. Infinite-process tail examples may still define post-horizon continuations for $\beta$ calculations; finite-horizon regret formulas must remain censored at $T$.
Source: `iterations/iter_016/solution_critic_02.md`; `iterations/iter_016/solution_gate.md`; `iterations/iter_016/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Original Borel-policy payoff-domination no-gap bridge
Status: credible conditional bridge; not yet referee-ready
Assumptions: Fixed finite $T,G$; public exogenous prices on standard Borel path spaces; common Borel seed/state policies with independent private uniforms and reconstructible public feedback; payoff-weighted domination $\mu^\theta_{t,a}\ll\lambda_t$ by sigma-finite Borel measures; additive expected rewards.
Statement candidate: The expected reward-coordinate set generated by common Borel finite-grid policies equals the coordinate set generated by completed prefix kernels $q_t\in L^\infty(\lambda_t;\Delta(G))$:
$$
C_{\rm Borel}=C_{L^\infty}.
$$
Together with the completed-kernel compactness theorem, this would give the payoff-measure dominated no-gap theorem for the original common Borel policy model.
Proof sketch / obligations:
- Forward inclusion: define the exact common Borel seed/state policy model. Prove by induction that actions can be written as Borel maps $a_t=\alpha_t(P_{1:t},U_{1:t})$, because internal state, past actions, and delayed feedback are Borel functions of public prices and private seeds. Then
$$
q_{t,a}(h)=\Pr_U(\alpha_t(h,U_{1:t})=a)
$$
is Borel by section-integral measurability, and Fubini plus independence of $U$ gives
$$
L_\theta(A)=\sum_{t,a}\int q_{t,a}\,d\mu^\theta_{t,a}.
$$
- Reverse inclusion: for $q_t\in L^\infty(\lambda_t;\Delta(G))$, take Borel coordinate versions equal $\lambda_t$-a.e., repair on the Borel null set where the simplex constraints fail, and implement the resulting Borel finite-action kernel with a fresh uniform. Since $\mu^\theta_{t,a}\ll\lambda_t$, all reward integrals are preserved simultaneously.
- Compactness transfer: use the same $C_{L^\infty}$ as in the completed-kernel weak-* compactness theorem. If $C_{\rm Borel}=C_{L^\infty}$ as reward-vector sets, product compactness/no-gap transfers to the original common Borel policy model.
Known gaps: The final write-up still needs citations or local proofs for completed-measurable-to-Borel versions on standard Borel spaces, Borel section integrals, finite-action randomization, $L^\infty=(L^1)^*$, and weak-* closed simplex constraints. This preserves only expected additive reward vectors, not pathwise behavior, joint action laws, feedback-state laws, high-probability performance, or action-dependent outcomes. It does not cover law-by-law a.s. policy versions, private side information, law-correlated seeds, nonadditive rewards, or continuum quotes without the separate grid comparison.
Iteration 21 status: still credible but not closed. The critic found no fatal flaw under the exact model, but the policy model, forward seed/prefix induction, section-integral/Fubini step, Borelization of completed kernels, simplex repair, and finite-grid implementation must be written before this can be promoted.
Source: `iterations/iter_016/idea_02/explorer_01.md`; `iterations/iter_016/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_020/idea_02/explorer_01.md`; `iterations/iter_020/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_021/idea_01/explorer_01.md`; `iterations/iter_021/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Abstract finitely additive minimax dual on a finite grid
Status: proved as an abstract reward-vector theorem, pending final functional-analysis citations
Assumptions: Fixed finite horizon $T$, finite nonempty grid $G$, arbitrary nonempty index set $\Theta$, bounded grid comparator vector $V^G\in\ell^\infty(\Theta)$, and a nonempty convex attainable reward set
$$
C=\{L(A):A\text{ admissible randomized }G\text{-policy}\}\subset[0,T]^\Theta\subset\ell^\infty(\Theta).
$$
Convexity is supplied by ex-ante private randomization between common policies. The policy class is fixed once and for all; the theorem dualizes exactly the reward set it generates.
Statement: Let $ba_1^+(\Theta)$ denote positive finitely additive probabilities on all subsets of $\Theta$, identified with positive norm-one functionals on $\ell^\infty(\Theta)$. Then
$$
\inf_{c\in C}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta)
=
\sup_{\nu\in ba_1^+(\Theta)}
\left[
\langle V^G,\nu\rangle-\sup_{c\in C}\langle c,\nu\rangle
\right].
$$
Proof sketch: Weak duality follows from positivity and normalization:
$$
\langle V,\nu\rangle-\sup_{c'\in C}\langle c',\nu\rangle
\le \langle V-c,\nu\rangle
\le \sup_\theta(V_\theta-c_\theta).
$$
For reverse duality, set $X=\ell^\infty(\Theta)$, $X_+=\{x:x_\theta\ge0\}$, and $S=C-X_+$. If $\alpha$ is below the primal value, then $V-\alpha\mathbf{1}\notin\overline S^{\|\cdot\|_\infty}$; otherwise a norm approximation by $c-x$, $x\ge0$, would imply $\sup_\theta(V_\theta-c_\theta)\le\alpha+o(1)$. Strong separation gives a nonzero $\phi\in X^*=ba(\Theta)$. Downward closedness of $S$ forces $\phi\ge0$: if $\phi(x)<0$ for some $x\ge0$, then $c-\lambda x\in S$ makes the support unbounded in the wrong direction. Normalize $\phi(\mathbf{1})=1$, obtaining a dual value $>\alpha$, then let $\alpha\uparrow$ the primal value. An alternate proof uses Sion with $\Delta_{ba}$ weak-* compact and $C$ in norm topology.
Referee-proof details from iteration 20:
- Norm closure is harmless because $c\mapsto\sup_\theta(V_\theta-c_\theta)$ is 1-Lipschitz and every $ba$ functional is norm-continuous.
- The nonseparation step must use norm topology, not product topology; product closure gives only the finite-subclass relaxation.
- A nonzero positive functional satisfies $\phi(\mathbf{1})>0$, so normalization to $ba_1^+$ is legitimate.
- The optional Sion proof should not be the main proof unless compactness/topology details are written carefully.
Known gaps: This is not a posterior Bayes formula; the support term remains $\sigma_C(\nu)$. It is a value identity, not policy attainment; approximate policies follow only from the infimum definition unless extra compactness/attainment is imposed. It requires convex $C$; deterministic-policy values can differ from the randomized/convexified value. If $C$ is the original Borel-policy reward set, old policy-alignment questions remain. Continuum quotes still require the existing grid-to-continuum approximation.
Iteration 21 status: proof-ready as an abstract convex reward-set proposition, pending citations or inline proofs for $(\ell^\infty)^*=ba$, strong separation, and positive functional facts. The nonconvex deterministic-policy and finite-support-at-infinity examples remain mandatory scope tests.
Source: `iterations/iter_019/idea_01/explorer_01.md`; `iterations/iter_019/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_019/idea_02/explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`; `iterations/iter_020/idea_01/explorer_01.md`; `iterations/iter_020/idea_01/critic_01_on_explorer_01.md`; `iterations/iter_021/idea_02/explorer_01.md`; `iterations/iter_021/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Finite priors give the product-closure relaxation, not the full infinite-class value
Status: proved by combining accepted product-closure formula with iteration 19 duality
Assumptions: Same fixed finite-grid reward-set setup as the abstract $\mathrm{ba}$ dual; finite-subclass values use the same admissible policy class restricted to finite $F\subset\Theta$.
Statement: If the dual is restricted to finitely supported ordinary priors,
$$
D_{\rm fin}
=
\sup_{\pi\in\Delta_{\rm fin}(\Theta)}
\left[\langle V,\pi\rangle-\sup_{c\in C}\langle c,\pi\rangle\right],
$$
then
$$
D_{\rm fin}
=
\sup_{F\Subset\Theta}\mathcal R_G(F)
=
\inf_{c\in\overline C^{pt}}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta).
$$
The full finitely additive dual equals the true value
$$
D_{ba}=\mathcal R_G(\Theta).
$$
Thus $D_{\rm fin}=D_{ba}$ exactly under a no-gap/product-closed condition, such as $C=\overline C^{pt}$.
Proof sketch: Finite-support priors live on some finite $F$, where the accepted finite-grid minimax/Bayes identity or finite reward-set duality gives the finite-subclass value. Taking the supremum over finite supports gives $\sup_F\mathcal R_G(F)$. The previously accepted finite-intersection lemma identifies this with the product-closure relaxed value. The abstract $\mathrm{ba}$ dual gives the true full-class value. Product closedness makes the two coincide.
Known gaps: This is value-level equality only. Under payoff-measure domination, product compactness/no-gap is currently proved for the completed prefix-kernel policy class; original Borel policies still need the bridge $C_{\rm Borel}=C_{L^\infty}$.
Source: `iterations/iter_019/idea_02/explorer_01.md`; `iterations/iter_019/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Single-account fractional-capital depletion
Status: proved for the displayed rule
Assumptions: Two-arm delayed-advantage abstraction; $D=1$; advantage $\Delta_t\in[-1,1]$; a single solvency capital $C_t$ is used both for fast safety and slow exposure; the rule plays $q_t=C_t/2$, capped to $[0,1]$, and updates capital by played realized advantage as in the solvency invariant.
Statement: The rule can have linear slow regret even for $D=1$.
Proof sketch: Run $N$ rounds with $\Delta_t=-1$. Each round roughly maps $C\mapsto C/2$, so $C\approx B2^{-N}$. Then run $2N$ rounds with $\Delta_t=+1$. Each positive round maps $C\mapsto 3C/2$ while $C<1$, so reaching constant exposure takes $\Theta(N)$ rounds. During this recovery window $q_t$ is tiny on many positive rounds, and $S_T-A_T=\sum_t(1-q_t)\Delta_t$ is $\Omega(N)$. Since $T=3N$ and $D=1$, this violates the desired $\tilde O(\sqrt T)$ slow-regret target for this rule.
Known gaps: This does not rule out reserve, restart, interval-tester, or other delayed wealth algorithms. The exact off-by-one timing should match the convention that feedback from $u\le t-D$ is processed before choosing $q_t$.
Source: `iterations/iter_022/idea_01/explorer_01.md`; `iterations/iter_022/idea_01/critic_01_on_explorer_01.md`.

## Lemma: Block-local limited-leakage Bayes gap
Status: proved for the abstract block-local model
Assumptions: Equal-prior $\theta\in\{+,-\}$, two fixed quotes, $N$ independent observation blocks $Z_j\sim Q_\theta$, $D$ unresolved quote rounds per block, and an exact per-round reward separation $\gamma$ between the type-correct and type-wrong quotes. Observations from block $j$ arrive only after its $D$ quote rounds.
Statement:
$$
\Psi_{\rm loc}
=D\gamma\sum_{j=0}^{N-1}\mathbb E_{\bar Q}\min(p_j,1-p_j),
\qquad
p_j=\Pr(\theta=+\mid Z_{1:j}).
$$
Moreover,
$$
\mathbb E_{\bar Q}\min(p_j,1-p_j)
=\frac12(1-\operatorname{TV}(Q_+^j,Q_-^j)).
$$
If $D_{\rm KL}(Q_+^j\Vert Q_-^j)\le j\kappa$, then Pinsker gives a lower bound of order
$$
D\gamma\min\{N,1/\kappa\}.
$$
Proof sketch: At posterior $p$, the Bayes comparator term is the posterior average of the type-specific optima, while the learner's best posterior-mixture quote loses exactly $\gamma\min(p,1-p)$. Summing over $D$ rounds and over blocks gives the first formula. The Bayes error/TV identity gives the second. Pinsker controls TV for $j\lesssim1/\kappa$, and those blocks each contribute a constant fraction of $D\gamma$.
Known gaps: This is a diagnostic abstraction, not a market construction. KL direction, absolute continuity, and constants should be stated in final form.
Source: `iterations/iter_022/idea_02/explorer_01.md`; `iterations/iter_022/idea_02/critic_01_on_explorer_01.md`.

## Lemma: Same-level repeated market blocks have coupled future-hit reward curves
Status: proved algebraically
Assumptions: A repeated-block delayed-market construction where a quote $a$ posted in the current block remains live for $n$ future terminal draws, each exceeding $a$ with probability $r_{\theta,a}$, independently conditional on $\theta$.
Statement: The finite-grid reward curve for a quote with $n$ remaining terminal opportunities is
$$
g_{\theta,n}(a)=a\left[1-(1-r_{\theta,a})^n\right].
$$
Therefore the block-local curve $a r_{\theta,a}$ is valid only when $n=1$ or when cross-block hits have been prevented by an additional localization mechanism.
Proof sketch: A quote trades by horizon iff at least one of the $n$ remaining terminal prices exceeds $a$. Conditional independence gives hit probability $1-(1-r_{\theta,a})^n$.
Known gaps: This does not by itself rule out all lower-bound constructions. It identifies the exact curve that must be used for same-level market Bayes computations and tail-envelope audits.
Source: `iterations/iter_022/idea_02/explorer_01.md`; `iterations/iter_022/idea_02/critic_01_on_explorer_01.md`.
