## Summary

I do not see a fatal gap in the explorer’s core finite-prefix formula. The primal balancing and two-horizon dual certificate appear sound in the formal left-limit model for the path
\[
h^M,0^N,\ell,h,\qquad 0<\ell<h.
\]
The claim should be promoted only as a local finite-prefix identity, not as evidence for additive decomposition across multiple droughts.

## Issue List

1. **Missing assumption:** The equality is for the formal left-limit / infimum version of \(D_n\), with `sup` comparators. In the literal strict-crossing action space, threshold quotes are not attained; only \(\eta\)-implementations are available.

2. **Plausible but incomplete:** The explorer says “all earlier horizons have zero formal deficit” but does not spell out the case split. This is true after checking:
\[
T\le M:\ V_T^*=h(T-1),
\]
matched by \(h^-\) on old non-drought coordinates; and for \(M<T<T_0\),
\[
V_T^*=h(M-1)_+,
\]
again matched by the old high coordinates.

3. **Plausible but incomplete:** The dual inequality should be written explicitly in left-limit notation. Literal
\[
a1\{a<\ell\},\quad a1\{a<h\}
\]
does not cover formal threshold actions \( \ell^-,h^- \). The fixed statement is
\[
\alpha a1\{a\le \ell\}+\beta a1\{a\le h\}\le \ell
\]
inside the formal threshold compactification, or an \(\eta\)-limit statement in the original model.

4. **Unsupported evidence:** The “finite-LP-style regressions” are not reproducible from the report. This is not important for the proof, but should not be cited as evidence unless cases and solver details are recorded.

5. **Worth pursuing:** The local formula is useful, but the report correctly notes it does not justify summing drought contributions. Shared marginals across overlapping or repeated low/high conflicts remain the main obstruction.

## Counterexamples Or Stress Tests

- **\(M=0\):** Formula gives
\[
D_{N+2}(0^N,\ell,h)=N\ell(1-\ell/h),
\]
matching the known two-threshold zero-block value.

- **\(M=1\):** No damping from the single old high, because the quote at the high time cannot trade on the current high. The formula gives
\[
S=\ell(N+1),
\]
which is consistent.

- **\(S=0\):** If
\[
\ell(M+N)\le h(M-1)_+,
\]
then the low horizon is already high-dominated. Quoting \(h^-\) everywhere gives zero deficit.

- **\(N=0\):** The last old high quote is the only drought coordinate when \(M\ge1\). The formula still captures the conflict between the low horizon and final high horizon.

- **Close levels \(h<2\ell\):** No obvious failure. For example \(h^M,\ell,h\) can have positive deficit because the low horizon may prefer \(\ell^-\) over \(h^-\), even after old high damping.

## Literature Or Known-Result Conflicts

No conflict with the existing run notes. The claim is consistent with the finite-prefix LP dual, the two-level finite-alphabet reduction, and the separated-block formula from iteration 14.

No new external bibliography candidate is needed; this is an internal finite LP identity rather than a theorem imported from delayed-feedback or pricing literature.

## What Survives The Critique

The core formula survives:

\[
D_{M+N+2}(h^M,0^N,\ell,h)
=
\left[\ell(M+N)-h(M-1)_+\right]_+
\left(1-\frac{\ell}{h}\right).
\]

The primal construction is feasible because
\[
S\le hG,\qquad G=N+\mathbf 1_{\{M\ge1\}},
\]
so total \(\ell^-\)-mass \(P=S/h\) can be placed on drought coordinates. The two active deficits at \(T_0=M+N+1\) and \(T_1=M+N+2\) both equal \(S(1-\ell/h)\).

The dual certificate with weights
\[
\alpha=1-\ell/h,\qquad \beta=\ell/h
\]
on \(T_0,T_1\) gives the matching lower bound.

## Bibliography Candidates

None.

## Recommended Next Checks

1. Write a polished lemma with explicit assumptions: \(M,N\ge0\), \(0<\ell<h\), deterministic finite prefix, formal left-limit \(D_n\), `sup` comparators, single-fill rewards.

2. Add the omitted earlier-horizon case split to the primal proof.

3. State the strict-crossing corollary separately as an \(\eta\)-implementation, not as literal attainment.

4. Use this block as a regression test for two-level finite-alphabet LP experiments, but do not infer additivity across multiple droughts.