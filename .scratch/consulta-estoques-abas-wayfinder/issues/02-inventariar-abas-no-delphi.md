Type: task
Status: resolved
Blocked by:

## Answer

### Contrato comum

- Identidade corrente: `produto + filial`. Ao trocar registro/aba, as consultas filhas abrem sob demanda e sincronamente.
- `Financeiro` (`tstMovimento`) e `Acumuladores` são exclusivos de `UsuarioLogin.GerenteEstoque`. `Preços Cargos` só aparece com `ParSistema.PrecosporCargo` e substitui a aba Preços convencional.
- Quantidades usam `ParSistema.MascaraQuantidadeGrade`; valores monetários usam duas casas. Localização, mínimo e máximo são editáveis apenas por gerente.

### Estoques

- Preços: normal, alteração, promoção, validade e descrição; `qryPrecos` recebe característica, preço, Filial, coluna normal e promocional.
- Quantidades: `emestoque`, `reservado`, `reservaprevia`, `demonstracao`, `conserto`, `transito`, `danificada`, `futuro`, `estoquefisico`, `estoquevenda`, `estoquetotal` e Pedidos.
- `estoquetotal = emestoque + reservado + transito + demonstracao + conserto + danificada`. `customedio = financeiro / (emestoque + reservado)` se o denominador não for zero.
- O resumo Pedidos usa `qryProdutosPedidos` por Produto+Filial (`quantidadefilial`). Com filiais independentes, `TotalPedidosFiliais` produz `totalfiliais`; parâmetro legado pode trocar o campo exibido para o consolidado.

### Acumuladores

- Dois grids, Vendas e Compras: Filial, mês `MM/YYYY` e Total, em ordem decrescente.
- Filtro exato Produto+Filial sobre `movimentos`; agrupamento por Filial+mês.
- Vendas usa `substr(movimentos.operacao,13,1)`; Compras usa posição 14. `+` soma, `-` subtrai.
- Usa o snapshot `movimentos.operacao`, não a operação atual de `tiposmovimentos`. Não preenche meses ausentes nem cria total geral.
- Para Similar muda somente Produto, preservando a Filial.

### Financeiro

- Exibe `customedio`, `financeiro`, `aliquotaipi`, `datacompra`, `qtdecompra`, `ultimaentrada`, `ultimavenda`, `precosemicms`, `precocomicms`, fornecedor e `ultimacompra_com_icms`.
- Exibe incidência/situação tributária e `cst_nfentrada`, `csosn_nfentrada`, `cst_nf`, `csosn_nf`. Painéis CST/CSOSN dependem dos regimes das filiais.
- Fornecedor vem de `fornecedores` via `notaspag.codigonotaentrada`; fiscais vêm de `produtosnotaspag` para nota+Produto. `ultimacompra_com_icms` segue fórmula SQL por incidência/regime, não aproximação pela alíquota atual.
- Detalhes abre `fmConsultaProdutosNotasAnteriores` com nota+Produto. Ajuste abre por Produto+`FilialBase`; o update legado somente por Produto é inseguro e não deve ser copiado.

### Preços por Cargo

- `qryPrecosCargos` filtra `estoques` por Produto+`FilialBase`, junta `produtoscargos`/`cargos` e retorna código, descrição e valor.
- Valor = `estoques_preco(produto, filial, produtoscargos.markup)`. Grid: Cargo, Descrição Cargo, Valor; ordenação por descrição/código. Sem vínculo em `produtoscargos`, resultado vazio.
- `FilialBase` pode divergir da Filial da linha e exige decisão explícita no Laravel.

### Pedidos

- Recebe somente Produto; junta `produtospedidos`/`pedidos`, situações `A`/`P`, entrega `coalesce(pp.dataentrega,p.entrega)`.
- Pendente = `pedidos_estoquepedido_semnotaparcial(produto, filialentrega, pedido)` e somente resultado > 0 permanece. A quantidade original não equivale ao saldo.
- Grid: Pedido, Filial, quantidade, entrega e pendente. Escopo global ao Produto, explicitando `filialentrega`, sem filtro pela Filial selecionada.
- Duplo clique abre cadastro do pedido. A mesma aba abre separadamente `qryConsultaProdutosEntradaSefaz` por Produto para entradas/notas pendentes.

### Fontes e consequências

- Auditados `fmconsultaestoque.pas/.dfm`, `dmconsultaestoque.pas/.dfm` e navegação de `fmConsultaProdutosNotasAnteriores`.
- Defeitos comprovados no Laravel: Acumuladores usa operação atual; Cargo é lista vazia fixa; Pedidos omite Filial/entrega e confunde quantidade com pendente; Estoques/Financeiro não exibem todos os dados.
- Decisões ainda necessárias: `FilialBase` em Cargo e consolidação do resumo Pedidos.

## Question

Qual é o contrato funcional e SQL completo das abas Estoques, Acumuladores, Financeiro, Preços por Cargo e Pedidos em `fmconsultaestoque`/`dmconsultaestoque`, incluindo campos, fórmulas, joins, identidades, Filial, parâmetros, permissões, formatação, navegação e units/datasets auxiliares?
