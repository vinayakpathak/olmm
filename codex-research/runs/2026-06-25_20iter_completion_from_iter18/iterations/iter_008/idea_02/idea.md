# Diagonal Same-Path 1/e Theorem

ID: idea_02

## Summary
Use the finite same-path lemma to build one deterministic known path with blocks 0^{N_i},C_i, where C_i is the m_i-point equal-revenue threshold menu, m_i -> infinity, and M_i+m_i=o(N_i). Prove that every horizon-oblivious policy has limsup_T R_T/T >= 1/e.

## Why Promising
It would give the exact same-path analogue of the accepted universal terminal-block 1/e lift and sharply separates anytime learning from horizon-aware oracle policies.

## Risks
The proof must track the denominator T_j=M_i+N_i+j and require m_i=o(N_i). It also must be explicit that the learner is process-aware but horizon-oblivious; a horizon-aware oracle avoids the lower bound.

## Suggested Lenses
- proof strategy
- asymptotic bookkeeping
- model specification
