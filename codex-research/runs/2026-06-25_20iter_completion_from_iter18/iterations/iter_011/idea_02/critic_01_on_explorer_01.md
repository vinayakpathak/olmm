## Summary

The explorer’s central claim survives as a **conditional known-path upper theorem**, essentially the compact/infinite-menu cleanup of `LB-025/CL-030`. It is not a characterization and should not be presented as necessary.

The main problems are missing assumptions and implementation details: the learner must know the full deterministic future path or at least all suffix menus \(C_t\), regret must use `sup`, prices must be exogenous, and strict crossing requires an explicit left-limit or \(\eta_t\)-implementation argument.

## Issue List

1. **Missing assumption:** The policy is noncausal/path-oracle.
   The theorem requires choosing \(\nu_t\) from
   \[
   C_t=\overline{\{M_{t,T}:T>t\}},
   \]
   which depends on the entire future path. This is fine for a deterministic known-path offline/anytime theorem, but fatal if read as an online learner that only sees \(P_1,\dots,P_t\).

2. **Plausible but incomplete:** Strict crossing is not fully handled.
   The formal value uses
   \[
   \int_{[0,c]}x\,d\nu(x),
   \]
   i.e. left-limit quotes. Actual rewards use \(A<c\). Scaling \(A=(1-\eta)X\) probably works, but the proof must show the uniform loss:
   \[
   \mathbb E[(1-\eta)X1\{(1-\eta)X<c\}]
   \ge (1-\eta)\int_{[0,c]}x\,d\nu(x).
   \]
   Then pick \(\eta_t\) so the per-round loss is \(\le \varepsilon_t\). Exact zero-error schedules are unsafe unless working in the left-limit compactification.

3. **False as literally stated:** “For any error schedule \(\varepsilon_t\ge0\)” is too broad.
   If some \(\varepsilon_t=0\), an actual strict-crossing implementation may not attain the compact value. Require \(\varepsilon_t>0\), or state the theorem first in the formal left-limit action space and then give an \(\eta_t\)-implemented corollary with \(\sum_{t<T}\eta_t=o(T)\).

4. **Plausible but incomplete:** The compact approximation lemma needs a written proof.
   The claim
   \[
   \delta(C)=\sup_{F\subset C,\ |F|<\infty}\delta(F)
   \]
   is likely correct. The finite lower-net monotonicity argument is the right route, but it should explicitly prove existence of a finite lower \(\eta\)-net for compact \(C\subset[0,1]\), and distinguish formal `[0,c]` payoffs from strict `<c` payoffs.

5. **Missing assumption:** Use comparator `sup`, not `max`.
   This matters even for singleton menus: at threshold \(c\), quote \(a\uparrow c\) attains value only as a supremum. This is already in the notes and must be part of the theorem statement.

6. **Plausible but incomplete:** The interval value formula needs a lower bound.
   The proposed
   \[
   \delta([\ell,1])=
   \begin{cases}
   1/e,&\ell\le 1/e,\\
   \ell\log(1/\ell),&\ell>1/e
   \end{cases}
   \]
   has a convincing primal construction, but the report only sketches it. Add the dual/lower-bound argument or derive it from finite-menu approximation.

## Counterexamples Or Stress Tests

- **Alternating path survives as a non-necessity stress test.**
  For \(P_{2k-1}=1/2,\ P_{2k}=1\), we get \(C_t=\{1\}\) on odd \(t\) and \(C_t=\{1/2,1\}\) on even \(t\), so \(\sum_{t<T}\delta(C_t)\sim T/8\). Yet always quoting \(1-\varepsilon_t\) with average \(\varepsilon_t\to0\) has \(o(T)\) regret. This confirms the suffix-menu condition is sufficient only.

- **Singleton threshold \(C=\{c\}\).**
  Formal \(\delta(C)=0\), but no actual quote \(a=c\) trades at threshold \(c\). This is the minimal test forcing left-limit or \(\eta\)-implementation language.

- **Endogenous prices.**
  If future prices depend on the realized quote, \(M_{t,T}\) is no longer a fixed scalar independent of \(A_t\), so the suffix-max proof fails. Exogeneity is essential.

- **Power-of-two unit spikes.**
  \(C_t=\{0,1\}\) gives formal \(\delta=0\), but actual implementation needs quotes \(1-\eta_t\). This is a good sanity check for the \(o(T)\) implementation loss.

## Literature Or Known-Result Conflicts

No direct literature conflict found. The closest external sources remain adjacent robust/minimax pricing context, not direct proofs of the compact suffix-menu theorem:

- Dirk Bergemann and Karl H. Schlag, “Robust Monopoly Pricing,” *Journal of Economic Theory*, 2011. https://doi.org/10.1016/j.jet.2011.10.018. Relevant for randomized robust-pricing/minimax-regret context.
- René Caldentey, Ying Liu, Ilan Lobel, “Intertemporal Pricing Under Minimax Regret,” *Operations Research*, 2017. https://doi.org/10.1287/opre.2016.1548. Relevant dynamic minimax-pricing background, not a delayed-fill theorem.

## What Survives The Critique

The following theorem is worth pursuing:

For a deterministic exogenous path, known in advance, with single-fill rewards and `sup` comparator, define \(C_t=\overline{\{M_{t,T}:T>t\}}\). If for each \(t\) the learner can choose an actual quote distribution whose payoff against every \(c\in C_t\) is at least \(c-\delta(C_t)-\varepsilon_t\), with \(\sum_{t<T}\varepsilon_t=o(T)\), then
\[
R_T\le \sum_{t<T}\delta(C_t)+o(T)
\]
for every horizon \(T\).

The proof via suffix maxima and
\[
\sup_a\sum_{t<T}a1\{a<M_{t,T}\}\le \sum_{t<T}M_{t,T}
\]
is sound.

## Bibliography Candidates

No new bibliography candidates beyond the already recorded adjacent sources above.

## Recommended Next Checks

1. Write the compact suffix-menu theorem with exact assumptions: deterministic known path, exogenous prices, horizon-oblivious policy, single-fill reward, `sup` regret, and full future path knowledge.
2. Separate the formal left-limit theorem from the actual strict-crossing \(\eta_t\)-implementation corollary.
3. Prove \(\delta(C)=\sup_F\delta(F)\) carefully using finite lower nets.
4. Prove the interval formula, including the dual lower bound.
5. Formalize the alternating path as a warning that \(\sum_t\delta(C_t)=o(T)\) is not necessary.