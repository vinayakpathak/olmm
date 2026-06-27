## Summary

The compact-menu local lemma looks true. The safest proof strategy is not to rely first on the exact infinite dual law, but to prove the lower bound by finite dense approximations and the accepted finite-menu formula. The direct dual law also seems recoverable, but it must use a strict-successor survival function, not \(s_C(x)\) pointwise at atoms.

## Concrete Progress

For compact \(C\subset[0,1]\), \(m=\max C>0\), define
\[
s_C(x)=\min(C\cap[x,m]),\qquad
F_C(u)=\int_u^m \frac{dx}{s_C(x)}.
\]
Then \(s_C\) is monotone/Borel, \(F_C(m)=0\), \(F_C(0)\ge 1\) as an improper integral, and \(F_C\) is strictly decreasing where finite. Hence the root
\[
F_C(\delta(C))=1
\]
exists uniquely. Also \(\delta(C)\le m/e\), since
\[
F_C(m/e)\le \int_{m/e}^m \frac{dx}{x}=1.
\]

The local value should be
\[
\inf_\mu\sup_{c\in C}\left(c-\int_{[0,c)}a\,d\mu(a)\right)=\delta(C),
\]
as an infimum under strict crossing.

## Claims Or Lemmas

**Upper bound.** Sample \(X\) on \([\delta,m]\) with density \(1/s_C(x)\), and quote \(A_\eta=(1-\eta)s_C(X)\). For \(c\in C\),
\[
\mathbb E[A_\eta 1\{A_\eta<c\}]
\ge (1-\eta)(c-\delta)_+.
\]
Thus the deficit is at most \(\delta+\eta m\), and letting \(\eta\downarrow0\) gives value \(\le\delta\).

**Lower bound by approximation.** Let \(D_n\subset C\) be nested finite sets with \(m\in D_n\) and dense union. Then \(s_{D_n}\downarrow s_C\) pointwise on \((0,m]\), so \(\delta(D_n)\to\delta(C)\). Since the accepted finite-menu theorem gives value \(\delta(D_n)\) on \(D_n\),
\[
\text{value}(C)\ge \sup_n \delta(D_n)=\delta(C).
\]

**Direct dual candidate.** Let
\[
\rho=\inf(C\cap(\delta,m]).
\]
Define the strict successor
\[
s_C^+(a)=\inf(C\cap(a,m])
\]
and a survival function
\[
\Pr(Z>a)=
\begin{cases}
1,& a<\rho,\\
\rho/s_C^+(a),& \rho\le a<m,\\
0,& a\ge m.
\end{cases}
\]
This should define a law supported on \(C\). Then \(\sup_a a\Pr(Z>a)=\rho\), while the root equation gives \(\mathbb EZ=\rho+\delta\). Hence the dual gap is \(\delta\).

## Proof Attempts

The finite-approximation lower bound is the cleanest route because it avoids point-mass and right-continuity bookkeeping. The exact dual law is still useful for intuition and for a polished theorem, but it needs a measure-theoretic audit.

The theorem passes basic stress tests:

- \(C=\{c\}\): \(\delta=0\); zero deficit is only an infimum, achieved by quotes \(c-\eta\).
- finite \(C\): recovers LB-023 exactly.
- \(C=[0,m]\): \(s_C(x)=x\), so \(\delta=m/e\).
- compact sets with gaps: the primal maps Lebesgue mass over a gap to the next menu point.

## Gaps And Risks

The solver’s proposed dual survival law is unsafe if written directly with \(s_C(x)\) at atoms. For \(C=\{1/2,1\}\), strict crossing requires \(\Pr(Z>1/2)\) to drop at \(1/2\); using \(s_C(1/2)=1/2\) would give the wrong pointwise survival.

Compactness is essential. Without it, \(s_C(x)\) may not exist.

This is a local theorem only. It does not imply that \(\sum_t\delta(C_t)\) is necessary for known-path anytime learnability, because the global comparator is one fixed quote across all \(t\), while the local upper bound compares to \(\sum_t M_{t,T}\).

## Counterexamples Or Obstructions

No counterexample to the compact local value was found. The main obstruction is exact attainment: singleton menus already show strict crossing forces infimum language.

The local theorem also does not revive raw \(\beta\), \(\gamma\), or \(\Delta_T\) necessity; all previous quantifier obstructions remain.

## Sources Consulted

Local notes: `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `bibliography.md`, `promising_directions.md`, `iteration_summaries.md`, and `idea_01`.

External checks: Bergemann-Schlag’s support-only minimax pricing setup in [Pricing Without Priors](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=1013570), Kocyigit-Rujeerapaiboon-Kuhn’s adjacent robust pricing paper [PDF](https://optimization-online.org/wp-content/uploads/2018/07/6742.pdf), Wang-Liu-Zhang’s [MSOM 2024 robust screening paper](https://pubsonline.informs.org/doi/10.1287/msom.2023.0072), and Caldentey-Liu-Lobel’s [intertemporal minimax pricing paper](https://pages.stern.nyu.edu/~ilobel/Intertemporal_Pricing_Minimax.pdf).

## Bibliography Candidates

- Cagil Kocyigit, Napat Rujeerapaiboon, Daniel Kuhn. “Robust Multidimensional Pricing: Separation without Regret.” *Mathematical Programming* 196:841-874, 2022. DOI: https://doi.org/10.1007/s10107-021-01615-4. Adjacent minimax-regret pricing context.

- Shixin Wang, Shaoxuan Liu, Jiawei Zhang. “Minimax Regret Robust Screening with Moment Information.” *Manufacturing & Service Operations Management* 26(3):992-1012, 2024. DOI: https://doi.org/10.1287/msom.2023.0072. Relevant for LP and inverse-density randomized pricing analogies.

## Recommended Next Steps

Promote the compact local lemma with the finite-approximation lower proof. Then separately polish the exact dual survival law using \(s_C^+\), because that form will be useful for exposition and for connecting to robust-pricing literature. After that, plug the lemma into the suffix-menu sufficiency theorem with summable \(\eta_t\)-implementation errors.