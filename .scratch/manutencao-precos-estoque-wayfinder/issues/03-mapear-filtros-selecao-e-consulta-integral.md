Type: task
Status: resolved
Blocked by: 01

## Question

Quais filtros, origens de seleção, combinações, ordenações e condições SQL determinam o conjunto de produtos no Delphi, e quais componentes/compiladores já existentes na Manutenção de Preços de Marketplace do Laravel podem ser reutilizados no módulo interno?

Definir o contrato de F6 para retornar todos os registros filtrados sem paginação, incluindo estados ativo/inativo, estoque, promoções, compostos, nota de entrada, movimentação, listas e demais abas aplicáveis, sem herdar semântica exclusiva de Marketplace.

## Answer

### Resultado

**CONFIRMADO** — o F6 deve executar uma consulta integral própria da Manutenção de Preços interna. Ele combina todos os blocos preenchidos por `AND`, devolve todos os produtos elegíveis em uma única coleção, sem `page`, `per_page`, paginação visual ou carregamento incremental, e não altera preço algum. A consulta prepara o conjunto que será trabalhado localmente; a persistência continua reservada ao F5.

**DECISÃO NOVA** — reutilizar a composição visual e os compiladores neutros já extraídos no Laravel, mas criar request, serviço, compilador e repositório do contexto Estoque. Não reutilizar diretamente `MarketplacePriceMaintenanceFilterCompiler`, porque suas condições dependem de conta, aliases e filiais de Marketplace.

### Matriz de filtros do F6

| Bloco | Contrato interno | Classificação e evidência |
|---|---|---|
| Produto | Regras inclusivas/exclusivas para Item/Produto, Produto (Característica), Grupo, Classe, Marca, Promoção, CST, CSOSN e Lista Padrão. Preservar conectores do construtor compartilhado. | **CONFIRMADO** — `fmmanutencaopreco.pas` transfere as condições do frame e listas ao data module; `dmmanutencaopreco.pas:1109-1141` aplica cada condição e `produtoslistaspadrao`. O Laravel já declara `PRICE_MAINTENANCE_TABS` e possui compilador que delega à base neutra de `AnaliseEstoquesProductFilterCompiler` (`ProductFilterTabSets.php:69-72`). |
| Fornecedor | Filtrar produtos associados ao fornecedor. Filtros adicionais do painel compartilhado exigem teste de equivalência antes de entrar. | **CONFIRMADO** — `dmmanutencaopreco.pas:1143-1147` usa `fornecedoresprodutos` pela Característica. O Laravel já possui `SupplierFilterPanel` e `AnaliseEstoquesSupplierFilterCompiler`. |
| Situação | Pares independentes: ativo/inativo, em linha/fora de linha, com/sem montagem, brinde/não brinde, disponível/não disponível no site. Ambos marcados ou ambos desmarcados significam “todos”; somente um aplica a condição correspondente. | **CONFIRMADO** — `dmmanutencaopreco.pas:1152-1181`. **DIVERGENTE** — “fora de linha” no Delphi é `p.foralinhal OR c.foralinhal`; o compilador Marketplace observado exige ambos. O módulo interno preserva o `OR`. Ativo/inativo usa a nulidade de `p.inativo`. |
| Compostos | Todos, somente não compostos, somente compostos. | **CONFIRMADO** — `dmmanutencaopreco.pas:1104-1107`. |
| Estoque | “Somente com estoque” considera soma positiva de `emestoque + reservado + conserto + demonstracao + reservaprevia + futuro` em todas as filiais. | **CONFIRMADO** — `dmmanutencaopreco.pas:1183-1184`. **DIVERGENTE** — Marketplace restringe pela filial de estoque da conta; essa semântica não será herdada. |
| Promoção | Três estados: fora de promoção, em promoção ou todos, avaliados por `estoques_produtoempromocao(produto, filial de referência)`. A seleção nominal de promoções é filtro separado sobre `pr.promocao`. | **CONFIRMADO** — `dmmanutencaopreco.pas:1121-1125,1186-1189`. **DIVERGENTE** — o interno usa a filial efetiva de preço, nunca a filial de conta Marketplace. |
| Movimentação | Filial, tipo e datas; qualquer subconjunto preenchido ativa subconsulta sobre `movimentos`. Uma única extremidade é válida (`>=` ou `<=`). | **CONFIRMADO** — `dmmanutencaopreco.pas:1869-1892`. **DIVERGENTE** — Marketplace só aplica datas com intervalo completo. O interno preserva intervalos abertos e valida acesso à filial. |
| Nota fiscal de entrada | Fornecedor/tipo, série, número e período; qualquer filtro ativa `produtosnotaspag → notaspag`. Período aceita somente uma extremidade. Série e nota dependem do fornecedor. | **CONFIRMADO** — `dmmanutencaopreco.pas:1903-1919,1955-1984`. **DIVERGENTE** — o interno deve usar essas tabelas comprovadas, incluindo `tipofornecedor` nos catálogos, e não a projeção fiscal Marketplace. |
| Alteração de preço | Data inicial e final restringem `colunasprecos.alteracao`; no legado só funciona com ambas. | **CONFIRMADO** — `dmmanutencaopreco.pas:1083-1088`. O request exige o par completo. **DIVERGENTE** — não usar data de alteração da projeção Marketplace. |
| Coluna e filial | A coluna escolhida controla coluna adicional exibida; a filial diferenciada resolve Filial, Coluna Normal e Promocional. Escolher uma coluna não deve descartar produtos sem valor. | **CONFIRMADO** — `dmmanutencaopreco.pas:1024-1064`. **DIVERGENTE** — o compilador Marketplace mistura seleção de coluna e existência de preço; isso não equivale ao interno. |
| Ordenação | Código visual; ou descrição normalizada, com código visual como desempate. | **CONFIRMADO** — `dmmanutencaopreco.pas:1194-1197`. Deve ser estável e aplicada no servidor. |

### Abas aplicáveis e limites

**CONFIRMADO** — o contrato inicial de abas efetivas é: `item_produto`, `produto`, `grupo`, `classe`, `marca`, `promocoes`, `cst`, `csosn` e `lista_padrao`. Elas têm passagem explícita ou condição concreta em `MontarSQLManutencaoPreco` (`dmmanutencaopreco.pas:1109-1141`).

**NÃO LOCALIZADO** — Modelo, Especificação, Localização, Lotes, Atributos, NCM e Serviços não possuem condição efetiva comprovada nessa consulta, embora alguns apareçam em frames compartilhados ou em outros conjuntos Laravel. Não entram no F6 sem evidência adicional.

**CONFIRMADO** — Marketplace não é aba nem predicado do conjunto interno. `CondicaoMarketPlace` alimenta apenas o dataset paralelo `cdsMarketplace`, depois de o SQL interno estar montado (`dmmanutencaopreco.pas:1250-1260`); deve ser eliminada, não traduzida.

### Reutilização no Laravel

Reutilizar:

- `ConsultaFilterSection`, `ProductFilterPanel`, `SupplierFilterPanel`, `ProdutoSituacaoFilterFieldset`, seletores de entidades e intervalos usados por `FilterPanel.tsx`;
- lookups de Produto, Fornecedor, Filial, Tipo de Movimento, Série e Nota usados por `MovementFilterFieldsets.tsx` e `NfEntradaFilterSection.tsx`;
- normalização de regras e as bases `AnaliseEstoquesProductFilterCompiler`/`AnaliseEstoquesSupplierFilterCompiler`;
- assinatura determinística do payload para distinguir filtros consultados de filtros editados, adaptada de `buildQueryPayload.ts:115`;
- o precedente do serviço Marketplace que busca com deslocamento zero e devolve uma página lógica única, simplificando aqui para lista sem metadados de paginação.

Não reutilizar:

- `account_ids`, contas, percentuais de simulação ou aliases `mk`;
- filial de estoque/promoção derivada da conta Marketplace;
- compiladores Marketplace de preço, estoque, promoção, nota e alteração sem extração comprovadamente neutra;
- payload, SQL ou estado de gravação específicos de Marketplace.

### Contrato de execução do F6

1. O cliente envia filtros normalizados, `ordenacao` e contexto de preço/filial; não envia paginação nem simulação.
2. O request valida IDs, pares de situação, enumerações e datas. Movimento e Nota aceitam intervalos abertos; Alteração exige o par.
3. O servidor valida a filial de referência e a de movimentação contra o escopo autorizado do usuário.
4. O compilador combina blocos por `AND`; dentro dos construtores permanecem conectores e inclusões/exclusões normalizados.
5. A resposta contém todos os registros ordenados e `total = quantidade de linhas`, sem `page`, `per_page`, `last_page` ou limite silencioso.
6. Resultado vazio é sucesso. Filtros alterados após F6 marcam o grid como desatualizado; novo F6 substitui integralmente o conjunto. Se houver preparação local não gravada, a interface deve pedir confirmação — detalhe do ticket de shell/grid.
7. F6 é somente leitura: não cria Valor de Preço, não atualiza Promoção, não marca linhas e não dispara gravação/auditoria.

### Lacunas encaminhadas

- **DÚVIDA** — volume máximo e virtualização do grid pertencem a **Desenhar shell, grid integral e fluxo F6/F5**; não autorizam truncamento no backend.
- **DÚVIDA** — filtros adicionais do `SupplierFilterPanel` só viram requisito se compilarem sobre a relação interna comprovada.
- **POSSÍVEL BUG LEGADO** — o período de alteração fica no `LEFT JOIN` e pode produzir linha sem valor em vez de excluir o produto. Não reproduzir automaticamente: o spec deve decidir se significa “produto com alteração no período” ou “valor projetado alterado no período”.

Esta fatia está pronta para futuro `$to-spec` de **consulta integral e filtros F6**, preferencialmente junto de **Desenhar shell, grid integral e fluxo F6/F5**, pois substituição do conjunto e estado “filtros alterados” fazem parte do mesmo comportamento observável.
