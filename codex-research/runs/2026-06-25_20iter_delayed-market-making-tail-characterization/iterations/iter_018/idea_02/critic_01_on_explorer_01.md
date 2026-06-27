## Summary

I do not see a counterexample to the explorer’s restricted-dual algebra. The formula for
\[
\psi_i(\alpha,\beta)
=
\left[
\max_{c\in\mathcal L}
\left\{
c\sum_{j>i,\ c\le m_{i,j}}\alpha_j-\beta(h-c)
\right\}
\right]_+
\]
is the right dual of the proposed reduced LP.

The main issue is that the explorer has not proved the support-reduction theorem for the full finite-prefix dual. “Omitted horizons do not help” is plausible, but it is still a proof obligation, not an established lemma.

## Issue List

1. **Plausible but incomplete:** Candidate Lemma 2 needs a real unnormalized-dual proof.  
   Moving zero-plateau mass to the preceding low is believable, but the proof must check all \(t<T\) support terms, especially new quote coordinates after the low. For those coordinates \(M_{t,T}=0\), so the terms vanish, but this must be stated.

2. **Missing assumption/proof:** Pre-first-low dual mass is not automatically harmless by normalization alone.  
   The correct route should decompose the homogeneous dual functional \(\Phi\) into pre-low mass plus later mass, prove the pre-low part contributes exactly zero and creates no support-function boundary defect, then renormalize the later mass only if its objective is nonnegative.

3. **Plausible but incomplete:** The restricted dual proves only a lower bound on full \(D_n\) unless support reduction or the primal full-to-reduced LP is separately proved.  
   The explorer’s “works cleanly” language is too strong as a standalone claim.

4. **Missing bookkeeping:** Edge cases \(M=0\), \(M=1\), \(N_i=0\), \(L=0\), duplicate low values, and horizons inside the initial \(h^M\) block need explicit handling. These are probably fixable, but they are exactly where off-by-one errors enter.

5. **Unsupported citation, nonfatal:** The nested-resource/PAVA papers are proof-technology background only. They do not support the market-making support-reduction claim.

## Counterexamples Or Stress Tests

No fatal counterexample found.

The toy path
\[
0,0.4,0.9,1
\]
supports the explorer, not a refutation. The reduced LP optimum \(68/225\) is feasible with
\[
x_{0,0.4}=11/45,\quad x_{0,0.9}=34/45,\quad x_{1,0.9}=4/5.
\]
The dual weights
\[
\alpha_1=5/9,\quad \alpha_2=2/45,\quad \beta=2/5
\]
give \(\psi_0=\psi_1=0\) and objective \(68/225\). This also suggests the parallel \(14/45\) value reported elsewhere is an arithmetic/optimization error, not a break in idea_02.

Useful stress tests still needed:

- \(h^2,0,\ell_1,\ell_2,h\): checks pre-first-low old-high mass.
- \(0,\ell_1,0^L,\ell_2,h\): checks merging zero-horizon mass after a low.
- Nonmonotone lows such as \(0,0.8,0,0.3,1\): checks that \(m_{i,j}\) running maxima handle drops correctly.

## Literature Or Known-Result Conflicts

No direct known-result conflict found. The literature I checked supports nested resource-allocation or isotone proof technology, not the delayed-market-making theorem itself:

- Vidal, Jaillet, Maculan, “A Decomposition Algorithm for Nested Resource Allocation Problems,” SIAM J. Optimization 2016, DOI: https://doi.org/10.1137/140965119.
- Vidal, Gribel, Jaillet, “Separable Convex Optimization with Nested Lower and Upper Constraints,” INFORMS J. Optimization 2019, DOI: https://doi.org/10.1287/ijoo.2018.0004.
- de Leeuw, Hornik, Mair, “Isotone Optimization in R: Pool-Adjacent-Violators Algorithm (PAVA) and Active Set Methods,” JSS 2009, DOI: https://doi.org/10.18637/jss.v032.i05.
- Ahuja, Orlin, “A Fast Scaling Algorithm for Minimizing Separable Convex Functions Subject to Chain Constraints,” Operations Research 2001, DOI: https://doi.org/10.1287/opre.49.5.784.10601.
- Wu, Nip, He, “A New Combinatorial Algorithm for Separable Convex Resource Allocation with Nested Bound Constraints,” INFORMS J. Computing 2021, DOI: https://doi.org/10.1287/ijoc.2020.1006.

## What Survives The Critique

- The restricted full-dual calculation matches the reduced-LP dual.
- The \(\psi_i\) expression is structurally correct.
- Intermediate zero horizons after a low are very likely mergeable into the latest low horizon.
- The \(0,0.4,0.9,1\) certificate \(68/225\) checks out.
- The result remains local: one-drought, deterministic known path, formal left-limit model.

## Bibliography Candidates

No new direct theorem source. The five sources above are worth keeping only as algorithmic/proof-technology background for a later pooling or nested-resource-allocation rule.

## Recommended Next Checks

1. Prove support reduction in the unnormalized full dual, separately for pre-low horizons and post-low zero horizons.
2. Write the exact cancellation for protected old-high and final-only coordinates.
3. Verify the full primal LP and reduced LP on small rational examples, especially with \(M>1\), zero-length gaps, and nonmonotone lows.
4. Only then promote “omitted horizons do not help” from plausible to accepted.