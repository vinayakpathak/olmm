## Summary

The sparse vanishing-spike refutation checks out under the literal per-process reading of the conjecture. It gives a process with \(\beta(h)=1\) for every \(h\), yet the learner that always posts \(0\) has regret at most \(1\) for every horizon. So the stated “only if” direction is false as written.

The core flaw exposed is that \(\beta\) is an unweighted delay-tail condition: it counts long delays for quotes whose payoff scale is negligible, especially \(a=0\).

## Concrete Progress

For \(s_n=2^n\), \(U_n\sim \mathrm{Unif}(0,1)\), and
\[
P_t=\begin{cases}
U_n/s_n,&t=s_n,\\
0,&\text{otherwise},
\end{cases}
\]
I verified:

- \(P_t\in[0,1]\).
- For \(a=0\) and \(t=s_n\), \(\tau_t(0)=s_{n+1}-s_n=2^n\) almost surely.
- Hence for every \(h\), choosing \(n\) with \(2^n>h\) gives \(\beta(h)=1\).
- For every fixed \(a>0\), if \(m^*=\max\{m:s_m\le T,\ a<1/s_m\}\), then only \(t<s_{m^*}\) can possibly earn reward, so
\[
\mathbb E\sum_{t=1}^T r_t(a)\le a s_{m^*}<1.
\]
- For \(a=0\), reward is identically \(0\).
- Therefore \(\max_a \mathbb E\sum_t r_t(a)\le 1\), while the always-zero learner earns \(0\). Regret is \(O(1)\).

## Claims Or Lemmas

**Lemma 1, audited valid.** The sparse-spike process has \(\beta(h)=1\) for all \(h\).

**Lemma 2, audited valid.** The best fixed comparator has expected cumulative reward at most \(1\) for every horizon \(T\).

**Lemma 3, audited valid.** The comparator maximum exists. For fixed \(T\),
\[
F_T(a)=\sum_{t=1}^T a\,\Pr\!\left[\max_{m:t<s_m\le T} U_m/s_m>a\right]
\]
is a finite sum of continuous functions on \([0,1]\), including continuity at \(a=0\), so \(F_T\) attains its maximum.

**Strengthening.** More generally, take unbounded gaps \(s_{n+1}-s_n\to\infty\) and
\[
P_{s_n}=c_n U_n/s_n,\qquad P_t=0\text{ otherwise},
\]
with \(0<c_n\le C\). Then \(\beta(h)=1\) for all \(h\), but the always-zero learner has regret at most \(C\). Thus the counterexample can be scaled to have arbitrarily small constant regret. In particular, it is below any diverging sublinear regret envelope eventually.

## Proof Attempts

The \(\beta\)-calculation is sound because the definition takes \(\sup_a\), and \(a=0\) is allowed. Conditioning on \(P_1,\dots,P_{s_n}\) does not reveal \(U_{n+1}\), but \(U_{n+1}>0\) almost surely, so the next positive price occurs exactly at \(s_{n+1}\).

The comparator bound is also sound. The solver’s argument uses only the maximum possible spike height, not the exact trade probability, so it is a valid upper bound. It correctly handles the fact that a quote posted at \(t=s_{m^*}\) cannot trade on the current spike, only on future prices.

The continuum-max issue is not a gap in this construction because the spike heights have continuous distributions and only finitely many spikes appear before any fixed horizon.

## Gaps And Risks

This refutes necessity only for the literal per-process statement. If the intended theorem is minimax over a class of processes, the quantifiers need to be rewritten before this becomes a full refutation.

The example exploits vanishing payoff scale. If the action space were restricted to \([\delta,1]\), this particular obstruction would disappear. If \(0\) is removed but arbitrarily small positive actions remain and \(\sup_a\) is still used, the same pathology persists as a supremum phenomenon.

The “if” direction still depends on formalizing the reduction to full-information delayed expert learning, but that is separate from this refutation.

## Counterexamples Or Obstructions

The sparse vanishing-spike process is a decisive obstruction to the stated iff. Long finite hitting times can occur with probability one for actions whose reward is zero or arbitrarily small, so unweighted tail decay is too strong as a necessary condition.

A better candidate condition should weight the tail by payoff, e.g.
\[
\gamma(h)=\sup_{t,a}\operatorname*{ess\,sup} a\,\Pr[h<\tau_t(a)<\infty\mid P_{1:t}],
\]
or use a horizon-level comparator-weighted truncation error.

## Sources Consulted

- Joulani, György, Szepesvári, “Online Learning under Delayed Feedback,” ICML/PMLR 2013. Used only for delayed-feedback reduction context. https://proceedings.mlr.press/v28/joulani13.html
- Quanrud, Khashabi, “Online Learning with Adversarial Delays,” NeurIPS 2015. Used for regret bounds in terms of total delay. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html
- Weinberger, Ordentlich, “On delayed prediction of individual sequences,” IEEE Transactions on Information Theory 48(7):1959-1976, 2002. Checked as background delayed-prediction literature.

## Bibliography Candidates

- Pooria Joulani, András György, Csaba Szepesvári. “Online Learning under Delayed Feedback.” ICML 2013, PMLR 28(3):1453-1461. https://proceedings.mlr.press/v28/joulani13.html Relevant for black-box delayed online-learning reductions.
- Kent Quanrud, Daniel Khashabi. “Online Learning with Adversarial Delays.” NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html Relevant for delayed-feedback regret bounds via total delay.
- Marcelo J. Weinberger, Erik Ordentlich. “On delayed prediction of individual sequences.” IEEE Transactions on Information Theory 48(7):1959-1976, 2002. DOI: 10.1109/TIT.2002.1013136. Relevant as early delayed prediction/reference-strategy work.

## Recommended Next Steps

Formalize the sparse-spike counterexample as a numbered proposition in the ledger. Then redirect the necessity search toward payoff-weighted tail conditions; the current \(\beta\)-condition is sufficient but not necessary.