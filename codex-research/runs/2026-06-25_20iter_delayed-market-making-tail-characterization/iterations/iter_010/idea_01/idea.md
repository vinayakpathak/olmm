# Audit The Monotone Derandomization Lemma

ID: idea_01

## Summary
Turn the solver's monotone-threshold derandomization into a precise lemma: for the equal-revenue law mu on [e^{-1},1], prove that there is a deterministic sequence a_t such that uniformly over every n and every nonincreasing c_1 >= ... >= c_n, sum_t a_t 1{a_t<c_t} >= sum_t g(c_t) - e_n with e_n=o(n), preferably e_n=O(n^{2/3} sqrt(log n)). Check the grid count, one-sided Hoeffding bound, downward rounding, and Borel-Cantelli construction of one infinite realization.

## Why Promising
This directly validates or breaks the solver attempt. If true, it removes randomization from the known-path 1/e upper bound with minimal new machinery.

## Risks
The proof could fail through a quantifier slip in the Borel-Cantelli diagonalization, a non-summable failure probability, or strict-crossing boundary cases at c=1 and a_t=c_t. These look fixable but should be audited line by line.

## Suggested Lenses
- proof strategy
- quantifier audit
- strict-crossing audit
