## Summary

The explorer’s main mathematical take is mostly sound: the horizon-tail quantity `Delta_T(H)` gives a sharper sufficiency condition, but it is not necessary under an instance-level, process-aware interpretation of “sublinear regret is possible.”

The largest weakness is quantifier ambiguity. The counterexample does **not** refute a minimax or distribution-free necessity theorem unless the learner is allowed to know the spike schedule and distribution. It does refute necessity for “there exists a learner tailored to this process.”

## Issue List

1. **Missing assumption: meaning of “possible.”**  
   Classification: fatal gap for minimax necessity, not fatal for instance-level necessity.  
   The counterexample uses the learner “always post `1/2`,” which is tailored to the known `Uniform[0,1]` spike law. If the theorem asks for one learner working uniformly over a process class, the counterexample is not enough.

2. **Plausible but incomplete: sublinear regret proof between spike horizons.**  
   The explorer’s sentence “same domination argument” needs expansion. A clean repair is: for `S_n <= T < S_{n+1}`, all quotes after `S_n` have zero reward before horizon `T`, so the value is frozen at essentially the `S_n` value. At `T=S_n`, the last block dominates and is optimized by `a=1/2`; all older blocks contribute at most `S_{n-1}=o(S_n)` possible advantage.

3. **Missing assumption: feedback model for sufficiency.**  
   Classification: missing assumption.  
   The delayed-grid reduction assumes the learner can reconstruct the full truncated reward vector for all grid quotes after delay `H` from observed prices. This is true if every `P_t` is revealed and the price process is exogenous/counterfactual rewards are well-defined. It is not automatic in a pure bandit/trade-only feedback model.

4. **Plausible but incomplete: invoking standard delayed expert bounds.**  
   Classification: plausible but incomplete.  
   The bound `O(sqrt(T H log K))` is reasonable for bounded-delay full-information rewards, but the proof should cite the exact theorem and verify whether it permits adaptive reward sequences, reward revealed before the current action, and horizon-known truncation.

5. **Unsupported if read strongly: literature citations.**  
   Classification: unsupported citation.  
   The cited delayed-feedback papers support the general reduction style, but none directly proves the proposed `Delta_T(H)` characterization or the non-necessity counterexample.

## Counterexamples Or Stress Tests

- **Spike-process counterexample survives the basic stress test.**  
  Let `S_n=2^{2^n}`, `P_{S_n}=U_n ~ Uniform[0,1]`, and `P_t=0` otherwise. For `T=S_n`, the last block has length `S_n-S_{n-1}+O(1)` and per-quote expected reward `a(1-a)`, maximized at `a=1/2`. Any advantage from older blocks is bounded by `S_{n-1}=o(T)`. Thus always posting `1/2` has `o(T)` regret.

- **Linear horizon-tail remains real.**  
  For any `H_T log T=o(T)`, at `T=S_n`, choosing `a=1/2` gives at least  
  `Delta_T(H_T) >= (1/4)(S_n-S_{n-1}-H_T-O(1)) = Omega(T)`.  
  This supports the explorer’s non-necessity claim under the instance-aware interpretation.

- **Uniform-learnability stress test.**  
  If the learner does not know whether spikes are uniform, biased toward high prices, or biased toward low prices, the fixed `1/2` learner may fail. This is exactly where a two-environment lower bound could resurrect a necessity condition.

## Literature Or Known-Result Conflicts

No direct conflict found. The delayed-feedback citations support sufficiency-style reductions, not necessity of raw tail mass.

- Joulani, Gyorgy, and Szepesvari give black-box delayed-feedback reductions in ICML 2013, consistent with using bounded-delay expert advice for the truncated problem: https://proceedings.mlr.press/v28/joulani13.html
- Quanrud and Khashabi’s NIPS 2015 result controls regret by total delay, also consistent with bounded-delay full-information reasoning: https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html
- Thune, Cesa-Bianchi, and Seldin study unrestricted delays and skipping large delays, thematically close but not the same condition: https://papers.nips.cc/paper_files/paper/2019/hash/0e4f5cc9f4f3f7f1651a6b9f9214e5b1-Abstract.html
- Cesa-Bianchi, Gentile, and Mansour address composite anonymous feedback, adjacent but a harder/different feedback model: https://proceedings.mlr.press/v75/cesa-bianchi18a.html

## What Survives The Critique

- The sufficiency lemma with `Delta_T(H)` replacing `T beta(H)` is worth keeping.
- The spike construction is a valid obstruction to instance-level necessity.
- The key conceptual takeaway survives: raw delayed reward mass is not the right necessary object; the missing ingredient is informational unpredictability of the tail.

## Bibliography Candidates

- Pooria Joulani, András György, Csaba Szepesvári. **Online Learning under Delayed Feedback.** ICML 2013, PMLR 28(3):1453-1461. https://proceedings.mlr.press/v28/joulani13.html  
  Relevance: standard delayed-feedback reductions.

- Kent Quanrud, Daniel Khashabi. **Online Learning with Adversarial Delays.** NeurIPS/NIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html  
  Relevance: regret bounds in terms of total delay.

- Tobias Sommer Thune, Nicolò Cesa-Bianchi, Yevgeny Seldin. **Nonstochastic Multiarmed Bandits with Unrestricted Delays.** NeurIPS 2019. https://papers.nips.cc/paper_files/paper/2019/hash/0e4f5cc9f4f3f7f1651a6b9f9214e5b1-Abstract.html  
  Relevance: unbounded delays and skipping excessive delays.

- Nicolò Cesa-Bianchi, Claudio Gentile, Yishay Mansour. **Nonstochastic Bandits with Composite Anonymous Feedback.** COLT 2018, PMLR 75:750-773. https://proceedings.mlr.press/v75/cesa-bianchi18a.html  
  Relevance: related delayed/composite feedback model.

## Recommended Next Checks

1. Fix the quantifiers: instance-aware, distribution-free, minimax over a class, or universal over all processes.
2. Write the spike counterexample as a formal lemma with an exact regret bound `R(T) <= O(S_{n-1})` for `S_n <= T < S_{n+1}`.
3. Verify the delayed expert theorem under the exact feedback model: full price observation, bounded truncation delay, and adaptive versus oblivious rewards.
4. Try a two-environment lower bound where histories agree up to delay `H` but optimal fixed quotes differ; this targets unpredictable tail mass rather than raw tail mass.