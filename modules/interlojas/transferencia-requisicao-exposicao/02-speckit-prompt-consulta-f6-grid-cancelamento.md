# Prompt para `/speckit.specify` — consulta F6, grid e cancelamento

````text
/speckit.specify

Crie uma especificação funcional e técnica para a consulta da tela **Interlojas → Transferência de Requisição para Exposição**, preservando o comportamento Delphi e usando a infraestrutura Laravel de consulta cancelável. Não implemente código. Consuma `01-speckit-prompt-fundacao-dominio-seguranca.md` e os prompts existentes de Consulta de Requisições, Romaneios e grids.

## Jornada e filtros

Defina a consulta da filial requisitada informativa derivada de `FilialBase`, com:

- Requisitante selecionado pelo modal padrão F9;
- Situação em radio buttons, mapeando `A` aberta, `F` fechada, `D` confirmada e `C` cancelada;
- Curva ABC A/B/C/Não Definido em seleção múltipla, inicialmente marcada como no Delphi;
- Período inicial/final e número de dias, com validação de data contábil, limite retroativo e final não anterior ao início;
- modo de produto/código de barras alternado por F11, quando o parâmetro comprovado habilitar a busca;
- filtro visual de lotes em lista com checkbox, onde nenhuma seleção não restringe o resultado;
- os detalhes de compras/grupos/filiais do Delphi não devem ser recriados.

O botão Gerar F7 inicia a consulta e mantém a operação síncrona para a primeira versão. Se o shell nomear a operação de pesquisa como F6, preservar o mesmo contrato: o botão Cancelar aparece imediatamente no início de qualquer geração. Não esperar o primeiro resultado para renderizar Cancelar.

## Cancelamento real

Reutilize `ErpConsultaOperationBar`, `useErpGerarRequest`, `PgsqlGerarQueryRunner`, registro de trace/screenKey e o endpoint padrão de cancelamento. Defina `screenKey` próprio para Transferência. O fluxo deve:

1. gerar e registrar `traceId` antes do request;
2. exibir Cancelar com ícone de perigo, `aria-label` e estado ocupado antes do primeiro await;
3. solicitar cancelamento no backend para alcançar o PID PostgreSQL;
4. interromper a query no PostgreSQL e só então abortar/limpar a interface local;
5. diferenciar cancelado, timeout, erro de consulta e resultado vazio;
6. impedir que resposta tardia substitua filtros ou dados de uma geração mais nova.

Prove cancelamento observável com PostgreSQL real e `pg_cancel_backend`/runner existente. Não substituir cancelamento real por `AbortController`. Não criar testes de driver ou de `hashtablefs`/`hastablefs`.

## SQL e schema

Parta de `pedidosfiliais` e projete os campos do Delphi: produto, descrição, referência, situação/ABC, CST/CSOSN/PIS/COFINS, localização, data, filial, estoques, reserva, mínimo/máximo, pedida, confirmada, lote, marcação, observação, promoção e grades condicionais por parâmetro.

Use binds e tipos estruturados. A consulta deve ser set-based, sem macros textuais, `Locate`, uma consulta por linha, função escalar repetida sem medição ou N+1 na aplicação. Para filtros/listas use `IN` ou `= ANY(array)` e defina listas vazias explicitamente. Ordenação deve ser server-side por allowlist; padrão `requisitante, produto`, com desempate determinístico. Nunca aceitar coluna, direção, SQL, linhas ou filial arbitrários do browser.

Use `INNER JOIN` para produto, característica, filiais e estoque quando FK/`NOT NULL` e o contrato da consulta tornarem a relação obrigatória. Use `LEFT JOIN` apenas para promoção, grade ou outra relação opcional confirmada no snapshot. Verifique nulabilidade em `schema/postgresql-authoritative-2026-08-06.json` antes de escrever SQL.

Não haverá paginação. O conjunto filtrado completo alimenta a grade principal; exportação deve congelar filtros, ordenação e colunas autorizadas no contexto do usuário, usando `ErpPreferenceDataGrid`/`ErpGridShell` e o orquestrador existente sem aceitar SQL da UI.

## Aceite mínimo

- [ ] F7 valida filtros e inicia uma única consulta parametrizada; resultado vazio volta ao filtro com mensagem clara.
- [ ] Cancelar está visível desde o início e cancela o backend PostgreSQL, não apenas a UI.
- [ ] F9 usa modal padrão e F11 alterna produto/código de barras conforme parâmetro.
- [ ] Situação e ABC têm os códigos e a seleção Delphi corretos.
- [ ] Não existe paginação nem grade Delphi obsoleta de compras/filiais.
- [ ] Grid, exportação, ordenação e preferências têm catálogo/allowlist próprios.
- [ ] Testes cobrem filtros, lista vazia, sort inválido, exportação e cancelamento real.

## Fora de escopo

Gravação, confirmação, cancelamento/reabertura de uma requisição, criação de lote, conferência, emissão fiscal, venda entre filiais e implementação.
````

