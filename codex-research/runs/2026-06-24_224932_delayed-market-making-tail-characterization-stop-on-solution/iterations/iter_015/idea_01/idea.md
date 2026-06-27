# Two-Arm Delayed Advantage

ID: idea_01

## Summary
Settle the abstract fast/slow delayed advantage game. In the model with fast reward observed immediately, slow reward observed after delay D, slow-play probability q_t, Delta_t=s_t-f_t, A_T=sum q_t Delta_t, and S_T=sum Delta_t, either prove an algorithm with A_T >= -polylog*sqrt(T) and A_T >= S_T - polylog*sqrt(TD), or build an adversarial Delta_t sequence refuting it.

## Why Promising
This is the smallest unresolved core of the tail-adaptive truncation program. A proof would likely imply the missing comparator-specific delayed experts ingredient; a counterexample would redirect the upper-bound search.

## Risks
The desired theorem may be false even for two arms; a two-arm proof may also fail to extend to dyadic market windows.

## Suggested Lenses
- proof strategy
- counterexample search
- algorithm design
