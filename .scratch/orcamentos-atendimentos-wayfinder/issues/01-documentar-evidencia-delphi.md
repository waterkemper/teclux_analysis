# Documentar a evidência Delphi da aba Atendimentos

Type: task
Status: resolved
Blocked by:

## Question

Qual é o comportamento completo e comprovável da aba Atendimentos e do botão Atendimento no Cadastro de Orçamentos Delphi, considerando conjuntamente `fmorcamentos.pas/.dfm`, `dmorcamentos.pas/.dfm`, o frame compartilhado `frAtendimentosDocumentos.pas/.dfm` e as units chamadas: filtro, campos, ordenação, atualização, habilitação, contexto enviado ao cadastro, permissões, parâmetros, follow-ups e efeitos colaterais?

## Answer

### Síntese

**CONFIRMADO** — No Cadastro de Orçamentos Delphi, a aba `&7 - Atendimentos` é uma visualização textual e somente leitura dos registros de `atendimentos` vinculados ao Orçamento corrente. A inclusão é iniciada fora da aba, pelo botão `Atendimento F10`, e abre o Cadastro de Atendimentos no modo `IncluirFollowupOrcamento`. Não há edição, exclusão nem abertura de um Atendimento a partir da aba.

### Composição e ciclo da interface

- **CONFIRMADO** — O formulário possui o botão `sbnAtendimento`, com hint `Cadastro de atendimentos`, caption `Atendimento F10` e evento `sbnAtendimentoClick` (`delphi/apps/vendas/fmorcamentos.dfm:31-37,93`).
- **CONFIRMADO** — A página incorpora `TfraAtendimentosDocumentos`; seu único componente visual é um `TRichEdit` com `ReadOnly=True` e rolagem vertical (`delphi/apps/vendas/fmorcamentos.dfm:4317-4334`; `delphi/repositorio/frAtendimentosDocumentos.dfm:14-30`).
- **CONFIRMADO** — O host fornece callbacks para obter o Orçamento e o tipo de documento (`delphi/apps/vendas/fmorcamentos.pas:448-449`). `GetOrcamento` devolve o código corrente e `GetTipoDocumento` devolve `'2'`, identificador de Orçamento (`delphi/apps/vendas/dmorcamentos.pas:6068-6075`).
- **CONFIRMADO** — O frame tenta carregar os dados ao entrar nele e ao redimensioná-lo. Só reabre a consulta quando muda o documento ou é solicitado `Reabrir=true` (`delphi/repositorio/frAtendimentosDocumentos.pas:73-128`).
- **CONFIRMADO** — Há atualizações forçadas após o callback `OnScrollClientes`, cancelamento/exclusão, envio de e-mail e retorno do Cadastro de Atendimentos (`delphi/apps/vendas/fmorcamentos.pas:625-669,1489-1527,1727-1730,1757-1761`).
- **POSSÍVEL BUG LEGADO** — `vReabirAtendimentosPendente` recebe `true` ao abrir o cadastro e é testada em todo `FormActivate`, mas não é redefinida para falsa em nenhuma referência localizada. Isso pode provocar consultas posteriores desnecessárias (`delphi/apps/vendas/fmorcamentos.pas:319,1753,1757-1761`). Não converter em requisito.

### Consulta, filtro e ordenação

- **CONFIRMADO** — Para `TipoDocumento='2'`, o frame informa `orcamento`, seleciona `tipoatendimento=2`, reabre a query e renderiza o resultado (`delphi/repositorio/frAtendimentosDocumentos.pas:73-113`).
- **CONFIRMADO** — O SQL consulta `atendimentos` e aplica `a.orcamento=:orcamento`. O ramo de Contrato só vale para `tipoatendimento=1`; nesta aba, o conjunto fica restrito ao Orçamento corrente (`delphi/repositorio/frAtendimentosDocumentos.dfm:49-73`).
- **CONFIRMADO** — A query traz `origem`, `codigo`, `data`, `lembrar`, `informes`, `tipo`, descrição do tipo, `assunto`, usuário/nome, `datainclusao`, hora do lembrete e `status` (`delphi/repositorio/frAtendimentosDocumentos.dfm:49-73`).
- **CONFIRMADO** — A ordem é `coalesce(a.origem,a.codigo+1) desc, a.datainclusao desc`: prioriza famílias pela raiz e depois a inclusão dentro delas; não é necessariamente uma ordem global estrita do mais recente para o mais antigo (`delphi/repositorio/frAtendimentosDocumentos.dfm:49-73`).

### Renderização do histórico

- **CONFIRMADO** — Sem registros, o RichEdit é limpo e permanece vazio; não há mensagem de estado vazio (`delphi/biblio/biblio.pas:6468-6544`).
- **CONFIRMADO** — O cabeçalho mostra `assunto` e traduz apenas `status='A'` como `ABERTO`; qualquer outro valor aparece como `FECHADO`. Cada item mostra número, usuário, data/hora e `informes`. Tipo, lembrete e hora consultados não são exibidos (`delphi/biblio/biblio.pas:6468-6544`).
- **POSSÍVEL BUG LEGADO** — Com mais de um registro, o renderizador usa a segunda linha no cabeçalho, percorre da segunda até o fim e só então acrescenta a primeira. Ele rotaciona a primeira linha da query para o fim e pode mostrar assunto/status inesperado (`delphi/biblio/biblio.pas:6468-6544`). Não reproduzir automaticamente.
- **NÃO LOCALIZADO** — O frame não contém ação para abrir, editar ou excluir um item; a evidência sustenta apenas leitura textual (`delphi/repositorio/frAtendimentosDocumentos.pas:44-128`; `delphi/repositorio/frAtendimentosDocumentos.dfm:14-73`).

### Habilitação e abertura do novo Atendimento

- **CONFIRMADO** — `F10` só dispara o clique quando o botão está habilitado (`delphi/apps/vendas/fmorcamentos.pas:1281-1284`).
- **CONFIRMADO** — O botão é habilitado quando o Orçamento tem código não zero, situação `A` e possui Cliente identificado **ou** nome livre preenchido (`delphi/apps/vendas/fmorcamentos.pas:1917-1920`).
- **CONFIRMADO** — Sem código de Cliente, o Delphi chama `CriarNovoCliente(true)` e vincula o Cliente criado. Depois abre `TfrmCadastroAtendimento` com `IncluirFollowupOrcamento` e contexto: Cliente, tipo de Cliente, host `'O'`, Orçamento, assunto vazio, descrição da situação e validade (`delphi/apps/vendas/fmorcamentos.pas:1733-1753`).
- **DIVERGENTE** — A criação implícita de Cliente conflita com a decisão nova de exigir Cliente identificado e orientar seleção/Cadastro Expresso quando houver apenas nome livre. Não transportar como requisito.
- **CONFIRMADO** — Apesar do nome da operação, o código ativo prepara um novo registro; o bloco que abriria um Atendimento existente como follow-up está comentado (`delphi/apps/sac/fmcadastroatendimento.pas:711-735`).

### Dados iniciais, follow-ups e gravação

- **CONFIRMADO** — O data module busca o Atendimento mais recente do Orçamento. Se pertence a uma família, herda `origem`; se é raiz, usa seu `codigo` como origem. Também pode herdar lembrete futuro, hora e ficha de alerta (`delphi/apps/sac/dmcadastroatendimentos.pas:1005-1041`).
- **CONFIRMADO** — O novo registro recebe Orçamento, situação, Cliente/tipo, host `tipo='O'`, data, usuário responsável e usuário logado. O assunto fornecido é ignorado e o sistema força `ORÇAMENTO Nº <número>`. Nasce não concluído e recebe o primeiro tipo disponível para `'O'` (`delphi/apps/sac/dmcadastroatendimentos.pas:1043-1089`).
- **CONFIRMADO** — Todo registro novo nasce com `status='A'`, data/hora de inclusão do servidor, filial-base e hora de lembrete `00:00:00` (`delphi/apps/sac/dmcadastroatendimentos.pas:1821-1836`).
- **CONFIRMADO** — Na gravação, campos obrigatórios e informes são exigidos. O sistema gera o código, persiste Atendimento e informes separadamente e atualiza o `status` de toda a família (`origem` ou raiz) (`delphi/apps/sac/dmcadastroatendimentos.pas:579-724`; `delphi/apps/sac/dmcadastroatendimentos.dfm:2067-2082`).
- **CONFIRMADO** — O botão explícito de Follow-up reutiliza a raiz e copia tipo, Cliente, assunto, lembrete, Orçamento e Contrato (`delphi/apps/sac/fmcadastroatendimento.pas:943-972`; `delphi/apps/sac/dmcadastroatendimentos.pas:726-808`).

### Permissões, parâmetros e efeitos correlatos

- **NÃO LOCALIZADO** — Não foi encontrada permissão explícita para visualizar a aba ou iniciar a inclusão. A regra local encontrada é código/situação/Cliente (`delphi/apps/vendas/fmorcamentos.pas:1917-1920`). Isso não prova inexistência de controle herdado ou externo.
- **CONFIRMADO** — Se `Solicitarusuarionocadastrodeatendimentos` estiver ativo, gravar exige autenticação para definir o responsável; ausência de autorização impede a gravação (`delphi/apps/sac/dmcadastroatendimentos.pas:579-656`).
- **CONFIRMADO** — `ExclusaoOrcamento` seleciona exclusão/cancelamento; `ObrigarDigitacaoaoExcluir` pode exigir motivo e gerar Atendimento no cancelamento (`delphi/apps/vendas/fmorcamentos.pas:625-669`; `delphi/apps/vendas/dmorcamentos.pas:2273-2288`).
- **NÃO LOCALIZADO** — Não foi encontrado parâmetro para visibilidade da aba, filtro ou habilitação direta do botão.
- **CONFIRMADO** — O Delphi também registra Atendimentos por cancelamento, conversão em Contrato, e-mail e agendamento de produto (`delphi/repositorio/dmbasico.pas:29-30,1023-1027`; `delphi/apps/sac/dmcadastroatendimentos.pas:2103-2407`; `delphi/apps/vendas/dmorcamentos.pas:2273-2288,2725-2733,4689-4709`; `delphi/apps/vendas/fmorcamentos.pas:1489-1527`).
- **DECISÃO NOVA** — Esses efeitos automáticos serão apenas lacunas futuras; ficam fora do prompt atual, restrito à aba e à inclusão manual.

### Resultado para a comparação com Laravel

O inventário Laravel deve confrontar: filtro exclusivo pelo Orçamento corrente; autorização separada para visualizar/criar; lista somente leitura; campos apresentados; ordem global mais recente primeiro; modal existente; contexto de host Orçamento; validações de Orçamento salvo/ativo/Cliente identificado; fechamento do modal e atualização isolada da aba. Rotação da lista, criação implícita de Cliente e possível refresh permanente não devem ser copiados sem decisão explícita.
