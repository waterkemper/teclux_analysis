Type: task
Status: resolved
Blocked by: 01, 02, 03, 06
Unblocks: 20, 21, 22, 23, 24

## Question

Como devem ser fatiadas as operações transversais do Contrato — atendimentos, contatos, questionários, entrega/frete, fotos, cancelamento, exclusão, venda perdida, cópia, impressão, relatórios, e-mail, auditoria e integrações — entre componentes genéricos reutilizáveis, specs próprios e simples integrações do shell?

Usar as soluções já investigadas para Orçamentos e a Consulta de Contratos como precedentes, registrando divergências específicas do Contrato.

## Resolution

### Regra de fatiamento

- `DECISÃO NOVA` — uma operação é **integração simples do shell** quando já existe engine/componente genérico e o Contrato apenas fornece identidade, contexto e capability; é **adapter/spec próprio** quando o engine existe mas falta traduzir a fotografia do Contrato; é **domínio próprio** quando altera situação ou compensa estoque, financeiro, fiscal ou logística.
- `DECISÃO NOVA` — nenhuma dessas operações será implementada dentro do agregado principal por conveniência de tela. O shell coordena comandos e projeções independentes e atualiza somente as áreas afetadas.
- `CONFIRMADO` — o DFM/PAS Delphi coloca na mesma tela botões e abas para Contatos, Atendimento, Fotos, Histórico, Enquete, Arquivos, devoluções, cópia, impressão e exclusão/cancelamento. Evidências: declarações em `delphi/apps/vendas/fmcadastrocontratos.pas:143-522`, handlers em `:585-693` e units em `:830-833`.
- `POSSÍVEL BUG LEGADO` — essa proximidade visual não prova uma única fronteira transacional. O monólito da tela não será reproduzido como um único serviço.

### Matriz de destino

| Família | Destino | Decisão |
|---|---|---|
| Atendimentos | Integração simples | Reutilizar cadastro incorporado e histórico já usados por Orçamento/Consulta; contexto `CTR` e somente Contrato atual. |
| Contatos | Adapter leve + spec pequeno | Reutilizar editor de contatos do Orçamento; persistir contatos do Contrato, sem atualizar automaticamente contatos mestres do Cliente. |
| Questionários | Adapter + spec próprio | Reutilizar engine genérico; criar contexto de Contrato e disparos parametrizados nas transições definidas. |
| Fotos | Integração simples | Reutilizar galeria global somente leitura a partir da miniatura do produto selecionado. |
| Anexos | Integração simples/adaptação de contexto | Reutilizar infraestrutura genérica com política e chave canônica de Contrato. |
| Venda perdida | Integração simples | Reutilizar engine genérico e builder de abertura de Contrato já existente; não acoplar a cancelamento. |
| Cancelar/excluir/reverter/devolver | Domínio próprio | Tarefa e specs próprios por envolver situação, movimentos e compensações. |
| Copiar Contrato/produtos | Domínio próprio | Tarefa própria; gera novo rascunho, nunca clona efeitos. |
| Impressão/PDF | Adapter/orquestração | Reutilizar serviços de impressão de Contrato; consolidar opções e política do Cadastro. |
| E-mail | Adapter + spec pequeno | Reutilizar engine documental genérico nos dois modos de entrega já definidos. |
| Relatórios | Integração simples | Abrir Consulta/relatórios existentes com o Contrato atual ou seleção; não incorporar gerador no Cadastro. |
| Auditoria/log/histórico técnico | Projeção própria | Reutilizar timeline e triggers `_log_new`; definir leitura agregada do Contrato e correlação de comandos. |
| Integrações externas | Outbox/consumidores | Publicar eventos após commit; nenhuma API externa dentro da gravação principal. |

### Relacionamento: atendimentos, contatos e questionários

- `CONFIRMADO` — o Delphi abre atendimento para o Contrato e também cria atendimentos automáticos em eventos como cancelamento/agendamento; evidências `delphi/apps/vendas/fmcadastrocontratos.pas:443,647` e `delphi/apps/vendas/dmcadastrocontratos.pas:5908`, `:8072`.
- `CONFIRMADO` — a Consulta Laravel já exibe atendimentos do Contrato e possui embed testado: `laravel/backend/resources/js/Components/erp/vendas/ConsultaContratosDetalheAtendimentosGrid.tsx`, `ConsultaContratosUltimoAtendimentoPanel.tsx` e `laravel/backend/tests/Feature/Vendas/ConsultaContratosAtendimentoEmbedTest.php`.
- `CONFIRMADO` — o Laravel possui modal incorporável e host registry para Atendimento: `AtendimentoCadastroEmbedModal.tsx`, `AtendimentoEmbedHostRegistry.php` e testes `AtendimentoEmbedStoreTest.php`/`AtendimentoEmbedBootstrapTest.php`.
- `DECISÃO NOVA` — o Cadastro apenas fornece `document_type=contrato`, número, Cliente e callback de atualização. Novo atendimento e histórico ficam na área Relacionamento; ações automáticas usam o mesmo serviço, sem simular cliques.
- `CONFIRMADO` — o Delphi mantém `qryContatos` no conjunto transacional e abre um cadastro específico; evidências `delphi/apps/vendas/fmcadastrocontratos.pas:398-399`, `:520-522`, `:690-693` e `delphi/apps/vendas/dmcadastrocontratos.pas:7934-7935`.
- `CONFIRMADO` — o Laravel já tem contatos do Orçamento com controller, requests, aba e testes: `OrcamentoParteContratanteContatosController.php`, `Store/Update/DestroyParteContratanteContatoRequest.php`, `ContatosTab.tsx` e `OrcamentoParteContratanteContatosTest.php`.
- `DECISÃO NOVA` — Contato do Contrato é fotografia relacional desta venda. Alteração não muda o Cliente mestre. O adapter deve expor a mesma interface da aba de Orçamento e usar `revision` do Contrato.
- `CONFIRMADO` — o Delphi aciona Enquete durante gravações/transições e também por botão; evidências `delphi/apps/vendas/fmcadastrocontratos.pas:492,667` e `delphi/apps/vendas/dmcadastrocontratos.pas:7955`, `:8005`.
- `CONFIRMADO` — o Laravel possui `QuestionarioAplicacaoEngine`, resolver por adapter e modal reutilizável: `laravel/backend/app/Application/Shared/QuestionarioAplicacao/QuestionarioAplicacaoEngine.php`, `QuestionarioDocumentContextAdapterResolver.php` e `QuestionarioAplicadorModal.tsx`.
- `DIVERGENTE` — foi localizado adapter de Orçamento, mas não de Contrato: `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/QuestionarioAplicacao/OrcamentoQuestionarioContextAdapter.php`.
- `DECISÃO NOVA` — questionário merece spec de adapter/disparo, mas não novo engine. A não aplicação continua sem exigir motivo, conforme decisão anterior do domínio.

### Fotos e anexos

- `CONFIRMADO` — o Delphi possui botão de visualização de foto e infraestrutura compartilhada; evidência `delphi/apps/vendas/fmcadastrocontratos.pas:458,651`.
- `CONFIRMADO` — o Laravel já possui `ProductPhotoGalleryModal`, miniatura clicável, sequência entre produtos e services de autorização/fotos: arquivos sob `resources/js/Components/product`, `ProductPhotoService.php` e `ProductPhotoAuthRegistry.php`.
- `DECISÃO NOVA` — nenhuma feature específica de fotos do Contrato. A coluna de miniatura do grid abre a galeria somente leitura do produto; navegação usa apenas os produtos do Contrato. Serviços e linhas sem produto não participam.
- `CONFIRMADO` — o Delphi oferece Arquivos Anexados por comando; evidência `delphi/apps/vendas/fmcadastrocontratos.pas:512,685`.
- `CONFIRMADO` — o Laravel possui botão genérico, policy, contexto de domínio e object storage para anexos: `AnexosCommandBarButton.tsx`, `ArquivoAnexoPolicy.php`, `ArquivoAnexoContext.php` e `AttachmentObjectStorageInterface.php`.
- `DECISÃO NOVA` — usar contexto canônico `contrato/<numero>` e política do módulo. Upload não participa da transação de gravação do Contrato; o vínculo só aparece após persistência bem-sucedida do objeto/metadado.

### Venda perdida

- `CONFIRMADO` — o Laravel já possui engine e adapter/builder de abertura para Contrato: `VendaPerdidaCaptureEngine.php`, `VendaPerdidaCaptureAdapterResolver.php` e `ContratoVendaPerdidaOpeningBuilder.php`, com testes em `VendaPerdidaCaptureFeatureTest.php`.
- `DECISÃO NOVA` — o shell apenas abre `VendaPerdidaCaptureModal` com o Contrato atual. Motivo inicia em branco para preenchimento pelo usuário, conforme decisão anterior.
- `DECISÃO NOVA` — registrar venda perdida não cancela o Contrato automaticamente. Se o fluxo exigir ambos, o usuário executa comandos distintos ou uma futura orquestração explícita; não haverá efeito oculto.

### Cancelamento, exclusão, reversão e devolução

- `CONFIRMADO` — o Delphi usa F6 de modo contextual; para Contrato faturado pergunta entre voltar a Reservado ou cancelar e verifica trocas/devoluções. Evidências `delphi/apps/vendas/fmcadastrocontratos.pas:934-955`, `:2111-2185`.
- `CONFIRMADO` — `ExcluirContrato` pode criar Atendimento de cancelamento e diferencia cancelamento do orçado/reservado; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:5899-5959`.
- `DECISÃO NOVA` — esta família não pode ser derivada do F6 do Orçamento. Exige matriz por `O/R/F/C`, guardas financeiras/fiscais/logísticas, prova sensível e movimentos compensatórios definidos nas tarefas anteriores.
- `DECISÃO NOVA` — “excluir” só se aplica a rascunho ainda sem identidade/efeitos; Contrato persistido é cancelado/revertido, preservando histórico.
- `DECISÃO NOVA` — devolução/troca após `F` é operação externa referenciada ao Contrato/documento/item, não edição negativa de quantidade no Cadastro.
- `NÃO LOCALIZADO` — não foi encontrado no Laravel comando geral de cancelamento/reversão/devolução de Contrato. Fica em “Definir cancelamento, reversão e devolução do Contrato”.

### Cópia

- `CONFIRMADO` — o Delphi permite copiar Contrato/produtos em estados iniciais, seleciona quantidades e produz novo número; evidências `delphi/apps/vendas/fmcadastrocontratos.pas:248-250`, `:940`, `:970`, `:3891-3900` e `delphi/apps/vendas/dmcadastrocontratos.pas:4453-4511`, `:4820-4822`.
- `POSSÍVEL BUG LEGADO` — o legado copia uma fotografia extensa campo a campo, inclusive dados que podem estar obsoletos. Essa lista não será tratada como contrato de cópia.
- `DECISÃO NOVA` — copiar cria novo rascunho `O`, com nova identidade e `origin_type=contrato`, `origin_id`. Nunca copia situação, reserva/movimentos, parcelas realizadas, documentos, séries consumidas, entregas, atendimentos, autorizações, auditoria ou anexos.
- `DÚVIDA` — itens, preços, Cliente, proposta financeira, agenda, frete e contatos precisam de matriz “copiar/recalcular/perguntar”; fica em tarefa própria.

### Impressão, relatórios e e-mail

- `CONFIRMADO` — o Delphi reúne em um modal contrato, meia página, fotos, carnê, boleto, saldo, etiquetas e envio de boleto; evidência `delphi/apps/vendas/fmcadastrocontratos.pas:1957-2007`.
- `CONFIRMADO` — há parâmetro `SoImprimirFaturados` e opção de fotos; evidência `delphi/apps/vendas/fmcadastrocontratos.pas:1966-1989`. A tecnologia matricial/FastReport não é requisito.
- `CONFIRMADO` — o Laravel já possui impressão/PDF do Contrato e Consulta: `ContratoImpressaoService.php`, `ContratoClienteImpressaoOrchestrator.php`, `ConsultaContratosImpressaoService.php`, `ContratoClienteImpressaoDialog.tsx` e testes correspondentes.
- `DECISÃO NOVA` — “Imprimir Contrato” no Cadastro chama a mesma preparação/PDF existente, com opções compatíveis; carnê, boleto, saldo e etiquetas são comandos documentais/financeiros separados, não variantes do mesmo PDF.
- `DECISÃO NOVA` — relatórios em lote pertencem à Consulta de Contratos. O Cadastro pode abrir a Consulta filtrada pelo número atual; não duplica filtros/exportação.
- `CONFIRMADO` — o Laravel possui engine genérico de e-mail documental, dois modos de entrega e adapter de Orçamento: `DocumentEmailEngine.php`, `DocumentEmailDeliveryRouter.php`, `LaravelDocumentEmailDelivery.php`, `SiteDocumentEmailDelivery.php` e `OrcamentoDocumentEmailAdapter.php`.
- `DIVERGENTE` — não foi localizado adapter de e-mail do Contrato.
- `DECISÃO NOVA` — criar adapter de Contrato que reutilize seu PDF, destinatários/assunto padrão e fotografia; o engine mantém preview, fila/idempotência e, quando iTeclux configurado, somente inserção na tabela de saída.

### Auditoria, log e histórico

- `CONFIRMADO` — o Delphi possui visualizadores de histórico do Contrato e log de parcelas; evidência `delphi/apps/vendas/fmcadastrocontratos.pas:464,484,661,663`.
- `CONFIRMADO` — o Laravel já tem log de parcelas (`ParcelasLogService.php`, `ParcelasLogModal.tsx`) e timeline genérica (`RegistryAuditTimeline.tsx`).
- `CONFIRMADO` — conforme contexto confirmado do ERP, triggers `_log_new` registram alterações nas tabelas novas; Delphi não as consulta. Auditoria, log e histórico técnico representam a mesma capacidade de rastreabilidade, sem apagar históricos funcionais como Atendimento.
- `DECISÃO NOVA` — a timeline do Contrato agrega cabeçalho, itens, serviços, proposta/parcelas e comandos sensíveis por correlation id, mas não mistura Atendimento, documento fiscal ou entrega como se fossem simples field diffs; estes aparecem como eventos vinculados.
- `DECISÃO NOVA` — autoria efetiva inclui operador e, quando houver, autorizador. Toda transição e compensação registra before/after sem dados secretos.
- `DÚVIDA` — nomes exatos das tabelas `_log_new`, chaves e cobertura das tabelas do Contrato precisam de inventário próprio.

### Integrações e atualização do shell

- `DECISÃO NOVA` — após um comando transversal, o shell invalida somente projeções afetadas: Relacionamento, Documentos, Entrega, Auditoria ou cabeçalho/capabilities. Não recarrega e sobrescreve um rascunho comercial silenciosamente.
- `DECISÃO NOVA` — efeitos externos usam outbox e idempotency key. E-mail, storage, impressão remota, API e publicação de eventos nunca ficam dentro da transação curta do Contrato.
- `DECISÃO NOVA` — componentes reutilizáveis recebem contexto tipado e capabilities do servidor; não inferem permissão pela visibilidade do botão.

## Tickets graduated

- [Integrar relacionamento, questionários, fotos e anexos ao shell](20-integrar-relacionamento-questionarios-fotos-e-anexos-ao-shell.md)
- [Definir cancelamento, reversão e devolução do Contrato](21-definir-cancelamento-reversao-e-devolucao-do-contrato.md)
- [Definir semântica de cópia do Contrato](22-definir-semantica-de-copia-do-contrato.md)
- [Consolidar impressão, relatórios e e-mail do Contrato](23-consolidar-impressao-relatorios-e-email-do-contrato.md)
- [Definir projeção de auditoria e integrações do Contrato](24-definir-projecao-de-auditoria-e-integracoes-do-contrato.md)

## Spec boundary

Esta tarefa é somente um mapa de decomposição e **não deve receber `$to-spec` abrangente**.

- Fotos, Atendimento, Venda Perdida, entrega em loja e relatórios são integrações do shell sobre capacidades existentes.
- Contatos, Questionários, adapter de frete e adapter de e-mail comportam specs pequenos e independentes.
- Cancelamento/reversão/devolução, cópia, auditoria e execução logística quantitativa exigem resolver suas tarefas antes do `$to-spec`.
