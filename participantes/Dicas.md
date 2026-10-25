# Dicas graduais para Exercicios.lean

Leia apenas uma dica por vez e volte ao arquivo. Antes da próxima, diga em português o que falta demonstrar. As soluções completas estão separadas.

## A1 — imagens de elementos iguais

1. A hipótese permite substituir `a` por `b`.
2. Compare com `substituir`, na seção 9 de Aula.lean.
3. Reescreva o objetivo usando a igualdade chamada `h`.

## A2 — conjunção

1. Uma afirmação com `∧` pede duas provas.
2. Use `constructor` e observe as metas separadas.
3. A primeira usa `hp`, e a segunda usa `hq`; entregue cada uma com `exact`.

## A3 — existência

1. Qual expressão aparece à direita da igualdade desejada?
2. Escolha essa expressão como testemunha usando `refine ⟨..., ?_⟩`.
3. Depois da escolha, os dois lados da igualdade devem coincidir; pense em `rfl`.

## E1 — desfazer

1. Leia a definição de `Involutiva`: a afirmação vale para todo elemento.
2. Compare com `cota_em_cinco` na seção 8 da aula: uma prova universal pode ser aplicada a um elemento.
3. Qual é o tipo de `hf x`? Use essa prova no objetivo.

## E2 — transportar

1. Se duas expressões são iguais, suas imagens pela mesma função também são.
2. A igualdade disponível é `hxy`; compare com A1.
3. Use `rw` com `hxy` e observe os dois lados resultantes.

## E3 — injetividade

1. Abra a definição mentalmente: dados `x`, `y` e `f x = f y`, queremos `x = y`.
2. Comece com `intro x y hxy`. Guarde com `have` uma igualdade entre `f (f x)` e `f (f y)`, usando E2.
3. A aplicação `transportar f x y hxy` prova essa igualdade intermediária. Dê a ela o nome `h`.
4. `desfazer f hf x` e `desfazer f hf y` são as duas igualdades de que você precisa para reescrever **em h**. A sintaxe `at h` aparece em `cancelar_na_hipotese`, na seção 9 da aula.
5. Depois das reescritas, confira o tipo de `h`. Ele deve coincidir com o objetivo; entregue-o com `exact`.

## E4 — sobrejetividade

1. Comece com um elemento arbitrário `y` da chegada. Precisamos de uma origem cuja imagem seja `y`.
2. A hipótese relaciona `f (f y)` e `y`. Que escolha de origem produz essa imagem?
3. Tente `f y` como testemunha. Após `refine ⟨..., ?_⟩`, leia a igualdade restante.
4. E1 aplicado a `y` fornece a justificativa dessa testemunha.

## E5 — bijetividade

1. O objetivo é uma conjunção, como em A2.
2. Separe as metas com `constructor`.
3. Use `involutiva_injetiva f hf` e `involutiva_sobrejetiva f hf` nas respectivas metas.

## Conferência final

Retire todas as oito lacunas. Se a auditoria final ainda lista `sorryAx`, confira E1–E5 e suas dependências. A ausência desse axioma no teorema final não substitui a conferência dos avisos de A1–A3.
