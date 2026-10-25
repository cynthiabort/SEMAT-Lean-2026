import Mathlib

/-!
FORMALIZAÇÃO E O FUTURO DA MATEMÁTICA: UMA INTRODUÇÃO AO LEAN
SEMAT • 26/10/2026 • Cynthia Bortolotto

Após a instalação, acompanhamos a aula no VS Code por este arquivo.
Use um projeto com Mathlib disponível, na versão Lean 4.30.0 da oficina.
Mantenha o código e o Infoview lado a lado.
Leia cada comentário, faça uma previsão e posicione o cursor na linha
para conferir o Infoview. Há exercícios de definições, enunciados e provas.
A prática de rw e calc está neste arquivo. O projeto de involuções em
Exercicios.lean é complementar; as soluções ficam com a docente.
-/

-- Este namespace agrupa os nomes dos exemplos da aula.
namespace SEMATAula

-- =====================================================================
/-! 1 • Termos e tipos

Lean é uma linguagem tipada: todo termo tem um tipo.
O esquema
             termo : tipo
se lê «o termo tem esse tipo»; é uma explicação,
não uma linha de código para executar com essas palavras.
Por enquanto, usamos #check para ver essa informação no Infoview.
Na saída, ℕ e ℝ são outras notações para Nat e Real.
-/

-- 4 é um termo do tipo Nat, o tipo dos números naturais.
#check (4 : ℝ)
#check Real.pi

-- def n4 : ℝ := 4
-- def n3 : ℝ := 3

-- #eval n4*n3


section
-- Declaramos n antes de usá-lo: aqui ele é um natural qualquer, sem valor fixo.
variable (n : Nat)
#check n

end
-- section e end delimitam o trecho em que essa variável está disponível.

-- O tipo orienta a leitura: agora 3 é um número real.
#check (3 : Real)

-- Um conjunto também é um termo; Set Nat é o tipo dos conjuntos de naturais.
#check ({1, 2, 3} : Set Nat)

-- Uma função também é um termo: Nat.succ leva cada natural ao seu sucessor.
#check Nat.succ
-- No Infoview: Nat.succ (n : ℕ) : ℕ. A entrada e a saída são naturais.

-- =====================================================================
/-! 2 • Três comandos de inspeção

#check: «Qual é o tipo desta expressão?»
#eval:  «Qual resultado obtemos ao executar esta expressão?»
#print: «Como este nome foi declarado?»
Posicione o cursor em cada comando e compare as respostas no Infoview.
-/

-- Consultar o tipo de uma expressão.
#check (2 + 2 : Nat)      -- Tipo: Nat, exibido como ℕ.

-- Calcular um resultado.
#eval 2 + 2              -- Resultado: 4.
#eval "Hello, World!"    -- Resultado: um texto, cujo tipo é String.


-- #eval exige uma expressão executável e um resultado que possa ser exibido.
-- Depois de criar nossas definições, também vamos inspecioná-las com #print.

-- =====================================================================
/-! 3 • Importando a Mathlib

import Mathlib, na primeira linha, carrega a biblioteca matemática que usamos.
Ela fornece definições, notações, teoremas e táticas para trabalhar, por
exemplo, com reais, complexos e conjuntos. Nat já faz parte do Lean básico.
O import precisa vir no início do arquivo, mesmo sendo explicado agora.
-/

#check Real.pi           -- No Infoview: Real.pi : ℝ.

-- DEMONSTRAÇÃO: retire os dois traços da próxima linha e observe o erro.
-- #eval Real.pi
-- Depois, recoloque os traços para deixar o arquivo sem erros.
-- Real.pi é uma definição matemática não computável nesta biblioteca,
-- não uma aproximação executável de π. O erro aponta que a avaliação depende
-- de Real.pi, que é noncomputable. Podemos usá-lo em definições e provas.

-- =====================================================================
/-! 4 • Dando nomes com def

def nome : tipo := expressão dá um nome a um termo.
O sinal : indica o tipo; := apresenta a expressão que define o objeto.
Começamos com objetos simples, sem argumentos de função.
-/

def n : Nat := 30
#check n                 -- Este n tem tipo Nat e agora tem um valor definido.
#eval 5 * n              -- Resultado: 150.
#print n                 -- Observe o tipo e o corpo da definição: 30.

def mensagem : String := "Olá, SEMAT!"
#eval mensagem

def raio : Real := 3
#check raio              -- O raio é um número real; aqui consultamos seu tipo.

-- =====================================================================
/-! 5 • Funções: entradas, saídas e duas formas de definir

Nat → Nat é o tipo das funções com domínio Nat e contradomínio Nat.
O domínio diz quais entradas aceitamos; o contradomínio é o tipo das saídas.
Não significa que todo elemento do contradomínio seja atingido.
-/

-- 5.1 • Definir com um argumento explícito
-- Declaramos o argumento x e o tipo do resultado.
def quadrado (x : Nat) : Nat := x ^ 2

-- 5.2 • Definir com fun
-- Declaramos o tipo da função inteira e usamos fun x => ...
-- Leia fun x => x ^ 2 como «a função que leva x a x ao quadrado».
def quadradoFun : Nat → Nat := fun x => x ^ 2

-- OBSERVE: como o Infoview apresenta cada definição?
#check quadrado          -- O Infoview mostra o argumento (x : ℕ) e a saída : ℕ.
#check quadradoFun

-- Na segunda linha aparece ℕ → ℕ: é o mesmo tipo de função da primeira.

#check (quadrado : ℕ → ℕ)
#check (quadradoFun : ℕ → ℕ)

-- 5.3 • Aplicar as funções
-- PREVEJA: as duas primeiras linhas vão produzir o mesmo resultado?
#eval quadrado 4         -- 16.
#eval quadradoFun 4      -- 16.
#eval quadrado 5         -- 25.

-- A aplicação usa espaço: plusOne 13. Para repetir, use parênteses.
def plusOne (x : Nat) : Nat := x + 1
#check plusOne
#eval plusOne 13
#eval plusOne (plusOne 13)
-- EXPERIMENTE: troque apenas o 13 da linha anterior por outro natural.
-- Minha previsão / resultado observado:


-- Curryficação

def power (n : ℕ) (x : ℕ) : ℕ := x^n
#check power

def power_ : ℕ → ℕ → ℕ := fun n x => x^n
#check power_

def power_alternative : ℕ × ℕ →  ℕ := fun (n, x) => x^n

#eval power 2 3
#eval power_ 2 3
#eval power_alternative 3

#check power_ 2


-- =====================================================================
/-! 6 • Uma definição não computável

A área de um círculo de raio r é πr². Aqui o domínio e o contradomínio
são Real. Para interpretar a função como área geométrica, usamos r ≥ 0.
noncomputable permite definir o objeto matemático sem gerar código para
executá-lo. Isso não é uma lacuna de prova nem uma aproximação numérica.
-/

noncomputable def areaCirculo (r : Real) : Real := Real.pi * r ^ 2
#check areaCirculo       -- (r : ℝ) : ℝ descreve uma função de tipo Real → Real.
#check areaCirculo raio  -- A expressão representa a área para raio 3; tem tipo ℝ.
-- Podemos enunciar e provar propriedades dessa área; #eval não fornece
-- sua expansão decimal. Definir um objeto e fornecer um cálculo executável
-- são tarefas diferentes.








-- =====================================================================
/-! Pausa • Exercícios -/

/-! P1 • Defina um número natural de sua escolha, chamado numeroEscolhido. -/



/-! P2 • Defina a função dobro nos naturais. -/



/-! P3 • Defina meuQuadrado, que calcula o quadrado de um número natural.
Em seguida, avalie o quadrado do dobro de numeroEscolhido.
-/



/-! P4 • Defina uma função que calcule o comprimento de uma circunferência
a partir de seu raio real.
-/


-- =====================================================================
/-! 7 • Construindo tipos

domínio → contradomínio é, ele próprio, um tipo: seus termos são funções.
Construtores de tipos formam novos tipos a partir de tipos já conhecidos.
Compare no Infoview o tipo formado e um termo que pertence a ele.
-/

-- 7.1 • O tipo de uma função
#check Nat → Nat         -- Type: Nat → Nat é um tipo.
#check quadrado          -- quadrado é um termo desse tipo.

-- 7.2 • Tipos numéricos
-- ℕ, ℤ, ℝ e ℂ são notações para Nat, Int, Real e Complex.
-- Em cada par de linhas: primeiro o tipo, depois um termo desse tipo.
#check Nat
#check (4 : Nat)

#check Int
#check (-2 : Int)

#check Real
#check (3 : Real)

#check Complex
#check (1 + Complex.I : Complex)  -- Complex.I é a unidade imaginária.

-- 7.3 • Listas
-- Em List Nat, a ordem e as repetições fazem parte dos dados.
#check List Nat
#check ([1, 2, 2, 3] : List Nat)
#eval ([1, 2, 2, 3] : List Nat).length  -- 4 entradas.

-- 7.4 • Conjuntos finitos
-- Finset Nat: conjuntos finitos de naturais, sem ordem nem repetições.
#check Finset Nat
#check ({1, 2, 3} : Finset Nat)
-- PREVEJA: o 2 repetido aumenta a quantidade de elementos do conjunto?
#eval ({1, 2, 2, 3} : Finset Nat).card  -- 3 elementos distintos.

-- 7.5 • Conjuntos em geral
-- Set Nat: conjuntos de naturais, que podem ser finitos ou infinitos.
-- A anotação após : distingue Set Nat de Finset Nat na mesma notação { ... }.
#check Set Nat
#check ({1, 2, 3} : Set Nat)

-- Também podemos formar conjuntos de reais, descritos por uma propriedade.
#check Set Real
#check ({x : Real | 0 ≤ x} : Set Real) -- Os reais não negativos.

-- 7.6 • Pares e troca de coordenadas
-- Um produto guarda dois dados. p.1 e p.2 acessam suas coordenadas.
#check Nat × Nat
def p : Nat × Nat := (2, 7)
#check p
#eval p.1
#eval p.2

def troca (q : Nat × Nat) : Nat × Nat := (q.2, q.1)
#eval troca p
#eval troca (troca p)
-- Duas trocas devolvem este par. Isso ainda não é uma prova para todo par.

-- LEITURA OPCIONAL: a mesma função identidade serve para diferentes tipos.
-- α representa um tipo de elementos; as chaves deixam Lean inferi-lo.
def identidade {α : Type} (x : α) : α := x
#eval identidade 8
#eval identidade true     -- true é um termo de Bool, o tipo dos valores lógicos.

-- =====================================================================
/-! 8 • Enunciados, provas e objetivos

As duas igualdades abaixo têm tipo Prop. #check não demonstra nenhuma delas.
Quando h : P, h é uma prova da proposição P.
-/

#check (2 + 2 = 4)
#check (2 + 2 = 5)

-- 8.1 • Dar nome a uma proposição
-- A expressão depois de := é um enunciado, não uma prova.
def enunciadoDoisMaisDois : Prop := 2 + 2 = 4
#check enunciadoDoisMaisDois  -- Prop: demos um nome ao que queremos demonstrar.
-- Poderíamos também dar nome a uma proposição falsa. Definir não é provar.

-- 8.2 • Definir uma prova dessa proposição
-- Agora o tipo depois de : é a própria proposição que queremos provar.
-- by inicia um bloco de táticas, que orientam Lean na construção da prova.
-- Escrevemos as táticas nas linhas seguintes, com recuo.
-- No Infoview, acompanhamos o objetivo antes e depois de cada passo.
def provaDoisMaisDois : enunciadoDoisMaisDois := by
  rfl

#check provaDoisMaisDois  -- enunciadoDoisMaisDois: este termo é uma prova.
-- rfl fecha igualdades cujos lados se reduzem à mesma expressão.

-- 8.3 • Declarar o mesmo resultado como teorema
-- theorem também dá nome a uma prova; aqui escrevemos o enunciado diretamente.
theorem dois_mais_dois : 2 + 2 = 4 := by
  rfl

#check dois_mais_dois    -- 2 + 2 = 4: a mesma proposição, agora sem a abreviação.
-- def pode nomear objetos em geral, inclusive proposições e provas.
-- theorem é a declaração própria para um resultado acompanhado de sua prova.
-- provaDoisMaisDois e dois_mais_dois provam o mesmo enunciado.
-- No teorema, também poderíamos escrever := provaDoisMaisDois no lugar de by rfl.

-- 8.4 • Enunciar outros resultados, deixando a prova para depois
-- sorry deixa uma lacuna e gera um aviso: o resultado ainda não foi provado aqui.
-- Vamos apenas ler estes enunciados. No Infoview, antes de sorry,
-- identifique os objetos, as hipóteses e a conclusão que falta demonstrar.

-- A ordem das parcelas não altera a soma de dois naturais.
theorem comutatividade_soma (a b : Nat) : a + b = b + a := by
  sorry

-- O quadrado de qualquer número real é não negativo.
theorem quadrado_nao_negativo (x : Real) : 0 ≤ x ^ 2 := by
  sorry

-- Existem primos arbitrariamente grandes: acima de cada N há um primo p.
-- ∃ significa «existe»; ∧ significa «e»; Nat.Prime p diz que p é primo.
theorem primos_arbitrariamente_grandes (N : Nat) :
    ∃ p : Nat, N < p ∧ Nat.Prime p := by
  sorry

-- Último Teorema de Fermat: se n > 2, a equação aⁿ + bⁿ = cⁿ
-- não tem solução com a, b e c naturais positivos. ≠ significa «diferente».
theorem ultimo_teorema_de_fermat (a b c n : Nat)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) (hn : 2 < n) :
    a ^ n + b ^ n ≠ c ^ n := by
  sorry

-- 8.5 • Usar hipóteses para construir provas
-- Uma implicação transforma uma prova da premissa em uma da conclusão.
theorem usar_implicacao (P Q : Prop) (hPQ : P → Q) (hP : P) : Q := by
  exact hPQ hP

theorem repetir_hipotese (P : Prop) : P → P := by
  intro hP
  exact hP

-- OBSERVE: posicione o cursor antes e depois de intro hP.
-- Antes: o objetivo é P → P. Depois: hP : P está disponível e o objetivo é P.
-- O que exact hP entrega?
-- Minha resposta:

-- EXPERIMENTE: renomeie hP nas duas linhas da prova para h.
-- O nome muda; a proposição demonstrada permanece a mesma.

-- 8.6 • Parâmetros explícitos ( ) e implícitos { }
-- Se M limita todos os valores de f, também limita f 5.
-- h prova uma afirmação sobre todo n; h 5 fornece o caso particular n = 5.
theorem cota_em_cinco (f : ℕ → ℝ) (M : ℝ)
    (h : ∀ n : ℕ, f n ≤ M) : f 5 ≤ M := by
  exact h 5

-- Com {M : ℝ}, Lean pode inferir a cota pelo tipo da prova h.
theorem cota_em_cinco_implicita (f : ℕ → ℝ) {M : ℝ}
    (h : ∀ n : ℕ, f n ≤ M) : f 5 ≤ M := by
  exact h 5

-- Compare os parâmetros apresentados pelo Infoview.
#check cota_em_cinco
#check cota_em_cinco_implicita

section
variable (f : ℕ → ℝ) (M : ℝ) (h : ∀ n : ℕ, f n ≤ M)

#check cota_em_cinco f M h             -- Fornecemos M explicitamente.
#check cota_em_cinco_implicita f h     -- Lean infere M a partir de h.
#check cota_em_cinco_implicita f (M := M) h -- Também podemos nomeá-lo.
-- Nas três aplicações, o tipo da prova resultante é f 5 ≤ M.
end

-- As chaves mudam como fornecemos o parâmetro ao aplicar o teorema.
-- M continua sendo um parâmetro universal; {M : ℝ} não significa ∃ M : ℝ.

-- =====================================================================
/-! Pausa após a seção 8 • Ler e escrever enunciados

Primeiro, abra QuizSecao8.html no navegador e responda às 10 questões.
Depois, traduza os três enunciados abaixo para Lean usando theorem.
Deixe as provas com by sorry: o exercício é escrever o enunciado.
-/

/-! T1 • Dados números reais a e b com a < b, existe um número real c
tal que a < c e c < b.
-/

/-! T2 • Seja f uma função dos reais nos reais. Suponha que f(x) < f(y)
sempre que x < y. Então, para quaisquer reais a e b,
se f(a) = f(b), então a = b.
-/


/-! T3 • Sejam f e g funções dos naturais nos reais. Suponha que cada uma
possua uma cota superior real, que pode ser diferente para f e para g.
Então existe um real M que limita superiormente ambas:
f(n) ≤ M e g(n) ≤ M para todo natural n.
-/

-- =====================================================================
/-! 9 • Calcular reescrevendo igualdades: rw

Exemplos e exercícios adaptados de Mathematics in Lean, seção «Calculating»:
https://leanprover-community.github.io/mathematics_in_lean/C02_Basics.html#calculating

Uma conta se torna uma prova quando justificamos cada transformação.
Vamos acompanhar essas transformações no Infoview, uma linha de cada vez.
-/

-- 9.1 • Usar uma igualdade que está nas hipóteses
-- rw [h] reescreve o objetivo usando h da esquerda para a direita.
theorem substituir (x y : Nat) (h : x = y) : x + 2 = y + 2 := by
  rw [h]
-- Depois da substituição, os dois lados são iguais e rw conclui a prova.

-- 9.2 • Usar igualdades da biblioteca
section
variable (a b c : ℝ)
#check mul_comm a b      -- a * b = b * a
#check mul_assoc a b c   -- a * b * c = a * (b * c)
#check sub_self a        -- a - a = 0
#check two_mul a         -- 2 * a = a + a
end

-- a * b * c é lido como (a * b) * c: os parênteses fazem diferença para rw.
theorem reorganizar_produto_rw (a b c : ℝ) : a * b * c = b * (a * c) := by
  rw [mul_comm a b]
  -- OBSERVE: agora o objetivo é b * a * c = b * (a * c).
  rw [mul_assoc b a c]

-- 9.3 • Escolher o sentido e os argumentos da reescrita
-- ← inverte a igualdade usada, não escolhe um lado do objetivo. Digite \l.
example (a b c : ℝ) : a * (b * c) = a * b * c := by
  rw [← mul_assoc a b c]

-- Sem argumentos, Lean procura uma expressão que se encaixe no lema.
-- Aqui mul_comm troca a com o bloco inteiro b * c.
example (a b c : ℝ) : a * (b * c) = b * (c * a) := by
  rw [mul_comm]
  rw [mul_assoc]
-- Passe argumentos como mul_comm a b quando quiser indicar quais fatores trocar.

-- 9.4 • Reescrever uma hipótese
-- «at h» modifica h; sem isso, rw trabalha no objetivo.

theorem cancelar_na_hipotese (a b c d : ℝ)
    (h : c = b * a - d) (hd : d = a * b) : c = 0 := by
  rw [hd] at h
  rw [mul_comm b a] at h
  -- OBSERVE: h agora prova c = a * b - a * b.
  rw [sub_self] at h
  exact h



/-! Pausa • Exercícios de rw

Substitua cada sorry por uma prova com rw e, quando necessário, exact.
Leia a igualdade de cada lema antes de escolher o sentido da reescrita.
-/

/-! R1 • Reorganize os três fatores. -/
theorem r1_trocar_ordem (a b c : ℝ) : c * b * a = b * (a * c) := by
  sorry

/-! R2 • Use a igualdade entre os produtos dentro da expressão maior. -/
theorem r2_substituir_produto (a b c d e f : ℝ) (h : b * c = e * f) :
    a * b * c * d = a * e * f * d := by
  sorry

/-! R3 • Transforme a hipótese h em uma prova da conclusão. -/
theorem r3_dobro_na_hipotese (a b c d : ℝ)
    (h : c = d * a + b) (hb : b = a * d) : c = 2 * a * d := by
  sorry

-- =====================================================================
/-! 10 • Escrever uma cadeia de cálculos: calc

calc explicita as expressões intermediárias da conta.
Cada igualdade tem sua própria justificativa depois de :=.
Em cada linha seguinte, _ retoma a expressão à direita da linha anterior.
-/

-- 10.1 • A mesma conta, agora com os passos matemáticos visíveis
theorem reorganizar_produto_calc (a b c : ℝ) : a * b * c = b * (a * c) := by
  calc
    a * b * c = (b * a) * c := by rw [mul_comm a b]
    _ = b * (a * c) := by rw [mul_assoc b a c]

-- OBSERVE: dentro de cada «by», o Infoview pede apenas a igualdade daquela linha.
-- Lean encadeia as igualdades pela transitividade. Preserve o recuo das linhas.

-- 10.2 • Uma conta maior: desenvolver o quadrado de uma soma
section
variable (a b c : ℝ)
#check mul_add a b c    -- a * (b + c) = a * b + a * c
#check add_mul a b c    -- (a + b) * c = a * c + b * c
#check add_assoc a b c  -- a + b + c = a + (b + c)
end

-- Podemos reunir várias reescritas numa lista; elas são feitas na ordem indicada.
theorem quadrado_soma_rw (a b : ℝ) :
    (a + b) * (a + b) = a * a + 2 * (a * b) + b * b := by
  rw [mul_add, add_mul, add_mul]
  rw [← add_assoc, add_assoc (a * a)]
  rw [mul_comm b a, ← two_mul]

-- Com calc, vemos o que cada grupo de reescritas pretende obter.
theorem quadrado_soma_calc (a b : ℝ) :
    (a + b) * (a + b) = a * a + 2 * (a * b) + b * b := by
  calc
    (a + b) * (a + b) = a * a + b * a + (a * b + b * b) := by
      rw [mul_add, add_mul, add_mul]
    _ = a * a + (b * a + a * b) + b * b := by
      rw [← add_assoc, add_assoc (a * a)]
    _ = a * a + 2 * (a * b) + b * b := by
      rw [mul_comm b a, ← two_mul]

-- Para montar uma prova, escreva primeiro a cadeia com «by sorry» em cada passo.
-- Confira as igualdades intermediárias e depois justifique uma linha de cada vez.
-- calc também pode vir diretamente depois de :=, pois a cadeia é um termo de prova.

/-! Pausa • Exercícios de calc

Escreva as expressões intermediárias e justifique cada passo com rw.
Uma igualdade correta ainda precisa de uma prova que Lean aceite.
-/

/-! C1 • Refaça R2 usando uma cadeia calc. -/
theorem c1_substituir_produto_calc (a b c d e f : ℝ) (h : b * c = e * f) :
    a * b * c * d = a * e * f * d := by
  sorry

/-! C2 • Desenvolva o produto de duas somas usando calc. -/
theorem c2_produto_somas (a b c d : ℝ) :
    (a + b) * (c + d) = a * c + a * d + b * c + b * d := by
  ring

-- Consulte os enunciados destes lemas para o desafio seguinte.
section
variable (a b c : ℝ)
#check pow_two a           -- a ^ 2 = a * a
#check mul_sub a b c       -- a * (b - c) = a * b - a * c
#check add_sub_assoc a b c -- a + b - c = a + (b - c)
#check sub_add_cancel a b  -- a - b + b = a
end

/-! C3 • Desafio opcional: demonstre a diferença de quadrados usando calc. -/
theorem c3_diferenca_quadrados (a b : ℝ) :
    (a + b) * (a - b) = a ^ 2 - b ^ 2 := by
  sorry

-- =====================================================================
/-! 11 • Preparar o fechamento: automatizar identidades com ring -/

-- ring automatiza identidades polinomiais como as que acabamos de justificar.
example (a b : ℝ) : (a + b) * (a - b) = a ^ 2 - b ^ 2 := by
  ring

-- Com hipóteses locais, podemos primeiro reescrever e depois usar ring.
example (a b c d : ℝ) (h : c = d * a + b) (hb : b = a * d) :
    c = 2 * a * d := by
  rw [h, hb]
  ring

-- =====================================================================
/-! 12 • Desafio final: Cauchy–Schwarz em duas dimensões

Vamos demonstrar, para quaisquer números reais a, b, c e d:

             (a*c + b*d)² ≤ (a² + b²) * (c² + d²).

Esta é a forma ao quadrado da desigualdade de Cauchy–Schwarz para os vetores
(a, b) e (c, d). a*c + b*d é o produto escalar; a² + b² e c² + d² são os
quadrados dos comprimentos. A ideia da prova será reconhecer um quadrado
não negativo.
-/

-- 12.1 • Descobrir a identidade por trás da desigualdade
-- NO PAPEL: desenvolva (a² + b²)*(c² + d²) - (a*c + b*d)².
-- Qual quadrado aparece? Depois, confira a identidade com ring.

/-! F1 • Demonstre a identidade de Lagrange. -/
theorem identidade_lagrange (a b c d : ℝ) :
    (a ^ 2 + b ^ 2) * (c ^ 2 + d ^ 2) =
      (a * c + b * d) ^ 2 + (a * d - b * c) ^ 2 := by
  sorry

-- 12.2 • Usar que todo quadrado real é não negativo
section
variable (s t : ℝ)
#check sq_nonneg t  -- Uma prova de 0 ≤ t ^ 2.
#check (le_add_of_nonneg_right : 0 ≤ t → s ≤ s + t)
end

-- Somar um quadrado não diminui um número real.
example (s t : ℝ) : s ≤ s + t ^ 2 := by
  exact le_add_of_nonneg_right (sq_nonneg t)

-- calc também pode encadear uma desigualdade ≤ com uma igualdade =.
/-! F2 • Prove Cauchy–Schwarz com calc, usando a identidade demonstrada em F1
e a não negatividade de um quadrado.
-/
theorem cauchy_schwarz_duas_dimensoes (a b c d : ℝ) :
    (a * c + b * d) ^ 2 ≤ (a ^ 2 + b ^ 2) * (c ^ 2 + d ^ 2) := by
  sorry

-- 12.3 • Reutilizar o teorema que acabamos de provar
-- Agora o nosso teorema pode ser aplicado como qualquer lema da biblioteca.
section
variable (a b : ℝ)
#check cauchy_schwarz_duas_dimensoes a b 1 1
end

/-! F3 • Use Cauchy–Schwarz para provar a desigualdade abaixo.
Simplifique o caso c = d = 1 com rw e ring.
-/
theorem quadrado_soma_limitado (a b : ℝ) :
    (a + b) ^ 2 ≤ 2 * (a ^ 2 + b ^ 2) := by
  sorry

-- CONFERÊNCIA FINAL: depois de completar F1–F3, estas linhas não devem listar sorryAx.
#print axioms cauchy_schwarz_duas_dimensoes
#print axioms quadrado_soma_limitado
-- Uma prova completa combina a ideia matemática, lemas conhecidos e passos verificados.
-- Para discutir: em que passo usamos que os quadrados reais são não negativos?
-- Quando ocorre igualdade? Olhe para o quadrado extra na identidade de Lagrange.

end SEMATAula
