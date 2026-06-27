## Summary

The explorer’s sufficiency claim mostly survives. Replacing `T beta(H)` by the ex-ante horizon-tail loss `Delta_T(H)` is a valid sharpening of the truncation argument, provided the learner is explicitly run on grid rewards truncated at delay `H` and ignores later real feedback.

The non-necessity counterexample is also basically sound under an instance-level interpretation: for a fixed known price process, a process-aware learner can have sublinear regret even when `Delta_T(H_T)` is linear along infinitely many horizons. It does not refute a minimax or distribution-free necessity statement.

## Issue List

- **Missing assumption:** The meaning of “sublinear regret is possible” is still the main quantifier gap. The counterexample uses the fact that the learner may be tailored to the process distribution. If the intended theorem requires one learner to work uniformly over a class of processes unknown to the learner, the counterexample is not decisive.

- **Plausible but incomplete:** Lemma 1 needs the feedback protocol stated precisely. The delayed-grid learner must receive or compute all truncated grid rewards `r_t^H(b)` after at most `H` rounds. This is plausible because prices `P_s` are public, so after seeing `P_{t+1},...,P_{t+H}` one can compute whether each grid quote would have traded. But this full-information reduction should be stated explicitly.

- **Plausible but incomplete:** The all-horizons regret proof for the spike counterexample is sketched but not fully written. It appears repairable: for `T in [S_n,S_{n+1})`, the block `(S_{n-1},S_n)` is the dominant resolved block, and action `1/2` is optimal on that block; all possible comparator advantage is confined to at most `S_{n-1}` earlier times, hence is `o(T)`.

- **Unsupported citation / precision issue:** The cited delayed-feedback literature supports the delayed-learning part, but the explorer should cite the exact full-information delayed-experts theorem used for `O(sqrt(T H log K))`. Some listed sources are bandit or composite-feedback papers and are adjacent rather than direct support.

- **Worth pursuing:** `Delta_T(H)` is a useful sufficient condition and is strictly less pessimistic than the uniform conditional tail `beta(H)`. It should probably be framed as a sufficient horizon-tail condition, not as a characterization without additional information-theoretic assumptions.

## Counterexamples Or Stress Tests

The spike process stress test is strong.

Let `S_n = 2^{2^n}`, let `P_{S_n}=U_n` with `U_n iid Uniform[0,1]`, and let `P_t=0` otherwise. The learner always posts `a_t=1/2`.

For `T=S_n`, every quote in `(S_{n-1},S_n)` has exactly one future chance to trade, at `S_n`, so its expected reward under fixed quote `a` is `a(1-a)`, maximized at `a=1/2`. Thus the comparator cannot beat the learner on the dominant block. Any advantage comes from earlier blocks, whose total length is at most `S_{n-1}=o(S_n)`.

For the tail loss, taking `a=1/2` gives

\[
\Delta_{S_n}(H_{S_n})
\geq
\frac14 (S_n-S_{n-1}-H_{S_n}),
\]

so for every sequence with `H_T log T=o(T)`, this is `Omega(T)` along `T=S_n`.

Stress tests that still need checking:

- If regret is against a pathwise best fixed quote rather than `max_a E[sum_t r_t(a)]`, the construction may fail.
- If the learner must be distribution-free over a class containing different spike-height laws, the always-`1/2` learner is not enough.
- If the model hides prices except for executed trades, the full-information truncation reduction fails; the problem statement reveals all `P_t`, so this is not an issue here.

## Literature Or Known-Result Conflicts

No direct known-result conflict found.

The sufficiency reduction is consistent with delayed-feedback results such as Joulani, György, and Szepesvári, *Online Learning under Delayed Feedback*, ICML 2013, which gives black-box delayed-feedback transformations ([PMLR](https://proceedings.mlr.press/v28/joulani13.html)). Quanrud and Khashabi, *Online Learning with Adversarial Delays*, NeurIPS 2015, give regret bounds in terms of total delay `D`; bounded delay `H` gives `D <= TH`, matching the intended scale ([NeurIPS](https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html)).

Thune, Cesa-Bianchi, and Seldin, *Nonstochastic Multiarmed Bandits with Unrestricted Delays*, NeurIPS 2019, is relevant to truncating/skipping large delays, but it is a bandit result and not the cleanest citation for the full-information grid step ([NeurIPS](https://papers.nips.cc/paper_files/paper/2019/hash/0e4f5cc9f4f3f7f1651a6b9f9214e5b1-Abstract.html)). Cesa-Bianchi, Gentile, and Mansour, *Nonstochastic Bandits with Composite Anonymous Feedback*, COLT 2018, concerns a harder anonymous composite-feedback model, so it is background rather than direct support ([PMLR](https://proceedings.mlr.press/v75/cesa-bianchi18a.html)).

## What Survives The Critique

- The bound

\[
R(T)\le R_K^H(T)+T/K+\Delta_T(H)
\]

survives as a sufficiency statement, with explicit full-information delayed-grid assumptions.

- The spike construction survives as a serious obstruction to necessity under instance-level learnability.

- The critique strengthens the explorer’s conclusion: raw delayed tail mass is not the right necessary object. Necessity, if true in a uniform setting, must involve unpredictable or decision-relevant tail mass.

## Bibliography Candidates

Pooria Joulani, András György, Csaba Szepesvári. **Online Learning under Delayed Feedback.** ICML 2013, PMLR 28(3):1453-1461. https://proceedings.mlr.press/v28/joulani13.html  
Relevance: direct source for delayed-feedback reductions.

Kent Quanrud, Daniel Khashabi. **Online Learning with Adversarial Delays.** NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html  
Relevance: delayed online learning bounds in terms of total delay.

Tobias Sommer Thune, Nicolò Cesa-Bianchi, Yevgeny Seldin. **Nonstochastic Multiarmed Bandits with Unrestricted Delays.** NeurIPS 2019. https://papers.nips.cc/paper_files/paper/2019/hash/0e4f5cc9f4f3f7f1651a6b9f9214e5b1-Abstract.html  
Relevance: unbounded-delay bandit truncation/skipping ideas.

Nicolò Cesa-Bianchi, Claudio Gentile, Yishay Mansour. **Nonstochastic Bandits with Composite Anonymous Feedback.** COLT 2018, PMLR 75:750-773. https://proceedings.mlr.press/v75/cesa-bianchi18a.html  
Relevance: adjacent delayed/composite-feedback model; useful for comparison, not direct proof support.

## Recommended Next Checks

1. Formalize the spike counterexample as a proposition with an all-horizons regret bound.
2. Decide whether the target theorem is instance-level, Bayesian/process-aware, or uniform/minimax.
3. State the delayed-grid feedback model exactly and cite a full-information delayed-experts theorem.
4. If pursuing necessity, try a two-environment lower bound where histories agree up to delay `H` but the optimal fixed quote differs because of unresolved tail behavior.