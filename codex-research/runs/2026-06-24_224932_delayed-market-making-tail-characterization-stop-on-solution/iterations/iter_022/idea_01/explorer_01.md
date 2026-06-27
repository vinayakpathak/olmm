## Summary

I do not have a proof or refutation of the two-arm delayed-advantage theorem. The target still looks plausible, but the proof strategy needs to move beyond a single solvency account or clipped delayed Hedge.

The clean proof direction is: keep the accepted solvency invariant for fast safety, then add restartable safe “testers” or interval coin-betting components so the learner can recover after long negative prefixes. A single wealth account can be drained too far to ramp up quickly later.

## Concrete Progress

Model the two-arm problem directly by an advantage sequence $\Delta_t=s_t-f_t\in[-1,1]$, delayed by $D$. The learner chooses predictable $q_t\in[0,1]$, and
$$
A_T=\sum_t q_t\Delta_t,\qquad S_T=\sum_t\Delta_t.
$$
The desired bounds are
$$
A_T\ge-\tilde O(\sqrt T),\qquad
A_T\ge S_T-\tilde O(\sqrt{TD}).
$$

The fast side is controlled by solvency:
$$
O_t=\sum_{u\le t-D}q_u\Delta_u,\quad
P_t=\sum_{t-D<u<t}q_u,\quad
C_t=B+O_t-P_t.
$$
If $q_t\le [C_t]_+$, then $A_T\ge-B$.

The new proof-strategy refinement is that slow capture likely needs fresh reserved capital or interval restarts. A no-restart fractional rule such as $q_t=C_t/(2D)$ can be destroyed by a long negative prefix followed by a long positive suffix.

## Claims Or Lemmas

**Solvency Lemma, proved locally.**  
If $q_t\le [B+O_t-P_t]_+$ for all $t$, then pathwise
$$
A_T\ge -B.
$$

**D-scale lower stress, proved with common baseline.**  
Using $f_t\equiv 1/2$ and $\Delta_t=\pm1/2$ for the first $D$ rounds, fast safety on the negative instance forces small first-$D$ exposure, so the positive instance has slow regret $\Omega(D-B)$. Thus a $D$-scale term is unavoidable.

**No-restart fractional wealth obstruction.**  
For $D=1$, the natural rule $q_t=C_t/2$ has $C$ halve each round on $\Delta=-1$, and grow only by factor $3/2$ per round on later $\Delta=+1$. A sequence of $N$ negatives followed by $2N$ positives gives $\Omega(N)$ slow regret, violating the $D=1$ target $\tilde O(\sqrt T)$. This refutes that proof route, not the theorem.

**Candidate tester lemma.**  
A tester launched with capital $w$, risking at most its capital over each delay block, loses at most $w$ on bad data. On an all-positive suffix it doubles its safe capital every $D$ rounds and reaches full exposure after $O(D\log(D/w))$ missed reward. This suggests interval-safe coin betting.

## Proof Attempts

The clipped delayed-Hedge plan fails: $q_t=\min\{p_t,C_t,1\}$ can drive $C_t$ to zero and never recover, because unplayed positive advantages do not replenish actual solvency.

The more promising architecture is an interval or restart scheme:

1. Allocate small initial safe capitals $w_I$ to many interval testers, with $\sum_I w_I\le B$.
2. Each tester uses only its own capital and resolved played advantage, so aggregate fast loss is bounded.
3. A tester starting near the last relevant running minimum of cumulative advantage should capture the final positive excursion.
4. The hoped-for slow bound would be a delayed interval coin-betting inequality plus logarithmic overhead from the interval prior.

This is still a strategy, not a proof.

## Gaps And Risks

The main missing lemma is a safe interval coin-betting theorem for arbitrary $\Delta_t$, not only all-positive suffixes.

Combining many testers without exceeding total exposure $q_t\le1$ and without breaking solvency is nontrivial.

A two-arm theorem would still not automatically give the many-arm dyadic-window result needed for adaptive truncation.

All claims are expectation or action-probability statements, not realized Bernoulli path guarantees.

## Counterexamples Or Obstructions

- Safe-clipped Hedge has the known budget-depletion failure.
- Single-account fractional wealth can be exponentially depleted by a negative prefix.
- Alternating $+/-$ blocks of length $D$ remain an important stress test for stale-feedback chasing.
- No crisp adversarial sequence currently refutes the desired $\sqrt T,\sqrt{TD}$ pair.

## Sources Consulted

Local files only: `problem.md`, all requested `working_notes/*.md`, `iterations/iter_022/idea_01/idea.md`, and prior reports for iterations 13-15. No web sources consulted.

## Recommended Next Steps

1. Prove the single-interval safe coin-betting lemma with delayed feedback.
2. Test it first on one positive suffix after an arbitrary negative prefix.
3. Add dyadic interval restarts with capital weights summing to $B$.
4. If that fails, turn the failure into a lower-bound sequence with many possible restart times.
5. Only then attempt the many-arm heterogeneous-delay theorem.