## Summary

No genuine market-path counterexample was found. The natural “parity” construction seems to fail for a market-specific reason: if incompatible horizon requirements are close in time, the finite-prefix value \(D_n\) is already linear; if they are separated enough to make \(D_n/n\) small, then the old incompatible actions are diluted by many new quote opportunities, and a fixed horizon-oblivious path-aware policy can absorb the loss sublinearly.

This supports the hypothesis that market monotonicity of \(M_{t,T}\) may rule out the abstract parity obstruction, but I do not have a proof.

## Concrete Progress

Tested the simplest market analogue of parity:
\[
0^N,\ c_0,\ 0^L,\ c_1,\qquad 0<c_0<c_1\le1.
\]
In the formal left-limit model, at the final prefix \(n=N+L+2\),
\[
D_n=N\,\alpha(c_0,c_1),
\qquad
\alpha(c_0,c_1)=\frac{c_0(c_1-c_0)}{c_1}.
\]
Thus \(D_n/n\to0\) if \(L\gg N\). But this is not a separator: the fixed policy that quotes just below \(c_0\) on the first \(N\) zeros and just below \(c_1\) on the long gap has regret at most \(N(c_1-c_0)+o(n)\) at the final horizon and essentially zero at the low horizon.

This illustrates the main obstruction to the counterexample idea: the same delay that hides old violations from \(D_n/n\) also makes their later regret contribution negligible.

## Claims Or Lemmas

**Lemma 1: separated two-threshold block has small normalized \(D_n\) but is easy.**  
For
\[
P=0^N,c_0,0^L,c_1,
\]
the formal finite-prefix value at \(n=N+L+2\) is
\[
D_n=N\frac{c_0(c_1-c_0)}{c_1}.
\]
So \(D_n=o(n)\) when \(L/N\to\infty\), but a fixed path-aware policy still has sublinear regret on this block.

**Lemma 2: rapidly growing alternating terminal blocks do not realize abstract parity.**  
For paths of the form
\[
0^{N_1},c_1,\ 0^{N_2},c_2,\ \ldots,
\]
with \(M_i=\sum_{j<i}(N_j+1)=o(N_i)\), even if \(c_i\) alternates between incompatible levels like \(1/2\) and \(1\), the path-aware horizon-oblivious policy that quotes just below the next terminal level \(c_i\) during block \(i\) has \(o(T)\) regret. Previous blocks contribute at most \(O(M_i)\) loss at block \(i\)'s endpoint.

**Heuristic obstruction:** abstract parity reuses the same coordinate forever. Market paths get fresh quote coordinates every time step. To make old coordinates matter linearly at a later horizon, the later horizon must be close enough that \(D_n\) sees the conflict.

## Proof Attempts

For Lemma 1, use only horizons \(T_0=N+1\) and \(T_1=N+L+2\). Let \(G_j\) be the learner’s expected reward from the first \(N\) zero-block quotes against threshold \(c_j\). Any policy with max finite-prefix regret \(z\) satisfies
\[
z\ge Nc_0-G_0,
\]
and, since all \(L+1\) later quotes can contribute at most \((L+1)c_1\) at the final horizon,
\[
z\ge Nc_1-G_1.
\]
The two-threshold minimax lemma gives
\[
z\ge N\alpha(c_0,c_1).
\]
The matching upper bound uses the local two-threshold primal law on the first \(N\) quotes and quotes \(c_1^-\) thereafter.

For the rapidly growing block attempt, the policy matching each block’s own terminal level loses only on past blocks when a later comparator chooses a different level. That loss is bounded by the total previous length \(M_i=o(N_i)\). Inside a long zero block before its terminal price, no new current-block rewards are available to either learner or comparator, so regret does not increase except for boundary/strict-crossing errors.

## Gaps And Risks

This does not prove \(D_n=o(n)\) is sufficient. It only rules out the most direct parity-style block constructions.

A subtler separator could interleave thresholds so that many quote times face alternating future menus without producing a local \(D_n=\Omega(n)\) certificate. I did not find such a construction.

All calculations are in the formal left-limit model. Strict crossing needs quotes \((1-\eta_t)c\) with \(\sum_{t<T}\eta_t=o(T)\).

## Counterexamples Or Obstructions

- Close conflict \(0^N,c_0,c_1\): produces linear \(D_n\), so it cannot satisfy \(D_n=o(n)\).
- Separated conflict \(0^N,c_0,0^L,c_1\): gives small \(D_n/n\), but fixed sublinear-regret policies exist.
- Rapidly growing alternating terminal blocks: mimic abstract parity at the level of finite-prefix optimizers, but a path-aware policy can alternate by block and suffers only past-length dilution.

These are obstructions to constructing the desired counterexample, not counterexamples to the conjectured gluing theorem.

## Sources Consulted

Local run files: `problem.md`, all requested `working_notes/*`, `iterations/iter_013/idea_02/idea.md`, and the relevant parity section of `iterations/iter_013/solver_attempt.md`.

External sources:
- Flesch, Laraki, Perchet, “Online Learning and Blackwell Approachability in Quitting Games,” COLT/PMLR 2016: https://proceedings.mlr.press/v49/flesch16.html
- Dann, Mansour, Mohri, Schneider, Sivan, “Rate-Preserving Reductions for Blackwell Approachability,” COLT/PMLR 2025: https://proceedings.mlr.press/v291/dann25a.html
- Lagziel and Lehrer, “Approachability with delayed information,” JET 2015: https://ideas.repec.org/a/eee/jetheo/v157y2015icp425-444.html

## Bibliography Candidates

- Janos Flesch, Rida Laraki, Vianney Perchet. “Online Learning and Blackwell Approachability in Quitting Games.” COLT 2016, PMLR 49:941-942. https://proceedings.mlr.press/v49/flesch16.html. Relevant because it explicitly separates fixed-horizon and anytime approachability conditions.

- Christoph Dann, Yishay Mansour, Mehryar Mohri, Jon Schneider, Balasubramanian Sivan. “Rate-Preserving Reductions for Blackwell Approachability.” COLT 2025, PMLR 291:1380-1414. https://proceedings.mlr.press/v291/dann25a.html. Relevant background for treating simultaneous horizon deficits as approachability-style vector objectives.

## Recommended Next Steps

1. Formalize the separated-block calculation as a stress-test lemma: small \(D_n/n\) can coexist with a fixed envelope, so it is not a separator.
2. Try to prove a general “dilution lemma” for block-parity constructions: if conflicts are hidden from \(D_n/n\) by horizon separation, obeying old constraints costs only \(o(T)\) later.
3. Search for non-block interleavings where many quote times have overlapping, alternating suffix maxima while all finite-prefix \(D_n\) remain sublinear.
4. If no such path appears, pivot toward a market-specific gluing proof using monotonicity of \(M_{t,T}\).