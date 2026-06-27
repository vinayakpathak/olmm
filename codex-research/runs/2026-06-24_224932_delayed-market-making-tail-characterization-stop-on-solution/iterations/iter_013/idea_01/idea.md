# Multi-Scale Hidden-Tail Lower Bounds

ID: idea_01

## Summary
Design a multi-scale Le Cam/Fano lower bound that accumulates many q-scaled hidden-terminal atoms while keeping the world-specific best fixed quote separated from the posterior-mixture quote. A useful target is a dyadic construction with delays D_j, tail masses q_j near a prescribed envelope B(D_j), and hidden bits whose payoff-relevant quote intervals do not let one global reveal solve all scales.

## Why Promising
The main open quantitative gap is matching the truncation upper rate under power tails. The accepted one-block atom is too weak; a multi-scale indistinguishability construction is the most direct route to a matching minimax lower bound.

## Risks
The best fixed quote comparator may collapse the construction: independent blocks can average into one Bayes-optimal quote, erasing accumulated per-block gaps. A full terminal reveal may also solve later blocks unless parameters are refreshed or localized.

## Suggested Lenses
- proof strategy
- counterexample search
- rate lower bound
