## Summary

The explorer’s main conclusion looks correct at the abstract finite-grid reward-vector level: finite-support priors recover the accepted finite-subclass/product-closure relaxation, while finitely additive $\mathrm{ba}$ priors recover the true minimax value over the actual convex attainable reward set $C$.

This is worth pursuing as an “abstract $\mathrm{ba}$ duality” note, but it is not a Bayes/posterior-predictive characterization and does not advance the scalar tail or rate questions. The value of the dual is exact largely because the hard object $\sup_{c\in C}\langle c,\mu\rangle$ still contains the whole policy class.

## Issue List

1. **Plausible but incomplete: Sion/minimax proof needs exact topology.**  
   Claim 1 should specify $C\subset \ell^\infty(\Theta)$ nonempty convex, with the norm topology, and $\Delta_{\mathrm{ba}}\subset \ell^\infty(\Theta)^*$ with the weak-* topology. Then $f(\mu,c)=\langle V-c,\mu\rangle$ is weak-* continuous affine in $\mu$ and norm-continuous affine in $c$, so Sion applies with compact max side $\Delta_{\mathrm{ba}}$. As written, this is repairable but not theorem-ready.

2. **Missing assumption: randomized policies are essential.**  
   The equality is for the convex attainable reward set. If the admissible policy class were deterministic, the support-function dual would compute the convexified game, not necessarily the deterministic minimax value. This matches existing randomization stress tests in the notes.

3. **Missing assumption: fixed finite grid and consistent reward objects.**  
   The $\mathrm{ba}$ proposition should be stated only after fixing finite $T$, finite $G$, grid comparator $V_\theta^G$, and one admissible grid-policy class. Continuum quotes still need the $T/K$ comparison; an exact continuum $\mathrm{ba}$ formula would reintroduce selector/nonattainment issues.

4. **Missing assumption: policy-class alignment is still unresolved for original Borel policies.**  
   If $C$ is the completed $L^\infty$ prefix-kernel reward set, the abstract dual is clean. If $C$ is meant to be the original Borel private-randomized policy reward set, the old bridge issues remain. The $\mathrm{ba}$ dual does not prove $C_{\rm Borel}=C_{L^\infty}$.

5. **Unsupported if phrased as Bayes: $\mathrm{ba}$ priors have no ordinary statistical interpretation.**  
   A finitely additive prior on all subsets of $\Theta$ need not induce a countably additive mixture law on price paths, regular conditionals, or a posterior-predictive envelope. The explorer correctly warns that the support term must remain $\sup_{c\in C}\langle c,\mu\rangle$. Any attempt to write a $\Psi_G(\mu)$ posterior formula would be unjustified.

6. **Plausible but incomplete: finite-prior/product-closure equivalence should cite the accepted lemma.**  
   The statement $D_{\rm fin}=\sup_{F\Subset\Theta}\mathcal R_G(F)=\inf_{\overline C^{pt}}\sup_\theta(V_\theta-c_\theta)$ is consistent with the notes, but the proof should explicitly pass through finite projections of $C$ and the existing finite-subclass product-closure formula.

7. **Worth pursuing but limited: no-gap corollary is value-level only.**  
   If $C=\overline C^{pt}$, then $D_{\rm ba}=D_{\rm fin}$. This means finite priors approximate the optimal value, not a particular $\mathrm{ba}$ prior. The explorer says this; keep it explicit.

## Counterexamples Or Stress Tests

- **Finite-support obstruction confirms the separation.**  
  With $\Theta=\mathbb N$, $V\equiv1$, and $C=\{c\in[0,1]^\mathbb{N}: c \text{ has finite support}\}$, every finite subclass has value $0$, but the full value is $1$. A free ultrafilter $\mathrm{ba}$ prior witnesses $D_{\rm ba}=1$. This supports the explorer’s distinction.

- **Countably additive priors are not enough in that example.**  
  On $\mathbb N$, any countably additive probability $\pi$ gives $\sup_{c\in C}\langle c,\pi\rangle=1$ by taking finite supports with arbitrarily large $\pi$-mass, so the dual gap is $0$. The full gap requires a purely finitely additive object.

- **Non-Borel label gap is recovered only abstractly.**  
  The $\mathrm{ba}$ dual can recover the true Borel-policy value $D/6$ because it separates reward vectors in $\ell^\infty(\Theta)$. But the witness is not an ordinary prior over worlds and should not be interpreted as a statistical experiment.

## Literature Or Known-Result Conflicts

No conflict with the local accepted results. The proposal is consistent with:

- finite-dimensional minimax for finite $\Theta,G$;
- finite-subclass/product-closure formula;
- product-closed no-gap criterion;
- non-Borel label obstruction.

The only caution is functional-analytic hygiene: use Sion/Hahn-Banach with the correct topology and do not blur product-topology duals, which are finite-support measures, with the norm dual $\ell^\infty(\Theta)^*=\mathrm{ba}(\Theta)$.

## What Survives The Critique

- Claim 1 survives as an abstract minimax duality proposition under explicit convexity/topology assumptions.
- Claim 2 survives and matches the existing finite-subclass/product-closure theorem.
- Claim 3 survives as a value-level no-gap corollary under product closedness or completed-kernel payoff-measure domination.
- The interpretation survives: $\mathrm{ba}$ adds exact infinite-class separation power, but at the cost of losing posterior/Bayes meaning.

## Recommended Next Checks

1. Write a formal proposition with fixed $T,G$, $V^G\in\ell^\infty(\Theta)$, convex $C\subset[0,T]^\Theta$, and $\Delta_{\rm ba}$ weak-* compact.

2. Prove Claim 1 using Sion with explicit semicontinuity conditions, or via Hahn-Banach/Fenchel separation.

3. Add a paragraph: “This is not a posterior $\Psi_G$ formula.”

4. State the corollary $D_{\rm ba}=D_{\rm fin}$ only under $C=\overline C^{pt}$, and separately say payoff-measure domination gives this only in the completed-kernel model unless the Borel-policy bridge is proved.