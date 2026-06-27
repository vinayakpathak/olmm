## Summary

The idea is viable as a proof-completion target. Under the exact finite-grid, public-exogenous, common Borel seed/state policy model, the bridge should prove
$$
C_{\rm Borel}=C_{L^\infty}
$$
as expected reward-coordinate sets. This would upgrade the payoff-measure dominated no-gap theorem from the relaxed completed-kernel model to the original common Borel policy model.

It is not a new tail characterization and should not be presented as solving scalar-tail necessity, matching power-tail lower rates, arbitrary nondominated infinite classes, action-dependent markets, or continuum-quote selector issues.

## Concrete Progress

A clean theorem target is:

Fix finite $T$, finite grid $G$, public exogenous laws $P^\theta$, and
$$
M_t=\max_{t<s\le T}P_s.
$$
For $a\in G$, define payoff-weighted prefix measures
$$
\mu^\theta_{t,a}(B)
=\mathbb E_\theta[\mathbf{1}\{P_{1:t}\in B\}\,a\mathbf{1}\{M_t>a\}].
$$
Assume $\mu^\theta_{t,a}\ll\lambda_t$ for sigma-finite Borel $\lambda_t$. Then common Borel finite-grid policies and completed prefix kernels $q_t\in L^\infty(\lambda_t;\Delta(G))$ generate the same reward vectors:
$$
L_\theta=\sum_{t,a}\int q_{t,a}\,d\mu^\theta_{t,a}.
$$

The key proof-strategy point: no pathwise or joint-law equivalence is needed. Additive exogenous rewards only depend on one-time action marginals conditional on $P_{1:t}$.

## Claims Or Lemmas

1. Forward inclusion:
$$
C_{\rm Borel}\subseteq C_{L^\infty}
$$
should be provable by seed/prefix induction plus Fubini.

2. Reverse inclusion:
$$
C_{L^\infty}\subseteq C_{\rm Borel}
$$
should be provable by Borelizing completed kernels, repairing simplex failures on null sets, and implementing finite-action kernels with fresh uniforms.

3. Compactness transfer:
once equality holds, the completed-kernel weak-* compactness theorem transfers product compactness and no-gap to the Borel policy reward set.

4. Scope lemma:
the equality is only reward-coordinate equality. It is not behavioral, pathwise, high-probability, or feedback-state equivalence.

## Proof Attempts

Forward route:
Let a common Borel seed/state policy use independent uniforms $U_t$, standard Borel internal state, and feedback reconstructible from public prices and past actions. Inductively,
$$
a_t=\alpha_t(P_{1:t},U_{1:t})
$$
for a Borel $\alpha_t$. Then
$$
q_{t,a}(h)=\Pr_U(\alpha_t(h,U_{1:t})=a)
$$
is Borel by section-measurability. Since $U$ is independent of $P^\theta$,
$$
\mathbb E_{\theta,U}\mathbf{1}\{\alpha_t(P_{1:t},U)=a\}a\mathbf{1}\{M_t>a\}
=
\int q_{t,a}\,d\mu^\theta_{t,a}.
$$

Reverse route:
Given $q_t\in L^\infty(\lambda_t;\Delta(G))$, choose Borel coordinate versions equal $\lambda_t$-a.e. Repair the Borel null set where coordinates leave $\Delta(G)$ by assigning a fixed grid action. Because $\mu^\theta_{t,a}\ll\lambda_t$, reward integrals are unchanged. Implement the Borel kernel with cumulative intervals and a fresh uniform $U_t$.

## Gaps And Risks

The final proof still needs explicit citations or local proofs for: completed-measurable-to-Borel versions on standard Borel spaces, Borel section integrals, finite-action randomization, $L^\infty=(L^1)^*$, and weak-* closed simplex constraints.

The theorem must define policies as common Borel seed/state rules, or else cite a randomization lemma before starting from stochastic kernels. Law-by-law a.s. policy representatives are not enough.

Payoff domination does not imply prefix-law domination. Borelization may change behavior on prefix histories with positive prefix-law mass, so the conclusion must stay at expected additive reward coordinates.

## Counterexamples Or Obstructions

The completed-kernel null-set stress test is the main wording obstruction: behavior may change on $\lambda_t$-null sets charged by prefix laws, but payoff integrals are unchanged.

The non-Borel label example remains an obstruction to arbitrary infinite-class finite-subclass claims without no-gap assumptions.

Action-dependent prices, private side information, law-correlated randomization, or nonadditive rewards would break the marginal-kernel reduction.

## Sources Consulted

No web sources consulted. Local sources: `problem.md`, all listed `working_notes/*.md`, and `iterations/iter_021/idea_01/idea.md`.

## Recommended Next Steps

Write the bridge as two lemmas plus a compactness corollary. Keep the policy model first, then prove forward inclusion, reverse inclusion, and only then state the payoff-measure dominated no-gap theorem for original Borel policies. Include a clear “reward-coordinate only” caveat in the theorem statement.