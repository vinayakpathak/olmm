# Release-Time Cover Reformulation

ID: idea_01

## Summary
Reformulate iteration 19's C(z) cover LP as a release-time interval/GUB covering problem. For each useful segment i and quote level c, set rho(i,c)=min{j>i: max_{q=i+1..j} ell_q >= c} and y_{i,c}=c x_{i,c}. Then low constraints become cumulative suffix-cover constraints sum_{rho(i,c)<=j} y_{i,c} >= d_j(z); equivalently replace d_j(z) by its record envelope max_{q<=j} d_q(z). Investigate whether this is a min-cost flow, a consecutive-ones covering LP with generalized upper bounds, or a nested resource-allocation instance.

## Why Promising
It exposes a hidden suffix/consecutive-ones structure in the accepted unequal-low LP and could turn the scalar fixed-point D=inf{z:C(z)<=z} into an algorithmic or closed-form theorem.

## Risks
The weighted per-segment capacity constraint sum_c y_{i,c}/c <= B_i may break a pure network/TU representation; a flow model may exist only for monotone lows or after adding many auxiliary nodes.

## Suggested Lenses
- proof strategy
- LP reformulation
- min-cost flow reduction
- counterexample search
