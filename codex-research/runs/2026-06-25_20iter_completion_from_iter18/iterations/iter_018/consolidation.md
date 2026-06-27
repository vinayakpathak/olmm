## Accepted Progress
Promoted the unequal-low one-drought reduction as `CL-049` / `LB-044`: in the formal left-limit model, the one-drought finite-prefix value equals the reduced LP over segment masses \(x_{i,c}\). This is a local theorem, not a gluing theorem.

Confirmed the regression case \(0,0.4,0.9,1\):
\[
D_4=68/225
\]
with primal masses \(x_{0,0.4}=11/45\), \(x_{0,0.9}=34/45\), \(x_{1,0.9}=4/5\).

## Candidate Routes
Derive a pooling/PAVA-like or nested-resource-allocation rule from the accepted unequal-low dual.

Build exact rational LP regression tests for unequal-low droughts, especially edge cases with \(M>1\), zero gaps, duplicate lows, and nonmonotone low sequences.

Study repeated droughts sharing resolving highs; the one-drought LP should not be assumed composable.

## Refuted Or Weakened Claims
The equal-low “last low only” rule is now refuted as a full finite-prefix rule for unequal lows.

The iteration-18 \(14/45\) value is recorded as a failed computation: it is feasible but not optimal.

No progress was made on the global \(D_n=o(n)\Rightarrow o(T)\) gluing problem or the original raw-tail characterization.

## Literature Updates
Added verified proof-technology references only, not theorem support for the market-making reduction:

[Vidal-Jaillet-Maculan 2016](https://doi.org/10.1137/140965119), [Vidal-Gribel-Jaillet 2019](https://doi.org/10.1287/ijoo.2018.0004), [de Leeuw-Hornik-Mair 2009](https://doi.org/10.18637/jss.v032.i05), [Ahuja-Orlin 2001](https://doi.org/10.1287/opre.49.5.784.10601), and [Wu-Nip-He 2021](https://doi.org/10.1287/ijoc.2020.1006).

## Working Notes Updated
Updated:
`canonical_summary.md`, `claim_ledger.md`, `lemma_bank.md`, `failed_attempts.md`, `counterexamples.md`, `literature_map.md`, `promising_directions.md`, `bibliography.md`, and `iteration_summaries.md`.

`git diff --check -- working_notes` passed. Note: `working_notes/` is untracked in this run directory.

## Next Iteration Focus
1. Derive or refute a pooling/nested-allocation rule for the accepted unequal-low LP.
2. Implement exact rational LP regression tests with primal/dual certificates.
3. Analyze repeated droughts to understand how high debt composes or fails to compose.