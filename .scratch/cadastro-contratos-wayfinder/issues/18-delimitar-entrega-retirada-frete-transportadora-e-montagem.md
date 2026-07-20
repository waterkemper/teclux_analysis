Type: task
Status: resolved
Blocked by: 02, 04, 08, 09, 10, 11
Unblocks: 12, 19

## Question

Como delimitar endereço e modalidade de entrega/retirada, filial de venda e montagem, frete, transportadora, agendamento e execução logística em relação ao Cadastro de Contratos, ao estoque, ao faturamento e aos módulos externos?

Comparar o Delphi com a Consulta de Contratos e os componentes Laravel existentes, definir autoridade dos dados, estados, mutabilidade, comandos e fronteiras reutilizáveis sem transportar acoplamentos legados.

## Resolution

### Quatro capacidades, não um único bloco “Entrega”

- `DECISÃO NOVA` — separar: (1) **promessa logística** do Contrato; (2) **cotação/fotografia de frete**; (3) **agenda logística**; (4) **execução de entrega, retirada e montagem**. O Cadastro edita as três primeiras dentro das guardas da situação; módulos operacionais registram a quarta.
- `CONFIRMADO` — o legado mistura campos de cabeçalho e de item. O cabeçalho contém filial de venda/montagem/retirada, endereço destinatário, frete, fornecedor/transportadora, serviço, prazo e tabela; cada item contém `entrega`, `montagem`, data, hora e período. Evidência: `delphi/apps/vendas/dmcadastrocontratos.dfm:1087-1452` e `:10902-11850`.
- `CONFIRMADO` — a geração Laravel a partir do Orçamento já copia esses dados para Contrato, inclusive `montagemfilial`, campos de frete e agenda dos itens. Evidência: `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/LegacyGerarContratoOrcamentoRepository.php:124-235`.
- `DECISÃO NOVA` — Contrato criado pelo Orçamento entra pelo mesmo modelo e preserva a fotografia logística; não recota nem substitui automaticamente endereço, transportadora ou agenda.

### Promessa logística e autoridade dos dados

O cabeçalho do Contrato mantém:

- modalidade predominante: entrega, retirada em filial ou sem operação logística;
- endereço/destinatário específico desta venda;
- filial de retirada, quando aplicável;
- filial responsável por montagem, quando houver;
- dados comuns de agenda usados pela ação “aplicar a todos”;
- observações logísticas;
- fotografia comercial de frete selecionada.

Cada item mantém:

- se exige entrega e/ou montagem;
- data, período e hora prometidos;
- origem de estoque, que permanece conceito distinto;
- posteriormente, quantidades planejadas/executadas derivadas de eventos, nunca um booleano global.

- `CONFIRMADO` — o Delphi exige período, data e hora quando o item está marcado para entrega. Evidência: `delphi/apps/vendas/dmcadastrocontratos.pas:19527-19533`.
- `CONFIRMADO` — informar data marca entrega e deriva dias, período e hora padrão; desmarcar limpa agenda. Evidência: `delphi/apps/vendas/dmcadastrocontratos.pas:5583-5638`.
- `CONFIRMADO` — `MarcarProdutosParaEntregaContrato` define apenas o valor inicial de novos itens, e “definir para todos” copia a agenda do cabeçalho. Evidência: `delphi/apps/vendas/dmcadastrocontratos.pas:12549-12576`.
- `DECISÃO NOVA` — o padrão parametrizado é conveniência de preenchimento, não regra que impeça o usuário autorizado de ajustar itens.
- `DECISÃO NOVA` — “aplicar a todos” é comando explícito que produz alterações por item na mesma `revision`; o cabeçalho não deve mascarar agendas divergentes. Quando houver divergência, exibir “agenda por item”.

### Modalidades: entrega, retirada e entrega expressa

- `CONFIRMADO` — o Delphi deriva “entrega expressa”, “retira na loja” e “entrega própria” combinando a tabela de frete, `filial_retirada` e existência de itens marcados para entrega. Evidência: SQL em `delphi/apps/vendas/dmoperacoescontratos.dfm:63-127`.
- `INFERIDO` — essas modalidades são hoje derivadas de uma combinação incidental de campos, não um modelo explícito e estável.
- `DECISÃO NOVA` — adotar modalidade explícita no contrato: `ENTREGA`, `RETIRADA_FILIAL` ou `SEM_ENTREGA`. “Expressa” é característica do serviço de frete escolhido, não modalidade concorrente.
- `DECISÃO NOVA` — `RETIRADA_FILIAL` exige filial de retirada e não exige endereço de destino. `ENTREGA` exige ao menos um item entregável e endereço válido. Itens podem ter entrega parcial; a modalidade do cabeçalho não substitui a marcação individual.
- `DÚVIDA` — o legado permite aparentemente filial de retirada combinada com alguns itens entregues. A tarefa “Confirmar casos dourados de modalidades e capacidade logística” deve confirmar se isso é uma operação híbrida válida ou acoplamento histórico.

### Endereço de entrega

- `CONFIRMADO` — o Contrato persiste fotografia própria do endereço (`entrua`, número, complemento, estado, cidade, bairro, CEP, telefone e destinatário); evidência `delphi/apps/vendas/dmcadastrocontratos.dfm:10972-11019` e `:11793`.
- `CONFIRMADO` — o Delphi considera existir endereço mesmo com preenchimento parcial; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:17232-17240`.
- `POSSÍVEL BUG LEGADO` — “qualquer campo preenchido” não é validação suficiente para uma entrega. Não será convertido em requisito.
- `DECISÃO NOVA` — o endereço é fotografia do Contrato, inicialmente copiada do Cliente ou Orçamento. Alterar a fotografia não altera o cadastro do Cliente; editar o Cliente segue a fronteira definida em “Definir vínculo e fotografia do Cliente”.
- `DECISÃO NOVA` — a validação depende da modalidade e do provedor: para entrega, CEP normalizado e campos mínimos de roteirização; para retirada, filial; para sem entrega, nenhum endereço obrigatório.

### Cotação e fotografia de frete

- `CONFIRMADO` — o Laravel possui `FreightQuoteEngine` genérico, orientado por adapter, usando `URL FRENET`, origem da filial, destino, itens, assinatura e detecção de cotação obsoleta. Evidência: `laravel/backend/app/Application/Vendas/FreightQuote/FreightQuoteEngine.php:28-184` e `:240-398`.
- `CONFIRMADO` — o adapter de Orçamento transforma a seleção em frete, fornecedor, transportadora, serviço, mensagem, prazo e `codigotabela_frete`, e persiste fotografia. Evidência: `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/FreightQuote/OrcamentoFreightQuoteAdapter.php:25-76` e `:201-242`.
- `CONFIRMADO` — a arquitetura aceita um segundo contexto por adapter; evidência: `FreightQuoteDocumentAdapterResolver.php:9-25` e teste `laravel/backend/tests/Feature/Vendas/FreightQuote/FreightQuoteSecondContextContractTest.php:16-58`.
- `DECISÃO NOVA` — criar futuramente `ContratoFreightQuoteAdapter`; não duplicar modal, client, assinatura nem tabela de fotografia. Origem é a filial de venda acordada para cotação, não cada origem de estoque do item, preservando a decisão anterior do projeto de frete.
- `DECISÃO NOVA` — mudanças em filial de origem da cotação, CEP, itens, quantidades, peso/volume ou valor declarado tornam a fotografia obsoleta. Aplicar nova cotação atualiza também frete comercial e invalida a confirmação financeira, conforme “Delimitar pagamentos e Ficha Financeira”.
- `DECISÃO NOVA` — falha da API não apaga fotografia válida nem inventa valor. Frete manual, se permitido por capability/parâmetro, deve registrar origem manual e autoria.
- `DÚVIDA` — ainda deve ser confirmada a relação entre `frete`, `frete_pago`, isenção e valor efetivamente cobrado do Cliente.

### Agenda e capacidade

- `CONFIRMADO` — o Delphi consulta limites e total já agendado por data, período e região, escolhendo endereço de entrega ou endereço do Cliente. Evidência: `delphi/apps/vendas/dmcadastrocontratos.pas:20551-20594`.
- `CONFIRMADO` — o Laravel já tem normalização e diff de agenda por item, exige período/data/hora e grava as mudanças em transação na Consulta de Contratos. Evidência: `laravel/backend/app/Support/Vendas/ConsultaContratosGravarAlteracaoEntregaDiff.php:55-188` e `laravel/backend/app/Services/Vendas/ConsultaContratosGravarAlteracaoService.php:126-280`.
- `DECISÃO NOVA` — Cadastro e Consulta reutilizam um único `ContratoDeliveryPromiseService`/diff. A mesma validação deve operar em ambos; não haverá regras diferentes por tela.
- `DECISÃO NOVA` — capacidade deve ser validada no servidor e reservada atomicamente ao gravar a agenda. Leitura de “total agendado” sem lock não garante vaga.
- `DECISÃO NOVA` — alterar ou remover agenda libera a alocação anterior e ocupa a nova na mesma transação. A chave de capacidade inclui região, data e período; a unidade consumida (contrato, item, volume ou quantidade) fica pendente de casos dourados.
- `DÚVIDA` — não foi confirmada a unidade exata usada pelos limites regionais nem se montagem compartilha a mesma capacidade de entrega.

### Montagem

- `CONFIRMADO` — montagem existe no item e há filial/observação no cabeçalho; evidência DFM `delphi/apps/vendas/dmcadastrocontratos.dfm:1087`, `:11019-11024`.
- `DECISÃO NOVA` — marcação “exige montagem” é parte da promessa do item; filial de montagem é responsabilidade operacional. Ela não muda a origem do estoque, a filial de venda ou o CFOP por si só.
- `DECISÃO NOVA` — agendamento e execução de montagem constituem capacidade reutilizável posterior. O primeiro spec logístico pode apenas capturar necessidade, filial e observação, sem implementar ordem/roteiro/equipe.
- `NÃO LOCALIZADO` — não foi encontrado no Laravel um comando geral de execução/agendamento de montagem de Contrato, embora existam cadastro de Tabela de Montagem e projeções na Ficha Financeira.

### Mutabilidade por situação

| Situação | Promessa/endereço/frete | Agenda | Execução |
|---|---|---|---|
| `O` | Editável; mudanças recalculam assinaturas comercial/financeira. | Planejável, sujeita a capacidade. | Não executável. |
| `R` | Editável com `revision`; mudanças que afetam preço exigem nova confirmação financeira/reserva quando cabível. | Planejável/reagendável. | Não executável. |
| `F` | Fotografia comercial congelada. Correções materiais exigem operação explícita e auditoria. | Reagendamento operacional permitido por capability, sem mutar totais. | Preparável; retirada/entrega fiscalmente dependentes ficam guardadas. |
| `P/N` | Congelada para os itens documentados. | Reagendável apenas para pendências. | Entrega/retirada/montagem registradas por eventos idempotentes. |
| `C` | Somente leitura. | Alocações futuras canceladas/liberadas. | Compensação/cancelamento, nunca apagar eventos. |

- `DECISÃO NOVA` — gravação comercial em `O/R` e reagendamento operacional em `F/P/N` são comandos distintos. Isso evita reabrir todo o agregado apenas para alterar uma data operacional.
- `CONFIRMADO` — a Consulta Laravel já permite alterações de agenda e propaga dados para registros fiscais válidos em certas situações. Evidência: `ConsultaContratosGravarAlteracaoService.php:212-280` e teste `ConsultaContratosGravarAlteracaoTest.php:590`.
- `DECISÃO NOVA` — a projeção fiscal deve receber evento/serviço de sincronização idempotente; o domínio do Cadastro não deve editar `dadosfiscais` diretamente.

### Execução e registro de entrega/retirada

- `CONFIRMADO` — no Delphi, entrega na loja exige nota válida, solicita usuário responsável, insere evento em `entregas` e marca dados resumidos no Contrato na mesma persistência. Evidência: `delphi/apps/vendas/dmcadastrocontratos.pas:20711-20755`.
- `CONFIRMADO` — o Laravel já implementa esse fluxo com prova sensível, transação, nota válida e idempotência por status. Evidência: `laravel/backend/app/Services/Vendas/RegistrarContratoEntregaLojaService.php:18-131`, `ContratoEntregaLojaEligibility.php:7-59` e `LegacyContratoEntregaLojaWriteRepository.php:10-75`.
- `DECISÃO NOVA` — reutilizar esse comando no shell do Cadastro; não reimplementar. Evoluí-lo futuramente para eventos quantitativos por item/documento, pois um único “ENTREGUE” no cabeçalho não representa entrega parcial.
- `DIVERGENTE` — a implementação atual permite registro somente em `P/N` e grava um resumo global. Isso atende retirada total simples, mas não cobre entrega parcial, múltiplos documentos, estorno ou montagem.
- `DECISÃO NOVA` — evento de execução deve conter contrato, item/alocação fiscal quando aplicável, quantidade, modalidade, filial/local, data/hora, operador/autorizador e idempotency key. Resumo do Contrato é projeção derivada.

### Fronteiras com estoque, fiscal e financeiro

- `DECISÃO NOVA` — promessa/agendamento não movimenta estoque. Reserva continua pertencendo à transição `O → R`; saída física/fiscal consome reserva no fluxo definido em “Delimitar faturamento e documentos fiscais”.
- `DECISÃO NOVA` — frete cobrado integra o total comercial e a assinatura financeira; custo/cobrança da transportadora e nota de frete pertencem à logística/financeiro de fornecedores.
- `DECISÃO NOVA` — emitir documento não significa entregar, e entregar não significa montar. Cada conclusão tem evento e guardas próprias.
- `CONFIRMADO` — o Delphi calcula pendência com quantidade contratada menos cancelada/entregue e usa consultas diferentes por situação. Evidências: `delphi/apps/vendas/dmoperacoescontratos.pas:994-1061` e datasets `qryProdutosEntregar_O_R`/`_F_P` no DFM `:659-1039`, `:2066-2216`.

## Spec boundary

Esta decisão comporta três `$to-spec` independentes:

1. **Promessa logística do Contrato em `O/R`**: modalidade, endereço, marcações por item, filial de retirada/montagem, aplicar a todos e validações.
2. **Cotação de frete no Contrato**: somente o adapter `contrato` sobre o motor genérico existente e invalidação financeira.
3. **Agenda logística compartilhada entre Cadastro e Consulta**: capacidade, reagendamento e concorrência.

O registro simples de entrega em loja já existe e deve ser integrado, não especificado novamente. Execução quantitativa de entrega/retirada/montagem exige primeiro os casos dourados da tarefa seguinte.

## Follow-up

- [Confirmar casos dourados de modalidades e capacidade logística](19-confirmar-casos-dourados-de-modalidades-e-capacidade-logistica.md)

## Correção confirmada pelo follow-up

A decisão de modalidade exclusivamente global foi refinada por [Confirmar casos dourados de modalidades e capacidade logística](19-confirmar-casos-dourados-de-modalidades-e-capacidade-logistica.md): entrega e retirada podem coexistir. A modalidade autoritativa é por item/alocação; o cabeçalho possui apenas resumo derivado, inclusive `HIBRIDA`.
