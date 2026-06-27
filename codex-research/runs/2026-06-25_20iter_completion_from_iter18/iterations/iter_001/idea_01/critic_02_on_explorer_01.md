## Summary

The explorer’s core refutation survives: under the literal per-process reading, with action space \([0,1]\) and the single-trade reward \(r_t(a)\), the sparse vanishing-spike process has \(\beta(h)=1\) for every \(h\) while the always-zero learner has \(O(1)\) regret. So the stated “only if” direction is false as written.

The main caveats are quantifier-related and wording-related, not fatal to the construction.

## Issue List

- **Worth pursuing:** The \(\beta(h)=1\) argument via \(a=0\) is sound. The condition is unweighted, and zero-payoff quotes can force arbitrarily long finite hitting times.

- **Plausible but incomplete:** The comparator bound is correct, but the proof should explicitly handle the case where \(m^*\) is undefined, \(a=0\), and the strict inequality at spike-height endpoints.

- **Missing assumption:** The generalized construction with \(P_{s_n}=c_nU_n/s_n\) needs \(s_n\) increasing integer times, \(s_{n+1}-s_n\to\infty\), \(c_n>0\), and \(c_n/s_n\le 1\) to keep \(P_t\in[0,1]\).

- **False claim / overstatement:** “Regret bounded by any prescribed sublinear envelope” is only true for envelopes that eventually dominate some positive constant, in particular diverging \(o(T)\) envelopes. It is false for sublinear envelopes tending to \(0\).

- **Missing assumption:** The refutation depends on \(0\in[0,1]\) being an allowed action. If the action space were \([\delta,1]\), this exact obstruction disappears.

- **Plausible but incomplete:** If \(0\) is removed but actions arbitrarily close to \(0\) remain, \(\beta(h)=1\) can still persist as a supremum phenomenon, but the always-zero learner is no longer admissible. That variant needs a separate regret argument.

- **Unsupported citation risk:** The delayed-feedback citations are useful background, but they do not by themselves justify the market-making truncation/reduction. If used later for the “if” direction, the feedback model mapping must be written explicitly.

## Counterexamples Or Stress Tests

- **Positive action floor:** Restricting actions to \([\delta,1]\) kills the \(a=0\) witness. Then sparse spikes with heights \(1/s_n\to0\) eventually cannot be hit by any admissible action, so \(\beta\) may decay trivially.

- **Open action space \((0,1]\):** For any \(h\), one can choose very small \(a>0\) near a long gap and make \(\Pr(h<\tau_t(a)<\infty)\) arbitrarily close to \(1\), so the supremum can still be \(1\). But the learner used in the explorer is invalid.

- **Reward semantics:** The proof relies on the defined \(r_t(a)=a\mathbf 1\{\tau_t(a)\le T-t\}\), i.e. each posted quote pays once. If the informal market rule were interpreted as repeated payment at every later crossing, the comparator bound would fail.

- **Weighted-tail check:** The proposed weighted tail \(\gamma(h)=\sup a\,\Pr(h<\tau_t(a)<\infty\mid P_{1:t})\) would not see the same obstruction: in the sparse-spike example, admissible positive \(a\) before a spike after time \(>h\) is at most on the order of the future spike height, hence \(\gamma(h)\) decays. This supports, but does not prove, the weighted-tail direction.

## Literature Or Known-Result Conflicts

I do not see a known-result conflict with the explorer’s refutation. The standard delayed-feedback literature gives regret bounds as functions of bounded or summed delays, not necessity of an unweighted hitting-time tail condition.

Joulani, György, and Szepesvári give black-box delayed-feedback reductions in ICML 2013, relevant to sufficiency-style arguments but not to this necessity counterexample. Quanrud and Khashabi give \(O(\sqrt D)\)-type adversarial-delay bounds, again relevant only after formal reduction. Weinberger and Ordentlich is older delayed prediction background. Sources checked: PMLR/ICML page for Joulani et al. ([proceedings.mlr.press](https://proceedings.mlr.press/v28/joulani13.html?utm_source=openai)), NeurIPS page for Quanrud-Khashabi ([proceedings.neurips.cc](https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html?utm_source=openai)), IEEE/DOI listing for Weinberger-Ordentlich ([ieeexplore.ieee.org](https://ieeexplore.ieee.org/iel5/18/21818/01013136.pdf?utm_source=openai)).

## What Survives The Critique

The sparse-spike construction should be promoted to a formal proposition:

For \(s_n=2^n\), \(P_{s_n}=U_n/s_n\), \(P_t=0\) otherwise, with independent \(U_n\sim\mathrm{Unif}(0,1)\), one has \(\beta(h)=1\) for every \(h\), but \(\sup_{a\in[0,1]}\mathbb E\sum_{t=1}^T r_t(a)\le 1\). Therefore the always-zero learner has regret at most \(1\) for all \(T\).

The generalized bounded-amplitude version also survives after adding \(c_n/s_n\le1\).

## Bibliography Candidates

- Pooria Joulani, András György, Csaba Szepesvári. “Online Learning under Delayed Feedback.” ICML 2013, PMLR 28(3):1453-1461. https://proceedings.mlr.press/v28/joulani13.html. Relevant for delayed-feedback reductions.

- Kent Quanrud, Daniel Khashabi. “Online Learning with Adversarial Delays.” NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html. Relevant for regret in terms of total delay.

- Marcelo J. Weinberger, Erik Ordentlich. “On delayed prediction of individual sequences.” IEEE Transactions on Information Theory 48(7):1959-1976, 2002. DOI: 10.1109/TIT.2002.1013136. Relevant as delayed-prediction background.

- Ciara Pike-Burke, Shipra Agrawal, Csaba Szepesvári, Steffen Grünewälder. “Bandits with Delayed, Aggregated Anonymous Feedback.” ICML 2018 / arXiv:1709.06853. https://arxiv.org/abs/1709.06853. Relevant for delayed and partially aggregated feedback with unbounded-delay considerations. ([arxiv.org](https://arxiv.org/abs/1709.06853))

## Recommended Next Checks

1. Formalize the sparse-spike counterexample with all edge cases and quantifiers.
2. Decide whether the conjecture is per-process, uniform over a process class, or minimax.
3. Replace the necessity target with a payoff-weighted or comparator-weighted truncation condition.
4. Separately audit the “if” direction’s reduction to delayed expert learning.