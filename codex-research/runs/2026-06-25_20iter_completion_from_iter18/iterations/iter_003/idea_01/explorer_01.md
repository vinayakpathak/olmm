## Summary

The concatenated block idea is viable as a **class-uniform lower bound**. It should prove: for any process-unaware learner, there exists a deterministic block sequence \(0^{N_i}c_i\), \(c_i\in\{1/2,1\}\), with \(M_i=o(N_i)\), such that regret is linear along block endpoints. This is a genuine necessity-style statement only for universal/minimax quantifiers, not instance-wise learnability.

## Concrete Progress

A clean theorem looks provable:

Let \(M_i=\sum_{j<i}(N_j+1)\), \(T_i=M_i+N_i+1\), and take blocks
\[
0^{N_i}c_i,\qquad c_i\in\{1/2,1\},
\]
with \(M_i=o(N_i)\). For every randomized anytime learner \(\pi\) that does not know future \(c_i\)'s, there is a deterministic choice of \((c_i)\) such that
\[
R^\pi(T_i)\ge \frac{N_i}{4}-M_i
\]
for every \(i\), hence
\[
\limsup_i \frac{R^\pi(T_i)}{T_i}\ge \frac14.
\]

The same argument works for a horizon-indexed process-unaware family \((\pi^T)_T\): choose \(c_i\) to hurt \(\pi^{T_i}\) after the prefix is fixed.

## Claims Or Lemmas

**Conditional two-continuation lemma.**  
Given a fixed prefix and \(N\) current zeros, the learner’s first \(N\) current-block actions have the same law whether the terminal continuation is \(c=1/2\) or \(c=1\). If
\[
G_c=\mathbb E\sum_{k=1}^N A_k\mathbf 1\{A_k<c\},
\]
then one of
\[
N/2-G_{1/2},\qquad N-G_1
\]
is at least \(N/4\).

**Prefix-loss lemma.**  
At endpoint \(T_i\), all learner rewards attributable to the previous prefix are at most \(M_i\), since there were only \(M_i\) previous actions and rewards are in \([0,1]\). This controls old pending quotes without needing exact accounting.

**Tail failure of the class.**  
Every sequence in this block class has \(\beta(h)=1\) for all \(h\). In fact \(\gamma(h)\ge 1/4\) for all \(h\), since for any \(h\) one can choose a block with \(N_i>h\) and quote \(a=1/4\).

## Proof Attempts

The main proof should be by induction over blocks.

Assume \(c_1,\dots,c_{i-1}\) are fixed. During the \(N_i\) zeros of block \(i\), histories are identical under \(c_i=1/2\) and \(c_i=1\). Let \(A_1,\dots,A_{N_i}\) be the learner’s current-block actions under this common history.

For each action \(a\),
\[
a\mathbf 1\{a<1/2\}+a\mathbf 1\{a<1\}\le 1.
\]
Thus
\[
G_{1/2}+G_1\le N_i.
\]
Since the current-block comparator suprema are \(N_i/2\) and \(N_i\), respectively, at least one continuation satisfies
\[
N_i c_i-G_{c_i}\ge N_i/4.
\]
Choose that \(c_i\).

At horizon \(T_i\), the fixed-action comparator value is at least \(N_i c_i\), by using a quote \(a<c_i\) approaching \(c_i\) and counting only the \(N_i\) current zero positions. The learner’s total reward is at most \(G_{c_i}+M_i\). Therefore
\[
R^\pi(T_i)\ge N_i c_i-(G_{c_i}+M_i)\ge N_i/4-M_i.
\]

This directly resolves the main cross-block concern: do not decompose the comparator by blocks; lower-bound it using only the current block, and upper-bound all noncurrent learner rewards by \(M_i\).

## Gaps And Risks

The theorem must state **process-unaware** explicitly. If the learner knows the full deterministic sequence, the lower bound fails.

The result is a \(\limsup\) endpoint lower bound, not linear regret at every horizon.

The proof gives expected regret over learner randomness. Almost-sure lower bounds would require an extra argument.

Use \(\sup_a\), not \(\max_a\). If a maximum-based statement is required, use quotes \(1/2-\eta\) and \(1-\eta\), giving \(N_i(1/4-\eta)\).

This does not prove instance-wise necessity of any tail condition. It only proves no single universal learner can handle the whole branching block class.

## Counterexamples Or Obstructions

The horizon/process-aware oracle collapse remains fatal for instance-wise necessity: a learner knowing the law and horizon can play a horizon-optimal fixed quote.

A stochastic mixture over \(c_i\)'s is not automatically hard under pseudo-regret, because the best fixed quote in expectation may be learnable or known.

The only real technical obstruction in this idea was pending cross-block reward accounting; the \(M_i\) upper bound handles it.

## Sources Consulted

Required run files: `problem.md`, all listed `working_notes/*.md`, and `iterations/iter_003/idea_01/idea.md`.

External sources checked:
- [Cesa-Bianchi and Lugosi, Prediction, Learning, and Games, 2006](https://cesa-bianchi.di.unimi.it/predbook/) for universal individual-sequence/minimax framing.
- [Joulani, Gyorgy, Szepesvari, Online Learning under Delayed Feedback, ICML/PMLR 2013](https://proceedings.mlr.press/v28/joulani13.html) for delayed-feedback context; not needed for this lower-bound proof.

## Bibliography Candidates

No new essential bibliography candidates. Existing relevant entries already cover the framing. Optional source to verify remains:

Marcelo J. Weinberger and Erik Ordentlich, “On delayed prediction of individual sequences,” IEEE Transactions on Information Theory 48(7):1959-1976, 2002, DOI: https://doi.org/10.1109/TIT.2002.1013136. Relevance: adjacent delayed individual-sequence prediction background.

## Recommended Next Steps

Formalize CL-016 as a theorem with two variants: anytime learners and horizon-indexed learner families.

Add the conditional two-continuation lemma and prefix-loss lemma to the lemma bank.

State clearly that this is a universal/minimax lower bound over a deterministic class whose members fail \(\beta\) and \(\gamma\), not an instance-wise tail characterization.