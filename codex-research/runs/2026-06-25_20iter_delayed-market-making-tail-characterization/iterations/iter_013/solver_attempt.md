## Verdict

SOLVED: no

The original iff conjecture is already refuted under the literal pseudo-regret/process-aware reading. I also do not have a proof of the current strongest open target, namely whether the finite-prefix condition \(D_n(P)=o(n)\) alone implies a projectively consistent known-path anytime policy.

## Candidate Solution Or Main Attempt

I tried to push the iteration-12 finite-prefix LP toward a gluing theorem. The main lesson is that \(D_n=o(n)\) is not enough by a generic compactness argument; any proof must use the special market-making monotonicity \(M_{t,T}\) nondecreasing in \(T\).

A better current target is:

\[
D_n=o(n) \quad + \quad \text{a market-specific projective consistency/monotone-menu argument}
\quad \Longrightarrow \quad o(T)\text{ anytime regret}.
\]

I do not yet have that market-specific argument.

## Concrete Lemmas Or Reductions

**Finite increasing threshold block test.**  
For the deterministic prefix
\[
0^N,c_1,\ldots,c_m,\qquad 0<c_1<\cdots<c_m\le1,
\]
let \(C=\{c_1,\ldots,c_m\}\), \(n=N+m\), and use the formal left-limit version of \(D_n\). Then
\[
N\kappa(C)\le D_n(P)\le N\kappa(C)+m.
\]
The lower bound is the same cancellation used in the same-path multi-threshold lower bound: at horizon \(T_j=N+j\), the comparator value is \((N+j-1)c_j\), while threshold-round learner payoff before \(T_j\) is at most \((j-1)c_j\), leaving the zero-block deficit. The upper bound uses the local primal law for \(C\) on the zero block and pays at most \(m\) for crude threshold-round slack.

For \(m=2\), this gives the exact value
\[
D_{N+2}=N\,\frac{c_1(c_2-c_1)}{c_2}
\]
in the left-limit model, because the single intermediate threshold-round action can be chosen just below \(c_2\).

**Singleton terminal block.**  
For \(0^N,c\), \(D_{N+1}=0\). One formal quote \(c^-\) serves the only nontrivial horizon.

**Alternating path stress test.**  
For
\[
P_{2k-1}=1/2,\qquad P_{2k}=1,
\]
the formal policy posting \(1^-\) at every time gives \(D_n(P)=0\) for every \(n\). This matches the iteration-12 claim that the exact LP fixes the false positive from the suffix-menu sum.

**Abstract non-market obstruction to naive gluing.**  
Let \(N_k\) grow so \(N_{k-1}/N_k\to0\), and define an abstract compact decision \(x\in\{0,1\}\) with losses
\[
f_{N_k}(x)=N_k\,1\{x\ne k\bmod 2\},\qquad f_T(x)=0\text{ otherwise}.
\]
For \(N_k\le n<N_{k+1}\), choosing \(x=k\bmod2\) gives finite-prefix value at most \(N_{k-1}=o(n)\). So the analogue of \(D_n=o(n)\) holds. But no fixed \(x\) has \(f_T(x)=o(T)\), since it fails every other special horizon. This is not a market-making counterexample, but it blocks any proof that uses only scalar normalized finite-prefix values.

## Gaps And Failure Points

The missing step is a market-specific gluing theorem. The abstract obstruction above alternates requirements for the same coordinate; actual market paths impose monotone suffix maxima \(M_{t,T}\) for each quote time \(t\). That monotonicity might rule out the obstruction, but I do not have a proof.

The bound \(D_n=o(n)\) allows finite-prefix optimizers to sacrifice horizons much smaller than \(n\). A global anytime policy cannot retroactively change those sacrificed actions, so a successful proof must show those sacrifices can be made consistently or are asymptotically harmless.

## Counterexamples Or Obstructions

The old counterexamples remain decisive: sparse vanishing spikes refute raw \(\beta\)-necessity, oracle fixed-horizon policies collapse instance-wise pseudo-regret, and stochastic mixtures of hard continuations are not hard under \(\sup_a\mathbb E-\mathbb E\) regret.

The new obstruction is abstract rather than market-specific: scalar \(D_n=o(n)\) does not imply projective consistency in general compact feasibility problems.

## Literature And Bibliography Candidates

- Christoph Dann, Yishay Mansour, Mehryar Mohri, Jon Schneider, Balasubramanian Sivan. “Rate-Preserving Reductions for Blackwell Approachability.” COLT 2025, PMLR 291:1380-1414. https://proceedings.mlr.press/v291/dann25a.html. Relevant for treating simultaneous-horizon deficits as approachability-style vector objectives; not a direct market-making theorem.

- Shie Mannor, Vianney Perchet, Gilles Stoltz. “Set-Valued Approachability and Online Learning with Partial Monitoring.” JMLR 15:3247-3295, 2014. https://jmlr.org/papers/v15/mannor14a.html. Relevant background for ambiguous/vector payoff feasibility; possibly useful for a projective-consistency formulation.

## Promising Ideas To Explore

Prove or refute: market monotonicity of \(M_{t,T}\) rules out the abstract parity obstruction, so \(D_n=o(n)\) may actually be sufficient in this model.

Compute \(D_n\) for superexponential spike paths and sparse predictable spike paths. If \(D_n=o(n)\) and explicit \(o(T)\) policies exist there, that supports the gluing conjecture.

Develop a stronger finite-prefix modulus with scale-sensitive constraints, e.g. requiring deficits \(o(T)\) for all \(T\in[\alpha n,n]\) uniformly over dyadic \(\alpha\), then test whether compactness plus monotone suffix maxima gives a fixed envelope.

## Notes For Critics

The finite-block \(D_n\) bounds above are left-limit statements. Actual strict-crossing policies need \((1-\eta_t)\)-shrinking with \(\sum_{t<T}\eta_t=o(T)\).

The abstract obstruction should not be recorded as a delayed-market-making counterexample. Its purpose is only to identify why the currently accepted compactness criterion cannot be weakened to \(D_n=o(n)\) without additional structure.