Type: task
Status: resolved
Blocked by: 01, 02

## Question

Qual é a matriz evidenciada de permissões, autorizações por usuário/senha, parâmetros de sistema/filial/usuário e regras de visibilidade ou habilitação que governam o Cadastro de Contratos e suas transições?

Distinguir controle de acesso, autorização sensível, preferência de interface e regra de negócio; identificar o que já possui equivalente reutilizável no Laravel.

## Answer

### Síntese

- `CONFIRMADO` — O Delphi não possui uma única permissão “editar contrato”. O comportamento resulta da combinação entre papel/flags do usuário logado, parâmetros resolvidos para a filial, situação do contrato e, em operações sensíveis, uma segunda credencial.
- `DECISÃO NOVA` — No Laravel, o Cadastro terá autorização em quatro camadas independentes: acesso ao módulo/rota; capacidade da operação; regra de negócio parametrizada e dependente do estado; prova de autorização sensível. Ocultar ou desabilitar controles é apenas projeção dessas decisões e nunca substitui a validação no servidor.
- `DECISÃO NOVA` — O backend devolverá `capabilities` efetivas para o contrato carregado. Cada comando deverá recalculá-las no servidor usando usuário da sessão, filial efetiva, situação e parâmetros; não aceitará capacidades enviadas pelo navegador.
- `DECISÃO NOVA` — Parâmetros serão catalogados por fatia funcional em manifestos tipados. Este ticket fixa o mecanismo e a matriz transversal; parâmetros fiscais de `P/N`, impressão e integrações permanecem nas respectivas fatias.

### Matriz transversal

| Controle | Classificação | Regra evidenciada / destino Laravel |
|---|---|---|
| Abrir/pesquisar o Cadastro | `DIVERGENTE` | A `ConsultaContratosPolicy` existente só expõe `viewAny/search`, por meio do acesso ao hub. Criar autorização própria do Cadastro, por rota cadastrada em `acessosmodulos`/`usuariosacessosmodulos`, seguindo `OrcamentosAuthorizationService`; administrador conserva bypass explícito. |
| Incluir contrato manualmente | `CONFIRMADO` | `InclusaodeContratosSomenteViaOrcamento` desabilita Incluir (`fmcadastrocontratos.pas:932,1316`). É regra de origem permitida, não preferência visual; deve bloquear também o comando no servidor. Contrato originado do orçamento continua permitido. |
| Alterar vendedor | `CONFIRMADO` | Usuário com papel `Vendedor` recebe o próprio vendedor e não edita o campo (`fmcadastrocontratos.pas:1171-1179`). Se o Cliente possui vendedor e `PermitirAlterarVendedordoCliente` é falso, o campo também fica somente leitura (`:4057-4058`). Tratar como capacidade de campo, revalidada na gravação. |
| Alterar filial de venda | `CONFIRMADO` | Exige flag `UsuarioLogin.AlterarFilialVenda` (`fmcadastrocontratos.pas:1183-1186`). É permissão por operação/campo; não derivar da mera visibilidade. |
| Alterar data de abertura | `CONFIRMADO` | `Alterar_a_data_de_abertura_do_contrato` habilita edição (`fmcadastrocontratos.pas:1341-1342`) e muda a data persistida (`dmcadastrocontratos.pas:5311`, `:18406`). É regra parametrizada de mutabilidade. |
| Alterar desconto geral | `CONFIRMADO` | `Bloquear_a_digitacao_do_desconto_geral` torna ambos os campos somente leitura (`fmcadastrocontratos.pas:1362-1364`). Desconto acima da alçada usa nova credencial: flag `DescontoExtra` permite confirmar pela própria senha; caso contrário exige usuário com `ctAUTORIZADO` (`dmcadastrocontratos.pas:19848-19850`). |
| Ver observações protegidas do Cliente | `CONFIRMADO` | `OcultarObservacoesClienteVendedor` oculta conteúdo, exceto para Analista de Crédito, Administrador, Suporte ou Gerente de Caixa (`fmcadastrocontratos.pas:1292-1297`). É autorização de leitura de dado sensível, não preferência de layout. |
| Cliente inadimplente | `CONFIRMADO` | `CLIENTE_INADIMPLENTE_SO_COM_ANALISTA_DE_CREDITO` aciona bloqueio/liberação (`fmcadastrocontratos.pas:1860,4414-4415`). A liberação solicita Analista de Crédito/Gerente de Vendas (`dmcadastrocontratos.pas:18383-18388`; `dmoperacoescontratos.pas:1197-1202`). Deve produzir prova vinculada ao comando e registrar autorizador. |
| Cancelar/reverter contrato | `CONFIRMADO` | A combinação situação + `AutorizacaoCancelarContratoFaturado` escolhe se a própria senha basta ou se é exigido usuário com `DevolucaoProduto`/`ctAUTORIZADO` (`fmcadastrocontratos.pas:2228-2264`; `dmcancelamentocontratos.pas:293-307`). A matriz detalhada fica na fatia de cancelamento, mas o Cadastro usará o gate sensível comum. |
| Faturar/emitir documento | `CONFIRMADO` | Faturamento pode exigir Analista de Crédito (`dmoperacoescontratos.pas:614-615`; `fmcadastrocontratos.pas:3491-3492`) e emissão fiscal exige `ctEMISSORNOTAFISCAL` (`dmcadastrocontratos.pas:2672-2673`). Fora do núcleo até `F`; registrar como capacidades separadas, nunca uma permissão genérica `update`. |
| Venda sem estoque/venda futura | `CONFIRMADO` | `TipoSenhaVendaSemEstoque` seleciona Gerente de Estoque ou Gerente de Vendas e `SolicitarAutorizacaoVendaFutura` determina a solicitação (`dmcadastrocontratos.pas:16777-16817`). Regras fiscais posteriores continuam fora desta fatia. |
| Trocar estoque da filial emitente | `CONFIRMADO` | Só aparece quando filiais não são independentes, o parâmetro permite e a situação é `O/R` (`fmcadastrocontratos.pas:4042-4044`). É capacidade contextual com efeito de negócio. |
| Recursos opcionais | `CONFIRMADO` | Receita de óculos, serviços/equipamentos e crédito de troca são habilitados por `ANEXOCONTRATORECEITAOCULOS`, `ContratoComServico` e `utilizarcreditotrocacontrato` (`fmcadastrocontratos.pas:1203-1209`). Eles definem capacidades funcionais e dados a validar/salvar, não apenas abas visíveis. |
| Brinde | `CONFIRMADO` | `PermitirAlterarBrindenoContrato` controla comando e validações (`fmcadastrocontratos.pas:1304,2441`; `dmcadastrocontratos.pas:7477-7485`). Encaminhar à fatia de produtos. |
| Aparência/consulta | `CONFIRMADO` | Cor zebrada, máscara/precisão de quantidade, consulta interativa, exposição de colunas de grade/situação/peso/modelo e histórico são preferências ou projeções de interface enquanto não alterarem validações. Não devem conceder acesso nem ser persistidas como autorização. |

### Operações que exigem prova sensível

`CONFIRMADO` — Foram localizados pedidos de usuário/senha para cancelamento/reversão, faturamento, liberação de crédito/inadimplência, emissão de nota, desbloqueio de contrato, venda sem estoque/venda futura, desconto extra, transformação de troca em devolução e confirmação de entrega na loja. A evidência inclui `ObterAutorizacao` em `dmcancelamentocontratos.pas:297-307`, `dmoperacoescontratos.pas:615,1198-1202` e `dmcadastrocontratos.pas:2673,5272,16784-16816,18384-18440,19849-19850,20724`.

`DECISÃO NOVA` — Cada operação terá identificador próprio (`modulo`, `acao`), papéis/flags autorizadores explícitos, filial, contrato, situação/revision e expiração curta. A prova será de uso único, consumida atomicamente pelo comando e o autor da sessão não será substituído pelo autorizador. Auditoria registrará ambos.

`DÚVIDA` — O texto genérico `ctAUTORIZADO` e autorizações por `taSENHA` não demonstram por si só qual conjunto completo de flags é validado internamente por `ObterAutorizacao`. Cada fatia que usar esses caminhos deve fechar a lista exata antes do respectivo `$to-spec`; não presumir que “administrador” ou “gerente” sempre basta.

### Reaproveitamento Laravel confirmado

- `CONFIRMADO` — `OrcamentosAuthorizationService` já resolve acesso por rota e tabelas `acessosmodulos`/`usuariosacessosmodulos`; é o padrão para o novo serviço/policy do Cadastro.
- `CONFIRMADO` — `SensitiveOperationProofService` e gates como `ConsultaContratosGravarSensitiveOperationGate`, `ConsultaContratosRegistrarEntregaLojaSensitiveOperationGate` e `OrcamentoF6SensitiveOperationGate` já implementam prova vinculada a módulo/ação e consumo no backend. Generalizar o uso; não criar modal de senha com validação paralela.
- `CONFIRMADO` — `ParameterReadBundle`, `CadastroParameterManifestContract` e `OrcamentoParameterManifest` já oferecem preload por filial, coerção legada e payload de runtime. Criar `ContratoCadastroParameterManifest` por composição/catálogos compartilhados; não duplicar descrições já presentes no manifesto de Orçamentos.
- `CONFIRMADO` — `ConsultaContratosParameterManifest` já contém `Não permitir alterar o vendedor nos produtos do contrato`, mas seu escopo atual cobre apenas a Consulta. O catálogo compartilhado deve ser a fonte comum quando a fatia de produtos for tratada.
- `DIVERGENTE` — `ConsultaContratosPolicy` hoje só controla `viewAny/search`; não representa incluir, editar, gravar, transicionar, autorizar ou visualizar campos protegidos do Cadastro.

### Catálogo e precedência

- `DECISÃO NOVA` — Precedência efetiva: regra invariável do domínio/estado → permissão do usuário → parâmetro da filial efetiva do contrato → autorização sensível, quando exigida. Uma preferência de interface nunca relaxa os níveis anteriores.
- `DECISÃO NOVA` — O manifesto inicial do núcleo deve conter apenas: inclusão somente via orçamento, alteração da data de abertura, alteração do vendedor do Cliente, ocultação de observações, Cliente inadimplente somente com Analista de Crédito e os parâmetros necessários ao cancelamento até `F`. Recursos de produtos, serviços, pagamentos, estoque e fiscal entram em manifestos das respectivas fatias.
- `NÃO LOCALIZADO` — Não foi evidenciado um parâmetro de usuário persistido específico do Cadastro equivalente aos parâmetros de sistema/filial; foram encontrados flags/papéis carregados em `UsuarioLogin`. Preferências pessoais só devem ser introduzidas mediante evidência posterior ou decisão de produto explícita.

### Encaminhamento

Esta fatia é suficientemente independente para receber `$to-spec` próprio junto com o núcleo, cobrindo a infraestrutura de capacidades, policy, manifesto transversal e prova sensível — sem especificar as regras internas de produtos, estoque, faturamento ou fiscal. Os gates concretos de cada operação permanecem no `$to-spec` da própria fatia.
