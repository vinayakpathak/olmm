## Summary

I do not see a fatal flaw in the explorer’s zero-pressure dual certificate. The algebra for nonnegative \(\alpha_j\), normalization, and \(\psi_i=0\) is sound.

The main gap the explorer leaves, the Hall/scheduling feasibility proof for exactness on actual strictly increasing one-drought paths, appears closable. So my critique is mostly: the lower bound is solid, the exactness claim needs explicit path-feasibility assumptions, and the report is too cautious rather than too strong.

## Issue List

1. **Plausible but incomplete:** the Hall/scheduling step is not written.
   The explorer reduces exactness to
   \[
   \sum_{j=k}^t \frac{y_j}{\ell_j}\le \sum_{i<t}B_i,
   \qquad t\ge k,
   \]
   but does not prove it. This is the only real proof gap.

2. **Missing assumption:** exactness must use the actual increasing-low path formula
   \[
   S_t=[\ell_t(H+C_t)-hH]_+,\qquad C_t=\sum_{i<t}B_i.
   \]
   It is false for arbitrary reduced-LP data. “Path-feasible” should be defined by this formula or an equivalent set of inequalities.

3. **Missing assumption:** the primal construction needs a maximizing \(k\) with
   \[
   S_{k-1}\le Z_k\le S_k.
   \]
   This follows from the recurrence
   \[
   Z_{k+1}-Z_k=\frac{\ell_{k+1}-\ell_k}{\ell_k}(Z_k-S_k),
   \]
   plus monotonicity of \(S_t\), but the explorer only sketches it.

4. **Unsupported citation, mild:** Gallo-Grigoriadis-Tarjan and Picard-Queyranne are relevant proof-technology sources for future parametric-flow algorithms, but they are overkill for this lemma. The needed feasibility fact is just a Hall/max-flow theorem for nested capacities.

## Counterexamples Or Stress Tests

- **Artificial reduced-LP counterexample:** take \(h=1\), \(p=0.4\), \(q=0.9\), \(B_0=B_1=1\), \(S_1=1.2\), \(S_2=1.3\). Then the \(p<q\) third branch gives
  \[
  D=S_1-pB_0=0.8,
  \]
  while \(Z_{\rm inc}\approx0.7244\). This violates \(S_1\le pB_0\), so it is not an actual market path. It confirms the explorer’s warning: exactness cannot be claimed for arbitrary reduced data.

- **Actual increasing-low search:** small grid searches over increasing lows, \(H\le5\), \(B_i\le5\), \(r\le4\), found no Hall failure. The algebra below explains why.

- **Nonmonotone lows:** examples such as \(0.4,0.9,0.5\) remain outside scope. There \(m_{i,t}\ne\ell_t\), so the zero-pressure proof does not apply.

## Literature Or Known-Result Conflicts

No known-result conflict found. The scheduling subproblem is a fractional transportation/flow feasibility problem with nested eligibility sets. Gale’s network-flow generalization of Hall’s theorem is the most direct classical citation.

The explorer’s Gallo/Picard citations are not wrong, but they are better treated as optional background for a future active-set or parametric-min-cut implementation, not as support for the current proof.

## What Survives The Critique

The dual lower bound survives:

\[
D_n\ge Z_{\rm inc}:=\max_k Z_k.
\]

More strongly, exactness for actual strictly increasing one-drought paths looks provable. Let \(k\) maximize \(Z_k=z\), set
\[
y_k=S_k-z,\qquad y_j=\Delta_j\quad(j>k).
\]
The needed Hall inequality is
\[
\sum_{j=k}^t\frac{y_j}{\ell_j}\le C_t.
\]
It follows because
\[
Z_k-\left(S_k+\ell_k\sum_{j=k+1}^t\frac{\Delta_j}{\ell_j}-\ell_k C_t\right)
=
\frac{\ell_k}{h}(hC_t-S_t)
+
\sum_{j>t}\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j
\ge0.
\]
Here \(S_t\le hC_t\) and \(\Delta_j\ge0\) hold for actual increasing-low paths.

Thus the zero-pressure primal masses should be schedulable, giving \(D_n=Z_{\rm inc}\), not merely \(D_n\ge Z_{\rm inc}\), once this Hall argument is written.

## Bibliography Candidates

- David Gale. “A Theorem on Flows in Networks.” *Pacific Journal of Mathematics* 7(2):1073-1082, 1957. https://msp.org/pjm/1957/7-2/pjm-v7-n2-p04-p.pdf. Relevance: direct Hall/max-flow feasibility theorem for the nested scheduling step.

- Giorgio Gallo, Michael D. Grigoriadis, Robert E. Tarjan. “A Fast Parametric Maximum Flow Algorithm and Applications.” *SIAM Journal on Computing* 18(1):30-55, 1989. https://doi.org/10.1137/0218003. Relevance: optional proof technology for future active-set algorithms.

- Jean-Claude Picard, Maurice Queyranne. “On the structure of all minimum cuts in a network and applications.” *Mathematical Programming* 22:121-128, 1982. https://doi.org/10.1007/BF01581031. Relevance: optional min-cut lattice background.

## Recommended Next Checks

1. Promote the increasing-low theorem by writing the Hall proof above carefully.
2. State exact assumptions: strict increasing lows, one drought, formal left-limit model, actual path formula for \(S_t\).
3. Add the artificial reduced-LP counterexample to warn against arbitrary \(S,B\) data.
4. Then test duplicate and nonmonotone lows separately; they need a different pressure analysis.