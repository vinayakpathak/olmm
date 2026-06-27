## Summary

The horizon-tail condition is a clean sufficiency replacement for the stronger uniform conditional tail assumption. The proof strategy is sound for an upper bound:

\[
\Delta_T(H)=\sup_{a\in[0,1]}\sum_{t=1}^T \mathbb E\left[a\,\mathbf 1\{H<\tau_t(a)\le T-t\}\right].
\]

If there are sequences \(H_T,K_T\) such that

\[
H_T\log K_T=o(T),\qquad T/K_T=o(T),\qquad \Delta_T(H_T)=o(T),
\]

then the same delayed-grid reduction gives sublinear regret. With \(K_T=T\), this becomes the idea’s condition \(H_T\log T=o(T)\) and \(\Delta_T(H_T)=o(T)\).

I do not think \(\Delta_T\) is likely to be necessary without extra unpredictability assumptions. Large delayed comparator mass can be harmless when the price path is predictable or when the optimal quote is obvious without feedback.

## Concrete Progress

The exact truncation comparison becomes sharper:

\[
R_T \le R_T^H+\Delta_T(H),
\]

instead of

\[
R_T\le R_T^H+T\beta(H).
\]

Reason: for every fixed comparator \(a\),

\[
r_t(a)-r_t^H(a)
=
a\,\mathbf 1\{H<\tau_t(a)\le T-t\}.
\]

Taking expectations and maximizing over \(a\) gives the \(\Delta_T(H)\) term. The learner’s realized true reward remains pathwise at least its truncated reward, so no learner-tail term is needed.

Then discretization gives

\[
R_T^H \le R_{T,K}^H+T/K.
\]

For the finite grid, a simple \(H+1\)-subsequence Hedge construction gives

\[
R_{T,K}^H=O\!\left(\sqrt{T(H+1)\log K}\right).
\]

Thus

\[
R_T
\le
O\!\left(\sqrt{T(H+1)\log K}\right)
+\frac{T}{K}
+\Delta_T(H).
\]

## Claims Or Lemmas

**Lemma 1, proved modulo standard finite-expert regret.**  
For exogenous prices and full observation of the price sequence, the above bound holds for any deterministic \(H,K\).

**Lemma 2, proved.**  
The original \(\beta\)-tail condition implies the horizon-tail condition, since

\[
\Delta_T(H)\le T\beta(H).
\]

The implication is strict: \(\Delta_T\) ignores rare histories and irrelevant times/actions that dominate the essential supremum in \(\beta\).

**Claim 3, cautionary.**  
\(\Delta_T(H_T)=o(T)\) is close to minimal for this particular truncation proof, but not for all possible algorithms.

## Proof Attempts

A self-contained finite-delay proof can avoid invoking a heavy delayed-feedback theorem. Split times into residue classes modulo \(H+1\). On one residue class, by the next occurrence of that residue, all \(H\)-truncated reward vectors from the previous occurrence have matured. Run an independent full-information Hedge instance on each residue class.

For residue class \(j\) with \(n_j\) rounds,

\[
R_j=O(\sqrt{n_j\log K}).
\]

Summing and using Cauchy-Schwarz,

\[
\sum_{j=0}^{H}R_j
\le
O\!\left(\sqrt{(H+1)T\log K}\right).
\]

This proves the delayed-grid term pathwise for arbitrary reward vectors in \([0,1]^K\).

## Gaps And Risks

The theorem needs a quantifier decision: is \(H_T\) known to the learner, or only existential? If only existential, a universal algorithm over all admissible \(\Delta_T\) rates needs a model-selection argument over truncation scales.

The regret definition uses \(\max_{a\in[0,1]}\), but with strict trade condition \(a<P_t\), the maximum may fail to exist when prices have atoms. The clean version should use \(\sup\), restrict actions to \([0,1)\), or change the fill rule.

The proof assumes prices are exogenous. If learner quotes affect future prices, counterfactual grid rewards are not well-defined from the realized price path.

## Counterexamples Or Obstructions

A rare-history obstruction to \(\beta\): let there be one random future spike time \(N\) with a heavy tail, and prices are low before \(N\), high at \(N\). Conditional on having survived to a very late time, the residual waiting time can be large with high probability, so the essential-supremum \(\beta(h)\) may not decay. But the ex-ante total mass before the spike can be only \(O(\log T)\), so \(\Delta_T(H)=o(T)\). This supports replacing \(\beta\).

A necessity obstruction to \(\Delta_T\): deterministic spikes at known sparse times, e.g. powers of two. For horizons ending at a spike, any \(H=o(T)\) leaves \(\Delta_T(H)=\Omega(T)\). Yet a horizon-aware learner that always quotes very close to the spike price can obtain near-comparator reward without waiting for feedback. Thus large \(\Delta_T\) alone does not imply linear regret.

## Sources Consulted

Local files: `problem.md`, all listed `working_notes/*.md`, and `iterations/iter_001/idea_03/idea.md`.

External sources:
- Joulani, György, Szepesvári, “Online Learning under Delayed Feedback,” ICML 2013, PMLR: https://proceedings.mlr.press/v28/joulani13.html
- Quanrud, Khashabi, “Online Learning with Adversarial Delays,” NeurIPS 2015: https://papers.neurips.cc/paper/5833-online-learning-with-adversarial-delays.pdf
- van der Hoeven, Cesa-Bianchi, “Nonstochastic Bandits and Experts with Arm-Dependent Delays,” AISTATS 2022, PMLR: https://proceedings.mlr.press/v151/van-der-hoeven22a.html

## Bibliography Candidates

- Pooria Joulani, András György, Csaba Szepesvári. “Online Learning under Delayed Feedback.” ICML 2013, PMLR 28(3):1453-1461. Relevant for black-box delayed-feedback reductions.
- Kent Quanrud, Daniel Khashabi. “Online Learning with Adversarial Delays.” NeurIPS 2015. Relevant for regret bounds depending on total delay.
- Dirk van der Hoeven, Nicolò Cesa-Bianchi. “Nonstochastic Bandits and Experts with Arm-Dependent Delays.” AISTATS 2022, PMLR 151:2022-2044. Relevant because market-making delays depend on the chosen quote.

## Recommended Next Steps

Formalize the \(\Delta_T\) sufficiency proposition with `sup` rather than `max`.

Decide whether the upper bound is nonuniform in \(H_T\) or whether the project needs an adaptive truncation-scale algorithm.

For necessity, do not try to prove it from \(\Delta_T\) alone. Add an unpredictability or indistinguishability condition, then attempt a two-environment lower bound where delayed rewards are also the information needed to identify the best quote.