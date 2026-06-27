## Accepted Progress
Promoted the post-low single-drought identity:
\[
D_{M+N+L+2}(h^M,0^N,\ell,0^L,h)
=
[\ell(M+N)-h(M-1)_+]_+(1-\ell/h).
\]
The post-low zero tail adds no local finite-prefix conflict; it only dilutes normalized \(D_n/n\).

## Candidate Routes
Kept the equal-low multi-low drought formula as candidate only. It has a clean reduced LP and dual certificate, but still needs the full reduction from \(D_n\) to \(\ell^-/h^-\) marginals and a proof that earlier low horizons are dominated.

## Refuted Or Weakened Claims
Recorded that “long post-low wait creates extra local conflict” is false for one low. Stable-high regret and raw waiting time remain invalid localization certificates.

## Literature Updates
Verified and added adjacent-only sources:
- [Heliou, Mertikopoulos, Zhou 2020](https://proceedings.mlr.press/v119/heliou20a.html)
- [Cao, Siska, Szpruch, Treetanthiploet 2024/2026](https://arxiv.org/abs/2409.02025)
- [Albers, Cucuringu, Howison, Shestopaloff 2025](https://arxiv.org/abs/2502.18625)

No external theorem was found for the new drought identities.

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

`git diff --check -- working_notes` reported no whitespace errors.

## Next Iteration Focus
1. Prove the equal-low multi-low drought formula rigorously.
2. Test unequal-low droughts, where early lows may genuinely bind.
3. Run exact finite-prefix LP experiments for repeated diluted droughts and compare against surplus/debt recursions.