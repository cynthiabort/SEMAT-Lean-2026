import Mathlib

/-!
SEMAT • MATHLIB NA PRÁTICA — BLOCO OPCIONAL (10–12 MINUTOS)
Lean 4.30.0 · Mathlib v4.30.0

Para continuar a prática após a aula ou para duplas que terminarem cedo.
A atividade principal está em Aula.lean; este bloco é complementar.
Este arquivo exige a Mathlib do projeto da oficina. Não depende de LLMs.

Antes de usar uma tática, explique no papel por que a conclusão é válida.
As três lacunas são intencionais: substitua cada `sorry` por uma prova.
-/
namespace SEMATMathlib

/-! M1 • Frações exatas (2 min)
Mostre a igualdade sem aproximar os números por decimais.
Dica 1: o tipo ℝ faz estes numerais serem números reais.
Dica 2: `norm_num` é uma tática da Mathlib para cálculos numéricos exatos.
-/
theorem m1_fracoes : (3 : ℝ) / 4 + 1 / 6 = 11 / 12 := by
  sorry

/-! M2 • Combinar desigualdades (3 min)
No papel, multiplique a primeira hipótese por 3 e a segunda por 2.
Dica 1: os coeficientes positivos preservam o sentido das desigualdades.
Dica 2: `linarith` combina igualdades e desigualdades lineares conhecidas.
Depois, explique de onde vem o número 7.
-/
theorem m2_cota (x y : ℝ) (hx : 1 ≤ x) (hy : 2 ≤ y) :
    7 ≤ 3 * x + 2 * y := by
  sorry

/-! M3 • Reutilizar um resultado da biblioteca (5–7 min)
Primeiro encontre a desigualdade que relaciona |x + y| a |x| + |y|.
Dica 1: use a desigualdade triangular; leia o tipo do lema abaixo.
Dica 2: introduza uma prova intermediária com `have`, dando a ela um nome.
Dica 3: só depois combine a desigualdade intermediária com hx e hy.
O objetivo é escolher e aplicar um lema, não pedir que uma busca resolva tudo.
-/
#check abs_add_le

theorem m3_soma_limitada (x y : ℝ) (hx : |x| ≤ 2) (hy : |y| ≤ 3) :
    |x + y| ≤ 5 := by
  sorry

end SEMATMathlib
