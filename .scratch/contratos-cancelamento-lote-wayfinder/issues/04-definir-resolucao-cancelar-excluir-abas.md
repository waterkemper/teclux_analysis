# Definir a resolução Cancelar × Excluir × abas Orçados/Reservados/Faturados

Type: grilling
Status: resolved
Blocked by: 01-documentar-fluxo-cancelamento-lote-delphi, 03-inventariar-estado-laravel

## Question

Qual é o comportamento canônico Laravel para resolver, por aba e por Contrato selecionado, se a operação disponível é Cancelar, Excluir ou ambas, conforme `ExclusaoContrato` (`E/C/P/Nenhuma`) e a Situação (`O/R/F`)? Como isso se relaciona com a matriz de comandos já fixada no ticket 21 (`CancelarContrato` em `O/R/F`, `ReverterFaturamentoContrato` em `F`)?

## Answer

- `DECISÃO NOVA` — a superfície Laravel é **uma única tela/componente** (não três telas separadas como no Delphi), mas o filtro de Situação continua **exclusivo** — um controle de escolha única (segmented/radio), nunca multi-seleção — replicando fielmente a exclusividade de `rgbOperacao`. Não existe, e não deve existir, seleção/execução misturando Situações diferentes na mesma leva: o filtro sempre restringe a consulta a uma Situação por vez, então a resolução por item nunca precisa lidar com lote heterogêneo.
- `DECISÃO NOVA` — dentro da Situação filtrada, a ação disponível por item Contrato segue exatamente o Delphi:
  - Orçado: Cancelar e/ou Excluir, resolvidos por `ExclusaoContrato` (`E` → só Excluir; `C` → só Cancelar; `P` → usuário escolhe por confirmação; ausente/outro → nenhuma ação, por precaução, já que o Delphi trata isso implicitamente como bloqueio de UI).
  - Reservado: só Cancelar, sempre, independente do parâmetro.
  - Faturado: só Cancelar, sempre, independente do parâmetro.
  - Nenhuma combinação oferece Exclusão fora de Orçado, replicando o comportamento confirmado no ticket [Documentar o fluxo completo da tela de Cancelamento em lote no Delphi](01-documentar-fluxo-cancelamento-lote-delphi.md).
- `DECISÃO NOVA` — a confirmação final deve declarar a ação por item antes de executar (ex.: "N contratos serão cancelados"), nunca uma confirmação genérica de operação como a atual do Delphi — mas, como o lote é sempre de uma única Situação, a ação é homogênea dentro de uma mesma execução quando o parâmetro é `E` ou `C`; só varia por item quando o parâmetro é `P` e o usuário decide por Contrato (ou por lote inteiro — este detalhe fica para o ticket [Definir a experiência da tela](08-definir-experiencia-tela-cancelamento-lote.md)).
- `DECISÃO NOVA` — `ReverterFaturamentoContrato` **fica fora do escopo** desta tela: o Delphi nunca ofereceu essa transição aqui (só no F6 inline do Cadastro principal, já coberto pelo ticket 21). Registrado em Out of scope no `map.md`.
- `DECISÃO NOVA` — comando a reaproveitar para Cancelamento: **`CancelarContrato`**, exatamente como decidido no ticket 21 (mesmas guardas financeiras/fiscais/logísticas), invocado individualmente por item dentro de uma orquestração de lote — nunca uma segunda implementação paralela da regra de cancelamento (foi exatamente essa duplicação, com guarda de devolução/troca faltante, que os tickets [Documentar o fluxo completo da tela de Cancelamento em lote no Delphi](01-documentar-fluxo-cancelamento-lote-delphi.md) e [Mapear integridade e elegibilidade da Exclusão física em lote](02-mapear-integridade-exclusao-lote.md) encontraram no Delphi).
- `DECISÃO NOVA` — para Exclusão física de Orçado, **não existe comando decidido em nenhum mapa anterior** (o ticket 21 tratou só Cancelamento/Reversão do Cadastro principal). Este mapa precisa propor um comando novo (nome de trabalho: `ExcluirContratoOrcado`) — fica para o ticket [Definir o contrato seguro de Exclusão física em lote](06-definir-contrato-exclusao-fisica-lote.md).
- `DECISÃO NOVA` — atomicidade por item (não por lote inteiro), com resultado detalhado por item — decisão de concorrência/relatório fica detalhada no ticket [Definir Permissões, Autorizações, Auditoria e concorrência do lote](07-definir-permissoes-auditoria-concorrencia-lote.md), mas a orientação geral já fica fixada aqui: cada item é sua própria transação, uma falha não aborta os já processados, e o resultado deve reportar sucesso/falha por Contrato — nunca a mensagem genérica única do Delphi.
