## Summary

The core non-Borel construction is sound under the explicit restrictions: fixed finite grid $G=\{1/3,2/3\}$, public exogenous deterministic laws, and Borel randomized public-prefix policies. The linear amplification from the existing $T=2$ stress test also checks out: full-class value is $(T-1)/6$, while every finite subclass has value $0$.

But it is still a measurability pathology, not a natural infinite-class gap. It does not prove that natural standard-Borel nondominated classes cannot exhibit a gap; it only rules out a few easy templates.

## Issue List

- **Plausible but incomplete:** The claim that every Borel randomized policy induces Borel functions $q_t(x)$ needs a policy-model proof. It is immediate for public-prefix kernels $q_t(P_{1:t})$, but for general randomized policies with private memory/actions it needs an induction/reduction to public-prefix marginal kernels.

- **Missing assumption:** The finite-subclass value $0$ assumes the learner is allowed to know the finite subclass $F$ and choose a policy depending on $F$. This matches the existing finite-subclass modulus, but should be stated.

- **Worth pursuing but not new:** The construction is essentially the existing non-Borel label obstruction, amplified over $D=T-1$ identical payoff rounds. Useful, but not a new natural counterexample.

- **Missing assumption / scope issue:** The result is grid-only. In the continuum action problem, strict-threshold nonattainment and different comparator values appear; one must either keep the theorem grid-restricted or add the existing $T/K$ discretization comparison.

- **Unsupported citation/claim:** “The search suggests a real obstruction” for fully identifiable standard-Borel examples is too broad. The explorer proves only: Borel labels are easy in this specific deterministic-identifiable template; countable identifier sets are easy; dominated/TV-separable reward-measure classes are ruled out by prior no-gap results.

- **Plausible but incomplete:** The “natural countable unbounded hidden delay” aside has different quantifiers. If finite subclasses may depend on $T$, the hard delay-$D\approx T$ two-world subclass is itself finite, so this does not give small finite-subclass modulus at fixed $T$.

## Counterexamples Or Stress Tests

- If policies are arbitrary nonmeasurable maps, the full-class gap vanishes by playing $2/3$ on $A$ and $1/3$ on $A^c$.

- If $A$ is Borel, the same policy is Borel and full-class regret is $0$.

- If identifiers form a countable standard Borel set, every subset is Borel, so the same memorization argument works for the full class.

- The construction fails payoff-weighted reward-measure domination: it contains uncountably many singular Dirac-type reward measures, so it does not conflict with the iteration 8 no-gap theorem.

## Literature Or Known-Result Conflicts

No external conflict found. The example is consistent with the existing product-closure warning: finite-subclass values characterize the product-closure relaxation, not necessarily the true Borel-policy value.

It also aligns with the accepted domination/TV-separability no-gap theorem, because that hypothesis fails here.

## What Survives The Critique

Lemma 1 survives as a valid market-flavored, linear-in-$T$, non-Borel measurability obstruction under Borel public-prefix policies.

The constants check:
$$
R_A(x)=\frac{D-\sum_t q_t(x)}3,\qquad
R_{A^c}(x)=\frac{\sum_t q_t(x)}3.
$$
Thus any regret $<D/6$ separates $A$ by the Borel set $\{\bar q>1/2\}$, impossible. Constant $\bar q=1/2$ attains $D/6$.

## Recommended Next Checks

1. Write the exact admissible policy class and prove $q_t(x)$ is Borel for that class.
2. Record this as a strengthened version of the existing non-Borel obstruction, not as a natural counterexample.
3. Try next for a Borel, nondominated, non-identifiable class; the current identifiable/Borel templates are too easy.
4. Keep the countable unbounded-delay warning separate from fixed-$T$ product-closure gaps.