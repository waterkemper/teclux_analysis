# Prompt para /speckit.specify - Correcao F10 Consulta de Compras -> Pedido de Compra

~~~text
/speckit.specify

Crie uma especificacao corretiva e incremental para o fluxo F10 que sai da Consulta de Compras e inicia uma Inclusao de Pedido de Compra no Laravel. Gere a especificacao; nao implemente nesta etapa.

Esta entrega complementa, sem duplicar, o contrato geral de integracao do prompt 03 desta pasta. O foco e fechar as divergencias encontradas na paridade com o Delphi em Parte Fornecedora, Filial de faturamento, conjunto de itens, identidade de linha e quantidade enviada.

## Leituras obrigatorias

- prompts 01, 02 e 03 desta pasta; reutilize os motores e contratos ja decididos;
- .scratch/cadastro-pedidos-consulta-compras-paridade-wayfinder/docs/01-fluxo-integracao-f10.md;
- .scratch/cadastro-pedidos-consulta-compras-paridade-wayfinder/docs/02-parte-fornecedora-vendedor.md;
- .scratch/cadastro-pedidos-consulta-compras-paridade-wayfinder/docs/03-quantidades-itens.md;
- .scratch/cadastro-pedidos-consulta-compras-paridade-wayfinder/docs/05-classificacao-fronteira.md;
- codigo atual em laravel/backend/resources/js/Pages/Cadastros/Estoque/ConsultaCompras/, especialmente Index.tsx, buildGerarPedidoPayload.ts e o componente de fornecedor quando o nome real diferir;
- ConsultaComprasController, ConsultaComprasGerarPedidoContratoService, GerarPedidoCompraContractBuilder e os testes de ConsultaComprasGerarPedidoContrato.

Corrija as hipoteses acima se o checkout atual divergir, citando arquivo e trecho. Classifique cada descoberta como CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO, DIVERGENTE, POSSIVEL BUG, SEM PROVA ou OPORTUNIDADE.

## Evidencia legada autoritativa

- fmconsultacompras.pas:1164-1290 le a Parte Fornecedora do lookup com TipoCliente F e Tipovfornecedor F, define a Filial de faturamento (a unica Filial marcada ou a FilialBase), percorre somente qryComprasTotal e copia o fornecedor para o cabecalho do Pedido.
- O loop F10 inclui apenas linhas selecionadas com sugestao diferente de zero, escolhe um entre sugestao, sugestaominimo e sugestaomaximo, e chama AsInteger. A conversao inteira e uma divergencia legada: nao truncar a quantidade decimal no Laravel.
- dmcadastropedidos.pas:2213-2305 e :4686-4752 mostram que o Cadastro recebe o fornecedor/filial antes da inclusao das linhas; nao ha selecao de vendedor de vendas por Produto.
- O nome dmconsultapras.pas nao foi localizado; a fonte efetiva e dmconsultacompras.pas/.dfm.

## Contrato corretivo

Defina e documente um contrato interno tipado com:

- filial_fatura: inteiro positivo, calculado pela regra Delphi;
- Parte Fornecedora opcional, mas quando informada com semantica de Fornecedor deve carregar codigo e tipo F. Mantenha compatibilidade com o campo legado fornecedor no limite necessario, sem aceitar tipo de vendedor de vendas;
- itens: somente linhas do conjunto total autoritativo, na ordem da selecao, cada uma com produto, quantidade decimal canonica como string e valor_unitario decimal canonico como string;
- o campo de quantidade escolhido: sugestao, minimo ou maximo;
- metadados de rejeicao para linha conflitante ou Produto/Filial invalido, sem fallback silencioso para a primeira ocorrencia.

O contrato deve conservar a regra ja decidida de excluir toda linha cuja sugestao base seja zero, mesmo quando o campo minimo ou maximo escolhido seja positivo. Deve conservar tambem a precedencia de valor precocomicms -> valorultimacompra -> customedio, sem recalcular custo no Cadastro.

## Correcao de selecao e identidade

- A fonte F10 deve ser o equivalente a qryComprasTotal; nao concatenar produtos_total, similares e grades para formar o Pedido.
- A selecao visual deve carregar a identidade completa da linha. Quando Filial estiver presente como dimensao, a chave minima e produto + filial; se o total for comprovadamente unico por Produto, declarar essa garantia e rejeitar qualquer conflito, nunca usar first wins.
- Alterar uma quantidade deve atingir somente a linha selecionada. Nao propagar uma alteracao com filial nula para todas as linhas do mesmo Produto.
- O cancelamento da escolha de quantidade nao gera contrato nem abre Cadastro.
- Filial de faturamento nao pode ser substituida silenciosamente pela FilialBase depois de validada pelo contrato.

## Parte Fornecedora

- Conectar o componente de lookup existente na tela, sem criar outro mecanismo paralelo.
- Enviar o codigo selecionado e a identidade F para o endpoint; validar no backend o tipo permitido para este fluxo.
- Manter fornecedor opcional conforme o prompt 03: ausencia deve ser explicita e o Cadastro deve abrir sem fornecedor, sem escolher um fornecedor por Produto.
- Nao criar nem transportar vendedor de vendas por linha, pois ele nao participa do F10 Delphi.

## Arquivos e seams esperados

Revalidar antes de especificar a mudanca:

- estado e payload React da Consulta;
- request, route e controller do endpoint F10;
- normalizador de Filial e quantidade;
- builder do contrato;
- handoff em sessao que entrega o contrato ao Cadastro;
- testes Feature do contrato e testes de componente quando existentes.

Nao alterar neste prompt os motores de sugestao, a precedencia de custo, o motor de impostos ou o Cadastro de Pedidos. Nao alterar Delphi, schema, migrations ou seeds.

## Criterios de aceite

- Fornecedor selecionado no lookup F chega ao contrato, a sessao, ao rascunho do Cadastro e ao cabecalho salvo sem perder o codigo nem o tipo F.
- Ausencia de fornecedor permanece ausencia explicita; nenhum vendedor de vendas e inventado.
- Uma unica Filial marcada vira Filial de faturamento; em selecao multipla ou nenhuma, aplica-se a regra de FilialBase ja definida, sem substituir uma Filial valida depois.
- O contrato contem somente linhas selecionadas do total, sem similares ou grades adicionados por acidente.
- Produto repetido por Filial ou linha conflitante nao e descartado silenciosamente; e rejeitado ou resolvido por regra explicita e testada.
- As tres escolhas de quantidade produzem a quantidade correspondente, preservando fracoes e escala decimal.
- Toda linha com sugestao base zero fica fora, inclusive ao escolher minimo ou maximo.
- O valor unitario segue a precedencia existente e nao e refeito pelo Cadastro.
- Cancelar a escolha de quantidade nao grava sessao nem navega para Cadastro.

## Testes e regressao

Incluir testes para fornecedor F informado/ausente, Filial unica/multipla/nenhuma, cada campo de quantidade, fracoes, sugestao zero, Produto repetido por Filial, conflito entre abas e cancelamento. Verificar payload exato, sessao e contrato final.

Adicionar verificacao de contrato que conte as linhas e compare identidade/ordem, sem depender de Excel ou de banco artificial quando o comportamento vier do PostgreSQL legado. Registrar consultas do endpoint F10 para demonstrar que ele nao faz uma consulta de Produto por item; o carregamento de detalhes deve continuar batch.

## Observabilidade

Registrar rejeicoes com codigo estavel, Produto/Filial e correlation_id, sem logar dados desnecessarios. Medir nos testes a contagem de queries do POST F10 e manter evidencia de que quantidades e valores vieram do contrato, nao de uma releitura posterior.

## Fora de escopo

Cadastro de Pedidos completo, enriquecimento batch de Produtos, gravacao das linhas, reducao de releituras do cabecalho, motores de sugestao/custo/impostos, Requisicao entre Filiais, migrations, seeds, alteracao Delphi e vendedor de vendas por Produto.
~~~

