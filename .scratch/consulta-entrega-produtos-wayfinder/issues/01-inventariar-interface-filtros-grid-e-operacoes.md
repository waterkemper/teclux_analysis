# Inventariar interface, filtros, grid e operações da Consulta de Entrega de Produtos

Type: research
Status: resolved
Blocked by:

## Answer

Pesquisa consolidada em modules/entregas/consulta-entrega-produtos/pesquisa-interface-filtros-grid-operacoes.md.

- A tela e Agendamento de entregas, com abas Parametros/Dados e operacoes F5 Gravar, F6 Gerar e F10 Contrato. Os filtros confirmados sao intervalo de entregas, Todas as entregas, filiais de venda, filiais do produto, periodos marcados, fornecedores de transporte e contexto fiscal de romaneio.
- O resultado e agrupado por data, periodo, regiao e contratonota; a ordenacao inicial e por data, periodo, regiao, CEP, bairro e hora. O popup legado oferece pesquisa Ctrl+F, exportacao Excel Ctrl+X e copia Ctrl+C.
- A intencao de edicao e restrita a data, hora e periodo de entrega. Ao trocar periodo, a hora fora da faixa e substituida pela hora padrao; ao trocar hora, o primeiro periodo contendo a hora e selecionado. O Laravel deve tornar a editabilidade explicita e nao expor campos derivados como limitequantidade ou contratonota.
- F5 compara valores atuais com os aliases aux* e atualiza produtosdadosfiscais ou produtoscontratos; F6 gera os dados; F10 localiza e abre o contrato. A copia em lote por contrato/documento fiscal ocorre no cache e a persistencia efetiva depende do Gravar.
- F9/Ctrl+F9 e Ctrl+Del nao foram comprovados como implementados nesta unidade. Nao devem ser atribuidos ao Laravel como paridade Delphi sem decisao propria; F9, quando adotado, deve usar o modal padrao do Laravel.
- Foram classificados como possiveis bugs legados a ausencia de limpeza de PeriodoEntrega_DF quando nenhum periodo e marcado e o retorno nao inicializado de GravarDados sem alteracoes. A atomicidade de perpetrar e o comportamento runtime das colunas ReadOnly nao foram localizados.

Nenhum fonte Delphi foi alterado e o futuro implementador pode usar a nota consolidada sem reabrir os fontes Delphi.

## Question

Qual é o contrato funcional comprovável de `fmConsultaEntregaProdutos.pas/.dfm` e do dataset associado: controles, defaults, filtros de datas, filiais de venda/produto, períodos marcados, fornecedores de transporte, contexto de romaneio, F6/F9/Ctrl+F9 e demais atalhos, botões, popup menu, colunas, agrupamento, ordenação, edição, validações e persistência? Detalhar quais campos do grid podem ser editados, como período/hora interagem, quais updates são gerados e o que é somente leitura. Registrar evidências em notas no módulo de destino e separar requisitos do Laravel de comportamento legado; não pedir inspeção Delphi direta ao futuro implementador.
