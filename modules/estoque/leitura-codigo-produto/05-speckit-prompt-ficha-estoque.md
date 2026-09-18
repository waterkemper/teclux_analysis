# Prompt para `/speckit.specify`

```text
/speckit.specify

Com base em `modules/estoque/leitura-codigo-produto/dossie.md` e `pesquisa-auditoria-ficha-entradas-estoque.md`, crie a especificacao para alinhar Ficha de Produtos e entradas de Estoque no Laravel ao resolvedor canonico.

Abranja Ficha de Produtos, prefill, lupa, listagem paginada, Consulta de Estoques, Lancamentos Avulsos, Inventario/Conferencia e componentes de digitacao relacionados. Para identificacao exata, todos devem aceitar codigo interno, codigo visual e qualquer barcode associado; para listagens exploratorias, preserve busca parcial e paginacao. Remova divergencias de `MIN(codigobarras)` quando ocultarem codigos alternativos.

Garanta revalidacao server-side antes de quantidade, movimento, estoque, filial ou gravacao. Colisao abre tela de selecao; inexistente informa erro; zeros a esquerda sobrevivem. Produto e Caracteristica continuam entidades distintas.

Produza matriz de arquivos-alvo, contratos HTTP, estados frontend, autorizacao, testes backend/frontend e criterios de aceite ponta a ponta. Reutilize o resolvedor canonico e nao crie implementacoes paralelas.

Nao investigar Delphi. Nao implementar nesta etapa. Nao alterar schema legado, movimentos historicos ou dados duplicados.
```
