## Summary

The payoff-weighted tail idea is a solid proof route for the upper bound. Define

\[
\gamma(h):=\sup_t\sup_{a\in[0,1]}\operatorname*{ess\,sup}_{\mathcal F_t}
a\,\Pr(h<\tau_t(a)<\infty\mid \mathcal F_t).
\]

Then the existing truncation proof goes through with \(T\gamma(H)\) replacing \(T\beta(H)\), giving

\[
R(T)\le O(\sqrt{TH\log K})+\frac{T}{K}+T\gamma(H).
\]

Thus \(\gamma(h)\to0\) is sufficient for sublinear regret.

I do not think \(\gamma(h)\to0\) is necessary under a process-specific “there exists a no-regret learner for this process” interpretation. There are easy processes with \(\gamma\not\to0\) where the optimal quote is known and fixed, so long delays do not create a learning obstruction.

## Concrete Progress

The truncation comparison strengthens cleanly:

\[
0\le r_t(a)-r_t^H(a)
\le a\,\mathbf 1\{H<\tau_t(a)<\infty\}.
\]

Taking conditional expectation gives

\[
\mathbb E[r_t(a)-r_t^H(a)\mid \mathcal F_t]\le \gamma(H).
\]

Therefore, for any learner,

\[
R(T)\le R^H(T)+T\gamma(H).
\]

Combining with the existing discretization lemma and finite-expert delayed-learning bound gives

\[
R(T)\le O(\sqrt{TH\log K})+\frac{T}{K}+T\gamma(H).
\]

With \(K=T\) and any \(H(T)\to\infty\) satisfying \(H(T)\log T=o(T)\), this is \(o(T)\) whenever \(\gamma(H)\to0\).

## Claims Or Lemmas

**Lemma 1: weighted truncation.**  
For fixed \(H\),

\[
R(T)\le R^H(T)+T\gamma(H).
\]

Status: proved by the one-line conditional expectation above.

**Lemma 2: positive-scale equivalence.**  
Let

\[
\beta_\epsilon(h):=\sup_t\sup_{a\in[\epsilon,1]}\operatorname*{ess\,sup}_{\mathcal F_t}
\Pr(h<\tau_t(a)<\infty\mid \mathcal F_t).
\]

Then

\[
\gamma(h)\to0
\quad\Longleftrightarrow\quad
\forall \epsilon>0,\ \beta_\epsilon(h)\to0.
\]

Proof: if \(\gamma(h)\to0\), then \(\beta_\epsilon(h)\le \gamma(h)/\epsilon\). Conversely, for any \(\epsilon>0\),

\[
\gamma(h)\le \epsilon+\beta_\epsilon(h),
\]

because actions \(a<\epsilon\) contribute at most \(\epsilon\).

**Lemma 3: average weighted tails are enough for the proof.**  
A weaker sufficient condition is

\[
\Delta_T(H):=\sup_{a\in[0,1]}\sum_{t=1}^T
\mathbb E\bigl[a\,\mathbf 1\{H<\tau_t(a)<\infty\}\bigr]=o(T)
\]

for some \(H=H(T)\) with \(H\log T=o(T)\). Then the same proof gives

\[
R(T)\le O(\sqrt{TH\log T})+1+\Delta_T(H).
\]

This avoids the essential supremum over rare histories.

## Proof Attempts

The upper-bound proof is straightforward:

1. Restrict to grid \(\mathcal G_K\).
2. Truncate all rewards after \(H\) steps.
3. Since \(P_s\) is public, the truncated reward of every grid action posted at time \(t\) is known by time \(t+H\).
4. Apply a standard delayed full-information expert algorithm.
5. Pay \(T/K\) for discretization and \(T\gamma(H)\) for truncation.

The attempted lower-bound proof from \(\gamma\not\to0\) fails. Gamma failure says some positive-payoff quote can have long-delayed trade probability on some history. It does not say the learner needs that delayed feedback to identify a good action.

## Gaps And Risks

The main unresolved issue is quantifiers. If the conjecture means “for every fixed stochastic process, sublinear regret is possible iff the condition holds,” then \(\gamma\to0\) is not necessary. If it means a uniform minimax guarantee over a class of processes, a lower bound may still be possible, but it needs an indistinguishability construction, not just tail failure.

The current regret definition uses `max` over \([0,1]\). With strict trade condition \(a<P_t\), atoms in \(P_t\) can make the maximum fail to exist. Many arguments are cleaner with `sup`, or with assumptions ensuring existence.

## Counterexamples Or Obstructions

Counterexample to necessity under process-specific learnability:

Choose \(L_m\uparrow\infty\), probabilities \(p_m>0\), and distinct codes \(x_m\in(0,0.1)\). Draw \(M=m\) with probability \(p_m\). Let

\[
P_1=x_M,\qquad
P_2=\cdots=P_{L_M}=0,\qquad
P_{L_M+1}=U,
\]

where \(U\sim \mathrm{Unif}[0,1]\), and set later prices to \(0\).

For any \(h\), choose \(m\) with \(L_m>h\). Conditional on \(P_1=x_m\), for \(a=1/2\),

\[
\Pr(h<\tau_1(a)<\infty\mid P_1=x_m)=1/2,
\]

so \(\gamma(h)\ge 1/4\) for all \(h\).

But for any horizon \(T\),

\[
\mathbb E\sum_{t=1}^T r_t(a)=a(1-a)S_T
\]

for some nonnegative scalar \(S_T\). The maximizer is always \(a=1/2\). The learner that always posts \(a_t=1/2\) has zero regret for every \(T\), despite \(\gamma\not\to0\).

## Sources Consulted

- Local files: `problem.md`, all requested `working_notes/*.md`, and assigned `idea_02/idea.md`.
- [Joulani, Gyorgy, Szepesvari, “Online Learning under Delayed Feedback,” ICML/PMLR 2013](https://proceedings.mlr.press/v28/joulani13.html).
- [Quanrud and Khashabi, “Online Learning with Adversarial Delays,” NeurIPS 2015](https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html).
- [Zierahn, van der Hoeven, Lancewicki, Rosenberg, Cesa-Bianchi, “A Unified Analysis of Nonstochastic Delayed Feedback...,” JMLR 2025](https://www.jmlr.org/papers/v26/24-0496.html).

## Bibliography Candidates

- Pooria Joulani, Andras Gyorgy, Csaba Szepesvari. “Online Learning under Delayed Feedback.” ICML 2013, PMLR 28(3):1453-1461. https://proceedings.mlr.press/v28/joulani13.html. Relevant for black-box delayed-feedback reductions; constant delay \(H\) yields the needed expert-style \(O(\sqrt{TH\log K})\) scaling.

- Kent Quanrud, Daniel Khashabi. “Online Learning with Adversarial Delays.” NeurIPS 2015. https://proceedings.neurips.cc/paper_files/paper/2015/hash/72da7fd6d1302c0a159f6436d01e9eb0-Abstract.html. Relevant background for regret controlled by total delay.

- Lukas Zierahn, Dirk van der Hoeven, Tal Lancewicki, Aviv Rosenberg, Nicolò Cesa-Bianchi. “A Unified Analysis of Nonstochastic Delayed Feedback for Combinatorial Semi-Bandits, Linear Bandits, and MDPs.” JMLR 26(104):1-60, 2025. https://www.jmlr.org/papers/v26/24-0496.html. Modern delayed-feedback reference; less directly needed because the truncated problem here is full-information.

## Recommended Next Steps

Promote \(\gamma(h)\to0\) as a sufficient condition theorem.

For necessity, first fix the intended quantifier. If process-specific, record the counterexample above and abandon necessity of uniform \(\gamma\). If class-uniform/minimax, try a two-process indistinguishability lower bound where delayed positive-payoff events hide which of two separated quotes is better.

Also consider replacing uniform essential-sup \(\gamma\) by the ex-ante average tail \(\Delta_T(H)\), which is closer to what the truncation proof actually needs.