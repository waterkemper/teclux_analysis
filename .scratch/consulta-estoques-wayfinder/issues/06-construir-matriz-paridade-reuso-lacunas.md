# Construir matriz de paridade, reuso e lacunas

Type: task
Status: resolved
Blocked by: 01, 02, 03, 04, 05

## Answer

### Legenda e decisão arquitetural

- `R — REUSO DIRETO`: contrato Laravel existente atende sem alterar sua responsabilidade.
- `A — ADAPTAÇÃO`: componente/serviço existe, mas requer configuração, extensão ou endpoint próprio.
- `L — LACUNA`: capacidade funcional precisa ser construída.
- `D — DIVERGENTE`: Laravel e Delphi têm semânticas diferentes que precisam de decisão explícita.
- `B — POSSÍVEL BUG LEGADO`: não reproduzir automaticamente; manter evidência e decidir no spec.
- `O — OPORTUNIDADE`: melhoria Laravel disponível, separada da paridade obrigatória.

`DECISÃO` — A migração deve criar página, rota, policy, request, service e query próprios de **Consulta de Estoques**. **Análise de Estoques** permanece intacta e fornece infraestrutura transversal. Os cadastros Laravel existentes são dependências navegáveis/reutilizáveis; não serão reimplementados.

### Matriz de estrutura, fluxo e estado

| Capacidade Delphi | Classificação | Laravel/reuso decidido | Paridade e adaptação necessária |
|---|---|---|---|
| Tela Estoques → Consultas | `L` | Nova página Inertia usando `ErpCadastroShell`/`ErpConsultaOperationBar` | Rota/menu/policy próprios; não renomear Análise de Estoques |
| Gerar por botão/F6 | `R` | Ciclo de `AnaliseEstoques/Index`, hook de geração e operação bar | Request/payload e endpoint próprios; manter F6 |
| Esc fecha/refaz e retorna foco | `A` | Estado React e cancelamento existentes | “Limpar/refazer” deve cancelar requisição, invalidar resultados/detalhes e devolver foco ao controle inicial; browser não deve fechar a tela |
| Resultado mestre + detalhes por linha/aba | `L` | Shell/grid reutilizáveis | Criar contrato master-detail; detalhes carregados sob demanda e cancelados/descartados ao trocar Produto |
| Estado stale após alterar filtros | `O` | Já existe em Análise | Adotar indicação de resultado desatualizado, embora Delphi não a possua |
| Paginação | `O/A` | Grid/paginação de Análise | Delphi carrega dataset; Laravel deve paginar por escala, preservando ordenação e seleção estável |
| Preferências de grid | `O/R` | `ErpPreferenceDataGrid` + `GridPreferencesService` | Screen/grid IDs novos; não confundir com preferência Delphi comprovada |
| Exportação XLSX | `O/R` | Export sync/async e `Ctrl+X` | Não é paridade obrigatória; habilitar somente se produto decidir adotá-la |

### Matriz de filtros e lookups

| Delphi | Classe | Equivalente Laravel | Decisão/contrato |
|---|---|---|---|
| Item de Produto | `R` | `ProductFilterPanel:item_produto` + lookup/compilador | Reutilizar regra estruturada, operadores permitidos e binds |
| Produto/Característica | `R` | `ProductFilterPanel:produto` | Reutilizar; códigos visuais continuam identificadores de domínio |
| Grupo | `R` | tab `grupo` | Reutilizar lookup e compiler |
| Classe | `R` | tab `classe` | Reutilizar |
| Marca | `R` | tab `marca` | Reutilizar |
| Promoção | `R` | tab `promocoes` | Reutilizar; preservar vigência/cálculo no resultado, não apenas filtro |
| Lote | `R/A` | tab `lotes` + `ConsultaContratosLoteLookupService` | Reutilizar filtro; o detalhe de Lotes precisa endpoint próprio e escopo de Filial corrigido |
| Atributos | `R/A` | tab `atributos` e lookup paginado | Reutilizar filtro; detalhe JSON requer endpoint próprio |
| Modelo | `L/A` | Tabelas/cadastro existentes, sem tab do painel | Acrescentar tab, registry de campos/operadores, lookup e compiler compartilhados |
| Especificação de Modelo | `L/A` | Dados existentes, sem tab | Mesmo padrão de Modelo, respeitando relação Modelo–Característica |
| Localização de Estoque | `L` | Sem tab/lookup compartilhado | Criar lookup de valores de `estoques.localizacao` e fragmento SQL server-side |
| Filial opcional | `D/A` | `AuthorizedFiliaisCheckList` | UI pode selecionar uma ou mais conforme decisão; backend sempre limita ao conjunto autorizado/FilialBase |
| Produto em linha / fora de linha | `A` | Campos do compiler de Produto | Representar como par de estados ou multiselect; ambos/nenhum = sem restrição |
| Produto ativo / inativo | `A` | Campo de situação existente | Mesma regra dos pares Delphi |
| Com / sem montagem | `A` | Produto/Característica + compiler | Preservar semântica ternária do par |
| Brinde / não brinde | `A` | Campo de Produto/Característica | Preservar par |
| Disponível / não disponível no site | `A` | Campo de Produto | Preservar par |
| Sem estoque zero | `L/A` | Query de Consulta nova | Implementar com função/expressão de saldo equivalente, inclusive por Lote |
| Seleção múltipla obrigatória | `D` | Painel Laravel aceita regras vazias | Paridade Delphi exige ao menos um filtro de cadastro; decidir se Filial/flags contam. Recomendação: exigir regra de Produto/entidade para evitar varredura global, com mensagem clara |
| E/OU e “exceto” | `O/R` | `ProductFilterPanel` | Mais expressivo que Delphi; manter como melhoria, sem alterar resultado quando usado como seleção simples |

`REGRA DE SEGURANÇA` — O frontend nunca envia SQL ou macros. Envia payload versionado com regras; FormRequest valida tab/campo/operador; compiler produz SQL com binds.

### Matriz das perspectivas externas

| Perspectiva Delphi | Classe | Ativos Laravel | Lacuna/adaptação |
|---|---|---|---|
| Itens do Produto | `L/A` | Grid ERP, filtros e dados do cadastro | Criar consulta mestre por Produto/Filial com todos os campos necessários; catálogo próprio |
| Lotes dos Itens | `A` | `ProdutoLotesTabReadService` e repository | Criar endpoint readonly orientado ao Produto selecionado e Filiais efetivas; não reutilizar endpoint de escrita diretamente |
| Produtos Similares | `A` | `ProdutoSimilaresService` | Endpoint de consulta que componha similaridade bidirecional, agrupamento por grade e saldos/preços por Filial |
| Grade de Produtos | `A/L` | `ProdutoGradeStructureService`, `AgrupamentoGradeUiMapper` | Criar matriz readonly com célula Produto + saldos + preço; seleção deve trocar Produto ativo |
| Modelos | `A` | `ModeloProdutoService`/cadastro | Endpoint readonly por Característica e grid/observação |
| Componentes | `A` | `ProdutoComposicaoTabReadService` | Reutilizar leitura e enriquecer com estoque/preço/situação; aba só aparece para composto |
| Atributos | `A` | Serviços de Item/Atributos | Reutilizar transformação tipada; endpoint sob demanda |

### Matriz das abas internas e dados

| Aba Delphi | Classe | Reuso Laravel | Paridade obrigatória/lacuna |
|---|---|---|---|
| Estoques | `L/A` | `ProdutoEstoquesTabReadService` e saldo legado | Agregar saldos Delphi (Em estoque, Reservado, Reserva prévia, Trânsito, Demonstração, Conserto, Danificada, Venda, Total, Físico, Pedidos), preço/promoção, localização, mínimo/máximo |
| Financeiro | `L` | Alguns campos em Análise/Cadastro de preços | Endpoint protegido com custo médio, Financeiro, IPI, margem, últimas datas/quantidades, última compra e dados fiscais/Fornecedor |
| Acumuladores | `L` | Infra de mês dinâmico da Análise | Query sob demanda de Compras/Vendas mensais com sinais legados; somente ability gerencial |
| Preços | `A` | `ProdutoPrecosTabReadService` | Adaptar leitura readonly por Característica/tabela/Filial e limpar promoção vencida na apresentação |
| Preços por Cargo | `R/A` | Serviços de preços por cargo e `ProdutosPrecosPorCargoParameter` | Exibir no lugar de Preços conforme parâmetro; consultar por Produto+FilialBase |
| Preço por Cliente | `R/A` | `ProdutoClientesProdutosTabReadService` | Exibir condicionalmente; endpoint readonly reutilizável |
| Pedidos | `L/A` | Cadastro/consulta de Pedidos existe | Criar resumo e detalhes pendentes por Produto/Filial, mais Notas Pendentes de Entrada; integração abre rota canônica do Pedido |
| Fornecedores | `A` | Serviços de fornecedores do Produto | Endpoint readonly com dados da última entrada; ability gerencial |
| Licitações | `L` | Nenhum equivalente localizado | Criar query readonly, somente saldo positivo, cálculo total e footer de somas |

### Matriz de campos calculados e queries

| Regra Delphi | Classe | Decisão Laravel |
|---|---|---|
| Estoque venda, total e físico | `L` | Implementar no backend com nomes/fórmulas documentados; testes de contrato por componente de saldo |
| Custo médio | `L` | Reproduzir denominador legado e zero seguro; não substituir silenciosamente por métrica da Análise |
| Última compra com ICMS/CSOSN | `L/A` | Usar metadata fiscal existente e fórmula Delphi; testar 101/102 e demais códigos |
| Preço atual/promoção | `A` | Reutilizar serviços/funções de preço; respeitar Filial, arredondamento ECF e relógio do servidor |
| Pedidos pendentes | `L/A` | Reusar domínio de Pedido, preservando funções/semântica observada e escopo de Filial |
| Acumulados mensais | `L` | Query própria; planner de colunas mensais pode ser reutilizado |
| Total de licitações | `L` | Backend calcula `saldo × preço`; frontend soma quantidade/saldo/total |
| Comissão Produto/Grupo | `L/A` | Mapear valor e tipo V/P; manter semântica visual, não necessariamente cores literais |
| Auditoria `estoques_estatistica` ao Gerar | `D/L` | Se for requisito de negócio, registrar transacionalmente no backend com Usuário/Filial/data servidor; não é leitura pura |
| SQL dinâmico/macro Delphi | `D` | Substituir por assembler/compiler server-side com bind; nunca transportar fragmentos do cliente |
| Funções PostgreSQL legadas | `A/L` | Reutilizar quando contrato estável; envolver em repository e testes. Implementação interna só precisa ser aprofundada se ausente/incompatível |

### Matriz de Permissões e Autorizações

| Regra | Classe | Decisão Laravel |
|---|---|---|
| Abrir Consulta | `L/R` | Criar folha de menu/policy própria seguindo `AnaliseEstoquesPolicy`; Administrador e grants explícitos conforme convenção |
| `GerenteEstoque` visualiza Financeiro, Fornecedores, Acumuladores | `D/L` | Mapear para abilities server-side de dados gerenciais; frontend usa props apenas para renderizar, backend omite/nega dados |
| Editar mínimo/máximo/localização | `L/A` | Endpoint de escrita próprio, ability explícita, validação e audit log; não depender apenas de readonly |
| Alterar última compra | `L` | Endpoint/ability próprios; decidir escopo Produto+Filial; não copiar UPDATE global |
| Autorizações contextuais | `NÃO LOCALIZADO` | Não exigir prova sensível por paridade; infraestrutura existe e só entra se negócio decidir |
| Filiais por Usuário | `D/R` | `UserBranchAccessService` é autoridade; toda query e lookup aplica interseção no backend |
| Filial vazia | `B/D` | Nunca significar acesso global. Recomendação: FilialBase quando `FiliaisIndependentes`; caso contrário, todas as Filiais autorizadas ou seleção exigida, a fixar no spec |

### Matriz de Parâmetros do Sistema e ambiente

| Parâmetro Delphi | Classe | Aplicação Laravel |
|---|---|---|
| `PrecosporCargo` | `R/A` | Reusar parâmetro Laravel e alternar aba/query de preços |
| `PrecoParaCliente` | `A` | Mediar pelo serviço de Parâmetros do Sistema; controla visibilidade e endpoint |
| `FiliaisIndependentes` | `A/D` | Mediar no backend; força FilialBase e oculta seleção, mas não deve provocar total cross-filial não autorizado |
| `UsarGradesProdutos` | `A` | Controla aba/colunas de Grade |
| `LiberarVisualizacaodeModelosProdutos` | `A` | Controla filtros/perspectiva de Modelo/Especificação |
| `LiberarVisualizacaoPesoProdutonasPesquisas` | `A` | Controla inclusão/visibilidade de peso no catálogo/resposta |
| `SoVisualizarEstoqueDeposito` | `A` | Aplica `tipofilial='D'` apenas ao detalhe de estoque da Grade, como no legado |
| `MascaraQuantidadeGrade` / tamanho | `D/A` | Converter máscara legado em formatter Laravel; largura vira hint/catalog e responsividade |
| `CorZebradoRelatorio` | `D/O` | Preferir tokens/padrão ERP; preservar distinção sem depender de inteiro VCL |
| CRT simples/normal | `A` | Backend fornece capabilities CST/CSOSN conforme regimes existentes; exposição condicional |
| `EcfPadrao.Arredonda` | `L/A` | Resolver configuração no backend e aplicar aos preços |
| `DataServidor`/`DataHoraServidor` | `R` | Usar relógio do servidor/banco para promoção e auditoria |

### Matriz de operações e integrações

| Operação Delphi | Classe | Laravel/decisão |
|---|---|---|
| Histórico de Notas Fiscais anteriores | `L` | Criar integração readonly por Produto/Código da Nota ou apontar para rota canônica quando localizada; módulo interno fora do escopo |
| Fotos/detalhes | `R` | `ProductPhotoGalleryModal` + `ProductPhotosController`; Produto da linha/célula selecionada |
| Abrir Pedido | `A` | Navegar para cadastro/consulta canônica por número com autorização; confirmar rota concreta |
| Venda Perdida | `R/A` | `VendaPerdidaCaptureModal`/opening; por paridade abrir inclusão sem prefill de Produto, salvo melhoria decidida |
| Gravar mínimo/máximo | `L/A` | Endpoint do domínio Estoque com escopo Produto+Filial e auditoria |
| Gravar localização | `B` | Delphi libera edição mas UPDATE ignora; decidir implementar corretamente ou deixar readonly, nunca simular sucesso |
| Gravar última compra | `B/L` | Corrigir escopo explícito de Filial; confirmar requisito antes de disponibilizar |
| Duplo clique em Notas Pendentes abre Pedido | `B` | Não reproduzir ligação ao dataset errado; definir ação correta ou nenhuma |
| Relatório/impressão | `NÃO LOCALIZADO` | Fora da paridade desta tela |
| Exportação | `O` | Infra pronta, opcional |

### Bugs legados que exigem decisão no spec

1. Lotes podem ignorar o filtro de Filial da consulta mestre.
2. Getter de inatividade de Similar retorna fora de linha.
3. Localização é editável, mas não persiste no UPDATE.
4. Última compra é lida por Produto+FilialBase e atualizada só por Produto.
5. Duplo clique em Notas Pendentes reutiliza número do dataset de Pedidos.
6. `fornecedornosimples` usa comparação SQL `= null`.
7. Ajuste de largura consulta uma grade e altera outra.
8. Retorno de `AbrirTabelaConsultaEstoques` tem booleano semanticamente invertido.
9. Fechamento/refazer não enumera todos os datasets dependentes.

Esses itens são evidência de legado, não critérios automáticos de aceite. A recomendação geral é corrigir os defeitos de segurança/consistência, preservando a semântica funcional visível e registrando a divergência.

### Lacunas reais que entram na especificação

1. Página/rota/menu/policy e payload próprios da Consulta de Estoques.
2. Query mestre por Produto/Filial e serviço de orquestração master-detail.
3. Endpoints sob demanda para Estoques/Financeiro/Acumuladores/Preços/Pedidos/Fornecedores/Licitações e perspectivas externas.
4. Tabs/lookups/compilers de Modelo, Especificação e Localização.
5. Abilities gerenciais e de escrita, com escopo de Filial no backend.
6. Integração de histórico fiscal e rota canônica para abrir Pedido.
7. Mediação dos Parâmetros do Sistema e configuração ECF/CRT.
8. Catálogos de grid e contratos de resposta específicos.

### Reusos obrigatórios recomendados

1. `ErpCadastroShell`, `ErpConsultaOperationBar`, banner de geração e tabs ERP.
2. `ProductFilterPanel`, registries/normalizers/compilers e lookups já suportados.
3. `AuthorizedFiliaisCheckList` + `UserBranchAccessService`, corrigindo vazio no backend.
4. `ErpPreferenceDataGrid` e grid catalogs.
5. Serviços readonly dos cadastros de Produto, Lotes, Similares, Composição, Preços, Clientes, Fornecedores, Grade, Atributos e Fotos.
6. Padrões de FormRequest, Policy, repository legado, assembler SQL, jobs/cancelamento e testes de acesso da Análise de Estoques.

## Original question

Para cada aba, filtro, lookup, coluna, regra, Permissão, Parâmetro do Sistema, query e operação Delphi, qual é o equivalente Laravel reutilizável, a adaptação necessária ou a lacuna real, distinguindo paridade obrigatória, divergência, possível bug legado e oportunidade de melhoria?
