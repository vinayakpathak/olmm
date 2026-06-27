## Summary

I derived an exact finite-dimensional LP for the formal left-limit finite-prefix value of a single unequal-low drought, assuming the accepted finite-alphabet reduction. The LP reduces the full horizon-prefix problem to segment-level masses \(x_{i,c}\) placed on formal quotes \(c^-\), where \(c\) ranges over the observed low levels.

Main outcome: unequal lows do not obey a simple “last low only” rule. A small increasing-low example already forces an earlier low horizon and the final high constraint to bind together, raising the value above the last-low-only formula.

## Concrete Progress

For the path
\[
h^M,0^{N_0},\ell_1,0^{N_1},\ell_2,\ldots,0^{N_{r-1}},\ell_r,0^L,h,
\qquad 0<\ell_j<h,
\]
let \(s_j\) be the time of \(\ell_j\), and set
\[
H=(M-1)_+,\qquad B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad B_i=N_i+1\quad(1\le i\le r-1).
\]
Here \(B_i\) is the number of useful quote coordinates in segment \(i\): before the next low, excluding old high coordinates already protected by a future old high and excluding the final-only post-last-low segment.

Let \(\mathcal L=\{\ell_1,\ldots,\ell_r\}\). For \(0\le i<j\le r\), define
\[
m_{i,j}=\max_{q=i+1,\ldots,j}\ell_q.
\]
This is the suffix maximum seen by a quote in segment \(i\) when regret is evaluated at low horizon \(s_j\).

Define the low-horizon surplus over the stable \(h^-\) baseline:
\[
S_j=V_j-hH,
\]
where
\[
V_j=\max_{c\in \mathcal L\cup\{h\}} c(L_c(s_j)-1)_+.
\]
Here \(L_c(T)\) is the last time \(\le T\) with price at least \(c\), in the formal left-limit convention.

The reduced primal LP is:
\[
\begin{aligned}
\min\quad & z\\
\text{s.t.}\quad
& z\ge
S_j-\sum_{i=0}^{j-1}\sum_{\substack{c\in\mathcal L\\ c\le m_{i,j}}} c\,x_{i,c},
\qquad j=1,\ldots,r,\\
& z\ge \sum_{i=0}^{r-1}\sum_{c\in\mathcal L}(h-c)x_{i,c},\\
& \sum_{c\in\mathcal L}x_{i,c}\le B_i,\qquad i=0,\ldots,r-1,\\
& x_{i,c}\ge0.
\end{aligned}
\]
Interpretation: low quotes buy down low-horizon deficits, but create final-high debt.

The dual is:
\[
\max_{\alpha,\beta}
\left[
\sum_{j=1}^r\alpha_jS_j-\sum_{i=0}^{r-1}B_i u_i
\right]
\]
subject to
\[
\alpha_j,\beta\ge0,\qquad \sum_j\alpha_j+\beta=1,
\]
and
\[
u_i\ge0,\qquad
u_i\ge
c\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j-\beta(h-c)
\quad
\forall i,c.
\]
Equivalently,
\[
u_i=
\left[
\max_{c\in\mathcal L}
\left\{
c\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j-\beta(h-c)
\right\}
\right]_+.
\]

## Claims Or Lemmas

**Lemma 1: Reduced Drought LP.**  
Modulo the accepted finite-alphabet left-limit reduction, the finite-prefix value \(D_n\) of the single-drought path above equals the reduced LP optimum.

**Lemma 2: Single-low specialization.**  
For \(r=1\), the LP gives
\[
D_n=[\ell_1(M+N_0)-h(M-1)_+]_+\left(1-\frac{\ell_1}{h}\right),
\]
recovering the accepted post-low single-drought identity, with no dependence on \(L\).

**Lemma 3: Unequal lows can force earlier low constraints.**  
The last-low-only formula fails for unequal lows. Example with
\[
h=1,\quad M=0,\quad (N_0,N_1,N_2)=(1,8,1),\quad
(\ell_1,\ell_2,\ell_3)=(0.2,0.3,0.4)
\]
has
\[
(S_1,S_2,S_3)=(0.2,3,4.8).
\]
The reduced LP optimum is
\[
z=2.91,
\]
whereas the last-low-only value would be
\[
4.8(1-0.4)=2.88.
\]
Thus the earlier \(\ell_2\)-horizon is genuinely binding.

## Proof Attempts

The reduction proof is straightforward from the accepted finite-prefix machinery:

1. Formal left-limit actions only need levels in \(\mathcal L\cup\{h\}\).
2. Quote coordinates \(t<M\) in the old high prefix are dominated by \(h^-\): they already have a future high before all relevant low horizons and at the final high.
3. Quote coordinates after the last low and before the final high are final-only, hence can be fixed to \(h^-\).
4. The remaining quote coordinates are exchangeable inside each segment \(I_i\), so only total mass \(x_{i,c}\) at each low quote level matters.
5. Relative to the all-\(h^-\) baseline, each \(x_{i,c}\) contributes \(c\) to exactly those low horizons \(j\) with \(c\le m_{i,j}\), and costs \(h-c\) at the final high.

The displayed primal and dual then follow by ordinary finite LP duality.

## Gaps And Risks

The main remaining proof obligation is to write the reduction from the full \(D_n\) LP to this segment LP cleanly, especially with exact indexing and strict-crossing \(\eta\)-implementation.

The LP gives structure, but not yet a closed-form PAVA rule. The dual suggests a pooling algorithm may exist, with \(u_i\) acting as segment capacity pressure, but I did not derive it.

## Counterexamples Or Obstructions

The example
\[
0,\ 0.2,\ 0^8,\ 0.3,\ 0,\ 0.4,\ 1
\]
is a minimal obstruction to “last low only.” The last low has the largest raw surplus, but serving it alone leaves the \(\ell_2=0.3\) horizon with deficit \(3>2.88\). Adding a small amount of \(0.3^-\)-mass raises the balanced value to \(2.91\).

## Sources Consulted

Local project notes only: `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `bibliography.md`, `promising_directions.md`, and `iteration_summaries.md`.

No web search was used.

## Bibliography Candidates

None.

## Recommended Next Steps

1. Write the reduced drought LP as a candidate lemma in the notes.
2. Prove the full-to-reduced LP reduction rigorously.
3. Use the dual to search for a PAVA-like pooling rule.
4. Keep the \((0.2,0.3,0.4)\) example as a regression test for any proposed closed form.