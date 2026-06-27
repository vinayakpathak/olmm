# Known-Path Anytime Upper Bound

ID: idea_02

## Summary
Try for a matching known-path anytime upper bound using the explicit local minimax mixtures. Model a deterministic known path by epochs whose future record thresholds form finite menus, choose q_i-style quote distributions on long unresolved stretches, and test whether every path admits limsup_T R_T/T <= 1/e or a sharper path-dependent local-density bound.

## Why Promising
The same-path lower bound now reaches 1/e, and the solver supplies the primal strategy that matches each isolated block. If these strategies compose, the process-aware horizon-oblivious regime could get a sharp characterization.

## Risks
Local block strategies may not compose because one fixed comparator spans multiple blocks and old quotes can fill at later records. Nonmonotone price paths may break the clean threshold-menu reduction.

## Suggested Lenses
- proof strategy
- dynamic programming
- counterexample search
