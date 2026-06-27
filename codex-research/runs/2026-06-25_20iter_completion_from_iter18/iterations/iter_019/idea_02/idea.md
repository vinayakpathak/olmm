# Two-Low Pooling Rule

ID: idea_02

## Summary
Treat the two-low formula as a candidate local merge operator for adjacent low levels. Test whether arbitrary unequal-low one-drought LPs can be solved by recursively pooling adjacent lows or segments, PAVA-style. Use the recorded three-low regression case 0,0.2,0^8,0.3,0,0.4,1 as a first stress test.

## Why Promising
If a local merge rule exists, it could convert CL-049 from an LP theorem into a closed-form or near-closed-form algorithm.

## Risks
The binary operation may be nonassociative; three-low examples may require a genuinely global LP rather than adjacent pooling.

## Suggested Lenses
- proof strategy
- counterexample search
- finite LP regression
