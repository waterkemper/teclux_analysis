# Pesquisa — SQL, domínio e efeitos da Confirmação por Romaneios Delphi

## Fontes e método

Fontes primárias:

- `C:\projetos.vcl\apps\interlojas\dmconfirmarromaneiostransferencia.pas`;
- `C:\projetos.vcl\apps\interlojas\dmconfirmarromaneiostransferencia.dfm`.

O inventário preserva a regra observada, mas não copia SQL concatenado, consultas por linha ou commits parciais. Nulabilidade, índices, constraints, triggers e definições completas devem ser confirmados no snapshot autoritativo do ticket seguinte.

## Fluxo de leitura F6

**CONFIRMADO** — `qryromaneiosTransferencias` usa uma consulta mestre por `romaneio)/Item fiscal. A base é:

`romaneios r INNER JOIN romaneiosnotas rn INNER JOIN dadosfiscais df INNER JOIN notas n INNER JOIN filiais f`, pelas condições `r.numero = rn.romaneio`, `rn.dadofiscal = df.numero`, `df.numero = n.dadofiscal) e `df.filialemissao = f.codigo) [DM-DFM:26-105].

Ela projeta:

- Romaneio, dado fiscal, filial/nome emissora, emissão, valor, observações, série/número e chave NF-e;
- tipo e situação do Romaneio, flag de Romaneio de Passagem, cliente e venda-transferência;
- volumes da primeira linha, soma de volumes, volumes lidos por conferência e soma total por Romaneio;
- situação do Romaneio inteiro e situação por Item via `situacao_romaneio_entrada(r.numero)` e `situacao_romaneio_entrada(r.numero, rn.dadofiscal));
- seleção transitória derivada de situação `CONFIRMADA) e totalização por janela [DM-DFM:37-91].

**CONFIRMADO** — Filtros da consulta:

1. macro de data opcional sobre `df.data), montada por concatenação em `MontaIntervaloData) [DM-PAS:868-883];
2. destino: `df.cliente = :cliente), ou, para Romaneio de Passagem, dado fiscal presente em conferência `ROP) conferida [DM-DFM:107-129];
3. `df.tipocliente = 'L');
4. códigos fiscais permitidos, venda-transferência ou função `eHNotaFiscalSaidaDevolucao);
5. `df.situacao = 'N');
6. situação do Romaneio em `EM TRÂNSITO`, `PASSAGEM) ou `ENTREGUE PARCIAL);
7. ausência de `notaspag) com `dadofiscalreferenciado = df.numero) e `vendatransferencia) verdadeira;
8. produtos fiscais e pedidos filiais finalizados devem possuir quantidades iguais por produto, e deve existir ao menos um pedido finalizado [DM-DFM:130-176].

O parâmetro `:cliente) recebe `FilialBase) [DM-PAS:539-549].

**POSSÍVEL BUG LEGADO** — A própria SQL contém comentário dizendo que ainda faltaria impedir o casamento saída/entrada, embora também tenha `NOT EXISTS) para `notaspag) [DM-DFM:107-109,145-147]. O Laravel deve tratar a elegibilidade como predicado único e revalidá-la no comando; não deve confiar no comentário nem em uma seleção antiga.

## Consultas de detalhe e passagem

**CONFIRMADO** — Produtos do dado fiscal corrente são consultados por `:dadofiscal), juntando `produtosdadosfiscais), `produtos) e `caracteristicas), com subconsultas de descrição das grades [DM-DFM:289-321]. O DataModule chama essa consulta no `AfterScroll) de cada Romaneio [DM-PAS:897-902].

**POSSÍVEL BUG LEGADO** — O padrão `AfterScroll) é N+1. O Laravel deve carregar Produtos de todos os dados fiscais visíveis por `IN), `= ANY(array)) ou `unnest), agrupando em memória e sem consulta durante troca de linha/renderização.

**CONFIRMADO** — `qryromaneiosPassagem) repete a base de Romaneios/Notas/Dados Fiscais, calcula a situação e usa `df.cliente <> :cliente) como flag de passagem; mantém filtros fiscais, de situação, de duplicidade e de pedidos [DM-DFM:1681-1819]. A busca por chave injeta uma macro `df.chv_nfe = '...') e usa `FilialBase) [DM-PAS:1096-1104].

**DIVERGENTE** — O legado copia o registro encontrado na consulta de passagem para o dataset principal, inclusive abrindo-o com condição falsa quando necessário [DM-PAS:1129-1139]. No Laravel, isso deve ser um resultado explicitamente tipado ou comando transacional, nunca uma mutação implícita da lista de consulta.

## Fluxo de confirmação

**CONFIRMADO** — `ConfirmaTransferencia) percorre todos os registros marcados. Para cada Item:

1. recarrega dados fiscais e produtos por `dadofiscal);
2. recarrega vencimentos para venda-transferência;
3. inicializa datasets temporários de `notaspag), produtos, documentos, duplicatas e movimentos;
4. cria a Nota Fiscal de Entrada em `notaspag), com sequência `notaspag_proximocodigo()), origem fiscal, filial destino, chave, referência ao dado fiscal de saída, `vendatransferencia = true) e situação `N);
5. insere produtos e chama `AtribuirDadosProdutos) para materialização cadastral/fiscal;
6. para transferências, cria Documento a Pagar e duplicatas;
7. calcula impostos;
8. bloqueia estoque, cria movimentos `STC) e `FTR), e atualiza pedidos filiais;
9. persiste os datasets e chama `Atualizar_situacao_romaneio(:romaneio)) [DM-PAS:460-537].

**CONFIRMADO** — Documento a Pagar usa `documentospag_proximonumero()) e o evento `ParSistema.EventoPagtoDuplTransferenciaentreEmpresa). Cada vencimento cria uma duplicata; transferências/crédito marcam a duplicata como autorizada e paga na data do vencimento [DM-PAS:979-1057].

**CONFIRMADO** — Produtos de entrada recebem `filial = FilialBase), `filial_estoque = FilialEstoque), Produto, dado fiscal e número de produto da origem, depois passam por `AtribuirDadosProdutos) e são gravados em `produtosnotaspag) [DM-PAS:731-840].

**CONFIRMADO** — Estoque é selecionado com `FOR UPDATE) por pares Produto/Filial e os movimentos são criados com número de `movimentos_proximonumero()). O fluxo gera `STC) para estoque corrente e `FTR) para futuro, conforme saldo futuro [DM-DFM:721-760,907-914]; [DM-PAS:430-458,571-637].

**POSSÍVEL BUG LEGADO** — `BloquearEstoque) constrói a cláusula por concatenação de valores dos produtos e filiais [DM-PAS:430-458]. O Laravel deve usar binds e carregar/bloquear o conjunto em ordem determinística, sem SQL textual produzido por dados.

**POSSÍVEL BUG LEGADO** — `AtualizarPedidosFiliais) consulta os pedidos por Item e percorre produtos e pedidos em loops aninhados, marcando pedidos como `D) e abatendo quantidade; `ProdAnt) não é atualizado de forma observável e o acumulador pode atravessar produtos [DM-PAS:386-428]. O Laravel deve agregar por chave Produto/Filial e atualizar em lote, falhando explicitamente quando faltar ou sobrar quantidade.

## Transação e atomicidade observadas

**CONFIRMADO** — Os datasets usam a mesma conexão/transação `dtmTecSoft.tstTecSoft), com `CachedUpdates) em várias tabelas [DM-DFM:384-416,684-744,761-799]. `Perpetrar([...])) é chamado por Item após pedidos, Nota, produtos, financeiro e movimentos; depois o código chama `Atualizar_situacao_romaneio) e outro `Perpetrar([])) [DM-PAS:510-520].

**DÚVIDA** — O contrato exato de `Perpetrar), seus commits/rollback e a transação de funções/triggers não está definido nestes arquivos. Não inferir atomicidade total da seleção a partir do compartilhamento do componente de transação.

**POSSÍVEL BUG LEGADO** — A confirmação percorre vários Itens selecionados e persiste cada um dentro do loop; falha posterior pode deixar confirmações anteriores persistidas. O contrato Laravel deve escolher explicitamente transação atômica por Item ou por comando, locks determinísticos, revalidação sob lock, idempotência e auditoria.

## Matriz fluxo → efeitos

| Fluxo | Leituras principais | Escritas/efeitos | Risco para Laravel |
|---|---|---|---|
| F6 | Romaneios, itens, dados fiscais, notas, filiais, volumes, conferência, produtos e pedidos | Nenhuma escrita intencional; seleção é transitória | Macro concatenada, subconsultas correlacionadas e paginação ausente |
| Produtos | Produtos fiscais, produtos, características e grades | Nenhuma escrita | N+1 por `AfterScroll) |
| Conferir Produtos | Dado fiscal e produtos correntes | Motor `NST) externo ao DataModule | Contrato do ConferenceEngine e batching |
| Conferir Volumes | Romaneios, itens, volumes e conferência | Motor `ROE)/`ROP) externo ao DataModule | Distinção passagem/normal e reload seguro |
| Confirmar | Dados fiscais, produtos, vencimentos, natureza, estoque, pedidos | `notaspag), produtos de entrada, documentos, duplicatas, movimentos, pedidos e situação do Romaneio | N+1, lock parcial, efeitos financeiros e idempotência |
| Passagem | Dado fiscal/chave, destino e Romaneio | Cópia no dataset legado; efeito final depende de confirmação | Não misturar leitura com mutação |

## Objetos que o snapshot deve confirmar

Tabelas: `romaneios), `romaneiosnotas), `dadosfiscais), `notas), `filiais), `volumesdadosfiscais), `volumesdadosfiscaisconferencia), `produtosdadosfiscais), `produtos), `caracteristicas), `grades), `pedidosfiliais), `notaspag), `produtosnotaspag), `venctosdadosfiscais), `documentospag), `duplicatas), `estoques), `movimentos), `naturezaspadrao) e `naturezas).

Funções/procedures/sequences: `situacao_romaneio_entrada), `Atualizar_situacao_romaneio), `eHNotaFiscalSaidaDevolucao), `notaspag_proximocodigo()), `documentospag_proximonumero()), `movimentos_proximonumero()), funções de conferência e triggers de todas as tabelas escritas.

O ticket de schema deve confirmar nulabilidade, PK/FK/unique, índices por `dadofiscal), `romaneio), `chv_nfe), Produto/Filial, pedidos e `notaspag.dadofiscalreferenciado), além da autoridade das funções e triggers.

## Regras de redesenho Laravel

- F6 deve ser parametrizada, server-side e cancelável desde o início; não copiar macros nem valores concatenados.
- Detalhes de uma página devem ser enriquecidos em lote; não executar query em `AfterScroll), loops de linhas ou renderização.
- Confirmação deve revalidar todos os dados selecionados sob locks, usar `IN)/`ANY(array))/`unnest) para conjuntos, e tratar arrays vazios explicitamente.
- Usar `INNER JOIN) somente quando schema e contrato confirmarem relação obrigatória; `LEFT JOIN) apenas para relação opcional necessária à visibilidade.
- Preservar funções/triggers legados confirmados, mas não criar uma segunda autoridade Laravel para situação, sequences ou efeitos financeiros.
- Não testar driver nem `hashtablefs); testar contratos, SQL contra PostgreSQL autoritativo, query count, locks, rollback, idempotência e resultados observáveis.
