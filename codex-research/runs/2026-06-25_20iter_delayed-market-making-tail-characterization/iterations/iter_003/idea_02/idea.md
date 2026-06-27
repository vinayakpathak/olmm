# Horizon-oblivious process-aware learnability

ID: idea_02

## Summary
Investigate the regime between oracle collapse and universal learning: the learner knows the exogenous process law but not the horizon, and must use one anytime policy with pseudo-regret o(T) for every prefix. Either prove a generic anytime collapse via grids/doubling over horizon-optimal fixed quotes, or construct a known process whose horizon-optimal quote switches across dominant horizons so that no single quote sequence tracks all prefixes.

## Why Promising
The notes identify horizon awareness as the fatal reason instance-wise necessity is vacuous. Removing only that assumption is a clean, separable quantifier change that may yield the weakest nontrivial necessity theorem.

## Risks
The direction may collapse too: known-law anytime learners might be able to schedule near-optimal quotes by doubling or by Blackwell-style calibration, making no tail condition necessary even without horizon knowledge. Conversely, examples may depend on artificial noncomputability or rapidly changing horizon optima.

## Suggested Lenses
- quantifier audit
- counterexample search
- online-to-batch reduction
