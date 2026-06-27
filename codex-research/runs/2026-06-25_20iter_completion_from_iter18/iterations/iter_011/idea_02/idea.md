# Path-Dependent Suffix-Menu Sufficiency

ID: idea_02

## Summary
Develop the suffix-menu upper theorem rigorously: for a deterministic exogenous path, C_t=closure{M_{t,T}:T>t}, choose eta-implemented local compact-menu distributions at each t, and prove R_T <= sum_{t<T} delta(C_t)+o(T) uniformly over horizons. Evaluate sum delta(C_t) on sparse vanishing spikes, power-of-two spikes, superexponential uniform spikes, equal-revenue blocks, and monotone threshold runs.

## Why Promising
It turns the compact local lemma into a genuine known-path anytime sufficient condition and tests whether it explains both easy and hard examples already in the notes.

## Risks
The bound may remain only sufficient because sup_a sum_t rewards can be much smaller than sum_t M_{t,T}; explorers should avoid claiming necessity too quickly.

## Suggested Lenses
- proof strategy
- worked examples
- counterexample search
