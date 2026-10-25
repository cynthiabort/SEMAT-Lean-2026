# SEMAT 2026 · Introdução ao Lean

**Formalização e o futuro da matemática: uma introdução ao Lean**  
Cynthia Bortolotto · 26 de outubro de 2026

Materiais dos participantes: apresentação, projeto Lean, exercícios e orientações.

## Comece aqui

1. **[Baixe todos os materiais em ZIP](https://github.com/cynthiabort/SEMAT-Lean-2026/archive/refs/heads/main.zip)** e extraia a pasta.
2. Abra a pasta completa no VS Code: **File → Open Folder…**. Ela deve conter `lean-toolchain`, `lakefile.toml`, `lake-manifest.json` e `participantes/`.
3. Siga [Instalação e preparação](participantes/Instalacao.md) e abra [TesteInstalacao.lean](participantes/TesteInstalacao.lean).
4. Quando o teste mostrar **4**, sem erros, abra [Aula.lean](participantes/Aula.lean) e acompanhe a docente.

Não é necessário usar Git, uma conta do GitHub ou ferramentas de IA para participar.

## Durante a aula

| Material | Uso |
|---|---|
| [SEMAT-2026.html](SEMAT-2026.html) | Apresentação. Depois de extrair o ZIP, abra este arquivo no navegador. |
| [Aula.lean](participantes/Aula.lean) | Roteiro e exercícios, das primeiras definições até Cauchy–Schwarz em duas dimensões. |
| [Guia.md](participantes/Guia.md) | Como acompanhar a prática e conferir o trabalho. |
| [QuizSecao8.html](participantes/QuizSecao8.html) | Revisão interativa de enunciados e provas; abra no navegador quando indicado. |

O arquivo de aula contém exemplos prontos e exercícios com `sorry`. Os avisos correspondentes são esperados: cada `sorry` é uma lacuna a completar, não uma prova concluída. A docente indicará os exemplos e exercícios a trabalhar durante o encontro.

## Para continuar depois

- [Exercicios.lean](participantes/Exercicios.lean): projeto opcional sobre involuções, com oito exercícios.
- [Dicas.md](participantes/Dicas.md): dicas graduais para esse projeto.
- [ExerciciosMathlib.lean](participantes/ExerciciosMathlib.lean): três desafios opcionais com Mathlib.
- [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/): leitura e prática adicionais.
- [Natural Number Game](https://adam.math.hhu.de/#/g/leanprover-community/nng4): introdução por exercícios.

## Versões e downloads

O projeto fixa **Lean 4.30.0** e **Mathlib v4.30.0**. Preserve os três arquivos de configuração; não é necessário criar outro projeto nem executar `lake update`.

Se quiser apenas o projeto Lean, use [SEMAT-Lean-participantes.zip](SEMAT-Lean-participantes.zip). Os botões de download da apresentação fornecem a mesma versão dos arquivos de prática deste repositório.

As bibliotecas e seus arquivos compilados são baixados na preparação inicial; não estão dentro do ZIP. Após a preparação, a aula e os exercícios podem ser usados localmente. As soluções dos exercícios ficam com a docente.

Os exemplos de reescrita e cálculo indicam a referência a *Mathematics in Lean* no próprio arquivo. Os créditos e fontes das imagens e demais materiais da apresentação foram mantidos no HTML.
