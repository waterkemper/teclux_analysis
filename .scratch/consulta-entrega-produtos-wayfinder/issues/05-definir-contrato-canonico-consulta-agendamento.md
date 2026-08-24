# Definir contrato canonico da Consulta e Agendamento de Entregas no Laravel

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04

## Answer

Contrato canonico definido com base nos quatro inventarios e aprovado pelo solicitante.

1. O modulo sera uma Consulta e Agendamento de Entregas: consulta operacional com edicao limitada de data, hora e periodo de entrega. Nao sera um cadastro generico em grid.
2. F5/Gravar enviara todas as alteracoes pendentes como um unico change set em uma transacao atomica. A operacao tera idempotencia, revisao esperada, auditoria e conflito explicito; qualquer conflito ou identidade nao comprovada rejeita o lote sem commit parcial.
3. A linha devera transportar explicitamente source_kind fiscal/contrato e a chave real confirmada pelo snapshot PostgreSQL. contratonota, posicao visual e produtovisual nao sao chaves de escrita.
4. Filtros serao DTO/Form Request tipado: intervalo inclusivo, Todas as entregas, filiais de venda, filiais do produto, periodos, fornecedores de transporte e contexto de romaneio. IDs usarao binds, IN/whereIn ou ANY(array); nenhuma macro textual sera aceita.
5. Data, hora e periodo terao as validacoes de faixa observadas no Delphi. Troca de periodo ajusta hora fora da faixa; troca de hora seleciona o periodo correspondente. Os demais campos derivados serao somente leitura.
6. O grid usara catalogo, ordenacao allowlistada e deterministica, preferencias, agrupamento equivalente, personalizacao e exportacao server-side. F6 e Gerar usarao o mesmo handler e o mesmo resultado canonico para grid, preview, relatorio, PDF, impressao e exportacao.
7. F6 registrara busy e trace antes do primeiro await; a consulta inteira rodara no runner PostgreSQL cancelavel. Cancelar chamara pg_cancel_backend no servidor antes de abortar a espera local, preservando o ultimo resultado completo.
8. F9 usara o modal padrao de pesquisa com endpoint paginado e autorizacao server-side. F10 abrira o contrato quando a linha tiver identidade autorizada. Command bar, icones, atalhos e breadcrumb seguirao os componentes Laravel.
9. A folha Cloud sera criada explicitamente no caminho solicitado Entregas e Montagens -> Entregas -> Relatorio de Entregas, com rota/capability propria. O acesso sera fail-closed e a Filial sera derivada e revalidada no servidor.
10. O manifesto de parametros ficara vazio: nao foi localizado parametro especifico nem parametros_valor nesta tela. Se surgir nova evidencia, a leitura sera em lote por Filial e o fallback sera explicito.
11. O schema sera snapshot PostgreSQL proprio, datado, com SHA e manifest. SQL sem relacao, coluna, funcao, nulabilidade ou cardinalidade comprovada bloqueara o prompt; nao usar teste de driver, hasTable, Schema::has*, information_schema ou pg_catalog em runtime.

## Question

Com base nos inventarios, decidir o contrato Laravel da tela: separacao entre consulta e edicao operacional; identidade da linha fiscal/contrato; filtros tipados e escopo de Filial; regras de data/hora/periodo; persistencia em lote, transacao, concorrencia e conflitos; F5/F6/F9/F10; grid, agrupamento, ordenacao e exportacao; fotografia/read model para relatorio; cancelamento PostgreSQL; menu, autorizacao, parametros e schema. Fechar somente regras sustentadas por evidencia ou decisao explicita, mantendo os guardrails contra N+1, SQL textual, joins incorretos, teste de driver e hasTable.
