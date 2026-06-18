import DelayedMM.Common

open scoped BigOperators
open Finset

namespace DelayedMM

theorem elementary_upper_bound
    {τ T : ℕ} {c : ℝ} (hc : 0 ≤ c) (n : Fin (τ + 1) → ℝ)
    (hn : ∀ j, 0 ≤ n j) (hsum : ∑ j, n j = (T : ℝ)) :
    c * (∑ j, (n j) ^ (2 / 3 : ℝ)) ≤
      c * ((τ + 1 : ℝ) ^ (1 / 3 : ℝ)) * (T : ℝ) ^ (2 / 3 : ℝ) := by
  have hcore := sum_rpow_two_thirds_le (τ := τ) n hn
  have hmul := mul_le_mul_of_nonneg_left hcore hc
  simpa [hsum, mul_assoc] using hmul

theorem elementary_upper_bound_with_regrets
    {τ T : ℕ} {c : ℝ} (hc : 0 ≤ c) (n regret : Fin (τ + 1) → ℝ)
    (hn : ∀ j, 0 ≤ n j)
    (hbase : ∀ j, regret j ≤ c * (n j) ^ (2 / 3 : ℝ))
    (hsum : ∑ j, n j = (T : ℝ)) :
    ∑ j, regret j ≤ c * ((τ + 1 : ℝ) ^ (1 / 3 : ℝ)) * (T : ℝ) ^ (2 / 3 : ℝ) := by
  calc
    ∑ j, regret j ≤ ∑ j, c * (n j) ^ (2 / 3 : ℝ) := by
      exact sum_le_sum (fun j _ ↦ hbase j)
    _ = c * ∑ j, (n j) ^ (2 / 3 : ℝ) := by rw [mul_sum]
    _ ≤ c * ((τ + 1 : ℝ) ^ (1 / 3 : ℝ)) * (T : ℝ) ^ (2 / 3 : ℝ) := by
      exact elementary_upper_bound hc n hn hsum

end DelayedMM
