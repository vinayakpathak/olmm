# Multi-Threshold Block Constant

ID: idea_01

## Summary
Generalize the two-threshold zero-block lemma to a finite terminal threshold set C. The dual gap should be kappa(C)=sup_lambda E_lambda[C]-sup_a a Pr_lambda(C>a), i.e. welfare minus optimal posted-price revenue. Optimize over lambda and test whether the best zero-block constant is 1/e, achieved approximately by an equal-revenue-type distribution; then lift to universal block concatenations and same-path multi-horizon blocks 0^N,c_1,...,c_m with m=o(N).

## Why Promising
This is a concrete, separately checkable extension of the accepted 1/4 lemma and may strengthen the lower-bound constant while connecting kappa to known posted-price geometry.

## Risks
The 1/e constant may fail under finite-support approximation, strict crossing, or transfer to concatenated paths; multi-horizon same-path versions must control intermediate quote rewards when the number of thresholds grows.

## Suggested Lenses
- LP duality
- lower-bound constants
- mechanism-design analogy
- strict-threshold cleanup
