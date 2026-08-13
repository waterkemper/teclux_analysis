# Prompt para `/speckit.specify` — correções pós-implementação e paridade Delphi

````text
/speckit.specify

Crie uma especificação funcional e técnica para corrigir a implementação Laravel existente de **Interlojas → Transferência de Requisição para Exposição**, comparando-a com as evidências Delphi já consolidadas neste prompt. Não implemente código nesta etapa. Consuma os prompts 01 a 05, as pesquisas deste diretório e inspecione somente o checkout atual em `C:\teclux_analysis\laravel` antes de propor contratos.

Esta é uma especificação de correção pós-implementação. Não reescreva o módulo inteiro e não trate como ausente uma capacidade que já esteja implementada. Para cada item, classifique explicitamente como: já correto, divergente, incompleto, risco de regressão ou fora de escopo. Cite arquivo e linha do Laravel atual e da fonte Delphi correspondente.

## Objetivo e fronteira

Fechar as divergências identificadas na auditoria da implementação atual, preservando os contratos já publicados e o schema autoritativo. A especificação deve cobrir somente:

1. busca operacional Produto/Código de Barras e atalho F11;
2. filtro visual de lotes;
3. geração direta de lotes e geração implícita ao iniciar conferência;
4. conferência operacional dos produtos;
5. impressão do pedido/requisição operacional.

Emissão, transmissão, consulta ou cancelamento de NF-e, DANFE, XML, SEFAZ, impostos, séries, duplicatas e qualquer regra de venda entre filiais continuam fora do escopo.

## Fontes obrigatórias

- `modules/interlojas/transferencia-requisicao-exposicao/README.md`;
- `01-speckit-prompt-fundacao-dominio-seguranca.md` a `05-speckit-prompt-interface-integracao-aceite.md`;
- `pesquisa-interface-delphi.md`;
- `pesquisa-sql-dominio-efeitos-delphi.md`;
- `pesquisa-parametros-autorizacoes-menu.md`;
- `pesquisa-padroes-laravel-reuso.md`;
- implementação atual em `laravel/backend/app`, `laravel/backend/resources/js`, `laravel/backend/resources/views/reports` e testes do módulo;
- `schema/postgresql-authoritative-2026-08-06.json` e `schema/README.md`.

O Cursor não possui acesso ao checkout Delphi. Não tente abrir, pesquisar ou citar fontes Delphi. Use a evidência Delphi abaixo como contrato de comparação e cite arquivos/linhas somente do Laravel acessível e das pesquisas Markdown deste diretório.

## Evidências Delphi já consolidadas

Estas observações foram extraídas previamente dos fontes Delphi e são a autoridade para esta correção:

- O parâmetro persistido é `Exibir localização por código de barras nas transferências`. Quando falso, o Delphi oculta todo o grupo de localização/código de barras; não existe um filtro de consulta por produto substituindo esse grupo.
- Quando o parâmetro está ativo, F11 alterna o modo operacional entre `CÓDIGO DE BARRAS` e `PRODUTO`. Enter chama a localização do produto no conjunto carregado e incrementa `qtderecebida` da linha localizada. Isso não é uma nova consulta SQL nem um filtro textual da grade.
- `Permitir requisições de produtos duplicadas` é outro parâmetro e não controla a visibilidade da busca ou do F11.
- A lista de lotes é uma seleção visual: nenhum lote selecionado significa aceitar todos os lotes; selecionar lotes restringe a grade.
- `Gerar Lote` processa as linhas marcadas elegíveis. Ao iniciar `Conferir`, o Delphi verifica o lote e, quando necessário, cria o próximo lote e associa as linhas marcadas sem lote antes de abrir a conferência.
- A conferência chama o fluxo operacional genérico `ConferirProdutos` para o tipo `TRF`, com leitura/localização de produto, quantidade lida, faltantes e divergências, persistindo o cabeçalho `conferencia` e as linhas `produtosconferencia`.
- Antes de imprimir, o Delphi executa `AtualizarQtdePedida`. Durante a impressão, se `Imprimir Requisição Não Confirmada` estiver falso, aceita somente `qtderecebida > 0`; se estiver verdadeiro, aceita também `qtderecebida >= 0`.

## 1. Busca operacional e F11 — correção obrigatória

Corrija a modelagem da busca atual. No Delphi, `Exibir localização por código de barras nas transferências` controla a visibilidade do grupo de localização; não é autorização para transformar a consulta em filtro textual.

Especifique:

- resolução server-side do literal comprovado `Exibir localização por código de barras nas transferências`, por filial efetiva, sem aceitar o parâmetro do browser;
- quando o parâmetro estiver falso, ocultar o controle de localização e não exibir “Produto” como filtro de consulta;
- quando estiver verdadeiro, exibir o controle operacional e permitir que F11 alterne entre `CÓDIGO DE BARRAS` e `PRODUTO`, como no Delphi;
- Enter deve localizar no conjunto atualmente carregado o produto/código informado e incrementar a quantidade recebida da linha correspondente, respeitando situação aberta, lote, revisão e autorização;
- a localização operacional não pode disparar um novo filtro SQL da consulta nem alterar silenciosamente o conjunto retornado por F7;
- diferenciar busca operacional de filtro de consulta em tipos, endpoints, estados de UI, mensagens e testes;
- não usar `Permitir requisições de produtos duplicadas` para controlar a visibilidade ou o modo da busca; esse parâmetro tem outro efeito.

O valor padrão `modo_busca = produto` atualmente existente não deve perpetuar a divergência. Defina o contrato de estado inicial e a compatibilidade necessária para payloads antigos sem reintroduzir a busca indevida.

## 2. Filtro de lotes

Audite e especifique somente os ajustes necessários, preservando o comportamento já correto:

- lista de lotes derivada dos demais filtros, sem aplicar a seleção de lotes sobre a própria lista de opções;
- nenhuma seleção significa todos os lotes, nunca resultado vazio;
- seleção múltipla restringe a grade com `IN`/`ANY` parametrizado;
- lotes nulos ou inválidos não devem virar opção selecionável;
- seleção/desseleção deve ser determinística, acessível e refletida no estado real retornado pelo servidor;
- busca operacional Produto/Código de Barras não pode contaminar a lista de lotes, pois deixou de ser filtro SQL;
- manter formatação legada do código do lote quando necessária à leitura humana, sem alterar a identidade numérica persistida.

## 3. Geração de lotes

Preserve a geração direta já existente quando ela estiver correta: conjunto de linhas marcadas, requisitante válido, situação aberta, ausência de lote, revisão, lock determinístico, código obtido por função/sequence PostgreSQL, idempotência e associação set-based.

Inclua a divergência do Delphi em `VerificarLoteTransferencia`: ao iniciar `Conferir`, se a linha corrente/seleção elegível ainda não possuir lote, o fluxo deve criar o próximo lote e associar as linhas marcadas elegíveis antes de abrir a conferência. Defina:

- qual é a linha corrente ou lote ativo quando há várias linhas marcadas;
- rejeição explícita de seleção com múltiplos lotes incompatíveis, sem escolher silenciosamente o primeiro lote;
- revalidação de situação, filial, requisitante, revisão e ausência de lote dentro da mesma unidade transacional;
- respostas para repetição, concorrência, lote já existente, seleção vazia e falha parcial;
- compatibilidade entre o botão `Gerar Lote` e o lote criado implicitamente por `Conferir`.

## 4. Conferência operacional de produtos

A implementação atual só valida leituras previamente persistidas em `produtosconferencia`; ela não reproduz a jornada operacional `ConferirProdutos` do Delphi. Especifique a fatia faltante:

- endpoint(s), Form Requests, DTOs e comandos para abrir/consultar uma conferência `TRF` por lote;
- tela/modal de conferência com leitura por código de barras, localização por produto, quantidade lida e lançamento manual quando permitido;
- persistência idempotente de leituras em `produtosconferencia`, com cabeçalho em `conferencia`, usuário, filial, lote e tipo operacional;
- cálculo set-based de esperado, lido, faltante, excedente, produto divergente, lote divergente e item não pertencente à requisição;
- bloqueio de quantidade lida acima do esperado conforme a regra Delphi, com mensagem operacional clara;
- ações de refazer/recomeçar/faltantes somente se comprovadas pela tela compartilhada de conferência e com semântica documentada;
- reconsulta e atualização de revisão para impedir gravação obsoleta;
- desmarcar item loteado removendo apenas a leitura `TRF` daquele item, sem apagar outra conferência;
- concluir ou recusar a conferência de forma determinística, deixando explícita a relação com o F8 de confirmação;
- locks e transações por conjunto, sem N+1, `Locate` server-side ou atualização por linha quando SQL set-based resolver.

Não invente uma nova regra fiscal. Conferência é operação logística/estoque e não emissão de nota.

## 5. Impressão operacional do pedido

Audite a rota, serviço, request, consulta e Blade/PDF existentes e especifique as correções necessárias para paridade com `ImprimirRequisicoes` do Delphi:

- resolver server-side `Imprimir Requisição Não Confirmada` usando o literal persistido e a filial efetiva;
- quando falso, imprimir somente itens com `qtderecebida > 0`; quando verdadeiro, incluir também itens não confirmados (`qtderecebida >= 0`), respeitando os demais filtros;
- executar a atualização/verificação equivalente a `AtualizarQtdePedida` antes de congelar os dados do relatório, ou documentar uma decisão Laravel equivalente para concorrência e dados obsoletos;
- congelar filtros, ordenação, filial, requisitante, lotes e revisão no servidor, sem confiar em decisão da UI;
- especificar campos e agrupamentos necessários para o relatório operacional comparando o FastReport Delphi com o relatório Blade atual, incluindo cabeçalho, requisitante, lote, produto, ABC/localização quando comprovados, totais, quantidades pedida/recebida e observação;
- preservar geração segura de PDF, nome de arquivo, autorização e mensagens de erro;
- cobrir impressão com resultado vazio e com seleção de lote;
- não incluir qualquer documento ou fluxo de NF-e.

## Contratos, segurança e schema

Para cada correção, entregue contrato de rota, request, resposta, erro, capability/policy, revisão e idempotência. Parâmetros, filial efetiva, situação, lote, quantidade e autorização são sempre decisões server-side.

Use o snapshot PostgreSQL para confirmar nulabilidade, FK, índices, triggers, funções e sequences antes de definir SQL. O schema gate pertence a teste/CI; o request não pode usar `information_schema`, `pg_catalog` ou `Schema::has*`. Use consultas parametrizadas, conjuntos (`IN`/`ANY`), locks determinísticos e nenhuma consulta por linha.

## Critérios de aceite

- [ ] Com o parâmetro de localização desabilitado, não existe busca por produto visível na tela.
- [ ] Com o parâmetro habilitado, F11 alterna o controle operacional e Enter localiza/incrementa a linha, sem filtrar novamente a consulta.
- [ ] `Permitir requisições de produtos duplicadas` não altera a visibilidade da busca.
- [ ] Filtro vazio de lotes significa todos; seleção múltipla restringe somente a grade.
- [ ] Gerar Lote direto e geração implícita por Conferir usam validação, revisão, lock, sequência e idempotência.
- [ ] Seleção com múltiplos lotes incompatíveis não escolhe silenciosamente um lote.
- [ ] Conferência permite registrar leituras de produto/código de barras e quantidades em `produtosconferencia` com tipo `TRF`.
- [ ] Conferência detecta faltantes, excedentes e divergências em conjunto e suporta a limpeza correta ao desmarcar item.
- [ ] Impressão aplica `Imprimir Requisição Não Confirmada` no servidor e reproduz os campos operacionais comprovados.
- [ ] Testes cobrem parâmetro falso/verdadeiro, F11, leitura repetida, revisão obsoleta, lotes vazios/múltiplos, geração implícita, conferência divergente, impressão confirmada/não confirmada e resultado vazio.
- [ ] Não há implementação de emissão fiscal, venda entre filiais, N+1, SQL concatenado ou teste de driver/`hashtablefs`/`hastablefs`.

## Saída esperada do `/speckit.specify`

Produza uma especificação pronta para implementação incremental, contendo: diagnóstico por capacidade; comportamento Delphi confirmado; divergências atuais; decisões e inferências; contratos backend/frontend; modelo de estados; SQL e estratégia de locks; parâmetros e autoridade; componentes Laravel a reutilizar; plano de migração de payloads se necessário; testes de aceitação; riscos; dependências e ordem de implementação. Não escreva código nesta etapa.
````
