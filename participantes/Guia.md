# Prática da oficina

Depois da apresentação e do teste de instalação, acompanhe `Aula.lean` no VS Code, com o código e o Infoview lado a lado.

## Percurso principal

1. Inspecionar termos com `#check`, executar expressões com `#eval` e criar definições.
2. Ler um teorema: identificar objetos, hipóteses e conclusão.
3. Construir provas por reescrita com `rw` e organizar contas com `calc`.
4. Encerrar com a identidade de Lagrange e Cauchy–Schwarz em duas dimensões.

A docente selecionará os exemplos e exercícios durante o encontro. Não é necessário percorrer todas as atividades para acompanhar o fechamento. `QuizSecao8.html` pode ser aberto no navegador para revisar a leitura de enunciados.

## Como trabalhar

- Faça uma previsão antes de executar um exemplo.
- Leia o objetivo no Infoview antes e depois de cada tática.
- Trabalhe em dupla quando indicado, alternando quem escreve e quem explica.
- Substitua cada `sorry` do exercício escolhido por uma prova. Os avisos de lacunas nos exercícios ainda não feitos são esperados.
- Se aparecer um erro, procure a primeira linha com problema e confira os tipos e os parênteses.

## Material opcional

`Exercicios.lean` é um projeto sobre involuções para continuar depois, acompanhado de `Dicas.md`. `ExerciciosMathlib.lean` reúne três desafios adicionais. Esses arquivos não substituem o percurso principal de `Aula.lean`.

## Conferência

`TesteInstalacao.lean` deve funcionar sem erros nem avisos. Os exercícios começam com avisos intencionais de `sorry`; uma prova está concluída quando a lacuna foi substituída e Lean a aceita.

`#print axioms` permite verificar as dependências de um teorema. A presença de `sorryAx` indica uma lacuna na prova ou em algum resultado que ela utiliza. Confira também os avisos do arquivo: a auditoria de um teorema não confere exercícios independentes.

A formalização verifica o enunciado que escrevemos. Verificar se ele expressa a intenção matemática continua fazendo parte do trabalho.
