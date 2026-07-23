# Inventariar o fluxo e a interface da Autorização de Pagamentos no Delphi

Type: task
Status: resolved
Blocked by:

## Question

Qual é o fluxo completo alcançável em `fmautorizacaopagamento.pas/.dfm`: entrada no módulo, filtros, pesquisas, colunas, seleção/marcação, autorizar/desautorizar, confirmações, mensagens, atalhos, impressão, totalizadores, estados de loading/vazio/erro e diferenças entre registros abertos, autorizados e pagos?

## Answer

### Escopo e evidências

Inventário baseado em `delphi/apps/contaspagar/fmautorizacaopagamento.pas/.dfm`, seguindo somente os métodos alcançáveis de `dmautorizacaopagamento.pas/.dfm` necessários para explicar a interface. O form é registrado pelo pacote de Contas a Pagar em `rgcontaspagar.pas`; a regra exata do menu/launcher que o instancia não está no form analisado (`NÃO LOCALIZADO`).

### Jornada e estado inicial

- `CONFIRMADO`: a janela chama-se **Autorização de Pagamentos** e abre na aba **Parâmetros**, subaba **Filial**, operação **Autorizar**, com foco no vencimento inicial.
- `CONFIRMADO`: vencimento inicial/final e autorização inicial/final recebem a data do servidor. Lançamento inicial/final ficam sem valor explícito.
- `CONFIRMADO`: há duas jornadas mutuamente exclusivas: **Autorizar**, que pesquisa duplicatas ainda não autorizadas por vencimento/lançamento; e **Cancelar ou Imprimir**, que pesquisa duplicatas autorizadas por data de autorização.
- `CONFIRMADO`: `Gerar F6` só fica habilitado nos parâmetros. Havendo resultados, troca para **Registros Selecionados**; sem resultados, permanece nos filtros, mostra “nenhum registro selecionado” e devolve o foco ao vencimento inicial ou à autorização inicial conforme a operação.
- `CONFIRMADO`: voltar da grade aos parâmetros fecha o dataset, limpa checkbox e totalizadores e zera o estado de marcação. `Esc` na grade também retorna aos parâmetros.

### Filtros e pesquisas auxiliares

- `CONFIRMADO`: escopo alternativo por **Filial** ou **Grupo Filial**, mais filtro opcional de **Fornecedor**. O rótulo muda para Fornecedor, Cliente Fornecedor ou Filial Fornecedor segundo o tipo encontrado.
- `CONFIRMADO`: os três códigos possuem botão de procura e exibem descrição/nome somente leitura. A consulta de fornecedor é não interativa; filial e grupo usam consulta interativa.
- `CONFIRMADO`: Autorizar expõe intervalos de **Vencimentos** e **Lançamentos**; Cancelar ou Imprimir expõe intervalo de **Autorização**.
- `CONFIRMADO`: a validação explícita de `Gerar` exige datas válidas de vencimento/lançamento e, se preenchidos, códigos existentes de filial, grupo e fornecedor.
- `POSSÍVEL BUG LEGADO`: as datas de autorização usadas em Cancelar/Imprimir não participam de `ValidarCamposSelecao`; a implementação Laravel deve validá-las no servidor.
- `CONFIRMADO`: Enter no campo fornecedor dispara `Gerar`.

### Grade, marcação e totalizadores

- `CONFIRMADO`: colunas visíveis: **Código** do fornecedor, **Fornecedor**, **Nº Docto**, **ND** (número da duplicata), **Série e nº Nota**, **Vencto**, **Valor**, **Previsão**, **Autorização** e **OK**.
- `CONFIRMADO`: a grade é somente leitura, exceto o campo lógico `OK`. Duplo clique ou `Ctrl+Espaço` alterna a marca do registro corrente; **Marcar todas as duplicatas** marca/desmarca o conjunto carregado.
- `CONFIRMADO`: registros marcados recebem fundo de informação; registros com observação aparecem em negrito. A observação completa do registro corrente é exibida abaixo da grade.
- `CONFIRMADO`: a tela mostra, para o resultado, quantidade e soma de **Previsão**; para a seleção, quantidade e soma **Autorizado**. Os valores marcados são recalculados a cada alternância.
- `CONFIRMADO`: Autorizar/Cancelar e Imprimir ficam desabilitados sem ao menos um registro marcado.

### Autorizar, cancelar e imprimir

- `CONFIRMADO`: em Autorizar, o comando principal é **Autorizar F5**; em Cancelar ou Imprimir, torna-se **Cancelar F5**. A ação percorre apenas registros marcados, exige credencial com capacidade de Pagamento, recarrega a lista e zera a seleção apó a mutação.
- `CONFIRMADO`: não existe confirmação de intenção separada antes de autorizar/cancelar. Existe desafio de senha/login para obter o autorizador. Se recusado ou sem capacidade, mostra aviso de usuário não autorizado a autorizar pagamentos.
- `CONFIRMADO`: **Imprimir F7** solicita a mesma autorização sensível. Na jornada Autorizar, primeiro autoriza os marcados e imprime os que ficaram autorizados; na jornada Cancelar ou Imprimir, imprime os marcados sem cancelar. A saída abre o preview padrão.
- `POSSÍVEL BUG LEGADO`: embora o botão diga `Imprimir F7`, o handler global de `F7` aciona o botão Autorizar/Cancelar, não Imprimir. O Laravel não deve reproduzir essa divergência.
- `CONFIRMADO`: `F5` executa Autorizar/Cancelar, `F6` gera a consulta e `Esc` volta aos parâmetros. Não há atalho funcional confirmado para impressão.

### Estados dos títulos e estados de tela

- `CONFIRMADO`: Autorizar lista apenas duplicatas não autorizadas; Cancelar/Imprimir lista apenas autorizadas. Em ambas, previsões documentais são excluídas.
- `CONFIRMADO`: duplicatas pagas nunca entram na tela (`datapagto is null`). Portanto, **aberta** pode ser autorizada ou não autorizada; **paga** é estado terminal invisível e não selecionável neste módulo.
- `CONFIRMADO`: a coluna Autorização representa a data do estado autorizado. Durante a marcação, o Delphi preenche/limpa essa data localmente antes da confirmação, o que pode fazer a grade parecer autorizada antes da persistência.
- `OPORTUNIDADE`: no Laravel, separar visualmente **selecionado** de **autorizado persistido**, evitando usar a data de autorização como estado provisório.
- `NÃO LOCALIZADO`: spinner/loading, skeleton, tratamento específico de timeout/erro, retry, paginação e mensagem de sucesso. O vazio usa apenas aviso genérico; exceções dependem da infraestrutura herdada. Esses estados devem ser especificados explicitamente para a UI Laravel.

### Contrato funcional a preservar no Laravel

O módulo deve oferecer filtros por operação e escopo, busca assistida, resultado tabular com observação, seleção individual/em massa, totais do resultado e da seleção, autorização, desautorização e impressão. Deve impedir operações sem seleção, excluir pagos, distinguir inequivocamente seleção de estado persistido e oferecer loading, vazio, erro, sucesso e confirmação de intenção. O contrato detalhado de permissão, persistência, concorrência e parâmetros permanece para o ticket 02.
