Type: task
Status: resolved

## Question

Qual é o inventário físico e comportamental completo de **Estoque → Manutenção de Preços** no Delphi — form e data module principais, ancestrais, telas auxiliares, datasets, queries, tabelas, actions, eventos, units, parâmetros e autorizações — e quais trechos pertencem exclusivamente a Marketplace e devem ser cortados da migração interna?

Produzir uma matriz de evidências PAS/DFM e dependências, sem aprofundar ainda as regras de cálculo.

## Answer

### Núcleo físico confirmado

- `CONFIRMADO` — o form principal é `TfrmManutencaoPreco`, descendente de `TfrmAjudaBt`, e o data module é `TdtmManutencaoPreco`, descendente de `TdtmBasico`. Evidências: `delphi/apps/estoque/fmmanutencaopreco.pas:23-24` e `delphi/apps/estoque/dmmanutencaopreco.pas:59`.
- `CONFIRMADO` — a composição visual está em `fmmanutencaopreco.dfm` e possui três etapas: `1 - Parâmetros`, `2 - Registros selecionados [Preços]` e `3 - Marketplace`. A barra expõe Gerar F6, Gravar F5, Copiar F7, Consultar Compras e Cadastro de Produtos. Evidências: `fmmanutencaopreco.dfm:29-249`, `:318-319`, `:1807-1808` e `:2463-2464`.
- `CONFIRMADO` — o form cria seu próprio data module, liga os três grids internos ao mesmo `qryManutencaoPreco`, configura lookups dinâmicos de Grupo, Classe, Marca e Promoção e conecta callbacks de post/scroll. Evidências: `fmmanutencaopreco.pas:617-736` e `:1823-1888`.
- `CONFIRMADO` — F6 só atua na etapa de parâmetros; F5 grava a etapa ativa; F7 copia coluna; Esc cancela a preparação interna com confirmação. Evidências: `fmmanutencaopreco.pas:344-392`, `:829-876`, `:1286-1323` e `:1358-1476`.
- `CONFIRMADO` — há entrada contextual a partir de Nota Fiscal de Entrada. `AcionarTelaManutencaoPreco_NFEntrada` recebe Fornecedor/tipo/série/número e é chamada por Consulta de Entradas e Cadastro de Notas Fiscais. Evidências: `fmmanutencaopreco.pas:281-341`, `:2434`; `delphi/apps/estoque/fmconsultaentrada.pas:943`; `delphi/apps/estoque/fmcadastronotasfiscais.pas:4025`.

### Anatomia funcional interna

| Área | Comportamento localizado | Evidência |
| --- | --- | --- |
| geração | F6 valida Filial quando preço diferenciado, copia os filtros visuais ao data module e monta SQL dinâmico | `fmmanutencaopreco.pas:1369-1476` |
| consulta integral | `qryManutencaoPreco` é live/cached, sem contrato de paginação; `NumeroRegistro` usa `RecordCount` | `dmmanutencaopreco.dfm:68-98`; `dmmanutencaopreco.pas:926-928` |
| seleção | `alterar` marca linhas; Ctrl+Espaço, duplo clique e “Todos” manipulam a seleção | `fmmanutencaopreco.pas:1594-1632`; `dmmanutencaopreco.pas:2149-2156` |
| colunas de preço | cada coluna configurada gera dinamicamente valor, validade e margem; origem/destino/exclusão são operações distintas | `dmmanutencaopreco.pas:1032-1090`; `fmmanutencaopreco.pas:404-575` |
| percentual/validade | aplica percentual e/ou validade às linhas marcadas, ainda no dataset preparado | `dmmanutencaopreco.pas:601-650`; `fmmanutencaopreco.pas:1326-1339` |
| cópia | copia valor, validade e margem entre colunas selecionadas para as linhas marcadas | `dmmanutencaopreco.pas:654-702`; `fmmanutencaopreco.pas:1358-1366` |
| limpeza | zerar/excluir uma coluna preparada limpa valor, validade e margem; persistência zero remove `colunasprecos` | `dmmanutencaopreco.pas:834-863`, `:1682-1690`, `:4051-4071` |
| preço base do Produto | mudança de `produtos.preco` é rastreada e gravada separadamente | `dmmanutencaopreco.pas:1518-1532`, `:1746-1761` |
| característica | Grupo, Classe, Marca e markup podem ser alterados pela grade e persistidos em `caracteristicas` | `fmmanutencaopreco.pas:617-726`; `dmmanutencaopreco.pas:1458-1498`, `:1700-1734` |
| Promoção | vínculo `precos.promocao` pode ser atribuído/limpo e a coluna promocional é identificada pela Filial | `fmmanutencaopreco.pas:1634-1641`, `:1810-1821`; `dmmanutencaopreco.pas:1536-1571`, `:1764-1790` |
| Cargo | colunas dinâmicas expõem desconto/markup, preço resultante e margem por Cargo; gravação usa `produtoscargos` | `dmmanutencaopreco.pas:1200-1260`, `:2456-2663`, `:1640-1660`, `:1739-1743` |
| navegação | abre Consulta de Compras para o Produto e Cadastro de Produtos para a linha atual | `fmmanutencaopreco.pas:1656-1673`, `:1701-1712` |

### Filtros e fontes de seleção inventariados

- `CONFIRMADO` — filtros gerais: coluna de preço, Fornecedor, ordenação, modo de preços, preços diferenciados por Filial e período de alteração. Evidência visual: `fmmanutencaopreco.dfm:318-679`.
- `CONFIRMADO` — filtro de Nota de Entrada: Fornecedor, série, número e período de lançamento; usa `notaspag`, `produtosnotaspag` e séries de Fornecedor/Cliente/Filial. Evidências: `fmmanutencaopreco.dfm:681-971`; `dmmanutencaopreco.dfm:480-771`; `dmmanutencaopreco.pas:1955-1984`.
- `CONFIRMADO` — filtro de Movimentação: Tipo de Movimento, Filial e intervalo; usa `movimentos`. Evidências: `fmmanutencaopreco.dfm:972-1232`; `dmmanutencaopreco.dfm:385-479`, `:601-775`; `dmmanutencaopreco.pas:1869-1892`.
- `CONFIRMADO` — seleção múltipla inclui Item de Produto, Produto, Grupo, Classe, Marca, Modelo, Especificação, Promoção, CST, CSOSN, Lista Padronizada, localização, Lote, Marketplace, atributos e serviços; a chamada F6 entrega as condições relevantes ao SQL dinâmico. Evidências: `fmmanutencaopreco.dfm:1252-1561`; `fmmanutencaopreco.pas:1404-1432`.
- `CONFIRMADO` — filtros de situação incluem somente com estoque, somente com Promoções, compostos, em linha/fora de linha, com/sem montagem, brinde/não brinde, ativo/inativo e disponível/não disponível no site. Evidências: `fmmanutencaopreco.dfm:1584-1796`; `fmmanutencaopreco.pas:1382-1419`.
- `DÚVIDA` — a aba de seleção múltipla “Marketplace” é usada como condição de seleção do Produto antes de escolher a grade interna ou Marketplace. Ela não é automaticamente cálculo de Marketplace, mas sua utilidade no módulo interno ainda deve ser decidida em **Mapear filtros, seleção e consulta integral**. Evidências: `fmmanutencaopreco.pas:1423-1432`; assinatura `MontarSQLManutencaoPreco` em `dmmanutencaopreco.pas:449-451`.

### Tabelas, funções e dependências internas

| Responsabilidade | Fontes confirmadas |
| --- | --- |
| catálogo e preço | `produtos`, `caracteristicas`, `precos`, `colunas`, `colunasprecos` |
| classificação | `grupos`, `classes`, `marcas`, `grades` |
| filial e custo/estoque | `filiais`, `estoques` |
| Promoção | `promocoes`, vínculo em `precos.promocao` |
| Cargo | `cargos`, `produtoscargos` |
| fiscal projetado | `tributosicms`, `csosn` |
| filtros | `fornecedoresprodutos`, `produtoslistaspadrao`, `listaspadrao`, `movimentos`, `notaspag`, `produtosnotaspag` e tabelas de séries |
| cálculo | funções PostgreSQL `formacaoprecovenda`, `manutencao_precocargo`, `estoques_preco_manutencao_preco` e helpers Delphi de arredondamento |

`CONFIRMADO` — essas fontes aparecem na SQL declarada do DFM e na SQL construída por `MontarSQLManutencaoPreco`. Evidências principais: `dmmanutencaopreco.dfm:7-1313`; `dmmanutencaopreco.pas:931-1289`.

### Parâmetros, permissões e ancestralidade

- `CONFIRMADO` — `ParSistema.PrecosporCargo` habilita a seleção da coluna promocional e adiciona projeções por Cargo. Evidências: `fmmanutencaopreco.pas:627`; `dmmanutencaopreco.pas:1200-1260`.
- `CONFIRMADO` — `ParSistema.MultiploPreco` participa do arredondamento de valores; `UsarGradesProdutos` altera composição/apresentação; `mascaraquantidadegrade` formata estoque. Evidências: `dmmanutencaopreco.pas:580-598`, `:2767`; `fmmanutencaopreco.pas:904`, `:1053`.
- `CONFIRMADO` — toda gravação interna solicita autorização. Se o Operador é Gerente de Estoque, confirma a própria senha; caso contrário exige login com `ctGERENTEESTOQUE` e `ctAUTORIZADO`. Só prossegue se o autorizador resultante for Gerente de Estoque. Evidência: `dmmanutencaopreco.pas:1663-1680`.
- `INFERIDO` — acesso inicial ao módulo e atalhos herdados podem depender de `TfrmAjudaBt`/registro do menu fora da unit, mas a regra física específica de acesso não foi localizada neste ticket. **Mapear permissões, parâmetros e autorizações sensíveis** deve fechar a policy completa.

### Telas e units relacionadas

- `CONFIRMADO` — `fmconsultacompras` é aberto como detalhe do Produto e também referencia `fmmanutencaopreco`; é navegação auxiliar, não parte do agregado de gravação. Evidências: `fmmanutencaopreco.pas:18`, `:1656-1673`; `fmconsultacompras.pas:382`.
- `CONFIRMADO` — `frmultiplaselecaoaleatoria` e seus frames filhos fornecem o filtro transversal; `fmconsultaporcampo`, `frconsultacodigo` e `fmManejarListas` apoiam lookups e menus da grade. Evidência: `fmmanutencaopreco.pas:8-20` e componentes em `fmmanutencaopreco.dfm:1252-1561`.
- `CONFIRMADO` — `fmAlteracoesPrecos`/`dmAlteracoesPrecos` formam um módulo separado de consulta/relatório de alterações; ele não é aberto diretamente pelo form principal, mas é dependência de histórico a reconciliar em **Definir gravação atômica, concorrência e Auditoria**. Evidências: `delphi/apps/estoque/fmAlteracoesPrecos.pas:1-10`, `:203`; `dmAlteracoesPrecos.pas:1`.
- `CONFIRMADO` — `fmcadastroprecos` e `fmcadastrocolunasprecos` são cadastros relacionados, acessados a partir do Cadastro de Características, não botões internos deste form. Evidências: `fmcadastrocaracteristicas.pas:771`; ausência de referência nas uses/clicks de `fmmanutencaopreco.pas`.
- `CONFIRMADO` — `fmFormacaoPrecoVenda`/`dmFormacaoPrecoVenda` são telas auxiliares usadas em outros fluxos de entrada/pedidos/notas; a Manutenção de Preços consome diretamente a função de banco `formacaoprecovenda`, não abre esse form. Evidências: `dmmanutencaopreco.dfm:855-908`; referências externas em `fmconsultaentrada.pas:21` e `fmcadastropedidos.pas:23`.

### Fronteira Marketplace aprovada

#### Excluir do novo módulo interno

- `CONFIRMADO` — a aba `tstMarketPlace`, seu `TDBAdvGrid`, busca, ordenação, menus de colunas, cores, exportação XLS e parâmetros de simulação de desconto/ICMS são interface exclusiva de Marketplace. Evidências: `fmmanutencaopreco.pas:133-152`, `:203-235`, `:1912-2431`; `fmmanutencaopreco.dfm:2463-4520`.
- `CONFIRMADO` — `cdsMarketplace` e sua cópia, lookups de Marketplace, tabela de frete, comissão, custo de frete, margem final desejada, novo preço desejado, preço tabelado e eventos `*MKP` pertencem ao fluxo Marketplace. Evidências: `dmmanutencaopreco.pas:161-247`, `:2805-3830`, `:4074-4843`; `dmmanutencaopreco.dfm:1317-2638`.
- `CONFIRMADO` — tabelas e funções exclusivas a cortar: `marketplace`, `produto_marketplace`, `marketplace_produtos_fator`, `grupo_marketplace_comissao`, `comissoesusuarios`, tabelas de frete e funções `estoques_preco_marketplace*`. Evidências: `dmmanutencaopreco.dfm:1323-2638` e métodos Marketplace do PAS.
- `CONFIRMADO` — a gravação `AlterarColunasPrecosMarketPlace`, apesar de também tocar `colunasprecos` e `caracteristicas`, é um segundo fluxo orientado pela grade Marketplace e não será migrado para o módulo interno. Evidência: `dmmanutencaopreco.pas:3831-4050`.

#### Preservar como núcleo interno ou compartilhar por seam

- `DECISÃO NOVA` — `colunasprecos`, `precos`, `produtos.preco`, `caracteristicas`, `produtoscargos`, Promoções, autorização de Gerente de Estoque e funções de preço interno permanecem no contexto Estoque, mesmo quando o legado os reutiliza dentro da aba Marketplace.
- `DECISÃO NOVA` — componentes genéricos de filtro, lookup, grid, prova sensível e Auditoria existentes no Laravel podem ser compartilhados por contratos neutros; classes nomeadas e regras de domínio `MarketplacePriceMaintenance*` não se tornam o núcleo da manutenção interna.
- `CONFIRMADO` — o Laravel já possui `ProductFilterTabSets`, compiladores de filtros de Produto reutilizados em Estoque/Vendas e a tela completa de Marketplace. Evidências: `laravel/backend/app/Support/Vendas/ProductFilterTabSets.php:10-69`, `app/Support/Marketplace/MarketplacePriceMaintenanceProductFilterCompiler.php:12-17` e `resources/js/Pages/Marketplaces/PriceMaintenance/Index.tsx:159-647`.
- `CONFIRMADO` — o Laravel também já possui leitura/escrita individual de `produtoscargos`, catálogo/leitura de `colunasprecos`, motor `LegacyProductPriceEngineRepository` e logs `_log_new` dessas tabelas. Eles são precedentes a avaliar, não prova de que a manutenção interna em lote esteja pronta. Evidências: `laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyProdutosCargosRepository.php:12-16`, `LegacyColunasPrecoProdutoRepository.php:11-17`, `LegacyProductPriceEngineRepository.php:13-48` e `LegacyProdutoAuditLogRepository.php:58-107`.
- `NÃO LOCALIZADO` — não existe rota/página Laravel separada para **Estoque → Manutenção de Preços**; as rotas localizadas em `routes/web.php:411` são exclusivamente `/marketplaces/price-maintenance`.

### Consequência arquitetural do inventário

`DECISÃO NOVA` — a extração será por responsabilidade, não por intervalo de linhas. O legado mistura estruturas internas e Marketplace no mesmo data module: métodos comuns como atualização de `colunasprecos` aparecem depois do bloco de Marketplace, enquanto a gravação Marketplace também altera tabelas internas. O novo Laravel terá um módulo de preço interno com seus próprios casos de uso e poderá consumir infraestrutura neutra compartilhada; Marketplace continuará como adapter/consumidor separado já migrado.

`CONFIRMADO` — este inventário desbloqueia **Modelar preço interno, colunas e identidades**, **Mapear filtros, seleção e consulta integral** e **Mapear permissões, parâmetros e autorizações sensíveis**. Ainda não está pronto para `$to-spec`: fórmulas, semântica das operações, concorrência e consumidores permanecem nos tickets próprios.
