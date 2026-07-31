# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para expandir o painel "Produtos Similares" do Cadastro de Pedidos de Compra (`PedidoCompraSimilaresPanel.tsx`), hoje limitado a 3 campos (produto/código visual/descrição), para as colunas completas confirmadas no legado: Código, Descrição, Linha, Coluna, Filial, Estoque, Reserva, Pedida, Valor, Similar, Produto. Esta é a décima quarta fatia do Cadastro de Pedidos de Compra, construída sobre os itens já especificados (spec 07).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` como requisito legado autoritativo. Inspecione o checkout Laravel — em especial se Consulta de Compras já expõe uma versão mais completa desta mesma entidade (ticket 08 daquele mapa confirmou reaproveitamento) — antes de propor qualquer query nova. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta entrega

A entrega termina quando o painel de Produtos Similares exibir, para cada similar do produto ativo: Código, Descrição, Linha (rótulo da grade1, ex. cor), Coluna (rótulo da grade2, ex. tamanho), Filial, Estoque, Reserva, Pedida, Valor, indicação de "Similar"/relação, Produto — mantendo o comportamento já confirmado (spec 07 do mapa anterior): painel somente leitura, sem cálculo próprio, reconsultado sempre que o produto ativo muda.

Não inclua nesta entrega: qualquer alteração de lógica de negócio de itens/motor de custo-impostos; escrita a partir deste painel (permanece somente leitura).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmcadastropedidos.pas`/`.dfm`.
- Inspecione o checkout Laravel para confirmar se a fonte de dados de Produtos Similares já usada em Consulta de Compras (`resultsSimilaresReadRepository`/equivalente) já expõe estas colunas — reaproveitar em vez de criar uma consulta nova, se possível.
- Se uma decisão depender de informação Delphi ausente (a origem exata dos campos Filial/Estoque/Reserva/Pedida/Valor não foi totalmente rastreada nesta análise), registre a pergunta exata para o workspace de análise — não infira a fórmula.

## Investigação Laravel obrigatória

- `app/Services/Estoque/PedidoCompra/PedidoCompraSimilaresReadService.php` (ou equivalente atual) e o tipo `PedidoCompraSimilar` em `types.ts` — estado atual (3 campos apenas);
- a mesma entidade/view de Produtos Similares já usada em Consulta de Compras (ticket 08 do mapa `consulta-compras-wayfinder`) — se já expõe Filial/Estoque/Reserva/Pedida/Valor, reaproveitar diretamente;
- a modelagem de Grade (variantes/linha-coluna) já especificada na spec 08 (mapa anterior, Cadastro de Pedidos) — os rótulos "Linha"/"Coluna" aqui são a mesma noção, reaproveitar a mesma fonte de descrição de grade em vez de duplicar.

## Evidência Delphi confirmada

### Query fonte (CONFIRMADO, `dmcadastropedidos.dfm:4048+`, `qryProdutosSimilares`)

```sql
select distinct pssel.*,
  case when pssel.grade1 is not null then
    (select g.descricao from grades g where g.codigo = pssel.grade1)
  else cast(null as varchar(40)) end as linha,
  case when pssel.grade2 is not null then
    (select g.descricao from grades g where g.codigo = pssel.grade2)
  else cast(null as varchar(40)) end as coluna
  -- ... demais colunas de pssel (Filial, Estoque, Reserva, Pedida, Valor, Similar, Produto)
from ...
```

**Confirmado**: "Linha"/"Coluna" **não são conceitos novos** — são os rótulos descritivos (`grades.descricao`) das duas dimensões de variante (`grade1`/`grade2`) do produto similar, mesma noção de Grade já especificada na spec 08. As demais colunas (Filial, Estoque, Reserva, Pedida, Valor) vêm da view/tabela base `pssel` (nome completo não confirmado nesta análise — **NÃO LOCALIZADO**, provavelmente uma view já compartilhada com Consulta de Compras).

## Decisões obrigatórias

1. Painel permanece somente leitura, reconsultado ao trocar o produto ativo (sem mudança de comportamento, só de colunas exibidas).
2. Colunas Linha/Coluna reaproveitam a mesma fonte de descrição de Grade já especificada na spec 08 — não duplicar a lógica de rótulo de variante.
3. Se a fonte de Filial/Estoque/Reserva/Pedida/Valor já existir compartilhada com Consulta de Compras, reaproveitar; caso contrário, especificar a query mínima necessária, documentando a origem real (não assumida) desses campos.

## Critérios de aceite

- [ ] Painel exibe as 10 colunas confirmadas (Código, Descrição, Linha, Coluna, Filial, Estoque, Reserva, Pedida, Valor, Produto/Similar).
- [ ] Linha/Coluna mostram o rótulo descritivo da variante (não o código bruto da grade).
- [ ] Painel permanece somente leitura, sem nenhuma ação de escrita.
- [ ] Trocar o produto ativo reconsulta e atualiza a lista de similares com as novas colunas.

## Matriz mínima de testes

- **Produto com similares de grade**: produto ativo com 2+ similares que têm variantes de grade (cor/tamanho) → colunas Linha/Coluna mostram os rótulos corretos, não códigos.
- **Produto sem similares**: produto ativo sem similares cadastrados → painel vazio, sem erro.
- **Troca de produto ativo**: trocar o produto selecionado no pedido → painel de similares recarrega com os dados do novo produto.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais da expansão de colunas;
- identifiquem o repositório/serviço/componente Laravel atual a estender, após inspecioná-lo (em especial se a versão de Consulta de Compras já cobre as colunas que faltam);
- documentem a origem real de cada coluna (não assumir sem confirmar no checkout);
- incluam os critérios de aceite e a matriz de testes acima.

## Fora de escopo

- implementar durante `/speckit.specify` além do que os critérios acima descrevem;
- qualquer ação de escrita a partir deste painel;
- qualquer alteração de lógica de negócio de itens/motor de custo-impostos já especificada;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
