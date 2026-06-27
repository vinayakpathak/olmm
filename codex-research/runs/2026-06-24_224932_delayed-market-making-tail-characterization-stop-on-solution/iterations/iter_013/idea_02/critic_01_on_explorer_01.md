## Summary

The explorer’s market reduction is mostly sound, but only as a conditional reduction. The adaptive truncation theorem is not proved because it depends entirely on an unproved heterogeneous-delay full-information experts lemma with comparator-specific delay dependence:
$$
B_T(H)\stackrel{?}{\lesssim}\sqrt{T(H+1)\log(K|\mathcal H|)}.
$$
Existing accepted delayed-Hedge machinery only gives fixed-$H$ or max-delay style bounds, which would destroy adaptation. So the main result is worth pursuing, but not currently a theorem.

## Issue List

1. **Fatal gap for an unconditional theorem:** The heterogeneous-delay experts lemma is missing. A standard max-delay reduction over all $(H,b)$ arms pays $H_{\max}$, not comparator $H$, so it cannot imply the claimed adaptive rate.

2. **Missing assumption:** The expert problem needs a precise component-wise feedback model: $y_t(H,b)$ is revealed after observing $P_{t+H}$, before the relevant decision, with post-horizon conventions specified.

3. **Plausible but incomplete:** The conditional market proof is basically correct once the expert oracle is assumed. It still needs the quantifiers written carefully: pathwise expert regret first, then expectation over the exogenous law.

4. **Missing assumption / wording issue:** “Best $H$ in hindsight” should mean an oracle analysis choice minimizing $\delta_T^P(H)+B_T(H)$, not a realized-path hindsight truncation unless that stronger claim is separately proved.

5. **Plausible but incomplete:** Dyadic reduction uses monotonicity of $\delta_T(H)$, which is valid, but the set should include $T$ or a ceiling dyad so edge cases near $T$ are covered.

6. **Unsupported citation risk:** Standard delayed-feedback references and the accepted $H+1$-residue Hedge lemma do not supply the comparator-specific heterogeneous-delay bound. They should not be cited as proving it.

7. **Worth pursuing:** The one-level $(H,b)$ construction is cleaner than nested base/meta aggregation and avoids double-counting base plus meta regret, provided the missing expert lemma can be proved.

## Counterexamples Or Stress Tests

- **Max-delay contamination:** Include arms with $H=T$. Naive delayed Hedge over all $(H,b)$ arms gives roughly $\sqrt{T^2\log(K\log T)}$, i.e. essentially linear, even when the optimal $H$ is small.

- **Fast-vs-slow expert trap:** Test two experts: one delay $0$, one delay $D$. Let the slow expert look good for a long prefix and then become bad. Any claimed bound must show the learner does not overplay stale slow rewards and incur regret $D$ against the fast expert. This does not refute the lemma, but it is the first lower-bound stress test.

- **Duplicate quote stress:** Arms $(H,b)$ and $(H',b)$ produce the same actual market quote but different surrogate rewards. The analysis survives because true reward dominates the chosen surrogate, but the expert algorithm may waste probability across duplicates unless designed carefully.

- **Dyadic edge:** If powers stop below $T$, an optimal integer $H$ near $T$ may not have a larger dyadic comparator. Add $T$ explicitly.

## Literature Or Known-Result Conflicts

No direct conflict with the local accepted results. The accepted fixed-window theorem remains valid.

The gap is that known delayed full-information tools in the notes give either fixed $H$ residue bounds or max/total-delay bounds. They do not currently give arm-specific regret scaling with the comparator arm’s delay.

## What Survives The Critique

The conditional lemma survives:
$$
R_T^P
\le
T/K+
\min_{H\in\mathcal H}
\{\delta_T^P(H)+B_T(H)\}
$$

provided the expert oracle inequality holds for every arm $(H,b)$. Public exogeneity is enough to reconstruct all surrogate rewards $r_t^H(b)$, and $\delta_T(H)$ is monotone, so dyadic windows should only cost constants.

## Recommended Next Checks

1. Prove or refute the heterogeneous-delay experts lemma in the abstract two-expert case first.

2. Try arm-specific FTRL/Hedge with delay-dependent learning rates and explicit stale-reward correction terms.

3. If the arbitrary heterogeneous-delay lemma is false, exploit the market-specific nesting $r_t^H(b)\le r_t^{H'}(b)$ for $H\le H'$.

4. State the adaptive theorem as conditional until the expert lemma is proved. Then separately optimize $K$ and dyadic priors/log factors.