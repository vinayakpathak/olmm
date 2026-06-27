## Summary

The universal concatenated-block lower bound looks formalizable. The clean theorem should be stated as a **universal/process-unaware** lower bound:

For any randomized learner, even if horizon-aware, there exists a deterministic sequence made of blocks
\[
0^{N_i}c_i,\qquad c_i\in\{1/2,1\},\qquad M_i=\sum_{j<i}(N_j+1)=o(N_i),
\]
such that along block endpoints \(T_i=M_i+N_i+1\),
\[
R_{T_i}^\pi \ge N_i/4-M_i,
\]
and hence
\[
\limsup_i \frac{R_{T_i}^\pi}{T_i}\ge \frac14.
\]

This proves a class-uniform/minimax obstruction, not instance-wise tail necessity. It does not contradict sparse vanishing spikes or horizon/process-aware oracle collapse.

## Concrete Progress

The right proof is a recursive diagonalization over blocks.

Fix a learner \(\pi\) and a dominant length schedule, e.g. choose \(N_i\) recursively so \(M_i/N_i\to0\). Suppose blocks \(1,\dots,i-1\) are fixed. Compare the two finite continuations
\[
\text{prefix},0^{N_i},1/2
\quad\text{and}\quad
\text{prefix},0^{N_i},1.
\]
Run the same learner with the same horizon \(T_i\) and coupled randomness. During the \(N_i\) zero rounds, the two histories are identical, so the current-block actions have the same law under both continuations.

Let
\[
G_c=\mathbb E_\pi\sum_{s=1}^{N_i} A_s\,1\{A_s<c\}.
\]
For every \(a\in[0,1]\),
\[
a1\{a<1/2\}+a1\{a<1\}\le1,
\]
so \(G_{1/2}+G_1\le N_i\). Therefore one of the two continuations satisfies
\[
N_i c-G_c\ge N_i/4,
\]
where \(N_i c\) is the current-block comparator supremum. Choose that continuation as \(c_i\).

At endpoint \(T_i\), old learner rewards from the prefix are at most \(M_i\), since each old quote pays at most once and rewards are bounded by \(1\). Thus
\[
R_{T_i}^\pi\ge N_i c_i-(G_{c_i}+M_i)\ge N_i/4-M_i.
\]

## Claims Or Lemmas

**Lemma 1: Conditional two-continuation with prefix.**  
For any fixed deterministic prefix of length \(M\), any randomized learner, and any \(N\), one of the two continuations \(0^N,1/2\) or \(0^N,1\) gives endpoint regret at least
\[
N/4-M.
\]
This is essentially LB-010, and the proof above makes the current-block comparator and old-reward cap explicit.

**Lemma 2: Concatenation theorem.**  
If \(M_i/N_i\to0\), recursively choosing \(c_i\) via Lemma 1 gives a single infinite deterministic sequence with
\[
\limsup_T R_T^\pi/T\ge1/4.
\]

**Lemma 3: Tail failure on every constructed sequence.**  
For any constructed sequence and any \(h\), choose \(i\) with \(N_i>h\). At the first zero of block \(i\), quote \(a=1/4\) trades deterministically after more than \(h\) steps. Hence
\[
\beta(h)=1,\qquad \gamma(h)\ge1/4
\]
for all \(h\).

## Proof Attempts

The direct induction seems sufficient. It also handles horizon-aware learner families: at endpoint \(T_i\), run the \(T_i\)-horizon version of the learner. Old-prefix actions under this horizon may differ from those used at earlier endpoints, but the proof only needs the crude bound that all old-prefix rewards are at most \(M_i\).

For strict crossing, use `sup` comparators. If a writeup insists on attained comparator actions, use \(\eta\)-comparators \(1/2-\eta\) and \(1-\eta\), yielding \(N_i(1/4-\eta)-M_i\), then send \(\eta\downarrow0\).

## Gaps And Risks

The theorem must not be stated for process-aware learners. If the learner is given the full deterministic continuation sequence or its law, the lower bound can fail.

Avoid presenting this as a hard stochastic mixture. Randomizing \(c_i\) can make the expected-comparator problem easier, as noted in FA-009.

The proof is an expected-regret lower bound over learner randomization. A high-probability or pathwise version would require extra work.

The “bad sequence” is chosen after fixing \(\pi\). That is standard for universal lower bounds, but the final statement should be \(\forall\pi\,\exists P\), not an adaptive online adversary theorem unless separately proved.

## Counterexamples Or Obstructions

Sparse vanishing spikes remain an obstruction to raw \(\beta\)-necessity: they have \(\beta\equiv1\) but \(O(1)\) regret for the always-zero learner.

Horizon/process-aware oracle policies remain an obstruction to any instance-wise pseudo-regret necessity claim.

The block theorem only supports: no single process-unaware learner can guarantee sublinear regret uniformly over this block class.

## Sources Consulted

Local run notes: `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `bibliography.md`, `promising_directions.md`, `iteration_summaries.md`, and the assigned `idea.md`.

External checks:
- Cesa-Bianchi and Lugosi, *Prediction, Learning, and Games*, Cambridge University Press 2006. Official page: https://cesa-bianchi.di.unimi.it/predbook/
- Cesa-Bianchi, Gentile, Mansour, Minora, “Delay and Cooperation in Nonstochastic Bandits,” COLT/PMLR 2016. https://proceedings.mlr.press/v49/cesa-bianchi16.html
- Luo and Schapire, “Towards Minimax Online Learning with Unknown Time Horizon,” ICML/PMLR 2014. https://proceedings.mlr.press/v32/luo14.html

## Bibliography Candidates

- Haipeng Luo, Robert E. Schapire. “Towards Minimax Online Learning with Unknown Time Horizon.” ICML 2014, PMLR 32(1):226-234. https://proceedings.mlr.press/v32/luo14.html. Relevance: useful background for separating fixed-horizon, horizon-aware, and adversarial-horizon quantifiers; not direct support for the block proof.

## Recommended Next Steps

Write the theorem exactly as \(\forall\pi\,\exists P\in\mathcal C_N\) with `sup` regret and deterministic block class \(\mathcal C_N\). Then prove the conditional prefix lemma first, followed by the recursive concatenation theorem and the \(\beta,\gamma\) tail-failure corollary. Keep a warning paragraph that this is universal/minimax only, not instance-wise necessity.