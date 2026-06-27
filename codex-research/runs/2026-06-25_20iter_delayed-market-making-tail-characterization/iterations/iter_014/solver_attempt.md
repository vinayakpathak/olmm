## Verdict

SOLVED: no

I did not solve the current gluing problem \(D_n(P)=o(n)\Rightarrow\) existence of one \(o(T)\)-regret known-path anytime policy. I did get two concrete pieces of progress: an exact separated-block calculation, and a dual scale-splitting inequality that pinpoints where dyadic localization can fail.

## Candidate Solution Or Main Attempt

The most plausible route is still dual localization: show that failure of a fixed sublinear envelope produces a finite-prefix dual certificate supported on horizons comparable to the prefix length. If that were true, \(D_n=o(n)\) would force fixed-envelope feasibility by compactness.

I could not prove that. The obstruction is a prefix-boundary term: dual mass split between early and late horizons can create conflict only through the first \(m\) quote coordinates, and this term can be order \(m\).

## Concrete Lemmas Or Reductions

**Separated two-threshold block is exactly diluted.**  
For the path
\[
0^N,\ c_0,\ 0^L,\ c_1,\qquad 0<c_0<c_1\le1,
\]
with \(n=N+L+2\), the formal left-limit finite-prefix value is
\[
D_n = N\,\frac{c_0(c_1-c_0)}{c_1}.
\]
Proof sketch: all intermediate horizons before \(c_1\) have comparator value \(Nc_0\). At the final horizon, post-\(c_0\) quotes can be placed at \(c_1^-\), so only the first \(N\) zero-block quotes face the two-threshold conflict \(\{c_0,c_1\}\). The lower bound restricts to horizons \(N+1\) and \(n\); the upper bound uses the local two-threshold primal on the first \(N\) quotes and \(c_1^-\) afterward.

This formalizes why the separated-block parity attempt is diluted: taking \(L\gg N\) makes \(D_n/n\) small even though the local conflict is real.

**Dual scale-splitting inequality.**  
For nonnegative horizon weights \(w\), define the finite-prefix dual functional
\[
\Phi(w)=\sum_T w_TV_T^*
-\sum_t\sup_a a\sum_{T>t}w_T1\{a<M_{t,T}\}.
\]
If \(w=u+v\), with \(u\) supported on \(T\le m\) and \(v\) on \(T>m\), then
\[
\Phi(w)\le \Phi(u)+\Phi(v)+
\sum_{t<m}\min\Bigl\{\sum_{T>t}u_T,\sum_Tv_T\Bigr\}
\le \Phi(u)+\Phi(v)+m\min(\|u\|_1,\|v\|_1).
\]
This is the dual analogue of the prefix-splicing bound. It says cross-scale certificates can hide in the first \(m\) coordinates; a localization theorem must control this term, not just \(D_n/n\).

## Gaps And Failure Points

The scale-splitting lemma is not enough to prove gluing. The boundary term can be comparable to the weighted average horizon of a diffuse dual certificate.

The separated-block exact computation supports the current suspicion: conflicts far apart become easy exactly because new quote coordinates dilute old incompatibility.

## Counterexamples Or Obstructions

The existing obstructions remain decisive: sparse vanishing spikes refute raw \(\beta\)-necessity; horizon-and-law-aware pseudo-regret collapses by playing a horizon-optimal fixed quote; stochastic mixtures of hard continuations are not hard under \(\sup_a\mathbb E-\mathbb E\).

The abstract parity obstruction remains non-market. The new scale-splitting inequality explains why it is hard to realize in market form: market conflicts across far scales must pass through bounded prefix coordinates.

## Literature And Bibliography Candidates

No new direct theorem found. A live check only reaffirmed already-recorded analogies:

- Jerome Renault, “Uniform value in dynamic programming,” JEMS 2011, DOI 10.4171/JEMS/254, https://ems.press/content/serial-article-files/31763. Relevant for uniform-value gluing conditions, not a direct proof here.
- Xiaoxi Li and Xavier Venel, “Recursive games: Uniform value, Tauberian theorem and the Mertens conjecture,” IJGT 2016 / arXiv:1506.00949, https://arxiv.org/abs/1506.00949. Relevant because total-boundedness-type hypotheses appear in uniform-strategy results.

## Promising Ideas To Explore

Use the scale-splitting inequality to prove a conditional localization theorem: if every bad envelope certificate has a split with small boundary term, then \(D_n=o(n)\) glues.

Search for a market separator where boundary terms stay large across infinitely many scales without creating a linear \(D_n\) at some finite prefix. Simple separated blocks do not do this.

## Notes For Critics

Both new statements are formal left-limit statements. Actual strict-crossing policies still need \(a\mapsto(1-\eta_t)a\) shrinking with \(\sum_{t<T}\eta_t=o(T)\).