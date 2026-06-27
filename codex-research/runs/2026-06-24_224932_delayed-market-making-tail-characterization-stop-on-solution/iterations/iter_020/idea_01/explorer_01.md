## Summary

The $\mathrm{ba}$ dual idea is sound as an abstract finite-grid value theorem. The clean proof should not use market-specific conditional probabilities. It should be written as ordered Banach-space duality in $X=\ell^\infty(\Theta)$, with the randomized-policy reward set
$$
C=\{L(A):A\in\mathcal A_G\}\subset [0,T]^\Theta
$$
convex by ex-ante randomization.

The theorem gives an exact signed minimax value identity:
$$
\mathcal R_G(\Theta)
=
\inf_{c\in C}\sup_{\theta\in\Theta}(V_\theta^G-c_\theta)
=
\sup_{\nu\in ba_1^+(\Theta)}
\left\{\langle V^G,\nu\rangle-\sup_{c\in C}\langle c,\nu\rangle\right\}.
$$
Here $ba_1^+(\Theta)$ means positive finitely additive probabilities on all subsets of $\Theta$, equivalently positive norm-one functionals on $\ell^\infty(\Theta)$.

This is referee-writeable. It is also abstract: it is not a posterior/Bayes $\Psi_G$ theorem, does not give a scalar tail condition, and does not by itself give rates.

## Concrete Progress

A robust proof route is:

1. Fix finite $T$, finite nonempty grid $G$, arbitrary class $\Theta$, and one admissible randomized policy class $\mathcal A_G$.

2. Define $V=V^G\in\ell^\infty(\Theta)$, where
$$
V_\theta^G=\sup_{a\in G}\sum_{t=1}^T\mathbb E_\theta r_t(a).
$$
Since $G$ is finite, this is a max if desired, but using $\sup$ is harmless.

3. Define reward vectors
$$
L(A)_\theta=\mathbb E_{\theta,A}\sum_{t=1}^T r_t(a_t),
\qquad
C=\{L(A):A\in\mathcal A_G\}.
$$
Rewards are bounded by $T$, so $C\subset[0,T]^\Theta\subset\ell^\infty(\Theta)$.

4. Assume $\mathcal A_G$ is closed under ex-ante randomization. Then $C$ is convex.

5. Prove weak duality directly from positivity:
$$
\langle V,\nu\rangle-\sup_{c'\in C}\langle c',\nu\rangle
\le
\langle V-c,\nu\rangle
\le
\sup_\theta(V_\theta-c_\theta).
$$

6. Prove reverse inequality by separating $V-\alpha\mathbf{1}$ from
$$
S=C-X_+,\qquad X_+=\{x\in\ell^\infty(\Theta):x_\theta\ge0\ \forall\theta\},
$$
for every $\alpha<\mathcal R_G(\Theta)$.

This avoids the product-topology closure pitfall. Norm topology is the correct topology for the full arbitrary-class value.

## Claims Or Lemmas

**Lemma 1: Norm closure is harmless.**  
For
$$
F(c)=\sup_\theta(V_\theta-c_\theta),
$$
$F$ is 1-Lipschitz in $\|\cdot\|_\infty$. Also every $\nu\in ba_1^+$ is norm-continuous. Therefore replacing $C$ by $\overline C^{\|\cdot\|_\infty}$ does not change either the primal value or the support functions.

**Lemma 2: Separation point.**  
If $\alpha<\rho:=\inf_{c\in C}\sup_\theta(V_\theta-c_\theta)$, then
$$
z_\alpha:=V-\alpha\mathbf{1}\notin \overline{C-X_+}^{\|\cdot\|_\infty}.
$$
Indeed, if $c_n-x_n\to z_\alpha$ with $x_n\ge0$, then
$$
c_{n,\theta}\ge V_\theta-\alpha-o(1)
$$
uniformly in $\theta$, hence
$$
\sup_\theta(V_\theta-c_{n,\theta})\le \alpha+o(1),
$$
contradicting $\alpha<\rho$.

**Lemma 3: Separator is positive.**  
Strong Hahn-Banach separation gives nonzero $\phi\in(\ell^\infty)^*$ with
$$
\phi(z_\alpha)>\sup_{s\in C-X_+}\phi(s).
$$
Because $C-X_+$ is downward closed, $\phi$ must be positive. If some $x\ge0$ had $\phi(x)<0$, then $c-\lambda x\in C-X_+$ would make $\sup_S\phi=+\infty$, impossible under separation.

**Lemma 4: Normalize to a finitely additive prior.**  
A nonzero positive $\phi\in(\ell^\infty)^*$ has $\phi(\mathbf{1})>0$. Normalize
$$
\nu=\phi/\phi(\mathbf{1}).
$$
Then $\nu\in ba_1^+(\Theta)$.

**Lemma 5: Reverse duality.**  
Since positivity gives
$$
\sup_{s\in C-X_+}\phi(s)=\sup_{c\in C}\phi(c),
$$
the separation inequality implies
$$
\langle V,\nu\rangle-\alpha>\sup_{c\in C}\langle c,\nu\rangle.
$$
Thus the dual objective is $>\alpha$. Letting $\alpha\uparrow\rho$ proves strong duality.

## Proof Attempts

The separation proof is the best referee route. It gives all the right ingredients:

- Uses norm closure, not product closure.
- Forces positivity from the order ideal $C-X_+$.
- Normalizes the separator into $ba_1^+$.
- Proves the full arbitrary-class value, not just finite-subclass relaxation.

A Sion minimax proof is also possible:
$$
\sup_\theta y_\theta=\sup_{\nu\in ba_1^+}\langle y,\nu\rangle
$$
because Dirac masses are included. Then apply minimax to
$$
f(c,\nu)=\langle V-c,\nu\rangle
$$
with $ba_1^+$ weak-* compact. This is shorter, but the separation proof is safer for the assigned “referee-proof” goal because it exposes the positivity argument and topology choices.

## Gaps And Risks

The theorem is value-only. It gives no exact optimal policy unless additional compactness/attainment assumptions are imposed. Approximate policies exist only by the definition of the infimum.

The dual optimizer likely exists because $ba_1^+$ is weak-* compact and the objective is upper semicontinuous, but that is a dual witness, not a policy.

The support term
$$
\sup_{c\in C}\langle c,\nu\rangle
$$
must stay abstract for general $\nu\in ba_1^+$. It should not be rewritten as a posterior-predictive Bayes reward unless $\nu$ is an ordinary finite/countably additive prior with an induced mixture law and regular conditionals.

The proof depends on $C$ being convex. If policies are deterministic only, the identity applies to $\operatorname{conv} C$, not necessarily to the deterministic minimax value.

The theorem dualizes whatever policy class produced $C$. If the intended original Borel-policy class is not aligned with completed prefix kernels, that old policy-class issue remains outside this theorem.

## Counterexamples Or Obstructions

The finite-support reward-vector example explains why $\mathrm{ba}$ is needed. Let $\Theta=\mathbb N$, $V\equiv1$, and
$$
C=\{c\in[0,1]^\mathbb N:c\text{ has finite support}\}.
$$
Every finite subclass has value $0$, but the full value is $1$. Finite or countably additive priors miss this gap; a finitely additive mass at infinity detects it.

This also shows why product closure is the wrong topology for the arbitrary-class full value. Product closure would fill in too many coordinates and recover only the finite-subclass relaxation.

The hidden/labeled terminal construction remains an obstruction to scalar tail-profile characterizations: even perfect per-world $\beta,\Delta,\delta$ data cannot replace class-level observability or reward-set information.

## Sources Consulted

No web sources consulted.

Local files read: `problem.md`, `working_notes/canonical_summary.md`, `working_notes/claim_ledger.md`, `working_notes/lemma_bank.md`, `working_notes/failed_attempts.md`, `working_notes/counterexamples.md`, `working_notes/literature_map.md`, `working_notes/promising_directions.md`, `working_notes/iteration_summaries.md`, and `iterations/iter_020/idea_01/idea.md`.

## Recommended Next Steps

Write the theorem as a standalone proposition titled something like “Finite-Grid Arbitrary-Class Finitely Additive Duality.”

Include a short “Not a Bayes theorem” paragraph immediately after the proof.

Add a corollary comparing three values:
$$
D_{\rm fin}
=
\sup_{F\Subset\Theta}\mathcal R_G(F),
\qquad
D_{ba}
=
\mathcal R_G(\Theta),
$$
with equality under product-closed/no-gap assumptions.

Do not connect this to tail rates in the same theorem. It belongs in the value-characterization package, while power-tail lower bounds and adaptive truncation remain separate open problems.