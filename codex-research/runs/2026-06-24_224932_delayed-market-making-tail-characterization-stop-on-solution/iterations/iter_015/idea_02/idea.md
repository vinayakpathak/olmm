# Nested-Window Oracle Stress Test

ID: idea_02

## Summary
Test the nested-window adaptation route on two-window, two- or three-quote finite reward tables. Use horizon-censored nonnegative increments z_t^m, keep expected comparator values V_m^G(P), and check whether any causal algorithm can satisfy an oracle of the form V_m^G - E L^m(A) <= B_m + c(V_M^G - V_m^G).

## Why Promising
The market rewards have monotone nested structure that generic heterogeneous-delay experts ignores. Small finite tables can quickly reveal whether this structure is enough or whether the expected-oracle target is impossible.

## Risks
The oracle may require knowing the law P or may only prove a pathwise charge much larger than delta_T(H).

## Suggested Lenses
- finite example search
- oracle inequality
- pathwise versus expected values
