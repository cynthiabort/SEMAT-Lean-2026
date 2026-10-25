import Init

/-!
SEMAT • 26/10/2026 • PROJETO OPCIONAL: INVOLUÇÕES
Formalização e o futuro da matemática: uma introdução ao Lean

A prática principal da oficina está nos exercícios de rw e calc de Aula.lean.
Este projeto fica como atividade extra, para retomar com mais tempo.
Consulte Dicas.md para as ferramentas adicionais. Use o Infoview para acompanhar
as metas. Este arquivo importa somente Init e não precisa de Mathlib nem de LLMs.

Trabalhe em dupla, alternando quem escreve e quem explica. Antes de cada
bloco, escreva uma ideia em português. Troque cada sorry por uma prova.
Os oito avisos iniciais de sorry são esperados; não são provas concluídas.
Mantenha as definições e os enunciados. Consulte Dicas.md aos poucos.
As soluções completas ficam em arquivo separado com a docente.

Ferramentas usadas neste projeto: intro, exact, rfl, rw, have, constructor,
refine ⟨testemunha, ?_⟩ e aplicação de lemas. Não é necessária automação extra.
-/

namespace SEMATPratica

/-! A1 • 5 minutos • Igualdade e aplicação de uma função
Se a = b, por que g a = g b? Consulte o bloco 9 de Aula.lean.
Minha ideia:
-/
theorem aquecimento_imagens (g : Nat → Nat) (a b : Nat)
    (h : a = b) : g a = g b := by
  sorry

/-! A2 • 5 minutos • Duas provas
Quais são as duas metas que precisamos cumprir? Consulte a dica A2 em Dicas.md.
Minha ideia:
-/
theorem aquecimento_conjuncao (P Q : Prop) (hp : P) (hq : Q) : P ∧ Q := by
  sorry

/-! A3 • 5 minutos • Escolher uma testemunha
O que podemos escolher para m? Depois, qual igualdade deve ser verificada?
Use refine ⟨testemunha, ?_⟩ para escolher m e abrir a igualdade restante.
Minha ideia:
-/
theorem aquecimento_testemunha (n : Nat) : ∃ m : Nat, m = 3 * n := by
  sorry

/-!
PROJETO • Toda involução é bijetiva

Uma involução é uma função que, aplicada duas vezes, devolve o elemento
inicial. Trocar as coordenadas de um par é um exemplo visto na aula.
Aqui α é um tipo qualquer, e f leva elementos de α a elementos de α.

Começo: compreender a hipótese f (f x) = x e construir dois pequenos lemas.
Meio: mostrar que imagens iguais têm origens iguais (injetividade) e
escolher uma origem para cada elemento de chegada (sobrejetividade).
Fim: reunir as duas provas e explicar onde usamos a hipótese.

As três definições abaixo já estão prontas. São versões locais explícitas
para a oficina; não exigem conhecer os nomes de definições de bibliotecas.
-/

def Involutiva {α : Type} (f : α → α) : Prop :=
  ∀ x, f (f x) = x

def Injetiva {α : Type} (f : α → α) : Prop :=
  ∀ x y, f x = f y → x = y

def Sobrejetiva {α : Type} (f : α → α) : Prop :=
  ∀ y, ∃ x, f x = y

/-! E1 • 5 minutos • Usar a hipótese no elemento escolhido
Leia hf como uma prova de uma afirmação para todo elemento.
Como usar essa prova no elemento x? Compare com cota_em_cinco na aula.
Minha ideia:
-/
theorem desfazer {α : Type} (f : α → α) (hf : Involutiva f)
    (x : α) : f (f x) = x := by
  sorry

/-! E2 • 5 minutos • Transportar uma igualdade
Aplique a ideia de A1 às expressões f x e f y. Observe os parênteses.
Minha ideia:
-/
theorem transportar {α : Type} (f : α → α) (x y : α)
    (hxy : f x = f y) : f (f x) = f (f y) := by
  sorry

/-! E3 • 15 minutos • Injetividade
Leia a definição de Injetiva antes de escrever.
Introduza dois elementos e a hipótese de que suas imagens são iguais.
Use E2 para guardar uma igualdade intermediária com have. Então use E1
para reescrever essa igualdade. Consulte as dicas de E3 em Dicas.md.
Explique ao colega onde a propriedade de involução é necessária.
Minha ideia:
-/
theorem involutiva_injetiva {α : Type} (f : α → α)
    (hf : Involutiva f) : Injetiva f := by
  sorry

/-! E4 • 15 minutos • Sobrejetividade
Para um elemento y da chegada, precisamos escolher um x com f x = y.
Qual expressão construída com f e y é uma boa candidata? Teste no papel.
Use refine para fornecer a testemunha e E1 para justificar que ela serve.
Minha escolha de testemunha e justificativa:
-/
theorem involutiva_sobrejetiva {α : Type} (f : α → α)
    (hf : Involutiva f) : Sobrejetiva f := by
  sorry

/-! E5 • 5 minutos • Reunir as conclusões
Aqui "bijetiva" significa injetiva e sobrejetiva.
Use as provas já construídas em E3 e E4; não precisa repeti-las.
Minha ideia:
-/
theorem involutiva_bijetiva {α : Type} (f : α → α)
    (hf : Involutiva f) : Injetiva f ∧ Sobrejetiva f := by
  sorry

/-! 15 minutos • Conferência e discussão
1. Explique a igualdade intermediária de E3 e a testemunha de E4.
2. Confirme que não restaram lacunas em NENHUM dos oito exercícios.
3. A linha abaixo não deve listar sorryAx depois de concluir o projeto.
Ela não confere A1–A3, que não são usados pelo teorema final: por isso
é necessário conferir os avisos do arquivo inteiro também.
4. O enunciado formal expressa a afirmação matemática que queríamos provar?

Se terminar cedo, discuta no papel: toda bijeção é uma involução?
Investigue a permutação cíclica de três elementos. Não há exercício extra
obrigatório nem nova ferramenta necessária para terminar esta oficina.
-/
#print axioms involutiva_bijetiva

end SEMATPratica
