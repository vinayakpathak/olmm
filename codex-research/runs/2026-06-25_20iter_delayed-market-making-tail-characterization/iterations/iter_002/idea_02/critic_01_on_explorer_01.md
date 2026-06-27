## Summary

The finite two-continuation block lower bound is sound, modulo using `sup` or an epsilon comparator. The concatenation lower bound is worth pursuing and likely fixable, but the explorer’s version still needs a formal quantifier statement and a careful cross-block reward decomposition.

It does not prove the original instance-wise “only if” direction. It proves, at most, a class-uniform/minimax obstruction for a learner that does not know the realized deterministic terminal-bit sequence.

## Issue List

- **Missing assumption:** The theorem must specify a universal/process-unaware learner over the block class. If the learner knows the deterministic sequence, the lower bound fails.

- **Missing assumption:** Clarify whether learners are anytime or horizon-aware. The proof is written for one ongoing policy; if algorithms may depend on \(T\), the diagonal construction must choose \(c_i\) against the horizon-\(T_i\) policy.

- **Plausible but incomplete:** The concatenation proof must handle cross-block pending quotes. Previous postings can pay at later terminal prices; bounding all reward from postings before block \(i\) by \(M_i\) is valid, but needs to be written explicitly.

- **Plausible but incomplete:** The adversarial choice of \(c_i\) for randomized learners should be made from the conditional expected action distribution given the fixed prior prefix, not from realized learner randomness.

- **Missing assumption:** The block lengths need an explicit condition such as \(M_i=\sum_{j<i}(N_j+1)=o(N_i)\). “Superexponential” is sufficient but not the clean theorem hypothesis.

- **Unsupported citation relevance:** Joulani et al. and Quanrud-Khashabi support delayed-feedback upper-bound context, not this lower bound. Yao is relevant only for minimax framing; the finite two-instance averaging proof is already direct.

- **No fatal false claim found:** Lemma 1 and the broad class-lower-bound direction appear mathematically correct after these fixes.

## Counterexamples Or Stress Tests

- **Process-aware deterministic learner:** If the learner knows the full terminal-bit sequence, it can quote near the right current-block optimum. This kills any instance-wise necessity interpretation.

- **IID terminal bits:** If \(c_i\) is randomly \(1/2\) or \(1\), the expected fixed-action value per zero round is \(\sup_a a\Pr(c_i>a)=1/2\). A learner quoting just below \(1/2\) can nearly match this, so the construction should not be presented as a hard stochastic process under expected-comparator regret.

- **Non-dominant blocks:** If \(M_i\) is comparable to \(N_i\), old pending rewards can erase the per-block lower bound. Dominance is essential.

- **Strict crossing:** With \(P=c\), the best quote is unattained. Any final statement should use `sup`, or state the epsilon version giving \(N(1/4-\eta)\).

## Literature Or Known-Result Conflicts

No conflict found. The delayed-feedback literature supports sufficiency-style regret controls, not necessity of raw tail decay. Yao’s minimax principle is an appropriate background citation for distributional-vs-randomized lower-bound framing, but the block proof itself is elementary averaging over two continuations.

Sources checked: [Joulani, Gyorgy, Szepesvari 2013](https://proceedings.mlr.press/v28/joulani13.html), [Quanrud, Khashabi 2015](https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html), [Yao 1977](https://doi.org/10.1109/SFCS.1977.24).

## What Survives The Critique

- Lemma 1 survives: for the finite block \(0^N c\), \(c\in\{1/2,1\}\), every randomized learner has regret at least \(N/4\) on one continuation, using supremum regret.

- Lemma 2 survives as the safer strict-threshold version with \(N(1/4-\eta)\).

- Lemma 4 survives for degenerate deterministic processes: every block sequence has \(\beta(h)=1\), and \(\gamma(h)\ge 1/4\), for every \(h\).

- Lemma 3 is worth pursuing after formalizing quantifiers and cross-block accounting.

## Bibliography Candidates

- Andrew C. C. Yao. “Probabilistic Computations: Toward a Unified Measure of Complexity.” FOCS 1977, pp. 222-227. DOI: https://doi.org/10.1109/SFCS.1977.24. Relevance: canonical minimax/Yao framing for turning hard input distributions into randomized-algorithm lower bounds; useful background, though the finite-block proof here is direct.

## Recommended Next Checks

1. State the theorem as: for any universal learner over the deterministic block class with \(M_i=o(N_i)\), there exists a sequence \(c_i\in\{1/2,1\}\) such that \(\limsup_T R_T/T\ge 1/4\).

2. Write the conditional block lemma given an arbitrary past sigma-field and pending quote book.

3. Prove the reward decomposition:
\[
R_{T_i}\ge \text{current-block comparator value}
-\mathbb E[\text{current-block learner reward}]
-M_i.
\]

4. Decide whether the theorem covers horizon-aware learner families; if yes, diagonalize against the \(T_i\)-horizon policy.

5. Keep an explicit warning: this is a class-uniform lower bound, not an instance-wise tail characterization.