**Accepted Progress**
- The essential-sup tail condition $\beta(h)\to0$ is accepted as a sufficient condition under exogenous/oblivious prices, via truncation, grid discretization, and delayed full-information experts.
- A sharper sufficient theorem uses comparator-gap truncation loss $\delta_T(H)$, with $\Delta_T(H)$ as a coarser usable bound.
- The hidden-terminal two-world construction gives a valid finite-horizon minimax lower bound over an unknown class: regret $\Omega(D)$ at horizon $T=D+1$.

**Candidate Routes**
- Formalize the upper theorem with $\delta_T(H)$, $\sup_a$, horizon-indexed classes, and a cited/proved delayed-experts lemma.
- Formalize the hidden-terminal lower bound and a possible $q$-scaled variant.
- Search for the right necessary condition: valuable delayed tail mass plus indistinguishability, not raw hitting delay.

**Refuted Or Weakened Claims**
- The original “$\beta(h)\to0$ iff sublinear regret” conjecture is refuted under law-aware fixed-process quantifiers by iid uniform prices.
- $\Delta_T(H)=o(T)$ is not necessary: the known terminal-spike singleton has zero regret but linear truncation loss.
- Naive iid block-splicing does not yield a fixed-process asymptotic lower bound because the comparator is fixed in expectation.
- The delayed-experts upper reduction is not valid without an exogenous/oblivious price assumption.

**Working Notes Updated**
Updated:
[canonical_summary.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/canonical_summary.md),
[claim_ledger.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/claim_ledger.md),
[lemma_bank.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/lemma_bank.md),
[failed_attempts.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/failed_attempts.md),
[counterexamples.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/counterexamples.md),
[literature_map.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/literature_map.md),
[promising_directions.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/promising_directions.md),
and [bibliography.md](/Users/vinayakpathak/olmm/codex-research/runs/2026-06-24_224932_delayed-market-making-tail-characterization-stop-on-solution/working_notes/bibliography.md).

**Next Iteration Focus**
1. Lock the model quantifiers: exogenous vs action-dependent, law-aware vs minimax, fixed law vs horizon-dependent class.
2. Write the clean $\delta_T(H)$ upper theorem.
3. Prove the hidden-terminal lower bound in final theorem style.
4. Verify/cite the delayed full-information experts bound.
5. Formalize rare-history and tiny-price counterexamples to raw $\beta$.