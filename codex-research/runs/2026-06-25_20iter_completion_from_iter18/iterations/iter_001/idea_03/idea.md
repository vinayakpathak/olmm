# Horizon Tail Error

ID: idea_03

## Summary
Study the ex-ante horizon-level truncation error Delta_T(H)=sup_a sum_{t<=T} E[a 1{H<tau_t(a)<=T-t}]. Establish sufficiency when some H_T has H_T log T=o(T) and Delta_T(H_T)=o(T), using the same delayed-grid reduction. Investigate whether this is closer to a true characterization than uniform gamma.

## Why Promising
This is the weakest condition visible from the truncation proof and avoids beta's worst-case sup over irrelevant times and histories.

## Risks
Necessity may fail because an algorithm can exploit predictable price structure rather than waiting for delayed reward feedback.

## Suggested Lenses
- proof strategy
- necessity test
- rare-history examples
