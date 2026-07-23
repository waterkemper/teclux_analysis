# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para integrar **Atendimentos, Contatos e Questionários** ao shell do Cadastro de Contratos — Etapa 7 (Capacidades transversais), primeiro dos quatro specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), cujo shell/contexto tipado este spec consome.

Esta fatia é sobre **integrar via adapter**, não sobre construir engines novos. Atendimentos e Questionários já têm motor, modal, histórico e autorização prontos e reutilizados por Consulta de Contratos/Orçamento — este spec acrescenta um host/adapter novo, não recria nada. Contatos é o único caso onde a persistência do Orçamento **não pode** ser reutilizada: o Contrato precisa de fotografia própria, sem tocar o cadastro mestre do Cliente — construir isso é o único trabalho de "engine" real desta fatia.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real dos engines existentes e a ausência dos adapters/persistência de Contrato; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- o **contexto tipado do shell** consumido por cada componente de Relacionamento: `{ documentType: contrato, documentId: numero, revision, cliente, filial, situacao, capabilities }` — cada componente recebe só sua fatia, nunca descobre identidade/permissão por estado global;
- a área **Relacionamento** do shell, carregando Atendimentos/Contatos/Questionários sob demanda (protocolo de seção já definido na Fundação);
- **Atendimentos**: novo host `cadastro-contratos` em `AtendimentoEmbedHostRegistry`, bloqueando `cliente`/`tipocliente`/`contrato`, reutilizando modal/endpoint/autorização/histórico já existentes — nenhum engine ou controller novo; capabilities `relationship.atendimentos.view/create`; Atendimentos automáticos (ex.: os já criados pelo cancelamento do spec 11) chamam o mesmo serviço com idempotency/correlation id, sem simular cliques de UI;
- **Contatos**: persistência própria do Contrato (identidade `contrato:<numero>/contato:<id>`, versão de linha própria) — reaproveitando UX, campos e disciplina de concorrência (`expectedVersion`) do Orçamento, mas **nunca** seu endpoint/repository/tabela global (`contatosvfornecedores`); copiar um contato do Cliente é ação explícita (`source_contact_id`); capabilities `relationship.contacts.view/create/update/delete`; mutação só devolve nova `revision` do Contrato quando o contato integrar formalmente a fotografia mutável em `O/R`;
- **Questionários**: adapter novo `type=contrato` para o engine já existente (`QuestionarioAplicacaoEngine`/`QuestionarioDocumentContextAdapterInterface`) — Contrato direto usa identidade `contrato:<numero>`; Contrato originado de Orçamento usa a identidade composta da origem (`orcamento_contrato:<orcamento>|<contrato>`), evitando duplicidade de aplicação; disparo pós-commit em `O`/`R`, disparo idempotente pós-geração via Orçamento, e disparo manual em `O/R/F`; capabilities `questionnaires.viewHistory/respond/editAnswers/triggerManual`;
- callbacks semânticos (`onAtendimentoCreated`, `onContatoChanged`, `onQuestionarioChanged`) que invalidam somente contador/lista/timeline afetados — nunca recarregam a página nem sobrescrevem rascunho comercial, nunca mudam a `revision` comercial do Contrato (exceto Contatos, condicionalmente, conforme acima).

Não inclua: Fotos e Anexos (spec 14); Impressão/relatórios/e-mail (specs 15/16); qualquer alteração no cadastro mestre do Cliente a partir de Contatos do Contrato; qualquer engine novo de Atendimento ou Questionário — apenas adapters/hosts sobre os existentes; lógica de disparo automático de Questionário fora do já definido (pós-commit `O/R`, pós-geração via Orçamento, manual `O/R/F`).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual dos engines existentes e construa a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Support\CobrancaSac\AtendimentoEmbedContext` e `App\Support\CobrancaSac\AtendimentoEmbedHostRegistry` — já implementam host/contexto incorporável para Atendimento, com `HOST_CONSULTA_CONTRATOS`/`HOST_FICHA_FINANCEIRA` bloqueando exatamente `['cliente','tipocliente','contrato']`. Adicionar `HOST_CADASTRO_CONTRATOS` seguindo o mesmo padrão (`lockedFieldsForHost`/`allowedHosts`) é a extensão mínima; não crie um segundo mecanismo de host.
- `App\Application\Shared\QuestionarioAplicacao\QuestionarioAplicacaoEngine`, `QuestionarioDocumentContextAdapterResolver` e a interface `App\Domain\Shared\QuestionarioAplicacao\QuestionarioDocumentContextAdapterInterface` — engine genérico já pronto (tipo/id/revision, identidade canônica, Cliente/tipo, Filial, situação, editabilidade). `App\Infrastructure\Persistence\Legacy\Vendas\QuestionarioAplicacao\OrcamentoQuestionarioContextAdapter` é o único adapter existente hoje — use-o como precedente estrutural direto para o novo adapter `contrato`, registrado no mesmo resolver (via `AppServiceProvider`, mesmo padrão de `ConferenceTypeAdapterResolver`/`FreightQuoteDocumentAdapterResolver` já usado nos specs 6/7).
- `modules/vendas/orcamentos-aplicacao-questionarios/09-speckit-prompt.md` (linhas ~42-67) — já documenta a regra de resolução de `QUESTIONARIO ATUAL` por Filial, disponibilidade/vigência e `clientes.naoresponderquestionarios` para tipo `C`; reaproveite essa regra tal como está, não a redefina para Contrato.
- `App\Infrastructure\Persistence\Legacy\Vendas\OrcamentoParteContratanteContatosService`/teste correspondente — CRUD de Contatos do Orçamento, mas **grava no mestre** (`contatosvfornecedores`) filtrado por Cliente/tipo. Reaproveite UX/campos/disciplina de concorrência (OCC); **não** reaproveite o endpoint/repository/tabela — construir a persistência própria do Contrato é o trabalho real desta fatia. Confirme com uma busca dedicada que nenhuma tabela de Contatos próprios do Contrato já existe antes de desenhar a nova.
- `App\Services\Vendas\Contratos\CancelamentoContratosSensitiveOperationGate`/`CancelarContratoCommand::insertAtendimentoCancelamento` (spec 11, já implementado) — precedente real de Atendimento automático criado por comando de domínio (idempotente, sem simular clique); o adapter de host desta fatia deve permitir que esse tipo de chamada continue funcionando pelo mesmo serviço, não por um caminho de UI.
- Shell da Fundação (`01-speckit-prompt.md`) — área "Relacionamento" já nomeada; carregamento sob demanda e protocolo de seção já definidos; nenhum componente de Relacionamento existe ainda no checkout do Cadastro de Contratos.

## Evidência Delphi confirmada

### Contrato comum do shell

- `DECISÃO NOVA` — o shell fornece contexto tipado `{ documentType: contrato, documentId: numero, revision, cliente, filial, situacao, capabilities }`; cada componente recebe só sua fatia.
- `DECISÃO NOVA` — Relacionamento carrega sob demanda Atendimentos, Contatos e Questionários; não há abas permanentes só para esses dados.
- `DECISÃO NOVA` — callbacks semânticos invalidam somente contador/lista/timeline afetados; não recarregam a página nem sobrescrevem rascunho comercial.
- `DECISÃO NOVA` — projeções do agregado usam `contrato + revision`; Atendimentos e Questionários mantêm versão própria; o backend recalcula capabilities após comandos relevantes.

### Atendimentos

- `CONFIRMADO` — o Delphi abre Atendimento com Cliente, tipo, contexto de venda, número, situação e contrato atual. Evidência: `fmcadastrocontratos.pas:4133-4144`.
- `CONFIRMADO` — o Laravel já tem contexto incorporável com host, Cliente/tipo e Contrato (`AtendimentoEmbedContext.php:17-25`); a Consulta bloqueia Cliente/tipo/Contrato (`AtendimentoEmbedHostRegistry.php:26-31`).
- `DECISÃO NOVA` — acrescentar host `cadastro-contratos`, reutilizando modal/endpoint/autorização/histórico da Consulta, sem novo engine/controller.

### Contatos: mesma UX, outra persistência

- `CONFIRMADO` — PAS e DFM usam conjuntamente a aba/grid, handlers e query cached/live de Contatos. Evidências: `fmcadastrocontratos.dfm:5271-5572`; `fmcadastrocontratos.pas:4651-4697`; `dmcadastrocontratos.dfm:9603-9642`.
- `CONFIRMADO` — a query Delphi edita diretamente `contatosvfornecedores`, filtrada pelo Cliente/tipo; novos registros recebem essas chaves mestres. Evidências: `dmcadastrocontratos.dfm:9619-9641`; `dmcadastrocontratos.pas:19629-19636`.
- `CONFIRMADO` — o CRUD Laravel do Orçamento também é global e grava pelo mestre.
- `DIVERGENTE` — o Contrato deve preservar fotografia relacional sem alterar o Cliente mestre; reutilizam-se UX, campos e OCC do Orçamento, não seu endpoint/repository/tabela global.
- `NÃO LOCALIZADO` — não existe tabela de Contatos próprios do Contrato; este spec deve definir essa persistência, sem apontar para `contatosvfornecedores`.

### Questionários: identidade e disparos

- `CONFIRMADO` — o engine Laravel exige tipo/id/revision, identidade canônica, Cliente/tipo, Filial, situação e editabilidade.
- `DIVERGENTE` — existe apenas `OrcamentoQuestionarioContextAdapter`; não existe adapter de Contrato.
- `DECISÃO NOVA` — criar adapter `type=contrato`; Contrato direto usa `contrato:<numero>`; originado de Orçamento usa a identidade composta da origem, `orcamento_contrato:<orcamento>|<contrato>`, evitando duplicidade.
- `CONFIRMADO` — o Delphi dispara depois do commit bem-sucedido em `O` (`dmcadastrocontratos.pas:7931-7959`) e `R` (`:7972-8009`); o botão manual passa Cliente/tipo/Contrato e fica disponível até `F` (`fmcadastrocontratos.pas:4352-4362`).
- `DECISÃO NOVA` — disparar o mesmo engine: pós-commit de gravação em `O/R`; pós-commit da geração pelo Orçamento, idempotente; manualmente em `O/R/F`. Sem Cliente, opt-out ou modelo elegível, omitir sem motivo. Falha/pendência não reverte o Contrato.

## Estado Laravel confirmado

- Atendimento: engine/modal/histórico/autorização prontos; falta só o host `cadastro-contratos`.
- Questionário: engine genérico pronto; falta só o adapter `type=contrato` e o registro no resolver.
- Contatos: nenhuma persistência própria do Contrato existe; o único CRUD existente (Orçamento) grava no cadastro mestre e não pode ser reaproveitado como está.
- Nenhum dos três componentes está hoje integrado ao shell do Cadastro de Contratos (nenhuma aba/área de Relacionamento existe no checkout).

## Decisões obrigatórias

1. Nenhum engine de Atendimento ou Questionário é duplicado; esta fatia entrega apenas host/adapter novos sobre os existentes.
2. Contatos do Contrato têm persistência e identidade próprias (`contrato:<numero>/contato:<id>`), nunca o endpoint/repository/tabela global do Orçamento; copiar do Cliente é ação explícita e rastreável (`source_contact_id`).
3. Identidade do Questionário para Contrato direto é `contrato:<numero>`; para Contrato originado de Orçamento, é a identidade composta da origem (`orcamento_contrato:<orcamento>|<contrato>`) — nunca duas aplicações independentes para a mesma origem comercial.
4. Disparo de Questionário segue exatamente: pós-commit em `O/R`, pós-geração via Orçamento (idempotente), manual em `O/R/F`; ausência de Cliente elegível/opt-out omite sem bloquear o Contrato.
5. Callbacks semânticos invalidam só o que mudou (contador/lista/timeline); nunca recarregam a página, nunca mudam a `revision` comercial — exceto Contato quando formalmente integrado à fotografia mutável em `O/R`.
6. Atendimento automático (ex.: cancelamento do spec 11) usa o mesmo serviço do host novo com idempotency/correlation id — nunca simula interação de UI.
7. Capabilities (`relationship.atendimentos.*`, `relationship.contacts.*`, `questionnaires.*`) são resolvidas no servidor a cada carga/comando, seguindo a mesma precedência já fixada na Fundação.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações já fixada na Fundação; capabilities desta fatia são específicas e independentes entre si (visualizar Atendimento não concede criar Contato, por exemplo).
- Concorrência de Contatos usa `expectedVersion` por linha, seguindo a mesma disciplina OCC já usada no Orçamento — sem reaproveitar sua tabela.

## Testes obrigatórios

1. Host `cadastro-contratos` bloqueia corretamente `cliente`/`tipocliente`/`contrato`; nenhum outro campo pode ser sobrescrito pelo cliente HTTP.
2. Atendimento automático (idempotency/correlation id) não duplica registro em retry, e não depende de nenhuma simulação de clique.
3. CRUD de Contatos do Contrato: persistência própria, nunca grava em `contatosvfornecedores`; copiar do Cliente registra `source_contact_id`; concorrência por `expectedVersion` rejeita edição obsoleta.
4. Adapter de Questionário: identidade correta para Contrato direto e para Contrato originado de Orçamento (sem duplicar aplicação); disparo pós-commit `O/R`, pós-geração via Orçamento e manual `O/R/F`; ausência de Cliente elegível omite sem erro.
5. Callbacks: cada evento invalida só o que deveria (contador/lista/timeline), nunca a página inteira; `revision` comercial só muda quando o Contato integra formalmente a fotografia.
6. Autorização server-side: payload manipulado no frontend não concede visualizar/criar/editar sem a capability correspondente.

Prefira Feature tests nos endpoints/adapters reais; reutilize os testes existentes de Atendimento embutido (Consulta/Ficha) e do engine de Questionário como base de regressão.

## Entregáveis

- Contrato do host de Atendimento e do adapter de Questionário para Contrato.
- Contrato da persistência própria de Contatos do Contrato (identidade, versão de linha, cópia explícita do Cliente).
- Matriz de evidência Delphi × Laravel, deixando explícito o que já existe (engines) e o que esta fatia adiciona (hosts/adapters/persistência).
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- Fotos e Anexos (spec 14);
- Impressão, relatórios e e-mail (specs 15/16);
- qualquer alteração do cadastro mestre do Cliente a partir de Contatos do Contrato;
- novo engine de Atendimento ou Questionário — apenas adapters/hosts;
- alterar o schema Delphi além de migrations aditivas para a nova persistência de Contatos.
```
