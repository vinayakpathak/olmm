# Promote Finite-C Primal Formula

ID: idea_01

## Summary
Verify and package the solver's finite-C primal formula. For C={0<c_1<...<c_m}, check that the unique root delta* of F(delta)=1 really equals kappa(C), including m=1, delta*=0, delta*=c_i boundary cases, and left-limit actions. Then compare the q_i distribution to randomized minimax pricing formulas in Bergemann-Schlag-style prior-free pricing.

## Why Promising
This directly closes the iteration-8 open item and gives an explicit local optimizer, not just a dual value. It can become a reusable lemma for both lower bounds and candidate upper bounds.

## Risks
The formula may be a known robust-pricing special case rather than new; boundary cases delta*=c_i and strict crossing could hide epsilon losses; it remains purely local even if correct.

## Suggested Lenses
- proof audit
- literature audit
- finite examples
