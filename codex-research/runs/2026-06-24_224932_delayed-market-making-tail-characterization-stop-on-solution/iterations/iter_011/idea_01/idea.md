# Tail-profile no-go pair

ID: idea_01

## Summary
Formalize the solver's tail-profile no-go pair. Compare the q-scaled hidden-terminal two-world class with a labeled version where P_1 reveals the world before all payoff-relevant quote decisions, while the future price law in each world is unchanged. Prove the hidden class has minimax regret Omega(qD), the labeled class has O(1) or zero grid regret, and the per-world beta, Delta, and delta profiles are identical up to the harmless shift.

## Why Promising
It would directly show that no scalar criterion depending only on individual laws' delay or truncation profiles can characterize unknown-class learnability; observability/predictability must enter.

## Risks
The label must be inserted as a truly payoff-harmless initial public price. If tail profiles include the initial observation in an unexpected way, the hidden and labeled classes may not be exactly profile-matched.

## Suggested Lenses
- counterexample search
- quantifier audit
- proof strategy
