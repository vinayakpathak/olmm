## Summary

The equal-low multi-low drought formula survives the proof audit in the formal two-level left-limit finite-prefix model. I would promote CL-048 after writing the reduction explicitly.

For
\[
h^M,0^{N_0},\ell,0^{N_1},\ell,\ldots,0^{N_r},\ell,0^L,h,
\qquad 0<\ell<h,
\]
with low times \(s_j\), \(A_j=s_j-1\), and \(H=(M-1)_+\), the audited value is
\[
D_n=
[\ell A_r-hH]_+\left(1-\frac{\ell}{h}\right).
\]

## Concrete Progress

I derived the full reduced finite-prefix LP. Let
\[
S_j=[\ell A_j-hH]_+.
\]
The useful quote-coordinate segments are:
\[
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad B_i=N_i+1\quad(i\ge1).
\]
Let \(x_i\) be total \(\ell^-\)-mass in segment \(i\), and \(X_j=\sum_{i\le j}x_i\). The exact reduced LP is:
\[
\min z
\]
subject to
\[
z\ge S_j-\ell X_j,\qquad j=0,\ldots,r,
\]
\[
z\ge (h-\ell)X_r,\qquad 0\le x_i\le B_i,\qquad z\ge0.
\]

This is exactly the reduction targeted by the idea file.

## Claims Or Lemmas

**Claim.** In the formal left-limit model, all non-\(\ell^-/h^-\) actions are dominated on this two-level path.

**Claim.** Old high coordinates \(t<M\) and post-last-low coordinates \(t\ge s_r\) should use \(h^-\); \(\ell^-\)-mass there is dominated.

**Claim.** Only low horizons \(s_j\) and the final high horizon bind. Zero-gap horizons after a low have the same active deficit as the latest low; pre-low zero horizons and initial high horizons are matched by the \(h^-\) baseline.

## Proof Attempts

The upper bound chooses cumulative mass
\[
X_j=\frac{S_j}{h}.
\]
This is feasible because \(S_j\) is nondecreasing and
\[
S_j-S_{j-1}\le \ell(A_j-A_{j-1})=\ell B_j\le hB_j,
\]
with the analogous \(S_0\le hB_0\). Then
\[
S_j-\ell X_j=S_j\left(1-\frac{\ell}{h}\right)\le S_r\left(1-\frac{\ell}{h}\right),
\]
and the final high debt is
\[
(h-\ell)X_r=S_r\left(1-\frac{\ell}{h}\right).
\]

The lower bound uses only the last low and final high constraints. For any \(X=X_r\),
\[
z\ge \max\{S_r-\ell X,\,(h-\ell)X,\,0\}.
\]
The minimum over \(X\ge0\) is attained at \(X=S_r/h\), giving
\[
z\ge S_r\left(1-\frac{\ell}{h}\right).
\]

Small exact LP sanity checks matched the formula for \(M=0\), \(M=1\), consecutive lows \(N_i=0\), high-dominated \(S_r=0\), and \(r=0\).

## Gaps And Risks

The result is for the formal left-limit randomized-marginal LP \(D_n\), not literal threshold actions. Strict crossing still needs implementation by \(\ell-\eta_t\) and \(h-\eta_t\) with cumulative \(\eta\)-loss controlled.

This does not address unequal lows or repeated droughts. The last-low dominance uses equal low level \(\ell\); with varying \(\ell_j\), earlier low horizons may genuinely bind.

## Counterexamples Or Obstructions

No equal-low counterexample found.

Stress tests all behave correctly:
- \(S_r=0\): always quote \(h^-\), value \(0\).
- \(N_i=0\): segment capacity \(B_i=1\) correctly counts the previous low-time quote.
- Large \(L\): no effect, since post-last-low coordinates help only the final high and should be \(h^-\).
- Unequal lows remain the likely obstruction.

## Sources Consulted

Local run files and prior iteration reports only, especially `claim_ledger.md`, `lemma_bank.md`, `iteration_summaries.md`, `iterations/iter_017/solver_attempt.md`, and `iterations/iter_016/idea_02/*`.

No external web sources were needed for this internal finite-LP audit.

## Bibliography Candidates

None.

## Recommended Next Steps

Write CL-048 as an accepted lemma with the reduced LP proof above, including left-limit and strict-crossing caveats. Then test unequal-low droughts; that is the first place the last-low-only rule is likely to fail.