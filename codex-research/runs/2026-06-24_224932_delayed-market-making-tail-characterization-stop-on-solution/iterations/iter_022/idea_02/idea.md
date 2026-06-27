# Limited-Leakage Lower Rates

ID: idea_02

## Summary
Analyze a limited-leakage common-parameter construction: many blocks share a hidden type, each block has q-mass delayed payoff separation gamma, and terminal observations reveal only small KL or TV information. Compute the finite-grid Bayes value first, then check whether the realized price process preserves beta, Delta, or delta envelopes.

## Why Promising
The current q-scaled atom is too weak for power-tail matching because one reveal or independent-bit averaging collapses regret. A noisy common parameter is the most direct way to accumulate hidden value without immediate full learning.

## Risks
Information constraints may force exactly the weak one-block lower bound already known. Persistent quotes can also break the intended tail envelope unless quote levels or barriers are engineered carefully.

## Suggested Lenses
- finite-grid Bayes computation
- Le Cam or Fano lower bound
- tail-envelope audit
