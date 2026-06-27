## Summary

The explorer’s local zero-block LP claim is worth pursuing. I do not see a fatal gap in the finite-grid duality or in the continuum \(1/e\) upper bound, provided everything is stated with `sup` comparators and strict-threshold limits.

The main vulnerabilities are interpretive and transfer-related: the \(\lambda\) distribution is a minimax certificate over deterministic continuations, not a hard stochastic process; the finite-\(m\) constant is not proved; and the concatenation/same-path lifts need explicit outside-reward caps, \(m=o(N)\), and exact policy quantifiers.

## Issue List

- **Plausible but incomplete:** The sharp finite-support constant
  \[
  \kappa_m^*=\left(\frac{m-1}{m}\right)^m
  \]
  is only constructed, not proved. The missing step is an upper bound showing no \(m\)-point law beats the discrete equal-revenue tails. A likely proof uses tail masses \(S_i=\Pr(C\ge c_i)\), revenue \(R=\max_i c_iS_i\), and an AM-GM optimization, but this still needs to be written.

- **False claim if read pointwise:** A fixed \(m\)-threshold set need not have gap \(((m-1)/m)^m\). Example: for \(C=\{0.9,1\}\), the two-threshold formula gives
  \[
  \kappa=\frac{0.9(1-0.9)}{1}=0.09,
  \]
  not \(1/4\). The claimed constant can only mean the supremum over choices of \(m\) thresholds.

- **Missing assumption:** The continuum \(1/e\) statement requires optimizing over all laws on \([0,1]\) with top support normalized to \(1\). If the maximum threshold is \(b<1\), scaling changes the constant to \(b/e\).

- **Missing assumption:** Strict crossing means revenue is
  \[
  \sup_a a\Pr(C>a),
  \]
  not necessarily a maximum. Any use of posted-price literature with weak purchase \(v\ge p\) must be translated by `sup`/left-limit arguments.

- **Plausible but incomplete:** The lift from local \(\kappa(C)\) to universal block lower bounds needs a theorem of the form
  \[
  R_T \ge N\kappa(C)-M
  \]
  after a prefix of length \(M\). This requires same first-\(N\) action law across all terminal continuations and an old-reward cap.

- **Plausible but incomplete:** The same-path multi-horizon lift \(0^N,c_1,\dots,c_m\) needs bookkeeping for intermediate threshold-round quotes. The safe condition should be \(M_i+m_i=o(N_i)\), not just \(m_i=o(N_i)\), with an \(O(m_i)\) cap in the regret inequality.

- **Unsupported citation if overstated:** Roesler-Szentes supports the unit-elastic/equal-revenue analogy, but its AER model is a buyer-optimal signal/information model. Shen-Tang-Zeng and Condorelli-Szentes are closer to the direct “choose any distribution on \([0,1]\), seller posts price” formulation.

## Counterexamples Or Stress Tests

- **Stochastic-mixture trap:** If \(C\) is actually sampled from the equal-revenue law and the regret is still \(\sup_a \mathbb E[\cdot]-\mathbb E[\cdot]\), the best fixed quote gets \(N\sup_a a\Pr(C>a)=N/e\), and the learner can match it. The dual distribution proves one deterministic continuation is bad; it is not itself a hard stochastic instance.

- **Coarse-grid inflation:** In the finite-grid LP, if \(A\) does not contain quotes just below thresholds, \(\kappa_A(C)\) can overstate the continuum learner’s obstruction. Dense grids or \(\eta\)-comparators are essential.

- **Post-divergence compensation:** A block with local gap \(N\kappa\) followed by a long revealed suffix can allow the learner to earn back the deficit. This is CE-011 again; terminal blocks avoid it only because outside rewards are capped.

- **Large \(m\) in same-path blocks:** If \(m=\Theta(N)\), intermediate-round rewards and horizon-denominator effects are no longer lower-order. The \(1/e\) limit needs \(m_i\to\infty\) but \(m_i=o(N_i)\).

## Literature Or Known-Result Conflicts

No conflict found with known posted-price results. The literature supports the \(1/e\) equal-revenue geometry, but it should be cited as an analogy/proof aid, not as a market-making lower bound.

Shen-Tang-Zeng explicitly solve the single-buyer distribution problem and identify the equal-revenue distribution starting at \(1/e\) with an atom at \(1\). Condorelli-Szentes’ JPE version states the same \(1/e\), unit-elastic-demand outcome. Roesler-Szentes is relevant but less direct because it is framed through buyer-optimal learning/signal structures.

## What Survives The Critique

- Finite-grid LP duality survives.
- Continuum formula
  \[
  \kappa(C)=\max_{\lambda\in\Delta(C)}
  \left(\mathbb E_\lambda C-\sup_a a\Pr_\lambda(C>a)\right)
  \]
  survives for finite \(C\), with strict-threshold cleanup.
- The arbitrary-law upper bound
  \[
  \mathbb E C-\sup_a a\Pr(C>a)\le 1/e
  \]
  survives.
- The equal-revenue construction gives finite constants approaching \(1/e\).
- The proposed stronger universal and horizon-oblivious lower bounds are worth pursuing, but not yet proved.

## Bibliography Candidates

- Anne-Katrin Roesler and Balázs Szentes. “Buyer-Optimal Learning and Monopoly Pricing.” *American Economic Review* 107(7):2072-2080, 2017. DOI: https://doi.org/10.1257/aer.20160145. Relevance: unit-elastic buyer-optimal demand and \(1/e\) posted-price geometry.

- Weiran Shen, Pingzhong Tang, Yulong Zeng. “Buyer-Optimal Distribution.” AAMAS 2018, IFAAMAS. https://www.weiran-shen.info/page_files/buyer_optimal_distribution.pdf. Relevance: direct posted-price distribution problem; identifies the truncated equal-revenue distribution and buyer utility \(1/e\).

- Daniele Condorelli and Balázs Szentes. “Information Design in the Holdup Problem.” *Journal of Political Economy* 128(2):681-709, 2020. DOI: https://doi.org/10.1086/704574. Relevance: direct arbitrary-distribution monopoly-pricing model with \(1/e\) payoffs and unit-elastic demand.

## Recommended Next Checks

1. Prove the finite-\(m\) upper bound rigorously, or demote \(((m-1)/m)^m\) to “attained by candidate construction.”
2. Write the universal block theorem with finite \(C_i\):
   \[
   R_{T_i}\ge N_i\kappa(C_i)-M_i.
   \]
3. Write the same-path theorem with \(m_i\) thresholds and explicit \(O(m_i)\) intermediate-round accounting.
4. Add a warning that \(\lambda\) is a minimax dual certificate, not a stochastic hard instance under pseudo-regret.