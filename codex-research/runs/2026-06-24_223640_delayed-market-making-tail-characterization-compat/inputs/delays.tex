\documentclass[11pt]{article}

\usepackage[margin=1in]{geometry}
\usepackage{amsmath,amssymb,amsthm}
\usepackage{enumitem}

\newtheorem{assumption}{Assumption}
\newtheorem{conjecture}{Conjecture}
\newtheorem{lemma}{Lemma}

\newcommand{\ind}[1]{\mathbf{1}\{#1\}}

\title{Delayed Market Making}
\author{}
\date{\today}

\begin{document}
\maketitle

At step $t$:
\begin{enumerate}
    \item Market reveals $P_t \in [0,1]$.
    \item Learner picks $a_t \in [0,1]$.
    \item For all $t' < t$, if $a_{t'} < P_t$, then $a_{t'}$ gets traded and the learner gets reward $a_{t'}$.
\end{enumerate}

Let
\[
\tau_t(a) := \min \{s > 0 : P_{t+s} > a\}.
\]

Then the reward from posting quote $a$ at time $t$ is
\[
r_t(a) = a \cdot \ind{\tau_t(a) \le T-t}.
\]

The regret is
\[
R(T)
=
\max_{a \in [0,1]} \mathbb{E}\left[\sum_{t=1}^T r_t(a)\right]
-
\mathbb{E}\left[\sum_{t=1}^T r_t(a_t)\right].
\]

\begin{assumption}\label{ass:tail-delays}
Let
\[
\beta(h)
:=
\sup_t \sup_a
\operatorname*{ess\,sup}_{P_1,\dots,P_t}
\Pr\bigl[h < \tau_t(a) < \infty \mid P_1,\dots,P_t\bigr].
\]
Assume
\[
\lim_{h \to \infty} \beta(h)
=
0.
\]
\end{assumption}

\begin{conjecture}
Sublinear regret is possible if and only if Assumption~\ref{ass:tail-delays}
holds.
\end{conjecture}

\begin{proof}
\emph{If direction.}

\begin{itemize}
    \item Assume $K$ arms. Later, we will control the error due to discretization. (Lemma~\ref{lem:discretization-comparison})

    \item Pick some $H(T)$ that is sublinear. We will optimize the exact form of $H(T)$ for optimal regret.

    \item Run an algorithm for expert advice with $K$ arms and delay $H(T)$. If a quote has not traded after $H(T)$ steps, assume it will never trade.

    \item Consider the learning problem you get if the delay actually has an upper
    bound of $H(T)$, i.e., define
    \[
        r^H_t(a) = a\cdot \ind{\tau_t(a) \leq \min\{H(T), T-t\}}
    \]
    and the corresponding regret
    \[
        R^H(T)
        =
        \max_{a \in [0,1]} \mathbb{E}\left[\sum_{t=1}^T r^H_t(a)\right]
        -
        \mathbb{E}\left[\sum_{t=1}^T r^H_t(a_t)\right].
    \]

    \item From standard expert advice with delay algorithms, we get $R^H(T) = O(\sqrt{TH(T)\log{K}})$

    \item (Lemma~\ref{lem:truncation-comparison}) For each fixed $a$, we have that
    \[
        \mathbb{E}\left[r_t(a) - r^H_t(a)\right]
        \leq
        \Pr\bigl[H(T) < \tau_t(a) < \infty\bigr]
        \leq
        \beta(H(T)).
    \]
    Since $r_t(a_t) \geq r^H_t(a_t)$, it follows that
    $R(T) \leq R^H(T) + T\beta(H(T))$, and therefore

    \[
    R(T) \leq O(\sqrt{TH(T)\log{K}}) + T\beta(H(T))
    \]

    \item Thus under Assumption~\ref{ass:tail-delays}, we get sublinear regret.
    Furthermore, if we know the exact form of $\beta(h)$, then we can choose
    $H(T)$ appropriately to balance the two terms.
\end{itemize}

Below are some details.

\begin{lemma}[Truncation comparison]\label{lem:truncation-comparison}
Let \(H = H(T)\), and let
\[
    r^H_t(a)
    =
    a\cdot \ind{\tau_t(a) \leq \min\{H,T-t\}}.
\]
Fix any learner and let \(R(T)\) and \(R^H(T)\) be its expected regrets under the rewards
\(r_t\) and \(r^H_t\), respectively.
Then
\[
    R(T) \leq R^H(T) + T\beta(H).
\]
\end{lemma}

\begin{proof}
Fix a quote \(a \in [0,1]\). The true reward \(r_t(a)\) and the truncated
reward \(r^H_t(a)\) differ only when the quote trades before the end of the
game, but more than \(H\) steps after it was posted. Thus
\[
    0
    \leq
    r_t(a) - r^H_t(a)
    \leq
    \ind{H < \tau_t(a) < \infty}.
\]
Taking conditional expectations given the realized history \(P_1,\dots,P_t\),
we get
\[
    \mathbb{E}\left[
        r_t(a) - r^H_t(a)
        \mid P_1,\dots,P_t
    \right]
    \leq
    \Pr\bigl[H < \tau_t(a) < \infty \mid P_1,\dots,P_t\bigr]
    \leq
    \beta(H),
\]
where the last inequality is exactly the definition of \(\beta(H)\). Taking
expectations and summing over \(t\), this gives
\[
    \mathbb{E}\left[\sum_{t=1}^T r_t(a)\right]
    \leq
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a)\right]
    +
    T\beta(H).
\]
Since this holds for every fixed quote \(a\),
\[
    \max_{a \in [0,1]}
    \mathbb{E}\left[\sum_{t=1}^T r_t(a)\right]
    \leq
    \max_{a \in [0,1]}
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a)\right]
    +
    T\beta(H).
\]

On the other hand, along every realized path we have
\(r^H_t(a_t) \leq r_t(a_t)\) for every \(t\). Therefore
\[
    \mathbb{E}\left[\sum_{t=1}^T r_t(a_t)\right]
    \geq
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a_t)\right].
\]
Combining, we get, 
\[
\begin{aligned}
    R(T)
    &=
    \max_{a \in [0,1]}
    \mathbb{E}\left[\sum_{t=1}^T r_t(a)\right]
    -
    \mathbb{E}\left[\sum_{t=1}^T r_t(a_t)\right] \\
    &\leq
    \max_{a \in [0,1]}
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a)\right]
    -
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a_t)\right]
    +
    T\beta(H) \\
    &=
    R^H(T) + T\beta(H).
\end{aligned}
\]
\end{proof}

\begin{lemma}[Discretization comparison]\label{lem:discretization-comparison}
Let \(K \geq 2\), and let
\[
    \mathcal{G}_K
    =
    \left\{0, \frac{1}{K}, \dots, \frac{K-1}{K}\right\}.
\]
Consider a grid-restricted problem where \(a_t \in
\mathcal{G}_K\) for every \(t\). Define regret of a learner as
\[
    R^H_K(T)
    =
    \max_{b \in \mathcal{G}_K}
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(b)\right]
    -
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a_t)\right].
\]
Let \(R^H(T)\) be the regret of the same learner in the original
problem, where the comparator may choose any fixed action in \([0,1]\):
\[
    R^H(T)
    =
    \max_{a \in [0,1]}
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a)\right]
    -
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a_t)\right].
\]
Then,
\[
    R^H(T) \leq R^H_K(T) + \frac{T}{K}.
\]
\end{lemma}

\begin{proof}
Let \(L_t = \min\{H,T-t\}\). For every quote \(a \in [0,1]\), choose a grid
point \(b(a) \in \mathcal{G}_K\) such that
\[
    b(a) \leq a
    \qquad\text{and}\qquad
    a - b(a) \leq \frac{1}{K}.
\]
This is possible by rounding \(a\) down to the nearest point of
\(\mathcal{G}_K\).

Fix \(a\) and write \(b = b(a)\). Since \(b \leq a\), any future price that
exceeds \(a\) also exceeds \(b\). Therefore, if quote \(a\) trades within
\(L_t\) steps, then quote \(b\) also trades within \(L_t\) steps. Equivalently,
\[
    \ind{\tau_t(a) \leq L_t}
    \leq
    \ind{\tau_t(b) \leq L_t}
\]
on every realized path. Hence, pathwise,
\[
\begin{aligned}
    r^H_t(a)
    &=
    a\cdot \ind{\tau_t(a) \leq L_t} \\
    &=
    b\cdot \ind{\tau_t(a) \leq L_t}
    +
    (a-b)\cdot \ind{\tau_t(a) \leq L_t} \\
    &\leq
    b\cdot \ind{\tau_t(b) \leq L_t}
    +
    (a-b) \\
    &\leq
    r^H_t(b) + \frac{1}{K}.
\end{aligned}
\]
Taking expectations and summing over \(t\), we get
\[
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a)\right]
    \leq
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(b(a))\right]
    +
    \frac{T}{K}
    \leq
    \max_{b \in \mathcal{G}_K}
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(b)\right]
    +
    \frac{T}{K}.
\]
Since this holds for every \(a \in [0,1]\), the best continuum comparator is
within \(T/K\) of the best grid comparator:
\[
    \max_{a \in [0,1]}
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(a)\right]
    \leq
    \max_{b \in \mathcal{G}_K}
    \mathbb{E}\left[\sum_{t=1}^T r^H_t(b)\right]
    +
    \frac{T}{K}.
\]
Subtracting the learner's expected truncated reward
\(\mathbb{E}\left[\sum_{t=1}^T r^H_t(a_t)\right]\) from both sides yields
\[
    R^H(T) \leq R^H_K(T) + \frac{T}{K}.
\]
\end{proof}

\paragraph{Putting the terms together.}
The proof sketch above began by pretending that the problem already has \(K\)
arms. Lemma~\ref{lem:discretization-comparison} explains how to justify this:
run the learner on the grid \(\mathcal{G}_K\), and then compare its performance
to the original comparator. If the delayed finite-arm algorithm
guarantees
\[
    R^H_K(T) = O\left(\sqrt{T H \log K}\right),
\]
then Lemmas~\ref{lem:truncation-comparison}
and~\ref{lem:discretization-comparison} give
\[
\begin{aligned}
    R(T)
    &\leq
    R^H(T) + T\beta(H) \\
    &\leq
    R^H_K(T) + \frac{T}{K} + T\beta(H) \\
    &=
    O\left(\sqrt{T H \log K}\right)
    +
    \frac{T}{K}
    +
    T\beta(H).
\end{aligned}
\]
Thus the regret bound has three terms:
\[
    \underbrace{O\left(\sqrt{T H \log K}\right)}_{\text{learning with delay}}
    +
    \underbrace{\frac{T}{K}}_{\text{discretization}}
    +
    \underbrace{T\beta(H)}_{\text{truncation}}.
\]
The discretization term is explicitly \(T/K\).

The parameters \(K\) and \(H\) should be chosen to balance these three terms.
For a fixed \(H\), the grid should be fine enough that \(T/K\) does not
dominate the delayed-learning term. Since \(K\) appears only logarithmically in
the delayed-learning term, a simple safe choice is \(K=T\), which makes
\(T/K=1\) and gives
\[
    R(T)
    \leq
    O\left(\sqrt{T H \log T}\right)
    +
    T\beta(H)
    +
    1.
\]
A more economical choice, up to logarithmic factors, is to take
\(K \approx \sqrt{T/H}\), which makes the discretization term no larger than
the delayed-learning term.

After \(K\) is chosen, \(H\) controls the tradeoff between the delayed-learning
term and the truncation term. Increasing \(H\) makes the finite-arm delayed
learning problem harder, because the term \(\sqrt{T H \log K}\) grows with
\(H\). But increasing \(H\) also makes the truncation error \(T\beta(H)\)
smaller. The best choice is therefore obtained by approximately solving
\[
    \sqrt{T H(T) \log K(T)}
    \approx
    T\beta(H(T)).
\]
Equivalently, with the simple choice \(K=T\), one balances
\[
    \beta(H(T))
    \approx
    \sqrt{\frac{H(T)\log T}{T}}.
\]
There is no universal optimal \(H(T)\) without more information about the decay
of \(\beta\). If \(\beta(h) \lesssim h^{-\alpha}\), then the balancing choice
with \(K=T\) is
\[
    H(T) \asymp \left(\frac{T}{\log T}\right)^{1/(2\alpha+1)},
\]
which gives regret of order
\[
    T^{(\alpha+1)/(2\alpha+1)}(\log T)^{\alpha/(2\alpha+1)}
\]
up to constants. If instead \(\beta(h)\) decays exponentially, then \(H(T)\)
only needs to grow logarithmically in \(T\), giving regret nearly
\(\sqrt{T}\) up to logarithmic factors.

For the qualitative sublinear-regret result, Assumption~\ref{ass:tail-delays}
is enough. Choose \(H(T)\to\infty\) slowly enough that
\(H(T)\log T=o(T)\), and take \(K=T\). Then
\(\sqrt{T H(T)\log T}=o(T)\), \(T\beta(H(T))=o(T)\), and \(T/K=1\).


\medskip
\noindent\emph{Only if direction.}
\end{proof}

\end{document}
