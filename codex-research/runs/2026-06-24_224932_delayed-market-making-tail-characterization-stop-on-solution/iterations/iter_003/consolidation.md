## Accepted Progress

- Promoted the posterior Bayes-gap lower-bound certificate as the right lower-bound framework for unknown exogenous classes, with explicit measurability and exogeneity caveats.
- Promoted the identical-prefix hidden-terminal lemma as theorem-ready when later rewards are controlled.
- Accepted the $q$-scaled hidden-terminal atom: minimax regret $\ge qD/8$, with absorbing-extension tail/truncation calculations $\beta(h)=q$ for $h<D$ and $\Delta,\delta \asymp q(D-H)$.

## Candidate Routes

- Write final theorem statements for the known-law oracle, $\delta_T(H)$ upper theorem, Bayes-gap lower certificate, and $q$-scaled atom.
- For rate matching, pursue multi-scale or limited-leakage lower bounds, likely via Le Cam/Fano-style indistinguishability.

## Refuted Or Weakened Claims

- The $q$-scaled one-block atom does not match power-tail upper rates; under $B(h)=h^{-\alpha}$, it gives only $\Omega(D^{1-\alpha})$.
- Claims about $\beta(h)=q$ require either finite-horizon $\beta_T$ or explicit absorbing post-horizon extension.
- The Bayes-gap modulus is not a clean scalar iff characterization yet; in full generality it is close to the minimax value.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Prove the posterior Bayes-gap lemma in final notation, especially what $\mathcal I_t$ contains.
2. Write the $q$-scaled atom as a formal finite-horizon theorem.
3. Investigate multi-scale or limited-leakage constructions for matching power-tail lower rates.
4. Keep anytime and action-dependent models separate from the exogenous unknown-class theorem.