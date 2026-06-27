## Summary

The explorer’s main finite-block insight looks sound and worth pursuing: the deterministic path \(0^N,1/2,1\) creates a real same-process, two-horizon incompatibility. It refutes a generic horizon-oblivious “oracle collapse” if extended through dominant concatenated blocks.

The main weakness is not the finite proof, but the infinite corollary: it still needs a careful prefix-regret decomposition because regret is against one fixed comparator over the whole prefix, not a blockwise comparator. This looks fixable under \(M_i=o(N_i)\), but it is not yet a proof.

## Issue List

- **Worth pursuing:** Finite same-path two-horizon lemma.  
  The core inequality
  \[
  A1\{A<1/2\}+A1\{A<1\}\le 1
  \]
  is exactly the right obstruction. It shows early quotes cannot simultaneously optimize the prefix ending at \(1/2\) and the prefix ending at \(1\).

- **Plausible but incomplete:** Infinite concatenation.  
  The claim for blocks \(0^{N_i},1/2,1\) needs a full argument with block start times, horizons \(T_i^0,T_i^1\), previous-prefix reward bounded by \(M_i\), and \(M_i=o(N_i)\). The intended bound should look like
  \[
  \max\{R_{T_i^0},R_{T_i^1}\}\ge N_i/4-o(N_i).
  \]

- **Missing assumption:** Definition of horizon-oblivious policy.  
  Must state that the policy may know the full process law/path and current time/history, but cannot take the evaluation horizon \(T\) as input.

- **Plausible but incomplete:** Endpoint accounting.  
  At \(T=N+2\), the fixed comparator with \(a=1-\eta\) also earns on the quote posted at \(N+1\), while the learner’s \(A_{N+1}\) can contribute at most \(1\). This is only \(O(1)\), but should be explicit.

- **False/imprecise but harmless:** Comparator value at \(T=N+2\).  
  The report says the comparator value is \(N\); with actions at \(t=1,\dots,N+1\), the supremum is \((N+1)\) as \(a\uparrow1\). The lower bound undercounts, so the conclusion survives.

- **Missing assumption:** Single scalar quote per round.  
  The obstruction is model-specific. If a richer action allowed splitting capital across multiple quotes in one round, this proof would not apply without reformulating rewards and constraints.

## Counterexamples Or Stress Tests

- Sparse vanishing spikes still kill \(\beta\)-necessity even in the horizon-oblivious regime: the always-zero policy is anytime and has \(O(1)\) regret while \(\beta(h)=1\) for all \(h\).

- The finite block proof survives randomized learners by linearity. For first \(N\) actions,
  \[
  G_0+G_1
  =
  \mathbb E\sum_{t\le N}\bigl(A_t1\{A_t<1/2\}+A_t1\{A_t<1\}\bigr)
  \le N.
  \]
  Hence, using epsilon comparators,
  \[
  R_{N+1}+R_{N+2}\ge N(1/2-2\eta)-O(1),
  \]
  so one regret is at least \(N(1/4-\eta)-O(1)\).

- For the concatenated process, the key stress test is whether previous rewards can mask current-block regret. They can cost at most \(M_i\) per evaluated prefix, so dominance \(M_i=o(N_i)\) should preserve the lower bound.

## Literature Or Known-Result Conflicts

No direct conflict found. Delayed-feedback literature supports sufficiency-style reductions, not this necessity claim.

The Blackwell/no-regret citation is valid but not directly supportive of the lower bound. Approachability/calibration cannot overcome an infeasible pair of prefix constraints; it could only help if the simultaneous-horizon target set were feasible.

Strongly adaptive/adaptive regret literature is adjacent because it studies simultaneous guarantees over intervals/prefixes, but those results assume ordinary per-round losses. They do not contradict this construction, where horizon censoring changes which past quotes are rewarded at nearby prefixes.

## What Survives The Critique

- The finite deterministic \(0^N,1/2,1\) lower bound is essentially correct after epsilon and endpoint cleanup.

- The claim “known-law, horizon-oblivious learnability is nontrivial” survives.

- The claim “\(\beta\)-tail necessity is still false” also survives, because sparse vanishing spikes provide an anytime counterexample.

- The proposed replacement intuition, “prefix compatibility” rather than raw delay tails, is a good direction.

## Bibliography Candidates

- Jacob Abernethy, Peter L. Bartlett, Elad Hazan. “Blackwell Approachability and No-Regret Learning are Equivalent.” COLT 2011, PMLR 19:27-46. https://proceedings.mlr.press/v19/abernethy11b.html. Relevance: possible framework for simultaneous constraint feasibility, but not direct support for the block lower bound.

- Amit Daniely, Alon Gonen, Shai Shalev-Shwartz. “Strongly Adaptive Online Learning.” ICML 2015, PMLR 37:1405-1411. https://proceedings.mlr.press/v37/daniely15.html. Relevance: background on guarantees over all intervals/prefixes; useful contrast with horizon-censored quote rewards.

- Elad Hazan, C. Seshadhri. “Efficient Learning Algorithms for Changing Environments.” ICML 2009, pp. 393-400. DOI: https://doi.org/10.1145/1553374.1553425. Relevance: adaptive regret background for simultaneous-prefix/interval quantifiers.

## Recommended Next Checks

1. Write the finite two-horizon lemma formally with \(\eta\)-comparators and all \(O(1)\) endpoint terms.

2. Prove the concatenated theorem with \(M_i=o(N_i)\), using total-prefix regret rather than informal block regret.

3. Add this as a candidate claim distinct from \(\beta\)-necessity: failure comes from incompatible optimal fixed quotes across nearby prefixes, not merely long delays.