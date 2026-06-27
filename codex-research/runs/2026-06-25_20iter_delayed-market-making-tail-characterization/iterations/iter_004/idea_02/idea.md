# Known-Path Horizon-Oblivious Obstruction

ID: idea_02

## Summary
Formalize the same-path horizon-oblivious theorem for the deterministic path made of blocks 0^{N_i}, 1/2, 1. Prove that for endpoints T_i^0=M_i+N_i+1 and T_i^1=M_i+N_i+2, any horizon-oblivious policy satisfies max{R_{T_i^0},R_{T_i^1}} >= N_i(1/4-o(1))-M_i-O(1).

## Why Promising
It cleanly separates the horizon-aware oracle collapse from anytime learning, using one fixed deterministic process rather than a process class.

## Risks
The policy model must be exact: a process-aware policy may know the entire infinite path but not the evaluation horizon. Need ensure later blocks cannot retroactively affect regret at the paired endpoints.

## Suggested Lenses
- proof strategy
- model definition
- edge-case audit
