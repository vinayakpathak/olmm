## Summary

The explorer’s main sparse-vanishing-spike refutation appears correct under the literal per-process reading of the conjecture and the action set \([0,1]\). I do not see a fatal gap in the proof that \(\beta(h)=1\) while the always-zero learner has \(O(1)\) regret.

The main limitation is scope: this only refutes an individual-law necessity statement. It does not refute a minimax/class-uniform theorem unless the quantifiers are made explicit.

## Issue List

- **Worth pursuing:** The core counterexample is valid. At \(t=2^n\), action \(a=0\) waits exactly \(2^n\) steps for the next positive spike almost surely, so \(\beta(h)=1\) for every \(h\).

- **Worth pursuing:** The comparator bound is sound. For fixed \(a>0\), only spikes with \(a<1/2^m\) can ever trigger reward. If \(m^*\) is the last such spike before \(T\), then pathwise the total comparator reward is at most \(a\,2^{m^*}<1\).

- **Missing assumption:** The refutation relies on the conjecture being interpreted per process:
  \[
  \exists \pi\ R^\pi_P(T)=o(T) \Rightarrow \beta_P(h)\to0.
  \]
  If “possible” means one algorithm works uniformly over a process class, the counterexample is not decisive.

- **Missing assumption:** The exact proof uses \(a=0\). If actions are restricted to \([\epsilon,1]\), this construction no longer violates the tail condition. If actions are \((0,1]\), a small modification still gives \(\limsup_h\beta(h)>0\), but not \(\beta(h)=1\) by the same argument.

- **Plausible but incomplete:** The envelope strengthening is likely correct, but it should explicitly define \(c_n=\min\{1,q(s_n)/2\}\) for large \(n\), keep \(c_n>0\), and state the result only for sufficiently large horizons.

- **Plausible but incomplete:** The payoff-weighted tail suggestion is useful for sufficiency, but no necessity claim should be inferred from it. Predictable sparse high-value delays could still make weighted tails large while allowing low regret.

## Counterexamples Or Stress Tests

- **Lower-bounded action set:** If the action set is \([\epsilon,1]\), then eventually all spikes are below \(\epsilon\). For large enough \(h\), no action has a long finite hitting time, so this counterexample disappears.

- **Open-at-zero action set:** If \(0\) is excluded but arbitrarily small actions are allowed, take \(a=1/(2s_{n+1})\) at \(t=s_n\). Then the next spike exceeds \(a\) with probability \(1/2\), so \(\beta(h)\) stays bounded away from zero. The bounded-regret argument still works.

- **Quantifier stress test:** A class containing many hidden sparse-spike processes may still be hard for a single learner. The explorer only proves one benign law with bad \(\beta\), not a class-uniform learnability result.

## Literature Or Known-Result Conflicts

No conflict found. The delayed-feedback references support the sufficiency-side technology, not the explorer’s counterexample directly.

Joulani, Gyorgy, and Szepesvari give black-box delayed-feedback reductions for online learning, relevant to the \(O(\sqrt{TH\log K})\) style bound. Thune, Cesa-Bianchi, and Seldin study unrestricted delays and skipping large delays, which is conceptually aligned with truncation but in a bandit setting.

## What Survives The Critique

The sparse-spike construction should be recorded as a genuine obstruction to the stated “only if” direction.

The important diagnosis survives: unweighted worst-case delay tails are too strong because they can be driven by negligible-payoff actions and sparse time locations.

## Bibliography Candidates

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari, “Online Learning under Delayed Feedback,” ICML/PMLR 2013. https://proceedings.mlr.press/v28/joulani13.html Relevant for delayed-feedback reductions.

- Tobias Sommer Thune, Nicolò Cesa-Bianchi, Yevgeny Seldin, “Nonstochastic Multiarmed Bandits with Unrestricted Delays,” NeurIPS 2019. https://papers.nips.cc/paper/8881-nonstochastic-multiarmed-bandits-with-unrestricted-delays Relevant for unbounded delays and skipping excessive delays.

- Kent Quanrud, Daniel Khashabi, “Online Learning with Adversarial Delays,” NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html Relevant for regret bounds in terms of total delay.

## Recommended Next Checks

1. Fix the intended quantifiers: per-process, distribution-known, distribution-free, or minimax over a class.

2. Add the sparse-spike construction to `counterexamples.md` as a refutation of individual-law necessity.

3. Test candidate replacements for \(\beta\), especially horizon-averaged truncation loss:
   \[
   \sup_a \frac1T\sum_{t=1}^T
   \mathbb E\left[a\,\mathbf 1\{H<\tau_t(a)\le T-t\}\right].
   \]

4. Separately investigate rare-history failures caused by the essential supremum over histories.