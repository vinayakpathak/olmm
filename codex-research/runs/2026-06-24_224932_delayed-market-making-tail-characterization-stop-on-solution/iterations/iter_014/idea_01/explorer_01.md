## Summary

I do **not** have a proof or refutation of the heterogeneous-delay experts lemma yet. The useful progress is a reduction of the two-arm fast/slow case to a one-dimensional delayed advantage game. That reduction makes the right proof target much clearer: fast regret is a **baseline safety** constraint, while slow regret is a **delayed advantage capture** constraint.

The most promising proof route is a safe delayed coin-betting or wealth-wrapper algorithm. A naive threshold on observed counterfactual slow rewards is not enough.

## Concrete Progress

Fix rewards $f_t,s_t\in[0,1]$, fast delay $0$, slow delay $D$, and let $q_t$ be the learner’s probability of playing slow. Define
$$
\Delta_t=s_t-f_t,\qquad S_T=\sum_t\Delta_t,\qquad A_T=\sum_t q_t\Delta_t .
$$
Then expected regret identities are exact:
$$
R_F=-A_T,\qquad R_S=S_T-A_T.
$$
So the desired two-arm bounds become:
$$
A_T\ge -B_F,\qquad A_T\ge S_T-B_S,
$$
with $B_F\sim \sqrt T$ and $B_S\sim \sqrt{TD}$.

This is the clean proof formulation. It removes irrelevant fast rewards and turns the problem into delayed online linear optimization on $q_t\in[0,1]$, but with asymmetric comparator requirements.

## Claims Or Lemmas

**Lemma 1, proved:** two-arm comparator-specific regret is equivalent to the delayed advantage game above.

**Candidate Lemma 2, unproved:** there exists a delayed advantage algorithm such that for every oblivious $\Delta_t\in[-1,1]$,
$$
\sum_t q_t\Delta_t
\ge
-\tilde O(\sqrt T),
\qquad
\sum_t q_t\Delta_t
\ge
\sum_t\Delta_t-\tilde O(\sqrt{TD}).
$$
This would prove the desired fast/slow theorem.

**Warning Lemma, essentially proved by stress test:** an algorithm cannot safely switch to slow merely because observed counterfactual slow rewards are high. Unplayed slow rewards do not create actual surplus against the fast comparator.

## Proof Attempts

A plausible algorithmic proof is a safe delayed wealth wrapper:

1. Treat playing fast as baseline wealth $0$.
2. Let slow exposure $q_t$ be a bet on delayed advantage $\Delta_t$.
3. Maintain confirmed wealth from resolved slow bets.
4. Limit unresolved slow exposure so even worst-case pending $\Delta_t=-1$ cannot drive total advantage below $-B_F$.
5. Run a delayed coin-betting or OLO subroutine inside this safety cap to compete with always-slow.

The fast-regret invariant seems straightforward if pending exposure is explicitly capped. The hard part is proving that safety freezes do not cost more than $\tilde O(\sqrt{TD})$ against the slow comparator.

## Gaps And Risks

The slow-regret analysis of the safe wrapper is the main missing proof.

A two-arm proof using fast as a special baseline may not generalize automatically to many arms with many delays.

The statement should be restricted to public full-information, oblivious or exogenous reward sequences. Adaptive/action-dependent rewards may invalidate the reduction.

Loss-form versions are riskier than reward-form versions; the market reduction has nonnegative rewards, which is important.

## Counterexamples Or Obstructions

Bait-and-switch stress test: first make slow counterfactually good while the learner mostly plays fast, then make slow bad for $D$ rounds while fast is good. A policy that trusts observed slow advantage can suffer $\Theta(D)$ fast regret. This is not a full impossibility, because a policy that actually played slow during the good phase may have real surplus to offset the trap.

Standard max-delay Hedge remains insufficient: it pays $\sqrt{TD}$ even to the fast arm.

Standard random-sign experts lower bounds do not refute the target, because their $\sqrt{TD}$ hardness can be absorbed by the allowed slow-arm regret; always-fast already handles that diagnostic.

## Sources Consulted

Local project files only; no external web sources.

Consulted: `problem.md`, all requested `working_notes/*.md`, `iterations/iter_014/idea_01/idea.md`, plus current iteration solver/promising-ideas context.

## Recommended Next Steps

1. Formalize the delayed advantage game as the canonical two-arm test.
2. Try to prove the safe delayed coin-betting lemma.
3. In parallel, search for an oblivious block counterexample directly in $\Delta_t$-language.
4. Only after the two-arm case is settled, attempt the many-arm dyadic-window theorem needed for adaptive truncation.