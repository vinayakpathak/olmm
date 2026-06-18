import Mathlib

open Filter Asymptotics

namespace DelayedMM

noncomputable def baseLog (t : ℕ) : ℝ :=
  Real.log ((t : ℝ) + 2)

noncomputable def baselineRate (t : ℕ) : ℝ :=
  ((t : ℝ) + 1) ^ (2 / 3 : ℝ) * baseLog t ^ (1 / 3 : ℝ)

noncomputable def delayRate (τ : ℕ → ℝ) (t : ℕ) : ℝ :=
  Real.sqrt (τ t * ((t : ℝ) + 1) * baseLog t)

noncomputable def targetRate (τ : ℕ → ℝ) (t : ℕ) : ℝ :=
  baselineRate t + delayRate τ t

theorem baseLog_pos (t : ℕ) : 0 < baseLog t := by
  unfold baseLog
  apply Real.log_pos
  nlinarith

theorem baseLog_nonneg (t : ℕ) : 0 ≤ baseLog t := (baseLog_pos t).le

theorem baselineRate_nonneg (t : ℕ) : 0 ≤ baselineRate t := by
  unfold baselineRate
  exact mul_nonneg
    (Real.rpow_nonneg (by positivity : 0 ≤ (t : ℝ) + 1) _)
    (Real.rpow_nonneg (baseLog_nonneg t) _)

theorem delayRate_nonneg (τ : ℕ → ℝ) (hτ : ∀ t, 0 ≤ τ t) (t : ℕ) : 0 ≤ delayRate τ t := by
  unfold delayRate
  have hinside : 0 ≤ τ t * ((t : ℝ) + 1) * baseLog t := by
    exact mul_nonneg (mul_nonneg (hτ t) (by positivity)) (baseLog_nonneg t)
  exact Real.sqrt_nonneg _

theorem targetRate_nonneg (τ : ℕ → ℝ) (hτ : ∀ t, 0 ≤ τ t) (t : ℕ) : 0 ≤ targetRate τ t := by
  unfold targetRate
  exact add_nonneg (baselineRate_nonneg t) (delayRate_nonneg τ hτ t)

/-- Abstract delayed-bandit envelope used by the sharper reduction. -/
def DelayedBanditEnvelope (B : ℝ → ℝ → ℝ → ℝ) : Prop :=
  ∀ {K T D : ℝ}, 2 ≤ K → 0 ≤ D →
    B K T D ≤ Real.sqrt (Real.log K * (K * T + D))

/-- A pointwise reduction theorem for the sharper delayed upper bound.

This theorem packages the proof structure from the note:
1. reduce the market-making regret to a discretization term plus a delayed-bandit term,
2. apply a delayed-bandit envelope to the bandit term,
3. use separate analytic bounds on the discretization term and the square-root kernel.

The exact calculus estimates for the chosen `K` are kept as explicit hypotheses. -/
theorem sharper_upper_bound_pointwise
    (τ regret D : ℕ → ℝ) (kChoice : ℕ → ℝ) (B : ℝ → ℝ → ℝ → ℝ)
    (A C M L : ℝ)
    (hτ : ∀ t, 0 ≤ τ t)
    (hk : ∀ t, 2 ≤ kChoice t)
    (hD : ∀ t, 0 ≤ D t)
    (hReduction :
      ∀ t : ℕ, regret t ≤ L * ((t : ℝ) / kChoice t) + C * B (kChoice t) (t : ℝ) (D t))
    (hBandit : DelayedBanditEnvelope B)
    (hDisc :
      ∀ t : ℕ, L * ((t : ℝ) / kChoice t) ≤ A * baselineRate t)
    (hKernel :
      ∀ t : ℕ, Real.sqrt (Real.log (kChoice t) * (kChoice t * (t : ℝ) + D t)) ≤
        M * targetRate τ t)
    (hA : 0 ≤ A)
    (hC : 0 ≤ C)
    (hM : 0 ≤ M) :
    ∀ t, regret t ≤ (A + C * M) * targetRate τ t := by
  intro t
  have hbandit_term :
      B (kChoice t) (t : ℝ) (D t) ≤
        Real.sqrt (Real.log (kChoice t) * (kChoice t * (t : ℝ) + D t)) := by
    exact hBandit (hk t) (hD t)
  have hstep1 :
      regret t ≤ A * baselineRate t + C * Real.sqrt
        (Real.log (kChoice t) * (kChoice t * (t : ℝ) + D t)) := by
    calc
      regret t
          ≤ L * ((t : ℝ) / kChoice t) + C * B (kChoice t) (t : ℝ) (D t) := hReduction t
      _ ≤ A * baselineRate t + C * B (kChoice t) (t : ℝ) (D t) := by
        nlinarith [hDisc t]
      _ ≤ A * baselineRate t + C * Real.sqrt
            (Real.log (kChoice t) * (kChoice t * (t : ℝ) + D t)) := by
        nlinarith [mul_le_mul_of_nonneg_left hbandit_term hC]
  have htarget_nonneg : 0 ≤ targetRate τ t := targetRate_nonneg τ hτ t
  have hbase_nonneg : 0 ≤ baselineRate t := baselineRate_nonneg t
  have hstep2 :
      A * baselineRate t + C * Real.sqrt
        (Real.log (kChoice t) * (kChoice t * (t : ℝ) + D t))
        ≤ A * baselineRate t + C * (M * targetRate τ t) := by
    nlinarith [mul_le_mul_of_nonneg_left (hKernel t) hC]
  have hstep3 :
      A * baselineRate t + C * (M * targetRate τ t) ≤
        (A + C * M) * targetRate τ t := by
    unfold targetRate
    have hdelay_nonneg : 0 ≤ delayRate τ t := delayRate_nonneg τ hτ t
    have hCM_nonneg : 0 ≤ C * M := mul_nonneg hC hM
    nlinarith
  exact hstep1.trans <| hstep2.trans hstep3

theorem sharper_upper_bound_bigO
    (τ regret D : ℕ → ℝ) (kChoice : ℕ → ℝ) (B : ℝ → ℝ → ℝ → ℝ)
    (A C M L : ℝ)
    (hτ : ∀ t, 0 ≤ τ t)
    (hregret : ∀ t, 0 ≤ regret t)
    (hk : ∀ t, 2 ≤ kChoice t)
    (hD : ∀ t, 0 ≤ D t)
    (hReduction :
      ∀ t : ℕ, regret t ≤ L * ((t : ℝ) / kChoice t) + C * B (kChoice t) (t : ℝ) (D t))
    (hBandit : DelayedBanditEnvelope B)
    (hDisc :
      ∀ t : ℕ, L * ((t : ℝ) / kChoice t) ≤ A * baselineRate t)
    (hKernel :
      ∀ t : ℕ, Real.sqrt (Real.log (kChoice t) * (kChoice t * (t : ℝ) + D t)) ≤
        M * targetRate τ t)
    (hA : 0 ≤ A)
    (hC : 0 ≤ C)
    (hM : 0 ≤ M) :
    regret =O[Filter.atTop] targetRate τ := by
  refine Asymptotics.IsBigO.of_bound (A + C * M) ?_
  filter_upwards with t
  have hpoint :=
    sharper_upper_bound_pointwise τ regret D kChoice B A C M L
      hτ hk hD hReduction hBandit hDisc hKernel hA hC hM t
  have hregret_nonneg : 0 ≤ regret t := hregret t
  have htarget_nonneg : 0 ≤ targetRate τ t := targetRate_nonneg τ hτ t
  simpa [Real.norm_eq_abs, abs_of_nonneg hregret_nonneg, abs_of_nonneg htarget_nonneg] using hpoint

end DelayedMM
