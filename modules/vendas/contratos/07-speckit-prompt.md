# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a promessa logística, o endereço, a modalidade por item, a filial de retirada/montagem e a cotação de frete do Cadastro de Contratos — Etapa 4 (Logística), primeiro dos dois specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), o vínculo de Cliente (`02-speckit-prompt.md`), o motor comercial (`03-speckit-prompt.md`) e a proposta financeira (`04-speckit-prompt.md`), cujo contrato de invalidação por mudança de frete este spec aciona.

Este spec **não depende** da reserva nem dos lotes/conferência (`05-speckit-prompt.md`, `06-speckit-prompt.md`) e pode avançar em paralelo com eles: promessa e agendamento não movimentam estoque. Não implemente nesta etapa a capacidade/agenda de parada logística nem a execução quantitativa de entrega/retirada — isso é o segundo spec da Etapa 4 (`08-speckit-prompt.md`, ainda não escrito). Não reimplemente o registro de entrega em loja já existente (`RegistrarContratoEntregaLojaService`); apenas garanta que este spec não colide com ele.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt, incluindo as matrizes douradas, como o pacote funcional legado autoritativo — trate-as como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real, incluindo o que a geração de Contrato a partir de Orçamento e a Consulta de Contratos já fazem; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- **modalidade autoritativa por item/alocação** — `ENTREGA`, `RETIRADA_FILIAL` ou `SEM_OPERACAO` — com **resumo derivado no cabeçalho**: `ENTREGA`, `RETIRADA_FILIAL`, `HIBRIDA` ou `SEM_OPERACAO`; entrega e retirada podem coexistir no mesmo Contrato;
- **endereço de entrega** como fotografia própria do Contrato (copiada do Cliente ou do Orçamento na criação), editável sem alterar o cadastro mestre do Cliente, com validação dependente da modalidade;
- **filial de retirada** (obrigatória quando algum item está em `RETIRADA_FILIAL`) e **filial de montagem** no cabeçalho;
- **captura de necessidade de montagem** por item (marcação + observação/filial) — sem agenda, equipe, ordem ou execução;
- um **comando único de promessa** (data/período/hora por item entregável, "aplicar a todos") compartilhado por Cadastro e Consulta, generalizando o diff já existente;
- validações por modalidade: `ENTREGA` exige ao menos um item entregável com destino válido e data/período/hora; `RETIRADA_FILIAL` exige filial de retirada; `SEM_OPERACAO` não exige dado logístico;
- um adapter `ContratoFreightQuoteAdapter` sobre o `FreightQuoteEngine` genérico já existente, com origem fixada na filial de venda acordada (não por origem de estoque do item);
- a separação `frete_cobrado` (comercial, integra total/rateio/assinatura financeira), `frete_custo_estimado`, `frete_custo_real` (pós-`F`, não recalcula parcelas) e `regra_isencao`, e a decisão de como essas grandezas se encaixam na fotografia genérica de cotação hoje compartilhada com Orçamento;
- invalidação da fotografia de frete por mudança de CEP de origem/destino, itens, quantidades, peso/volume ou valor declarado; reaplicar cotação atualiza o frete comercial e aciona a invalidação financeira já definida no spec 4.

Não inclua: capacidade/parada logística, reagendamento sob concorrência e eventos de execução quantitativa de entrega/retirada (spec 8); agenda, equipe, ordem ou execução de montagem (módulo `montagens`, esforço próprio fora desta série de specs); reserva/estoque/lotes (specs 5/6 — este spec não consome nem produz reserva); consumo definitivo, documentos fiscais e CFOP (Etapa 5); devolução/troca pós-`F`; reescrita do registro de entrega em loja já existente.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo as matrizes douradas, já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm`, `dmcadastrocontratos.pas/.dfm`, `dmoperacoescontratos.pas/.dfm`, `fmFreteTransportadoras.pas/.dfm` e `fmMonitorNFeEntradaSefaz.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- `LegacyGerarContratoOrcamentoRepository::buildContratoHeaderPayload` (`~186-265`) e `::copyProdutos` (`~273-299`) — a geração via Orçamento **já copia** cabeçalho (`entrega, dataentrega, horaentrega, periodoentrega, entnomedestinatario, entrua, entnumero, entcomplemento, entbairro, entcidade, entestado, entcep, filial_retirada, fornecedorfrete, frete_transportadora, frete_servico, frete_prazo_entrega, frete_pago, codigofretes_isencao, codigotabela_frete, definirdadosentregaparatodos, montagemobs, montagemfilial`) e item (`montagem, entrega, dataentrega, horaentrega, periodoentrega, previsao` em `produtoscontratos`). Estes são os nomes de coluna reais já em uso; não invente um vocabulário paralelo.
- `App\Support\Vendas\ConsultaContratosGravarAlteracaoEntregaDiff` e `App\Support\Vendas\ContratoEntregaPeriodoResolver` — **já implementam** normalização por item, cálculo de `dias`↔`dataentrega`, comparação de mudança e o próprio "aplicar a todos" (`definirdadosentregaparatodos`) usado pela Consulta. Generalize este diff para o Cadastro; não crie um segundo normalizador de data/período/hora.
- `App\Services\Vendas\ConsultaContratosGravarAlteracaoService` (`~126-280`) — padrão transacional de gravação de entrega com propagação idempotente a registros fiscais; o Cadastro deve produzir e consumir o mesmo contrato de diff, não duas implementações.
- `LegacyContratoDetalheRepository` / `ConsultaContratosDetalheService` — já projetam `filial_retirada` e dados de entrega para a Consulta; confirme exatamente o que já é lido antes de desenhar a projeção de modalidade/resumo, para não duplicar leitura.
- `App\Application\Vendas\FreightQuote\FreightQuoteEngine`, `FreightQuoteDocumentAdapterResolver`, `FreightQuoteSaveService`, `FreightQuoteValidityEvaluator` e a interface `App\Domain\Vendas\FreightQuote\FreightQuoteDocumentAdapterInterface` — motor genérico completo (cotação, seleção, assinatura, obsolescência). `App\Infrastructure\Persistence\Legacy\Vendas\FreightQuote\OrcamentoFreightQuoteAdapter` é o único adapter hoje existente (tipo `orcamento`) — use-o como precedente estrutural direto para `ContratoFreightQuoteAdapter` (tipo `contrato`), implementando os mesmos métodos da interface.
- `App\Infrastructure\Persistence\Legacy\Vendas\LegacyDocumentoCotacaoFreteRepository` — persiste `App\Application\Vendas\FreightQuote\DTOs\PhotographDraft` na tabela `cloud_documento_cotacao_frete`, já **polimórfica por `document_type`/`document_id`**; adicionar o tipo `contrato` é aditivo, não exige nova tabela.
- Registro do adapter em `App\Providers\AppServiceProvider.php:366-369` (`FreightQuoteDocumentAdapterResolver` recebe a lista de adapters no boot) — `ContratoFreightQuoteAdapter` deve ser adicionado à mesma lista, não a um resolver paralelo.
- **Gap confirmado**: `PhotographDraft` e o `FreightQuoteEngine` não modelam `regra_isencao` nem `frete_custo_real` (`NÃO LOCALIZADO` — busca por "isencao" no namespace `FreightQuote` não retorna nada). A faixa de isenção e o custo real reconciliado por nota de entrada são puramente Delphi hoje. Decida e documente explicitamente se isso estende o DTO genérico (afetando também Orçamento) ou se é calculado como camada própria do Contrato sobre `appliedValue`/`originalValue` já existentes — não presuma que a estrutura atual já cobre a separação cobrado/estimado/real/isenção exigida pela evidência Delphi.
- `App\Services\Vendas\RegistrarContratoEntregaLojaService`, `App\Support\Vendas\ContratoEntregaLojaEligibility` e `App\Infrastructure\Persistence\Legacy\Vendas\LegacyContratoEntregaLojaWriteRepository` — atalho de entrega/retirada em loja **já implementado e testado**, hoje restrito a `P/N`, com prova sensível, transação e resumo global. Não pertence a este spec (é território do spec 8), mas o shell/UI desta fatia não pode reabrir ou duplicar esse fluxo.
- `ConsultaContratosRegistrarEntregaLojaSensitiveOperationGate` — precedente de prova sensível para qualquer operação logística que a especificação decidir proteger (ex.: frete manual).
- A Fundação (`01-speckit-prompt.md`) já nomeia "Entrega" como área do shell; hoje não existe `EntregaTab.tsx` nem qualquer componente de UI logística no Cadastro — esta fatia constrói a aba do zero, reaproveitando o shell/capabilities já definidos.

## Evidência Delphi confirmada

### Quatro capacidades, não um único bloco "Entrega"

- `DECISÃO NOVA` — separar: (1) promessa logística do Contrato; (2) cotação/fotografia de frete; (3) agenda logística; (4) execução de entrega, retirada e montagem. Este spec cobre (1) e (2), captura crua de necessidade de montagem, e nada de (3)/(4).
- `CONFIRMADO` — o legado mistura campos de cabeçalho (filial de venda/montagem/retirada, endereço destinatário, frete, fornecedor/transportadora, serviço, prazo, tabela) e de item (`entrega`, `montagem`, data, hora, período). Evidência: `dmcadastrocontratos.dfm:1087-1452,10902-11850`.
- `CONFIRMADO` — Contrato criado a partir de Orçamento já herda essa fotografia completa (ver Investigação Laravel obrigatória); não recota nem substitui automaticamente endereço, transportadora ou agenda.

### Modalidades e combinações (correção confirmada pelos casos dourados)

| Resumo do cabeçalho | Itens | Campos obrigatórios |
|---|---|---|
| `ENTREGA` | todos ou parte marcados `ENTREGA`, sem retirada | destino válido; data, período e hora por grupo |
| `RETIRADA_FILIAL` | todos em retirada | filial de retirada; responsável na execução (spec 8) |
| `HIBRIDA` | ao menos um entregue e um retirado | destino/agenda dos entregues e filial dos retirados |
| `SEM_OPERACAO` | nenhum exige entrega/retirada | nenhum dado logístico obrigatório |

- `CONFIRMADO` — o SQL Delphi trata `filial_retirada` combinada com itens `entrega='S'` como operação híbrida válida: `RetiraLoja=false` e `EntregaPropria=true` quando há itens entregues; `RetiraLoja=true` quando nenhum exige entrega. Evidência: `dmoperacoescontratos.dfm:72-121`.
- `CONFIRMADO` — "entrega expressa" deriva de `tabela_frete.entrega_expressa`, independentemente da filial de retirada — é atributo do serviço de frete escolhido, não uma quarta modalidade. Evidência: `dmoperacoescontratos.dfm:63-69`.
- `CONFIRMADO` — o PAS exige data, período e hora para item marcado para entrega (`dmcadastrocontratos.pas:19527-19533`); informar data deriva dias/período/hora padrão, desmarcar limpa a agenda (`:5583-5638`).
- `CONFIRMADO` — `MarcarProdutosParaEntregaContrato` só define o valor inicial de itens novos; "definir para todos" copia a agenda do cabeçalho (`dmcadastrocontratos.pas:12549-12576`) — o padrão parametrizado é conveniência, nunca trava o ajuste por item.

### Endereço de entrega

- `CONFIRMADO` — o Contrato persiste fotografia própria (`entrua`, número, complemento, estado, cidade, bairro, CEP, telefone, destinatário). Evidência: `dmcadastrocontratos.dfm:10972-11019,11793`.
- `POSSÍVEL BUG LEGADO` — o Delphi considera existir endereço mesmo com preenchimento parcial (`dmcadastrocontratos.pas:17232-17240`); "qualquer campo preenchido" não é validação suficiente para uma entrega e não será reproduzido como requisito.
- `DECISÃO NOVA` — validação depende da modalidade: `ENTREGA` exige CEP normalizado e campos mínimos de roteirização; `RETIRADA_FILIAL` exige filial; `SEM_OPERACAO` não exige endereço.

### Cotação e fotografia de frete

- `CONFIRMADO` — `contratos.frete` é o valor comercial cobrado do Cliente: entra no total, no rateio dos itens e nos documentos. Evidência: `dmcadastrocontratos.pas:7254-7294,8959-9005,11651-11687`.
- `CONFIRMADO` — a cotação grava o valor selecionado em `frete`, além de fornecedor, serviço, prazo, tabela e faixa de isenção. Evidência: `fmFreteTransportadoras.pas:431-493`.
- `CONFIRMADO` — a faixa de isenção pode reduzir o frete comercial a zero quando o total dos produtos atinge o limiar, preservando `codigofretes_isencao` e a tabela aplicada. Evidência: `fmFreteTransportadoras.dfm:634-680`.
- `CONFIRMADO` — `frete_pago` é custo efetivo de transporte, reconhecido por nota de entrada vinculada à NF de saída, somado/atualizado no Contrato; relatórios usam `frete - frete_pago` na margem. Evidência: `fmMonitorNFeEntradaSefaz.dfm:1273-1324`, `fmVisualizarCustoVenda.pas:1006-1052`.
- `DÚVIDA` — a relação exata entre `frete`, `frete_pago`, isenção e valor efetivamente cobrado do Cliente ainda precisa ser fechada com casos dourados antes da implementação (nenhuma matriz numérica dedicada foi produzida para frete).
- `DECISÃO NOVA` — falha da API de cotação não apaga fotografia válida nem inventa valor; frete manual, se permitido por capability/parâmetro, registra origem manual e autoria.

### Montagem (captura, não execução)

- `CONFIRMADO` — montagem existe no item, com filial/observação no cabeçalho. Evidência DFM: `dmcadastrocontratos.dfm:1087,11019-11024`.
- `DECISÃO NOVA` — marcação "exige montagem" é parte da promessa do item; filial de montagem é responsabilidade operacional; não altera origem de estoque, filial de venda ou CFOP por si só.
- `NÃO LOCALIZADO` — não existe no Laravel comando geral de execução/agendamento de montagem; existem apenas cadastro de Tabela de Montagem e projeções na Ficha Financeira (`LegacyFichaFinanceiraContratoTabsRepository.php:976-999`). Agenda/execução de montagem é módulo `montagens` próprio, fora desta série de specs (ver `26-consolidar-ordem-de-specs...`).

### Mutabilidade por situação (recorte deste spec)

| Situação | Promessa/endereço/frete |
|---|---|
| `O` | Editável; mudanças recalculam assinaturas comercial/financeira (spec 4). |
| `R` | Editável com `revision`; mudanças que afetam preço exigem nova confirmação financeira quando cabível. |
| `F` | Fotografia comercial congelada; correções materiais exigem operação explícita e auditoria — fora desta fatia. |
| `P/N` | Congelada para os itens documentados. |
| `C` | Somente leitura. |

Agenda/reagendamento operacional e execução por situação pertencem ao spec 8; este spec só define a fronteira de mutabilidade da promessa comercial acima.

## Estado Laravel confirmado

- A geração de Contrato a partir de Orçamento já copia integralmente a fotografia logística de cabeçalho e item (endereço, frete, `filial_retirada`, `montagemfilial`/`montagemobs`, `definirdadosentregaparatodos`, agenda por item) — este spec não inventa colunas novas para o que já existe, apenas o comando/validação/UI que faltam.
- A Consulta de Contratos já tem diff, normalização de período/hora e gravação transacional de entrega (`ConsultaContratosGravarAlteracaoEntregaDiff`, `ContratoEntregaPeriodoResolver`, `ConsultaContratosGravarAlteracaoService`) — nenhum equivalente existe ainda no Cadastro; a decisão é generalizar, não duplicar.
- Não existe modalidade explícita nem resumo `ENTREGA/RETIRADA_FILIAL/HIBRIDA/SEM_OPERACAO` em lugar nenhum do Laravel — é construção nova desta fatia sobre os campos já lidos por `LegacyContratoDetalheRepository`.
- `FreightQuoteEngine` genérico e um único adapter (`orcamento`) já existem e estão registrados; nenhum adapter `contrato` existe. A tabela de fotografia (`cloud_documento_cotacao_frete`) já é polimórfica por tipo de documento.
- Nenhuma modelagem de isenção de frete ou de custo real existe no Laravel (`NÃO LOCALIZADO`) — gap a fechar por este spec, coordenado com o dono do domínio de frete de Orçamento se o DTO genérico for estendido.
- O registro de entrega em loja já está implementado, testado e restrito a `P/N` com resumo global — reaproveitar como está, não reabrir.
- Nenhuma UI logística existe no Cadastro (`EntregaTab.tsx` inexistente); a aba "Entrega" já está prevista no shell da Fundação, mas vazia.

## Decisões obrigatórias

1. Modalidade autoritativa vive em cada item/alocação (`ENTREGA`, `RETIRADA_FILIAL`, `SEM_OPERACAO`); o cabeçalho expõe apenas um resumo derivado, incluindo `HIBRIDA` — nunca um enum exclusivamente global.
2. `EXPRESSA` é atributo do serviço de frete escolhido, nunca uma modalidade concorrente.
3. Endereço é fotografia do Contrato, inicialmente copiada do Cliente/Orçamento; editar a fotografia não altera o cadastro mestre do Cliente, e vice-versa (fronteira já fixada em "Definir vínculo e fotografia do Cliente").
4. Validação de endereço/filial depende exclusivamente da modalidade resolvida por item — nunca "qualquer campo preenchido" como prova de entrega válida.
5. O comando de promessa (por item e "aplicar a todos") é único e compartilhado entre Cadastro e Consulta — generaliza `ConsultaContratosGravarAlteracaoEntregaDiff`/`ContratoEntregaPeriodoResolver` em vez de duplicá-los; qualquer mudança de regra vale para as duas telas.
6. "Aplicar a todos" é comando explícito que produz alterações por item na mesma `revision`; divergência entre itens é exibida como "agenda por item", nunca mascarada pelo cabeçalho.
7. `ContratoFreightQuoteAdapter` implementa `FreightQuoteDocumentAdapterInterface` e é registrado no mesmo `FreightQuoteDocumentAdapterResolver` que já resolve `orcamento`; a origem da cotação é sempre a filial de venda acordada, nunca a origem de estoque de cada item.
8. Mudança em filial de origem da cotação, CEP, itens, quantidades, peso/volume ou valor declarado torna a fotografia de frete obsoleta; reaplicar cotação atualiza o frete comercial e aciona a invalidação financeira definida no spec 4 — nunca um recálculo silencioso.
9. Falha da API de frete nunca apaga fotografia válida nem inventa valor; frete manual exige capability/parâmetro explícitos e registra origem manual e autoria (reaproveitando a infraestrutura de prova sensível já fixada na Fundação).
10. `frete_cobrado`, `frete_custo_estimado`, `frete_custo_real` e `regra_isencao` são grandezas separadas; isenção afeta somente o cobrado, nunca presume custo real zero; reconhecer custo real após `F` afeta apenas margem/contabilidade, nunca recalcula parcelas ou total do Cliente.
11. Necessidade de montagem é capturada por item (marcação + filial + observação) sem criar agenda, equipe, ordem ou estado de execução — isso é módulo `montagens` próprio, fora desta série de specs.
12. Promessa/agendamento não movimenta estoque; reserva continua pertencendo exclusivamente à transição `O → R` (specs 5/6), que este spec não consome nem altera.
13. Este spec não cria, reabre nem reimplementa o registro de entrega em loja já existente; apenas garante que a nova UI/rota logística do Cadastro não colide com ele.
14. Autorização, capabilities e prova sensível desta fatia reaproveitam integralmente a matriz e a infraestrutura já fixadas na Fundação; nenhum mecanismo de permissão ou senha paralelo.

## Contrato do comando de promessa logística

- Entrada: identidade/`revision` do Contrato, endereço (quando aplicável), filial de retirada/montagem, marcações por item (modalidade, entrega/montagem, data/período/hora), flag "aplicar a todos".
- Processo: validar `revision` → resolver modalidade por item → aplicar diff generalizado (reaproveitando a normalização de data/período/hora existente) → validar campos obrigatórios por modalidade resolvida → persistir cabeçalho + itens + `revision` na mesma transação → projetar resumo derivado do cabeçalho → propagar a fiscal como evento idempotente (nunca escrita direta em `dadosfiscais`).
- Saída: fotografia autoritativa de promessa (cabeçalho + itens), resumo de modalidade, nova `revision`.
- Este comando não reserva estoque, não cota frete e não agenda capacidade — apenas registra a promessa comercial/logística.

## Contrato do adapter `ContratoFreightQuoteAdapter`

- `type()`: `contrato`. `supports()`: normaliza e compara.
- `resolveOrigin`: filial de venda acordada do Contrato (não a origem de estoque de cada item).
- `resolveDestination`/`loadLogisticItems`/`resolveDeclaredValue`: a partir do endereço fotografado e das linhas comerciais já estabilizadas pelo motor comercial (spec 3).
- `assertExists`/`assertApplicable`/`authorizeQuote`/`authorizeApply`: reaproveitam a policy/capabilities do Cadastro já definidas na Fundação, seguindo o padrão de `OrcamentoFreightQuoteAdapter`.
- `mapSelectionToFields`: mapeia a seleção para `frete_cobrado` (e demais colunas legadas já copiadas pela geração via Orçamento), incluindo a decisão tomada para isenção/custo estimado.
- `persistPhotograph`/`loadPhotograph`: reaproveitam `LegacyDocumentoCotacaoFreteRepository`/`cloud_documento_cotacao_frete` com `document_type = 'contrato'`; nenhuma tabela de fotografia paralela.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações/parâmetros já fixada na Fundação e a infraestrutura de prova sensível (`SensitiveOperationProofService`), seguindo o precedente de `ConsultaContratosRegistrarEntregaLojaSensitiveOperationGate` para qualquer operação sensível desta fatia (ex.: frete manual).
- Não introduza um segundo mecanismo de senha ou aprovação; parâmetros próprios desta fatia (se existirem) seguem o mesmo `ContratoCadastroParameterManifest` já usado pela reserva.

## Testes obrigatórios

1. Matriz de modalidade e resumo: `ENTREGA`, `RETIRADA_FILIAL`, `HIBRIDA`, `SEM_OPERACAO` — campos obrigatórios corretos por caso, incluindo a coexistência entrega+retirada no mesmo Contrato.
2. Validação de endereço por modalidade: `ENTREGA` exige destino/data/período/hora; `RETIRADA_FILIAL` exige filial; `SEM_OPERACAO` não exige nada; preenchimento parcial não é aceito como entrega válida.
3. "Aplicar a todos": mesmo resultado e mesma validação em Cadastro e Consulta, usando o diff generalizado; divergência entre itens não é mascarada pelo cabeçalho.
4. Cotação de frete: adapter `contrato` produz fotografia consistente com o padrão de `OrcamentoFreightQuoteAdapter`; mudança de CEP/itens/quantidade/peso/volume/valor declarado invalida a fotografia; reaplicar cotação aciona a invalidação financeira do spec 4.
5. Falha da API de frete não apaga fotografia válida; frete manual exige prova/capability e registra autoria.
6. Separação `frete_cobrado`/`frete_custo_estimado`/`frete_custo_real`/`regra_isencao`: isenção zera apenas o cobrado; reconhecer custo real após `F` não altera parcelas nem total do Cliente.
7. Captura de montagem: marcação/filial/observação persistem por item sem criar nenhum estado de agenda ou execução.
8. Nenhuma reserva de estoque é acionada por este spec; teste de regressão garante que specs 5/6 permanecem intocados.
9. Nenhuma escrita direta em `dadosfiscais`; propagação a fiscal é evento idempotente, testado com retry sem duplicação.
10. Regressão: o registro de entrega em loja existente (`RegistrarContratoEntregaLojaService`) continua funcionando sem alteração de contrato ou rota.
11. Autorização server-side: payload manipulado no frontend não concede modalidade, filial de retirada ou cotação aplicada sem capability/prova válidas.

Prefira Feature tests nos comandos/endpoints reais; reutilize os testes existentes de `ConsultaContratosGravarAlteracaoEntregaDiff`/`ConsultaContratosGravarAlteracaoService` como base de regressão e a suíte de `OrcamentoFreightQuoteAdapter` como padrão de teste do novo adapter.

## Entregáveis

- Contrato do comando de promessa logística (entrada/processo/saída) e do diff generalizado Cadastro/Consulta.
- Contrato do `ContratoFreightQuoteAdapter` e decisão documentada sobre onde a separação cobrado/estimado/real/isenção vive (extensão do DTO genérico ou camada própria do Contrato).
- Matriz de evidência Delphi × Laravel, deixando explícito o que a geração via Orçamento e a Consulta já cobrem.
- Critérios de aceitação e testes, incluindo a matriz de modalidade/resumo como suíte obrigatória.
- Riscos, dúvidas (relação exata `frete`/`frete_pago`/isenção sem matriz numérica dourada dedicada) e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- capacidade/parada logística, reagendamento sob concorrência e execução quantitativa de entrega/retirada (spec 8);
- agenda, equipe, ordem e execução de montagem (módulo `montagens`, esforço próprio);
- reserva, movimentos, lotes e conferência `CTR` (specs 5/6);
- consumo definitivo de estoque, documentos fiscais e CFOP (Etapa 5);
- devolução, troca e regularização de `P/N` pós-faturamento;
- reescrever o registro de entrega em loja já implementado;
- cálculo comercial (spec 3) e financeiro (spec 4) além do gatilho de invalidação já contratado — este spec só consome linhas já estabilizadas e aciona a invalidação existente;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas pela decisão de isenção/custo real.
```
