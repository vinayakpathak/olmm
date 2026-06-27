## Summary

I found no fatal gap in the explorer’s audit under the literal per-process reading. The sparse vanishing-spike construction does refute the stated “only if”: \(\beta(h)=1\) for all \(h\), while the always-zero learner has \(O(1)\) regret.

The main caveat is quantifiers. This is not a minimax lower-bound refutation unless the conjecture is explicitly about individual process learnability.

## Issue List

- **Missing assumption:** The refutation needs the conjecture interpreted as: for a fixed price process, existence of some sublinear-regret learner implies \(\beta(h)\to0\). If instead “possible” means a uniform guarantee over a process class, the counterexample only exposes a quantifier mismatch.

- **Plausible but incomplete:** The comparator bound should explicitly handle the case where \(m^*=\max\{m:s_m\le T,\ a<1/s_m\}\) does not exist. Then no spike can exceed \(a\), so the comparator payoff is \(0\).

- **Plausible but incomplete:** The statement \(\tau_{s_n}(0)=s_{n+1}-s_n\) should be “almost surely,” since a uniform variable on \([0,1]\) can equal \(0\) on a null event. This does not affect the essential-supremum beta calculation.

- **Worth pursuing:** The generalized construction with \(P_{s_n}=c_nU_n/s_n\), \(0<c_n\le C\), is valid if the \(U_n\)’s are independent and \(s_{n+1}-s_n\to\infty\). It gives regret at most \(C\), hence can beat any diverging sublinear envelope eventually. It does not literally handle arbitrary sublinear envelopes that stay bounded below \(C\) or tend to \(0\).

- **Unsupported citation:** None for the central counterexample. The delayed-learning citations are background for the upper-bound side, not needed for the refutation.

## Counterexamples Or Stress Tests

- **Action-space stress test:** If \(a=0\) is removed but actions arbitrarily close to \(0\) remain, the same pathology persists because \(\sup_a\) can approach the zero-action tail. If the action space is restricted to \([\delta,1]\), this particular counterexample no longer works.

- **Posting-time stress test:** A quote posted at \(t=s_{m^*}\) cannot trade on the current spike, only future ones. The explorer correctly accounts for this; only \(t<s_{m^*}\) can contribute.

- **Finite-horizon stress test:** For each fixed \(T\), only finitely many spikes matter, so \(F_T(a)\) is continuous and the comparator maximum exists.

## Literature Or Known-Result Conflicts

No conflict found. The standard delayed-feedback literature supports the upper-bound intuition but does not imply the unweighted \(\beta\)-tail condition is necessary.

Joulani, György, and Szepesvári give black-box delayed-feedback reductions and note different delay penalties in adversarial versus stochastic settings. Quanrud and Khashabi give adversarial-delay regret bounds in terms of total delay. These are consistent with using truncation/skipping ideas, but they do not rule out payoff-negligible long delays.

## What Survives The Critique

The following claims survive:

- The sparse-spike process has \(\beta(h)=1\) for every \(h\).
- The best fixed comparator has expected cumulative reward at most \(1\) for every horizon.
- The always-zero learner therefore has constant regret.
- The stated unweighted tail condition is sufficient-looking but not necessary under the literal individual-process interpretation.
- A payoff-weighted or horizon-level truncation condition is a more plausible next target.

## Bibliography Candidates

- Pooria Joulani, András György, Csaba Szepesvári. “Online Learning under Delayed Feedback.” ICML/PMLR 2013. https://proceedings.mlr.press/v28/joulani13.html. Relevant for delayed-feedback reductions.

- Kent Quanrud, Daniel Khashabi. “Online Learning with Adversarial Delays.” NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html. Relevant for regret bounds in terms of cumulative delay.

- Marcelo J. Weinberger, Erik Ordentlich. “On delayed prediction of individual sequences.” IEEE Transactions on Information Theory 48(7):1959-1976, 2002. DOI: 10.1109/TIT.2002.1013136. Relevant as early delayed prediction background.

- Nicolò Cesa-Bianchi, Tommaso Cesari, Roberto Colomboni, Luigi Foscari, Vinayak Pathak. “Market Making without Regret.” COLT/PMLR 2025. https://proceedings.mlr.press/v291/cesa-bianchi25a.html. Relevant market-making regret background.

## Recommended Next Checks

1. Formalize the sparse-spike construction as a proposition with explicit quantifiers.
2. Decide whether the target theorem is individual-process, class-uniform, or minimax.
3. Test payoff-weighted \(\gamma(h)\) and horizon-level \(\Delta_T(H)\) against rare-history and predictable-spike examples.
4. For any necessity claim, require long delays at positive payoff scale plus an indistinguishability argument.