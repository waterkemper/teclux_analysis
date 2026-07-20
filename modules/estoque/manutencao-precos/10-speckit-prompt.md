# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional completa e implementável para a **Consulta F6, filtros, três grids e exportação** da **Manutenção de Preços interna** (Estoque), no ERP tecLUX Laravel. Este é o segundo de quatro specs incrementais; depende do primeiro (Resolvedor de Preço Corrente, já especificado/aprovado) e bloqueia os dois seguintes (operações locais/F8, commit atômico).

## Regra fundamental sobre as fontes

Você não possui acesso ao código Delphi nem ao PostgreSQL legado investigados e **não deve procurar, solicitar, citar ou depender deles**. Não inclua tarefas de "analisar o legado", "validar no Delphi" ou "comparar com o Delphi/PostgreSQL". O levantamento já foi concluído e o contrato abaixo é a fonte autoritativa e autocontida.

Investigue somente o Laravel atual para localizar nomes e contratos concretos de componentes, compiladores de filtro, grid/exportação e rotas que serão reutilizados — em especial os compiladores neutros de filtro de Produto/Fornecedor já usados em Estoque, a infraestrutura de grid/exportação (`ErpPreferenceDataGrid`, `EditableDataGrid`, `GridExportOrchestrator`), o padrão de rota/módulo/`acessosmodulos` de outras telas de Estoque, e o Resolvedor de Preço Corrente do spec anterior. Essa inspeção serve para integração, não para redescobrir requisitos. Se o Laravel divergir do contrato abaixo, registre a divergência e proponha a adaptação; não busque confirmação em outro repositório.

Não faça nova entrevista. Não implemente marcação/edição de linhas, operações em lote, histórico/desfazer, validação, conflitos, o modal F8 ou qualquer persistência — isso pertence aos specs seguintes. Gere requisitos numerados, cenários, contratos e critérios mensuráveis.

## Objetivo e natureza

Criar uma página nova em Estoque, **Manutenção de Preços**, com duas abas: **Filtros** e **Dados**. Filtros reúne todos os critérios comerciais; **Gerar F6** executa uma consulta integral própria do módulo interno — sem paginação, sem simulação, sem qualquer campo ou tabela de Marketplace — e abre automaticamente Dados. A consulta é **somente leitura**: não marca linhas, não edita valores, não persiste nada.

Dados apresenta três grids sincronizados por linha e por rolagem vertical, com divisores redimensionáveis, representando a mesma coleção de três ângulos: identificação do Produto; classificação/custo/formação comercial; e colunas de preço e Cargos. Toda a coleção é carregada de uma vez e renderizada com **virtualização de linhas** — não existe hoje nenhuma virtualização em nenhum grid do Laravel; trate isso como infraestrutura nova a ser introduzida, não reaproveitada.

## Filtros do F6

Implemente estes blocos, todos combinados por `AND`, com os conectores internos já usados no construtor de filtros compartilhado:

- Produto/Característica, Grupo, Classe, Marca, Promoção, CST, CSOSN, Lista Padrão (reaproveitando o compilador neutro de filtro de Produto já usado em Estoque);
- Fornecedor (reaproveitando o compilador neutro de filtro de Fornecedor);
- situação, como pares independentes ativo/inativo, em linha/fora de linha, com/sem montagem, brinde/não brinde, disponível/não disponível no site — marcar ambos ou nenhum de um par significa "todos"; marcar só um aplica a condição. Preserve fora de linha como `OR` entre Produto e Característica, não `AND`;
- composto: todos, somente compostos, somente não compostos;
- estoque: "somente com estoque" soma posições de estoque em **todas** as Filiais, não a Filial de uma conta de Marketplace;
- Promoção: fora de promoção, em promoção ou todos, avaliada na Filial efetiva de preço (nunca a Filial de uma conta de Marketplace); filtro nominal por Promoção específica é campo separado;
- movimentação: Filial, tipo, período com qualquer extremidade de data opcional;
- nota fiscal de entrada: Fornecedor/tipo, série, número, período com qualquer extremidade opcional; série/número dependem do Fornecedor escolhido;
- alteração de preço: exige as duas datas (início e fim);
- coluna de preço e Filial de referência: escolher uma coluna nunca descarta Produtos sem valor nela; marcar preços diferenciados por Filial exige escolher essa Filial explicitamente, que passa a resolver Coluna Normal/Promocional.

Abas ativas nesta entrega: Produto/Item, Característica, Grupo, Classe, Marca, Promoção, CST, CSOSN, Lista Padrão. Modelo, Especificação, Localização, Lotes, Atributos, NCM e Serviços **não** entram no F6 nesta entrega.

**Não reutilize** o compilador de filtro de Marketplace nem sua semântica de conta, Filial de conta, estoque, Promoção, movimentação ou alteração — as divergências acima são propositais.

## Contrato de execução do F6

Um único endpoint devolve um snapshot coerente (não combine respostas parciais). Resposta contém todos os registros filtrados, ordenados por código visual com descrição como desempate, sem `page`/`per_page`/`last_page` ou limite silencioso. Resultado vazio é sucesso. Valide a Filial efetiva, a Filial diferenciada e a Filial de movimentação contra o escopo autorizado do usuário — perfil elevado não amplia esse escopo. O resultado anterior permanece visível durante uma nova consulta; cancelamento ou falha preserva a coleção anterior.

## Três grids

Grid 1 (identificação, somente leitura): código visual da Característica/Produto, código do Item, descrição, valores de grade 1/2 (só quando o parâmetro de grades estiver ativo, com títulos conforme os eixos configurados da Característica) e estoque total.

Grid 2 (classificação/custo/formação): Referência, Grupo, Promoção vinculada, Classe, Marca, curva ABC, CST, CSOSN, última compra e sua data, custo médio geral, última compra com ICMS, preços com/sem ICMS e preço de venda antes de impostos. O preço corrente exibido vem de uma **única chamada em lote** ao Resolvedor de Preço Corrente do spec anterior, usando a Filial efetiva e a data do servidor, sem Cliente/Cargo — é um preço de referência para navegação, não uma simulação comercial.

Grid 3 (colunas de preço e Cargos): começa com markup, markup calculado, preço de venda calculado e a coluna indicadora Alterar — renderizada nesta entrega, mas **sem nenhuma interação**; marcar/editar pertence ao próximo spec. Em seguida, uma tripla Valor/Margem/Validade por Coluna de Preço ativa, titulada com o nome da própria coluna; quando Preços por Cargo estiver ativo, uma tripla preço calculado/Margem/Desconto por Cargo ativo, titulada com o nome do Cargo. Construa essa projeção com sua própria consulta em lote (uma consulta cobrindo todos os Produtos × colunas × cargos ativos), nunca chamando o motor de preço uma vez por coluna ou por Cargo — este é um levantamento bruto lado a lado, distinto do preço único resolvido do Grid 2.

## Sincronização, navegação e desempenho

Os três grids compartilham uma linha ativa: navegar, clicar ou rolar em qualquer um move a mesma linha ativa nos outros dois. Rolagem vertical é sincronizada; rolagem horizontal é própria de cada grid. Cabeçalhos fixos. Divisores redimensionáveis persistem durante a sessão; o terceiro grid começa mais largo. Setas movem a linha ativa nos três grids mantendo-a visível.

Introduza virtualização de linhas nos três grids como infraestrutura nova e reutilizável (os próximos dois specs terão a mesma necessidade) — compatível com rolagem vertical sincronizada entre painéis independentes horizontalmente. Documente e cumpra um orçamento de desempenho: F6 completo em tempo limitado para o maior conjunto real do catálogo; primeira renderização utilizável logo após a resposta; rolagem/navegação sem travamentos perceptíveis; exportação fora do caminho crítico da interação principal.

## Autorização e rota

Registre uma rota e página novas em Estoque, distintas de Consulta de Estoques e Análise de Estoques, com middleware/serviço de acesso a módulo próprios e entradas de catálogo `acessosmodulos` próprias, seguindo exatamente a convenção já usada pelas demais telas de Estoque (prefixo de rota, nome de rota, migration de catálogo). Nesta entrega, implemente somente a capability `view` (abrir a página, carregar catálogos/parâmetros, rodar F6, navegar o grid); não implemente `prepare` nem `commit`, que pertencem aos próximos specs.

## Exportação

Reutilize a infraestrutura genérica de grid/exportação com catálogo e dataset próprios do módulo (nunca o catálogo/dataset de Marketplace). A exportação sempre reflete o snapshot consultado carregado no momento, incluindo as colunas dinâmicas por Coluna/Cargo — nunca alterações locais não gravadas, que só existirão a partir do próximo spec.

## Reuso obrigatório e proibições

Reutilize os compiladores neutros de filtro de Produto/Fornecedor, a infraestrutura de grid/exportação/preferências e o Resolvedor de Preço Corrente do spec anterior. Não importe, chame ou dependa de nenhum módulo, tipo, rota, compilador, repository, dataset ou catálogo com namespace de Marketplace; Marketplace pode depender de infraestrutura neutra, nunca o contrário.

## Fora do escopo

Marcar linhas ("Alterar"), editar valores, copiar/ajustar/limpar/recalcular, histórico/desfazer, comparação atual-versus-proposto, validação, indicadores de conflito e o modal F8 — pertencem ao próximo spec (Operações locais, simulação e modal F8). Qualquer persistência, autorização sensível, concorrência otimista, idempotência ou auditoria — pertencem ao spec de commit atômico. Qualquer alteração no contrato do Resolvedor de Preço Corrente. Construir Modelo, Especificação, Localização, Lotes, Atributos, NCM ou Serviços como filtros. Tocar em qualquer código de Marketplace Price Maintenance.

## Testes e aceite mínimo

Cubra Feature (backend) e componente (frontend):

1. cada bloco de filtro isolado e combinado por `AND`; pares de situação (ambos/nenhum = todos; um só = filtrado; fora de linha com `OR`); composto; estoque somado em todas as Filiais; Promoção na Filial efetiva; movimentação e nota fiscal com datas abertas; alteração de preço exigindo as duas datas; coluna/Filial nunca descartando Produto sem valor;
2. ordenação por código visual com desempate por descrição; resultado vazio como sucesso; resposta completa sem campos de paginação;
3. Filial não autorizada rejeitada mesmo quando solicitada explicitamente; usuário sem acesso ao módulo rejeitado na página, no F6 e em qualquer lookup;
4. contagem de consultas comprovando que o preço do Grid 2 e a projeção do Grid 3 não degradam para uma consulta por Produto/coluna/Cargo;
5. F6 abre Dados automaticamente; cancelamento preserva o resultado anterior;
6. navegação e rolagem vertical sincronizadas entre os três grids, rolagem horizontal independente; divisor redimensionável persiste na sessão e o terceiro grid inicia mais largo;
7. colunas de grade só aparecem com o parâmetro ativo; colunas de Cargo só aparecem com Preços por Cargo ativo, tituladas pelo nome do Cargo; triplas de Coluna de Preço tituladas pelo nome da coluna, na ordem das colunas ativas;
8. coluna Alterar renderizada sem nenhuma interação;
9. exportação reflete exatamente as colunas visíveis do snapshot carregado;
10. nenhum código, dataset ou job de Marketplace é chamado;
11. teste específico de virtualização comprovando que o DOM não mantém uma linha real por registro fora da tela em um resultado grande sintético.

## Saída esperada

Gere uma spec completa, verificável e pronta para planejamento/implementação. Numere requisitos funcionais e não funcionais, contratos de request/response, entidades, cenários e critérios de aceite mensuráveis. Identifique os componentes Laravel reutilizáveis existentes e os novos limites necessários (em especial a virtualização) após inspecioná-los. Não crie pendências de investigação no Delphi ou PostgreSQL: tudo que precisa ser preservado está neste briefing.
```
