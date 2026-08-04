# Pesquisa — SQL, domínio e efeitos do Cadastro de Romaneios Delphi

## Escopo e legenda

Inventário estático das raízes `delphi/apps/entrega/dmcadastroromaneios.pas/.dfm` e `fmcadastroromaneios.pas/.dfm`, seguindo apenas dependências alcançadas por elas. Este documento orienta os prompts `/speckit.specify`; não valida o schema físico.

- **CONFIRMADO**: expresso no código/DFM.
- **INFERIDO**: interpretação que ainda exige confirmação no schema ou nas funções PostgreSQL.
- **POSSÍVEL BUG LEGADO**: comportamento que não deve ser copiado sem decisão explícita.

## Agregado e relações observadas

**CONFIRMADO** — `romaneios` é o mestre; `romaneiosnotas` contém os documentos fiscais vinculados. O mestre referencia transportador (`fornecedores`), tabela de frete, usuário em trânsito e documento a pagar. Cada item referencia `dadosfiscais`, filial de emissão, série/nota ou máquina/intervenção/cupom, motivo, usuário autorizador, entrega, valores, volumes e cancelamento. Evidências: datasets `qryRomaneios` e `qryItensRomaneio` em `dmcadastroromaneios.dfm:27` e `:524`.

**INFERIDO** — `dadosfiscais` é a identidade fiscal comum entre NF e cupom; `notas` e `cupons` são especializações alternativas. Cardinalidades, nulabilidade, chaves estrangeiras e possibilidade de órfãos permanecem bloqueadas pelo snapshot autoritativo.

## Leituras e SQL por fluxo

### Mestre, pesquisa e totais

- `qryRomaneios`: lê `romaneios` e usa subconsultas correlacionadas para quitação em `duplicatas`, nomes em `usuarios` e conferência. Essas subconsultas não são modelo para o Laravel; a especificação deve exigir consulta set-based.
- Próximo número: `select romaneios_proximonumero()` (`dmcadastroromaneios.dfm:173`).
- Pesquisa de romaneios: `romaneios` com `fornecedores` (`:194`).
- Transportadores: `fornecedores`, restringindo `tipofornecimento[1] = 'T'` (`:244`, `:280`).
- Lookups: `filiais` (`:318`, `:358`), `tabeladefretes` (`:387`, `:432`) e `seriesfiliais` (`:1032`, `:1072`).
- Totais: soma `romaneiosnotas.valor` não cancelado, separando registros com e sem `entrega`; o total é calculado no dataset (`:464`).

### Itens, documentos candidatos e validações

- A grade de itens parte de `romaneiosnotas` e alcança `motivos`, `dadosfiscais`, `filiais`, `usuarios`, `notas`, `cupons`, `tabeladefretes`, `vfornecedores`, `volumesdadosfiscais`, `contratos`, `cidades`, `bairros`, `produtosdadosfiscais` e `contratosdevolvidos`; calcula situação por `situacao_romaneio_saida(romaneio,dadofiscal)` (`:524`).
- Busca de NF: `notas` + `dadosfiscais`, com cupom, romaneio existente, localização, fornecedor, filial, frete, volumes e produtos; classifica transferência por `ehnotafiscalsaidatransferencia(codigofiscal)` (`:1100`, `:1344`).
- Busca de cupom: fluxo equivalente sobre `cupons` (`:1512`, `:1718`).
- Inclusão múltipla: consulta `dadosfiscais`, `vfornecedores`, `filiais`, `bairros/regioes`, NF/cupom e frete, filtra data/entrega/filiais/clientes e usa `not exists romaneiosnotas` (`:3087`). No Pascal, os selecionados são gravados um a um (`dmcadastroromaneios.pas:2165`); o Laravel deve validar e persistir em lote.
- A leitura da chave pode procurar fora do resultado corrente e resolve filial por CNPJ (`dmcadastroromaneios.pas:2278`). Deve reutilizar `NfeAccessKey`/`NfeAccessKeyInput`, com chave normalizada e consulta parametrizada.
- Para romaneio de transferência, os documentos devem manter a mesma filial de origem e o mesmo destino/cliente; a classificação do primeiro item pode definir o tipo do romaneio (`:2416`).

### Relatórios, financeiro e conferência

- Relatório do romaneio usa mestre/itens. Relatório de produtos lê `produtosdadosfiscais`, `produtos`, `caracteristicas` e `marcas`, apenas produtos a entregar (`dmcadastroromaneios.dfm:2979`).
- O Delphi monta uma lista textual para `where pdf.dadofiscal in (...)` (`dmcadastroromaneios.pas:984`). O Laravel deve usar parâmetros vinculados, `IN`/`= ANY(array)`, comportamento explícito para array vazio e uma única consulta.
- Duplicatas: `duplicatas` com `documentospag.previsao` (`dmcadastroromaneios.dfm:3417`).
- Conferência/histórico alcança `volumesdadosfiscaisconferencia`, `dadosfiscais`, `notas`, `conferencia`, `usuarios` e `filiais`, com tipos ROS/ROP/ROE (`:3635`); a tela chama `ConferirVolumesDadosFiscais` em `fmcadastroromaneios.pas:630`.

## Escritas e efeitos transacionais

### Salvar

**CONFIRMADO** — `GravarRomaneios` (`dmcadastroromaneios.pas:674`) valida mestre e itens, obtém o número na inclusão, propaga-o aos itens e persiste mestre/detalhes. Alterações de recebimento, justificativa ou motivo exigem autorização contextual “CONFIRMAÇÃO DA HORA DA ENTREGA”; o autorizador e o timestamp do servidor são gravados nos itens. Depois chama `Atualizar_situacao_romaneio(:romaneio)`.

Quando data/hora de entrega muda, o legado monta `select ... union all` por documento e atualiza `produtosdadosfiscais`, limitado a produtos entregáveis e ao saldo após `contratosdevolvidos` (`dmcadastroromaneios.dfm:3575`). **DECISÃO PARA A ESPECIFICAÇÃO** — não copiar concatenação: enviar lote tipado e parametrizado (array, `VALUES` ou tabela temporária compatível com PostgreSQL 9.6) e fazer uma atualização set-based.

Se o parâmetro `IncluirDocumentoaPagarnoRomaneio` estiver ativo, `IncluirDocumentosPag` cria ou atualiza `documentospag`, mantém exatamente uma duplicata, usa o evento `Evento_para_pagamento_de_romaneio`, total do romaneio, vencimento/data de lançamento do servidor e define `previsao` conforme ainda exista entrega pendente (`delphi/apps/contaspagar/dmcontaspagar.pas:5461`). Documento quitado bloqueia a alteração financeira.

### Excluir, liberar/reter e receber

- Exclusão bloqueia romaneio com entrega ou duplicata paga; força a exclusão do documento financeiro, apaga itens e mestre (`dmcadastroromaneios.pas:551`).
- Liberar entrega grava usuário e timestamp de trânsito do servidor; reter limpa ambos; as duas operações recalculam a situação.
- Recebimento impede horário anterior ao trânsito e usa timestamp do servidor para a confirmação (`:2577`).
- Inclusão/toggle de cancelamento/exclusão de item exige confirmação nos casos observados e valor quando há entrega (`:1158`).

Esses efeitos devem formar uma fronteira transacional explícita no Laravel. A ordem, locking, idempotência, rollback e convivência com Delphi permanecem para os tickets de schema/modelo transacional.

## Estados observados

**CONFIRMADO** — o código compara: `ABERTA`, `CONFIRMADA PARCIAL`, `CONFIRMADA`, `PASSAGEM`, `EM TRÂNSITO`, `ENTREGUE PARCIAL`, `ENTREGUE`, `ENTREGA NÃO EFETUADA` e `FECHADA`.

**INFERIDO** — as transições canônicas pertencem às funções PostgreSQL `Atualizar_situacao_romaneio` e `situacao_romaneio_saida`; não devem ser reimplementadas até obter suas definições e testes de coexistência.

## Objetos que o snapshot deve verificar

| Grupo | Objetos alcançados |
|---|---|
| Núcleo fiscal/romaneio | `romaneios`, `romaneiosnotas`, `dadosfiscais`, `notas`, `cupons` |
| Pessoas e catálogos | `fornecedores`, `vfornecedores`, `filiais`, `seriesfiliais`, `tabeladefretes`, `motivos`, `usuarios` |
| Localização/contratos | `contratos`, `cidades`, `bairros`, `regioes` |
| Produtos/entrega | `produtosdadosfiscais`, `contratosdevolvidos`, `volumesdadosfiscais`, `volumesdadosfiscaisconferencia`, `conferencia`, `produtos`, `caracteristicas`, `marcas` |
| Financeiro | `documentospag`, `duplicatas` e objetos adicionais alcançados por `GravarContasPagar`/`Perpetrar` |
| Funções | `romaneios_proximonumero()`, `Atualizar_situacao_romaneio(integer)`, `situacao_romaneio_saida(integer,integer)`, `ehnotafiscalsaidatransferencia(...)`, `retirabrancoepipeeascii255(text)` |

Para cada tabela/view: colunas, tipos, defaults, nulabilidade, PK/FK/unique/check, índices, cardinalidade estimada e owner. Para os caminhos de escrita: sequences, triggers (inclusive auditoria `_log`/`_log_new`) e funções completas com dependências. Registrar banco/host lógico, schema, versão PostgreSQL e timestamp da coleta, sem segredos.

## Regras obrigatórias para o SQL Laravel

1. Nenhuma SQL dependente segue para implementação enquanto tabela, coluna, tipo ou função estiver apenas inferido.
2. Proibir N+1: carregar relações/agregados por joins corretos ou consultas em lote; usar `IN`/`= ANY(array)` com binding e tratamento de vazio/limites.
3. Substituir subconsultas correlacionadas repetidas e loops de gravação por operações set-based, preservando cardinalidade e sem duplicar totais.
4. Escolher `INNER JOIN` quando FK/colunas forem obrigatórias e ausência não fizer parte do contrato; manter `LEFT JOIN` somente com nulabilidade/órfãos semanticamente relevantes comprovados pelo snapshot.
5. Toda consulta F6 deve nascer com botão Cancelar e cancelar a query PostgreSQL real, seguindo o mecanismo Laravel validado no ticket próprio.
6. Não usar introspecção em runtime no fluxo de negócio; o Cursor deve conferir antes o snapshot versionado e o checkout atual.

## Divergências e riscos que não devem ser copiados

- **POSSÍVEL BUG LEGADO** — dataset contém `update dadosfiscias` (nome aparentemente incorreto) em `dmcadastroromaneios.dfm:3531`; o código de execução está comentado.
- **POSSÍVEL BUG LEGADO** — montagem textual de listas, filtros e `union all` no Pascal cria risco de SQL inválida/injeção e comportamento indefinido para lista vazia.
- **POSSÍVEL BUG LEGADO** — relatório termina atribuindo novamente `FImprimindoRelatorio := True`, em vez de limpar a flag.
- **DIVERGENTE** — emissão inicial usa data local em alguns caminhos, enquanto trânsito, entrega e financeiro usam relógio do servidor; a fonte temporal deve ser decidida no modelo transacional.
- **DÚVIDA** — `SetImprimirCancelados` tem implementação comentada, embora a flag seja consumida ao selecionar documentos do relatório.

## Resposta do ticket

O módulo se apoia em um agregado mestre–detalhe ligado ao domínio fiscal, entrega/conferência e contas a pagar. As escritas relevantes não terminam em `romaneios`/`romaneiosnotas`: atualizam agenda de produtos, situação por funções PostgreSQL, trânsito/recebimento, documento financeiro/duplicata e conferência. A implementação Laravel deve preservar esses efeitos em operações transacionais e set-based, mas fica bloqueada até o snapshot confirmar estrutura, joins, funções, triggers, sequences e auditoria dos objetos listados.
