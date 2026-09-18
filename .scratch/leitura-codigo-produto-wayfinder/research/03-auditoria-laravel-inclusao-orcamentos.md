# Auditoria Laravel — inclusão/edição de itens em Orçamento

**Escopo:** somente `C:\teclux_analysis\laravel`; nenhuma inspeção Delphi e nenhuma alteração de código.

**Ticket:** `03-auditar-inclusao-de-itens-em-orcamentos.md`.

## Conclusão

O caminho tradicional de inclusão/edição já possui um ponto único de resolução no backend, `OrcamentoProdutoInclusaoService::resolveProdutoCodigo`. Ele tenta, nesta ordem, PK numérica existente, `produtos.codigovisual` exato case-insensitive/trim e `produtoscodigobarras.codigobarras` exato. Portanto, barcode já funciona no POST de `produto_lookup` quando o texto chega em `codigo`.

O fluxo não está uniformemente coberto: a pesquisa pela lupa usa `VendaProdutoPesquisaService::applyTextSearch` e não consulta `produtoscodigobarras`; a seleção da lupa envia `row.codigo` (PK) de volta ao lookup, enquanto o campo digitado envia texto; e uma entrada numérica ambígua privilegia a PK antes do código visual. Esses pontos precisam de decisão explícita no `speckit.specify`.

## Mapa do fluxo

| Etapa | Evidência Laravel | Situação |
|---|---|---|
| Página e URLs | `laravel/backend/app/Services/Vendas/Orcamentos/OrcamentoCadastroPageService.php:256-258` | CONFIRMADO: injeta `produto_lookup`, `produto_pesquisa` e recálculo. |
| Rotas | `laravel/backend/routes/web.php:3039-3044` | CONFIRMADO: lookup GET/POST, pesquisa GET, recálculo POST e exclusão POST sob o orçamento. O `{codigo}` é aceito na rota, mas o controller o descarta no lookup/pesquisa. |
| Controller lookup | `laravel/backend/app/Http/Controllers/Vendas/OrcamentosController.php:185-198` | CONFIRMADO: autoriza `viewAny`, resolve filial de parâmetro e delega ao serviço. |
| Request lookup | `laravel/backend/app/Http/Requests/Vendas/ProdutoOrcamentoLookupRequest.php:24-53` | CONFIRMADO: `codigo` é string até 30; `produto` é PK opcional; filial é obrigatória; payload inclui quantidade, descontos, número e linhas já incluídas. |
| Modal host | `laravel/backend/resources/js/Pages/Vendas/Orcamentos/components/CadastroItemOrcamentoModal.tsx:1-65` | CONFIRMADO: wrapper fino do modal compartilhado, com contexto e auth de Orçamentos. |
| Modal compartilhado | `laravel/backend/resources/js/Components/erp/vendas/CadastroItemVendaProdutoModal.tsx:535-640,766-882,1012-1187` | CONFIRMADO: edição recarrega por PK; Enter no código chama POST; confirmação chama POST novamente e retorna `intent` `replace`/`increment`/`insert`. |
| Página/grid | `laravel/backend/resources/js/Pages/Vendas/Orcamentos/Cadastro.tsx:1806-1875,1936-1942,3710-3740`; `.../components/ProdutosGrid.tsx:139-185,245-260` | CONFIRMADO: inclusão/edição fazem upsert local, aplicam totais/cascata; grid abre o modal e exibe código visual. |
| Persistência posterior | `Cadastro.tsx:1953-...` e `Cadastro.tsx:1828-1831,1853-1856` | CONFIRMADO: confirmação altera a lista em memória e agenda cascata; fechar modal pode persistir o orçamento conforme pré-requisitos. |

## Resolução do texto digitado

### POST `produto_lookup`

Em `laravel/backend/app/Services/Vendas/Orcamentos/OrcamentoProdutoInclusaoService.php:99-143`, o serviço rejeita ausência de produto/termo, valida filial e resolve o produto antes de quantidade, preço e estoque.

Em `:347-368`, a implementação atual é:

1. Se o termo é só dígitos e existe `produtos.codigo`, retorna a PK.
2. Senão, busca `produtos.codigovisual` com `lower(trim(cast(...))) = lower(trim(?))`.
3. Senão, busca `produtoscodigobarras.codigobarras = termo` e retorna `produto`.

Depois da resolução, o fluxo hidrata preço/markup em `:150-161`, valida elegibilidade em `:163-172`, calcula desconto/estoque/situação/total em `:174-194` e monta a linha em `:207-248`. A linha preserva o texto original em `produtodigitado` e expõe `produtovisual`.

Elegibilidade em `:493-522` exige produto ativo, característica disponível no sistema, existência de estoque para a filial, preço efetivo maior que zero e ausência de duplicata. O estoque lido para a linha é estritamente `estoques.produto + estoques.filial` em `:430-448`; não é soma empresarial.

**Classificação:** PARCIALMENTE CONFORME ao objetivo. Visual e barcode são aceitos no lookup, mas a precedência PK→visual→barcode não está documentada no contrato e pode resolver uma entrada numérica para outro produto se houver colisão entre PK e visual.

### Pesquisa pela lupa/F9

O controller usa `VendaProdutoPesquisaRequest` em `OrcamentosController.php:200-251`. O request aceita `q`, filial, cliente/cargo, paginação, campo de pesquisa e produtos excluídos (`VendaProdutoPesquisaRequest.php:19-36`).

Em `laravel/backend/app/Services/Vendas/Produtos/VendaProdutoPesquisaService.php:298-375`, para PostgreSQL e `search_field=codigo`, a busca faz PK exata quando numérica e `codigovisual` por prefixo normalizado. Não há join nem `EXISTS` em `produtoscodigobarras`. A resposta mapeia a linha em `:178-191` e usa `codigovisual`, caindo para a PK quando vazio.

Ao selecionar resultado, o modal usa `row.codigo` em `CadastroItemVendaProdutoModal.tsx:1506-1523`; esse valor é o `codigo` retornado pela pesquisa, portanto a lupa não entrega barcode ao lookup como texto de entrada. O operador que digita no campo, por outro lado, passa o texto cru em `:766-799`.

**Classificação:** DIVERGENTE/PARCIAL. A lupa não encontra barcode por código; a seleção encontrada volta como PK. O fallback visual para PK na pesquisa (`VendaProdutoPesquisaService.php:185-188`) também contrasta com a regra de exibição que normalmente prefere `codigovisual`.

## Inclusão, edição e identidade

- Inclusão pelo código: `CadastroItemVendaProdutoModal.tsx:1540-1577` dispara lookup no Enter; durante edição, outro texto abandona a edição e começa inclusão (`:1558-1569`).
- Edição: `:610-617` hidrata a linha existente e chama `refreshEdicao`; o refresh envia `produto` PK, filial, quantidade, preço, descontos e `produtodigitado` (`:541-559`).
- Confirmação: `:1012-1037` adquire command gate antes do `await` e decide intenção; `:1085-1108` calcula quantidade; `:1133-1187` reenvia o lookup e devolve a linha ao host.
- Inclusão nova reenvia `linhaBase.produtodigitado ?? String(linhaBase.produto)` como `codigo` em `:1144-1147`. Isso preserva barcode/código visual originalmente digitado, desde que `produtodigitado` tenha sido mantido pela resposta.
- O host faz upsert por `numero`, não por produto, em `Cadastro.tsx:1806-1833,1835-1858`; o incremento por produto+filial é decidido no modal/fluxo de quantidade e a lista local é atualizada pelo host.

**Risco a especificar:** confirmação de uma linha selecionada pela lupa usa PK, enquanto confirmação de um item digitado pode usar visual/barcode; os dois caminhos devem produzir o mesmo produto e a mesma hidratação.

## Divergências e lacunas que o Cursor deverá tratar

1. **Pesquisa barcode ausente:** adicionar ao contrato da pesquisa a busca exata em `produtoscodigobarras`, sem transformar a pesquisa em inclusão.
2. **Precedência ambígua:** decidir e testar colisão entre `produtos.codigo`, `produtos.codigovisual` e barcode. Se o requisito for código visual/barcode como identificadores operacionais, registrar se PK numérica continua aceita como fallback explícito.
3. **Normalização inconsistente:** visual usa trim/lower; barcode usa igualdade literal. Definir se barcode aceita trim e comparação case-insensitive, sem remover zeros à esquerda.
4. **Resposta da lupa:** definir se `row.codigo` continua sendo PK técnica e se o resultado deve incluir `codigovisual`/barcode para preservar o texto exibido. Não expor PK como código visual.
5. **Ambiguidade de barcode:** `value('produto')` assume um único produto; o contrato deve definir erro determinístico para barcode associado a mais de um produto.
6. **Elegibilidade:** o lookup exige linha de estoque na filial e preço > 0; a pesquisa pode listar candidatos sem aplicar exatamente o mesmo gate. Confirmar que a pesquisa deve filtrar apenas ativos e deixar estoque/preço para a revalidação do lookup.
7. **Edição:** edição por PK é adequada para linha já persistida, mas a especificação deve afirmar que alterar o texto do código durante edição troca para inclusão sem alterar a linha original.

## Testes necessários

### Backend/HTTP

- `POST vendas.orcamentos.produtos.lookup`: resolve PK numérica existente.
- Resolve código visual numérico e alfanumérico com trim/case conforme contrato.
- Resolve barcode com zeros à esquerda (`021037`) e retorna a PK correta.
- Barcode inexistente e termo inexistente retornam 422 em `codigo`.
- Colisão PK×visual×barcode verifica a precedência decidida.
- Barcode duplicado para produtos distintos retorna erro determinístico, se a regra escolhida não permitir `value()` silencioso.
- Após resolver por barcode, valida ativo, característica/sistema, estoque da filial, preço e duplicata antes de retornar linha.
- `GET vendas.orcamentos.produtos.pesquisa` encontra visual e barcode; confirma que seleção retorna PK técnica + código visual sem fallback indevido.
- Testa que seleção da lupa e digitação direta produzem a mesma linha para o mesmo produto.
- Regressão de edição: refresh por PK preserva quantidade/desconto/preço e não cria linha.

### Frontend

- Modal envia o texto digitado no Enter e confirma a linha resolvida por barcode.
- Seleção da lupa chama o mesmo lookup com identidade técnica correta.
- Trocar código durante edição preserva a linha antiga e inicia inclusão.
- Repetir Enter/F5 durante lookup/confirmação não duplica inclusão; resposta stale não sobrescreve modo/linha.
- Produto existente por visual/barcode incrementa apenas a identidade Produto+Filial definida.
- Linha nova não herda quantidade/preço do item anterior.
- Mensagens 422 exibem erro recuperável e permitem novo código.

## Arquivos de implementação prováveis (não alterados nesta auditoria)

- `laravel/backend/app/Services/Vendas/Orcamentos/OrcamentoProdutoInclusaoService.php`
- `laravel/backend/app/Services/Vendas/Produtos/VendaProdutoPesquisaService.php`
- `laravel/backend/app/Http/Requests/Vendas/ProdutoOrcamentoLookupRequest.php`
- `laravel/backend/app/Http/Controllers/Vendas/OrcamentosController.php`
- `laravel/backend/resources/js/Components/erp/vendas/CadastroItemVendaProdutoModal.tsx`
- `laravel/backend/resources/js/Components/erp/vendas/VendaProdutoPesquisaLookupModal.tsx`
- `laravel/backend/resources/js/Pages/Vendas/Orcamentos/Cadastro.tsx`
- `laravel/backend/resources/js/Pages/Vendas/Orcamentos/components/CadastroItemOrcamentoModal.tsx`
- `laravel/backend/resources/js/Pages/Vendas/Orcamentos/components/ProdutosGrid.tsx`
- testes em `laravel/backend/tests/Feature/Vendas/Orcamentos/` e `laravel/backend/resources/js/Components/erp/vendas/CadastroItemVendaProdutoModal.test.tsx`.

Nenhum teste foi executado: o pedido foi de auditoria somente-leitura.
