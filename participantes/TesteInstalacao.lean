import Mathlib

#eval 2 + 2

example (P : Prop) : P → P := by
  intro h
  exact h

theorem semat_instalacao_ok : 2 + 2 = 4 := by
  rfl

#print axioms semat_instalacao_ok
