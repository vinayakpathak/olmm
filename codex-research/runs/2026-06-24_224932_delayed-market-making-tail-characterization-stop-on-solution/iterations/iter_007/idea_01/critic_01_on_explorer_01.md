## Summary

The explorer’s main positive direction looks worth pursuing: finite-subclass value equals the minimax value over the product-closure of the attainable reward set, and product-closedness of that set gives no infinite-class gap. The dominated-prefix compactness argument is plausible and probably correct, but it is not yet theorem-ready. The main missing work is not functional analysis; it is model hygiene: admissible policy class, measurability, reduction to public-prefix kernels, and signed/positive-part regret conventions.

No fatal obstruction found for the dominated-prefix no-gap theorem under fixed finite $T$, fixed finite grid $G$, public exogenous prices, and suitably measurable randomized policies.

## Issue List

1. **Plausible but incomplete: policy-to-kernel reduction.**  
   The report writes policies as kernels $q_{t,a}(P_{1:t})$. This needs proof. A general randomized policy may use private memory and past actions, but because prices are exogenous and rewards are additive, only the conditional marginal law of $a_t$ given $P_{1:t}$ matters. This reduction should be stated and proved.

2. **Missing assumption: admissible measurability class.**  
   The compactness proof uses $L^\infty(\lambda_t;\Delta(G))$ kernels. If admissible policies are required to be Borel kernels, one must argue that weak-* limit kernels have admissible Borel versions, at least up to $\lambda_t$-null sets. Common domination makes null-set identification safe, but this must be explicit.

3. **Plausible but incomplete: weak-* compactness details.**  
   The set $L^\infty(\lambda_t;\Delta(G))$ is weak-* compact only after checking positivity and simplex constraints are weak-* closed. This is standard, but should be included. Sigma-finiteness of $\lambda_t$ is also relevant.

4. **Missing assumption: payoff density representation.**  
   Prefix domination $P^\theta_{1:t}\ll\lambda_t$ does imply
$$
   \mathbb E_\theta[q_{t,a}(P_{1:t})a\mathbf{1}\{M_t>a\}]
   =\int q_{t,a}(h)f^\theta_{t,a}(h)d\lambda_t(h),
$$
   because the weighted prefix measure is dominated by $P^\theta_{1:t}$. But this implication should be written; it is the bridge from the market model to weak-* continuity.

5. **Missing assumption: signed versus upper regret.**  
   The equality should be stated for the signed grid minimax value. For learnability, the accepted convention is positive part:
$$
   (\mathcal R_G(\Theta))_+.
$$
   Adaptive policies can beat the best fixed quote, so this convention matters.

6. **Unsupported as market evidence: abstract finite-support gap.**  
   The example $C=\{c:\operatorname{supp}(c)<\infty\}\subset[0,1]^\mathbb{N}$ correctly illustrates a closure gap, but it is not shown to be an attainable reward set of this market. Keep it as functional-analytic intuition, not as a market counterexample.

7. **Missing assumption / worth pursuing: non-Borel label gap.**  
   The non-Borel construction is credible under Borel-policy restrictions. But if policies are allowed to be arbitrary functions, or measurable under each Dirac completion, the gap disappears. To make it valid, choose $A$ outside the admissible policy sigma-field and state the policy class exactly.

8. **Plausible but incomplete: continuum passage.**  
   The theorem is fixed-grid. Any claim for $[0,1]$ must separately invoke the accepted grid-to-continuum bound $|\mathcal R_{[0,1]}-\mathcal R_{G_K}|\le T/K$. Do not state an exact continuum $\Psi$ formula.

## Counterexamples Or Stress Tests

- **Non-Borel label stress test:** with $T=2$, $G=\{1/3,2/3\}$, $P_1=x$, and $P_2=1$ on $A$, $P_2=1/2$ off $A$, finite subclasses have value $0$. For Borel policies, full value is $1/6$ if $A$ is non-Borel: regret $<1/6$ would require a Borel separator for $A$.

- **Borel version sanity check:** if $A$ is Borel in the same construction, full value is $0$. So nondomination alone is not the obstruction; the obstruction is measurability/closedness.

- **Grid/continuum mismatch:** finite-grid identities must use grid comparator $V_\theta^G$ and grid Bayes envelope. Continuum comparator values can differ by $\Theta(1)$ on small examples.

## Literature Or Known-Result Conflicts

No conflict with the current ledger. The explorer’s finite-intersection/product-closure route is consistent with classical risk-set compactness ideas and avoids the $ba(\Theta)$ finitely additive prior issue that appears from the raw $\ell^\infty$ dual.

The dominated-prefix assumption is strong and excludes uncountable deterministic path classes, but that is a scope limitation, not a contradiction.

## What Survives The Critique

- Lemma 1 is essentially correct:
$$
  \Phi_G(\Theta)=\inf_{c\in\overline C^{pt}}\sup_\theta(V_\theta^G-c_\theta).
$$
  This follows by finite-intersection compactness in $[0,T]^\Theta$.

- Lemma 2 is correct: if $C$ is product closed, then $\mathcal R_G(\Theta)=\Phi_G(\Theta)$.

- Lemma 3 is a strong theorem candidate under common prefix domination, finite $G$, finite $T$, public exogenous prices, and a cleaned-up measurable-policy setup.

## Recommended Next Checks

1. Write the formal dominated-prefix theorem with exact policy measurability assumptions.
2. Prove the reduction from arbitrary randomized policies to public-prefix marginal kernels.
3. Prove weak-* compactness of the simplex-valued kernel set and continuity of all reward coordinates.
4. Formalize the non-Borel counterexample only as a pathological measurability gap.
5. Then add the grid-to-continuum corollary with the existing $T/K$ error and positive-part convention.