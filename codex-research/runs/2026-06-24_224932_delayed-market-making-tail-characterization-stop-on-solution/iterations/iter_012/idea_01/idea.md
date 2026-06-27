# Borel Policy Alignment

ID: idea_01

## Summary
Write an exact finite-grid public-exogenous admissible policy model and prove the forward alignment lemma: every common Borel private-randomized policy induces law-independent Borel public-prefix kernels q_t(P_{1:t}) preserving all expected reward coordinates L_theta. Include persistent internal state and delayed trade feedback explicitly.

## Why Promising
This is the main remaining gap between the accepted completed-L-infinity no-gap theorem and a theorem for the intended original policy class. It is local, finite-horizon, and should be checkable by induction plus Fubini.

## Risks
Could fail if the policy model permits law-by-law a.s. policy equivalence, private feedback not reconstructible from public prices, or internal state not representable by independent seeds. The result is only reward-vector equivalence, not pathwise equivalence.

## Suggested Lenses
- proof strategy
- measurability audit
