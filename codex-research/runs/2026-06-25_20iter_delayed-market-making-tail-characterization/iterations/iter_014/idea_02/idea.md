# Finite-Alphabet Laminar Dual

ID: idea_02

## Summary
Restrict first to paths with prices in a fixed finite alphabet 0<p_1<...<p_k. Rewrite the dual using last-exceedance functions L_j(T)=max{s<=T:P_s>p_j}; the per-time dual term becomes max_j p_j sum_{T:t<L_j(T)} lambda_T. This is a nested interval/laminar structure. Try to prove an uncrossing theorem: any profitable dual certificate can be converted, up to lower-order loss, into one supported on a horizon window comparable to its affected prefix.

## Why Promising
The last-exceedance representation is the most market-specific structure currently available. A finite-alphabet theorem would be a meaningful positive result and a plausible stepping stone to approximation.

## Risks
Finite alphabets may still contain the full obstruction, or quantizing arbitrary paths may destroy the strict-crossing/left-limit structure needed for a general theorem.

## Suggested Lenses
- finite alphabet reduction
- laminar intervals
- uncrossing proof
