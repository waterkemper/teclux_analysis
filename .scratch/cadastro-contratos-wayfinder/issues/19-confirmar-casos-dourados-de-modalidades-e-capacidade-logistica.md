Type: task
Status: resolved
Blocked by: 18

## Question

Quais casos dourados Delphi confirmam combinações válidas de entrega e retirada, unidade/concorrência dos limites de agenda, relação entre frete cobrado/pago/isento, agenda de montagem, cálculo de pendência e execução parcial por item/documento?

Produzir matriz de modalidade, campos obrigatórios, consumo/liberação de capacidade, mudanças permitidas por situação, eventos de execução e evidências SQL/PAS/DFM antes dos specs de agenda e execução quantitativa.

## Answer

Os casos dourados confirmam que entrega e retirada podem coexistir no mesmo Contrato, que o limite regional mede uma operação logística e não unidades de produto, que frete cobrado e custo pago são grandezas diferentes e que montagem possui execução própria. O modelo deve, portanto, ser por item/alocação e produzir apenas um resumo no cabeçalho.

### Modalidades e combinações

- `CONFIRMADO` — O SQL Delphi trata explicitamente `filial_retirada` combinada com itens `entrega='S'`: nesse caso `RetiraLoja=false` e `EntregaPropria=true`; quando nenhum item exige entrega, `RetiraLoja=true`. Evidência: `dmoperacoescontratos.dfm:72-121`.
- `CONFIRMADO` — Entrega expressa é derivada de `tabela_frete.entrega_expressa`, independentemente da filial de retirada. Evidência: `dmoperacoescontratos.dfm:63-69`.
- `DECISÃO NOVA` — A modalidade autoritativa fica em cada item/alocação: `ENTREGA`, `RETIRADA_FILIAL` ou `SEM_OPERACAO`. O cabeçalho expõe resumo derivado `ENTREGA`, `RETIRADA_FILIAL`, `HIBRIDA` ou `SEM_OPERACAO`. Esta decisão substitui o enum exclusivamente global proposto na etapa anterior.
- `DECISÃO NOVA` — `EXPRESSA` é atributo do serviço de entrega, não quarta modalidade. Ela usa SLA/capacidade do provedor escolhido; só consome agenda regional própria quando a configuração do serviço assim indicar.

| Resumo | Itens | Campos obrigatórios | Capacidade de entrega |
|---|---|---|---|
| `ENTREGA` | todos ou parte marcada `ENTREGA`, sem retirada | destino válido; data, período e hora por grupo | uma unidade por grupo agendado |
| `RETIRADA_FILIAL` | todos em retirada | filial de retirada; responsável na execução | não usa limite regional de entrega |
| `HIBRIDA` | ao menos um entregue e um retirado | destino/agenda dos entregues e filial dos retirados | somente os grupos entregues |
| `SEM_OPERACAO` | nenhum exige entrega/retirada | nenhum dado logístico obrigatório | zero |

`CONFIRMADO` — O PAS exige data, período e hora para item entregue (`dmcadastrocontratos.pas:19527-19533`), e o DFM mantém os campos por item (`dmcadastrocontratos.dfm:1087-1453`).

### Unidade e concorrência da agenda

- `CONFIRMADO` — O limite é configurado por região, dia da semana e opcionalmente período, com campo `quantidade`. O endereço específico de entrega prevalece sobre o cadastral. Evidência: `dmcadastrocontratos.dfm:13354-13432` e chamada em `dmcadastrocontratos.pas:20551-20594`.
- `CONFIRMADO` — O total agendado conta **uma entrega**, usando o menor item apenas como marcador, para cada documento fiscal ainda não recebido e para cada contrato `F/P` ainda pendente. Não soma quantidade, peso nem itens. Evidência: comentários e `case` em `dmcadastrocontratos.dfm:13457-13493` e `13568-13632`.
- `CONFIRMADO` — Documento deixa de consumir capacidade quando há romaneio recebido sem justificativa; contrato pendente desconta devoluções e quantidades já documentadas. Evidência: `dmcadastrocontratos.dfm:13547-13560` e `13687-13706`.
- `DIVERGENTE` — No editor Delphi, limite e total são apenas exibidos por `TtecDBText`; não foi localizada reserva atômica nem bloqueio de excesso. Evidência: `fmcadastroprodutoscontrato.pas:1251-1252` e DFM `:2833-2868`.
- `DECISÃO NOVA` — A unidade canônica será uma **parada logística agendada**: mesmo contrato, destino, modalidade, data e período. Vários itens/documentos na mesma parada consomem uma unidade; agendas distintas consomem unidades distintas. Documento fiscal não é a identidade da capacidade.
- `DECISÃO NOVA` — Gravação bloqueia a chave `regiao + data + periodo`, desconta a alocação anterior do próprio grupo e ocupa a nova atomicamente. Retry pela mesma `revision/idempotency key` não duplica. Excesso falha sem alterar a promessa anterior.

Casos de capacidade:

| Caso | Limite/estado | Resultado |
|---|---|---|
| Nova parada | limite 3, ocupadas 2 | ocupa 1; total 3 |
| Concorrência | limite 3, ocupadas 2, duas gravações | uma confirma; outra recebe indisponibilidade |
| Mesmo grupo, 4 itens | mesma data/destino/período | consome 1 |
| Dividir agenda | 2 itens manhã, 2 à tarde | consome 1 em cada período |
| Reagendar | manhã → tarde | libera manhã e ocupa tarde na mesma transação |
| Cancelar/concluir | parada futura ativa | libera capacidade futura; histórico permanece |

### Frete cobrado, pago e isento

- `CONFIRMADO` — `contratos.frete` é valor comercial cobrado do Cliente: entra no total, no rateio dos itens e nos documentos. Evidência: `dmcadastrocontratos.pas:7254-7294`, `8959-9005` e `11651-11687`.
- `CONFIRMADO` — A cotação própria grava o valor selecionado em `frete`, além de fornecedor, serviço, prazo, tabela e faixa de isenção. Evidência: `fmFreteTransportadoras.pas:431-493`.
- `CONFIRMADO` — A faixa de isenção pode reduzir o frete comercial a zero quando o total dos produtos alcança o limiar; preserva `codigofretes_isencao` e a tabela aplicada. Evidência: `fmFreteTransportadoras.dfm:634-680`.
- `CONFIRMADO` — `frete_pago` é custo efetivo de transporte reconhecido por nota de entrada vinculada à chave da NF de saída; ele é somado e atualizado no Contrato. Evidência: `fmMonitorNFeEntradaSefaz.dfm:1273-1324`. Relatórios usam `frete - frete_pago` na margem: `fmVisualizarCustoVenda.pas:1006-1052`.
- `DECISÃO NOVA` — Separar `frete_cobrado`, `frete_custo_estimado`, `frete_custo_real` e `regra_isencao`. Isenção afeta somente o cobrado; não presume custo real zero. Custo real não recalcula parcelas nem total do Cliente.
- `DECISÃO NOVA` — A fotografia da cotação registra valores bruto/cobrado, regra de isenção, provedor, serviço, prazo e assinatura dos itens. Alterar cobrança em `O/R` invalida financeiro; reconhecer custo depois de `F` afeta apenas margem/contabilidade.

### Montagem

- `CONFIRMADO` — O Contrato marca necessidade por item e filial/observação no cabeçalho; a execução real pertence ao módulo `montagens`, com requisições, itens, montador, tabela e `datamontagem`. Evidência: `dmcadastrocontratos.dfm:1087`, `11019-11025`; `dmcadastrorequisicoesmontagens.pas:256`, `684-772`, `1560`; Ficha em `dmfichafinanceira.dfm:2262-2368`.
- `CONFIRMADO` — O Laravel possui cadastro de Tabela de Montagem e projeção das requisições na Ficha, mas não agenda/executa montagem de Contrato. Evidência: `TabelaDeMontagemService`/`TabelaDeMontagensController` e `LegacyFichaFinanceiraContratoTabsRepository.php:976-999`.
- `DECISÃO NOVA` — Capacidade de montagem é separada da capacidade de entrega. Uma entrega pode gerar necessidade de montagem, mas não reserva equipe automaticamente. A futura ordem de montagem referencia item/quantidade/documento e possui agenda, equipe e estado próprios.
- `NÃO LOCALIZADO` — Não foi encontrado limite quantitativo de montagem equivalente a `limites_entregas_regioes`; não inventar compartilhamento de vagas.

### Pendência e execução quantitativa

- `CONFIRMADO` — Em `O/R`, pendência comercial é quantidade menos cancelado, inclusive expansão de compostos quando `conferircomposto`. Evidência: `dmoperacoescontratos.dfm:2066-2229`.
- `CONFIRMADO` — Em `F`, a consulta apresenta toda a quantidade não cancelada; em `P`, desconta documentos autorizados, excluindo nota vinculada e simples faturamento. A agregação atual usa produto/filial e linhagem `primogenito`. Evidência: `dmoperacoescontratos.dfm:659-1050`.
- `DIVERGENTE` — Essa “pendência para entregar” mistura pendência fiscal e física; documento emitido não prova entrega. A agregação por produto/filial também perde identidade de linha, lote, série e parada.
- `DECISÃO NOVA` — Manter projeções separadas: `pendente_documentar`, `pendente_entregar`, `pendente_retirar` e `pendente_montar`. Para execução, `pendente = quantidade elegível - eventos confirmados + eventos estornados`, sempre por identidade de obrigação/alocação.
- `CONFIRMADO` — O comando Laravel atual de entrega na loja exige `P/N`, nota válida e autorização, mas registra um evento/resumo global e impede segunda execução. Evidência: `RegistrarContratoEntregaLojaService.php:18-131` e `ContratoEntregaLojaEligibility.php:7-59`.
- `DECISÃO NOVA` — Preservar esse comando como atalho de “concluir todo o saldo elegível de retirada”. O motor novo aceita eventos quantitativos por item/alocação fiscal, modalidade e parada, com operador/autorizador e idempotency key.

Casos de execução:

| Caso | Elegível | Evento | Pendência resultante |
|---|---:|---:|---:|
| Retirada total simples | 5 documentados | retirar 5 | 0; resumo `concluído` |
| Retirada parcial | 5 documentados | retirar 2 | 3; resumo `parcial` |
| Entregas em dois documentos | 3 + 2 | entregar 3 do primeiro | 2; segundo documento continua pendente |
| Híbrido | 2 para entrega + 3 para retirada | entregar 2 | entrega 0, retirada 3 |
| Estorno operacional | entregue 4, estornar 1 | compensação `-1` | pendente volta a 1; evento original permanece |
| Retry | mesma chave/evento | repetir comando | nenhum efeito adicional |
| Excesso | elegível 2, tentar 3 | nenhum evento | falha sem alterar projeção |

### Mutabilidade e eventos

| Situação | Modalidade/promessa | Agenda/capacidade | Execução |
|---|---|---|---|
| `O` | editável | pode planejar/ocupar conforme política | proibida |
| `R` | editável com `revision`; impacto comercial revalida financeiro/reserva | reagendável atomicamente | proibida |
| `F` | fotografia comercial congelada | reagendamento operacional permitido por capability | somente preparação; execução que exige documento aguarda cobertura fiscal |
| `P/N` | congelada para alocações documentadas | reagendar apenas pendências | eventos parciais, conclusão e estorno guardado |
| `C` | somente leitura | liberar futuras | apenas compensação autorizada |

- `DECISÃO NOVA` — Eventos mínimos: `parada_agendada`, `parada_reagendada`, `parada_cancelada`, `saida_para_entrega`, `entrega_confirmada`, `retirada_confirmada`, `montagem_agendada`, `montagem_confirmada` e respectivos estornos. Promessa/agendamento não movimentam estoque nem alteram cobertura fiscal.
- `CONFIRMADO` — A Consulta Laravel já normaliza e persiste diff por produto/filial, valida data/período/hora e propaga agenda ao fiscal, mas não consulta/reserva capacidade. Evidência: `ConsultaContratosGravarAlteracaoEntregaDiff.php` e `ConsultaContratosGravarAlteracaoService.php:126-280`.
- `DECISÃO NOVA` — Cadastro e Consulta devem chamar o mesmo serviço de promessa/agenda. Propagação a documentos é projeção idempotente; nenhuma tela edita `dadosfiscais` diretamente.

## Spec boundary

- **Pronto para `$to-spec`:** promessa logística em `O/R`, agora com modalidade por item e resumo híbrido.
- **Pronto para `$to-spec`:** adapter de cotação do Contrato, distinguindo cobrado, estimado, real e isenção.
- **Pronto para `$to-spec`:** agenda compartilhada Cadastro/Consulta com parada logística, capacidade e concorrência.
- **Pronto para `$to-spec` independente:** execução quantitativa de entrega/retirada e integração do atalho de entrega em loja.
- **Ainda separado:** ordem, agenda e execução de montagem; exige mapear o módulo `montagens` como esforço próprio.

## Próximo passo

A próxima fronteira numérica é [Integrar relacionamento, questionários, fotos e anexos ao shell](20-integrar-relacionamento-questionarios-fotos-e-anexos-ao-shell.md).
