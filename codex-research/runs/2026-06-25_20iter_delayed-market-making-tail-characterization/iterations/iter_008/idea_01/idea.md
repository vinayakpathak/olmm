# Audit The No-Loss Same-Path Lift

ID: idea_01

## Summary
Ask an explorer to turn the iteration-8 same-path multi-threshold argument into a formal finite lemma. For path old-prefix length M, then 0^N,c_1,...,c_m, verify for each horizon T_j=M+N+j that the comparator supremum using a quote approaching c_j from below is at least (N+j-1)c_j, while learner rewards from intermediate threshold-round actions before T_j are at most (j-1)c_j. This should yield R_Tj >= N c_j - sum_s A_s 1{A_s<c_j} - M.

## Why Promising
If correct, this promotes CL-026 in a stronger form with no O(m) finite-block loss and is the cleanest immediate extension of the accepted two-threshold anytime obstruction.

## Risks
The cancellation can fail if the policy model leaks the evaluation horizon, if endpoint timing is misstated, or if strict-crossing limits are handled with a fixed eta that scales with N or m.

## Suggested Lenses
- proof audit
- strict-crossing cleanup
- quantifier audit
