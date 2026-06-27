# Hidden Terminal Price Lower Bound

ID: idea_02

## Summary
Formalize a finite-horizon indistinguishability lower bound. Use two processes with identical prefix P_1=...=P_D=0 and different terminal reveal P_{D+1}=p0 or p1, e.g. p0=1/2 and p1=1. Before the reveal, any learner must use the same quote distribution under both worlds, but the best fixed quote is near p0 in one world and near p1 in the other, yielding constant regret per early round and Omega(D) total regret. Then explore block-splicing to obtain a fixed infinite process or class-level lower bound.

## Why Promising
It directly captures why long unobserved hitting delays can force linear regret in distribution-free settings and gives a crisp target for critics to verify.

## Risks
This will prove a minimax obstruction for broad unknown classes, not a process-wise necessity theorem. Care is needed if the problem forbids horizon-dependent processes or assumes a fixed stochastic law.

## Suggested Lenses
- lower bound
- Yao principle
- counterexample search
