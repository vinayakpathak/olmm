# Finitely Additive Dual Audit

ID: idea_01

## Summary
Audit the proposed finitely additive dual for arbitrary infinite classes. Define the exact reward-vector set C in l_infty(Theta), prove convexity/boundedness for randomized policies, determine whether the minimax value equals sup over ba_1^+(Theta) by Hahn-Banach/separation, and track whether closure in the weak-* or norm topology changes the original policy value.

## Why Promising
This is the newest solver attempt's main new object. If correct, it gives an exact arbitrary-class value characterization, even though not a scalar tail theorem. If false, a precise failure mode will prevent another premature stop claim.

## Risks
The dual may characterize only a relaxed closure of the policy reward set, or may require taking closures that change the value. The support-function term may not have any usable posterior interpretation, and positive-part learnability may need a separate sign convention.

## Suggested Lenses
- functional analysis proof audit
- counterexample search
