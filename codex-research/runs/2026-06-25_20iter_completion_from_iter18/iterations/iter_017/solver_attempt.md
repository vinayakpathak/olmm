## Verdict

SOLVED: no

I do not have a full characterization of sublinear regret. But I think the iteration-16 candidate CL-048 can be promoted: the equal-low multi-low single-drought formula is provable in the formal two-level left-limit model.

## Candidate Solution Or Main Attempt

Consider
\[
h^M,0^{N_0},\ell,0^{N_1},\ell,\ldots,0^{N_r},\ell,0^L,h,
\qquad 0<\ell<h.
\]
Let \(s_j\) be the \(j\)-th low time, \(A_j=s_j-1\), and
\[
H=(M-1)_+,\qquad S_j=[\ell A_j-hH]_+ .
\]
Then the finite-prefix value should be
\[
D_n=S_r\left(1-\frac{\ell}{h}\right).
\]

The proof reduces the full LP to low-mass variables. In the two-level left-limit model every action is dominated by either \(\ell^-\) or \(h^-\): actions below \(\ell\) are dominated by \(\ell^-\), actions in \((\ell,h)\) by \(h^-\), and actions above \(h\) by \(h^-\). Also \(\ell^-\) is dominated by \(h^-\) on the first \(H\) old-high coordinates and after the last low, so only coordinates between the last old high and the last low matter.

Partition useful coordinates into segments before each low. Let \(x_i\) be the total probability mass assigned to \(\ell^-\) in segment \(i\), with capacities
\[
B_0=N_0+\mathbf 1_{\{M\ge1\}},\qquad B_i=N_i+1\quad(i\ge1).
\]
At low horizon \(s_j\), the baseline \(h^-\) policy earns \(hH\), so the low-side deficit is
\[
S_j-\ell\sum_{i\le j}x_i .
\]
At the final high horizon, each unit of \(\ell^-\)-mass creates high debt \(h-\ell\), so the final deficit is
\[
(h-\ell)\sum_i x_i .
\]
Intermediate zero horizons are identical to the latest low horizon, and early high horizons are matched by \(h^-\). Thus
\[
D_n=\inf_{0\le x_i\le B_i}
\max\left\{
\max_{0\le j\le r}\left(S_j-\ell\sum_{i\le j}x_i\right),
(h-\ell)\sum_i x_i,
0
\right\}.
\]

The upper bound uses
\[
\sum_{i\le j}x_i=\frac{S_j}{h}.
\]
This is feasible because \(S_j\) is nondecreasing and
\[
S_j-S_{j-1}\le \ell(A_j-A_{j-1})=\ell B_j\le hB_j.
\]
Then every low deficit is \(S_j(1-\ell/h)\le S_r(1-\ell/h)\), and final high debt is exactly \(S_r(1-\ell/h)\).

The lower bound follows from only the last low and final high constraints. For any feasible \(x\), with \(X_r=\sum_{i\le r}x_i\),
\[
\max\{S_r-\ell X_r,\,(h-\ell)X_r\}
\ge S_r\left(1-\frac{\ell}{h}\right),
\]
with equality at \(X_r=S_r/h\).

## Concrete Lemmas Or Reductions

1. Two-level dominance: restrict marginals to \(\{\ell^-,h^-\}\).
2. Horizon dominance: only low horizons \(s_j\) and the final high horizon bind.
3. Reduced cumulative-mass LP above exactly represents \(D_n\).
4. Equal-low last-low formula:
\[
D_n=[\ell(s_r-1)-h(M-1)_+]_+\left(1-\frac{\ell}{h}\right).
\]

## Gaps And Failure Points

The reduction is for the formal left-limit model. Strict crossing in the original action space still needs the usual implementation by \(\ell-\eta_t\) and \(h-\eta_t\) with total \(\eta\)-loss controlled.

This does not solve unequal lows. The monotonicity \(S_j-S_{j-1}\le \ell B_j\) is doing real work and will not directly survive if low levels vary.

## Counterexamples Or Obstructions

Post-low zero tails still add no local conflict. The formula is independent of \(L\), matching iteration 16.

The result also reinforces that stable-high regret or raw waiting time is not a lower-bound certificate: all obstruction is captured by unresolved low surplus \(S_r\) and the high debt needed to resolve it.

## Literature And Bibliography Candidates

I did a quick live search and found no new primary source for this finite-prefix LP identity. Search hits were either already represented in the notes or adjacent only, e.g. “Market Making without Regret” and Lagziel-Lehrer delayed information background. No bibliography update is needed from this attempt.

## Promising Ideas To Explore

Unequal-low droughts are the next target. The right reduced LP should have multiple low quote levels and front-loading constraints; earlier lows may bind genuinely.

A repeated-drought recursion may now use this equal-low theorem as a base case: each drought contributes only unresolved surplus at its last relevant low, while low-quote mass carries high debt forward.

## Notes For Critics

Please check the exact reduction from the full finite-prefix LP to the cumulative \(x_i\)-LP. The proof hinges on dominance of \(\ell^-/h^-\), nonbinding intermediate horizons, and feasibility of \(X_j=S_j/h\) under the segment capacities.