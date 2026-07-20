Type: task
Status: resolved
Blocked by:

## Question

Qual é o estado atual do framework Laravel de lupas/lookups de Produto e da implementação/especificação da Consulta de Estoques: endpoints, providers, componentes de modal/grade, contrato de colunas, busca, paginação, ordenação, Filiais autorizadas, preços, Saldos de Estoque, permissões e pontos de extensão; e quais capacidades permitem uma configuração enriquecida exclusiva da Consulta sem alterar as demais lupas?

## Answer

### Conclusão

O Laravel ainda não possui rota, controller, página, endpoint ou provider da **Consulta de Estoques**. Existem somente o PRD e o prompt SpecKit. A infraestrutura atual, porém, já oferece um modal de catálogo configurável capaz de sustentar a maior parte da lupa enriquecida e um precedente concreto em Vendas. A extensão correta é criar um wrapper/configuração e um endpoint/provider exclusivos da Consulta de Estoques, preservando o contrato visual comum, sem ampliar globalmente as demais lupas de Produto e sem reutilizar as regras comerciais de Vendas.

### Componentes e contratos existentes

#### `ErpTwoColumnCatalogLookupModal`

É a base reutilizável adequada. Seu contrato mínimo de linha é `{ codigo, nome }`, mas a linha aceita campos adicionais. O endpoint recebe `q`, `page`, `per_page`, `sort`, `direction`, `search_field`, opcionalmente `include_inactive`, além de `extraQueryParams`; devolve `data` e `meta` com página atual, tamanho, total, última página, ordenação, direção e campo pesquisado.

O componente já fornece pesquisa imediata ou adiada, paginação server-side, ordenação, seleção do campo de pesquisa por cabeçalho, teclado, seleção de linha, persistência opcional da sessão, código visual configurável, descrição antes do código, colunas intermediárias e `extraDisplayColumns` com campo de pesquisa e variantes `text`, `color` e `saldo`.

Limites: colunas extras são primariamente de exibição; `searchField` torna o cabeçalho pesquisável, mas não cria sozinho ordenação. Formatação financeira, situação, peso e visibilidade condicional precisam ser preparadas no wrapper/DTO ou por uma extensão declarativa pequena. O modal não resolve autorização nem semântica de Filial; isso pertence ao servidor. `ErpCadastroLookupModal` não é indicado porque está especializado em Usuários.

#### Precedente: `VendaProdutoPesquisaLookupModal`

Vendas demonstra como enriquecer localmente o modal comum. O wrapper usa pesquisa adiada, painel largo, `codigovisual`, descrição primeiro e exibe Referência, Unidade, Grades, Em estoque, Reservado, Preço e Pesquisa avançada. A seleção devolve a linha cujo núcleo é o Produto.

Ele não pode ser usado diretamente na Consulta: incorpora uma única Filial obrigatória, Cliente/Cargo, exclusão de Produtos já incluídos, somente Produtos ativos/disponíveis e com preço positivo. O preço usa o motor comercial de venda/markup, não as colunas Normal e Promoção do Delphi da Consulta.

O endpoint `GET /cadastros/vendas/orcamentos/{codigo}/produtos/pesquisa` autoriza por Orçamentos e valida o formato da Filial, mas o fluxo inspecionado passa a Filial solicitada diretamente à consulta. Não foi encontrada nesse caminho uma interseção explícita com `UserBranchAccessService`. É uma lacuna de segurança do precedente: ele inspira o desenho, mas não deve ser reutilizado como backend da Consulta.

#### Resolvedor de entidade e filtros

`ConsultaContratosFilterEntityLookupService`, usado por Análise de Estoques e Movimentação Diária em `lookup-product-entity`, resolve um Produto por código visual ou interno e retorna identidade/descrição. Não é catálogo paginado e não fornece Filial, saldos ou preços. Ampliá-lo globalmente afetaria vários módulos e não é necessário.

`ProductFilterPanel` e `EntitySelectionTabPanel` continuam adequados às regras de filtro da futura Consulta. A lupa especial é um catálogo distinto: ajuda a escolher a identidade do Produto e não substitui o compilador de filtros nem o resultado mestre Produto/Filial.

### Busca, paginação e ordenação

O precedente de Vendas prova o contrato server-side: página limitada a 100, busca por prefixo normalizado em Descrição/Referência/Código, pesquisa avançada PostgreSQL em `produtos.busca`, ordenação por Descrição normalizada e Grades, e metadados de paginação. Podem ser reutilizados o vocabulário e `ErpLegacyTextSearch`, mas a whitelist da Consulta deve corresponder às suas próprias colunas.

Na Consulta, a paginação deve contar linhas Produto+Filial após escopo e filtros. A ordenação precisa de desempates estáveis por Produto/Filial. Cabeçalhos informativos não devem fingir ser ordenáveis; todas as chaves do cliente devem passar por whitelist server-side.

### Filiais, permissões e dados sensíveis

`UserBranchAccessService` já fornece opções/códigos autorizados e valida Filial explícita. O novo endpoint deve resolver server-side as Filiais efetivas: Filiais independentes restringem à FilialBase autorizada; fora desse modo, vazio significa todas as Filiais autorizadas; Filial explícita não autorizada gera erro. A query nunca pode rodar sem predicado de Filiais efetivas.

A Policy/capacidade da futura Consulta deve proteger o endpoint. Preços Normal/Promoção e comissões exigem decisão explícita de capacidade e não devem ser enviados no JSON quando vedados; esconder a coluna no React não protege o dado. Saldos também permanecem limitados às Filiais efetivas.

### Lacuna nos artefatos atuais

O PRD e o prompt já determinam reutilização de filtros/lookups, paginação, Filiais autorizadas e correção do risco de lista vazia. Eles ainda não especificam a lupa especial: faltam endpoint, DTO, catálogo de colunas, pesquisa/ordenação por coluna, permissão financeira e distinção entre contexto exibido e valor selecionado.

### Seam recomendado

1. Criar `ConsultaEstoquesProdutoLookupModal` no contexto da Consulta como wrapper fino de `ErpTwoColumnCatalogLookupModal`.
2. Criar rota, FormRequest, action/controller, service e repository dedicados ao catálogo Produto+Filial.
3. Definir DTO próprio com identidade interna/visual, Descrição, Filial e somente colunas enriquecidas autorizadas. O callback preenche somente identidade/descrição do Produto; Filial, saldos, preços e demais valores são contexto visual.
4. Reutilizar modal, paginação, busca normalizada e `UserBranchAccessService`; não reutilizar o endpoint/service de Vendas nem ampliar o resolvedor global.
5. Manter catálogo e visibilidade das colunas no wrapper local. Se faltar formatação, acrescentar ao modal comum apenas capacidade declarativa neutra e retrocompatível.
6. Testar contrato, busca, ordenação, paginação, seleção, Filial não autorizada, Filiais independentes, lista vazia, visibilidade financeira e ausência de regressão nas lupas existentes.

### Decisões que seguem para o próximo ticket

- paridade obrigatória versus opcional das colunas Delphi;
- linha Produto+Filial e eventual consolidação entre Filiais;
- capacidades que liberam preços e comissões;
- colunas pesquisáveis/ordenáveis e formatos;
- Produtos inativos, Modelos/Especificações, Grades, peso e pesquisa avançada conforme Parâmetros;
- se o descriptor atual basta ou requer pequena extensão declarativa.
