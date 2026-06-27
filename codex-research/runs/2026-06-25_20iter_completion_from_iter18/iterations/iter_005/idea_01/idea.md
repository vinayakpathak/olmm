# Audit The General Two-Threshold Lemma

ID: idea_01

## Summary
Verify and generalize the solver's two-threshold block lemma for arbitrary 0 < c0 < c1 <= 1. Check the aggregate inequality, derive the exact lower-bound coefficient c0(c1-c0)/c1 per zero-round, optimize it at c0 = 1/2, c1 = 1, and then lift the lemma cleanly to both accepted concatenations: process-unaware universal blocks and same-path horizon-oblivious blocks.

## Why Promising
This could unify the finite two-continuation and same-path two-horizon arguments into one reusable theorem block with sharp constants.

## Risks
May only polish an already-known block obstruction; it will not by itself produce an instance-wise tail characterization. Strict-threshold suprema and old-reward caps must be checked carefully.

## Suggested Lenses
- proof audit
- constant optimization
- lower-bound formalization
