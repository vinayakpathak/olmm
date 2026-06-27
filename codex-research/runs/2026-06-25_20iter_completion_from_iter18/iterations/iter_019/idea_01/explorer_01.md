## Summary

The solver’s two-low formulas look correct, conditional on the accepted CL-049/LB-044 one-drought reduced LP and the formal left-limit model. I found no missed `p>q` boundary case. The key feasibility assumptions
\[
S_1\le S_2,\qquad S_2/h\le B_0+B_1
\]
are sufficient for the displayed `p>q` formula, together with \(0<q<p<h\) and nonnegative capacities. They are also inherited from the actual path definitions.

## Concrete Progress

For \(p<q\), the claimed collapse is valid:

\[
a=x_{0,p},\qquad y=x_{0,q}+x_{1,q}.
\]

The segment-1 \(p\)-mass is dominated by \(q\)-mass, and \(x_{0,q},x_{1,q}\) have identical payoff/debt vectors once \(a\) is fixed. The only capacity condition is
\[
0\le a\le B_0,\qquad 0\le y\le B_0+B_1-a.
\]

For \(p>q\), the reduced LP further collapses to
\[
u=x_{0,p},\qquad w=x_{1,q},
\]
because \(x_{0,q}\) is dominated by \(x_{0,p}\), and \(x_{1,p}\) is dominated by the default \(h^-\) quote.

## Claims Or Lemmas

The `p>q` reduced LP is exactly
\[
\min z
\]
subject to
\[
z\ge S_1-pu,\qquad
z\ge S_2-pu-qw,\qquad
z\ge (h-p)u+(h-q)w,
\]
\[
0\le u\le B_0,\qquad 0\le w\le B_1.
\]

Its value is
\[
D=
\begin{cases}
\dfrac{(h-p)S_2}{h}, & S_2/h\le B_0,\\[6pt]
\max\left\{S_1-pB_0,\ \dfrac{(h-q)S_2}{h}-(p-q)B_0\right\}, & S_2/h>B_0.
\end{cases}
\]

## Proof Attempts

For fixed \(u\), the optimal \(w\) balances the second low constraint and final high-debt constraint:
\[
S_2-pu-qw=(h-p)u+(h-q)w,
\]
so
\[
w=S_2/h-u.
\]

Both the low-2/high balanced value and the low-1 value decrease as \(u\) increases. Hence \(u\) should be as large as feasibility allows:
\[
u^*=\min\{B_0,S_2/h\}.
\]

If \(S_2/h\le B_0\), take \(u=S_2/h,w=0\). Since \(S_1\le S_2\), the low-1 constraint is no larger than the active low-2/high value.

Dual certificate:
\[
\alpha_1=0,\qquad \alpha_2=(h-p)/h,\qquad \beta=p/h.
\]

If \(S_2/h>B_0\), take
\[
u=B_0,\qquad w=S_2/h-B_0,
\]
which is feasible by \(S_2/h\le B_0+B_1\). The active low-2/high value is
\[
\frac{(h-q)S_2}{h}-(p-q)B_0.
\]
If this dominates \(S_1-pB_0\), a dual certificate is
\[
\alpha_1=0,\qquad \alpha_2=(h-q)/h,\qquad \beta=q/h.
\]
If \(S_1-pB_0\) dominates, use
\[
\alpha_1=1,\qquad \alpha_2=\beta=0.
\]

For \(p<q\), the solver’s three cases follow from minimizing
\[
\max\{S_1-pa,\ \theta+(q-p)a\},
\qquad
\theta=\frac{(h-q)S_2}{h},
\]
over \(0\le a\le B_0\). The intersection is \(a=(S_1-\theta)/q\), giving exactly the displayed cases.

## Gaps And Risks

This is not a proof of a global gluing theorem. It is only a two-low closed form for one drought, relying on CL-049.

Strict crossing still requires the usual \(\eta\)-implementation of formal quotes \(c^-\).

The formulas exclude \(p=q\); that boundary should be routed to the accepted equal-low theorem.

## Counterexamples Or Obstructions

No counterexample found. The regression path
\[
0,\ 0.4,\ 0.9,\ 1
\]
falls in the \(p<q\) middle case and gives
\[
D_4=68/225,
\]
matching the accepted value and confirming the unequal-low last-low obstruction.

## Sources Consulted

Local: [solver_attempt.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_completion_from_iter18/iterations/iter_019/solver_attempt.md), [idea.md](/Users/vinayakpathak/olmm/.codex-research/runs/2026-06-25_20iter_completion_from_iter18/iterations/iter_019/idea_01/idea.md), plus the requested working notes, especially CL-049/LB-044.

Web: Hochbaum 1994 allocation paper and Vidal-Jaillet-Maculan 2016 nested allocation paper. These are proof-technology background, not direct support for the two-low formula.

## Bibliography Candidates

- Dorit S. Hochbaum. “Lower and Upper Bounds for the Allocation Problem and Other Nonlinear Optimization Problems.” Mathematics of Operations Research 19(2):390-409, 1994. DOI: https://doi.org/10.1287/moor.19.2.390; PDF: https://hochbaum.ieor.berkeley.edu/html/pub/MOR-Hochbaum94.pdf. Relevance: allocation/resource-allocation proof technology for future pooling rules.

## Recommended Next Steps

Promote the two-low formula as a lemma with the primal-dual certificates above.

Add exact rational regression tests for both \(p<q\) and \(p>q\), including equality boundaries \(S_1=\theta\), \(S_1=\theta+qB_0\), \(S_2/h=B_0\), and branch ties in the `p>q` max.