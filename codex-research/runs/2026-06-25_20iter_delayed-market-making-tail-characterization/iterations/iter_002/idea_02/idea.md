# Two-Continuation Indistinguishability Lower Bound

ID: idea_02

## Summary
Turn the two-continuation block example into a theorem. Use N initial zeros followed by a terminal price in {1/2, 1}; before the terminal observation the learner cannot know whether quotes below 1/2 or near 1 are needed. Prove that for any randomized learner one continuation has Omega(N) regret, then concatenate superexponentially growing blocks to get a class-level no-sublinear-regret result.

## Why Promising
This is the most concrete route from raw tail failure to a real hardness theorem, and it directly targets the information-theoretic obstruction identified in the notes.

## Risks
The lower bound may only prove a universal-class or minimax impossibility, not an instance-wise characterization; strict crossing and unattained suprema need careful epsilon handling.

## Suggested Lenses
- lower bound
- Yao/minimax
- strict-threshold audit
