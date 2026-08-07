# Publicar os prompts Speck/Specify corretivos do Cadastro de Pedidos

Type: task
Status: resolved
Blocked by: 05

## Question

Como consolidar e publicar os prompts `/speckit.specify` incrementais `16+`, autocontidos e rastreáveis, prontos para implementar somente as lacunas restantes sem regressão das 15 fatias anteriores?

## Answer

Foram publicados dez prompts corretivos autocontidos, numerados de `16` a `25`, preservando as decisões dos prompts `01–15`:

- `16-speckit-prompt.md`: concorrência, idempotência, revisão compatível com Delphi e numeração exclusivamente por sequence;
- `17-speckit-prompt.md`: motores fiscal e de custo obrigatórios, autoritativos e transacionais;
- `18-speckit-prompt.md`: sincronização segura com Contas a Pagar, sem reconstrução quando a previsão financeira não mudar e com bloqueio de duplicatas protegidas;
- `19-speckit-prompt.md`: cabeçalho completo, estados, filiais e observações externa/interna;
- `20-speckit-prompt.md`: pendências SEFAZ e sincronização bidirecional da seleção de produtos;
- `21-speckit-prompt.md`: consulta completa de produtos similares;
- `22-speckit-prompt.md`: formulário fiscal completo, com backend autoritativo;
- `23-speckit-prompt.md`: modo inline de custo e preço separado do atalho `F11`;
- `24-speckit-prompt.md`: gestos operacionais, teclado, foco e acessibilidade;
- `25-speckit-prompt.md`: exportação XLSX sobre a mesma projeção autorizada do relatório.

A ordem de implementação ficou explícita: `16 → 17 → 18`; depois, `19–22` podem avançar em paralelo conforme seus pré-requisitos; após a integração do bloco P1, seguem `23–25`. Todos os prompts definem contexto, pré-requisitos, regras, escopo, critérios de aceite, testes e regressões. A verificação final confirmou os dez arquivos, os blocos `/speckit.specify`, a ausência de placeholders e `git diff --check` sem erros.
