# Pesquisa SQL e batching — Confirmação por Notas

## Fontes e consulta mestre

Fontes primárias: C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.pas/.dfm e fmconfirmarnotastransferencia.pas/.dfm.

qryNotasTransferencias projeta dadofiscal, filial emissora, data, valor, observações, chave NF-e, código fiscal, venda-transferência, série/número, nome da filial, primeiro volume, último romaneio, situações de romaneio e seleção transitória (dmconfirmarnotastransferencia.dfm:24-72). O grid exibe filial, nome, série, número, chave, emissão, valor, seleção, romaneio e situações (fmconfirmarnotastransferencia.dfm:168-363).

Joins: dadosfiscais d, notas n e filiais f (DFM:73-84). Filtros: cliente=:FilialBase (DFM:76; PAS:498-505), tipocliente L, situação N (DFM:77-85), CFOP módulo 1000 em 150,151,152,155,156,408,409,552,557 ou venda-transferência/devolução (DFM:79-82), existência de pedido F (DFM:123-124) e ausência de divergência entre somas por produto de produtosdadosfiscais e pedidosfiliais F (DFM:102-126).

O período usa macro textual: igualdade com um extremo, BETWEEN inclusivo com ambos, nenhum filtro quando vazios (PAS:827-841). Laravel deve usar binds date e >=/<=. Não há ORDER BY mestre (DFM:24-127): fixar ordem determinística com chave única final; colunas/direções do grid por allowlist.

Busca por chave/número é Locate local. Chave remove não dígitos; número tenta serie;numero embora o rótulo diga filial/número, depois numero (fmconfirmarnotastransferencia.pas:311-354). Se virar filtro backend, usar igualdade com bind; a divergência série/filial precisa de decisão funcional.

## Mestre–detalhe

qryProdutosTransferencia filtra dadofiscal=:dadofiscal, junta produto/característica, projeta número, códigos, descrição, quantidade, preço e grades, ordenando pn.numero (dmconfirmarnotastransferencia.dfm:210-250). O grid usa número, produto, descrição, grades, quantidade e preço (fmconfirmarnotastransferencia.dfm:466-597).

Não há MasterSource: AfterScroll reexecuta o detalhe corrente (PAS:856-861), N+1 se copiado para web. Laravel deve carregar sob demanda uma nota ou todas as notas visíveis numa única consulta whereIn(pd.dadofiscal, ids), selecionando dadofiscal, ORDER BY dadofiscal,numero e agrupando por chave. Trocar subconsultas escalares de grades por dois LEFT JOIN. IN não preserva ordem mestre.

## Datasets da confirmação

O loop de notas marcadas está em PAS:412-487.

| Dataset | Relação | Fonte |
|---|---|---|
| qryDadosFiscais | d.*, nota/estado; d.numero=:dadofiscal | DFM:835-865 |
| qryProdutosDadosFiscais | pd.* por dadofiscal | DFM:970-993 |
| qryVenctosDadosFiscais | vdf.* por dadofiscal, condicional | PAS:418-423; DFM:1151-1171 |
| qryFilialOrigem | CNPJ/IE/ICMS por origem | PAS:625-688; DFM:1055-1081 |
| qryPedidosFiliais | pedidos F por dadofiscal | PAS:327-369; DFM:1004-1031 |
| qryNaturezasPadrao | natureza/dados fiscais, uma vez | PAS:410; DFM:1093-1115 |
| qryEstoqueBloqueio | produto/filial/estoque/futuro FOR UPDATE | DFM:640-662; PAS:371-399 |

Destinos vazios/atualizáveis: notaspag, produtosnotaspag, movimentos, documentospag e duplicatas (DFM:303-334,592-615,680-716,1192-1206,1350-1366). Duplicatas vinculam numero=documentopag (DFM:1357). Funções de próximo código são chamadas por nota, movimento e documento (PAS:625-630,844-854,926-934). Romaneio chama incluirconferenciadocumentos duas vezes e Atualizar_situacao_romaneio uma vez (PAS:452-478; DFM:1480-1523).

## N+1 e complexidade

1. Detalhe por navegação (PAS:856-861).
2. Cabeçalho, itens e vencimentos dentro do loop (PAS:416-423).
3. Filial e pedidos por nota (PAS:625-687; 327-369).
4. Geradores por nota/documento/movimento (PAS:628-630,847-849,931-933).
5. AtribuirDadosProdutos dentro do loop pode esconder leituras por item; auditar (PAS:690-798).
6. Pedidos usam produto × pedido, O(P×F) (PAS:338-367); indexar por chave.
7. Movimentos percorrem itens duas vezes e Locate estoque por item (PAS:530-590); pré-carregar pares.
8. O mestre repete três vezes último romaneio e usa subconsultas correlacionadas (DFM:37-70,102-124); calcular uma vez por CTE/janela ou LEFT JOIN LATERAL.

## Contrato set-based Laravel

Pré-agregar produtos/pedidos por (dadofiscal,produto) e comparar com NOT EXISTS, inclusive chaves só de um lado. O join interno legado não detecta ausências: caracterizar antes de preservar/corrigir. Último volume/romaneio são joins laterais/CTEs.

Para IDs pequenos/médios limitados: normalizar inteiros, deduplicar, tratar vazio e usar whereIn. O projeto carrega filhos de vários contratos em uma consulta, com ordem explícita (laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/LegacyContratoImpressaoRepository.php:139-153).

Para cardinalidade maior: coluna = ANY(?::bigint[]) ou JOIN unnest(?::bigint[]) com bind criado de inteiros validados. Se PDO exigir literal de array, gerar após conversão estrita; nunca usar strings do request. Declarar limite funcional (recomendação inicial mensurável: 1.000 notas/comando). Não executar query por item/chunk silenciosamente.

O legado concatena pares produto/filial no SQL (PAS:371-398), proibido. Para poucos: WHERE (e.produto,e.filial) IN ((?,?),(?,?)) FOR UPDATE. Para muitos: JOIN unnest(?::bigint[],?::integer[]) WITH ORDINALITY AS wanted(produto,filial,ord), unir pelas duas colunas, ORDER BY ord, FOR UPDATE OF e. Validar comprimentos, vazio e tipos; deduplicar pelo par preservando primeira ordem. Nunca produto=ANY(...) AND filial=ANY(...), que cria produto cartesiano. Resolver set-based a filial física pela regra virtual (DFM:652-662).

Confirmação recebe IDs, reconsulta/autoriza e transaciona. Por conjunto: uma leitura de cabeçalhos/filiais, uma de produtos, zero/uma de vencimentos, uma de pedidos F e uma de lock dos pares. Associar por chave. IN/ANY não ordenam: WITH ORDINALITY ou mapa de posições; filhos ORDER BY dadofiscal,numero.

## Testes obrigatórios

- Caracterizar filtros, período inclusivo, CFOP/venda/devolução, pedido F e quantidades iguais/divergentes/ausentes.
- Ordem estável com empate e allowlist.
- Com 1 e 50 notas, query count de detalhe idêntico; itens corretos/ordenados.
- Com 1 e N notas, no máximo uma leitura por conjunto: dados, produtos, vencimentos, pedidos, filiais e estoques.
- Usar DB::enableQueryLog(), filtrar tabelas e afirmar teto constante; o projeto testa binds/teto assim (laravel/backend/tests/Feature/Interlojas/ConsultaRequisicoes/ConsultaRequisicoesConsultarTest.php:119-169).
- Vazio, duplicados, ordem não natural, limite/acima, e IDs ausentes do texto SQL.
- Pares (P1,F1),(P2,F2) nunca selecionam cruzados.
- Concorrência no mesmo par: lock, atomicidade, nenhuma confirmação parcial.

## Decisão

Não reproduzir dataset/AfterScroll. Leitura é página/lote; confirmação é conjunto validado. Cada relação é carregada uma vez por conjunto, com binds, associação por chave e ordem explícita. whereIn atende listas usuais; ANY(array)/unnest atende alta cardinalidade e pares.
