## Accepted Progress

Promoted two iteration 004 lower bounds to accepted notes:

- Universal/process-unaware block lower bound: for any learner, even horizon-aware family, there is a deterministic block sequence \(0^{N_i}c_i\) with \(\limsup R_T/T \ge 1/4\).
- Same-path horizon-oblivious obstruction: on one deterministic path \(0^{N_i},1/2,1\), any horizon-oblivious policy has linear regret along paired prefixes.

Both are prefix-incompatibility lower bounds, not instance-wise tail characterizations.

## Candidate Routes

- Write both accepted lower bounds as polished theorem-proof blocks.
- Define a useful prefix-incompatibility or value-of-information modulus.
- Continue adaptive truncation/skipping sufficiency using missing/outstanding-observation ideas.

## Refuted Or Weakened Claims

- Still invalid: “\(\beta\not\to0\) implies instance-wise hardness.”
- Still invalid: reading the block lower bounds as a necessity theorem for process-aware learners.
- Horizon-aware oracle policies still collapse pseudo-regret; sparse vanishing spikes still refute raw \(\beta\)-necessity.

## Literature Updates

Verified/imported new sources, including:

- Graf–Mastrolia 2026, arXiv: https://arxiv.org/abs/2601.17247
- Schlisselberg–Lancewicki–Auer–Mansour, NeurIPS 2025: https://proceedings.neurips.cc/paper_files/paper/2025/hash/02f0ac0a323dc17d964d4bbf8a62e01b-Abstract-Conference.html
- Masoudian–Zimmert–Seldin, NeurIPS 2024/OpenReview: https://openreview.net/forum?id=LDzrQB4X5w
- Luo–Schapire 2014: https://proceedings.mlr.press/v32/luo14.html
- Gofer–Mansour 2016: https://doi.org/10.1007/s10994-015-5531-y
- Guzman–Mehta–Mortazavi 2021: https://proceedings.neurips.cc/paper/2021/hash/b7da6669894867f04b8727876a69ffc0-Abstract.html
- Mannor–Tsitsiklis–Yu 2009: https://jmlr.org/beta/papers/v10/mannor09a.html

Marked these as adjacent/background unless directly supporting delayed-feedback terminology.

## Working Notes Updated

Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

## Next Iteration Focus

1. Write the two accepted lower bounds formally with exact quantifiers.
2. Keep the clean sufficiency theorem moving toward final form.
3. Test any proposed information/prefix-incompatibility modulus against CE-001, CE-003, CE-005, and the block obstructions.