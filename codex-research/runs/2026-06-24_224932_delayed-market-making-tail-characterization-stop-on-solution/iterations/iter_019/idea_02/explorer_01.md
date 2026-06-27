## Summary

The $\mathrm{ba}$ dual is not the same as the existing product-closure finite-subclass formula. It maps to a different equivalence:

- Finite/finitely supported priors correspond to the accepted product-closure relaxation.
- Finitely additive $\mathrm{ba}$ priors correspond to the exact abstract minimax value over the actual convex attainable reward set $C\subset[0,T]^\Theta$, at least on a fixed finite grid.
- Therefore $\mathrm{ba}$ can recover arbitrary infinite-class gaps, including the non-Borel label gap, but only by using non-statistical priors with no ordinary mixture-law/posterior interpretation.

So the idea is mathematically meaningful, but it is closer to an abstract convex-duality restatement of the full minimax value than to a new tail or Bayes-predictability characterization.

## Concrete Progress

Let $G$ be finite and
$$
C=\{(L_\theta(A))_{\theta\in\Theta}: A \text{ admissible randomized grid policy}\}\subset[0,T]^\Theta,
\qquad
V=(V_\theta^G)_\theta .
$$
Assuming randomized policies so $C$ is convex, define
$$
\mathcal R_G(\Theta)=\inf_{c\in C}\sup_{\theta\in\Theta}(V_\theta-c_\theta).
$$

Let $\Delta_{\mathrm{ba}}(\Theta)$ be positive normalized finitely additive measures on all subsets of $\Theta$, equivalently positive norm-one functionals on $\ell^\infty(\Theta)$. Then the natural $\mathrm{ba}$ dual is
$$
D_{\mathrm{ba}}
=
\sup_{\mu\in\Delta_{\mathrm{ba}}(\Theta)}
\left[
\langle V,\mu\rangle-\sup_{c\in C}\langle c,\mu\rangle
\right].
$$

At the abstract reward-vector level,
$$
D_{\mathrm{ba}}=\mathcal R_G(\Theta).
$$

By contrast, the finite-prior dual
$$
D_{\mathrm{fin}}
=
\sup_{\pi\in\Delta_{\mathrm{fin}}(\Theta)}
\left[
\langle V,\pi\rangle-\sup_{c\in C}\langle c,\pi\rangle
\right]
$$
equals the accepted finite-subclass/product-closure value:
$$
D_{\mathrm{fin}}
=
\sup_{F\Subset\Theta}\mathcal R_G(F)
=
\inf_{c\in\overline C^{pt}}\sup_\theta(V_\theta-c_\theta).
$$

Thus:
$$
D_{\mathrm{fin}}\le D_{\mathrm{ba}}=\mathcal R_G(\Theta),
$$
with equality exactly when there is no product-closure gap.

## Claims Or Lemmas

**Claim 1: $\mathrm{ba}$ dual gives exact abstract minimax.**  
For convex $C\subset\ell^\infty(\Theta)$,
$$
\inf_{c\in C}\sup_\theta(V_\theta-c_\theta)
=
\sup_{\mu\in\Delta_{\mathrm{ba}}(\Theta)}
\left[\langle V,\mu\rangle-\sup_{c\in C}\langle c,\mu\rangle\right].
$$

**Claim 2: finite priors give the product-closure relaxation.**  
The finitely supported prior dual equals the finite-subclass modulus and hence the product-closure relaxed value from the notes.

**Claim 3: product-closed/no-gap classes make $\mathrm{ba}$ unnecessary in value.**  
If $C=\overline C^{pt}$, or if payoff-measure domination gives product compactness in the completed-kernel model, then
$$
D_{\mathrm{ba}}=D_{\mathrm{fin}}.
$$
So every $\mathrm{ba}$ optimal value is approximable in value by ordinary finite priors, though not necessarily by approximating a particular $\mathrm{ba}$ prior.

## Proof Attempts

For Claim 1: use
$$
\sup_{\mu\in\Delta_{\mathrm{ba}}}\langle x,\mu\rangle=\sup_\theta x_\theta
$$
for every $x\in\ell^\infty(\Theta)$. The inequality “$\le$” follows from positivity and normalization; the reverse follows from Dirac measures.

Then apply Sion minimax with compact convex side $\Delta_{\mathrm{ba}}$ in the weak-* topology and convex side $C$:
$$
\inf_{c\in C}\sup_{\mu\in\Delta_{\mathrm{ba}}}\langle V-c,\mu\rangle
=
\sup_{\mu\in\Delta_{\mathrm{ba}}}\inf_{c\in C}\langle V-c,\mu\rangle .
$$
The right side is exactly the displayed $\mathrm{ba}$ dual.

For Claim 2: restricting $\mu$ to finite support gives, for each finite $F$, the already accepted finite-grid minimax/Bayes identity on $F$. Taking $\sup_F$ gives the finite-subclass modulus, which the notes identify with the product-closure relaxed value.

## Gaps And Risks

The $\mathrm{ba}$ dual should not be written as a posterior-predictive $\Psi_G$ formula. A finitely additive prior need not induce a countably additive mixture law on price paths, and regular conditional probabilities may not exist.

The support term must remain
$$
\sup_{c\in C}\langle c,\mu\rangle,
$$
unless a separate finitely additive conditional-expectation theory is introduced.

This does not solve scalar tail characterization, rates, or algorithm design. It is exact because it dualizes the whole attainable reward set $C$, which is almost as hard as the minimax problem itself.

The original Borel-policy bridge still matters. The theorem is only as meaningful as the definition of $C$. If $C$ is the completed-kernel reward set, the result is clean. If $C$ is the original Borel private-randomized policy reward set, the pending policy-alignment issues remain.

## Counterexamples Or Obstructions

The abstract finite-support obstruction cleanly separates finite priors from $\mathrm{ba}$. Let $\Theta=\mathbb N$, $V\equiv1$, and
$$
C=\{c\in[0,1]^\mathbb{N}: c \text{ has finite support}\}.
$$
Every finite subclass has value $0$, because one can choose $c=1$ on that finite set. Hence $D_{\mathrm{fin}}=0$. But the full value is $1$, since every finite-support $c$ misses some coordinate. A free ultrafilter finitely additive probability $\mu$ has $\mu(F)=0$ for every finite $F$, so
$$
\langle V,\mu\rangle=1,\qquad \sup_{c\in C}\langle c,\mu\rangle=0,
$$
and $D_{\mathrm{ba}}=1$.

For the non-Borel label market obstruction, the same mapping says: finite priors/product closure see value $0$, while the $\mathrm{ba}$ dual recovers the true Borel-policy value $D/6$. The witnessing $\mathrm{ba}$ object is a separating functional, not an ordinary statistical prior.

## Sources Consulted

Local files only: `problem.md`, `working_notes/canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `iteration_summaries.md`, and `iterations/iter_019/idea_02/idea.md`.

No web sources consulted.

## Recommended Next Steps

Write this as an “Abstract $\mathrm{ba}$ Duality Proposition” after the finite-grid reward-set setup, explicitly saying it is not a posterior Bayes formula.

Add a corollary: under product-closed or payoff-measure dominated no-gap assumptions, the $\mathrm{ba}$ value equals the finite-prior value, so $\mathrm{ba}$ adds no value-level strength there.

Use the finite-support and non-Borel label examples to explain exactly what $\mathrm{ba}$ recovers: true infinite-class gaps missed by finite priors, at the cost of nonconstructive finitely additive witnesses.