# Pesquisa: padrões Laravel e prompts existentes para Inventário

## Escopo e método

Esta pesquisa substitui a delegação que não produziu artefato no prazo e registra padrões verificáveis no checkout local. Não implementa código, migration, endpoint ou componente. A fonte de verdade para o legado continua sendo os dossiês já capturados; o prompt futuro deve consultar somente o Laravel atual e estes artefatos, sem pedir reabertura dos fontes Delphi.

Classificação:

- **CONFIRMADO**: contrato observado em código ou prompt existente.
- **INFERIDO**: adaptação segura do padrão para o inventário.
- **NÃO LOCALIZADO**: não encontrado na amostra consultada.
- **DIVERGENTE**: o padrão existente não deve ser copiado sem a correção indicada.

## Padrões confirmados no Laravel

### Shell, breadcrumb e barra de operações

**CONFIRMADO.** A página Análise de Estoques usa AppLayout com breadcrumb, Head, ErpCadastroShell e ErpConsultaOperationBar. O breadcrumb é declarado como Estoques -> Relatórios -> Análise de Estoques e as ações exibem ícone, atalho, estado de processamento e rótulo acessível. Fonte: laravel/backend/resources/js/Pages/Cadastros/Estoque/AnaliseEstoques/Index.tsx:301-333.

**INFERIDO para Inventário.** Usar AppLayout/ErpCadastroShell e breadcrumb Estoque -> Cadastros -> Cadastro de Inventário, ajustando a hierarquia ao catálogo real de acessosmodulos. Não criar barra local de botões nem rótulos sem atalho.

### F6 e cancelamento real

**CONFIRMADO.** A Análise de Estoques registra F6 no document listener, chama o mesmo handler do botão Gerar e exibe Cancelar enquanto busy/pageBusy. Fonte: Index.tsx:265-292 e :312-333.

**CONFIRMADO.** useErpHeavyGerarRequest usa AbortController no navegador, guarda a cancel_url retornada pelo servidor e envia POST de cancelamento antes do abort local. A geração é enfileirada, acompanha poll_url e trata queued, running, ready, failed e cancelled. Fonte: laravel/backend/resources/js/hooks/useErpHeavyGerarRequest.ts:99-160 e :176-250.

**INFERIDO obrigatório.** Toda consulta F6 do Inventário deve iniciar com Cancelar visível, possuir cancelamento server-side que interrompa a consulta/job no banco quando suportado e somente depois abortar o cliente. Cancelamento local sem cancelamento do servidor é insuficiente. Resultado parcial não pode ser publicado.

Não reutilizar apenas um POST síncrono que deixe uma query longa executando após o usuário cancelar.

### Grid: catálogo, ordenação, preferências e exportação

**CONFIRMADO.** ErpGridShell recebe um catálogo declarativo de colunas, suporta layoutLocked, picker de colunas, preferências persistidas, exportação, menu contextual e atalhos. Alt+G abre personalização; Ctrl+X dispara exportação quando há onExport. Fonte: laravel/backend/resources/js/Components/erp/data-grid/ErpGridShell.tsx:18-35, :85-99 e :158-186.

**CONFIRMADO.** Preferências são carregadas por screen_key e persistidas por grid_id com expected_revision. O hook coordena grades da mesma tela, evita requests duplicados, faz retry após conflito 409 e mantém revisão para impedir sobrescrita silenciosa. Fonte: useErpGridPreferences.ts:25-86 e :162-237.

**CONFIRMADO.** Exportação usa export_context_token e suporta modo sync ou async; o modo assíncrono faz polling do job e baixa o arquivo somente quando ready. Fonte: useErpGridExport.ts:1-12, :108-165 e :172-183.

**INFERIDO obrigatório.** As grades de cabeçalho, produtos, lotes e resultado de relatório do Inventário devem ter catálogo próprio, chaves de coluna em whitelist, ordenação estável, personalização e exportação pelo ErpGridShell/useErpGridExport. O contexto de exportação deve ser assinado/armazenado no servidor com os filtros e o escopo de filial já autorizados; nunca aceitar SQL, nomes de coluna ou universo de linhas vindos diretamente do navegador.

### Lookup F9 e busca por chave

**CONFIRMADO.** ErpCadastroLookupModal mantém termo digitado, coluna de busca, sort, direction, paginação e search_field. Ao mudar a coluna, sincroniza o termo visível qInput antes de buscar; cabeçalhos têm aria-sort e ação de ordenação. Fonte: laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroLookupModal.tsx:135-199 e :243-281.

**CONFIRMADO.** A especificação 028 define a barra de chave primária no topo do cadastro, confirmação por Enter, erro explícito quando não encontrado, chave somente leitura após carregar e continuidade com o modal de lookup. Fonte: laravel/specs/028-cadastro-pk-localizacao/spec.md:10-12, :56-66; contracts/users-cadastro-inertia-pk.md:21-31.

**INFERIDO obrigatório.** F9 do Inventário deve abrir o modal padrão de pesquisa, não uma tela ad hoc. Para cadastro, o número do inventário deve seguir ErpCadastroPrimaryKeyBar/contrato equivalente: busca direta por Enter, erro sem carregar registro inválido e chave bloqueada após carregar. O prompt deve pedir confirmação do nome concreto do componente no checkout, sem mandar consultar Delphi.

### Radio buttons e abas

**CONFIRMADO.** Análise de Estoques usa fieldset com role radiogroup e input type radio para opções mutuamente exclusivas. Fonte: Index.tsx:405-429.

**CONFIRMADO.** O padrão de tabs de cadastro é coberto pela especificação 029, incluindo role tabpanel, id previsível e aria-labelledby. Fonte: laravel/specs/029-cadastro-tabs-styling/tasks.md:56-56.

**INFERIDO.** Situação A/P/T, modos de geração e opções mutuamente exclusivas devem preferir radio buttons. Select só deve ser usado quando a lista for extensa ou não for mutuamente exclusiva. Os estados de aba devem bloquear dados antes da primeira geração e indicar quando o resultado está desatualizado.

### Relatório com F6 e grade de saída

**CONFIRMADO.** O prompt de Consulta de Estoques separa parâmetros e resultado, define Gerar/F6, resultado paginado, estado vazio, cancelamento, filtros stale e reuso da infraestrutura de geração, filiais autorizadas, grades, preferências e exportação. Fonte: modules/estoque/consulta-estoques/09-speckit-prompt.md:13-31 e :377-416.

**CONFIRMADO.** O prompt da Curva ABC exige F6 para gerar resultado corrente no grid, reuso de ManagedHeavyReportJob, OperationalExecution, polling, cancelamento e reconciliação; proíbe gravação automática no F6. Fonte: modules/estoque/relatorio-curva-abc/01-speckit-prompt-geracao-curva-abc.md:1-15, :28-53.

**INFERIDO obrigatório.** Qualquer relatório do Cadastro de Inventário deve ter F6, botão Cancelar durante a geração e o mesmo catálogo/layout de colunas na visualização e na saída do relatório. PDF/Excel não pode inventar colunas ausentes no grid; exportação deve respeitar a mesma whitelist, filtros, ordenação e filial autorizada.

### Prompts SpecKit autocontidos

**CONFIRMADO.** O prompt de Consulta de Estoques declara que a pesquisa Delphi já terminou, proíbe investigar ou solicitar fontes Delphi e manda investigar somente o Laravel atual para encontrar componentes, rotas, Policies, repositories, parâmetros, lookups, grids e testes. Fonte: modules/estoque/consulta-estoques/09-speckit-prompt.md:3-13.

**CONFIRMADO.** Os prompts existentes transformam riscos em guardrails explícitos: bindings, whitelist, ordenação determinística, escopo server-side, ausência de SQL concatenado, ausência de N+1, e proibição de driver/hasTable/Schema::has*. Fontes: consulta-estoques/09-speckit-prompt.md:104-138; relatorio-curva-abc/01-speckit-prompt-geracao-curva-abc.md:43-53.

**INFERIDO.** Cada prompt do Inventário deve conter briefing funcional autocontido, fontes locais autoritativas já capturadas, divergências do Laravel, contratos de UI/backend, matriz de permissões, schema exigido, testes de aceite e seção de não escopo. Não deve pedir uma nova entrevista nem uma nova leitura direta do Delphi.

## Padrão de query e performance a transportar

**CONFIRMADO como regra do esforço.** Consultas devem ser set-based, com binds e whitelist. Relações obrigatórias comprovadas como NOT NULL devem usar INNER JOIN; LEFT JOIN deve ficar restrito a relação opcional comprovada. Consultas relacionadas devem buscar em lote com IN, = ANY(array) ou unnest conforme o tipo de chave, evitando N+1.

**INFERIDO para o Inventário.** O resultado do grid principal, os totais de lotes e os detalhes do relatório devem ser derivados por uma consulta mestre e enriquecimentos batelados. O prompt deve exigir teste/telemetria que conte queries e prove que abrir uma página de linhas não executa uma query por linha.

## Mapeamento dos padrões para o Cadastro de Inventário

| Necessidade | Reuso obrigatório | Contrato a exigir |
|---|---|---|
| F6 consulta | useErpHeavyGerarRequest e ErpConsultaOperationBar | Cancelar visível desde o início; cancelamento real no servidor/banco |
| F9 pesquisa | ErpCadastroLookupModal ou ErpTwoColumnCatalogLookupModal | coluna, termo, ordenação, paginação e seleção com identidade estável |
| Chave do cadastro | padrão de ErpCadastroPrimaryKeyBar da spec 028 | número por Enter; chave bloqueada após carregar |
| Grid principal | ErpGridShell + catálogo local | ordenação, resize/reordenação, colunas, preferências e Ctrl+X |
| Grid de produtos/lotes | DataGrid/EditableDataGrid apenas onde edição foi comprovada | célula editável explicitamente catalogada; backend revalida situação A |
| Relatório | padrão Analise Estoques/Curva ABC | F6, progresso, Cancelar, grid do mesmo layout e exportação contextual |
| Menu | MenuService e acessosmodulos | rota única, grant, catálogo não ambíguo, fail-closed |
| Layout | AppLayout, ErpCadastroShell e breadcrumb | hierarquia do catálogo confirmada antes do prompt final |
| Opções exclusivas | fieldset/radio | radio para situação/modos; select somente por necessidade |

## Não copiar sem decisão

- Não copiar a página Análise de Estoques como domínio: ela é apenas referência de shell, filtros, heavy reports e grid.
- Não copiar o dataset ou fórmulas de Consulta de Estoques sem cruzar com o dossiê SQL do Inventário.
- Não criar um segundo lifecycle de jobs, uma segunda preferência de grade ou um segundo modal de pesquisa.
- Não tratar habilitação visual de botão como autorização.
- Não criar runtime fallback com teste de driver, hasTable ou Schema::has*.
- Não levar para o prompt a rota Caixa -> Controle de Recebimentos; o escopo confirmado é Cadastro de Inventário.

## Decisões que o próximo ticket deve fechar

- contrato de domínio e fronteira entre inventário, produtos de inventário e movimentos;
- quais colunas dos grids são editáveis e em que situação;
- se o relatório usa exatamente o grid principal ou um catálogo próprio compatível;
- rota/menu definitivo e capacidades separadas;
- snapshot autoritativo do schema para resolver tipos, nulabilidade, chaves e relações;
- nomes finais dos prompts /speckit.specify e suas dependências.
