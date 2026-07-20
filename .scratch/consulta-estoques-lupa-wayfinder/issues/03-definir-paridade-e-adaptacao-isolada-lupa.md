Type: task
Status: resolved
Blocked by: 01, 02

## Question

Confrontando o contrato Delphi com o Laravel, qual matriz classifica cada filtro, coluna, cálculo, regra de Filial, permissão, formato e valor de retorno da lupa como paridade obrigatória, reuso Laravel, adaptação recomendada, lacuna, dúvida ou legado a não reproduzir; e qual desenho de seam/endpoint/configuração implementa a lupa enriquecida exclusivamente na Consulta de Estoques com critérios verificáveis de aceite?

## Answer

### Decisão

A lupa enriquecida será uma configuração exclusiva da Consulta de Estoques sobre `ErpTwoColumnCatalogLookupModal`, alimentada por endpoint e serviço próprios. A unidade de exibição é **Produto + Filial efetiva**; a unidade de seleção continua sendo somente **Produto**. Filial, saldos, Pedidos, preços, comissões e demais valores da linha são contexto para a escolha e não alteram silenciosamente o filtro de Filial da tela.

O Laravel preservará a paridade operacional comprovada no Delphi, mas corrigirá escopo de Filial, autorização, exposição financeira, SQL inseguro, ambiguidades de busca e o modo consolidado não identificado.

### Legenda da matriz

- **Obrigatória**: deve estar presente para equivalência funcional.
- **Condicional**: obrigatória quando o Parâmetro/Permissão correspondente estiver ativo.
- **Reuso**: capacidade Laravel existente reutilizada diretamente.
- **Adaptação local**: implementação nova somente no contexto da Consulta.
- **Não reproduzir**: comportamento legado defeituoso ou inseguro.

### Matriz de colunas e valores

| Campo/coluna | Classificação | Decisão Laravel |
|---|---|---|
| `codigo` interno | Obrigatória, oculta | Integrará o DTO e a chave estável; não será coluna visual nem campo aceito sem validação. |
| `codigovisual` — Código | Obrigatória | Exibir e permitir busca por prefixo; será o código devolvido ao filtro, junto da identidade interna validada. |
| `descricao` — Descrição | Obrigatória | Primeira coluna e ordenação padrão normalizada. |
| `valorgrade1` — Linha | Condicional | Exibir/pesquisar somente com `UsarGradesProdutos`; vazio permanece vazio. |
| `valorgrade2` — Coluna | Condicional | Mesma regra da Linha. |
| `filial` — Filial | Obrigatória no modo não independente | Retornar código e, preferencialmente, nome curto; ocultar quando `FiliaisIndependentes`; toda linha já chega autorizada pelo servidor. |
| `modelos_agg` — Modelos | Condicional | Exibir/pesquisar somente com `LiberarVisualizacaodeModelosProdutos`; agregação preparada no backend, sem SQL vindo do cliente. |
| `especificacoes_agg` — Especificações | Condicional | Mesma regra de Modelos. |
| `mnemonico` — Mne. | Obrigatória quando houver valor | Exibir como contexto de estoque/Filial; não oferecer busca até existir semântica server-side inequívoca. |
| `emestoque` — Est. | Obrigatória | Decimal com precisão de estoque; valor da linha/Filial, exceto no modo consolidado explícito. |
| `reservado` — Res. | Obrigatória | Decimal da Filial da linha; nunca somado implicitamente. |
| `futuro` — Fut. | Obrigatória | Decimal da Filial da linha. |
| `pedidos_estoquepedido` — Pedidos | Obrigatória | Decimal/calculado para Produto+Filial por serviço/query server-side. |
| `preco_normal` — Preço Normal | Condicional por capacidade | Usar a semântica de `estoques_preconormal(Produto, Filial)`, não o preço comercial de Vendas; omitir do JSON sem capacidade. |
| `preco_promocao` — Preço Promoção | Condicional por capacidade | Usar `estoques_precopromocao(Produto, Filial)` e a mesma proteção server-side. |
| `referencia` — Referência | Obrigatória | Exibir e permitir busca por prefixo normalizado. |
| `codigobarras` — Código de Barras | Obrigatória | Exibir o valor representativo e pesquisar na relação de códigos de barras sem multiplicar linhas; resultados deduplicados. |
| `peso` — Peso Prod. | Condicional | Exibir somente com `LiberarVisualizacaoPesoProdutonasPesquisas`, quatro casas decimais. |
| `inativo` — Inativo | Obrigatória como situação | Exibir data/situação coerente e controlar Ativos/Inativos/Ambos no SQL; não repetir o filtro em memória. |
| `comissao_grupo` — Comiss.Grupo | Condicional por capacidade | Formatar valor com sufixo `V` ou percentual com `P`; omitir campo e coluna sem capacidade. |
| `comissao_produto` — Comiss.Prod. | Condicional por capacidade | Mesma regra de Grupo. |
| tipos de comissão | Obrigatórios, ocultos | Usados somente para formatar/serializar as comissões; não expor como colunas. |
| `avancado` — Avançado | Adaptação local | Manter como opção/campo de pesquisa, não como coluna vazia por linha. O backend usa full-text em `produtos.busca`. |
| Grupo, Marca, Unidade, preço genérico, custo médio e última compra | Fora da paridade desta lupa | Não adicionar apenas porque aparecem em outras telas/queries. Grupo/Marca pertencem ao resultado mestre já especificado; `estoques_preco`, custo e última compra não são colunas comprovadas desta lupa. |

### Matriz de pesquisa, filtros e ordenação

| Comportamento | Classificação | Decisão Laravel |
|---|---|---|
| Descrição | Obrigatória | Prefixo normalizado em Descrição, Grades e Referência, reproduzindo a utilidade da busca Delphi com parâmetros vinculados. |
| Código visual/código de barras | Obrigatória | Prefixo sobre código visual e códigos de barras; código interno pode ter igualdade quando a entrada for numérica válida. Todo bloco `OR` será agrupado. |
| Código do Produto no Cliente | Condicional e atualmente duvidosa | Somente habilitar com `PesquisarProdutonoCliente` **e** contexto explícito de Cliente/tipo. Sem Cliente, não pesquisar essa relação. |
| Linha, Coluna e Referência | Condicional/obrigatória conforme coluna | Prefixo normalizado e whitelist própria. |
| Filial e saldos | Obrigatória quando visíveis | Filial por igualdade/prefixo validado; saldos e Pedidos por número decimal validado, sem concatenar SQL. |
| Preços e comissões | Condicional por capacidade | Igualdade numérica com parser local; campo nem sequer entra na whitelist do Usuário sem capacidade. |
| Modelos/Especificações | Condicional | Busca por relação existente/`exists`, sem interpolação. |
| Pesquisa avançada | Obrigatória | Opção explícita que usa full-text; relevância server-side e fallback de ordenação estável. |
| Mnemônico | Lacuna corrigida | Somente exibição na primeira versão; não anunciar campo pesquisável sem compilador definido. |
| Inativo | Adaptação recomendada | Usar seletor Ativos/Inativos/Ambos, default Ativos, aplicado antes de contagem/paginação. |
| Paginação | Reuso + adaptação local | Contrato `data/meta` do modal; default 25, máximo 100; total calculado após autorização e filtros. |
| Ordenação padrão | Obrigatória | Descrição normalizada, Grades, Produto e Filial; FilialBase primeiro entre linhas do mesmo Produto. |
| Ordenação por cabeçalho | Adaptação local | Somente campos em whitelist e com expressão server-side definida; desempate estável obrigatório. |
| Busca vazia | Adaptação de segurança | Modal em modo `deferred`; não consultar até o Usuário pesquisar. Se a UX permitir listagem vazia, ainda aplicar Filiais efetivas e limite/paginação. |

### Matriz de Filial e consolidação

| Cenário | Decisão |
|---|---|
| Filiais não independentes | O endpoint recebe seleção opcional e resolve a interseção com `UserBranchAccessService`. Seleção vazia significa todas as Filiais autorizadas, nunca ausência de predicado. Retorna uma linha Produto+Filial. |
| Filial explícita não autorizada | Resposta de validação/autorização; não retornar lista vazia silenciosamente e não executar a query ampla. |
| Filiais independentes | Ocultar a coluna/seletor e usar exclusivamente a FilialBase efetiva autorizada, considerando a regra já definida para Filial virtual. |
| Parâmetro de pesquisa consolidada desativado | `emestoque`, `reservado`, `futuro`, Pedidos e preços pertencem todos à Filial da linha. |
| Parâmetro de pesquisa consolidada ativado | Retornar uma linha da FilialBase autorizada por Produto; `emestoque` será a soma **somente das Filiais autorizadas**. Os demais valores continuam da FilialBase para paridade, mas o DTO inclui `estoque_scope = consolidated_authorized` e a UI identifica “Est. autorizado (total)” para não aparentar que toda a linha foi consolidada. |
| Callback Delphi comentado | Não reproduzir. A intenção de Filial da tela é enviada, validada e aplicada no endpoint. |

O modo consolidado não pode somar Filiais sem autorização. Caso a FilialBase não esteja autorizada, a requisição falha em vez de escolher outra Filial silenciosamente.

### Permissões e capacidades

1. Acesso ao endpoint exige autenticação, acesso ao módulo e Policy/capacidade de consultar Estoques.
2. Saldos operacionais, Pedidos e situação ficam disponíveis a quem pode usar a Consulta de Estoques, sempre sob escopo de Filial.
3. Preço Normal e Promoção exigem capacidade nomeada de visualizar preços comerciais na Consulta.
4. Comissão de Produto/Grupo exige capacidade nomeada distinta de visualizar comissões.
5. O backend monta o catálogo de colunas permitido e omite propriedades sensíveis do DTO. A UI deriva visibilidade dessas mesmas capacidades; nunca recebe dado proibido para apenas escondê-lo.
6. Administrador segue a convenção geral do projeto, mas ainda respeita Parâmetros do Sistema e o escopo de Filiais definido para administrador pelo serviço comum.

Os nomes técnicos finais das abilities devem seguir a convenção descoberta durante a implementação da Consulta; o contrato funcional exige capacidades separadas para preços e comissões, sem reutilizar genericamente `GerenteEstoque` como senha para todos os dados.

### Contrato do endpoint exclusivo

Sugestão de rota sem acoplamento a Vendas:

`GET /cadastros/estoque/consulta-estoques/lookups/produtos`

Entrada validada:

- `q`, `search_field`, `page`, `per_page`, `sort`, `direction`;
- `filiais[]` como intenção, nunca como autoridade;
- `situacao = ativos|inativos|ambos`;
- `cliente`/`tipo_cliente` apenas quando a pesquisa por código do Cliente estiver habilitada e contextualizada.

Saída:

```json
{
  data: [
    {
      codigo: 123,
      codigovisual: 000123,
      nome: Produto,
      filial: 1,
      filial_nome: Matriz,
      valorgrade1: A,
      valorgrade2: 1,
      emestoque: 10.000,
      reservado: 2.000,
      futuro: 0.000,
      pedidos: 3.000,
      preco_normal: 100.00,
      preco_promocao: 90.00,
      estoque_scope: branch
    }
  ],
  meta: {
    current_page: 1,
    per_page: 25,
    total: 1,
    last_page: 1,
    sort: nome,
    direction: asc,
    search_field: nome
  },
  capabilities: {
    view_prices: true,
    view_commissions: false
  }
}
```

Campos condicionais são omitidos quando o Parâmetro ou a capacidade não os liberar. O contrato de seleção consumido pelo filtro é reduzido a `{ produto: codigo, codigovisual, descricao: nome }`; nenhuma Filial ou métrica é copiada para a regra do filtro.

### Seam de frontend

`ConsultaEstoquesProdutoLookupModal` será um wrapper fino, pertencente ao módulo, que configura:

- pesquisa inicial `deferred`, painel largo e chave de sessão exclusiva;
- Descrição antes de Código;
- colunas derivadas do manifesto retornado/props autorizadas;
- rótulos, formatos numéricos e campos de pesquisa da matriz acima;
- `extraQueryParams` somente para intenção de Filial e contexto validável;
- `onSelect` que normaliza a linha para identidade de Produto.

Não haverá fork do modal. Se o modal comum não suportar todas as colunas, a única mudança compartilhada permitida é uma extensão declarativa, opcional e retrocompatível do descriptor — por exemplo `sortKey`, formatador numérico/moeda e visibilidade — sem qualquer conhecimento de Estoques no componente comum.

### Legado que não será reproduzido

- SQL/macros concatenados e comparações numéricas textuais;
- precedência ambígua de `AND/OR`;
- código do Produto no Cliente sem Cliente explícito;
- Filial mostrada mas não aplicada;
- soma de estoque de Filiais não autorizadas;
- modo consolidado sem identificação do escopo;
- filtro de ativo/inativo em memória;
- preços/comissões enviados sem capacidade;
- coluna vazia `avancado` como dado da linha;
- Mnemônico/Inativo anunciados como pesquisáveis sem compilação correta;
- reutilização do endpoint de Vendas, de suas regras de preço/Cliente/Cargo ou de exclusão de itens;
- alteração global do resolvedor de Produto ou das outras lupas.

### Critérios verificáveis de aceite

1. Abrir a lupa na Consulta usa exclusivamente a nova rota e não altera chamadas/respostas das lupas existentes.
2. Cada linha normal representa Produto+Filial autorizada; a seleção de duas Filiais do mesmo Produto produz a mesma regra de Produto.
3. Seleção vazia de Filial nunca remove o predicado; Filial não autorizada falha; modo independente usa somente FilialBase autorizada.
4. Código, Descrição, Filial, Grades, estoques, Pedidos, Referência, código de barras, situação e campos condicionais obedecem à matriz.
5. Preços e comissões não aparecem nem no JSON sem suas capacidades; com capacidade, valores e formatos correspondem às funções/regras definidas.
6. Parâmetros de Grades, peso e Modelos/Especificações alteram simultaneamente query, whitelist e colunas, sem campos fantasmas.
7. Ativos/Inativos/Ambos é aplicado no SQL antes de `count`, `offset` e `limit`.
8. Todas as buscas e ordenações aceitam somente whitelist, bindings e desempates estáveis; pesquisa avançada usa full-text sem coluna nula.
9. No modo consolidado, somente `emestoque` soma Filiais autorizadas, a UI identifica o total autorizado e os demais valores são explicitamente da FilialBase.
10. Paginação retorna no máximo 100 linhas e metadados coerentes mesmo quando campos sensíveis são omitidos.
11. Testes de contrato cobrem acesso ao módulo, capacidades, Filiais, parâmetros, cada campo pesquisável, ordenação, paginação e retorno de seleção.
12. Testes de regressão demonstram que o lookup de Vendas, o resolvedor `lookup-product-entity` e outras instâncias de `ErpTwoColumnCatalogLookupModal` permanecem inalterados.
