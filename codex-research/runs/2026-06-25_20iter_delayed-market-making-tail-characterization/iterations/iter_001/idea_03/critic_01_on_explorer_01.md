## Summary

The explorer’s sufficiency claim is mostly sound: the bound
\[
R_T \le O(\sqrt{T(H+1)\log K})+T/K+\Delta_T(H)
\]
survives critique, assuming full observation of prices, realized-path counterfactual rewards, deterministic known \(H,K\), and a `sup` comparator.

The characterization/necessity direction does not survive. \(\Delta_T(H)\) is a useful sufficient truncation error, but it is not necessary without an unpredictability or information-lower-bound assumption.

## Issue List

- **Worth pursuing:** The truncation comparison with \(\Delta_T(H)\) is correct. For each fixed comparator \(a\),
  \[
  r_t(a)-r_t^H(a)=a\mathbf 1\{H<\tau_t(a)\le T-t\},
  \]
  and the learner’s true reward dominates its truncated reward pathwise.

- **Worth pursuing:** The residue-class finite-delay Hedge proof is valid for full-information reward vectors revealed after at most \(H\) rounds. Splitting into \(H+1\) subsequences gives
  \[
  O(\sqrt{T(H+1)\log K}).
  \]

- **Missing assumption:** The theorem must say whether \(H_T,K_T\) are known to the learner. Existential \(H_T\) gives a nonuniform upper bound; a uniform theorem needs model selection, doubling, or skipping.

- **Missing assumption:** The reduction needs exogenous prices or, at minimum, a realized-path regret interpretation where future prices define counterfactual rewards for all grid arms. If quotes causally affect future prices, the proof does not justify causal regret.

- **Missing assumption:** Replace \(\max_{a\in[0,1]}\) by \(\sup_{a\in[0,1]}\), restrict actions, or change the strict fill rule. With strict \(a<P_t\), atoms can make the maximum fail to exist.

- **Plausible but incomplete:** “\(\Delta_T\) is close to minimal” is true only for this truncation proof. It may be avoidable by predictable-structure algorithms, arbitrary-delay/skipping algorithms, or threshold-specific geometry.

- **Unsupported citation:** The delayed-feedback papers support the generic bounded-delay expert ingredient, but they do not prove the market-making reduction unless the full-information/counterfactual-observation assumptions are checked.

## Counterexamples Or Stress Tests

- **Predictable sparse spikes break necessity.** Let \(P_s=1\) at powers of two and \(0\) otherwise. At horizons \(T=2^m\), any \(H=o(T)\) gives
  \[
  \Delta_T(H)\ge (1-o(1))(T/2-H)=\Omega(T)
  \]
  by taking \(a\) close to \(1\) over the long interval before the final spike. Yet a learner that knows the schedule and quotes \(a_t=1-1/(t+1)\) gets within \(O(\log T)\) of the fixed-action supremum. So large \(\Delta_T\) does not force linear regret.

- **Rare-history beta separation is plausible but underspecified.** A one-spike process with \(\Pr(N=n)\asymp n^{-2}\), \(P_N=1\), and \(P_t=0\) otherwise has residual tails whose conditional essential supremum need not decay, while \(\mathbb E[N\mathbf 1\{N\le T\}]=O(\log T)\). This supports \(\Delta_T\) over \(\beta\), but the explorer should state such a concrete law.

- **Atom/max pathology:** If future max price is exactly \(c\), then \(a\Pr(M>a)\) approaches \(c\) as \(a\uparrow c\) but may be zero at \(a=c\). The original `max` regret expression can be undefined.

## Literature Or Known-Result Conflicts

No direct conflict found. The literature supports delayed-feedback upper-bound technology, not the necessity of any tail condition.

Joulani, György, and Szepesvári give black-box delayed-feedback reductions; Quanrud and Khashabi give adversarial-delay bounds; van der Hoeven and Cesa-Bianchi handle arm-dependent delays. These are consistent with the explorer’s bounded-delay component, but none rules out predictable large-delay examples.

## What Survives The Critique

The \(\Delta_T\)-based condition is a clean sufficient condition:

If deterministic \(H_T,K_T\) satisfy
\[
H_T\log K_T=o(T),\qquad T/K_T=o(T),\qquad \Delta_T(H_T)=o(T),
\]
then the delayed-grid algorithm has sublinear regret, modulo the assumptions above.

What does not survive is any claim that \(\Delta_T(H_T)=o(T)\) is necessary for learnability.

## Bibliography Candidates

- Pooria Joulani, András György, Csaba Szepesvári. “Online Learning under Delayed Feedback.” ICML/PMLR 2013. https://proceedings.mlr.press/v28/joulani13.html. Relevant for delayed-feedback reductions.

- Kent Quanrud, Daniel Khashabi. “Online Learning with Adversarial Delays.” NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html. Relevant for regret bounds depending on cumulative delay.

- Dirk van der Hoeven, Nicolò Cesa-Bianchi. “Nonstochastic Bandits and Experts with Arm-Dependent Delays.” AISTATS/PMLR 2022. https://proceedings.mlr.press/v151/van-der-hoeven22a.html. Relevant background for arm-dependent delays, though not a direct match to full-information price observation.

## Recommended Next Checks

1. Formalize the \(\Delta_T\) sufficiency theorem with `sup`, integer \(H\), known/nonknown \(H_T\), and explicit exogeneity/realized-path assumptions.
2. Add the deterministic sparse-spike example to counterexamples as a refutation of \(\Delta_T\)-necessity.
3. For necessity, switch to an indistinguishability condition: delayed high-payoff mass must also be unpredictable and informationally necessary to identify the best quote.