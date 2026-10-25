# Preparação: VS Code, Lean e Mathlib

**Lean 4.30.0 · Mathlib v4.30.0 · SEMAT, 26/10/2026**

Os computadores da oficina já têm VS Code. A preparação abaixo confere a extensão Lean, a versão do compilador e a biblioteca usada no projeto. Não são necessários Copilot, LLMs nem uma conta de IA.

## 1. Confira a extensão Lean 4

Abra Extensões (`Ctrl+Shift+X` no Windows; `Cmd+Shift+X` no Mac). Pesquise `@id:leanprover.lean4` e confira **Lean 4**, publicada por **leanprover**. Instale a extensão se necessário.

Se estiver usando seu próprio computador sem VS Code, obtenha-o antes no [site oficial](https://code.visualstudio.com/download).

## 2. Prepare Lean, se ainda não estiver instalado

Abra a paleta (`Ctrl+Shift+P` ou `Cmd+Shift+P`) e procure **Lean 4: Docs: Show Setup Guide**. No guia, abra **Install Lean**, use **Click to install** e **Proceed**, e aguarde a confirmação. A extensão do editor e o compilador são componentes diferentes.

Se alguma ferramenta ou permissão do computador impedir a preparação, peça apoio à monitoria. Enquanto isso, acompanhe em dupla em uma máquina pronta.

## 3. Abra a pasta completa

[Baixe o projeto](https://github.com/cynthiabort/SEMAT-Lean-2026/archive/refs/heads/main.zip), extraia o ZIP e use **File → Open Folder…**. Abra a pasta que contém:

```text
lean-toolchain
lakefile.toml
lake-manifest.json
participantes/
```

Não abra apenas `participantes/`. Confira que se trata da pasta recebida da docente antes de aceitar eventual pergunta de confiança do editor.

`lean-toolchain` pede Lean **4.30.0**. Aguarde o download se essa versão ainda não estiver disponível. Preserve a versão e o manifesto do projeto.

## 4. Prepare Mathlib

Com internet e a pasta aberta, execute **Lean 4: Project: Fetch Mathlib Build Cache** pela paleta. Aguarde a preparação das dependências e dos arquivos compilados.

Alternativa no terminal integrado, dentro da pasta do projeto:

```sh
lake exe cache get
```

Não execute `lake update`: o projeto já fixa as versões usadas na oficina. Se a rede estiver lenta, acompanhe em dupla em vez de aguardar sozinho.

## 5. Faça o teste

Abra [TesteInstalacao.lean](TesteInstalacao.lean), aguarde o carregamento e confira:

1. `import Mathlib` não tem erro.
2. `#eval 2 + 2` mostra **4**.
3. As provas do arquivo não apresentam erros ou avisos.

Para abrir o Infoview, use `Ctrl+Shift+Enter` no Windows ou `Cmd+Shift+Enter` no Mac. Informações em azul são normais; erros vermelhos precisam de atenção.

## 6. Acompanhe a aula

Abra [Aula.lean](Aula.lean). Os avisos de `sorry` nos exercícios são intencionais. Siga a seleção feita pela docente; o roteiro termina em Cauchy–Schwarz.

## Se algo não funcionar

- **Mathlib não encontrada:** confira se abriu a raiz e concluiu o download do cache. Instalar apenas a extensão não fornece a biblioteca.
- **Versão diferente:** confira `lean-toolchain` e a pasta aberta; não misture arquivos de projetos com versões diferentes.
- **Infoview ausente:** confira a extensão `.lean`, a extensão Lean 4 e o atalho acima.

Fontes: [instalação oficial](https://lean-lang.org/install/) e [manual da extensão](https://github.com/leanprover/vscode-lean4/blob/master/vscode-lean4/manual/manual.md).
