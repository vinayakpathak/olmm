# Tail-Adaptive Truncation Algorithm

ID: idea_02

## Summary
Build a dyadic-window truncation algorithm competing with the best H in hindsight: run residue-Hedge base learners for H in {1,2,4,...}, compute each base learner's H-truncated reward after H future prices, and aggregate bases with a delayed full-information meta-learner. Aim for min_H {sqrt(T H log K)+T/K+delta_T(H)} plus polylog overhead.

## Why Promising
The current upper bound requires choosing H from a tail profile. An adaptive version would strengthen the sufficient theorem and may reveal whether the present rate is algorithmic-artifact loose.

## Risks
The meta-learner may pay delay overhead for the largest window rather than the selected window. Full-information feedback for unplayed base algorithms must be reconstructed cleanly, and comparator-gap truncation terms may not be monotone enough for a simple proof.

## Suggested Lenses
- algorithm design
- upper bound proof
