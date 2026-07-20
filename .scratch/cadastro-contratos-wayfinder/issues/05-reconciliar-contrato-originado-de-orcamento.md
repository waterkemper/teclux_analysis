Type: task
Status: resolved
Blocked by: 01, 02, 03, 04, 13

## Question

Como o Contrato criado a partir de Orçamento deve entrar no novo Cadastro, preservando situação inicial, Cliente, produtos, serviços, planos, parcelas, entrega, frete, atendimentos, questionários e vínculo de origem, sem duplicação e sem criar um segundo fluxo incompatível com o serviço Laravel existente?

O resultado deve reconciliar o spec anterior de geração com as invariantes do núcleo do Cadastro.

## Resolution

### Regra de entrada e fluxo único

- `CONFIRMADO` — Delphi e Laravel criam o Contrato originado de Orçamento em situação `O` (Orçado). Evidências: `delphi/apps/vendas/dmorcamentos.pas:4309-4311`; `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/LegacyGerarContratoOrcamentoRepository.php:115-124`; teste `OrcamentoGerarContratoTest::test_gerar_contrato_transforma_orcamento`.
- `CONFIRMADO` — o Orçamento de origem passa de `A` para `T` e recebe o número do Contrato; seus itens têm `vendido=quantidade`. Evidências: `dmorcamentos.pas:4697-4704`, `:4547-4553`; repositório Laravel `:87-92`, `:101-110`.
- `CONFIRMADO` — o comando Laravel atual exige confirmação, revision esperada, Orçamento aberto e válido, ao menos um produto/serviço, plano selecionado, estoque quando parametrizado, endereço de entrega quando exigido e Cliente válido. A criação, o vínculo de origem e o atendimento automático estão na mesma transação: `GerarContratoOrcamentoCommand.php:55-146`.
- `CONFIRMADO` — a repetição normal é idempotente: quando o Orçamento já está transformado e o Contrato existe, o comando devolve o mesmo número sem criar outro. Evidência: `GerarContratoOrcamentoCommand.php:175-198` e `OrcamentoGerarContratoTest::test_gerar_contrato_idempotente_retorna_mesmo_numero`.
- `NÃO LOCALIZADO` — ainda não existe um serviço de aplicação canônico do futuro Cadastro de Contratos ao qual a conversão possa delegar; o repositório atual insere diretamente nas tabelas legadas.
- `DECISÃO NOVA` — haverá um único caso de uso canônico de criação do agregado Contrato. “Gerar Contrato” continuará sendo a operação pública do Orçamento, responsável por gates e idempotência, mas entregará uma fotografia preparada ao mesmo serviço/fábrica de criação usado pelo Cadastro. O Cadastro não reimplementará a conversão e o comando atual não será mantido como segundo gravador independente.
- `DECISÃO NOVA` — a criação persiste o Contrato `O` já numerado; ela não reserva estoque nem avança para `R`. Reserva continua sendo efeito exclusivo da transição `O → R`, conforme o mapa de estoque.

### Matriz de transferência

| Área | Tratamento na conversão | Evidência e decisão |
|---|---|---|
| origem | vincular, não copiar | `CONFIRMADO`: `orcamentos.contrato` é gravado. O schema de testes também prevê `contratos.orcamento`, mas o repositório não o preenche. `DECISÃO NOVA`: manter vínculo navegável nos dois sentidos por uma identidade de origem única (`tipo=orcamento`, código), sem depender apenas de texto de auditoria. |
| Cliente | copiar fotografia e manter vínculo ao mestre | `CONFIRMADO`: código/tipo e ampla fotografia cadastral vêm do Orçamento; quando o Orçamento ainda não tem Cliente, o Delphi/Laravel o cria/resolve antes da conversão. `DECISÃO NOVA`: aceitar `C/F/L` conforme parâmetros já mapeados, aplicar a whitelist do núcleo e recarregar a fotografia autoritativa em `O/R/F`; não editar o mestre pela tela do Contrato. |
| cabeçalho comercial | copiar fotografia | `CONFIRMADO`: filial de venda, vendedor, plano/agente, totais, descontos, juros, frete, seguro, crédito de troca, cashback, cupom, observações e montagem são mapeados no Delphi e no Laravel. |
| produtos | recriar linhas equivalentes | `CONFIRMADO`: produto, filial, sequência, quantidade, preços, descrição comercial, montagem/entrega, previsão, vendedor e descontos são inseridos em `produtoscontratos`. As linhas recebem novas identidades no contexto do Contrato; não permanecem editando as linhas do Orçamento. |
| séries | recriar associação | `CONFIRMADO`: séries do Orçamento são inseridas em `produtoscontratosseries`. `DIVERGENTE`: o Delphi copia também código visual, descrição e `verificado`; o Laravel atual copia apenas produto, filial, número de série e `devolvido`. A paridade deverá ser decidida/testada na fatia de produtos/conferência, sem ampliar automaticamente esta conversão. |
| serviços | recriar linhas equivalentes | `CONFIRMADO`: serviço, quantidade, alíquota, valor e complemento são copiados; Laravel inclui ainda equipamento/produto/filial quando presentes. |
| plano | copiar a proposta selecionada | `CONFIRMADO`: somente o plano marcado é usado; cabeçalho recebe plano, agente, valores, desconto e juros. Não copiar alternativas não selecionadas como planos ativos do Contrato. |
| parcelas | recriar parcelas propostas | `CONFIRMADO`: vencimento, valor, forma, tipo de recebimento e parcela de origem são inseridos em `parcelas`. São compromissos previstos do Contrato `O`, não pagamentos realizados. |
| entrega/retirada/frete | copiar fotografia escolhida | `CONFIRMADO`: modo e data/período de entrega, destinatário/endereço, filial de retirada, transportadora, serviço, prazo e valores são mapeados. `DECISÃO NOVA`: preservar a opção escolhida e seus dados comerciais; não repetir cotação externa nem copiar resposta bruta como nova cotação. Execução logística ainda não nasce na conversão. |
| contatos | referenciar o cadastro mestre | `NÃO LOCALIZADO`: Delphi e repositório Laravel não copiam registros de `contatosvfornecedores` para uma coleção própria do Contrato. `DECISÃO NOVA`: o Contrato consulta contatos do Cliente e preserva apenas eventuais escolhas/fotografias específicas da negociação; não duplica todo o cadastro. |
| atendimentos | conservar e correlacionar | `CONFIRMADO`: Delphi chama `IncluirAtendimento_` antes de criar o Contrato; Laravel cria, de forma idempotente, um atendimento “Orçamento convertido em Contrato” contendo os vínculos de Orçamento e Contrato (`GerarContratoOrcamentoCommand.php:258-308`). `DECISÃO NOVA`: atendimentos anteriores continuam pertencendo ao Orçamento; a timeline do Contrato pode projetá-los pela origem, mas não os move nem duplica. |
| questionários | conservar aplicações e avaliar gatilhos | `CONFIRMADO`: Delphi chama `AcionarTelaEnquete` com Cliente, Orçamento e Contrato após o commit (`dmorcamentos.pas:4725-4732`). Laravel hoje avalia `resolveAfterDocumentSave('orcamento', ...)` depois da transação (`GerarContratoOrcamentoCommand.php:148-152`). `DECISÃO NOVA`: respostas/aplicações do Orçamento permanecem nele e podem ser exibidas como origem; não são clonadas. Questionário parametrizado especificamente para Contrato gera aplicação própria e idempotente, correlacionada à conversão. |
| estoque/reserva/fiscal | não transferir efeitos inexistentes | `CONFIRMADO`: há gate de disponibilidade, porém não há reserva, movimento de estoque ou documento fiscal na criação `O`. `DECISÃO NOVA`: esses efeitos só ocorrem nas transições próprias posteriores. |

### Atomicidade, concorrência e recuperação

- `CONFIRMADO` — no Delphi, cabeçalho, origem, produtos, séries, serviços, parcelas e atualização do Orçamento são perpetrados em conjunto; no Laravel, estão sob `DB::transaction` e o Orçamento é bloqueado para atualização.
- `DECISÃO NOVA` — a unidade atômica mínima contém: validação da revision, alocação do número, cabeçalho, linhas, proposta/parcelas, vínculo de origem, marcação `T`/`vendido` no Orçamento, atendimento de conversão e auditoria técnica. Falha em qualquer parte não pode deixar um Contrato utilizável parcialmente.
- `DIVERGENTE` — a sequence PostgreSQL pode consumir um número mesmo quando a transação falha; isso é lacuna de numeração, não Contrato parcial e não autoriza reaproveitar o número.
- `DÚVIDA` — se já existir `orcamentos.situacao='T'` e `orcamentos.contrato` apontar para número inexistente, o comando atual não repara nem gera novamente: a idempotência não encontra o Contrato e a validação rejeita o Orçamento não aberto. Esse estado deve ser classificado como origem órfã e encaminhado a reconciliação administrativa auditada, nunca corrigido criando silenciosamente outro Contrato.
- `DECISÃO NOVA` — impor unicidade lógica da origem: um Orçamento origina no máximo um Contrato. Reenvio com a mesma origem retorna o existente; origem ligada a outro número ou conteúdo incompatível retorna conflito tipado.
- `DECISÃO NOVA` — após sucesso, o Cadastro abre/carrega o Contrato pela identidade retornada e sua revision corrente. Nesta etapa também é aceitável permanecer no Orçamento mostrando o número gerado, como já definido no spec anterior; isso não muda a semântica da criação.

### Invariantes aceitas pelo futuro Cadastro

1. Contrato originado de Orçamento entra exatamente como qualquer Contrato `O`, com as mesmas capabilities, revision, validação F8 e transições do núcleo.
2. A origem explica como o estado inicial foi preparado, mas não cria um subtipo com regras paralelas.
3. Totais do cabeçalho, linhas, plano e parcelas devem fechar antes da persistência; divergência bloqueia a conversão, não é normalizada silenciosamente.
4. Campos cadastrais seguem a política Cliente mestre/fotografia já decidida; campos comerciais e logísticos são fotografia da negociação.
5. Nenhuma resposta, atendimento, contato, cotação, reserva, pagamento ou documento fiscal é duplicado para “parecer” pertencente ao Contrato.
6. A auditoria registra criação por conversão, origem, ator, números, contagens e totais; dados pessoais sensíveis e respostas não entram no payload genérico do evento.

### Lacunas Laravel consolidadas

- `DIVERGENTE` — `LegacyGerarContratoOrcamentoRepository` é hoje um gravador completo paralelo ao futuro Cadastro; deve tornar-se adaptador do serviço canônico, preservando o endpoint e os gates existentes.
- `DIVERGENTE` — a conversão Laravel não preenche explicitamente `contratos.orcamento`, embora a coluna exista no shape SQLite; o vínculo inverso depende apenas de `orcamentos.contrato`.
- `DIVERGENTE` — o mapeamento Laravel não copia todos os campos copiados pelo Delphi (por exemplo, alguns metadados de série, `frete_mensagem`, `codigo_cupom`, `ipi` e `classificacaofiscal`). Cada campo deve ser reconciliado com os mapas de produtos, fiscal e logística; ausência legada não vira requisito sem uso concreto.
- `DIVERGENTE` — o gatilho de questionário Laravel é somente o save do Orçamento. Falta explicitar a avaliação idempotente de questionários próprios de Contrato, quando parametrizados.
- `NÃO LOCALIZADO` — não há teste de integração cobrindo serviços, séries, entrega/frete, vínculo inverso de origem, atendimento correlacionado e questionário de Contrato na mesma conversão.

## Spec boundary

Este ticket **não deve receber `$to-spec` isolado**: isso recriaria o risco de um segundo fluxo de geração. Suas invariantes entram como cenário obrigatório do primeiro spec do núcleo do Cadastro de Contratos. A implementação desse spec deve adaptar o comando Laravel existente ao serviço canônico e manter os testes de geração do Orçamento, acrescentando cobertura de paridade e idempotência. Fatias posteriores continuam responsáveis pelos detalhes internos de produtos/séries, pagamentos, estoque, logística e questionários.
