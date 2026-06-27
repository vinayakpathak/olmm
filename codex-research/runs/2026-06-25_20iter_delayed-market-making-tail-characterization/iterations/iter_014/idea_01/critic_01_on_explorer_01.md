## Summary

The explorer’s main negative claim is sound: the proposed route “large boundary defect implies a local prefix certificate \(D_m=\Omega(m)\)” is false as stated. The separated block
\[
0^N,\ c_0,\ 0^L,\ c_1,\qquad 0<c_0<c_1\le1
\]
with split \(m=N+1\) gives a clean counterexample: the boundary defect on the first \(N\) quote coordinates is \(\Theta(N)\), while the prefix ending at \(m\) has \(D_m=0\) in the formal left-limit model.

The critique does not kill all localization/gluing approaches. It only kills charging the cross-scale support-function defect directly to the real finite-prefix value \(D_m\).

## Issue List

- **Fatal gap in idea_01:** Boundary defect need not imply a real prefix conflict. Late horizons can introduce “shadow thresholds” invisible inside the prefix. The explorer’s separated-block example refutes the target inequality.

- **Missing assumption:** The statement \(D_m=0\) uses the formal left-limit model. In the original strict-crossing action space it should be phrased as an infimum: quoting \(c_0-\eta\) gives prefix loss \(O(N\eta)\), so the refutation survives but needs this convention.

- **Plausible but incomplete:** “Boundary defect is a local two-objective incompatibility” is right as support-function geometry:
  \[
  f_t(u)+f_t(v)-f_t(u+v)
  \]
  is the additivity defect of a support function. But this is not yet a regret or \(D_m\) certificate unless the shadow objectives correspond to actual horizons inside the prefix.

- **Missing precision:** \(\Phi(u)=\Phi(v)=0\) is true for the full-path functional with single-horizon weights. If a recursive proof uses suffix-restricted or renormalized subproblems, the definitions must be restated.

- **Worth pursuing:** The exact identity
  \[
  \Phi(u+v)=\Phi(u)+\Phi(v)+B(u,v)
  \]
  is useful. It says the boundary term is real dual mass, not a proof artifact.

## Counterexamples Or Stress Tests

For \(T_0=N+1\), \(T_1=N+L+2\), choose
\[
u=\lambda_0 e_{T_0},\qquad v=\lambda_1 e_{T_1},
\quad
\lambda_0=\frac{c_1-c_0}{c_1},\quad
\lambda_1=\frac{c_0}{c_1}.
\]
For each \(t\le N\),
\[
f_t(u)=\lambda_0c_0,\qquad f_t(v)=\lambda_1c_1=c_0,
\]
while
\[
f_t(u+v)=\sup_a a\left(\lambda_0 1\{a<c_0\}+\lambda_1 1\{a<c_1\}\right)=c_0.
\]
Thus
\[
B(u,v)=N\frac{c_0(c_1-c_0)}{c_1}.
\]
But the prefix \(0^N,c_0\) is a singleton-threshold prefix, so \(D_m=0\) as a left-limit infimum. Also the one-horizon dual certificates satisfy \(\Phi(u)=\Phi(v)=0\). Taking \(c_0=1/2,c_1=1\) gives \(B=N/4\).

## Literature Or Known-Result Conflicts

No direct known-result conflict found. The situation matches the existing uniform-value/gluing caution: finite-horizon or local certificates do not automatically yield one uniform strategy without additional stability structure. Renault’s “Uniform value in dynamic programming” is relevant background, not a direct theorem for this model: https://ems.press/content/serial-article-files/31763.

The finite-alphabet/interval route remains plausible background. Fulkerson and Gross on consecutive-ones interval matrices may be useful for the next laminar-dual checks, but it does not rescue the boundary-defect claim: https://msp.org/pjm/1965/15-3/pjm-v15-n3-p11-s.pdf.

## What Survives The Critique

The explorer’s negative conclusion survives.

The useful surviving object is a **boundary-augmented prefix certificate**: an LP that includes late shadow objectives. In that augmented problem, \(B(u,v)\) should be interpretable as a real local incompatibility value. The hard step is converting that augmented shadow certificate into actual \(D_n\) mass at comparable scales.

## Bibliography Candidates

- Delbert Ray Fulkerson and Oliver Gross. “Incidence matrices and interval graphs.” *Pacific Journal of Mathematics* 15(3):835-855, 1965. https://msp.org/pjm/1965/15-3/pjm-v15-n3-p11-s.pdf. Relevance: consecutive-ones/interval structure for finite-alphabet dual localization; background only.

- Jérôme Renault. “Uniform value in dynamic programming.” *Journal of the European Mathematical Society* 13:309-330, 2011. DOI 10.4171/JEMS/254. https://ems.press/content/serial-article-files/31763. Relevance: gluing/uniform-strategy background; already essentially in the run bibliography.

## Recommended Next Checks

1. Record the separated-block refutation as a formal lemma with left-limit caveats.
2. Define the boundary-augmented local LP and prove exactly what value \(B(u,v)\) represents.
3. Test whether repeated large boundary defects force large \(D_n\) at some comparable scale; the one-shot \(D_m\) implication is false.
4. Move to the finite-alphabet/last-exceedance formulation and try the two-level case first.