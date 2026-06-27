## Summary

The monotone-threshold derandomization idea looks viable. I found no proof-strategy obstruction to proving the stated lemma by an elementary grid/bracketing, Hoeffding, union-bound, and Borel-Cantelli argument.

If completed, it would derandomize the iteration-9 universal equal-revenue \(1/e\) upper bound for deterministic exogenous paths. It still does not solve the original tail-characterization problem.

## Concrete Progress

A clean target lemma is:

For \(\mu\) with density \(d\mu(a)=a^{-1}1\{e^{-1}\le a\le1\}\,da\) and
\[
g(c)=\mathbb E_\mu[A1\{A<c\}]=(c-e^{-1})_+,
\]
there exists a deterministic sequence \(a_t\in(e^{-1},1)\) and \(e_n=o(n)\), e.g.
\[
e_n=O(n^{2/3}\sqrt{\log n}),
\]
such that for every \(n\) and every nonincreasing \(c_1\ge\cdots\ge c_n\in[0,1]\),
\[
\sum_{t=1}^n a_t1\{a_t<c_t\}
\ge
\sum_{t=1}^n g(c_t)-e_n.
\]

The solver’s proposed proof can be made precise with these steps:

1. Draw \(A_t\stackrel{iid}{\sim}\mu\).
2. For fixed \(n\), choose a grid \(G_m=\{0,1/m,\dots,1\}\).
3. Count nonincreasing \(G_m\)-valued threshold sequences by
\[
\binom{n+m}{m}\le \exp(O(m\log n)).
\]
4. For each grid sequence \(d_1\ge\cdots\ge d_n\), apply one-sided Hoeffding to
\[
\sum_t A_t1\{A_t<d_t\}-\sum_t g(d_t).
\]
5. Take \(m=\lceil n^{1/3}\rceil\) and deviation \(u_n=C\sqrt{nm\log n}\). With \(C\) large,
\[
\Pr(E_n^c)\le \exp(O(m\log n)-\Omega(C^2m\log n))
\]
is summable.
6. Borel-Cantelli gives one infinite realization satisfying all large-\(n\) grid events.
7. For arbitrary monotone \(c_t\), round downward to \(d_t=\lfloor m c_t\rfloor/m\). Then
\[
a_t1\{a_t<c_t\}\ge a_t1\{a_t<d_t\},
\qquad
g(d_t)\ge g(c_t)-1/m.
\]
So the loss is \(u_n+n/m=O(n^{2/3}\sqrt{\log n})\).

## Claims Or Lemmas

**Lemma A: Uniform monotone-threshold derandomization.**  
The lemma above is likely true. The proof should use lower bracketing, not VC-type label counting.

**Lemma B: Deterministic \(1/e\) upper bound.**  
Using Lemma A, for every deterministic exogenous price path and horizon \(T\), with
\[
M_{t,T}=\max_{t<s\le T}P_s,
\]
the sequence \(M_{1,T}\ge\cdots\ge M_{T-1,T}\) is nonincreasing, and
\[
R_T\le (T-1)/e+o(T).
\]

**Corollary: deterministic policies also achieve the sharp \(1/e\) worst-case known-path constant.**  
Combined with CL-027, this should upgrade the randomized upper theorem to a deterministic horizon-oblivious upper theorem.

## Proof Attempts

The main proof route is sound:

\[
\sum_{t<T} r_t(a_t)
=
\sum_{t<T} a_t1\{a_t<M_{t,T}\}
\ge
\sum_{t<T} g(M_{t,T})-e_{T-1}.
\]

The comparator satisfies
\[
\sup_a\sum_{t<T}a1\{a<M_{t,T}\}
\le
\sum_{t<T}M_{t,T}.
\]

Since
\[
M-g(M)\le e^{-1}
\]
for every \(M\in[0,1]\), the regret is at most
\[
(T-1)/e+e_{T-1}.
\]

## Gaps And Risks

The key gap is not conceptual but presentational: the Borel-Cantelli step needs explicit constants and a defined good event \(E_n\).

Boundary handling must be explicit. Strict crossing is safe if all inequalities use \(a<c\), the random construction chooses a realization avoiding endpoints, and arbitrary thresholds are handled by downward rounding.

The result is nonconstructive. It proves existence of a deterministic sequence, not an explicit computable policy. A constructive sequence would require extra discrepancy or conditional-expectation work.

This derandomization does not revive any raw-tail necessity statement.

## Counterexamples Or Obstructions

No counterexample to the lemma found.

Ordinary one-dimensional low discrepancy is not obviously enough, because the adversary chooses a time-varying monotone threshold sequence, not a fixed threshold. The grid/bracketing proof avoids this issue.

The theorem remains limited to exogenous paths. If prices react to the learner’s realized quote, \(M_{t,T}\) is no longer a fixed pathwise scalar independent of \(a_t\).

## Sources Consulted

Local: all requested working notes, `iterations/iter_010/idea_01/idea.md`, `iterations/iter_010/solver_attempt.md`, `solution_critic_01.md`, and `solution_gate.md`.

Web:
- Fuchang Gao and Jon A. Wellner, “Entropy Estimate For High Dimensional Monotonic Functions,” arXiv:math/0512641. https://arxiv.org/abs/math/0512641
- Harald Niederreiter, *Random Number Generation and Quasi-Monte Carlo Methods*, SIAM, 1992. https://epubs.siam.org/doi/book/10.1137/1.9781611970081
- Wiley listing for Alon-Spencer, *The Probabilistic Method*, 4th ed. https://www.wiley.com/en-be/The%2BProbabilistic%2BMethod%2C%2B4th%2BEdition-p-9781119062073

## Bibliography Candidates

- Noga Alon and Joel H. Spencer. *The Probabilistic Method*, 4th ed., Wiley, 2016. Standard background for probabilistic-method existence proofs using concentration and union bounds.
- Fuchang Gao and Jon A. Wellner. “Entropy Estimate For High Dimensional Monotonic Functions,” arXiv:math/0512641, 2005. Relevant if replacing the elementary grid proof by empirical-process bracketing.
- Harald Niederreiter. *Random Number Generation and Quasi-Monte Carlo Methods*, SIAM, 1992. Relevant for possible constructive low-discrepancy replacements.

## Recommended Next Steps

Write the monotone-threshold lemma as a formal proposition with constants.

Then state the deterministic known-path theorem:

\[
\exists\text{ deterministic horizon-oblivious }\pi
\quad
\forall P,\quad
\limsup_T R_T^\pi(P)/T\le 1/e.
\]

Finally combine with CL-027 to record the sharp deterministic-policy \(1/e\) theorem, while keeping it separate from the original false tail-characterization conjecture.