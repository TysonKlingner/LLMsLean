import mathlib

/-!
Show that ZMod 6 has zero divisors (2 * 3 = 0 while 2 ≠ 0 and 3 ≠ 0).
This implies ZMod 6 is not an integral domain.
-/

open ZMod

theorem zmod6_has_zero_divisors : ∃ a b : ZMod 6, a ≠ 0 ∧ b ≠ 0 ∧ a * b = 0 := by
  -- take a = 2, b = 3
  use (2 : ZMod 6), (3 : ZMod 6)
  -- prove 2 ≠ 0
  norm_num
  -- prove 3 ≠ 0
  norm_num
  -- prove 2 * 3 = 0
  norm_num

/-
Because there exist nonzero a,b with a * b = 0, ZMod 6 has zero divisors and therefore
cannot be an integral domain.
-/
