Type: task
Status: resolved
Blocked by: 07, 12

## Question

Quais adapters, identidades canônicas, capabilities, callbacks de atualização e disparos são necessários para integrar ao shell do Contrato os componentes existentes de Atendimentos, Contatos, Questionários, Fotos e Anexos, sem duplicar engines ou alterar o Cliente mestre?

Confirmar especialmente a identidade do questionário, os disparos parametrizados e a fronteira transacional de contatos/anexos.

## Answer

### Contrato comum do shell

- `DECISÃO NOVA` — o shell fornece contexto tipado `{ documentType: contrato, documentId: numero, revision, cliente, filial, situacao, capabilities }`. Cada componente recebe somente sua fatia; não descobre identidade ou permissão por estado global/visibilidade.
- `DECISÃO NOVA` — Relacionamento carrega sob demanda Atendimentos, Contatos e Questionários. Fotos abre pela miniatura em Produtos. Anexos fica na barra persistente com contador. Não há abas permanentes para Fotos/Anexos.
- `DECISÃO NOVA` — callbacks semânticos `onAtendimentoCreated`, `onContatoChanged`, `onQuestionarioChanged` e `onAnexosChanged` invalidam somente contador, lista e timeline afetados; não recarregam a página nem sobrescrevem rascunho comercial.
- `DECISÃO NOVA` — projeções do agregado usam `contrato + revision`; Atendimentos, Questionários e Anexos mantêm versão própria. O backend recalcula capabilities após comandos relevantes.

### Atendimentos

- `CONFIRMADO` — o Delphi abre Atendimento com Cliente, tipo, contexto de venda, número, situação e contrato atual: `delphi/apps/vendas/fmcadastrocontratos.pas:4133-4144`.
- `CONFIRMADO` — o Laravel já tem contexto incorporável com host, Cliente/tipo e Contrato em `app/Support/CobrancaSac/AtendimentoEmbedContext.php:17-25`; a Consulta bloqueia Cliente, tipo e Contrato em `AtendimentoEmbedHostRegistry.php:26-31`.
- `DECISÃO NOVA` — acrescentar host `cadastro-contratos`, bloqueando `cliente`, `tipocliente` e `contrato`; reutilizar modal, endpoint, autorização e histórico da Consulta, sem novo engine/controller.
- `DECISÃO NOVA` — capabilities `relationship.atendimentos.view/create`. Após inclusão, atualizar lista, último atendimento, contador e timeline, sem mudar `revision`. Atendimentos automáticos chamam o mesmo serviço com idempotency/correlation id, sem simular cliques.

### Contatos: mesma UX, outra persistência

- `CONFIRMADO` — PAS e DFM usam conjuntamente a aba/grid (`fmcadastrocontratos.dfm:5271-5572`), handlers (`fmcadastrocontratos.pas:4651-4697`) e `qryContatos` cached/live (`dmcadastrocontratos.dfm:9603-9642`).
- `CONFIRMADO` — a query Delphi edita diretamente `contatosvfornecedores`, filtrada pelo Cliente/tipo (`dmcadastrocontratos.dfm:9619-9641`); novos registros recebem essas chaves mestres (`dmcadastrocontratos.pas:19629-19636`).
- `CONFIRMADO` — o CRUD Laravel do Orçamento também é global: `OrcamentoParteContratanteContatosService.php:31-119` grava pelo mestre; `OrcamentoParteContratanteContatosTest.php:14` declara CRUD de `contatosvfornecedores`.
- `DIVERGENTE` — o Contrato deve preservar fotografia relacional sem alterar o Cliente mestre. Reutilizam-se UX, campos e OCC do Orçamento, não seu endpoint/repository/tabela global.
- `DECISÃO NOVA` — identidade `contrato:<numero>/contato:<id>`, armazenamento documental próprio e versão da linha. Copiar contato do Cliente é ação explícita com `source_contact_id`; edições posteriores afetam somente a fotografia.
- `DECISÃO NOVA` — capabilities `relationship.contacts.view/create/update/delete`. Mutações curtas exigem `expectedVersion`; só devolvem nova `revision` do Contrato se o contato integrar formalmente a fotografia mutável em `O/R`.
- `NÃO LOCALIZADO` — não foi encontrada tabela de Contatos próprios do Contrato. O spec deve definir essa persistência e não apontar para `contatosvfornecedores`.

### Questionários: identidade e disparos

- `CONFIRMADO` — o engine Laravel exige tipo/id/revision, identidade canônica, Cliente/tipo, Filial, situação e editabilidade: `QuestionarioDocumentContext.php:14-27` e `QuestionarioDocumentContextAdapterInterface.php:9-40`.
- `DIVERGENTE` — existe apenas `OrcamentoQuestionarioContextAdapter` (`:23-129`); não existe adapter de Contrato.
- `DECISÃO NOVA` — criar adapter `type=contrato`. Contrato direto usa `contrato:<numero>`; originado de Orçamento usa a mesma identidade composta da origem, `orcamento_contrato:<orcamento>|<contrato>`, evitando duplicidade. A repetição já combina Questionário, Cliente/tipo e documento canônico em `CanonicalDocumentId.php:19-31`.
- `CONFIRMADO` — o Delphi dispara depois do commit bem-sucedido em `O` (`dmcadastrocontratos.pas:7931-7959`) e `R` (`:7972-8009`); o botão manual passa Cliente/tipo/Contrato e fica disponível até `F` (`fmcadastrocontratos.pas:4352-4362`).
- `CONFIRMADO` — a regra já documentada resolve `QUESTIONARIO ATUAL` pela Filial, exige disponibilidade/vigência e respeita `clientes.naoresponderquestionarios` para tipo `C`: `modules/vendas/orcamentos-aplicacao-questionarios/09-speckit-prompt.md:42-67`.
- `DECISÃO NOVA` — disparar o mesmo engine: pós-commit de gravação em `O/R`; pós-commit da geração pelo Orçamento, idempotente; e manualmente em `O/R/F`. Sem Cliente, opt-out ou modelo elegível, omitir sem motivo. Falha/pêndencia não reverte o Contrato.
- `DECISÃO NOVA` — capabilities `questionnaires.viewHistory/respond/editAnswers/triggerManual`. Callback atualiza pendência, histórico e timeline; não muda revision comercial.

### Fotos

- `CONFIRMADO` — Delphi abre o visualizador com o produto corrente (`fmcadastrocontratos.pas:4179-4183`); o botão separado está no DFM (`:6360-6472`).
- `CONFIRMADO` — Laravel já possui miniatura e modal reutilizáveis: `ProductPhotoThumbCell.tsx:76-133` e `ProductPhotoGalleryModal.tsx:34-109`.
- `DECISÃO NOVA` — clicar na miniatura abre o produto selecionado e navega pela sequência deduplicada de Produtos do Contrato. Serviços/linhas sem Produto não participam. Capability única `products.photos.view`; somente leitura, sem callback/revision. O botão lateral legado desaparece.

### Anexos: contexto documental e transação própria

- `CONFIRMADO` — o Delphi abre `CLIENTES/<cliente>`, não anexos do Contrato: `fmcadastrocontratos.pas:4580-4586`.
- `CONFIRMADO` — Laravel hoje admite apenas `CLIENTES`, `ATENDIMENTOS` e `OS` em `ArquivoAnexoContext.php:8-30`; a policy cobre somente esses tipos em `ArquivoAnexoPolicy.php:38-58`.
- `DIVERGENTE` — falta contexto/policy de Contrato. Usar `CLIENTES/<cliente>` repetiria a ambiguidade Delphi e compartilharia arquivos entre contratos.
- `DECISÃO NOVA` — estender a infraestrutura com `CONTRATOS/<numero>` (chave lógica `contrato:<numero>`) e policy de Contratos. Reutilizar modal/storage e `AnexosCommandBarButton`, que já suporta visibilidade, contador e bloqueio (`:31-59`).
- `DECISÃO NOVA` — capabilities `attachments.view/create/updateMetadata/delete/download`. Botão somente após existir número e `view`; mutações dependem das capacidades específicas.
- `DECISÃO NOVA` — upload não participa da gravação do Contrato: persiste objeto, depois confirma metadado/vínculo idempotente. Exclusão é lógica/auditável. Callback atualiza contador/lista/timeline e não altera Cliente mestre nem revision comercial.

### Matriz de integração

| Capacidade | Identidade | Reutiliza | Adapter novo | Revision do Contrato |
|---|---|---|---|---|
| Atendimento | Contrato + Cliente/tipo | modal, engine, histórico | host | não |
| Contato | `contrato/contato` | UX, validação, OCC | resource/persistência | condicional em `O/R` |
| Questionário | `contrato:n` ou `orcamento_contrato:o|n` | engine, modal, elegibilidade | context/disparos | não |
| Foto | Produto + sequência | miniatura, galeria, auth | contexto | não |
| Anexo | `CONTRATOS/n` | modal, storage, botão | tipo/policy/rotas | não |

### Spec boundary

Esta fatia comporta dois `$to-spec` pequenos:

1. **Integrar Relacionamento ao Cadastro de Contratos** — Atendimento, Contatos documentais e adapter/disparos de Questionários.
2. **Integrar Fotos e Anexos ao Cadastro de Contratos** — galeria no grid e contexto/policy/transação de Anexos.

O primeiro deve explicitar que apenas a interface de Contatos é reutilizada; usar o service global do Orçamento violaria o requisito. Nenhuma engine existente será duplicada.
