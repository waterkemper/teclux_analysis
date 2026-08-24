Type: task
Status: resolved
Blocked by:

## Question

Quais fontes Laravel existentes fornecem Produto Ativo, identificadores, Atributos Comerciais Evidenciados, Estoque Fisico Disponivel por Filial, Preco Efetivo por Cliente/Cargo, autorizacao e evidencias para a Busca Assistida, e quais lacunas ou divergencias precisam ser tratadas antes de desenhar as tools?

## Answer

### Fontes confirmadas

- Produto Ativo: LegacyBuscaAssistidaProductSourceRepository::applyEligibilityFilter usa produtos.inativo IS NULL ou data futura durante indexacao/projecao. VendaProdutoPesquisaService::sqlProdutoAtivoPredicate possui o mesmo predicado reutilizavel. A revalidacao calcula ativo, mas somente depois que os candidatos ja foram recuperados.
- Identificadores: ExactIdentifierMatcher consulta codigo, codigovisual, referencia e produtoscodigobarras. O matcher trata a consulta inteira como identificador e nao aplica elegibilidade propria.
- Busca lexical: LegacyBuscaAssistidaLexicalRepository usa produtos.busca/tsvector e devolve descricao como evidencia. O caminho PostgreSQL nao aplica inativo diretamente.
- Documento semantico: ProductSemanticDocumentBuilder aceita descricao, descricao complementar, textos de Caracteristica, marca, modelo, grupo, classe e rotulo de Caracteristica, guardando evidencia literal e hash. A fonte que alimenta esse builder precisa fornecer esses campos; ela nao e, por si so, uma consulta de atributos em tempo real.
- Atributos: LegacyAtributoProdutoRepository administra conjuntos em atributos_produtos, mas nao foi localizado um repositorio da Busca Assistida que resolva valores de atributos por Produto para filtragem. Atributos comerciais estruturados continuam uma lacuna de leitura.
- Estoque Fisico Disponivel: estoques.emestoque e a coluna usada por LegacyBuscaAssistidaRevalidationRepository e por LegacyProductCommercialDetailRepository::fetchEstoquePorFilial. fetchEstoquePorFilial retorna somente linhas com emestoque > 0. Reservado, reservaprevia, transito e estoque agregado nao devem ser usados para a expressao padrao com estoque.
- Preco na Consulta de Estoques: estoques_preconormal e estoques_precopromocao; o efetivo e promocao positiva, senao normal. A capacidade de exibir preco e gateada por EstoqueConsultaEstoquesModuleAccessService::canVisualizarPrecos.
- Preco em Orcamentos: OrcamentoCargoPriceResolver::resolvePrecoVendaParaCliente resolve Cliente/Cargo/markup e usa PrecoCorrenteResolver; a busca e o detalhe do hospedeiro ja usam essa regra.
- Filial e autorizacao: EstoqueConsultaEstoquesModuleAccessService combina acesso ao modulo, capacidades e UserBranchAccessService. Consulta sem Filial solicitada significa todas as Filiais autorizadas. Orcamentos opera com a Filial Base da sessao e middleware orcamentos.module. Os contextos de detalhe/fotos busca_assistida e busca_assistida_orcamentos sao registrados com autorizacao explicita.
- Evidencia: EvidenceGate exige trecho literal nao vazio e score calibrado acima do limiar configurado. A resposta atual carrega origem e trecho literal, mas a futura tool deve amarrar cada filtro a uma fonte verificavel.

### Divergencias e lacunas

1. DIVERGENTE / POSSIVEL PERDA: Exact, lexical e vetorial podem trazer Produtos inativos; a filtragem ativo acontece em revalidate, depois do corte de candidatos. Produtos inativos podem ocupar o cap e esconder Produtos Ativos. A elegibilidade precisa ocorrer antes do ranking/corte da nova tool.
2. DIVERGENTE: revalidate usa join com estoques, portanto Produto sem linha de estoque e omitido mesmo quando a consulta nao pede estoque. A nova consulta deve decidir explicitamente se Produto sem saldo aparece como resultado sem estoque.
3. DIVERGENTE: com varias Filiais, revalidate soma emestoque/reservado e o mapper exibe filiais[0]. Isso mistura saldo de varias Filiais com uma identidade de Filial unica. O contrato deve retornar saldo por Filial ou restringir a uma Filial efetiva.
4. LACUNA: busca atual so aplica filtro de Produto por codigo depois dos candidatos; nao existe filtragem natural por marca, modelo, grupo, classe, cor, material, medida ou demais Atributos Comerciais Evidenciados.
5. LACUNA: detalhe comercial busca cabecalho por codigo sem predicate de Produto Ativo. A ferramenta de detalhe precisa repetir a elegibilidade obrigatoria.
6. LACUNA: o preco Cargo-aware de Orcamentos e correto no resultado/pre-check, mas a revalidacao compartilhada tambem calcula preco generico da Filial; a futura tool deve escolher explicitamente o adapter do hospedeiro e nao misturar as duas fontes.
7. LACUNA: request authorize() retorna true e a protecao atual depende do middleware da rota. Uma tool chamada pelo agente deve repetir autorizacao de modulo, Filial, capacidade de preco e escopo do hospedeiro no servidor.

### Contrato recomendado para a proxima decisao

Antes do catalogo de tools, definir uma leitura comum que aplique Produto Ativo antes da recuperacao/corte, resolva identificadores e atributos com fontes declaradas, consulte emestoque por Filial sem agregacao silenciosa, e delegue Preco ao adapter Consulta de Estoques ou Orcamentos. Cada campo devolvido deve carregar origem e contexto de Filial/horario; a tool nunca deve receber SQL, tabela ou coluna do modelo.

Evidencias: laravel/backend/app/Services/BuscaAssistida/BuscaAssistidaSearchService.php:39, HybridProductRetrievalService.php:27, ExactIdentifierMatcher.php:15, LegacyBuscaAssistidaProductSourceRepository.php:67, LegacyBuscaAssistidaRevalidationRepository.php:18, LegacyProductCommercialDetailRepository.php:98, EstoqueConsultaEstoquesModuleAccessService.php:107, OrcamentoCargoPriceResolver.php:118, ProductSemanticDocumentBuilder.php:19 e EvidenceGate.php.
