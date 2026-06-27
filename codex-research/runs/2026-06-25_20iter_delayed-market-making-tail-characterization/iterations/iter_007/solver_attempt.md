## Verdict

SOLVED: no

The full delayed market-making characterization is still not solved. The literal iff is already refuted in the notes. This iteration does solve a concrete open local subproblem: the finite-\(m\) multi-threshold \(\kappa\) constant.

## Candidate Solution Or Main Attempt

For a random terminal threshold \(Z\in[0,1]\) with at most \(m\) positive support points, define

\[
\rho(Z)=\sup_{a\in[0,1]} a\,\Pr(Z>a).
\]

Then

\[
\mathbb E Z-\rho(Z)\le \left(\frac{m-1}{m}\right)^m.
\]

This proves the candidate CL-023 upper bound.

Sketch: ignore zero atoms, since conditioning on \(Z>0\) only scales both \(\mathbb E Z\) and \(\rho\). Scale so the top support point is \(1\). Let \(\rho=\rho(Z)\). Raising every value below \(\rho\) up to \(\rho\) increases \(\mathbb E Z\) and does not increase \(\rho\): for \(a<\rho\), revenue is at most \(a\le\rho\), and for \(a\ge\rho\), the tail event is unchanged.

Thus assume support

\[
\rho=c_1<c_2<\cdots<c_k=1,\qquad k\le m.
\]

Let \(p_i=\Pr(Z\ge c_i)\). Strict crossing is handled by suprema, so \(c_i p_i\le\rho\). Hence

\[
\mathbb E Z
=c_1+\sum_{i=2}^k (c_i-c_{i-1})p_i
\le
\rho+\rho\sum_{i=2}^k \left(1-\frac{c_{i-1}}{c_i}\right).
\]

Set \(y_i=c_{i-1}/c_i\). Then \(\prod_{i=2}^k y_i=\rho\). With \(n=k-1\), AM-GM gives

\[
\sum_{i=2}^k y_i\ge n\rho^{1/n}.
\]

Therefore

\[
\mathbb E Z-\rho
\le
\rho n(1-\rho^{1/n}).
\]

Writing \(z=\rho^{1/n}\), this is \(n z^n(1-z)\), maximized at \(z=n/(n+1)\), with value

\[
\left(\frac{n}{n+1}\right)^{n+1}
\le
\left(\frac{m-1}{m}\right)^m.
\]

The bound is tight. Take \(r=(m-1)/m\), support

\[
c_i=r^{m-i},\qquad i=1,\dots,m,
\]

and tail probabilities

\[
\Pr(Z\ge c_i)=r^{i-1}.
\]

Then every posted threshold has revenue \(r^{m-1}\), while

\[
\mathbb E Z-r^{m-1}=r^m=\left(\frac{m-1}{m}\right)^m.
\]

## Concrete Lemmas Or Reductions

- CL-023 can be promoted from candidate to accepted, with the caveat that it is a supremum over \(m\)-point threshold sets, not the value of every fixed threshold set.

- Multi-threshold universal block lower bound follows: for any common-prefix learner on a zero block of length \(N\), there exists a terminal threshold among an \(m\)-point set with regret at least

\[
N\kappa_m^*-M,\qquad \kappa_m^*=\left(\frac{m-1}{m}\right)^m,
\]

where \(M\) is the old-reward cap.

- Same-path horizon-oblivious lift should also work on blocks

\[
0^N,c_1,c_2,\dots,c_m
\]

with evaluation horizons after each \(c_j\), giving

\[
\max_j R_{T_j}\ge N\kappa(C)-M-O(m).
\]

## Gaps And Failure Points

The global characterization is still open. This finite-\(m\) result is local minimax geometry, not an instance-wise learnability theorem.

The multi-threshold lifts still need polished bookkeeping for strict crossing, intermediate threshold-round rewards, and old quotes.

The \(\kappa\) modulus is useful only with same-prefix action laws and outside-surplus caps.

## Counterexamples Or Obstructions

Sparse vanishing spikes still refute raw \(\beta\)-necessity.

Horizon/process-aware pseudo-regret collapse still kills any nontrivial instance-wise necessity statement.

The dual threshold distribution is not itself a hard stochastic process under \(\sup_a\mathbb E-\mathbb E\) pseudo-regret.

## Literature And Bibliography Candidates

No new direct source for the finite-\(m\) discrete constant found. Relevant existing equal-revenue background:

- Weiran Shen, Pingzhong Tang, Yulong Zeng. “Buyer-Optimal Distribution.” AAMAS 2018. https://www.weiran-shen.info/page_files/buyer_optimal_distribution.pdf. Relevant for the continuous truncated equal-revenue \(1/e\) geometry.
- Jason Hartline. *Mechanism Design and Approximation*, Ch. 4. https://jasonhartline.com/MDnA/MDnA-ch4.pdf. Relevant for equal-revenue distributions and posted-price revenue geometry.

## Promising Ideas To Explore

Write the finite-\(m\) theorem into the lemma bank.

Use it to upgrade the universal block lower bound from the binary \(1/4\) constant to \(((m-1)/m)^m\), approaching \(1/e\).

Develop the known-path anytime problem as simultaneous prefix approximation.

## Notes For Critics

Check the “raise values below \(\rho\)” step carefully under strict crossing.

Check that the support-size count is preserved after removing zero mass and collapsing low values.

Do not read the finite-\(m\) dual law as a stochastic hard instance. It is a minimax certificate over deterministic continuations.