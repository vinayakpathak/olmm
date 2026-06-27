## Summary

The explorer’s abstract block-local Bayes calculation is mostly sound under added assumptions, but it does not yet produce a valid delayed-market lower bound. The fatal obstruction is localization: in the actual protocol, quotes persist, so repeated same-level blocks are coupled by future terminal prices. This destroys the intended $q$-tail/truncation envelope exactly in the regime where limited leakage would be useful.

## Issue List

| Classification | Issue |
|---|---|
| **Fatal gap** | The block-local model is not the market model. In the market, a quote in block $j$ can trade on terminal prices from blocks $j,j+1,\dots,N$, so the one-block reward curve is replaced by $g_{\theta,n}(a)=a[1-(1-r_{\theta,a})^n]$. The Bayes lower bound for independent local rewards cannot be transferred without a localization gadget. |
| **Missing assumption** | The exact formula $D\gamma\sum_j \mathbb E\min(p_j,1-p_j)$ needs a precise two-quote reward model: in each world the wrong quote is exactly $\gamma$ below the correct quote for all $D$ decisions, the correct quote is fixed across blocks, and observations $Z_j$ arrive only after the block. |
| **Plausible but incomplete** | The TV identity is correct only with expectation under the equal-prior mixture: $\mathbb E_{\bar Q}\min(p_j,1-p_j)=\frac12(1-\mathrm{TV}(Q_+^j,Q_-^j))$. This should be stated explicitly. |
| **Plausible but incomplete** | The Pinsker step gives $\Omega(D\gamma\min\{N,1/\kappa\})$ only after truncating to $j\lesssim 1/\kappa$. Constants and the KL direction/absolute-continuity assumptions should be written. |
| **Unsupported general claim** | “If payoff separation $\gamma$ is carried by $q$-mass tail perturbation, then $\kappa\asymp\gamma^2/q$” is shown only for the displayed three-atom construction. As a general lower bound it needs a variational/Le Cam argument and a formal definition of “carried by $q$-mass.” |
| **Missing assumption** | In the three-atom construction, $q$ is not defined cleanly. Is it $p_0$, $p_0+\theta\varepsilon$, or total positive mass $p_0+\theta\varepsilon+m$? Need constraints $0\le p_0-\varepsilon$, $p_0+\varepsilon+m\le1$, and fixed $\ell,h$. |
| **Worth pursuing** | The report correctly identifies the right next object: compute the exact finite-grid Bayes value for the same-level market formula, not the block-local surrogate. |

## Counterexamples Or Stress Tests

Same-level repeated blocks break the tail envelope. If a quote $h$ has per-terminal hit probability $p_h$, then from the first block
$$
\Pr(D<\tau(h)<\infty)\approx (1-p_h)\bigl[1-(1-p_h)^{N-1}\bigr].
$$
When $Np_h\gg1$, this is near $1$, not $p_h$ or $q$.

This is not a corner case. The useful limited-leakage regime has $\kappa\asymp\gamma^2/q$, so one wants $N\approx1/\kappa\approx q/\gamma^2$. If $\gamma\ll q$, then $Nq\gg1$, exactly where old quotes almost surely get hit by later blocks.

Changing quote levels by block avoids cross-hits only by threatening fixed-comparator accumulation: one fixed quote may no longer collect value across many blocks. Clearing quotes with common high prices also changes the reward curves and can make high quotes dominate.

## Literature Or Known-Result Conflicts

No external conflict is apparent. The abstract Bayes calculation is consistent with the accepted finite-grid Bayes/myopic framework.

The market-realization obstruction matches the existing notes: same-level repeated q-scaled atoms already fail because persistent quotes destroy the intended tail envelope. This explorer report reinforces that obstruction rather than overcoming it.

## What Survives The Critique

The block-local finite-grid calculation is useful as a diagnostic lower-bound toy model.

The three-atom terminal-price arithmetic appears correct for one block, under parameter constraints:
$$
g_\theta(H)-g_\theta(L)=\theta(h-\ell)\varepsilon,\qquad
\mathrm{KL}=\Theta(\varepsilon^2/p_0)
$$
for fixed $\ell,h$.

The tail-envelope audit is valuable and should be promoted: any future construction must prove localization, not assume it.

## Recommended Next Checks

1. Compute the exact same-level market Bayes value:
$$
V_\theta^G=\max_{a\in G}D\sum_{n=1}^N a[1-(1-r_{\theta,a})^n].
$$

2. Prove a tail-explosion lemma: fixed quote accumulation across $N$ same-level $q$-tail blocks with $Nq\gg1$ forces large $\beta(D)$, $\Delta(D)$, or $\delta(D)$.

3. Formalize the $(q,\gamma,\kappa)$ parameter regime in the three-atom construction.

4. Test localization gadgets against three constraints simultaneously: same fixed comparator quote, no cross-block hits, and small information leakage.