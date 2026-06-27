# Verify known-law vacuity

ID: idea_01

## Summary
Stress-test the solver's law-aware oracle lemma: for any known exogenous law, conditional maximization over a K-grid gives regret at most T/K against the best fixed quote. Check measurability, strict threshold P>a, nonattainment of sup_a, randomized learners, horizon-dependent laws, and whether the proof survives adaptive but action-independent price processes.

## Why Promising
If correct, it decisively rules out any nontrivial fixed-law tail necessity theorem and forces the final characterization to be minimax or ignorance-based.

## Risks
The lemma may be only an oracle result with no computational content, and it fails if prices are action-dependent or if the learner is not allowed to know the law.

## Suggested Lenses
- proof verification
- model audit
