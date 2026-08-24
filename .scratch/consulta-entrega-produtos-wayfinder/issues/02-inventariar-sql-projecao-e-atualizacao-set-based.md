# Inventariar SQL, projeção, cardinalidade e atualização da Consulta de Entrega de Produtos

Type: research
Status: resolved
Blocked by:

## Answer

Pesquisa consolidada em modules/entregas/consulta-entrega-produtos/pesquisa-sql-projecao-atualizacao.md.

- qryConsultaEntregaProdutos e uma projecao externa de duas branches UNION ALL: itens fiscais em dadosfiscais/produtosdadosfiscais e saldo pendente em produtoscontratos. A presenca nas duas branches deve ser preservada ate decisao funcional.
- Os parametros tipados sao TodoIntervalodeEntregas, DataInicial e DataFinal. Filiais, periodos, fornecedores e romaneio entram como macros SQL textuais no legado; no Laravel devem virar filtros tipados com binds, whereIn/IN ou ANY(array), nunca expressao recebida do cliente.
- A consulta calcula saldos, devolucoes, romaneios, regioes, fornecedores e limite de entrega com subconsultas correlacionadas. O Laravel deve pre-agregar fatos, usar EXISTS para presenca e confirmar cardinalidade antes de trocar subconsultas por joins.
- A linha editada nao projeta pdf.numero nem pc.numero. O legado atualiza por (dadofiscal, produto) ou (contrato, produto), o que pode atingir varias linhas. O Laravel deve transportar source_kind e a chave real confirmada pelo schema, rejeitando conflito quando a quantidade afetada nao for a esperada.
- A atualizacao deve ser parametrizada, set-based e transacional, com revalidacao de elegibilidade e dos valores auxiliares/revisao. Nao reproduzir loop de SQL textual nem GravarDadosEntrega como loop por registro.
- A nulabilidade e cardinalidade governam joins: vinculos obrigatorios/NOT NULL devem ser INNER JOIN; LEFT JOIN fica restrito a ausencia semanticamente valida e comprovada. Nenhuma dimensao deve multiplicar a linha sem regra explicita.
- O aceite precisa cobrir duplicacao entre branches, multiplas linhas fiscais/contratuais, notas/romaneios, fornecedor/regiao ausente, empate de limite, zero ou varias linhas afetadas e cancelamento PostgreSQL real.

Nenhuma fonte Delphi foi alterada; a nota e o contrato para os prompts finais.

## Question

Consolidar os SQLs de `qryPeriodosEntrega` e `qryConsultaEntregaProdutos`, incluindo `UNION ALL`, filtros/macros, projeções, joins, subconsultas, saldo, romaneio, limites, fornecedor, região, ordenação e SQL de atualização. Mapear chaves naturais, cardinalidades, nulabilidade, riscos de duplicação, injeção por macros e N+1. Propor a tradução segura para Laravel com binds, `IN`/`ANY(array)`, pré-agregações/`EXISTS`, joins guiados pelo schema e cancelamento PostgreSQL, sem copiar concatenação SQL nem loops por registro.
