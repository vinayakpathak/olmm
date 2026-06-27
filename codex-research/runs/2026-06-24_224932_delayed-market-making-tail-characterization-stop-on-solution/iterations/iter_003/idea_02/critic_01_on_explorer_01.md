## Summary

The explorer’s main finite-horizon minimax claim survives: the q-scaled hidden-terminal pair gives a clean $\Omega(qD)$ lower-bound atom under unknown-class, exogenous-price quantifiers. I do not see a fatal flaw in the Bayes-gap argument.

The weak point is not the lower bound itself, but the tail-profile interpretation. The $\beta$ computation needs an explicit post-horizon extension or a finite-horizon version of $\beta$, and the construction is still far from a matching power-tail lower bound.

## Issue List

- **Missing assumption:** The construction specifies only $P_{1:T}$, but $\beta(h)$ is originally an infinite-process tail. To claim $\beta(h)=q$ for $h<D$ and $0$ for $h\ge D$, one must define $P_s=0$ for all $s>T$, or explicitly introduce a finite-horizon $\beta_T$.

- **Missing assumption:** The lower bound requires the learner not to know whether the world is $L$ or $H$. As a singleton known-law instance, each world has zero regret by the known-law oracle. Any statement like “q-tail mass forces regret” must say “for a common learner over an unknown class.”

- **Plausible but incomplete:** The envelope claim “if $q\le B(D)$, then $\beta(h)\le B(h)$” assumes $B$ is nonincreasing and that the relevant tail is the finite-horizon/absorbing extension tail. Without monotonicity, the right condition is $q\le \inf_{h<D} B(h)$.

- **Plausible but incomplete:** The formulas
$$
  \Delta_i(H)=\delta_i(H)=q(D-H)V_i^0
$$
  are correct for integer $H<D$, but need floor/ceiling conventions if $H$ is real. The final statement should define $H\in\mathbb N$.

- **Worth pursuing:** The general Bayes-gap lemma is strong and reusable. The proof only needs observational identity before the terminal reveal and the comparator being world-specific:
$$
  \Gamma=\frac{V_0+V_1}{2}-\sup_a\frac{g_0(a)+g_1(a)}2.
$$

- **Plausible but incomplete:** The rate conclusion is appropriately cautious. The one-block construction gives only $D B(D)$. For $B(h)=h^{-\alpha}$, that is $D^{1-\alpha}$, strictly below the truncation upper exponent for every $\alpha>0$, and subconstant for $\alpha>1$.

## Counterexamples Or Stress Tests

- **Known-world stress test:** If the learner is told $L$ or $H$, it plays the corresponding maximizer, $1/2$ or $3/4$, and has zero regret. This confirms the lower bound is purely minimax/unknown-class.

- **Post-horizon stress test:** If after $T=D+1$ the process later emits large prices, the claimed $\beta(h)=0$ for $h\ge D$ fails, while the regret lower bound over horizon $T$ is unchanged. So raw $\beta$ is not pinned down by the finite-horizon construction unless the extension is fixed.

- **Power-tail stress test:** With $q=D^{-\alpha}$, the lower bound is $D^{1-\alpha}/8$. For $\alpha\ge1$, this is not a growing regret lower bound, so it cannot support a minimax rate theorem by itself.

- **Repeated-block stress test:** Repetition remains dangerous. Iid block types can make the expected fixed comparator collapse to the Bayes action; common global type can be learned after the first reveal. The explorer correctly flags this.

## Literature Or Known-Result Conflicts

No external citation conflict is apparent. The argument is essentially a two-point/Yao averaging lower bound and can be written self-contained.

The only known-result conflict would arise if the claim were phrased as a fixed-law necessity theorem. That would contradict the existing known-law oracle lemma in the run notes.

## What Survives The Critique

- The q-scaled hidden-terminal lower bound:
$$
  \max_{i\in\{L,H\}} R_i(T)\ge qD/8.
$$

- The revenue-curve constants:
$$
  \sup_a f_L(a)=1/2,\qquad \sup_a f_H(a)=3/4,\qquad
  \sup_a\frac{f_L(a)+f_H(a)}2=1/2.
$$

- The message that valuable delayed reward plus indistinguishability is the real lower-bound mechanism.

- The negative message that this atom alone does not match the truncation upper rate for power tails.

## Recommended Next Checks

1. Rewrite the lemma with exact filtration and horizon timing: decisions $t=1,\dots,D$, terminal reveal at $D+1$, terminal quote ignored.

2. Add absorbing post-horizon prices $P_s=0$ for $s>D+1$, then recompute $\beta,\Delta,\delta$ formally.

3. Promote the Bayes-gap lemma to the lemma bank.

4. For matching lower rates, stop trying simple repeated blocks. Try a multi-scale or Fano-style construction where each reveal leaks limited information and the best fixed quote remains separated.