# Finite-m Universal Block Lower Bound

ID: idea_02

## Summary
Use the finite-m theorem to prove a finite multi-continuation block lemma. For a zero block of length N and terminal continuation c in a chosen m-threshold set C_m, show that every learner with the same zero-block action law across continuations suffers at least N κ(C_m) regret on one continuation, where κ(C_m)=((m-1)/m)^m for the equal-revenue set. Then lift it to the universal/process-unaware dominant-block construction with the old-reward cap M_i.

## Why Promising
It directly converts the local finite-m geometry into a stronger version of the accepted 1/4 universal block obstruction.

## Risks
The local dual certificate only lower-bounds regret when the common-prefix action law is genuinely shared and outside rewards are capped; otherwise this repeats the failed local-κ-as-standalone mistake.

## Suggested Lenses
- proof strategy
- lower-bound transfer
- quantifier check
