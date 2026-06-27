# Market Parity Obstruction

ID: idea_02

## Summary
Attempt a deterministic market path with D_n=o(n) but no fixed sublinear envelope, mimicking the solver's abstract parity obstruction. Use rapidly growing blocks whose finite-prefix optimizer alternates between incompatible quote distributions, then compute D_n and the fixed-envelope LP explicitly.

## Why Promising
A successful example would settle that D_n=o(n) is not sufficient; a failed, well-analyzed attempt would reveal what extra monotone structure a gluing proof can exploit.

## Risks
Market monotonicity may prevent the parity pattern entirely, or any attempted construction may make D_n linear and therefore fail to separate the criteria.

## Suggested Lenses
- counterexample search
- LP computation
- block construction
