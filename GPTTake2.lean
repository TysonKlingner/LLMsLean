import mathlib

import Mathlib.Algebra.Ring.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.NormNum

theorem not_domain : ¬ (IsDomain (ZMod 6)) := by
  intro h
  -- In an integral domain, we can't have nonzero zero-divisors
  have noZD := @NoZeroDivisors.eq_zero_or_eq_zero_of_mul_eq_zero (ZMod 6) _ h.toNoZeroDivisors
  -- But in ZMod 6 we do: 2 * 3 = 0
  have mul_zero : (2 : ZMod 6) * (3 : ZMod 6) = 0 := by norm_num
  have contradiction := noZD _ _ mul_zero
  cases contradiction with
  | inl h2 =>
      have : (2 : ZMod 6) ≠ 0 := by norm_num
      contradiction
  | inr h3 =>
      have : (3 : ZMod 6) ≠ 0 := by norm_num
      contradiction
