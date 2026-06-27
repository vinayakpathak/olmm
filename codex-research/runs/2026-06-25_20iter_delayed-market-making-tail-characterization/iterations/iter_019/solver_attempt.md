## Verdict
SOLVED: no

The original iff conjecture is already refuted in the notes. For iteration 19, I did not solve the global known-path gluing problem \(D_n=o(n)\Rightarrow o(T)\), but I found a useful exact reformulation of the accepted unequal-low one-drought LP and a closed two-low increasing subcase.

## Candidate Solution Or Main Attempt
Work with the accepted one-drought reduced LP from CL-049/LB-044. For a proposed regret level \(z\), define residual low demands
\[
d_j(z)=(S_j-z)_+.
\]
Then the reduced LP is feasible with value at most \(z\) iff the minimum high-debt needed to cover these low demands is at most \(z\). More precisely, define
\[
C(z)=\min_x \sum_{i,c}(h-c)x_{i,c}
\]
subject to
\[
\sum_{i<j}\sum_{c\le m_{i,j}} c x_{i,c}\ge d_j(z),\qquad
\sum_c x_{i,c}\le B_i,\qquad x_{i,c}\ge0.
\]
Then the one-drought value is exactly
\[
D=\inf\{z\ge0:C(z)\le z\}.
\]
This separates the problem into a parametric covering problem plus a scalar fixed-point/threshold search.

For two increasing lows \(0<\ell<u<h\), this gives an explicit formula. Let \(B_0,B_1\) be the two useful segment capacities and \(S_1,S_2\) the low-horizon surpluses. For a fixed \(z\),
\[
d_1=(S_1-z)_+,\qquad d_2=(S_2-z)_+.
\]
The minimum-debt cover is
\[
C(z)=\frac{h-\ell}{\ell}\,d_1
+\frac{h-u}{u}\,(d_2-d_1)_+,
\]
provided
\[
d_1/\ell\le B_0,\qquad
d_1/\ell+(d_2-d_1)_+/u\le B_0+B_1.
\]
Otherwise \(z\) is infeasible or capacity-saturated and the same covering LP must be solved with active caps.

In the non-saturated case, if the last-low-only candidate
\[
z_{\rm last}=\frac{h-u}{h}S_2
\]
satisfies \(z_{\rm last}\ge S_1\), then the first low is slack and \(D=z_{\rm last}\). If \(z_{\rm last}<S_1\), the first low genuinely binds and
\[
D=\frac{h-\ell}{h}S_1+\frac{\ell(h-u)}{hu}(S_2-S_1).
\]

## Concrete Lemmas Or Reductions
**Parametric Debt-Cover Reduction.** The accepted one-drought LP is equivalent to finding the smallest \(z\) for which the residual low demands \(d_j(z)\) can be covered with high debt at most \(z\). This is exact and follows by moving \(z\) out of the low constraints.

**Two Increasing Lows.** For
\[
h^M,0^{N_0},\ell,0^{N_1},u,0^L,h,\qquad 0<\ell<u<h,
\]
the two-low formulas above are exact in the non-saturated regime.

Regression check:
For \(P=(0,0.4,0.9,1)\), \(h=1\), \(S_1=0.4\), \(S_2=1.8\). Since \(0.1\cdot1.8=0.18<S_1\),
\[
D=0.6(0.4)+0.4\cdot\frac{0.1}{0.9}(1.4)=\frac{68}{225}.
\]
This matches CL-049.

A second rational LP check for
\[
0,0.2,0^8,0.3,0,0.4,1
\]
gives exact value
\[
D=\frac{291}{100}=2.91,
\]
with primal masses
\[
x_{1,0.3}=0.3,\qquad x_{1,0.4}=4.5,
\]
and active low-2, low-3, and final-debt constraints.

## Gaps And Failure Points
The parametric reduction does not solve repeated droughts. It is local to one resolving high.

The two-low formula has capacity caveats. If the displayed feasibility inequalities fail at the fixed point, caps become active and the simple expression must be replaced by the full covering LP.

No proof emerged that \(D_n=o(n)\) implies the fixed-envelope compactness criterion. The projective consistency/gluing obstruction remains open.

## Counterexamples Or Obstructions
The two-low formula explains why the naive unequal-low “last low only” rule fails: last-low-only is valid only when the last-low candidate already covers earlier-low surplus. In \(0,0.4,0.9,1\), it does not.

The three-low regression \(0,0.2,0^8,0.3,0,0.4,1\) suggests a simple PAVA rule is unlikely without extra transformation: the optimum skips the first and third useful segments and uses only middle-segment mass at two levels.

## Literature And Bibliography Candidates
No direct delayed-market-making characterization surfaced. Relevant proof-technology sources remain:

- Thibaut Vidal, Daniel Gribel, Patrick Jaillet, “Separable Convex Optimization with Nested Lower and Upper Constraints,” INFORMS Journal on Optimization, 2019. DOI: https://doi.org/10.1287/ijoo.2018.0004. Relevant for nested resource allocation algorithms.
- Jan de Leeuw, Kurt Hornik, Patrick Mair, “Isotone Optimization in R: Pool-Adjacent-Violators Algorithm (PAVA) and Active Set Methods,” Journal of Statistical Software, 2009. DOI: https://doi.org/10.18637/jss.v032.i05. Relevant for possible pooling analogies.
- Ravindra K. Ahuja, James B. Orlin, “A Fast Scaling Algorithm for Minimizing Separable Convex Functions Subject to Chain Constraints,” Operations Research, 2001. DOI: https://doi.org/10.1287/opre.49.5.784.10601. Relevant if the cover LP can be transformed into chain-constrained allocation.

## Promising Ideas To Explore
Turn \(C(z)\) into a min-cost flow or nested-resource allocation instance. This may yield an algorithmic “pooling” rule even if no simple closed form exists.

Classify the capacity-active regimes for the two-low increasing case. That is the smallest complete unequal-low theorem beyond the accepted regression.

Use the debt-cover view for repeated droughts: low quote mass creates debt at each later high, so repeated episodes may compose through shared debt budgets rather than through additive local \(D\)-values.

## Notes For Critics
The new two-low formula is only for increasing lows and the formal left-limit model. Strict crossing still requires the usual \(\eta\)-implementation.

The parametric cover reduction is exact but almost tautological; its value is that it isolates the hard part as a covering/debt problem and gives a clean way to test pooling claims.