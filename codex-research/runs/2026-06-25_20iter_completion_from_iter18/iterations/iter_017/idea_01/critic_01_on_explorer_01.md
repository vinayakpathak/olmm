## Summary

No fatal counterexample found. The equal-low multi-low drought formula looks worth promoting, but the explorer’s report is still a proof sketch, not a complete proof as written. The main remaining burden is to write the full reduction from the finite-prefix LP to the cumulative low-mass LP with all coordinate classes and horizon classes explicitly handled.

## Issue List

- **Plausible but incomplete:** “I derived the full reduced finite-prefix LP” is overstated. The report states the dominance and horizon-reduction claims, but does not fully prove them from the accepted \(D_n\) LP definition.
- **Missing assumption:** The claim is only for the formal left-limit two-level model, with deterministic exogenous path, expected pseudo-regret, `sup` comparator, single-fill rewards, and \(0<\ell<h\le1\). In the original strict-crossing action space it is an infimum/approximation statement via \(\ell-\eta_t,h-\eta_t\).
- **Missing detail:** \(x_i\) is total \(\ell^-\)-mass across segment \(i\), not a per-coordinate probability. This should be stated because capacities \(B_i\) can exceed \(1\).
- **Plausible but incomplete:** The feasibility proof for \(X_j=S_j/h\) needs a separate \(j=0\) boundary check. For \(j\ge1\), \(S_j-S_{j-1}\le \ell B_j\le hB_j\) is fine.
- **Worth pursuing:** The lower bound can likely be made cleaner directly in the full finite-prefix dual, using weights \((h-\ell)/h\) on the last low horizon and \(\ell/h\) on the final high horizon.

## Counterexamples Or Stress Tests

No equal-low counterexample found.

Stress tests that the formula passes:

- \(r=0\): reduces to the accepted one-low post-low identity.
- \(M=0\): \(H=0\), \(B_0=N_0\), and the first low has no old-high baseline.
- \(M=1\): the first high coordinate is useful conflict mass, not old protected mass.
- \(N_i=0\): consecutive lows are handled by \(B_i=1\), counting the previous low-time quote.
- \(S_r=0\): stable \(h^-\) gives value \(0\).
- Large \(L\): no effect, since post-last-low coordinates are final-high-only and \(h^-\) dominates.

Unequal lows remain the likely obstruction; the last-low-only rule should not be generalized.

## Literature Or Known-Result Conflicts

No known-result conflict found. A live check only re-found adjacent/background sources already represented in the notes:

- Cesa-Bianchi, Cesari, Colomboni, Foscari, Pathak, “Market Making without Regret,” COLT/PMLR 2025, https://proceedings.mlr.press/v291/cesa-bianchi25a.html. Adjacent market-making regret model, not this finite-prefix delayed-fill LP.
- Lagziel and Lehrer, “Approachability with delayed information,” Journal of Economic Theory 2015, DOI: https://doi.org/10.1016/j.jet.2015.01.010. Background for delayed-information approachability, not a proof of this identity.

## What Survives The Critique

The claimed value
\[
D_n=[\ell(s_r-1)-h(M-1)_+]_+\left(1-\frac{\ell}{h}\right)
\]
is very plausible in the formal left-limit model.

The reduced LP also appears correct:
\[
z\ge S_j-\ell\sum_{i\le j}x_i,\qquad
z\ge (h-\ell)\sum_i x_i,\qquad
0\le x_i\le B_i.
\]
The upper construction \(X_j=S_j/h\) and the last-low/final-high lower bound match.

## Bibliography Candidates

None new. The live search did not reveal a direct prior source for the equal-low finite-prefix identity.

## Recommended Next Checks

1. Write a full proof by coordinate classes: old-high protected coordinates, useful pre-low segments, last-low/post-low final-only coordinates.
2. Prove horizon dominance explicitly: initial high horizons, pre-low zero horizons, low horizons, post-low zero horizons, final high.
3. Include the strict-crossing \(\eta_t\)-implementation statement.
4. Test unequal-low droughts next; that is where earlier low horizons may genuinely bind.