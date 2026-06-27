## Summary

The proposed proof route is false as stated. A large intrinsic boundary defect
\[
B(u,v)=\sum_{t<m}\bigl(f_t(u)+f_t(v)-f_t(u+v)\bigr)
\]
does not imply a finite-prefix \(D_m=\Omega(m)\) certificate. The separated two-threshold block from the iteration-14 solver attempt is already a clean obstruction: it has \(B(u,v)=\Theta(m)\), \(\Phi(u)=\Phi(v)=0\), and \(D_m=0\).

The useful salvage is to treat \(B(u,v)\) as a real cross-scale certificate, not as a local prefix certificate. It measures conflict between prefix horizons and late “shadow thresholds” that may not exist inside the prefix.

## Concrete Progress

For
\[
f_t(w)=\sup_a a\sum_T w_T1\{a<M_{t,T}\},
\]
the exact identity is
\[
\Phi(u+v)=\Phi(u)+\Phi(v)+B(u,v),
\]
where
\[
\Phi(w)=\sum_Tw_TV_T^*-\sum_tf_t(w).
\]
Thus the boundary term is not just a proof artifact. It is exactly the superadditivity gain in the dual objective.

This reframes the obstruction: dyadic localization fails when a profitable certificate is created by incompatibility between early and late horizon objectives on the first \(m\) quote coordinates.

## Claims Or Lemmas

**Claim 1: Boundary defect is a local two-objective incompatibility.**  
For each \(t<m\),
\[
\delta_t(u,v)=f_t(u)+f_t(v)-f_t(u+v)
\]
is the loss from forcing one quote at time \(t\) to serve both the early weighted payoff profile \(u\) and the late weighted payoff profile \(v\). This is analogous to the local \(\kappa\)-gap, but with late horizons as shadow objectives.

**Claim 2: Boundary defect does not imply \(D_m\).**  
Any inequality of the form
\[
B(u,v)\lesssim D_m+\Phi(u)_++\Phi(v)_+ + o(m)
\]
is false in general.

## Proof Attempts

Take the separated block
\[
0^N,\ c_0,\ 0^L,\ c_1,\qquad 0<c_0<c_1\le1,
\]
and split at \(m=N+1\). Let \(T_0=N+1\), \(T_1=N+L+2\), and choose the two-threshold dual weights
\[
u=\lambda_0e_{T_0},\qquad v=\lambda_1e_{T_1},
\]
where
\[
\lambda_0=\frac{c_1-c_0}{c_1},\qquad
\lambda_1=\frac{c_0}{c_1}.
\]

For every first-block time \(t\le N\),
\[
f_t(u)=\lambda_0c_0,\qquad f_t(v)=\lambda_1c_1=c_0,
\]
while
\[
f_t(u+v)=\sup_a a\bigl(\lambda_0 1\{a<c_0\}+\lambda_1 1\{a<c_1\}\bigr)=c_0.
\]
Hence
\[
\delta_t(u,v)=\lambda_0c_0+\lambda_1c_1-c_0
=\frac{c_0(c_1-c_0)}{c_1}.
\]
Summing over the first \(N\) zero quotes gives
\[
B(u,v)=N\frac{c_0(c_1-c_0)}{c_1}.
\]

But the prefix ending at \(m=N+1\) is just \(0^N,c_0\), a singleton-threshold block. In the left-limit model,
\[
D_m=0
\]
because quoting \(c_0^-\) matches the prefix comparator. Also \(\Phi(u)=0\) and \(\Phi(v)=0\). So the entire positive certificate is cross-scale boundary defect.

## Gaps And Risks

The defect \(B(u,v)\) certifies conflict only after importing late thresholds beyond \(m\). It need not correspond to any horizon conflict visible inside the prefix.

A localization proof therefore cannot simply “charge” \(B(u,v)\) to \(D_m\). It needs either:

1. a condition ensuring late shadow thresholds are already represented inside the prefix, or
2. a charging scheme showing repeated cross-scale defects accumulate into some comparable-scale \(D_n\), or
3. a finite-alphabet/laminar uncrossing argument using last-exceedance intervals.

## Counterexamples Or Obstructions

The separated block above is the main obstruction to the target inequality.

Stable-singleton paths are benign: early and late objectives share the same maximizing quote, so the boundary defect is zero.

Alternating paths do not immediately refute the idea, but they warn that local suffix-menu conflict can be loose if a stable global comparator, such as \(1^-\), matches all horizons.

## Sources Consulted

Local project sources only:

- `problem.md`
- `working_notes/canonical_summary.md`
- `working_notes/claim_ledger.md`
- `working_notes/lemma_bank.md`
- `working_notes/failed_attempts.md`
- `working_notes/counterexamples.md`
- `working_notes/literature_map.md`
- `working_notes/bibliography.md`
- `working_notes/promising_directions.md`
- `working_notes/iteration_summaries.md`
- `iterations/iter_014/idea_01/idea.md`
- `iterations/iter_014/solver_attempt.md`

## Bibliography Candidates

None. No new external source is needed for this proof-strategy assessment.

## Recommended Next Steps

Do not pursue “large boundary defect implies \(D_m\)” in its current form.

A better target is a boundary-augmented prefix lemma: define an augmented local LP that includes late shadow payoff profiles \(v\), prove \(B(u,v)\) is exactly its value, then look for market-specific conditions under which the augmented certificate can be converted into a real finite-prefix certificate.

The next concrete proof route should be the finite-alphabet laminar version from idea 02: rewrite late shadow objectives using last-exceedance intervals and try to uncross dual mass into comparable-scale horizons.