# Two-Arm Delayed Advantage

ID: idea_01

## Summary
Settle the two-arm delayed-advantage game. Either prove an algorithm with A_T >= -tilde O(sqrt T) and A_T >= S_T - tilde O(sqrt(TD)), perhaps using a reserve/fractional-wealth potential, or build a crisp adversarial advantage sequence refuting comparator-specific delay regret.

## Why Promising
This is the minimal unresolved abstraction behind tail-adaptive truncation. A positive result would upgrade the fixed-H upper bound to an oracle over H; a negative result would explain why adaptive truncation is fundamentally harder.

## Risks
The desired theorem may be false; even if true, the two-arm result may not lift to many dyadic windows without losing comparator-specific delay dependence.

## Suggested Lenses
- proof strategy
- counterexample search
- online learning reduction
