# Consolidar o prompt SpecKit — Fundação de Caixa

Type: task
Status: resolved
Blocked by: 03, 04, 05, 11

## Question

Como consolidar as decisões de abertura/fechamento no Usuário (03), schema do ledger autenticacoes (04), domínio de Eventos (05) e os critérios de aceite/testes relevantes (11) num prompt autocontido para `/speckit.specify`, publicado em `modules/caixa/fechamentos/01-speckit-prompt.md`, no mesmo formato dos demais prompts SpecKit do repositório (regra de investigação, evidência Delphi confirmada, limite da entrega, critérios de aceite, matriz de testes, saída esperada)?

## Answer

Consolidado em [`modules/caixa/fechamentos/01-speckit-prompt.md`](../../../modules/caixa/fechamentos/01-speckit-prompt.md), seguindo o mesmo formato usado nos demais prompts SpecKit do repositório (regra de investigação, fronteira de acesso às fontes, investigação Laravel obrigatória, evidência Delphi confirmada, decisões obrigatórias, critérios de aceite, matriz de testes, saída esperada, fora de escopo). Cobre: campos de caixa no Usuário e derivação de `caixaaberto` (com a divergência resolvida documentada), comando de domínio `AbrirCaixa` unificado, schema/domínio do ledger `autenticacoes` com os 14 tipos, leitura mínima de `cheques`/`recebimentos`, e o reaproveitamento explícito dos Cadastros de Eventos e Tipos de Recebimento já existentes. Declara fora de escopo as telas de lançamento, o Fechamento de Caixa em si (spec 02) e qualquer integração ECF/TEF.
