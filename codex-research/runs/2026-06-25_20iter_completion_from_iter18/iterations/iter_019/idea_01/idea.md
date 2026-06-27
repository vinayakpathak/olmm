# Audit Two-Low Formula

ID: idea_01

## Summary
Independently audit the solver's two-low closed form. For p<q, verify the collapse to variables a=x_{0,p} and y=x_{0,q}+x_{1,q}, including capacity and nonnegativity constraints. For p>q, derive primal and dual certificates for both cases and check whether S1<=S2 and S2/h<=B0+B1 are sufficient.

## Why Promising
This is the most immediate partial result from iteration 19; turning it into an accepted lemma would give a reliable base case for arbitrary unequal-low pooling.

## Risks
The formula may be correct only under hidden path-feasibility inequalities; the p>q capacity split is the likeliest place for a missed boundary case.

## Suggested Lenses
- proof audit
- edge-case search
- dual certificate
