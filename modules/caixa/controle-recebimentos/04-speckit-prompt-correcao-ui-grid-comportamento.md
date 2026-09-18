# Prompt 04 — Corrigir paridade da UI, grid e seleção

Execute `/speckit.specify` para corrigir a implementação existente de
`/caixa/controle-recebimentos` no Laravel. Este prompt é corretivo: consulte os
prompts 01–03, a auditoria
`auditoria-implementacao-laravel-vs-delphi.md`, os artefatos de pesquisa deste
diretório, o checkout Laravel atual e os testes atuais. Não peça reabertura dos
fontes Delphi e não implemente durante `/speckit.specify`.

## Correções obrigatórias

1. Operação 0: emissão inicia hoje somente quando vazia; vencimento e
   recebimento são limpos.
2. Operação 1: emissão é limpa; início e fim de vencimento recebem ontem
   somente quando vazios; recebimento é limpo.
3. Operação 2: emissão e vencimento são limpos; início e fim de recebimento
   recebem hoje somente quando vazios.
4. Use a data civil do servidor/configuração Laravel, não `new Date()` do
   navegador como autoridade.
5. Preserve a aba `Registros Selecionados`, os rótulos das três operações e os
   títulos de coluna em caixa alta exatamente como capturados: `FILIAL`,
   `LANÇTO`, `VALOR`, `VENCIMENTO`, `RECEBIMENTO`, `TIPO RECEBIMENTO`,
   `% DESÁG`, `VLR DESÁGIO`, `CLIENTE`, `NOME DO CLIENTE`, `CONTRATOS`,
   `ORÇAMENTOS` e `OK`. O checkbox de seleção não pode apagar a semântica do
   cabeçalho `OK`.
6. Mantenha a ordenação inicial completa e acrescente desempate determinístico
   quando o usuário ordenar por uma coluna. A allowlist visual e a allowlist
   PHP devem ser a mesma.
7. Preserve a matriz de edição: tipo somente no modo 0 e somente quando
   `quantidadeconfirmacoes = 0`; data, valor e deságio somente no modo 1; todos
   os demais dados informativos sempre somente leitura; `OK` é seleção, não
   edição livre.
8. Ao marcar/desmarcar, replique o estado visual observado: modo 1 preenche ou
   limpa data/valor; modo 2 limpa a marcação rumo ao estorno e restaura ao
   desfazer; modo 0 propaga tipo e seleção para todo o
   `controlerecebimento`. Não use `||` para decidir se zero é valor válido.
9. “Confirmar todos” e a seleção por grupo devem abranger o conjunto completo
   da geração, não somente a página visível. Como o F6 já possui fotografia,
   mantenha a seleção por `codigo` entre paginações/ordenações ou use um token
   de seleção da fotografia. Nunca faça uma consulta por linha.
10. Substitua `window.confirm` e o ícone importado de outro módulo pelo modal e
    catálogo de ícones/atalhos padrão do Laravel. Preserve `F5`, `F6`, `F7`,
    `Ctrl+Space`, `Esc` e o F9 do `CatalogCodeLookup`; F6 dentro de modal não
    pode gerar a consulta da página.

## Critérios de aceite

- Testes de componente/hook cobrem os três defaults, data do servidor, seleção
  entre páginas, grupo dividido entre páginas, marca/desmarca nos modos 1 e 2,
  zero monetário, títulos e ordenação com desempate.
- Teste de browser/feature comprova que preferências de layout não alteram
  editabilidade nem o payload F5.
- O relatório continua consumindo a mesma fotografia e catálogo do grid; não
  criar cabeçalhos diferentes para PDF/HTML/exportação.
- Não adicionar Cadastro, inclusão, exclusão, filtro de situação, nova operação
  ou nova permissão.

## Guardrails

Use DTOs e allowlists existentes. Não usar SQL concatenado, N+1, `Locate`,
`select *`, teste de driver, `hasTable`, `Schema::has*`, `information_schema` ou
`pg_catalog`. O schema autorizado continua sendo o snapshot versionado em
`schema/`; se algo não estiver nele, registre bloqueio no spec.

