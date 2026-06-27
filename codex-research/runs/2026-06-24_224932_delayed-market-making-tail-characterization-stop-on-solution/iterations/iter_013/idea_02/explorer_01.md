## Summary

The cleanest algorithmic route is not a two-level “base learner over quotes plus meta-learner over $H$” construction. A simpler reduction is to make each pair $(H,b)$, where $H$ is dyadic and $b\in G_K$, a single delayed expert with surrogate reward
$$
y_t(H,b)=r_t^H(b)=b\,\mathbf{1}\{\max_{t<s\le \min(t+H,T)}P_s>b\}.
$$
If we had a full-information expert algorithm with arm-specific delay $d_{(H,b)}\le H$ and regret to each arm scaling like
$$
\mathfrak R_T(H,b)\lesssim \sqrt{T(H+1)\log(|\mathcal H|K)},
$$
then we would get the desired tail-adaptive upper bound:
$$
R_T^P
\le
\frac{T}{K}
+
\min_{H\in\mathcal H}
\left\{
\delta_T^P(H)+
O\!\left(\sqrt{T(H+1)\log(|\mathcal H|K)}\right)
\right\}.
$$
Dyadic $H$'s lose only constants because $\delta_T^P(H)$ is nonincreasing.

The main unresolved algorithmic lemma is therefore not market-specific; it is a heterogeneous-delay full-information experts theorem with comparator-specific delay dependence.

## Concrete Progress

- Replaced the proposed nested base/meta architecture by a one-level expert construction over $(H,b)$. This avoids adding both base regret and meta regret.

- The learner posts quote $b_t$ from the chosen pair $(H_t,b_t)$. Its true reward satisfies pathwise
$$
  r_t(b_t)\ge r_t^{H_t}(b_t)=y_t(H_t,b_t),
$$
  so ignoring rewards after $H_t$ is safe for an upper-bound proof.

- For any fixed $H$ and grid quote $b$,
$$
  \sup_a \mathbb E\sum_t r_t(a)
  \le
  \mathbb E\sum_t r_t^H(b)
  +\delta_T^P(H)+T/K
$$
  after choosing $b$ as the best $K$-grid quote for the $H$-truncated comparator.

- Thus the adaptive market theorem follows directly from the arm-specific delayed-experts oracle inequality.

## Claims Or Lemmas

**Conditional Lemma: Tail-Adaptive Truncation From Heterogeneous Delays.**  
Let $\mathcal H=\{1,2,4,\ldots,2^M\le T\}$ and $G_K=\{0,1/K,\ldots,(K-1)/K\}$. Suppose a full-information algorithm over arms $\mathcal E=\mathcal H\times G_K$ observes $y_t(H,b)\in[0,1]$ after delay at most $H$, and satisfies for every arm
$$
\sum_t y_t(H,b)-\mathbb E\sum_t y_t(H_t,b_t)
\le B_T(H).
$$
Then for every public exogenous law $P$,
$$
R_T^P
\le
\frac{T}{K}
+
\min_{H\in\mathcal H}
\{\delta_T^P(H)+B_T(H)\}.
$$

If $B_T(H)\lesssim \sqrt{T(H+1)\log(K\log T)}$, this gives the tuned truncation rate without knowing the tail profile. For $\delta_T(H)\le CTH^{-\alpha}$ and $K=T$, it recovers
$$
R_T\lesssim
T^{(\alpha+1)/(2\alpha+1)}
(\log T)^{\alpha/(2\alpha+1)}
$$
up to $\log\log T$ factors.

## Proof Attempts

The conditional proof is straightforward:

1. Run the delayed expert algorithm on arms $(H,b)$ with rewards $y_t(H,b)=r_t^H(b)$.

2. The market learner’s actual reward dominates its surrogate reward:
$$
   \sum_t r_t(b_t)\ge \sum_t y_t(H_t,b_t).
$$

3. For fixed $H$, let $b_H\in G_K$ be a best expected $H$-truncated grid quote. The delayed expert regret gives
$$
   \mathbb E\sum_t y_t(H_t,b_t)
   \ge
   \mathbb E\sum_t r_t^H(b_H)-B_T(H).
$$

4. Grid rounding and comparator-gap truncation give
$$
   V_T^P
   \le
   \mathbb E\sum_t r_t^H(b_H)+\delta_T^P(H)+T/K.
$$

5. Combine and minimize over $H$.

For dyadic $H$, if $H^\star$ is the best integer window, take dyadic $\bar H\in[H^\star,2H^\star]$. Since $\delta_T(H)$ is nonincreasing, only the square-root term changes by a constant factor.

## Gaps And Risks

- The missing theorem is a comparator-specific heterogeneous-delay Hedge bound. A standard delayed full-information reduction using the largest delay would pay $H_{\max}$, giving
$$
  O(\sqrt{T H_{\max}\log(K|\mathcal H|)}),
$$
  which defeats adaptation if $H_{\max}$ is near $T$.

- The original nested base/meta plan has the same issue: unless the meta-learner’s regret to base $H$ scales with $H$, not with the largest candidate window, the oracle inequality fails.

- A naive “observe cumulative rewards only when they arrive” Hedge master may be analyzable, but I do not currently have a proof that its regret to arm $H$ is $O(\sqrt{TH})$. This should be isolated as a separate online-learning lemma.

- The construction relies on public exogenous prices. If prices are action-dependent, unplayed $(H,b)$ rewards are not well-defined from the realized path.

## Counterexamples Or Obstructions

- Max-delay aggregation is not enough. Including windows up to $T$ would produce essentially linear meta regret.

- Using true rewards instead of $H$-truncated surrogate rewards at the meta level reintroduces uncontrolled or infinite delays. The meta reward for candidate $H$ should be $r_t^H(\cdot)$, not the eventual true reward.

- Randomly mixing over $H$ with fixed prior weights cannot yield an oracle bound, since a small prior weight on the optimal $H$ loses order $T$.

## Sources Consulted

No web sources consulted. Local files read: `problem.md`, all listed `working_notes/*.md`, and `iterations/iter_013/idea_02/idea.md`.

## Recommended Next Steps

1. Prove or refute the heterogeneous-delay experts lemma:
   comparator regret to arm $i$ should scale with its delay $d_i$, not $\max_j d_j$.

2. Test the natural algorithm $p_t(i)\propto \pi_i\exp(\eta_i S_t(i))$, where $S_t(i)$ is observed cumulative reward, with arm-specific learning rates $\eta_i\asymp 1/\sqrt{T(d_i+1)}$.

3. If that fails, search for an existing multi-delay full-information theorem or build a dyadic bucket master with provable comparator-specific delay overhead.

4. Keep the one-level $(H,b)$ construction as the preferred market reduction; it is cleaner than base-plus-meta once the delayed-experts lemma is available.