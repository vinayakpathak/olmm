## Summary

The explorer’s main algebraic claim survives critique. The pointwise weighted inequality is correct, the coefficient
\[
\alpha(c_0,c_1)=\frac{c_0(c_1-c_0)}{c_1}
\]
is correct, and the optimization gives the accepted \(1/4\) constant at \((c_0,c_1)=(1/2,1)\).

No fatal gap found. The main risks are formal: the lemma only applies under indistinguishability of the first \(N\) actions, `sup` comparators, and the existing universal/process-unaware or horizon-oblivious quantifiers. It still says nothing instance-wise about tail necessity.

## Issue List

- **Missing assumption:** The finite two-threshold lemma must state why the first \(N\) actions have the same joint law under both continuations. This holds for a process-unaware learner seeing \(0^N\), but fails if the learner is told the continuation or knows the deterministic process.

- **Missing assumption:** Regret must be against comparator suprema. With deterministic terminal price \(c\), strict crossing \(P>a\) means the best fixed quote is not attained at \(a=c\). Any `max` version is false without extra no-atom/attainment assumptions.

- **Plausible but incomplete:** The sharpness claim is right for the finite two-continuation game, but should be stated with \(\eta<\min\{c_0,c_1-c_0\}\) and as a finite-block minimax upper construction, not as sharpness of the concatenated lower bounds.

- **Worth pursuing:** The same-path \(O(1)\) term can likely be removed under `sup`. At horizon after \(c_1\), the fixed comparator near \(c_1\) also earns on the intermediate \(c_0\)-time quote, while the learner’s intermediate reward is at most \(c_1\). This gives exact cancellation in the lower bound.

- **Missing assumption:** The old-prefix cap \(M_i\) relies on each quote paying at most once and payoff bounded by \(1\). This is true in the model, but the polished corollaries should state it explicitly.

- **Plausible but incomplete:** “Lifts cleanly” is only correct with quantifier caveats: universal block lower bound is \(\forall\pi\,\exists P\), process-unaware/minimax; same-path lower bound is for one horizon-oblivious policy. Neither applies to horizon-aware process-law oracle policies.

- **Unsupported citation:** None. The explorer did not rely on external citations.

## Counterexamples Or Stress Tests

- **Process-aware finite block:** If the learner knows whether the terminal price is \(c_0\) or \(c_1\), it quotes just below that threshold and gets \(o(N)\) regret. This breaks any instance-wise reading.

- **Horizon-aware same path:** On \(0^N,c_0,c_1\), a horizon-aware policy can quote near \(c_0\) for horizon \(N+1\) and near \(c_1\) for horizon \(N+2\). The prefix conflict disappears.

- **`max` comparator stress test:** Deterministic terminal threshold \(c\) has payoff supremum \(c\), but no maximizing action because \(a=c\) does not trade.

- **Degenerate thresholds:** As \(c_0\downarrow0\) or \(c_0\uparrow c_1\), \(\alpha(c_0,c_1)\to0\). The proof remains valid, but the lower bound becomes vacuous.

## Literature Or Known-Result Conflicts

No conflict found. This is an elementary refinement of the accepted block lower bounds in the run notes, not a delayed-feedback literature claim. It should not be presented as a tail characterization or as contradicting the oracle-collapse and sparse-spike counterexamples.

## What Survives The Critique

The core inequality survives:
\[
\lambda_0 a1\{a<c_0\}+\lambda_1 a1\{a<c_1\}\le c_0,
\quad
\lambda_0=\frac{c_1-c_0}{c_1},\quad
\lambda_1=\frac{c_0}{c_1}.
\]

The resulting weighted-regret lower bound survives:
\[
\max\{R_{c_0},R_{c_1}\}\ge N\frac{c_0(c_1-c_0)}{c_1}.
\]

The optimization survives:
\[
\max_{0<c_0<c_1\le1}\alpha(c_0,c_1)=1/4.
\]

The universal and same-path concatenations survive under their accepted quantifier regimes.

## Bibliography Candidates

None. No new source is needed for this internal algebraic proof refinement.

## Recommended Next Checks

1. Write a formal “General Two-Threshold Block Lemma” using joint-law indistinguishability of zero-block actions.
2. Prove the same-path corollary with exact intermediate-round cancellation and no \(O(1)\) term, using `sup`.
3. Add a short sharpness remark for the finite block only.
4. In every corollary, state explicitly: process-unaware universal lower bound, or process-aware but horizon-oblivious same-path lower bound.