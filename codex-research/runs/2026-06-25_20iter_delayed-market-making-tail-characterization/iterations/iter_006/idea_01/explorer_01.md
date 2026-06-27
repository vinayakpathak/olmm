## Summary

The LP-duality lens strongly supports the idea. For a zero block followed by a terminal threshold \(C\), the prefix-compatibility gap is exactly

\[
\kappa(C)=\sup_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda[C]-\sup_{a\in[0,1]} a\,\Pr_\lambda(C>a)\right),
\]

with the strict-threshold caveat handled by `sup`/limit arguments. This is precisely welfare minus optimal posted-price revenue.

Optimizing over arbitrary threshold laws on \([0,1]\) gives upper bound \(1/e\), achieved in the limit by the truncated equal-revenue distribution on \([1/e,1]\) with an atom at \(1\). For a finite set of \(m\) thresholds, the apparent sharp constant is

\[
\left(\frac{m-1}{m}\right)^m \uparrow \frac1e,
\]

recovering \(1/4\) when \(m=2\).

## Concrete Progress

For finite action grid \(A\) and finite terminal threshold set \(C\subset(0,1]\), define

\[
\kappa_A(C)=\inf_{\mu\in\Delta(A)}\max_{c\in C}
\left[c-\sum_{a\in A}\mu(a)a1\{a<c\}\right].
\]

The primal LP has variables \(\mu,z\):

\[
z+\sum_a\mu(a)a1\{a<c\}\ge c\quad \forall c\in C.
\]

Its dual is

\[
\max_{\lambda\in\Delta(C),\,y}
\sum_c\lambda_c c-y
\quad\text{s.t.}\quad
y\ge \sum_c\lambda_c a1\{a<c\}\quad \forall a\in A.
\]

Hence

\[
\kappa_A(C)=
\max_{\lambda\in\Delta(C)}
\left[\mathbb E_\lambda C-\max_{a\in A}a\Pr_\lambda(C>a)\right].
\]

Dense-grid limiting gives the continuum formula with \(\sup_a\). This is a clean generalization of LB-015.

For \(m\) thresholds, the discrete equal-revenue candidate is:

\[
r=\frac{m-1}{m},\qquad
c_i=r^{m-i},\quad i=1,\dots,m,
\]

so \(c_m=1\). Let tails satisfy

\[
\Pr(C\ge c_i)=r^{i-1}.
\]

Then \(c_i\Pr(C\ge c_i)=r^{m-1}\) for every support point, so every support threshold gives the same posted-price revenue. The gap is

\[
r^m=\left(\frac{m-1}{m}\right)^m.
\]

## Claims Or Lemmas

**Lemma 1: Finite-grid LP duality.**  
The finite-grid prefix gap equals the welfare-minus-posted-revenue dual above. This is a standard finite LP duality statement.

**Lemma 2: Continuum zero-block value.**  
For finite \(C\subset(0,1]\),

\[
\kappa(C)=\max_{\lambda\in\Delta(C)}
\left[\mathbb E_\lambda C-\sup_{a\in[0,1]}a\Pr_\lambda(C>a)\right],
\]

provided comparator values are interpreted as suprema and strict-threshold discontinuities are handled by dense-grid or \(\eta\)-comparator limits.

**Lemma 3: Global upper bound.**  
For any law \(C\in[0,1]\), let

\[
R=\sup_a a\Pr(C>a).
\]

Since \(\Pr(C>x)\le \min(1,R/x)\),

\[
\mathbb E C=\int_0^1\Pr(C>x)\,dx
\le R+R\log(1/R).
\]

Thus

\[
\mathbb E C-R\le R\log(1/R)\le 1/e.
\]

Equality is approached by the truncated equal-revenue tail

\[
\Pr(C>x)=
\begin{cases}
1, & x<1/e,\\
1/(ex), & 1/e\le x<1,
\end{cases}
\]

with atom \(1/e\) at \(C=1\).

**Candidate Lemma 4: Sharp \(m\)-threshold constant.**  
For support size \(m\), the sharp constant should be

\[
\kappa_m^*=\left(\frac{m-1}{m}\right)^m.
\]

The construction above attains it. The upper proof is very plausible via quantile partitions and AM-GM, but the support-tightening step should be written carefully before promotion.

## Proof Attempts

The LP proof is direct and robust: the learner chooses a common prefix action law \(\mu\); the dual chooses weights \(\lambda\) over indistinguishable continuations. The dual objective is the weighted comparator value minus the best common quote against the mixture.

The \(1/e\) proof is also clean. The only input is the tail integral identity and the revenue constraint \(x\Pr(C>x)\le R\). Optimizing \(R\log(1/R)\) gives \(R=1/e\).

For finite \(m\), write the tail masses as \(S_i=\Pr(C\ge c_i)\). Equal revenue imposes \(c_iS_i=R\). If \(S_1=1\), \(S_m=R\), and ratios \(S_{i+1}/S_i\) are all equal to \(r=(m-1)/m\), then the gap becomes \(r^m\). AM-GM gives the expected upper bound once one proves the optimizer can be made equal-revenue with top atom at \(1\).

## Gaps And Risks

The continuous optimizer is not finite-support; finite threshold sets only approximate \(1/e\).

Strict crossing matters: posted revenue at a support point uses a limiting quote from below. Use `sup`, dense grids, or \(\eta\)-comparators.

A positive local \(\kappa(C)\) is not itself a regret lower bound. Transfer still needs same-prefix-law assumptions, outside-surplus caps, and probability weighting for rare prefixes.

For same-path multi-horizon blocks \(0^N,c_1,\dots,c_m\), intermediate threshold-round rewards cost \(O(m)\). The lift needs \(m=o(N)\).

## Counterexamples Or Obstructions

CE-009 remains relevant: the dual distribution \(\lambda\) should not be presented as a hard stochastic process under \(\sup_a\mathbb E-\mathbb E\) regret. It is a minimax certificate proving at least one deterministic continuation is bad.

CE-011 remains relevant: post-divergence rewards or rare hard branches can erase/dilute the local prefix gap.

Instance-wise/process-aware oracle collapse is untouched. This strengthens universal/minimax and horizon-oblivious lower bounds, not raw tail necessity.

## Sources Consulted

Local run notes: `problem.md`, all requested `working_notes/*.md`, and `iterations/iter_006/idea_01/idea.md`.

External sources:

- [Roesler and Szentes, “Buyer-Optimal Learning and Monopoly Pricing,” AER 2017](https://www.aeaweb.org/articles?id=10.1257%2Faer.20160145). Relevant for unit-elastic/equal-revenue buyer-optimal distributions.
- [Shen, Tang, and Zeng, “Buyer-Optimal Distribution,” AAMAS 2018 PDF](https://www.weiran-shen.info/page_files/buyer_optimal_distribution.pdf). Relevant because it explicitly solves the \([0,1]\) posted-price surplus problem and identifies the \(1/e\) distribution.
- [Sion, “On general minimax theorems,” Pacific J. Math. 1958](https://msp.org/pjm/1958/8-1/p14.xhtml). Existing bibliography source; relevant background for continuum minimax after finite LP cleanup.

## Bibliography Candidates

- Anne-Katrin Roesler and Balázs Szentes. “Buyer-Optimal Learning and Monopoly Pricing.” *American Economic Review* 107(7):2072-2080, 2017. DOI: https://doi.org/10.1257/aer.20160145. Relevance: identifies a unit-elastic buyer-optimal signal/value distribution in monopoly pricing, matching the \(1/e\) dual optimizer.

- Weiran Shen, Pingzhong Tang, Yulong Zeng. “Buyer-Optimal Distribution.” AAMAS 2018, IFAAMAS, 9 pages. https://www.weiran-shen.info/page_files/buyer_optimal_distribution.pdf. Relevance: gives a close \([0,1]\) posted-price formulation and proves the equal-revenue distribution starting at \(1/e\) with atom at \(1\).

## Recommended Next Steps

1. Promote finite-grid LP duality to the lemma bank.
2. Write the strict-threshold cleanup as a dense-grid/\(\eta\)-comparator limit.
3. Prove the finite-\(m\) upper bound rigorously; target constant \(((m-1)/m)^m\).
4. Lift to universal blocks with \(R_{T_i}\ge N_i\kappa(C_i)-M_i\).
5. Lift to same-path blocks \(0^{N_i},c_{i,1},\dots,c_{i,m_i}\) with \(m_i=o(N_i)\), yielding constants approaching \(1/e\).