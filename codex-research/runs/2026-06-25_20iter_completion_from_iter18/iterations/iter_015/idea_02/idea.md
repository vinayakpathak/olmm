# Two-Level Drought Decomposition

ID: idea_02

## Summary
Try to decompose arbitrary two-level paths into high-free drought intervals between h occurrences. Define a surplus or queue process related to Q_T=[ell(L_ell(T)-1)-h(L_h(T)-1)]_+. Prove a dichotomy: either Q_T=o(T) and the stable h quote gives o(T) regret, or some comparable-scale prefix has D_n=Omega(n). Treat the case where h eventually stops separately via a stable ell quote.

## Why Promising
The solver's lemma and stable-high corollary point to a concrete potential function. A successful dichotomy would settle the two-level finite-alphabet localization problem, the current main sandbox.

## Risks
Different droughts may interact through shared early quote marginals, and local S_i certificates may neither add nor localize. A path may need nonstable switching policies not captured by stable high or stable low quotes.

## Suggested Lenses
- proof strategy
- dichotomy theorem
- counterexample search
