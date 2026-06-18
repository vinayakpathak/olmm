import Mathlib

open scoped BigOperators
open Finset

namespace DelayedMM

theorem sqrt_add_le_sqrt_add_sqrt {a b : ℝ} (ha : 0 ≤ a) (hb : 0 ≤ b) :
    Real.sqrt (a + b) ≤ Real.sqrt a + Real.sqrt b := by
  rw [Real.sqrt_le_iff]
  constructor
  · positivity
  · calc
      a + b = Real.sqrt a ^ 2 + Real.sqrt b ^ 2 := by
        rw [Real.sq_sqrt ha, Real.sq_sqrt hb]
      _ ≤ Real.sqrt a ^ 2 + (2 * (Real.sqrt a * Real.sqrt b) + Real.sqrt b ^ 2) := by
        nlinarith [Real.sqrt_nonneg a, Real.sqrt_nonneg b]
      _ = (Real.sqrt a + Real.sqrt b) ^ 2 := by ring

/-- A Hölder/mean-inequality step specialized to the exponent `2/3` on `Fin (τ+1)`. -/
theorem sum_rpow_two_thirds_le {τ : ℕ} (n : Fin (τ + 1) → ℝ) (hn : ∀ i, 0 ≤ n i) :
    ∑ i, (n i) ^ (2 / 3 : ℝ) ≤ ((τ + 1 : ℝ) ^ (1 / 3 : ℝ)) * (∑ i, n i) ^ (2 / 3 : ℝ) := by
  have hsum_nonneg : 0 ≤ ∑ i, (n i) ^ (2 / 3 : ℝ) := by
    exact sum_nonneg (fun i _ ↦ Real.rpow_nonneg (hn i) _)
  have htotal_nonneg : 0 ≤ ∑ i, n i := by
    exact sum_nonneg (fun i _ ↦ hn i)
  have hmean :
      (∑ i, (n i) ^ (2 / 3 : ℝ)) ^ (3 / 2 : ℝ) ≤
        ((τ + 1 : ℝ) ^ (1 / 2 : ℝ)) * ∑ i, n i := by
    have hraw :=
      Real.rpow_sum_le_const_mul_sum_rpow_of_nonneg
        (s := (univ : Finset (Fin (τ + 1))))
        (f := fun i : Fin (τ + 1) ↦ (n i) ^ (2 / 3 : ℝ))
        (p := (3 / 2 : ℝ))
        (by norm_num : 1 ≤ (3 / 2 : ℝ))
        (by
          intro i hi
          exact Real.rpow_nonneg (hn i) _)
    have hpow_term : ∀ i : Fin (τ + 1), ((n i) ^ (2 / 3 : ℝ)) ^ (3 / 2 : ℝ) = n i := by
      intro i
      rw [← Real.rpow_mul (hn i)]
      norm_num
    have hraw' := hraw
    norm_num at hraw'
    simpa [hpow_term, Finset.card_univ, Fintype.card_fin] using hraw'
  have htarget_nonneg :
      0 ≤ ((τ + 1 : ℝ) ^ (1 / 3 : ℝ)) * (∑ i, n i) ^ (2 / 3 : ℝ) := by
    positivity
  apply (Real.rpow_le_rpow_iff hsum_nonneg htarget_nonneg (by norm_num : 0 < (3 / 2 : ℝ))).mp
  calc
    (∑ i, (n i) ^ (2 / 3 : ℝ)) ^ (3 / 2 : ℝ)
        ≤ ((τ + 1 : ℝ) ^ (1 / 2 : ℝ)) * ∑ i, n i := hmean
    _ = ((((τ + 1 : ℝ) ^ (1 / 3 : ℝ)) * (∑ i, n i) ^ (2 / 3 : ℝ)) ^ (3 / 2 : ℝ)) := by
      have hτ_nonneg : 0 ≤ (τ + 1 : ℝ) := by positivity
      rw [Real.mul_rpow]
      · rw [← Real.rpow_mul hτ_nonneg, ← Real.rpow_mul htotal_nonneg]
        norm_num
      · exact Real.rpow_nonneg hτ_nonneg _
      · exact Real.rpow_nonneg htotal_nonneg _

end DelayedMM
