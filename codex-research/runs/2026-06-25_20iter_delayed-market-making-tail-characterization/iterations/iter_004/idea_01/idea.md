# Formalize Universal Block Lower Bound

ID: idea_01

## Summary
Turn the solver's concatenated universal block sketch into a theorem. For any randomized learner that does not know future continuations, choose dominant blocks 0^{N_i} c_i with c_i in {1/2,1}, M_i=o(N_i), and prove limsup_T R_T/T >= 1/4. Check the coupling after a fixed prefix, the old-reward cap by M_i, the eta-comparator version for strict crossing, and beta/gamma failure on the constructed sequence.

## Why Promising
The finite two-continuation lemma and prefix-cap fragment are already accepted; this is the shortest path from solver sketch to a real class-uniform impossibility theorem.

## Risks
Quantifier mistakes are the main risk: process-unaware, horizon-aware, randomized, and adaptive-adversary variants differ. Cross-block pending rewards and strict-threshold suprema also need careful epsilon accounting.

## Suggested Lenses
- proof strategy
- quantifier audit
- counterexample search
