## Summary

The idea looks proof-ready with an \(O(m_i)\) intermediate-round loss. I do not see a conceptual obstruction to proving the deterministic same-path, horizon-oblivious lower bound
\[
\limsup_T R_T/T \ge 1/e
\]
on one known path made of dominant blocks
\[
0^{N_i},c_{i,1},\ldots,c_{i,m_i},
\]
where \(C_i=\{c_{i,1}<\cdots<c_{i,m_i}\}\) is the \(m_i\)-point equal-revenue menu, \(m_i\to\infty\), and \(M_i+m_i=o(N_i)\).

The proof should be written as a direct finite-block lemma first:
\[
\max_{1\le j\le m} R_{M+N+j}\ge N\kappa(C)-M-m,
\]
then diagonalized with equal-revenue \(C=C_m\).

## Concrete Progress

For one block after a previous prefix of length \(M\), set horizons
\[
T_j=M+N+j,\qquad j=1,\ldots,m.
\]
Let \(A_s\), \(s=1,\ldots,N\), be the learner’s quotes during the zero block. Since the policy is horizon-oblivious, these same random variables are used for all evaluations \(T_j\).

For each threshold \(c_j\), define the zero-block learner payoff by horizon \(T_j\):
\[
G_j=\mathbb E\sum_{s=1}^N A_s\mathbf 1\{A_s<c_j\}.
\]
The strict inequality is correct because a zero-block quote trades by \(T_j\) iff some threshold up to \(c_j\) strictly exceeds it, equivalently \(A_s<c_j\).

The fixed-comparator supremum at horizon \(T_j\) is at least \(Nc_j\), by taking a constant quote \(a\uparrow c_j\) on the zero block. Thus
\[
R_{T_j}\ge Nc_j-G_j-M-m.
\]
The \(M\) term caps all rewards from previous-prefix actions, and \(m\) caps all quotes posted on intermediate threshold rounds.

Now for any distribution \(\lambda\) over \(C\),
\[
\sum_j\lambda_j(Nc_j-G_j)
=
N\mathbb E_\lambda C
-\sum_{s=1}^N\mathbb E\big[A_s\Pr_\lambda(C>A_s)\big]
\ge
N\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right).
\]
Choosing the equal-revenue certificate gives
\[
\max_j(Nc_j-G_j)\ge N\kappa(C_m)
=
N\left(\frac{m-1}{m}\right)^m.
\]

## Claims Or Lemmas

**Finite Same-Path Multi-Threshold Lemma.**  
For a deterministic block \(0^N,c_1,\ldots,c_m\) appended after a prefix of length \(M\), any process-aware but horizon-oblivious policy satisfies
\[
\max_{1\le j\le m}R_{M+N+j}
\ge
N\kappa(C)-M-m,
\]
where
\[
\kappa(C)=
\max_{\lambda\in\Delta(C)}
\left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right).
\]

**Diagonal Equal-Revenue Corollary.**  
Take \(m_i\to\infty\), \(r_i=(m_i-1)/m_i\), and
\[
c_{i,j}=r_i^{m_i-j},\qquad j=1,\ldots,m_i.
\]
Choose \(N_i\) so that \(M_i+m_i=o(N_i)\). Then along some horizon in each block,
\[
\frac{R_T}{T}\ge
\frac{N_i r_i^{m_i}-M_i-m_i}{N_i+M_i+m_i}\to \frac1e.
\]

## Proof Attempts

The direct proof above appears to close CL-026 with the advertised \(O(m)\) loss. It avoids stochastic-mixture pitfalls: the equal-revenue law is used only as an LP/averaging certificate over deterministic horizons in the same path.

The proof also avoids finite-grid pitfalls because all actions remain in \([0,1]\), and strict crossing is handled by comparator suprema \(a\uparrow c_j\), not by maxima at \(a=c_j\).

## Gaps And Risks

The theorem statement must define the policy model precisely: one infinite policy, possibly randomized, process-aware and time-aware, but not given the evaluation horizon \(T\).

The proof gives a lower bound, not an optimality theorem for the constant \(1/e\) over all same-path problems. The \(1/e\) cap is local LP geometry, not a matching anytime upper bound.

If using \(\eta\)-comparators instead of suprema, choose \(\eta_i=o(1)\) with \(N_i\eta_i=o(N_i)\) only after controlling strict-threshold gaps.

## Counterexamples Or Obstructions

A horizon-aware policy breaks the argument: for each \(T_j\), it can choose quotes tailored to \(c_j\).

If \(m_i\) is not \(o(N_i)\), the threshold-round cap and denominator can wash out the constant.

If the threshold menu is not sorted increasingly, the simple identity \(G_j=\sum A_s1\{A_s<c_j\}\) no longer applies in this form.

## Sources Consulted

Local required files: `problem.md`, all listed `working_notes/*.md`, and `iterations/iter_008/idea_02/idea.md`.

Web/literature check: no direct prior theorem found for this exact same-path multi-threshold delayed-market-making lift. Adjacent sources consulted: Cesa-Bianchi et al., “Market Making without Regret,” COLT 2025, PMLR; Hartline, *Mechanism Design and Approximation*, equal-revenue notes; Luo and Schapire, “Towards Minimax Online Learning with Unknown Time Horizon,” ICML 2014; Gofer and Mansour, “Lower bounds on individual sequence regret,” Machine Learning 2016.

## Bibliography Candidates

No new bibliography candidates. The relevant sources found are already represented in the working bibliography/literature map.

## Recommended Next Steps

Write the finite lemma above as a polished proposition and promote CL-026 if no critic finds a hidden quantifier issue.

Then write the diagonal theorem separately with explicit recursive choices of \(m_i,N_i,M_i\), ending with the ratio calculation
\[
\limsup_T R_T/T\ge 1/e.
\]

Keep the conclusion labeled as a same-path horizon-oblivious lower bound, not a raw tail characterization.