# Comparator-Specific Delay Test

ID: idea_01

## Summary
Study the abstract component-wise delayed full-information experts problem with two arms: one fast arm with delay 0 and one slow arm with delay D. Prove or refute simultaneous regret bounds of order sqrt(T log N) to the fast arm and sqrt(T D log N) to the slow arm, with precise feedback timing.

## Why Promising
This is the exact missing lemma behind the adaptive truncation upper bound. A proof would yield a tail-adaptive market algorithm; a counterexample would prevent more wasted effort on max-delay masters.

## Risks
The desired theorem may be false even in the two-expert case; standard adversarial examples may force dependence on the maximum delay rather than the comparator delay.

## Suggested Lenses
- proof strategy
- counterexample search
- algorithm design
