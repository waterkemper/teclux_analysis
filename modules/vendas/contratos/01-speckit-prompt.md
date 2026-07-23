# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o núcleo, o ciclo de vida e o shell do Cadastro de Contratos — a fundação sobre a qual Cliente, Produtos/Serviços, pagamentos, estoque, logística e faturamento serão implementados em fatias posteriores.

Não implemente nesta etapa. O Laravel já possui Consulta de Contratos, Ficha Financeira, impressão e geração de Contrato a partir de Orçamento, mas nenhum Cadastro de Contratos canônico; não crie um segundo gravador paralelo a esses fluxos. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o checkout Laravel. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Não altere, complete ou descarte regras Delphi por inferência. Se o pacote fornecido for insuficiente ou ambíguo, registre uma DÚVIDA/BLOQUEIO objetiva para investigação no workspace de análise. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Esta é a Etapa 1 (Fundação) de nove etapas planejadas para o Cadastro de Contratos. A entrega termina quando existir:

- um único comando de aplicação autoritativo para criar (primeiro F8) e atualizar (F8 subsequente) o núcleo do Contrato, com `revision`, idempotency key e contexto de ator;
- reconhecimento da máquina documental `O/R/F/C/P/N` com as transições `O → R → F`, `O/R/F → C` e `F → R`, sem implementar os efeitos de negócio dessas transições (reserva, faturamento, cancelamento);
- o shell (abas horizontais, resumo e barra de comandos persistentes) com carregamento progressivo por área e cache por `revision`;
- `Localizar (F9)` reutilizando a Consulta de Contratos em modo de seleção;
- cálculo server-side de capabilities por precedência (regra de estado → Permissão → Parâmetro → prova sensível);
- a fronteira de fotografia do Cliente (sincronizada em `O/R/F`, congelada em `P/N/C`) sem construir o editor completo de Cliente;
- o envelope de auditoria/correlação coexistindo com as triggers `_log_new` físicas já confirmadas;
- a geração de Contrato a partir de Orçamento refatorada para delegar ao mesmo criador canônico, preservando idempotência e o endpoint público existente.

Não inclua nesta entrega: editores de Produtos/Serviços e motor comercial, planos/parcelas/Ficha Financeira, reserva/estoque/lotes/séries/conferência, entrega/frete/transportadora/montagem, faturamento `R → F` e seus efeitos, cancelamento/reversão/devolução detalhados, desmembramento, Atendimentos/Contatos/Questionários/Fotos/Anexos, impressão/relatórios/e-mail, importação de produtos, venda perdida, e qualquer preparação/emissão/confirmação fiscal (`P/N`). Essas fatias têm specs próprios e dependem desta fundação.

A liberação de acesso a Usuários reais permanece bloqueada até as fatias seguintes completarem o percurso `O → R → F`; esta entrega é aceita apenas como dependência interna quando os testes do seam passarem.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries, forms ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm`, `dmcadastrocontratos.pas/.dfm`, `dmcadastrocontratosauxiliar`, `dmcadastrocontratosmanutencao`, `dmcancelamentocontratos`, `dmoperacoescontratos`, `dmorcamentos` e de inspeção somente-leitura (`SET TRANSACTION READ ONLY`) do schema PostgreSQL efetivamente usado pelo Laravel (`information_schema`, `pg_get_functiondef`), sem alterar nem migrar nada.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações, sem exigir que o Cursor as reconfirme no código ou schema Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual, localizar seams existentes e construir a matriz de lacunas frente ao pacote fornecido.
- Quando uma decisão depender de informação Delphi ausente, não invente nem deduza: registre exatamente a pergunta que deve retornar ao workspace de análise.

## Investigação Laravel obrigatória

Analise o estado existente antes de desenhar o seam novo:

- `ConsultaContratosController`, `ConsultaContratosDetalheService`, `LegacyConsultaContratosRepository`, componentes `ConsultaContratos*` e `ConsultaContratosDetalheTabs.tsx` (carregamento tardio de Parcelas);
- `ConsultaContratosGravarAlteracaoService`, `LegacyContratoFilialVendedorWriteRepository` e a rota `registrar-entrega-loja` — precedente de request/change-set/`expected_revision`/`DB::transaction`;
- `GerarContratoOrcamentoService`, `GerarContratoOrcamentoCommand` e `LegacyGerarContratoOrcamentoRepository` — hoje um gravador completo que insere direto nas tabelas legadas;
- `LegacyOrcamentoRepository` — uso de `xmin` como token de concorrência já precedente no Laravel;
- `OrcamentosAuthorizationService` e `ConsultaContratosPolicy` (hoje só `viewAny/search`);
- `SensitiveOperationProofService` e os gates `ConsultaContratosGravarAlteracaoSensitiveOperationGate`, `ConsultaContratosRegistrarEntregaLojaSensitiveOperationGate`, `OrcamentoF6SensitiveOperationGate`;
- `ParameterReadBundle`, `CadastroParameterManifestContract`, `OrcamentoParameterManifest` e `ConsultaContratosParameterManifest`;
- `DatabaseAuditContext` (injeção de ator/origem/request id/filial na sessão PostgreSQL) e `SensitiveOperationAuthAuditLogger`;
- `RegistryAuditTimeline.tsx` (ator, origem, request id, resumo, changes, snapshots, paginação) e `LegacyParcelasLogRepository`/`ParcelasLogService`;
- `MarketplaceOutboxService` como precedente de outbox (chave, merge, retry, lock) — não é tabela de Contratos;
- `ErpCadastroCommandBar`, `ErpCadastroTabBar` e o Cadastro de Orçamentos (`Vendas/Orcamentos/Cadastro`) como precedente de shell, F9, confirmação de descarte e aviso de conflito por revisão;
- testes Feature existentes de geração de Contrato, gravação da Consulta e Cadastro de Orçamentos.

## Evidência Delphi confirmada

### Estrutura e escala

- `TfrmCadastroContratos` herda `TfrmCadastroPadrao`; abertura, inclusão, alteração, exclusão, salvar e cancelar não podem ser lidos apenas no form concreto (`fmcadastrocontratos.pas:39`; ancestral em `repositorio/fmcadastropadrao.pas:18`).
- O monólito soma cerca de 48 mil linhas entre form, DFM, data module principal (`TdtmCadastroContratos`, herda `TdtmBasico`, transação explícita `tstContrato`) e dois data modules auxiliares (`dmcadastrocontratosauxiliar`, `dmcadastrocontratosmanutencao`).
- Sete abas principais no DFM a partir das linhas 2181, 5703, 7487, 8284, 10399, 11404 e 11913; barra com Atendimento F10, Imprimir F7, Copiar F8, transição F11 e envio F12 nas linhas 37–656; estado/rótulo de F11 em `fmcadastrocontratos.pas:913-930`; atalhos em 2785–2812; troca de aba em 3612–3618.

### Máquina de estados e transições

| Origem | Destino | Comando | Natureza |
|---|---|---|---|
| novo | `O` | incluir/gerar | criação canônica |
| `O` | `R` | Reservar | avanço manual |
| `R` | `F` | Faturar | avanço manual, início do compromisso comercial |
| `O` | `C` | Cancelar | cancelamento parametrizado |
| `R` | `C` | Cancelar | desfaz reserva e cancela |
| `F` | `R` | Cancelar → Voltar | reversão compensatória |
| `F` | `C` | Cancelar → Cancelar | compensação e cancelamento |

- Avanço manual estritamente sequencial `O → R → F`; sem atalho `O → F` (`TfrmCadastroContratos.sbnAlterarSituacaoClick`). `R → O` não existe.
- Em `F`, o comando Cancelar oferece "Voltar" (`F → R`) e "Cancelar" (`F → C`); ambas bloqueadas quando há trocas/devoluções, parcelas pagas ou Nota de Simples Faturamento válida (`TfrmCadastroContratos.InternoExcluir`; `TdtmCadastroContratos.VoltarSituacaFaturadoparaCancelado` — o nome é enganoso, a rotina persiste `R`, não `C`).
- `ExclusaoContrato` governa o comando em `O`: Cancelar (`O → C`, preserva histórico), Excluir (remoção física, só em `O`) ou Perguntar. Exclusão física não é transição da máquina.
- `C` é terminal, sem reabertura. `P — Nota Parcial` e `N — Nota Fiscal` (`TtecSituacaoContrato`, `SetSituacaoContrato`, `ContratoSituacaoDocumentalMapper`) dependem de venda futura/Filial/item/simples-faturamento; nesta etapa apenas reconhecidos para leitura e bloqueio seguro, sem entrada/saída/derivação. Não transitam direto para `C`.
- Mutabilidade: `O` e `R` editáveis (mudanças em `R` que afetem reserva/estoque/valores/parcelas coordenam efeitos na mesma operação); `F/P/N/C` somente leitura exceto comandos explícitos (`ReadOnly`, comparações com `scFATURADO`, `AlterarEstadoBotoes:908`).
- `contratos.situacao` (documental) é distinta de `estado_ficha` (classificação financeira derivada — aberto/em atraso/quitado); não confundir as duas máquinas (`ContratoSituacaoDocumentalMapper` vs `ContratoFichaSituacaoMapper`).

### Abertura, gravação e concorrência

- `InternoIncluir` chama `IncluirContrato`, põe `qryContratos` em insert e abre imediatamente Parcelas/Produtos/Serviços/Plano/anexos — o novo Cadastro não deve reproduzir essa abertura ampla nem consumir identidade antes da primeira gravação.
- `GravarContrato`/`Perpetrar` grava conjuntos coordenados por `tstContrato`, valida Contrato/Cliente/Produtos/lotes/parcelas/descontos/totais e faz commit/rollback (`POSSÍVEL BUG LEGADO`: mistura persistência com emissão fiscal, impressão, agendamento, atendimento e atualização de outras telas no mesmo fluxo — amplitude não exigida no F8 inicial).
- Bloqueio pessimista via tabela/timer `bloqueiocontrato` (`BloquearContrato`, `VerificarContratoBloqueado`, `TimerVerificarBloqueioContrato`, `qryBloquearContrato`) é evidência do risco de concorrência, não requisito da interface web — será substituído por revisão otimista.

### Autorizações, permissões e parâmetros (matriz transversal do núcleo)

| Controle | Regra evidenciada |
|---|---|
| Incluir manualmente | `InclusaodeContratosSomenteViaOrcamento` desabilita Incluir (`fmcadastrocontratos.pas:932,1316`); geração via Orçamento continua permitida |
| Alterar vendedor | papel `Vendedor` recebe o próprio vendedor e não edita (`:1171-1179`); `PermitirAlterarVendedordoCliente=false` + Cliente com vendedor bloqueia campo (`:4057-4058`) |
| Alterar filial de venda | exige `UsuarioLogin.AlterarFilialVenda` (`:1183-1186`) |
| Alterar data de abertura | `Alterar_a_data_de_abertura_do_contrato` habilita edição (`:1341-1342`; `dmcadastrocontratos.pas:5311,18406`) |
| Desconto geral | `Bloquear_a_digitacao_do_desconto_geral` (`:1362-1364`); acima da alçada exige `DescontoExtra` (senha própria) ou usuário `ctAUTORIZADO` (`dmcadastrocontratos.pas:19848-19850`) |
| Observações protegidas do Cliente | `OcultarObservacoesClienteVendedor`, exceto Analista de Crédito/Administrador/Suporte/Gerente de Caixa (`:1292-1297`) |
| Cliente inadimplente | `CLIENTE_INADIMPLENTE_SO_COM_ANALISTA_DE_CREDITO` (`:1860,4414-4415`); liberação por Analista de Crédito/Gerente de Vendas (`dmcadastrocontratos.pas:18383-18388`; `dmoperacoescontratos.pas:1197-1202`) |
| Cancelar/reverter | situação + `AutorizacaoCancelarContratoFaturado` decide senha própria vs `DevolucaoProduto`/`ctAUTORIZADO` (`:2228-2264`; `dmcancelamentocontratos.pas:293-307`) — detalhe fino na fatia de cancelamento, mas o gate sensível comum nasce aqui |

Operações sensíveis usam prova de usuário/senha de uso único, vinculada a módulo/ação/Contrato/situação/revision e expiração curta; ator da sessão e autorizador são registrados separadamente. O texto genérico `ctAUTORIZADO`/`taSENHA` não define sozinho o conjunto completo de flags validados por `ObterAutorizacao` — cada fatia que usar esses caminhos fecha sua lista exata antes do respectivo spec; não presuma que "administrador" ou "gerente" sempre basta.

Precedência efetiva: regra invariável de domínio/estado → Permissão do Usuário → Parâmetro da Filial efetiva → prova de autorização sensível. Preferência de interface nunca relaxa os níveis anteriores.

### Sincronização Cliente → Contrato (schema PostgreSQL confirmado)

| `tipocliente` | Mestre | Atualização ampla da fotografia | Mudança de código | Situações |
|---|---|---|---|---|
| `C` | `clientes` | sim, quando `AtualizarDadosClientesContratos='TRUE'` | sim | fotografia ampla só `O/R/F`; código em todas |
| `F` | `fornecedores` | não localizada | sim | mudança de código em todas |
| `L` | `filiais` | não localizada | não localizada | nenhuma sincronização direta confirmada |

- `clientes_depoisatualizar` (`AFTER UPDATE`) sincroniza `C` com `WHERE cliente=NEW.codigo AND tipocliente='C' AND situacao IN ('O','R','F')`, copiando identidade/nome, família/avaliação, endereço/contato, residência/trabalho/renda, referências, avaliação cadastral e `contribicms` — lista explícita, não `SELECT *`.
- Mudança de `clientes.codigo` ou `conceito` atualiza `contratos`/`dadosfiscais`/`contatosvfornecedores`/`documentospag`/`notaspag` **sem filtro de situação** — DIVERGENTE frente à decisão de congelar `P/N/C`; tratar como manutenção de integridade referencial/projeção do mestre, não como reescrita da fotografia histórica.
- `clientes_antesatualizar` (`BEFORE UPDATE`) atualiza `dadosfiscais`/`notaspag` tipo `C` ao mudar `pessoatipo`/`pessoanumero`/`iddocumento`, sem filtro de situação; documento fiscal já autorizado nunca deve ser reescrito pela sincronização cadastral.
- Fluxo inverso Delphi: gravar Contrato `O/R` chama `AtribuirContratoNoCliente` antes do commit; para `C`, copia diferenças de volta para `clientes`; para `F`, `AtribuirContratonoFornecedor` copia para `fornecedores` (`dmcadastrocontratos.pas:7909-7935,2868-2967,3063-3084`) — este fluxo inverso não será reproduzido no Laravel.
- Qualquer `UPDATE contratos` da sincronização passa por `trg_contratos_audit_log_new`. No PostgreSQL, qualquer update muda `xmin`; `replicacao_set_timestamps_fn()` **não** incrementa `cloud_row_version` — não assumir que essa coluna muda.

### Auditoria física confirmada (schema PostgreSQL)

| Origem | Trigger `_log_new` | Chave copiada |
|---|---|---|
| `contratos` | `trg_contratos_audit_log_new` | `numero` |
| `produtoscontratos` | `trg_produtoscontratos_audit_log_new` | `contrato`, `produto`, `filial` |
| `produtoscontratoslotes` | `trg_produtoscontratoslotes_audit_log_new` | `contrato`, `produto`, `filial`, `lote` |
| `produtoscontratosseries` | `trg_produtoscontratosseries_audit_log_new` | `contrato`, `produto`, `filial`, `numeroserie` |
| `servicoscontratos` | `trg_servicoscontratos_audit_log_new` | `contrato`, `servico` |
| `parcelas` | `trg_parcelas_audit_log_new` | `contrato`, `numero` |
| `impostosretidoscontratos` | `trg_impostosretidoscontratos_audit_log_new` | `contrato`, `impostoretido`, `aplicacao` |

Envelope físico uniforme: `log_id`, colunas de chave, `trigger_mode` (INSERT/UPDATE/DELETE), `trigger_tuple` (new/diff/old), `trigger_changed`, `trigger_user_db`, `app_user_id/login/name`, `app_source`, `request_id`, `filial_codigo_ref`, `dados` (jsonb: snapshot completo em INSERT/DELETE, `{campo:{old,new}}` em UPDATE; `created_at/updated_at/cloud_row_version` ignorados no diff). `contratos`, `parcelas` e `produtoscontratos` mantêm simultaneamente os logs legados (`contratos_log`, `parcelas_log`, `produtoscontratos_log`) e os `_log_new` — coexistência deve deduplicar por fonte, nunca presumir identificador comum. As `_log_new` não têm `correlation_id`, `causation_id`, `event_type`, `revision` nem autorizador — isso é responsabilidade do evento de domínio aplicado por cima.

### Reconciliação do Contrato originado de Orçamento

- Delphi e Laravel criam o Contrato em `O`; o Orçamento passa de `A` para `T` e recebe o número; itens ficam com `vendido=quantidade` (`dmorcamentos.pas:4309-4311,4547-4553,4697-4704`).
- O comando Laravel atual (`GerarContratoOrcamentoCommand.php:55-146`) já exige confirmação, `expected_revision`, Orçamento aberto/válido, ao menos um produto/serviço, plano selecionado, estoque quando parametrizado, endereço quando exigido e Cliente válido, tudo na mesma transação; repetição normal é idempotente (`:175-198`).
- `LegacyGerarContratoOrcamentoRepository` insere hoje diretamente nas tabelas legadas — é um segundo gravador que deve se tornar adaptador do criador canônico do núcleo, preservando endpoint, gates e idempotência.
- Delphi chama `IncluirAtendimento_` antes de criar o Contrato e `AcionarTelaEnquete` após o commit (`dmorcamentos.pas:4725-4732`); Laravel já cria idempotentemente um atendimento de conversão e avalia questionário pós-transação — preservar, sem duplicar.
- Contrato criado por conversão nasce em `O` já numerado, sem reserva de estoque; detalhes de paridade de produtos/séries/serviços/parcelas/entrega pertencem às fatias correspondentes, não a esta.

### Shell e navegação (protótipo validado)

- Alternativa validada pelo usuário em 15/07/2026: abas horizontais, comandos e resumo persistentes, conteúdo em largura total, sem painel lateral permanente.
- Áreas: Geral, Cliente, Produtos, Serviços (quando parametrizado), Pagamentos, Entrega, Relacionamento (Contatos/Atendimentos/Questionários) e Documentos fiscais.
- Produtos abre inicialmente em Contrato existente ou originado de Orçamento; Contrato novo sem Cliente abre em Geral.
- Comandos primários: Novo, Gravar F8, ação contextual F6, Localizar F9, transição contextual F11 — F8 não repete o significado Delphi de Copiar.
- F9 reutiliza a Consulta de Contratos em modo de seleção; carga inicial traz núcleo/resumo/capabilities/revision/área inicial; demais abas carregam na primeira ativação com cache por Contrato+revision. Trocar de aba não grava; falha tardia fica isolada por aba; aba inaplicável não é renderizada; aba temporariamente indisponível fica explicada.

## Estado Laravel confirmado

- Existe Consulta de Contratos completa (filtros, detalhe, abas, impressão/exportação) e escrita limitada/protegida de filial/vendedor/entrega com `expected_revision`, gate de operação sensível e testes.
- Existe Ficha Financeira, impressão HTML/PDF e geração de Contrato a partir de Orçamento com request/serviço/repositório/teste — mas o gerador é um segundo gravador direto nas tabelas legadas.
- `ConsultaContratosPolicy` cobre apenas `viewAny/search` — não representa incluir, editar, gravar, transicionar ou autorizar o Cadastro.
- `ParameterReadBundle`/`CadastroParameterManifestContract`/`OrcamentoParameterManifest`/`ConsultaContratosParameterManifest` já resolvem parâmetros por Filial; falta um `ContratoCadastroParameterManifest` próprio do núcleo.
- `SensitiveOperationProofService` e gates equivalentes já implementam prova vinculada a módulo/ação; generalizar para o núcleo, não recriar modal de senha paralelo.
- `DatabaseAuditContext` já injeta ator/origem/request id/filial na sessão PostgreSQL, mas falta correlation/causation/comando/autorizador — isso deve ser acrescentado ou correlacionado via evento de domínio gravado na mesma transação.
- `RegistryAuditTimeline.tsx` já suporta ator/origem/request id/resumo/changes/snapshots/paginação — reutilizar e generalizar, não criar timeline exclusiva do Contrato.
- NÃO LOCALIZADO: fluxo completo de inclusão/abertura/edição/gravação do Cadastro; API agregada equivalente ao form Delphi; repository/migrations para as sete `_log_new` do núcleo; `ContratoCadastroParameterManifest`; policy de Cadastro para incluir/editar/transicionar/autorizar.

## Decisões obrigatórias

1. Um único seam de aplicação autoritativo governa carregar, criar (primeiro F8), atualizar (F8 + `expected_revision`) e carregar seção sob demanda; controllers/páginas/componentes nunca gravam direto nas tabelas legadas.
2. Contrato manual novo é rascunho local sem número até o primeiro F8 bem-sucedido; número é alocado e o Contrato é criado em `O` na mesma transação; abandono não cria registro vazio, falha não publica Contrato parcial.
3. F8 ordinário cria/atualiza somente dados mutáveis de `O/R`; não altera `situacao`, não implementa reserva, faturamento, cancelamento, reversão nem exclusão física.
4. Vocabulário do ciclo de vida: `O — Orçado`, `R — Reservado`, `F — Faturado`, `C — Cancelado`, `P — Nota Parcial`, `N — Nota Fiscal`. Grafo inicial reconhece `O → R → F`, `O/R/F → C` sob regras dedicadas e `F → R` compensatório; `C` é terminal. Esta fatia entrega os contratos de comando/capability dessas transições, não seus efeitos de domínio.
5. `F/P/N/C` são somente leitura para gravação ordinária; `P/N` são reconhecidos e exibidos sem receber entrada, saída ou derivação fiscal nesta fatia.
6. Concorrência otimista via token autoritativo PostgreSQL (`xmin` ou envelope equivalente) — não assumir que `cloud_row_version` muda. Conflito rejeita o comando completo e identifica seções divergentes; nunca há merge silencioso ou sobrescrita; locks de banco só durante o comando, nunca persistentes entre telas.
7. Autorização em quatro camadas independentes — acesso ao módulo/rota, capacidade da operação, regra parametrizada dependente do estado, prova de autorização sensível — recalculadas no servidor a cada carga/comando; nunca aceitar capacidades enviadas pelo navegador.
8. Acesso ao Cadastro é permissão de módulo dedicada, concedida a Usuários específicos, com bypass de administrador existente preservado; não filtra Contratos por Filial ou origem.
9. `InclusaodeContratosSomenteViaOrcamento` bloqueia Novo manual no servidor; conversão de Orçamento continua permitida.
10. Sincronização de fotografia do Cliente usa whitelist versionada comum a `C/F/L` em `O/R/F`; `P/N/C` mantêm snapshot congelado; identidade referencial (código) e `conceito` são tratados como projeção do mestre, não como reescrita da fotografia histórica; documento fiscal já autorizado nunca é reescrito pela sincronização. Não há fluxo inverso Contrato → cadastro mestre.
11. Geração via Orçamento é refatorada para delegar ao criador canônico do núcleo, preservando idempotência, gates e o endpoint público existentes; Contrato nasce em `O` numerado, sem reserva de estoque.
12. Envelope de auditoria/domínio (`event_id`, ator, autorizador, origem, Filial, `request_id`, `correlation_id`, `causation_id`, entidade, `revision`, changes seguros, links) complementa — sem substituir — as sete triggers `_log_new` físicas já confirmadas; alterações externas (Delphi/trigger) aparecem com autoria de origem explícita, nunca inventada.
13. Efeitos essenciais de comando (gravação, transições) falham fechado na mesma transação; consequências externas recuperáveis usam outbox genérico fora da transação curta, nunca dentro dela.
14. Mudanças de schema, se necessárias, são aditivas e compatíveis com Delphi — sem migração em massa, marca de propriedade, dual-write, rollback destrutivo ou desativação do Delphi.
15. Esta fundação define DTOs públicos e o protocolo de seção como contratos de extensão para as fatias seguintes; não deve conter cálculo de negócio provisório que possa colidir com Produtos/Serviços/pagamentos/estoque/fiscal.

## Comando autoritativo do núcleo

Defina um único comando/seam que:

1. autentica e autoriza a operação (módulo, capacidade, parâmetro, prova sensível quando aplicável);
2. para atualização, recarrega estado e `revision` autoritativos e valida `expected_revision`;
3. delega validação de cada seção alterada ao contrato de seção correspondente;
4. acumula erros estruturados por seção/campo/linha sem persistir parcialmente;
5. para criação, aloca número e persiste em `O` na mesma transação curta;
6. persiste todas as mudanças válidas atomicamente;
7. sincroniza fotografia do Cliente conforme whitelist e estado;
8. grava o envelope de auditoria/domínio;
9. incrementa/renova a `revision`;
10. cria/agenda outbox para efeitos externos fora da transação;
11. retorna a fotografia autoritativa completa e a nova `revision`.

Não confie apenas nas condições de habilitação da UI; todo comando revalida no servidor.

## Testes obrigatórios

Use como seam principal os endpoints reais do Cadastro e o comando de aplicação autoritativo; testes Feature devem observar resposta pública, estado persistido, `revision` e evento de auditoria/domínio juntos.

Cubra no mínimo:

1. Novo não consome número; primeiro F8 bem-sucedido aloca exatamente um número e persiste `O`; retry com mesma idempotency key devolve o mesmo resultado.
2. Atomicidade: seção inválida ou falha de persistência não deixa cabeçalho, seção, vínculo de origem, evento ou fragmento de outbox comitado.
3. F8 ordinário não altera `situacao`, não grava em `F/P/N/C`, não invoca reserva/faturamento/cancelamento/fiscal.
4. Tabela de capacidades por transição: permitidas `O → R`, `R → F`, `O/R/F → C`, `F → R`; proibidas `O → F`, `R → O`, reabertura de `C`, edição direta de situação, novas transições `P/N`.
5. Comandos de transição ainda não implementados retornam indisponível/não-implementado de forma segura — nunca simulam sucesso.
6. Autorização server-side: acesso direto/grupo, bypass de administrador, negação sem acesso, bloqueio de Novo por `InclusaodeContratosSomenteViaOrcamento`, conversão de Orçamento permanecendo permitida.
7. Precedência de capacidades com combinações de situação, Permissão, Parâmetro de Filial e prova sensível; payload manipulado no frontend não concede campo/comando.
8. Prova sensível: vínculo, expiração, uso único, rejeição por Contrato/ação/revision errados, autor/autorizador separados na auditoria, ausência de credenciais em storage/logs.
9. F9: integração de seleção com a Consulta de Contratos, confirmação de descarte de rascunho sujo, roteamento direto por número.
10. Carregamento progressivo: cache por `revision`, omissão de seção inalterada, gravação atômica multi-seção, isolamento de falha tardia por aba, roteamento estruturado de validação.
11. Concorrência: Contrato alterado após load por segundo comando Laravel, update direto simulando Delphi, e trigger de sincronização de Cliente — cada gravação obsoleta falha sem sobrescrever e identifica as seções afetadas.
12. Geração via Orçamento: delegação ao criador canônico, `O` inicial, `A → T` atômico, identidade de origem, número exibido, envio repetido idempotente; manter os testes de regressão já existentes.
13. Contrato criado manualmente e Contrato originado de Orçamento carregam pela mesma representação de shell e aceitam as mesmas regras de F8 ordinário.
14. Contexto de auditoria para escritas Laravel, fallback seguro para escritas externas, vínculo request/correlation/causation, `revision`, separação ator/autorizador, redação de segredos; `_log_new` técnico convivendo com um evento de domínio explicativo, sem duplicidade aparente.
15. Outbox: transacionalidade e idempotência sem chamar serviços externos reais; comando revertido não produz registro publicável; retry não duplica consequência.
16. Compatibilidade com Contratos legados sem os novos metadados aditivos: continuam localizáveis/carregáveis; metadado pode ser materializado sem alterar significado de negócio.
17. Testes de interação frontend apenas para o shell: atalhos, aba inicial, indicadores de alteração, estados somente leitura, comandos dirigidos por capability, carregamento progressivo, isolamento de erro e apresentação de conflito — sem duplicar regra de domínio no frontend.

Prefira Feature tests no endpoint/comando real; reutilize testes de geração de Orçamento, infraestrutura de operação sensível e padrões de teste da Consulta de Contratos e do Cadastro de Orçamentos. Não teste métodos privados.

## Entregáveis

Inclua:

- pacote de evidências Delphi organizado por etapa, sem nova inspeção do legado;
- matriz pacote Delphi × comportamento Laravel localizado, com referências concretas do checkout;
- contrato do seam autoritativo (entrada, validação, persistência, revision, auditoria, outbox);
- contratos de transição/capability por estado;
- fronteira de whitelist e sincronização do Cliente;
- manifesto de parâmetros e matriz de autorização do núcleo;
- contrato de evento de auditoria/domínio e sua convivência com as sete `_log_new`;
- contrato de shell (áreas, comandos, estados, carregamento progressivo, F9);
- plano de refatoração da geração via Orçamento para o criador canônico;
- critérios de aceitação e testes;
- riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- editores de Produtos, Serviços, motor comercial, planos/parcelas e Ficha Financeira;
- reserva, movimentos de estoque, lotes, séries e conferência;
- entrega, retirada, frete, transportadora, montagem e agenda logística;
- faturamento `R → F` e seus efeitos, cancelamento/reversão/devolução detalhados, desmembramento;
- preparação, emissão, submissão e confirmação fiscal, e qualquer transição que produza/regularize `P/N`;
- Atendimentos, Contatos, Questionários, Fotos, Anexos, impressão, relatórios e e-mail do Contrato;
- importar produtos de outro Contrato e venda perdida;
- liberar acesso a Usuários reais — permanece bloqueado até o gate ponta a ponta `O → R → F`;
- alterar o schema Delphi ou desativar o Cadastro Delphi;
- manter a cópia mínima/incompleta do repositório atual de geração como comportamento final.
```
