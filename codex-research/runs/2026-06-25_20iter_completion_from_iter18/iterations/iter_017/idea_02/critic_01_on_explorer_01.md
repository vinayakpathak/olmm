## Summary

The explorer’s numeric example survives: the reduced LP optimum is indeed `z=2.91`, and the proposed solution keeps all prefix deficits at or below `2.91` on that path. The main problem is proof status, not the arithmetic.

The reduced drought LP is worth pursuing, but Lemma 1 is not proved by the already accepted finite-alphabet reduction. The explorer still owes the full-to-reduced LP argument: action-menu reduction, segment exchangeability, dominance of intermediate horizons, and old/final-only coordinate elimination.

## Issue List

- **Fatal gap for promotion:** Lemma 1 is only conditional. The accepted finite-alphabet dual reduction does not by itself imply the displayed segment LP. A theorem needs both directions: every full finite-prefix marginal policy maps to segment masses without improving deficits, and every segment solution lifts to valid per-time marginals.

- **Missing assumption:** The statement must explicitly be in the deterministic exogenous known-path, horizon-oblivious, expected-regret, formal left-limit model with `sup` comparator and single-fill rewards. Actual strict-crossing quotes require an \(\eta\)-implementation.

- **Missing assumption / indexing:** The path notation should be fixed. For \(r\) lows the pre-low zero blocks are \(N_0,\ldots,N_{r-1}\), while the post-last-low tail is \(L\). The quote at the last low is final-only and excluded from the useful segments.

- **Plausible but incomplete:** Restricting actions to \(\mathcal L\cup\{h\}\) is plausible by rounding an off-level action up to the next observed low or to \(h\), but this dominance proof is not written.

- **Plausible but incomplete:** Intermediate zero horizons are asserted away. They likely duplicate the preceding low-horizon constraint because no new positive price appears, but this needs a clean proof.

- **False / unsupported:** The example with three lows is not a “minimal obstruction” to last-low-only behavior. Two unequal lows already suffice.

- **Worth pursuing:** The dual form is coherent and useful. The \(u_i\) terms look like capacity pressures, but a PAVA-like pooling rule is not yet derived.

## Counterexamples Or Stress Tests

- Explorer example verified:
  \[
  h=1,\ M=0,\ (N_0,N_1,N_2)=(1,8,1),\quad
  (\ell_1,\ell_2,\ell_3)=(0.2,0.3,0.4).
  \]
  Reduced LP optimum is \(z=2.91\). One optimal segment solution uses:
  segment 0: one unit at \(0.4^-\);
  segment 1: \(0.3\) units at \(0.3^-\), \(1.5\) units at \(0.4^-\);
  segment 2: two units at \(0.4^-\).
  The active constraints are low 2, low 3, and final high.

- Simpler two-low obstruction:
  \[
  h=1,\quad M=0,\quad (N_0,N_1)=(1,0),\quad
  (\ell_1,\ell_2)=(0.4,0.9),
  \]
  path \(0,0.4,0.9,1\). Here \(S=(0.4,1.8)\). The naive last-low value is
  \[
  1.8(1-0.9)=0.18,
  \]
  but the reduced LP optimum is
  \[
  z=68/225\approx 0.3022.
  \]
  Thus an earlier low horizon binds already for \(r=2\).

- Boundary stress tests still needed: \(S_j\le0\) old-high damping cases, repeated equal lows, nonmonotone lows, and \(N_i=0\) edge cases.

## Literature Or Known-Result Conflicts

No direct known-result conflict found. Existing PAVA/isotonic-regression literature supports the idea that pooling algorithms can arise as LP dual methods, but it does not prove this drought LP has a PAVA rule. The final-high debt term and multi-level suffix maxima are extra structure.

Consecutive-ones / interval-matrix facts are also only background unless the reduced LP is transformed into a genuine interval-incidence LP. The coefficients \(c\), max over quote levels, and final-debt constraint prevent a direct total-unimodularity shortcut.

## What Survives The Critique

- The reduced LP is a strong candidate lemma.
- The dual written by the explorer appears algebraically consistent with the reduced primal.
- The explorer’s \(z=2.91\) example is a valid regression test for any proposed last-low or pooling formula.
- The main qualitative claim survives: unequal lows can make earlier low horizons genuinely binding.

## Bibliography Candidates

- Miriam Ayer, H. D. Brunk, G. M. Ewing, W. T. Reid, Edward Silverman. “An Empirical Distribution Function for Sampling with Incomplete Information.” *Annals of Mathematical Statistics* 26:641-647, 1955. DOI: https://doi.org/10.1214/aoms/1177728423. Relevance: early source for the pooling procedure behind PAVA/isotonic MLE.

- Nilotpal Chakravarti. “Isotonic Median Regression: A Linear Programming Approach.” *Mathematics of Operations Research* 14(2):303-308, 1989. DOI: https://doi.org/10.1287/moor.14.2.303. Relevance: shows PAVA as a dual method for an LP; useful analogy for deriving a pooling rule from the drought LP dual.

## Recommended Next Checks

1. Prove the full-to-reduced LP reduction before promoting Lemma 1.
2. Add the two-low example above as a regression test; demote “minimal” for the three-low example.
3. Write a separate dominance lemma for intermediate zero horizons and final-only coordinates.
4. Test the reduced LP against exact finite-prefix LP computations on nonmonotone low sequences.
5. Try deriving pooling from the dual only after the reduced LP is proved exact.