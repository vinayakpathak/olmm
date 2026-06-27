# Verify Post-Low Drought Formula

ID: idea_01

## Summary
Audit the solver's claimed formula for the two-level prefix h^M,0^N,l,0^L,h: D_n = [l(M+N)-h(M-1)_+ ]_+ (1-l/h). Check M=0, M=1, N=0, L=0, all post-low intermediate horizons, and the quote-at-low-time convention. If correct, promote it as the resolved post-low single-drought lemma.

## Why Promising
It resolves the iteration-15 target and gives the cleanest local regression test for any two-level debt recursion.

## Risks
A hidden intermediate-horizon constraint or endpoint convention could force an extra term; strict-crossing implementation may need a separate eta-loss lemma.

## Suggested Lenses
- primal-dual verification
- edge-case audit
