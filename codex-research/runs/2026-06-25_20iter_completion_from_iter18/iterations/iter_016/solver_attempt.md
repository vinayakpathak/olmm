## Verdict
SOLVED: no

The original iff is already refuted in the notes. I did not solve the remaining known-path/gluing characterization, but I found a concrete local extension that resolves the iteration-15 target \(h^M,0^N,\ell,0^L,h\).

## Candidate Solution Or Main Attempt
Work in the formal left-limit two-level model \(0<\ell<h\). For the prefix
\[
h^M,0^N,\ell,0^L,h
\]
with \(n=M+N+L+2\), define
\[
H=(M-1)_+,\qquad S=\bigl[\ell(M+N)-hH\bigr]_+ .
\]
Then the finite-prefix value is
\[
D_n=S\left(1-\frac{\ell}{h}\right).
\]
So the post-low zero tail length \(L\) does not increase the intrinsic conflict; it only dilutes \(D_n/n\).

Upper bound: use \(h^-\) on old high coordinates and all post-low coordinates. On the conflict coordinates before the low price, put total \(\ell^-\)-mass \(P=S/h\), and \(h^-\)-mass on the rest. Feasibility follows from \(S\le h(N+\mathbf 1\{M\ge1\})\). Low/intermediate horizons have deficit \(S-\ell P\), and the final high horizon has deficit \((h-\ell)P\), both equal to \(S(1-\ell/h)\).

Lower bound: put dual weights
\[
\alpha=1-\ell/h,\qquad \beta=\ell/h
\]
on the low horizon \(T_0=M+N+1\) and final high horizon \(n\). Old high and post-low coordinates cancel. Each conflict coordinate contributes at most
\[
\sup_a\{\alpha a1\{a\le \ell\}+\beta a1\{a\le h\}\}=\ell,
\]
leaving exactly \(\alpha S\).

## Concrete Lemmas Or Reductions
**Resolved single-drought lemma.** The same proof should extend to a high-free episode ending in a resolving high, even with several \(\ell\)-prices inside the episode: the binding low horizon is the last low before the resolving high. Earlier lows impose prefix-cumulative low-mass constraints, but these are dominated by the final low-surplus constraint because the surplus grows with available low coordinates.

This gives a cleaner local debt interpretation: a low-dominated drought creates surplus
\[
S=[\ell R-hH]_+
\]
relative to old high history; reducing it by low quotes creates final-high debt at exchange rate \(h-\ell\).

## Gaps And Failure Points
This does not prove \(D_n=o(n)\Rightarrow\) existence of one \(o(T)\)-regret anytime policy. It only solves one local drought family.

The formula is in the formal left-limit model. Actual strict crossing needs \(\ell-\eta_t,h-\eta_t\) implementations with cumulative \(\eta\)-loss controlled.

Local drought costs are not proved additive across many droughts. Shared marginals can couple separated episodes, and old high history can damp later conflicts.

## Counterexamples Or Obstructions
The diluted drought obstruction remains decisive:
\[
0^N,\ell,0^L,h,\qquad L\gg N
\]
has large stable-high regret at the low horizon but finite-prefix conflict only
\[
N\ell(1-\ell/h)=o(N+L).
\]
So raw \(Q_T\)-style stable-policy regret is not a localization certificate.

Sparse vanishing spikes and oracle horizon-aware policies still refute raw \(\beta\)-necessity.

## Literature And Bibliography Candidates
I did not find a direct external theorem for the gluing problem.

Potential adjacent additions:
- Amélie Héliou, Panayotis Mertikopoulos, Zhengyuan Zhou, “Gradient-free Online Learning in Continuous Games with Delayed Rewards,” ICML/PMLR 2020. https://proceedings.mlr.press/v119/heliou20a.html. Relevant for continuous-action delayed payoff feedback, but not this suffix-horizon fill model.
- Jialun Cao, David Šiška, Lukasz Szpruch, Tanut Treetanthiploet, “Logarithmic regret in the ergodic Avellaneda-Stoikov market making model,” arXiv:2409.02025, revised 2025. https://arxiv.org/abs/2409.02025. Adjacent market-making regret; different stochastic-control model.
- Jakob Albers, Mihai Cucuringu, Sam Howison, Alexander Y. Shestopaloff, “The Market Maker’s Dilemma,” arXiv:2502.18625, revised 2025. https://arxiv.org/abs/2502.18625. Empirical fill-probability/post-fill-return tradeoff; context only.

## Promising Ideas To Explore
Formalize the multi-low single-drought version as a cumulative low-mass scheduling LP.

Then try a two-level global decomposition into resolved drought episodes, tracking only unresolved low surplus and high debt.

Run finite-prefix LP experiments on repeated diluted droughts to test whether the proposed debt recursion predicts \(D_n\).

## Notes For Critics
Check the endpoint convention \(t<T\): the quote posted at the low time is irrelevant before the final high and can be \(h^-\).

Check the feasibility inequality \(S\le h(N+\mathbf 1\{M\ge1\})\).

The dual uses only two horizons, so any missing intermediate-horizon issue would have to break the primal upper bound, not the lower bound.