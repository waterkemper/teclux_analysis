# Dossiê de paridade das abas — Consulta de Estoques

## Objetivo

Corrigir exclusivamente as abas **Estoques, Acumuladores, Financeiro, Preços/Preços por Cargo e Pedidos** da Consulta de Estoques Laravel para equivalência funcional com o legado, preservando a implementação atual que já funciona: geração da consulta, resultado mestre, rota lazy, identidade Produto+Filial, cancelamento de requests, AuthZ, mutações auditadas, motor de preços e componentes comuns.

O dossiê é autocontido. O implementador não precisa acessar Delphi.

## Estado atual reutilizável

- Rota lazy única por Produto+Filial+detalhe e serviço de dispatch.
- Filiais autorizadas validadas no servidor.
- Hook com `AbortController`, chave de geração e descarte de resposta obsoleta.
- Capabilities de acesso, gerencial, preços, localização/limites e última compra.
- Calculador de saldos, motor de preços, formatadores, painéis e mutações auditadas.
- Estoques possui DTO nominal; as demais abas ainda usam contratos frouxos.

## Gaps confirmados

| Aba | Gap atual | Correção decidida |
|---|---|---|
| Estoques | resumo de pedidos global/bruto; preços incompletos e sem proteção server-side; campos gerenciais no payload público | pedidos pendentes por Filial ou consolidado explícito; completar metadata de preço; aplicar capability; separar Financeiro |
| Acumuladores | usa operação atual de `tiposmovimentos`, lê tudo e agrega em PHP | usar `movimentos.operacao`, agregar mensalmente no PostgreSQL por Produto+Filial |
| Financeiro | fornecedor/CST/CSOSN ausentes ou hardcoded; risco de nota global | resolver última nota/fornecedor/fiscal da Filial selecionada; manter mutação segura Produto+Filial |
| Preços por Cargo | flags existem, mas `cargos=[]`; UI ignora modo; endpoint sem capability | calcular `estoques_preco(produto, filial, markup)`, discriminar modo e proteger todo preço |
| Pedidos | quantidade original chamada de pendente; Filial omitida; notas provisórias | função de saldo legado; visão multi-Filial autorizada; NFe pendentes reais em `nsus/nsus_prod` |

## Contrato transversal

Fluxo do detalhe: validar detalhe, módulo, Filial, linha Produto+Filial e capability antes de consultar repository. Cada DTO repete Produto+Filial. Parâmetros são resolvidos no servidor para a Filial selecionada; não usar a Filial ativa como fallback oculto.

Capabilities:

- Estoques e Pedidos: acesso ao módulo.
- Painel/aba de preços: `can_visualizar_precos` no servidor e React.
- Financeiro e Acumuladores: `viewGerencial`.
- Última compra: `viewGerencial` + `can_alterar_ultima_compra`.
- Localização/limites: `can_alterar_minmax_localizacao`.

Não usar `Schema::hasTable/hasColumn` para transformar falha estrutural em vazio. `null` é ausência; zero/false são valores. Números seguem numéricos no JSON, datas ISO, códigos/chaves como texto.

## Estoques

Saldos:

- estoque venda = `emestoque + reservado + reservaprevia`;
- estoque total = estoque venda + `transito + demonstracao + conserto + danificada`;
- custo médio = `financeiro / estoque_total`, ou zero se denominador zero;
- `futuro` e `estoquefisico` não entram nos cálculos.

A aba mostra Preços e Quantidades. Localização, Sublocalização, Mínimo e Máximo permanecem no grid mestre; Financeiro/Custo pertencem exclusivamente ao detalhe gerencial.

Preço normal/promocional usa motor compartilhado, Filial selecionada e colunas da Filial. Completar alteração do normal, descrição e validade. Promoção vencida tem valor nulo. Sem capability, não entregar valores reais.

O resumo Pedidos é pendente da Filial selecionada. Se **Filiais Independentes** estiver ativo, consolidar somente Filiais autorizadas e informar `pedidos_modo` e `filiais_consideradas`.

## Acumuladores

Fonte `movimentos`, filtro Produto+Filial, bucket mensal. Venda usa posição 13 de `movimentos.operacao`; Compra, posição 14. Somente `+/-` participa.

Sinais literais:

- Venda `+`: `abs(quantidade)`; Venda `-`: `-quantidade`.
- Compra `+`: `quantidade`; Compra `-`: `-abs(quantidade)`.

Agregação condicional ocorre no banco, ordenada por mês decrescente. DTO: Filial, `ano_mes` YYYY-MM, Compras e Vendas. UI: Filial, MM/YYYY, Compras e Vendas. Sem totais gerais ou meses artificiais.

## Financeiro

Exibir Custo médio, Financeiro, IPI, Margem final, datas/quantidade de compra, última entrada/venda, valor de última compra, preços com/sem ICMS e última compra com ICMS.

Para CSOSN atual 101/102: `valorultimacompra + (precocomicms - precosemicms)`; demais códigos mantêm o valor. Margem: `((preco_efetivo - custo_medio) / preco_efetivo) * 100`, nula sem preço/preço zero.

Resolver a última nota de entrada de compra do Produto na Filial selecionada, excluindo fornecedor `L`, por relacionamento `produtosnotaspag -> notaspag -> fornecedores`. Retornar fornecedor/nosimples, CST/CSOSN da empresa e CST/CSOSN da NF do fornecedor, além da situação tributária atual do Produto. Nunca buscar nota de outra Filial.

Edição de última compra continua Produto+Filial, auditada, idempotente e protegida; não copiar update global por Produto.

## Preços por Cargo

Parâmetro false: modo convencional. Parâmetro true: modo Cargo substitui o convencional. Preço por Cliente é adicional e não deve ser fingido como concluído.

Fonte: `produtoscargos` + `cargos` + existência de `estoques(produto, filial)`. Valor: `estoques_preco(produto, filial, produtoscargos.markup)`. Filial é a selecionada. Colunas Cargo, Descrição Cargo e Valor; ordenação descrição+código. Promoção não entra no modo Cargo.

DTO discriminado `modo: cargo|convencional`. Sem vínculos: vazio de negócio. Vínculo com valor nulo permanece visível com `—`.

## Pedidos

Pedidos comerciais: `produtospedidos` + `pedidos`, situações A/P, Filial de entrega autorizada. Pendente é `pedidos_estoquepedido_semnotaparcial(produto, filialentrega, pedido)` e somente resultado positivo permanece. Mostrar Pedido, Filial, pendente e previsão `coalesce(pp.dataentrega,p.entrega)`; totalizar pendente.

Notas pendentes são documentos SEFAZ não lançados: `nsus` + `nsus_prod`, fornecedor pelo CNPJ emitente, Filial pelo CNPJ destinatário, reconhecimento do Produto por cadastro do fornecedor ou código de barras, XML existente, não presente em `notaspag`, não cancelada por situação/evento 110111. Mostrar Filial, Fornecedor, Série, Número, Situação e Emissão.

Pedido navega por número interno e rota nomeada. NFe pendente usa identidade `filial+tipo+nsu+chave`; não possui ID interno de nota e não abre histórico fiscal incorreto.

## Critérios globais de aceite

- Nenhum dado sensível sai sem capability.
- Nenhuma Filial não autorizada aparece em payload, total ou consolidação.
- Resposta atrasada nunca substitui identidade ativa.
- Todos os detalhes possuem DTO nominal e componentes sem `Record<string, unknown>`.
- Vazio de negócio difere de erro estrutural.
- Funções PostgreSQL e SQL legado crítico têm testes de integração em banco compatível.
- Testes frontend cobrem rótulos, colunas, null/zero, modos, capabilities, links e vazios.

## Fontes do levantamento

- Inventário Laravel e contratos decididos nos tickets `01` a `08` deste mapa.
- Legado auditado em `fmconsultaestoque.pas/.dfm`, `dmconsultaestoque.pas/.dfm` e navegação auxiliar de notas.
