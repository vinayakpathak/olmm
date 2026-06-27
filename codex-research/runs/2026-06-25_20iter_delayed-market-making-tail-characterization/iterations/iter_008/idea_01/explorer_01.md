## Summary

The idea appears correct. Under the right assumptions, the same-path multi-threshold lift gives the finite bound with no \(O(m)\) loss:
\[
R_{T_j}\ge N c_j-\mathbb E\sum_{s=1}^N A_s{\bf 1}\{A_s<c_j\}-M.
\]
Averaging this against the \(\kappa(C)\) dual distribution then yields
\[
\max_j R_{T_j}\ge N\kappa(C)-M.
\]
So CL-026 can likely be promoted from “candidate” to “strongly supported/accepted,” with the usual quantifier and strict-crossing caveats.

## Concrete Progress

Set the path to be an arbitrary old prefix of length \(M\), followed by
\[
0^N,c_1,\ldots,c_m,\qquad 0<c_1<\cdots<c_m\le 1,
\]
and define \(T_j=M+N+j\). Let \(A_s\) be the learner’s action on the \(s\)-th zero in the current block.

For horizon \(T_j\), the fixed comparator quote \(a<c_j\) earns on all \(N\) zero-block rounds and all \(j-1\) earlier threshold rounds. Hence, by taking \(a\uparrow c_j\),
\[
V^*_{T_j}\ge (N+j-1)c_j.
\]

The learner’s reward by \(T_j\) is at most:
\[
M+\sum_{s=1}^N A_s{\bf 1}\{A_s<c_j\}+(j-1)c_j.
\]
The old-prefix cap is \(M\). Each intermediate threshold-round action before \(T_j\) can earn at most \(c_j\), and there are \(j-1\) such actions.

Subtracting gives the claimed cancellation:
\[
R_{T_j}\ge N c_j-\mathbb E\sum_{s=1}^N A_s{\bf 1}\{A_s<c_j\}-M.
\]

## Claims Or Lemmas

**Lemma 1: No-loss same-path finite block.**  
For the deterministic path above and any horizon-oblivious policy,
\[
R_{T_j}\ge N c_j-G_j-M,
\qquad
G_j=\mathbb E\sum_{s=1}^N A_s{\bf 1}\{A_s<c_j\}.
\]

**Lemma 2: Multi-threshold \(\kappa\) lift.**  
For finite \(C=\{c_1,\ldots,c_m\}\),
\[
\max_j R_{T_j}\ge N\kappa(C)-M,
\]
where
\[
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_{a\in[0,1]}a\Pr_\lambda(C>a)\right).
\]

Proof: average Lemma 1 over any \(\lambda\), use
\[
\sum_j\lambda_j G_j
=
\sum_{s=1}^N
\mathbb E\bigl[A_s\Pr_\lambda(C>A_s)\bigr]
\le
N\sup_a a\Pr_\lambda(C>a),
\]
then optimize over \(\lambda\).

## Proof Attempts

The main proof attempt succeeds. The previously suspected \(O(m)\) loss from intermediate threshold-round actions cancels against the comparator’s \(j-1\) extra earning opportunities before \(T_j\).

There is even a slightly sharper optional old-prefix version: since a quote \(a<c_j\) posted during the old prefix also trades by \(T_j\), one can lower-bound the comparator by \((M+N+j-1)c_j\), giving
\[
R_{T_j}\ge N c_j-G_j-M(1-c_j).
\]
The simpler \(-M\) form is enough and cleaner for concatenation.

## Gaps And Risks

The result requires increasing thresholds. If the \(c_j\)’s are not ordered so that \(c_j=\max_{k\le j}c_k\), the zero-block payoff at horizon \(T_j\) is not \(A_s{\bf 1}\{A_s<c_j\}\).

The policy must be horizon-oblivious. If the learner is told \(T_j\), the zero-block action law can depend on \(j\), and the \(\kappa(C)\) averaging argument breaks.

Strict crossing must be handled with `sup` or \(a\uparrow c_j\). Do not use a fixed \(\eta\)-comparator that leaves an \(O(\eta N)\) loss unless it is sent to zero after the inequality.

The proof uses the single-fill reward convention from \(r_t(a)=a{\bf 1}\{\tau_t(a)\le T-t\}\). If old quotes could earn repeatedly at every later crossing, the old-prefix cap \(M\) would fail.

## Counterexamples Or Obstructions

Nonmonotone threshold order breaks the claimed per-horizon formula.

Horizon-aware policies break the multi-horizon lower bound.

This still does not imply any instance-wise raw-tail characterization; it is a same-path anytime/horizon-oblivious obstruction.

## Sources Consulted

Local run files only: `problem.md`, all requested `working_notes/*.md`, and `iterations/iter_008/idea_01/idea.md`.

No web search was needed for this proof audit.

## Bibliography Candidates

None.

## Recommended Next Steps

Promote CL-026 to an accepted finite lemma, with assumptions: deterministic known path, increasing thresholds, horizon-oblivious policy, `sup` comparator, and single-fill rewards.

Then record the concatenated corollary: with blocks \(0^{N_i},C_i\), \(M_i+m_i=o(N_i)\), and equal-revenue \(m_i\)-point menus with \(m_i\to\infty\),
\[
\limsup_T R_T/T\ge 1/e
\]
for any process-aware but horizon-oblivious policy.