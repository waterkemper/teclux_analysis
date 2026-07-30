# Comparar a Consulta Delphi com o Cadastro Laravel

Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual é a matriz campo a campo e ação a ação entre a Consulta Delphi e o Cadastro/núcleo Laravel atuais, distinguindo reúso direto, aprofundamento, criação específica da Consulta, divergência deliberada e comportamento fora de escopo?

## Answer

### Classificação adotada

- **Reúso direto**: contrato existente pode ser chamado sem mudar sua responsabilidade.
- **Aprofundamento**: componente existente é a base, mas precisa de uma projeção/adaptador mais estreito ou de campos adicionais.
- **Criação específica**: comportamento pertence exclusivamente à Consulta e não existe no Cadastro.
- **Divergência deliberada**: o Laravel deve manter uma melhoria consciente em relação ao Delphi.
- **Fora de escopo**: não pertence a esta Consulta.

### Entrada, filtros e navegação

| Elemento Delphi | Laravel atual | Classificação | Direção |
|---|---|---|---|
| Requisitante fixa na Filial Base | Cadastro permite requisitante autorizada; `UserBranchAccessService` valida `usuariosfiliais` | Aprofundamento | A Consulta deve receber a filial ativa como requisitante fixa e validar acesso no servidor, sem lookup editável. |
| Data inicial/final, padrão data do servidor | Inexistente no Cadastro/F9 | Criação específica | Criar filtros bindados, inclusivos e validados; obter defaults do contexto/data do servidor adotado pelo Laravel. |
| Situação A/F/D/C | F9 fixa A; PageService possui labels unitários | Criação específica + correção | Criar filtro das quatro situações. Não reutilizar `F=Finalizado`, `D=Devolvido`; para este domínio são Fechado e Confirmado. |
| Gerar F7/Enter na data final | Inexistente | Criação específica | Nova ação de consulta; atalhos serão decididos na jornada Laravel. |
| Consulta carregada antes de agir/imprimir | Apenas ficha unitária/F9 | Criação específica | O estado da página deve distinguir filtros ainda não executados, carregando, vazio e resultado. |
| Seleção de linha mestre | F9 seleciona uma aberta para cadastro | Aprofundamento | Reusar padrões de seleção/paginação, mas manter linha selecionada para detalhe, edição, cancelamento e impressão. |
| Esc fecha dataset | Sem equivalente web | Divergência deliberada | Não reproduzir ciclo de abrir/fechar dataset; limpar resultado/foco apenas se fizer sentido na jornada web. |
| Alt+clique alterna Data/Nota | Inexistente | Divergência deliberada | Evitar gesto oculto; oferecer colunas explícitas/configuráveis ou decisão visível. |

### Grade Pedidos: matriz campo a campo

| Campo da Consulta | Disponível hoje | Classificação | Observação |
|---|---|---|---|
| `codigo` | ficha, F9, revisão | Reúso direto | Identidade necessária à seleção/mutação. |
| `produto` | ficha e F9 | Reúso direto | Manter PK interna no contrato e código visual na exibição quando aplicável. |
| `descricao` | ficha e F9 | Reúso direto | Sanitização legada existente deve ser reutilizada. |
| `valorgrade1/2` | ficha e F9 | Reúso direto | Visibilidade segue `USAR GRADES PRODUTOS`. |
| nomes dinâmicos Linha/Coluna | Não projetados pelo Cadastro | Aprofundamento | Consulta precisa nomes da característica ou títulos estáveis deliberados; não inferir dos valores. |
| `data` + hora | ficha e F9 separados/formatados | Aprofundamento | Repositório da Consulta deve projetar e ordenar sem interpolar SQL. |
| `nota_serie` | ficha unitária tem NF separada; F9 não | Aprofundamento | Projetar número/série no resultado, preferencialmente como campos separados e coluna formatada na UI. |
| `requisitada` e nome | ficha/F9 têm código e rótulo parcial | Aprofundamento | Incluir nome/mnemônico conforme padrão de filial e ordenar pelo código legado. |
| `estoquerequisitada` | ficha unitária | Aprofundamento | Incorporar na consulta em lote usando filial física; evitar N+1. |
| `reservaprevia` | ausente da ficha | Criação específica da leitura | Projetar da filial física e exibir somente com `REQUISICAOSUBTRAIESTOQUE`. |
| `estoquerequisitante` | ficha unitária | Aprofundamento | Incorporar em lote; respeitar a decisão de filial física já centralizada no Laravel. |
| `qtdepedida` | ficha e núcleo | Reúso direto para domínio; criação na grade | É a única célula mutável da Consulta. |
| `qtderecebida` | ficha unitária | Aprofundamento | Somente leitura; nunca oferecer mutação. |
| `observacao` | ficha/F9 busca; limite 150 | Aprofundamento | Projetar para painel somente leitura no resultado. |
| `referencia` | F9 | Reúso direto | Necessária também ao relatório. |
| `lotetransferencia` | ausente | Criação específica da leitura | Somente leitura/relatório. |
| `resultadocurvaabc` | ausente | Criação específica da leitura | Somente leitura/relatório. |
| `situacao` | ficha/F9 | Reúso direto com labels corrigidos | Também dirige cor e mutabilidade. |
| `motivo` | backend de cancelamento | Reúso direto na mutação | Não precisa ser coluna principal salvo decisão posterior. |
| `revisao` | ficha via `pedidosfiliais_log_new` | Reúso direto | Deve acompanhar cada linha mutável, mesmo se não exibida. |
| `filial_estoque` | resolver do núcleo | Reúso direto interno | Não expor como campo editável; usar em joins/locks. |

A leitura final deve ser um repositório paginado específico, com filtros por requisitante fixa, período e situação e ordem padrão `requisitada, produto`. Não deve estender o F9 até ele virar duas coisas: o F9 continua sendo lookup de abertas; a Consulta ganha seu próprio contrato.

### Aba Confirmados

| Comportamento | Laravel atual | Classificação | Direção |
|---|---|---|---|
| Aba visível somente para `F` | Inexistente | Criação específica | Exibir detalhe somente para Fechado. |
| Consulta por `dadofiscal` | ficha conhece dado fiscal/NF, sem coleção de itens | Aprofundamento | Criar leitura de itens confirmados ligada ao registro selecionado/dado fiscal. |
| Produto, descrição, grades, setor, situação | Repositórios contêm partes, não a projeção | Criação específica da leitura | Endpoint/projeção read-only; sem comandos. |
| Ordem natural do banco | Nenhum contrato | Divergência deliberada | Definir ordenação determinística no Laravel. |
| Inner join elimina produto sem característica | Lookup Laravel lida melhor com produtos | Divergência deliberada | Usar joins que não eliminem silenciosamente item sem característica, salvo regra comprovada. |

### Ações e comandos

| Ação | Reúso | Decisão de seam |
|---|---|---|
| Alterar quantidade de aberta | Núcleo `AlterarRequisicaoFiliaisCommand`, locks, revisão, TEP/TPE/TFR e alertas | **Aprofundamento**: criar Request/ação específica da Consulta aceitando apenas identidade, revisão e nova quantidade. Não expor o endpoint amplo do Cadastro, que também aceita mudar requisitante, requisitada, produto e observação. |
| Salvar F5 | Serviço transacional existente | Reúso do comando; interação específica da página. A resposta deve recarregar a linha/saldos e exibir alertas. |
| Cancelar F6 | `RequisicaoExposicaoCancelarService`, validator de motivo e núcleo cancelar | Reúso direto da regra, com adapter de rota/capability da Consulta se necessário. Preservar revisão, quantidade integral, futuro e alerta de reserva divergente. |
| Criar requisição | Cadastro/núcleo possuem criar | Fora de escopo da Consulta | A Consulta não exibe Incluir. |
| Somar requisição | Núcleo/Consulta de Compras | Fora de escopo | Não usar na Consulta. |
| Alterar produto/filiais/observação | Cadastro permite | Fora de escopo da Consulta | A grade só altera quantidade. |
| Alterar `qtderecebida` | Não oferecido | Fora de escopo | Pertence aos fluxos operacionais posteriores. |
| Imprimir F12 | Nenhum relatório específico | Criação específica | Relatório deve consumir os mesmos filtros e ordem da Consulta. |

### Segurança, parâmetros, concorrência e auditoria

| Capacidade Laravel | Classificação | Aplicação na Consulta |
|---|---|---|
| Middleware/capability em `acessosmodulos` | Aprofundamento | Reusar o padrão; decidir em ticket próprio se Consulta compartilha a folha atual ou ganha folha/capability separada. |
| Requisitante autorizada por `usuariosfiliais` | Divergência deliberada | Mais restritivo que o data module Delphi e obrigatório no Laravel, inclusive leitura e mutações. |
| Requisitada existente e diferente | Reúso direto | Validar nas mutações; na leitura é dado persistido. |
| `RequisicaoFiliaisParameterManifest` | Reúso direto | Resolver sempre por filial ativa; falsidade para vazio/NULL/ausente/inválido. |
| `DatabaseAuditContext` + trigger/log | Reúso direto | Toda mutação da Consulta deve escrever `pedidosfiliais_log_new` pelo mecanismo existente. |
| Revisão otimista | Divergência deliberada | Obrigatória para alteração/cancelamento; protege contra Delphi e outras sessões. |
| Locks e transação do núcleo | Reúso direto | Não duplicar SQL de movimentos na camada da Consulta. |
| Liberação parcial da reserva com alerta | Divergência deliberada já implementada | Movimentar somente reserva disponível, priorizar futuro→reservado e avisar para conferência. |
| Quantidade inteira positiva nos Requests atuais | Divergência a confirmar na jornada/aceite | O Cadastro impõe inteiro; a Consulta Delphi usa campo numérico mascarado. Não ampliar nem restringir silenciosamente sem consolidar a regra de domínio nos tickets seguintes. |

### Interface e relatório

A página React da Consulta é **criação específica**, pois a UI do Cadastro não existe. Ela deve usar os padrões gerais reais (`ErpPreferenceDataGrid`/`DataGrid`, preferências, células editáveis/read-only, `BaseFormPage`, `FormActions`) e os lookups somente onde a jornada requerer. Não deve criar uma dependência fictícia com `Cadastro.tsx`.

O relatório também é **criação específica**, mas deve aprofundar a infraestrutura geral de PDF/relatórios do Laravel. A escolha concreta de gerador, layout, escopo de linhas e snapshot dos filtros fica no ticket “Decidir impressão e relatório da Consulta”.

### Limite final

A Consulta será um novo módulo de leitura/coordenação, não um segundo núcleo de requisições. Seu código específico deve se limitar a página, filtros, query/projeções, detalhe Confirmados, adapters estreitos de alteração/cancelamento e relatório. Estoque, movimentos, futuro, reserva prévia, concorrência, revisão, auditoria e parâmetros permanecem no núcleo compartilhado.
