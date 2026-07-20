Type: task
Status: resolved
Blocked by: 01, 03, 04, 05, 09, 11

## Question

O que já existe no Laravel para filtros, grid, exportação, parâmetros, autorização sensível, cálculo, preços, Promoções e Auditoria; quais partes podem ser compartilhadas com Marketplace sem acoplar os contextos; e quais seams novos são necessários para consulta, simulação e gravação interna?

Produzir uma análise de lacunas Delphi–Laravel e contratos de módulo reutilizáveis, sem implementar.

## Answer

### Diagnóstico arquitetural

- **CONFIRMADO** — MarketplacePriceMaintenanceService concentra configuração, consulta, fotos, autorização, gravação e enfileiramento em uma interface ampla (laravel/backend/app/Services/Marketplace/MarketplacePriceMaintenanceService.php:28-42,50-203). É específico do contexto Marketplace, não uma base para herança ou chamada pela manutenção interna.
- **CONFIRMADO** — LegacyMarketplacePriceMaintenanceRepository consulta SQL próprio, identidades de contas/vínculos e grava estruturas Marketplace, inclusive transação própria (LegacyMarketplacePriceMaintenanceRepository.php:47-94,106-286,286-421).
- **CONFIRMADO** — MarketplacePriceMaintenanceFilterCompiler combina filtros neutros com conta, situação Marketplace, estoque e preço Marketplace (MarketplacePriceMaintenanceFilterCompiler.php:53-132,133-472). Reutilizá-lo inteiro acoplaria os contextos.
- **CONFIRMADO** — MarketplacePriceMaintenanceService, após salvar, enfileira recálculos por conta/link (:203-283). Esse efeito é proibido no módulo interno.
- **DECISÃO NOVA** — a manutenção interna será um módulo profundo próprio, não uma variante booleana do módulo Marketplace. Compartilhará módulos neutros já existentes e manterá consulta, proposta e commit internos atrás de interfaces pequenas.

### Módulos existentes que devem ser compartilhados

| Capacidade | Evidência Laravel | Decisão |
|---|---|---|
| Grid ERP, preferências e células | ErpPreferenceDataGrid.tsx:71-112; EditableDataGrid.tsx:38-89 | **CONFIRMADO/DECISÃO NOVA** — reutilizar diretamente os módulos genéricos, com catálogo próprio e três grids sincronizados; não reutilizar PriceGrid de Marketplace. |
| Rolagem/virtualização | ErpDataGridScrollShell e DataGrid | **CONFIRMADO/DECISÃO NOVA** — reutilizar infraestrutura, sem paginação. Sincronismo mestre-detalhe fica no shell interno. |
| Exportação | GridExportOrchestrator, ErpPreferenceDataGrid e useErpGridExcelExport; Marketplace usa os mesmos módulos (MarketplacePriceMaintenanceService.php:184-192) | **CONFIRMADO/DECISÃO NOVA** — criar catálogo/dataset internos; exportar a consulta gerada. Para incluir propostas locais ainda não gravadas, usar exportação local das linhas visíveis, claramente rotulada como prévia. |
| Filtros de Produto/Fornecedor | MarketplacePriceMaintenanceFilterCompiler depende de MarketplacePriceMaintenanceProductFilterCompiler, AnaliseEstoquesSupplierFilterCompiler e AnaliseEstoquesFilterCompiler (:37-80) | **CONFIRMADO/DECISÃO NOVA** — compartilhar compiladores neutros de Produto, Fornecedor, compostos e movimentos; criar orquestrador interno para a semântica Delphi. |
| Filial autorizada | UserBranchAccessService já é usado pelo Marketplace (:36,76-157) | **CONFIRMADO/DECISÃO NOVA** — reutilizar para acesso; resolver separadamente Filial efetiva de cálculo. |
| Parâmetros | ParameterReadBundle já abastece Marketplace e Cadastro de Produtos | **CONFIRMADO/DECISÃO NOVA** — reutilizar leitura/cache de parâmetros, mas criar manifesto interno; não importar MarketplacePriceMaintenanceParameterManifest. |
| Autorização sensível | SensitiveOperationAuth, prova curta e hooks/dialog genéricos | **CONFIRMADO/DECISÃO NOVA** — criar definição/gate interno para Gerente de Estoque e reutilizar prova genérica; não usar MarketplacePriceMaintenanceSensitiveOperationGate. |
| Motor de preço | LegacyProductPriceEngineRepository oferece resolução por Filial, normal/promoção e markups em lote | **CONFIRMADO/DECISÃO NOVA** — promovê-lo a adapter principal do resolvedor de preço interno; PostgreSQL estoques_preco/formacaoprecovenda continuam oráculos. |
| Auditoria | DatabaseAuditContext e triggers das cinco tabelas | **CONFIRMADO/DECISÃO NOVA** — reutilizar com request_id único e cabeçalho interno; não usar auditoria funcional Marketplace. |
| Fotos | ProductPhotoService é neutro e já usado no Marketplace | **CONFIRMADO** — pode enriquecer linhas sem entrar no núcleo comercial. |

### O que não compartilhar com Marketplace

- **DECISÃO NOVA** — não compartilhar MarketplacePriceMaintenanceService, LegacyMarketplacePriceMaintenanceRepository, seus Request DTOs, compilador agregado, SQL, catálogo de grid, tipos de página, PriceGrid, cálculos de margem/frete/comissão, rounder, resolvedor de novo preço, contas/vínculos ou enfileirador.
- **DECISÃO NOVA** — não criar uma superinterface comum com campos opcionais internos e Marketplace. O único compartilhamento legítimo está nos módulos neutros listados acima.
- **DECISÃO NOVA** — nenhum módulo com namespace Marketplace será dependência do módulo interno. Marketplace pode depender de módulos neutros; a direção inversa é proibida.
- **DIVERGENTE** — a tela Marketplace tem um grid orientado a conta/link e save seguido de jobs; o Delphi interno tem Filtros → F6 → três grids relacionados → propostas locais → F8 atômico. A semelhança visual não implica mesma implementação.

### Novos módulos profundos e interfaces

#### 1. Consulta de Manutenção de Preços Interna

- **Interface** — consultar(Critérios, EscopoDoUsuário) retorna SnapshotDaConsulta.
- O snapshot contém assinatura da consulta, Filial efetiva, linhas principais, detalhes das três grades, identidades físicas, revisões esperadas, capacidades da sessão e metadados de exportação.
- A implementação esconde compilação de filtros, SQL integral sem paginação, ordenação, joins, preço normal/promocional, Cargo, fotos e carregamento em lote.
- **DECISÃO NOVA** — um único endpoint F6 fornece o snapshot coerente; a página não combina respostas parciais de vários endpoints.

#### 2. Motor de Propostas de Preço

- **Interface** — simular(SnapshotDaConsulta, lista de Operações) retorna PréviaDoLote.
- A prévia contém valores anterior/novo, origem da regra, alertas, erros, alvos físicos consolidados e impacto por grid; não persiste.
- Operações como copiar, ajustar, limpar, editar e recalcular compõem-se na ordem registrada e atuam somente na seleção.
- **DECISÃO NOVA** — a experiência pode aplicar propostas localmente para resposta imediata, mas o backend executa o mesmo contrato ao abrir/confirmar F8. O frontend não é autoridade para fórmulas, arredondamento ou alvos físicos.
- **DECISÃO NOVA** — regras puras de moeda, percentual e composição devem ter uma única implementação conceitual e casos dourados comuns; não importar calculadores Marketplace.

#### 3. Commit Atômico da Manutenção Interna

- **Interface** — confirmar(ComandoDoLote, Operador, ProvaSensível) retorna ResultadoDoLote.
- O comando contém request_id, hash, assinatura da consulta, operações canônicas, revisões esperadas e Filial efetiva; não envia SQL nem linhas arbitrárias.
- A implementação esconde autorização, idempotência, bloqueios, verificação de todas as revisões, mutações parametrizadas, transação única, contexto de auditoria e cabeçalho funcional.
- Erros públicos: validação 422, prova ausente/expirada 403, conflito agregado 409 e falha transacional sem resultado parcial.
- **DECISÃO NOVA** — métodos públicos atuais de ProdutoPrecosWriteService e ProdutoPrecosCargosWriteService não serão encadeados; sua lógica útil desce para colaboradores internos/repositórios participantes da transação externa.

#### 4. Resolvedor de Preço Corrente

- **Interface** — resolver(contextos de Produto + Filial + data + Cliente/Cargo opcional) retorna preço efetivo, normal, promocional, validade, origem e explicação.
- Deve aceitar lote para evitar N+1 e ser reutilizável por Manutenção, Orçamentos, futuro Contrato e futuro Frente de Caixa.
- LegacyProductPriceEngineRepository é o adapter PostgreSQL/legado inicial. Um adapter de teste local é justificado; não expor seu fallback SQLite como regra de produção.
- **DECISÃO NOVA** — esta é a seam transversal de Vendas. Consumidores não conhecerão colunasprecos, precos, produtoscargos nem a precedência interna.

#### 5. Shell da página

- **Interface** — estado de filtros, snapshot gerado, seleção, operações, prévia e resultado do commit.
- Reutiliza módulos genéricos de grid/exportação/autorização, mas mantém três grids, navegação conjunta, histórico/desfazer e modal F8 no módulo interno.
- **DECISÃO NOVA** — tipos e estado ficam fora do namespace Marketplace. Não criar um componente genérico de manutenção de preços antes de existir um segundo consumidor com a mesma interface.

### Lacunas Delphi–Laravel

| Área | Situação | Lacuna/decisão |
|---|---|---|
| Filtros internos integrais | **PARCIAL / DIVERGENTE** | compiladores neutros existem; falta orquestrador e SQL internos com semântica Delphi. |
| Três grids sincronizados | **NÃO LOCALIZADO** | grid genérico existe; falta shell mestre-detalhe interno conforme protótipo. |
| Sem paginação | **CONFIRMADO como viável** | Marketplace já calcula total e busca tudo; consulta interna deve usar estratégia própria e virtualização. |
| Operações locais/histórico | **NÃO LOCALIZADO** | criar Motor de Propostas; não aproveitar simulador Marketplace. |
| Cálculo oficial | **PARCIAL** | LegacyProductPriceEngineRepository é forte base; falta interface pequena e casos dourados do motor interno. |
| Promoções e Cargo | **PARCIAL** | leitura/gravação existe no Cadastro de Produtos; falta composição em lote e concorrência uniforme. |
| F8 tudo-ou-nada | **NÃO LOCALIZADO** | serviços atuais transacionam por operação; criar Commit Atômico. |
| Idempotência/cabeçalho | **NÃO LOCALIZADO** | request_id em logs não basta; criar controle interno do lote. |
| Auditoria física | **CONFIRMADO** | cinco tabelas cobertas; falta projeção funcional por lote/Autorizador. |
| Exportação | **PARCIAL** | infraestrutura existe; falta catálogo/dataset internos e distinção consulta versus prévia local. |
| Marketplace separado | **CONFIRMADO** | preservar direção de dependência e proibir jobs/SQL/tipos Marketplace. |

### Estratégia de testes pela interface

- **DECISÃO NOVA** — testar Consulta com banco local/substituível e snapshots de resultado, não métodos privados do compilador.
- **DECISÃO NOVA** — testar Motor de Propostas por operações → prévia, cobrindo seleção, composição, desfazer e arredondamento.
- **DECISÃO NOVA** — testar Commit por resultados observáveis: atomicidade, conflitos agregados, idempotência, auditoria e ausência de jobs Marketplace.
- **DECISÃO NOVA** — testar Resolvedor com casos dourados PostgreSQL comparados aos oráculos e adapter local apenas para testes estruturais.
- **DECISÃO NOVA** — quando os módulos profundos substituírem comportamento antigo, evitar testes duplicados de camadas pass-through; a interface de cada módulo é a superfície de teste.

### Sequência arquitetural para specs

1. Fundação do Resolvedor de Preço Corrente e contratos/casos dourados.
2. Consulta interna F6, filtros, três datasets e exportação.
3. Motor de Propostas e shell com três grids.
4. Commit F8 atômico, autorização, concorrência, idempotência e auditoria.
5. Promoções e Cargo como operações completas sobre a fundação.
6. Integração de consumidores somente por consulta sob demanda, sem reprecificação retroativa.

Esta fatia está pronta para compor specs independentes. “Consolidar casos dourados, ordem de specs e rollout” é agora a única fronteira restante e deve confirmar a decomposição final.
