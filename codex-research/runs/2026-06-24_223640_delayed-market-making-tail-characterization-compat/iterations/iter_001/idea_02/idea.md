# Predictable Tail Decomposition

ID: idea_02

## Summary
Decompose long-delayed reward into predictable and unpredictable parts relative to the learner's filtration after observing P_t. Study Y_t^H(a)=a 1{H<tau_t(a)<infty} and whether E[Y_t^H(a)|history] or a learnable surrogate can be competed with online. Aim for a condition like: truncatable value plus learnable predictable tail value is sufficient, while unpredictable tail value yields lower bounds.

## Why Promising
The solver's obstruction says raw long tails are not fatal when the useful information is predictable; this direction targets exactly the missing term in a true iff statement.

## Risks
The decomposition may become tautological unless the predictable component is tied to an explicit algorithm or complexity measure. It may also depend heavily on whether the learner knows the process law.

## Suggested Lenses
- proof strategy
- filtration analysis
- algorithm design
