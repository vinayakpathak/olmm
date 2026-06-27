## Summary

The assigned idea is viable as a referee-style **partial theorem package**, not as a full scalar tail characterization. The clean proof strategy is:

1. Prove the finite-$\Theta$, finite-grid $G$ minimax/Bayes identity.
2. Add the $T/K$ grid-to-continuum minimax comparison.
3. Extend finite-grid values to infinite classes only through a product-closure/no-gap hypothesis.
4. Use payoff-weighted reward-measure domination as a sufficient no-gap condition.
5. State original Borel-policy conclusions only after the exact common Borel seed/state policy model and Borel-version lemmas are fixed.

The strongest safe headline is: for public exogenous finite classes, and for product-closed or payoff-measure dominated finite-grid infinite classes, sublinear upper regret is characterized by a least-favorable finite-grid Bayes predictability value. This is a class-level minimax value characterization, not a tail-profile iff.

## Concrete Progress

A proof-order that should survive referee scrutiny is:

**Theorem A: finite-grid finite-class identity.**  
For finite $\Theta$, finite $G$, public exogenous prices, randomized measurable grid policies, and
$$
V_\theta^G=\max_{a\in G}\sum_{t=1}^T\mathbb E_\theta r_t(a),
$$
define
$$
\Psi_G(\pi)
=
\sum_\theta\pi_\theta V_\theta^G
-
\sum_t\mathbb E_{\bar P_\pi}\max_{a\in G}
a\,\bar P_\pi(M_t>a\mid P_{1:t}).
$$
Then
$$
\inf_A\sup_{\theta\in\Theta}(V_\theta^G-L_\theta(A))
=
\sup_{\pi\in\Delta(\Theta)}\Psi_G(\pi).
$$

Proof route: attainable reward set $C\subset\mathbb R^\Theta$, finite-dimensional minimax on $\overline C$, then fixed-prior Bayes myopic optimality.

**Theorem B: grid-to-continuum comparison.**  
For arbitrary public-exogenous $\Theta$,
$$
|\mathcal R_{[0,1]}(\Theta,T)-\mathcal R_{G_K}(\Theta,T)|\le T/K.
$$
Thus for finite $\Theta_T$, $G_T=\{0,1/T,\ldots,(T-1)/T\}$,
$$
\left|(\mathcal R_T^{[0,1]})_+
-
\left(\sup_{\pi\in\Delta(\Theta_T)}\Psi_{G_T}(\pi)\right)_+
\right|\le1.
$$

**Theorem C: product-closure infinite-class extension.**  
For fixed finite $T,G$, finite-subclass Bayes values characterize only the product-closure relaxation:
$$
\Phi_G(\Theta)
=
\inf_{c\in\overline C^{pt}}\sup_\theta(V_\theta^G-c_\theta).
$$
If $C$ is product closed, then
$$
\mathcal R_G(\Theta)
=
\sup_{F\Subset\Theta}\sup_{\pi\in\Delta(F)}\Psi_{G,F}(\pi).
$$

**Theorem D: payoff-measure domination no-gap.**  
If for each $t$ there is $\lambda_t$ such that
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[1\{P_{1:t}\in B\}a1\{M_t>a\}]\ll\lambda_t
$$
for all $\theta,a\in G$, then the completed $L^\infty(\lambda_t;\Delta(G))$ prefix-kernel attainable set is product compact, so Theorem C has no gap.

## Claims Or Lemmas

- The finite-grid finite-class identity appears fully provable with existing lemmas.
- The positive-part finite-class continuum equivalence follows cleanly from grid comparison.
- The infinite-class finite-subclass formula is safe only as a product-closure relaxed value unless $C$ is product closed.
- Payoff-weighted reward-measure domination is the right compactness hypothesis; prefix-law domination is sufficient but unnecessarily strong.
- Original Borel private-randomized policies can be included only under the explicit common Borel seed/state model, plus standard randomization and Borel-version facts.

## Proof Attempts

The key proof strategy is to avoid infinite-dimensional minimax in the finite-class theorem. For finite $\Theta$, define
$$
C=\{(L_\theta(A))_{\theta\in\Theta}: A\text{ admissible}\}.
$$
Randomized policies make $C$ convex. Since $C$ is bounded, $\overline C$ is compact convex. Then
$$
\max_\theta(V_\theta^G-x_\theta)
=
\max_{\pi\in\Delta(\Theta)}\sum_\theta\pi_\theta(V_\theta^G-x_\theta),
$$
so finite-dimensional minimax gives the dual. The support function is exactly the fixed-prior Bayes reward, and the Bayes-myopic lemma identifies it with the conditional $\Psi_G$ envelope.

For the dominated infinite-class proof, use weak-* compactness of
$$
Q_t=L^\infty(\lambda_t;\Delta(G)).
$$
Reward coordinates are weak-* continuous because they are pairings with $L^1$ densities $f^\theta_{t,a}$. The image reward set is compact in $[0,T]^\Theta$, hence product closed.

## Gaps And Risks

The main risk is overclaiming. This package does not solve arbitrary infinite classes, scalar tail iff characterization, or matching power-tail rates.

Specific proof obligations before calling the original-policy theorem referee-ready:

- State one admissible policy class and use it consistently.
- Cite/prove the standard randomization lemma for Borel stochastic kernels if policies are not seed maps.
- Cite/prove completed-measurable-to-Borel version theorem on standard Borel spaces.
- Keep reward-vector preservation separate from pathwise behavioral equivalence.
- Keep continuum quantities outside exact $\Psi_G$ identities; continuum enters only via $T/K$ discretization.
- Use signed minimax values for equalities and positive parts for learnability.

## Counterexamples Or Obstructions

Relevant obstructions already in memory:

- Grid/continuum mismatch: finite-grid identities are false if $V_\theta$ or the Bayes envelope uses continuum quotes.
- Deterministic policies fail minimax/Bayes identities; randomized policies are essential.
- Non-Borel label construction shows finite-subclass Bayes values need not characterize arbitrary infinite classes.
- Hidden/labeled q-scaled pair shows per-world tail/truncation profiles cannot characterize unknown-class learnability.
- Policy-alignment stress tests show the theorem fails or changes with action-dependent prices, private side signals, law-correlated randomness, or nonadditive rewards.

## Sources Consulted

Read the assigned idea file and all requested local memory files:

- `problem.md`
- `working_notes/canonical_summary.md`
- `working_notes/claim_ledger.md`
- `working_notes/lemma_bank.md`
- `working_notes/failed_attempts.md`
- `working_notes/counterexamples.md`
- `working_notes/literature_map.md`
- `working_notes/promising_directions.md`
- `working_notes/iteration_summaries.md`
- `iterations/iter_016/idea_01/idea.md`

No web sources consulted.

## Recommended Next Steps

1. Write the theorem package in the order A-D above.
2. Put all exact identities on finite $G$; add continuum only as a corollary with $T/K$ error.
3. Split the dominated theorem into completed-kernel version and original-policy alignment version.
4. Add a short “not claimed” paragraph: no scalar tail iff, no arbitrary infinite-class theorem, no matching power-tail lower rates.
5. Have the next critic audit only the policy-class alignment and null-set conventions.