## Summary

The zero-pressure dual lemma for strictly increasing lows is sound. With the convention \(\ell_{r+1}=h\), the proposed tail weights are nonnegative, normalized, and make every CL-049 segment pressure \(\psi_i\) vanish.

The stronger exactness claim is plausible for actual path-feasible strictly increasing one-drought instances, but I would not promote it yet without one remaining scheduling/Hall proof. What is proved cleanly now is:

\[
D_n \ge Z_{\rm inc}:=\max_k Z_k.
\]

Exactness holds under a concrete zero-pressure primal feasibility condition, and it recovers the accepted two-low \(p<q\) non-capacity branches and the three-low \(291/100\) certificate.

## Concrete Progress

For \(0<\ell_1<\cdots<\ell_r<h\), define \(S_0=0\), \(\Delta_j=S_j-S_{j-1}\), and

\[
Z_k=
\left(1-\frac{\ell_k}{h}\right)S_k
+
\sum_{j>k}
\frac{\ell_k(h-\ell_j)}{h\ell_j}\Delta_j .
\]

Set \(\beta=\ell_k/h\), \(\ell_{r+1}=h\), \(A_{r+1}=0\), and

\[
A_j=\sum_{q\ge j}\alpha_q=
\begin{cases}
1-\ell_k/h, & j\le k,\\
\ell_k/\ell_j-\ell_k/h, & j>k.
\end{cases}
\]

Then \(\alpha_j=A_j-A_{j+1}\ge0\), because

\[
\alpha_j=0\quad(j<k),\qquad
\alpha_k=1-\ell_k/\ell_{k+1},
\]

and for \(j>k\),

\[
\alpha_j=\ell_k\left(\frac1{\ell_j}-\frac1{\ell_{j+1}}\right).
\]

Also \(\sum_j\alpha_j=A_1=1-\ell_k/h\), so \(\sum_j\alpha_j+\beta=1\).

For increasing lows, \(m_{i,t}=\ell_t\). Hence for candidate quote \(c=\ell_s\),

\[
W_i(\ell_s)
=
\sum_{\substack{t>i\\ \ell_s\le m_{i,t}}}\alpha_t
=
A_{\max\{i+1,s\}}.
\]

The raw pressure term is

\[
\ell_s W_i(\ell_s)-\beta(h-\ell_s).
\]

If \(\max\{i+1,s\}\le k\), this equals \(\ell_s-\ell_k\le0\).  
If \(\max\{i+1,s\}>k\), it equals

\[
\ell_k\left(\frac{\ell_s}{\ell_{\max\{i+1,s\}}}-1\right)\le0.
\]

Each segment has an equality quote: \(\ell_k\) for \(i<k\), and \(\ell_{i+1}\) for \(i\ge k\). Therefore the maximum raw pressure is \(0\), so \(\psi_i=0\) for all \(i\).

Finally,

\[
\sum_j\alpha_jS_j
=
\sum_j A_j\Delta_j
=
Z_k.
\]

Thus every \(k\) gives a valid CL-049 dual lower bound, and \(D_n\ge Z_{\rm inc}\).

## Claims Or Lemmas

**Lemma 1: Increasing-low zero-pressure dual.**  
The construction above is a feasible CL-049 dual certificate with all \(\psi_i=0\), objective \(Z_k\). Hence \(D_n\ge Z_{\rm inc}\).

**Lemma 2: Two-low \(p<q\) exactness.**  
For \(r=2\), \(Z_{\rm inc}\) matches the accepted CL-050 formula on every path-feasible \(p<q\) branch. The apparent third “capacity” branch \(S_1-pB_0\) is impossible under the recorded actual-path inequality \(S_1\le pB_0\), since \(p<q\) implies \(S_1<qB_0\le \theta+qB_0\).

**Lemma 3: Conditional exactness certificate.**  
If \(k\) attains \(Z_{\rm inc}\) and there exist nonnegative masses \(x_{i,j}\), supported only on

\[
j\ge \max\{k,i+1\},
\]

such that capacities, low coverage, and final debt hold:

\[
\sum_jx_{i,j}\le B_i,
\]

\[
\sum_{i<t}\sum_{j\le t}\ell_jx_{i,j}\ge S_t-Z_{\rm inc}\quad\forall t,
\]

\[
\sum_{i,j}(h-\ell_j)x_{i,j}\le Z_{\rm inc},
\]

then \(D_n=Z_{\rm inc}\). This is not just sufficient bookkeeping: the support set is exactly the zero reduced-cost set for the dual above.

## Proof Attempts

The most promising exactness proof is a canonical primal construction.

Let \(k\) maximize \(Z_k\), \(z=Z_k\). The recurrence

\[
Z_{k+1}-Z_k
=
\frac{\ell_{k+1}-\ell_k}{\ell_k}(Z_k-S_k)
\]

implies any maximizer should satisfy the active-window condition

\[
S_{k-1}\le z\le S_k
\]

with \(S_0=0\), up to harmless ties.

Then define coverage increments

\[
y_k=S_k-z,\qquad y_j=\Delta_j\quad(j>k).
\]

Put mass \(y_j/\ell_j\) at quote \(\ell_j\). This gives low coverage

\[
\sum_{j=k}^t y_j=S_t-z
\]

for every \(t\ge k\), and the final high debt telescopes exactly:

\[
\sum_{j\ge k}\left(\frac{h}{\ell_j}-1\right)y_j=z.
\]

So the only remaining issue is scheduling these masses into segment capacities \(B_i\), where quote level \(j\) may use only segments \(i<j\). This is a nested-deadline/Hall condition:

\[
\sum_{j=k}^t\frac{y_j}{\ell_j}
\le
\sum_{i=0}^{t-1}B_i
\qquad\forall t\ge k.
\]

I checked this condition algebraically in several examples and by a small custom enumeration over many actual increasing-low parameter choices; no path-feasible failure appeared. But I do not yet have a clean written proof of this Hall inequality, so exactness should remain a candidate theorem.

## Gaps And Risks

The main gap is the Hall/scheduling inequality above. Proving it from the actual path formula

\[
S_t=\bigl[\ell_t(H+C_t)-hH\bigr]_+,
\qquad C_t=\sum_{i<t}B_i,
\]

would likely promote the whole increasing-low theorem.

Do not cite the solver’s “two-low \(p<q\) third branch” as a market-path counterexample. It is a counterexample only for arbitrary reduced-LP data after dropping the path-feasibility condition \(S_1\le pB_0\).

Strict monotonicity is genuinely used. With duplicate or nonmonotone lows, \(m_{i,t}\) is no longer simply \(\ell_t\), and the proof that \(\psi_i=0\) can fail.

## Counterexamples Or Obstructions

No actual strictly increasing path-feasible counterexample to \(D_n=Z_{\rm inc}\) was found.

A reduced-LP obstruction exists if one allows non-path-feasible \(S,B\): for two lows \(p<q\), data violating \(S_1\le pB_0\) can enter the CL-050 third branch \(D=S_1-pB_0>Z_{\rm inc}\). This should be recorded only as an artificial capacity obstruction, not as a delayed-market-making path.

The known non-increasing/running-max risks remain: examples like \(0.4,0.9,0.5\) should be tested separately because the equality \(m_{i,t}=\ell_t\) breaks.

## Sources Consulted

Local sources: `problem.md`, all requested `working_notes/*`, `iterations/iter_020/solver_attempt.md`, `iterations/iter_020/idea_01/idea.md`, and iteration-19 explorer/critic files on CL-049 pooling.

Web-checked proof-technology sources:
- Gallo, Grigoriadis, Tarjan, “A Fast Parametric Maximum Flow Algorithm and Applications,” SIAM J. Comput. 1989: https://epubs.siam.org/doi/10.1137/0218003
- Picard, Queyranne, “On the structure of all minimum cuts in a network and applications,” Mathematical Programming 1982: https://doi.org/10.1007/BF01581031

## Bibliography Candidates

- Giorgio Gallo, Michael D. Grigoriadis, Robert E. Tarjan. “A Fast Parametric Maximum Flow Algorithm and Applications.” SIAM Journal on Computing 18(1):30-55, 1989. DOI: https://doi.org/10.1137/0218003. Relevance: proof technology for a possible parametric-flow version of the zero-pressure feasibility/Hall condition.

- Jean-Claude Picard, Maurice Queyranne. “On the structure of all minimum cuts in a network and applications.” Mathematical Programming 22:121-128, 1982. DOI: https://doi.org/10.1007/BF01581031. Relevance: proof technology for min-cut lattice/closure structure if the exactness certificate is turned into a flow or cut theorem.

## Recommended Next Steps

1. Prove the Hall inequality for the canonical \(y_j\) construction under actual increasing-low path data.
2. If the Hall proof fails, search for the first actual counterexample with \(r=3\), strict lows, and exact rational certificates.
3. Promote the dual lemma immediately; it is already clean and useful.
4. Keep nonmonotone and duplicate lows separate from this theorem.