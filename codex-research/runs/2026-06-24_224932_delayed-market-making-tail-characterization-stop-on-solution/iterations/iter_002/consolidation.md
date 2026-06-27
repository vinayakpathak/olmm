## Accepted Progress
- Known finite-horizon exogenous laws are oracle-learnable: conditional grid maximization gives $R_T \le T/K$, so $O(1)$ regret with $K=T$.
- The $\delta_T(H)$ upper theorem survives, with the refined term
$$
  \sqrt{T(H+1)\log K}+T/K+\sup_P\delta_T^P(H).
$$
- The delayed-grid bound can be proved inline using $H+1$ residue-class Hedge instances.

## Candidate Routes
- Start final theorem statements with a model taxonomy: known-law, unknown/minimax, anytime, action-dependent.
- Formalize the hidden-terminal lower-bound atom via Bayes gap $\Gamma$.
- Develop $q$-scaled hidden-terminal examples to connect lower bounds to valuable delayed tail mass.

## Refuted Or Weakened Claims
- Raw $\beta$, $\Delta$, or $\delta$ conditions are not necessary under known finite-horizon exogenous-law quantifiers.
- The oracle lemma is horizon-aware; it does not establish anytime learnability.
- The delayed-experts reduction still fails for action-dependent prices without a causal counterfactual model.

## Working Notes Updated
Updated:
[canonical_summary.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/canonical_summary.md),
[claim_ledger.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/claim_ledger.md),
[lemma_bank.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/lemma_bank.md),
[failed_attempts.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/failed_attempts.md),
[counterexamples.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/counterexamples.md),
[literature_map.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/literature_map.md),
[promising_directions.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/promising_directions.md),
[bibliography.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/bibliography.md), and
[iteration_summaries.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/iteration_summaries.md).

I also verified metadata for Joulani-Gyorgy-Szepesvari delayed-feedback references: [PMLR 2013](https://proceedings.mlr.press/v28/joulani13.html) and [AAAI 2016](https://ojs.aaai.org/index.php/AAAI/article/view/10320).

## Next Iteration Focus
1. Write the oracle lemma and $\delta_T(H)$ upper theorem in final theorem style.
2. Spell out the $H+1$-residue Hedge timing proof.
3. Formalize the hidden-terminal Bayes-gap lower bound and $q$-scaled variant.
4. Decide whether anytime or action-dependent models are in scope.