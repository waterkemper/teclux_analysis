# Classificar lacunas e consolidar o plano de reúso

Type: task
Status: resolved
Blocked by: 05, 06, 07, 08

## Question

Qual é a matriz final entre “reutilizar como está”, “aprofundar”, “criar para a Consulta” e “fora de escopo”, e como dividir a futura especificação entre leitura/grid, ações compartilhadas, autorização e relatório?

## Answer

### Princípio de arquitetura

A Consulta é um módulo próprio de leitura e coordenação, mas não uma segunda autoridade transacional. Código específico fica restrito a autorização da folha, filtros/projeções, página e grid, adapters HTTP estreitos e relatório. Regras de quantidade, cancelamento, estoque, Reserva Prévia, Venda Futura, movimentos, locks, revisão, auditoria e parâmetros continuam no núcleo compartilhado.

O estado atual do Laravel foi reinspecionado. Diferentemente do inventário inicial, o Cadastro agora possui a página `Interlojas/RequisicaoParaExposicao/Cadastro.tsx`, hooks, componentes e testes. Isso amplia o reúso concreto de interação, porém não elimina a necessidade de uma página própria para a Consulta.

### Matriz final

| Área | Reutilizar como está | Aprofundar/adaptar | Criar para a Consulta | Fora de escopo |
|---|---|---|---|---|
| Núcleo transacional | `RequisicaoFiliaisCommandService`; `AlterarRequisicaoFiliaisCommand`; `CancelarRequisicaoFiliaisCommand`; locks; transações; TEP/TPE/TFR; `RequisicaoFiliaisStockRelease`; revisão e alertas | Fachadas/adapters da Consulta traduzem payloads estreitos e recarregam a linha, sem duplicar regras | Requests e endpoints aceitando apenas identidade, revisão e nova quantidade ou confirmação/motivo de cancelamento | Criar, somar, trocar produto/filiais/observação e alterar `qtderecebida` |
| Auditoria e concorrência | `DatabaseAuditContext`, trigger `pedidosfiliais_audit_log_trg`, `pedidosfiliais_log_new`, `LegacyRequisicaoFiliaisRevisionRepository` e conflito `409` | Reusar o diálogo React de conflito com texto/ação adequados à linha da Consulta | Estado da grid para linha desatualizada e recarga explícita | Log paralelo ou escrita manual na tabela de auditoria |
| Parâmetros e filial física | `RequisicaoFiliaisParameterManifest`, serviço de parâmetros e `LegacyRequisicaoFiliaisFilialFisicaResolver` | Expor snapshot de UI próprio da Consulta e resolver novamente nas mutações | Nenhuma regra duplicada na UI/SQL | Novas descrições de parâmetro ou valores enviados pelo cliente como autoridade |
| Autorização de filial | `RequisicaoExposicaoAuthorizationService::assertRequisitanteAutorizada` e validação de requisitada | Fixar a requisitante na filial ativa, aplicando a validação em leitura, detalhe, mutação e relatório | Capability, folha, middleware/policy e snapshot próprios de **Interlojas → Consulta de Requisições** | Herdar acesso do Cadastro ou da Consulta de Compras |
| Leitura | Sanitização, revisão e projeções unitárias do `LegacyRequisicaoExposicaoReadRepository` servem como referência e colaboradores | Extrair/reusar mapeamentos pequenos quando a responsabilidade coincidir | Read repository paginado específico para período + A/F/D/C, ordenado por requisitada/produto/código, e leitura read-only de Confirmados por `dadofiscal` | Estender o F9 de abertas até ele virar a Consulta |
| Página e grid | Design system, `ErpPreferenceDataGrid`/`DataGrid`, formatação de quantidade e padrões do Cadastro | Reusar/adaptar `RequisicaoExposicaoCancelarDialog`, `RequisicaoExposicaoRevisaoConflitoDialog`, `RequisicaoExposicaoReservaPreviaAlert`, hooks de atalhos e feedback de operação | Página React própria com filtros, estados Inicial/Carregando/Vazio/Resultado/Erro, abas Pedidos/Confirmados, seleção, edição exclusiva de `qtdepedida` e barra F7/F5/F6/F12 | Importar a ficha `Cadastro.tsx` como base estrutural, incluir requisições ou editar campos amplos |
| Relatório | `ErpReportLayoutService`, dados institucionais, CSS padrão, Browsershot e padrão PDF `inline` | Serviço de relatório consome a mesma especificação de filtros/ordenação da Consulta, mas executa leitura completa sem paginação | Controller/Request, serviço, Blade paisagem e testes do relatório de nove colunas, agrupamento, zebramento e OK manual | Enviar linhas do navegador, imprimir Confirmados, persistir OK, subtotais ou totais |

### Seams obrigatórios

1. A Consulta deve possuir uma especificação de filtros compartilhada entre grid e relatório, mas cada caso define paginação: a grid pagina; o PDF lê o conjunto completo autorizado.
2. O read repository da Consulta pode consumir o resolver de filial física e o repositório de revisão, mas não deve acrescentar métodos de consulta geral ao F9 nem ao Cadastro se isso misturar responsabilidades.
3. Alteração de quantidade e cancelamento entram por serviços/fachadas específicos da Consulta, que aplicam capability, filial ativa, autorização, contexto de auditoria e então delegam aos comandos existentes.
4. Componentes React do Cadastro só são reutilizados quando seu contrato já é genérico o suficiente. Se exigirem props exclusivas da ficha, extrair um componente compartilhado pequeno; não fazer a página da Consulta depender do estado completo do Cadastro.
5. Os rótulos da Consulta são canônicos: `A = Aberto`, `F = Fechado`, `D = Confirmado`, `C = Cancelado`. Não propagar os rótulos antigos `Finalizado/Devolvido`.

### Divisão dos futuros comandos `/speckit.specify`

#### 1. Fundação de autorização e contrato da Consulta

Cria folha/capability, menu, middleware/policy, rotas-base, resolução da filial ativa, Form Requests dos filtros, snapshot de parâmetros e contratos/tipos compartilhados. É a primeira especificação e bloqueia as demais superfícies públicas.

#### 2. Leitura, grid e detalhe Confirmados

Cria read repository paginado, serviço/página Inertia, filtros e estados da tela, grid Pedidos, seleção, observação, cores, revisão por linha e endpoint/aba Confirmados. Depende da fundação. Não contém comandos de estoque.

#### 3. Ações compartilhadas de quantidade e cancelamento

Cria adapters estreitos, endpoints e integração da página com F5/F6, motivo, `409`, recarga e alertas. Reutiliza os comandos, auditoria e componentes React atuais. Depende da fundação e do contrato de linha da leitura.

#### 4. Relatório F12

Cria leitura completa pelos mesmos filtros, serviço/Blade/Browsershot, PDF paisagem `inline`, cabeçalho institucional e as nove colunas confirmadas. Depende da fundação e da especificação comum de filtros/ordenação; pode ser implementado depois da leitura sem depender das mutações.

### Ordem e fronteiras

A ordem recomendada é **fundação → leitura/grid → ações**, com **relatório** após o contrato de leitura e em paralelo às ações. Cada especificação deve incluir seus próprios testes verticais. A próxima decisão deve consolidar critérios de aceite e a matriz de testes para esses quatro cortes, não reabrir responsabilidades já decididas.
