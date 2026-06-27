## Summary

The two-low formula is a useful base case, but the plausible proof route is not a scalar adjacent merge rule. The right object seems to be an active-set / equal-revenue pooling rule derived from the CL-049 dual.

The recorded three-low stress test does not refute all pooling. It actually fits a clean active pool on the last two lows \(0.3,0.4\), with the first low \(0.2\) slack. But it does refute any greedy rule that permanently solves the first adjacent pair before seeing the later low.

## Concrete Progress

For CL-049, define the dual survival/pressure term
\[
W_i(c)=\sum_{\substack{j>i\\ c\le m_{i,j}}}\alpha_j.
\]
The segment pressure is
\[
\psi_i=
\left[
\max_{c\in\mathcal L}
\{cW_i(c)-\beta(h-c)\}
\right]_+.
\]

Complementary slackness suggests the pooling principle:

If \(x_{i,c}>0\), then
\[
cW_i(c)-\beta(h-c)=\psi_i.
\]
If \(\psi_i=0\), this becomes
\[
W_i(c)=\beta\left(\frac{h}{c}-1\right),
\]
an equal-revenue tail condition.

For the three-low regression
\[
0,\ 0.2,\ 0^8,\ 0.3,\ 0,\ 0.4,\ 1,
\]
we have
\[
S=(0.2,3,4.8),\qquad B=(1,9,2).
\]
The known optimum \(z=2.91\) is certified by
\[
\alpha_1=0,\qquad \alpha_2=\frac14,\qquad \alpha_3=\frac9{20},\qquad \beta=\frac3{10}.
\]
This gives
\[
\alpha_2+\alpha_3=0.7=\beta(1/0.3-1),
\]
\[
\alpha_3=0.45=\beta(1/0.4-1).
\]
So lows \(0.3,0.4\) form a two-point equal-revenue pool, while \(0.2\) is inactive.

## Claims Or Lemmas

**Candidate Lemma 1: KKT Support Rule.**  
For any CL-049 optimum and dual optimum, positive primal mass \(x_{i,c}>0\) can only appear at quote levels maximizing
\[
cW_i(c)-\beta(h-c).
\]
This is immediate LP complementary slackness and should be formalized first.

**Candidate Lemma 2: Zero-Pressure Pooling.**  
For increasing active lows \(c_k<\cdots<c_\ell<h\), if the relevant segment pressures vanish, the active dual weights should be
\[
\beta=\frac{c_k}{h},
\]
\[
\alpha_j=\frac{c_k}{c_j}-\frac{c_k}{c_{j+1}},
\quad c_{\ell+1}=h.
\]
This recovers the two-low middle case and the three-low stress test’s active pool.

**Candidate Lemma 3: Capacity Boundaries.**  
When a segment capacity binds with positive pressure \(\psi_i>0\), pooling must use the shifted condition
\[
cW_i(c)=\beta(h-c)+\psi_i.
\]
These are the boundary cases where a simple PAVA analogy is most likely to break.

## Proof Attempts

A viable proof strategy:

1. Start from the accepted CL-049 primal-dual pair.
2. Prove the KKT support rule rigorously.
3. Classify zero-pressure active pools using the equal-revenue equations above.
4. Treat positive segment pressure as a boundary/saturation event.
5. Design a stack algorithm that merges adjacent active lows only when their equal-revenue weights or required primal masses violate feasibility.
6. Validate every merge by emitting primal masses and dual weights, not just a scalar pooled value.

For the stress test, the active-pool proof is already nearly complete: the primal
\[
x_{0,0.4}=1,\quad x_{1,0.3}=0.3,\quad x_{1,0.4}=1.5,\quad x_{2,0.4}=2
\]
makes low 2, low 3, and final-high constraints all equal \(2.91\), with low 1 slack.

## Gaps And Risks

A scalar binary merge is probably too weak. For earlier segments, the dual depends on the whole step function \(c\mapsto W_i(c)\), not just a pooled level and pooled surplus.

Nonmonotone lows are a major risk because \(m_{i,j}\) uses running maxima. A later high low can change the usefulness of earlier quote mass for several horizons at once.

Capacity saturation is another risk. The two-low formula already has boundary cases where early capacity changes the active equations.

Strict crossing remains formal-left-limit only; actual quotes need the standard \(\eta\)-implementation.

## Counterexamples Or Obstructions

The path \(0,0.4,0.9,1\) already refutes last-low-only:
\[
D_4=68/225>1.8(1-0.9)=0.18.
\]

The three-low path refutes greedy left-to-right finalization: the pair \(0.2,0.3\) alone has a different local solution, but in the full triple the active pool is \(0.3,0.4\) and \(0.2\) is slack.

## Sources Consulted

Local run files: `problem.md`, all requested `working_notes/*`, `iterations/iter_019/idea_02/idea.md`, `iterations/iter_019/solver_attempt.md`, and prior iteration reports.

External proof-technology sources checked:
- Ayer et al. 1955, PAVA origin: https://doi.org/10.1214/aoms/1177728423
- de Leeuw, Hornik, Mair 2009, generalized PAVA: https://www.jstatsoft.org/v32/i05
- Vidal, Jaillet, Maculan 2016, nested resource allocation: https://doi.org/10.1137/140965119
- Ahuja, Orlin 2001, chain constraints: https://doi.org/10.1287/opre.49.5.784.10601
- Hochbaum 1994, allocation algorithms: https://doi.org/10.1287/moor.19.2.390

## Bibliography Candidates

No direct delayed-market-making source found.

Potential addition if not already recorded:
Dorit S. Hochbaum. “Lower and Upper Bounds for the Allocation Problem and Other Nonlinear Optimization Problems.” Mathematics of Operations Research 19(2):390-409, 1994. DOI: https://doi.org/10.1287/moor.19.2.390. Relevance: allocation/scaling algorithms that may inform a certificate-producing algorithm for CL-049.

## Recommended Next Steps

1. Prove the KKT support rule from the CL-049 dual.
2. Turn the zero-pressure equal-revenue pool into a formal lemma.
3. Test nonmonotone three-low examples before claiming PAVA-style associativity.
4. Require every proposed pooling rule to output primal and dual certificates.