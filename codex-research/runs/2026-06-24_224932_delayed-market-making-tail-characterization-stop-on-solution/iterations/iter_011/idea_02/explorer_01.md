## Summary

The idea is viable under a tightly stated finite-grid, public-exogenous, expected-reward model. The right theorem should prove reward-vector equivalence, not pathwise equivalence: every original private-randomized Borel policy induces law-independent public-prefix marginals $q_t(P_{1:t})$, and these marginals preserve all expected reward coordinates $L_\theta$.

## Concrete Progress

A clean theorem target is:

Fix finite $T$, finite $G\subset[0,1]$, public exogenous laws $P^\theta$ on $[0,1]^T$, and $M_t=\max_{s>t}P_s$. Define
$$
\mu^\theta_{t,a}(B)=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}].
$$

An admissible original policy can be defined as Borel kernels
$$
\kappa_t(\cdot\mid p_{1:t},a_{1:t-1},\Phi_t)\in\Delta(G),
$$
where $\Phi_t$ is any delayed-fill feedback record, assumed Borel and deterministically reconstructible from public prices and past quotes. Private randomness is independent of $\theta$ and $P_{1:T}$.

Then every such policy $A$ induces Borel kernels $q_t:[0,1]^t\to\Delta(G)$, independent of $\theta$, such that
$$
L_\theta(A)
=
\sum_{t=1}^T\sum_{a\in G}\int q_{t,a}(h)\,d\mu^\theta_{t,a}(h)
\quad\forall\theta.
$$

Conversely, every Borel public-prefix kernel $q_t(P_{1:t})$ is implementable by an admissible policy using fresh uniforms. Thus original policies and Borel public-prefix kernels have the same attainable expected reward vectors.

## Claims Or Lemmas

1. **Seed realization.** Finite-action Borel kernels $\kappa_t$ can be sampled by Borel maps $\rho_t(\eta,u)$, $u\sim{\rm Unif}[0,1]$, via cumulative intervals.

2. **Seed induction.** Recursively,
$$
a_t=\alpha_t(P_{1:t},U_{1:t})
$$
for Borel $\alpha_t$. The step works because past actions and delayed feedback are Borel functions of $(P_{1:t},U_{1:t-1})$.

3. **Borel marginal kernel.**
$$
q_{t,a}(h)=\lambda^t\{u_{1:t}:\alpha_t(h,u_{1:t})=a\}
$$
is Borel by the standard section-integral theorem for Borel subsets of standard Borel products.

4. **Reward-coordinate equality.** Independence of $U$ from the whole exogenous price path gives
$$
\mathbb E_{\theta,A}[a_t\mathbf{1}\{M_t>a_t\}]
=
\sum_{a\in G}\mathbb E_\theta[q_{t,a}(P_{1:t})a\mathbf{1}\{M_t>a\}].
$$

## Proof Attempts

The proof should be written in this order:

1. Define the original policy class using Borel stochastic kernels on finite histories.
2. Realize each kernel using an iid uniform seed.
3. Prove $a_t=\alpha_t(P_{1:t},U_{1:t})$ by induction.
4. Integrate out $U$ to define $q_t$.
5. Apply Fubini/independence to get the $\mu^\theta_{t,a}$ formula.
6. Add the converse implementation of Borel $q_t$ by inverse-CDF sampling.

This is enough for forward original-policy alignment. To upgrade the completed $L^\infty$ no-gap theorem, add the existing Borelization lemma: under $\mu^\theta_{t,a}\ll\lambda_t$, completed $L^\infty(\lambda_t;\Delta(G))$ kernels have Borel representatives preserving all payoff-weighted integrals.

## Gaps And Risks

The theorem is only for finite $G$, public exogenous prices, full public observation, independent private randomness, and feedback determined by public prices plus past quotes.

It preserves expected additive reward vectors only. It does not preserve joint action laws, pathwise behavior, high-probability guarantees, or feedback-state laws on singular histories.

The completed-kernel upgrade still needs a precise standard-Borel version theorem or citation.

Continuum quotes require the separate $T/K$ grid comparison.

## Counterexamples Or Obstructions

Action-dependent prices break the reduction.

Private or censored feedback not determined by $P_{1:t}$ requires kernels on a larger observation history.

Law-correlated private randomness can make $q_t$ depend on $\theta$.

The non-Borel label construction remains the warning against arbitrary infinite-class no-gap claims without domination/product closure.

## Sources Consulted

No web search used. Consulted `problem.md`, all requested `working_notes/*.md` files, `iterations/iter_011/idea_02/idea.md`, and the relevant iteration 10 alignment reports.

## Recommended Next Steps

Write this as a formal “Original Policy Alignment” lemma package, then plug it into the payoff-weighted domination no-gap theorem. Keep the completed $L^\infty$ theorem and original Borel-policy theorem separate until the Borel-version lemma is explicitly cited or proved.