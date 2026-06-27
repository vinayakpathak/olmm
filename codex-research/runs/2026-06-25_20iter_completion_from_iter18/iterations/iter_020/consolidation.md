## Accepted Progress

Promoted the strictly increasing-low one-drought theorem as `CL-051` / `LB-047`. The exact formal left-limit value is now recorded with the zero-pressure dual certificate and the nested Hall scheduling proof.

## Candidate Routes

Use `LB-047` as the solved base case. Next useful work is nonmonotone lows, duplicate lows, positive-pressure active sets, repeated droughts, and exact rational LP regression with primal/dual certificates.

## Refuted Or Weakened Claims

Recorded that the \(p<q\) two-low “third branch” is not path-feasible for actual market paths; it is only an artificial reduced-LP stress test. Added this as `FA-035` and `CE-027`.

Also kept the flow/Hall certificate as a local tool, not a general pooling theorem.

## Literature Updates

Imported verified flow references:
- [Gale 1957](https://projecteuclid.org/journals/pacific-journal-of-mathematics/volume-7/issue-2/A-theorem-on-flows-in-networks/pjm/1103043501.full)
- [Fulkerson 1959](https://doi.org/10.4153/CJM-1959-045-1)
- [Gallo-Grigoriadis-Tarjan 1989](https://doi.org/10.1137/0218003)
- [Picard-Queyranne 1982](https://doi.org/10.1007/BF01581031)

Gale/Fulkerson are directly relevant to Hall/flow feasibility; the latter two are proof-technology background only.

## Working Notes Updated

Updated `canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and appended a recovered iteration 20 entry to `iteration_summaries.md`.

Verification: `git diff --check -- working_notes` passed.

## Next Iteration Focus

1. Write `CL-051/LB-047` as a polished theorem-proof block.
2. Test nonmonotone and duplicate lows with exact rational certificates.
3. Develop the first positive-pressure residual rule or a repeated-drought high-debt ledger.