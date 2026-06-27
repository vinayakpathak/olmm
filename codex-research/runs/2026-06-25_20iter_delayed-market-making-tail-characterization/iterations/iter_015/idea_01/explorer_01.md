## Summary

The single-drought damping formula appears correct in the formal left-limit two-level model. A clean primal construction and a matching two-horizon dual certificate give
\[
D_{M+N+2}(h^M,0^N,\ell,h)
=
S\left(1-\frac{\ell}{h}\right),
\qquad
S=\bigl[\ell(M+N)-h(M-1)_+\bigr]_+ .
\]

The important indexing point is that when \(M\ge1\), the quote posted at the last old high time \(t=M\) belongs to the later high-free drought: it cannot trade on the current \(h\), only on future prices.

## Concrete Progress

Let
\[
n=M+N+2,\quad T_0=M+N+1,\quad T_1=n,
\]
where \(T_0\) is the low horizon and \(T_1\) is the final high horizon. Set
\[
H=(M-1)_+,\qquad
G=N+\mathbf 1_{\{M\ge1\}}.
\]
Here \(H\) is the number of old quote coordinates seeing \(h\) already by \(T_0\), and \(G\) is the number of drought coordinates seeing \(\ell\) at \(T_0\) and \(h\) at \(T_1\).

At \(T_0\),
\[
V_{T_0}^*=\max\{hH,\ell(M+N)\}=hH+S.
\]
At \(T_1\),
\[
V_{T_1}^*=h(M+N+1)=h(H+G+1).
\]

Primal construction: quote \(h^-\) outside the drought coordinates. On the \(G\) drought coordinates, quote \(\ell^-\) with total probability mass
\[
P=\frac{S}{h},
\]
for instance uniformly with probability \(p=S/(hG)\) when \(G>0\). This is feasible because \(S\le hG\).

Then the low-horizon deficit is
\[
S-\ell P=S\left(1-\frac{\ell}{h}\right),
\]
and the final-high deficit is
\[
(h-\ell)P=S\left(1-\frac{\ell}{h}\right).
\]
All earlier horizons have zero formal deficit under this construction.

## Claims Or Lemmas

**Lemma.** In the formal left-limit model, for \(0<\ell<h\),
\[
D_{M+N+2}(h^M,0^N,\ell,h)
=
\bigl[\ell(M+N)-h(M-1)_+\bigr]_+
\left(1-\frac{\ell}{h}\right).
\]

**Dual certificate.** Put weights
\[
\alpha=1-\ell/h,\qquad \beta=\ell/h
\]
on \(T_0\) and \(T_1\). For any action \(a\),
\[
\alpha\,a\mathbf 1\{a<\ell\}+\beta\,a\mathbf 1\{a<h\}\le \ell,
\]
with the analogous left-limit interpretation in the formal model. Thus the active drought coordinates contribute at most \(\ell\) each to the weighted learner payoff.

The weighted learner payoff is at most
\[
hH+\ell G+\ell,
\]
while the weighted comparator value is
\[
\alpha(hH+S)+\beta h(H+G+1).
\]
The difference is exactly
\[
\alpha S=S(1-\ell/h),
\]
so no policy can do better.

## Proof Attempts

The direct primal-dual proof works.

Boundary checks also pass:

- \(M=0\): recovers \(D=N\ell(h-\ell)/h\) for \(0^N,\ell,h\).
- \(M=1\): no damping from old highs, since the single \(h\) is current at the first quote and cannot fill that quote.
- \(S=0\): quoting \(h^-\) everywhere gives zero formal deficit.
- \(h<2\ell\): no failure; the same balancing works.
- \(N=0\): the formula still makes sense, with the last old-high quote as the only active drought coordinate when \(M\ge1\).

I also ran small finite-LP-style regressions by brute-force/grid search over two-level mixtures; tested cases matched the formula.

## Gaps And Risks

The formula is local. It does not prove that arbitrary two-level paths decompose additively into such droughts.

Strict crossing is not literally attained by threshold quotes. The correct statement is formal left-limit equality, plus actual implementation by quotes \(\ell-\varepsilon\) and \(h-\varepsilon'\), with \(h-\varepsilon'>\ell\). The finite-prefix value is approached within \(O(n\varepsilon)\); for an infinite policy one needs the usual \(\sum_{t<T}\varepsilon_t=o(T)\) bookkeeping.

## Counterexamples Or Obstructions

No counterexample found to this clean-block formula.

The main obstruction remains compositional: repeated or overlapping droughts may interact through shared marginals, so summing local \(S_i(1-\ell/h)\) certificates is not justified.

## Sources Consulted

Local project sources only: `problem.md`, `working_notes/canonical_summary.md`, `working_notes/claim_ledger.md`, `working_notes/lemma_bank.md`, `working_notes/failed_attempts.md`, `working_notes/counterexamples.md`, `working_notes/literature_map.md`, `working_notes/bibliography.md`, `working_notes/promising_directions.md`, `working_notes/iteration_summaries.md`, and `iterations/iter_015/solver_attempt.md`.

No web sources consulted; this audit was an internal finite-LP proof check.

## Bibliography Candidates

None.

## Recommended Next Steps

Promote the lemma as a candidate accepted local finite-prefix formula after a second audit.

Then test whether multiple droughts admit a queue/surplus inequality. The natural quantity is
\[
[\ell(L_\ell(T)-1)-h(L_h(T)-1)]_+,
\]
but the next proof must control interactions between drought intervals rather than assuming local certificates add.