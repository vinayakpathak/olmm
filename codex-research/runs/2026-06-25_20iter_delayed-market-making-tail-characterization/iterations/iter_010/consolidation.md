## Accepted Progress

Promoted iteration 10’s deterministic derandomization of the known-path \(1/e\) upper bound. The accepted statement is narrow: there exists a nonconstructive deterministic horizon-oblivious quote sequence with
\[
R_T \le (T-1)/e + O(T^{2/3}\sqrt{\log T})
\]
on every deterministic exogenous path. Together with the existing lower bound, the sharp deterministic-policy worst-case limsup constant is also \(1/e\).

## Candidate Routes

Next useful work is to polish CL-031/LB-026/LB-027 into a standalone theorem-proof block, then decide whether to pursue an explicit low-discrepancy or cycling construction. The sharper \(O(n^{2/3})\) bracketing route remains optional until written carefully.

## Refuted Or Weakened Claims

Recorded that this does not solve the original iff or any raw-tail necessity problem. Also recorded that a naive VC proof is unsafe for the monotone time-varying threshold class.

## Literature Updates

Added verified proof-technology references: Hoeffding 1963, Alon-Spencer 2016, van der Vaart-Wellner 1996, Gao-Wellner 2007, Niederreiter 1992, and Vapnik-Chervonenkis 1971. Key links include:
https://doi.org/10.1080/01621459.1963.10500830, https://doi.org/10.1007/978-1-4757-2545-2, https://doi.org/10.1016/j.jmva.2006.09.003, https://doi.org/10.1137/1.9781611970081, https://doi.org/10.1137/1116025.

## Working Notes Updated

Updated all requested files under `working_notes/`: canonical summary, claim ledger, lemma bank, failed attempts, counterexamples, literature map, promising directions, bibliography, and iteration summaries.

## Next Iteration Focus

1. Polish the deterministic derandomization theorem.
2. Decide whether explicit construction matters.
3. Continue the suffix-menu/path-dependent characterization without conflating it with raw delay-tail necessity.