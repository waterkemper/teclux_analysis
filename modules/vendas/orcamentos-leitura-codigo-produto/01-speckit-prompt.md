# Prompt para `/speckit.specify`

```text
/speckit.specify

Crie uma especificação funcional e técnica para padronizar a leitura de Produto no Laravel do Cadastro de Orçamentos. O texto digitado no modal de inclusão/edição deve resolver o Produto por código visual (`produtos.codigovisual`) ou por código de barras (`produtoscodigobarras.codigobarras`), preservando zeros à esquerda, e depois executar o fluxo existente de quantidade, preço, estoque, filial, elegibilidade e gravação.

## Fonte primária e escopo

Use como fonte primária a auditoria:
`.scratch/leitura-codigo-produto-wayfinder/research/03-auditoria-laravel-inclusao-orcamentos.md`.

Inspecione somente `laravel/backend`. Não investigar Delphi. Não implementar nesta etapa. A especificação deve referenciar arquivos e linhas atuais e separar CONFIRMADO, PARCIAL, DIVERGENTE e NÃO LOCALIZADO.

## Fluxos obrigatórios

Cubra conjuntamente:

- `Cadastro.tsx` e `ProdutosGrid.tsx`;
- wrapper `CadastroItemOrcamentoModal.tsx`;
- modal compartilhado `CadastroItemVendaProdutoModal.tsx`;
- `OrcamentosController::produtoLookup` e `produtoPesquisa`;
- `ProdutoOrcamentoLookupRequest` e `VendaProdutoPesquisaRequest`;
- `OrcamentoProdutoInclusaoService`;
- `VendaProdutoPesquisaService`;
- rotas `vendas.orcamentos.produtos.lookup`, `.pesquisa`, `.recalcular_precos` e `.excluir`;
- quantidade, preço/markup, estoque por filial, filial do item, duplicata, edição, totais/cascata e fechamento do modal.

## Contrato de resolução

Defina explicitamente:

1. campo de entrada (`codigo` como string, sem conversão prematura);
2. normalização de visual e barcode, mantendo zeros à esquerda;
3. precedência entre PK técnica, código visual e barcode — decidir com evidência e documentar colisões;
4. comportamento para barcode inexistente, múltiplos produtos e dados nulos;
5. saída técnica (`produto` PK) versus apresentação (`produtovisual`, texto digitado);
6. garantia de que a lupa e a digitação direta chegam ao mesmo lookup e produzem a mesma linha;
7. ponto único de resolução reutilizável, sem duplicar SQL em controller, modal e pesquisa;
8. separação entre pesquisar (somente leitura) e incluir/editar (revalidação e mutação local/gravada).

## Elegibilidade e efeitos

A resolução deve ocorrer antes de quantidade/preço/estoque, mas a linha só pode ser retornada após as validações já existentes: produto ativo, característica disponível no sistema, estoque da filial do item, preço efetivo > 0 e duplicata conforme modo/parâmetro. Preservar Cargo/markup/preço, desconto/autorização, unidade, grades, montagem, entrega, vendedor, fotos e includes existentes.

Documente a diferença entre estoque da filial usado na inclusão e qualquer estoque agregado usado em pesquisa/detalhe. Não mover regras para a Busca Assistida.

## Edição e quantidade

Defina cenários de aceitação para:

- editar linha existente por PK sem duplicar;
- digitar visual/barcode durante edição e iniciar inclusão, preservando a linha original;
- rebipar Produto+Filial e incrementar a quantidade conforme regra atual;
- Produto novo iniciar com quantidade correta, sem herdar estado residual;
- confirmação repetida/F5/Enter durante operação assíncrona produzir no máximo uma consequência;
- erro 422 permitir correção e nova tentativa sem repetir mutação.

## Testes obrigatórios

Inclua uma matriz backend HTTP e frontend para visual alfanumérico, visual numérico, barcode com zeros à esquerda, termo inexistente, colisões, barcode duplicado, produto inativo, sem estoque, preço zero, duplicata, edição, seleção pela lupa versus digitação, filial, quantidade, stale response e command gate. Exija testes de resposta/payload e efeitos observáveis; não teste apenas refs ou funções privadas.

## Não fazer

- Não investigar Delphi.
- Não implementar código nesta fase.
- Não criar nova rota de inclusão se `produto_lookup` puder ser estendido.
- Não incluir Produto pela Busca Assistida/tool.
- Não trocar PK persistida por código visual/barcode.
- Não usar fallback silencioso que confunda PK com código exibido.
```
