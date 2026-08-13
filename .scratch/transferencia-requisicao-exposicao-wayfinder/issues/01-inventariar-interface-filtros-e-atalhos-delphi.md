# Inventariar interface, filtros e atalhos da Transferência de Requisição para Exposição Delphi

Type: research
Status: resolved
Blocked by:

## Answer

O inventario foi registrado em pesquisa-interface-delphi.md. A interface confirma os filtros de requisitante, situacao, periodo, curva ABC, produto/codigo de barras e lote; os padroes iniciais; a grade principal e as duas grades de detalhes; F6 cancelar/reabrir, F7 gerar, F8 confirmar, F11 alternar busca, F12 imprimir, conferencia, geracao de lote, atualizacao e visualizacao de foto.

O relatorio separa inferencias e duvidas de fatos do Delphi e registra riscos que nao devem ser copiados automaticamente: wiring incorreto dos checkboxes de detalhes, evento de numero de dias de vendas ligado ao periodo principal, Alt+clique referenciando nota_serie sem coluna declarada e habilitacao de lote dependente apenas da linha corrente.

## Question

Qual é o contrato funcional comprovável da interface em `fmtransferenciarequisicaoexposicao.pas/.dfm`: estado inicial, filtros, validações, filiais, situações, curva ABC, período, código de barras/produto, seleção de lotes, colunas e totais da grade, cores, botões, mensagens, modos de edição, F6/F7/F8/F9/F11/F12/Escape e jornadas de gerar, cancelar/reabrir, confirmar, imprimir, conferir e atualizar? Registrar também divergências, controles ocultos e possíveis bugs sem transformá-los automaticamente em requisito Laravel.
