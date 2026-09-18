# Prompt corretivo — inclusão rápida de produtos e operação mobile

## Contexto

Revise a implementação atual do Cadastro de Inventário no Laravel, especialmente o estado do commit `b8d466ea7`, usando somente o código Laravel, as specs 478–482 e os artefatos deste módulo. Não solicite inspeção direta dos fontes Delphi. Esta é uma correção da implementação existente e deve preservar as operações já entregues.

Este prompt incorpora um comportamento operacional confirmado pelo usuário e que não foi descrito com precisão suficiente nos prompts anteriores: a tela de inclusão de produtos já abre com a próxima sequência sugerida; ao digitar o código do produto e pressionar Enter, o Delphi grava imediatamente o item e, se o produto já estiver no inventário, soma a quantidade informada à quantidade existente. O foco permanece preparado para novas bipagens/digitações.

## Diagnóstico do código atual

### Cadastro e modal de produtos

- `ItemModal.tsx` inicia um novo item com `sequencia = null`; a sequência só aparece depois que um produto existente é consultado.
- Ao resolver o código, o `onChange` do lookup apenas chama `carregar(produto)`. Não há comando explícito de Enter que persista o item.
- O botão `Gravar` usa o fluxo de edição convencional.
- `UpsertItemInventarioCommand` lê a quantidade atual, mas o `upsertItem` grava a quantidade recebida, substituindo o valor existente. Isso não atende ao fluxo de inclusão rápida/soma.
- A sequência real é alocada somente dentro do insert do backend; o usuário não recebe uma sugestão ao abrir a inclusão.
- O modal já possui parte da interface de lotes, mas ainda deve separar corretamente inclusão rápida sem lote da edição detalhada de produtos controlados por lote.

### Coleta mobile

A implementação já possui câmera, `BarcodeDetector`, entrada manual, arquivo, sessão, fila local e idempotência. Entretanto, a revisão identificou lacunas operacionais:

- `aplicarCodigo` considera a requisição concluída mesmo quando o servidor devolve `resultado = erro` ou `conflito`, porque o erro é tratado apenas como estado visual dentro de `enviarEvento`;
- o campo de código não tem fluxo de Enter para coletores Bluetooth/keyboard wedge;
- a tela usa somente `sessaoHidratada && sessaoId` como autorização de operação; depois de pausar, a bipagem e a câmera continuam habilitadas no cliente;
- não há comando visual dedicado para desligar a câmera, e uma nova abertura pode substituir o stream anterior sem encerrá-lo antes;
- a fila exibida e usada por `canFinalizar` deve ser filtrada pela sessão validada; pendências de outro inventário não podem bloquear nem ser misturadas à sessão atual;
- a reentrada no serviço rejeita qualquer usuário diferente de quem iniciou a sessão, embora a regra do módulo permita retomada por outro usuário autorizado;
- o debounce de 1,2 segundo permite repetir o mesmo código em momentos distintos, mas não há proteção explícita contra duas detecções concorrentes enquanto a primeira requisição ainda está em trânsito.

## Objetivo

Reproduzir o fluxo rápido do Delphi no cadastro desktop/tablet e entregar uma coleta mobile segura para câmera, bipagem manual, arquivo e operação offline, com o mesmo incremento de quantidade e sem duplicação acidental.

## Requisitos do cadastro — inclusão rápida

### 1. Abrir inclusão com sequência sugerida

Ao acionar `Incluir produto`/`Ctrl+Insert`:

- abrir o modal no estado de novo item;
- preencher imediatamente o campo `Sequência` com a próxima sequência sugerida para o inventário;
- manter o campo somente leitura para o usuário;
- posicionar o foco no campo de código/lookup do produto;
- usar a quantidade inicial definida pelo parâmetro confirmado do sistema, sem fixar silenciosamente `1` se o contrato indicar outro valor;
- deixar claro que a sequência exibida é uma sugestão de interface; a sequência definitiva deve ser confirmada/alocada pelo servidor de forma segura na gravação concorrente;
- depois da gravação, substituir a sugestão pela sequência efetivamente persistida.

Não fazer uma chamada que avance uma sequência permanente apenas por abrir e cancelar o modal, salvo se o mecanismo autoritativo existente exigir isso e a especificação registrar a consequência. Não usar `MAX()+1` em ambiente concorrente.

### 2. Enter no código grava imediatamente

O evento de Enter deve ser explícito e testável no campo de código, não uma consequência incidental de `onChange`:

1. receber o código digitado ou lido por leitor de teclado;
2. resolver o produto pelo campo prioritário definido pelo parâmetro `PesquisaPadraoProdutoCodigoBarras`, respeitando filtros, filial, produto alfanumérico e lookup padrão;
3. aguardar a resolução completa antes de gravar;
4. se o produto ainda não existir no inventário, criar o item com a quantidade do fluxo rápido;
5. se já existir, somar a quantidade do fluxo rápido à quantidade já persistida;
6. persistir imediatamente o inventário/item em uma operação transacional;
7. atualizar o grid e os indicadores sem fechar a tela de inclusão;
8. limpar o código, preservar a quantidade configurada para a próxima leitura e devolver o foco ao campo de código;
9. informar inclusão, soma, produto não encontrado, produto fora dos filtros ou falha de validação de forma visível.

O mesmo produto digitado várias vezes deve gerar várias somas, uma por Enter confirmado. Não desconsiderar a segunda leitura apenas porque o código é igual ao anterior.

O fluxo rápido é aditivo. O comando explícito `Gravar` usado para editar um item existente continua sendo substitutivo conforme o comportamento do modal: alterar a quantidade para o valor informado, validar redução/motivo e validar lotes.

### 3. Contrato de gravação rápida

Criar um comando/endpoint explícito, ou uma variante claramente identificada do contrato de item, para `adicionar quantidade`/`inclusão rápida`. Não reutilizar o upsert substitutivo de forma ambígua.

No backend:

- validar a situação A, revisão, filial autorizada, produto e filtros no servidor;
- converter a quantidade com `QuantityDecimal` e preservar a precisão do sistema;
- fazer insert quando não existir;
- fazer incremento atômico quando existir, sob a proteção de transação/linha, sem o padrão inseguro `SELECT quantidade` seguido de update sem lock;
- alocar a sequência somente quando o insert for confirmado e retornar a sequência real;
- preservar dados de lote existentes no caminho rápido quando a operação não estiver editando lotes;
- para produto controlado por lote/validade, não gravar silenciosamente uma quantidade sem distribuição de lotes. Abrir a edição detalhada ou exigir o lote da leitura antes de persistir;
- impedir N+1 e não fazer uma query por leitura quando houver lote de códigos a sincronizar;
- auditar inclusão rápida, soma, usuário, inventário, filial, produto, quantidade anterior/nova, canal e dispositivo quando a origem for mobile.

### 4. Modal detalhado e atalhos

Preservar:

- F9/lupa pelo modal padrão de pesquisa;
- Ctrl+Insert para novo item/lote conforme o contexto;
- Ctrl+F9 para pesquisa de lote;
- duplo clique/Enter no grid para edição detalhada;
- quantidade, saldos, sequência, grades condicionais e totais de lotes;
- bloqueio de gravação quando a soma dos lotes não fechar a quantidade do item.

Adicionar testes de aceite para:

- sequência sugerida ao abrir inclusão;
- Enter de produto novo gravando sem exigir clique em Gravar;
- Enter do mesmo produto duas vezes somando duas quantidades;
- edição convencional substituindo quantidade, sem somar por engano;
- falha de resolução sem gravação;
- concorrência de duas leituras do mesmo produto;
- produto controlado por lote abrindo o fluxo detalhado sem quantidade inválida;
- foco retornando ao código após sucesso.

## Requisitos da coleta mobile

### 1. Estados da sessão governam a UI

Manter no estado cliente o estado validado pelo servidor: `ativa`, `pausada` ou `finalizada`.

- `Iniciar` só pode criar uma sessão quando não houver sessão operacional ativa;
- `Aplicar`, Enter, câmera e importação só podem operar em `ativa` sincronizada;
- ao pausar, parar imediatamente o stream e bloquear novas bipagens;
- ao retomar, carregar/confirmar eventos e só então liberar operação;
- sessão finalizada fica somente leitura;
- Finalizar só pode ser habilitado quando a fila da sessão estiver vazia, não houver sincronização pendente e não houver evento remoto em erro/conflito;
- servidor continua sendo a autoridade final para todos esses estados.

### 2. Câmera

Preservar `getUserMedia` com câmera traseira preferencial, `playsInline`, encerramento de todas as tracks e fallback claro para digitação/arquivo quando câmera ou `BarcodeDetector` não estiver disponível.

Corrigir o ciclo:

- desabilitar o botão de câmera sem sessão ativa/sincronizada;
- antes de abrir novo stream, encerrar o stream anterior;
- apresentar `Iniciar câmera` e `Parar câmera` como estados distintos;
- parar o detector ao pausar, finalizar, desmontar ou clicar em Parar;
- manter debounce por quadro/código para evitar rajada;
- permitir nova leitura do mesmo código após confirmação ou intervalo de debounce;
- serializar ou deduplicar detecções em voo para que uma mesma leitura lenta não gere dois eventos;
- não perder uma leitura válida por causa de falha de um frame;
- informar permissão negada, detector ausente e câmera indisponível sem bloquear entrada manual ou arquivo.

### 3. Entrada manual e leitores Bluetooth

O campo `Código` deve aceitar Enter como bipagem manual. O tratamento deve:

- impedir submit/reload da página;
- usar o mesmo `aplicarCodigo` da câmera;
- limpar e devolver foco após evento aceito;
- manter quantidade configurada e permitir alterar a quantidade antes da leitura;
- evitar dupla aplicação quando o leitor enviar Enter e o botão também for acionado.

### 4. Resultado de evento e fila offline

`enviarEvento` deve retornar um resultado tipado. `resultado = erro` ou `conflito` não pode ser tratado como sucesso pelo chamador.

- evento aceito limpa o código e atualiza o último produto;
- evento com erro/conflito permanece visível com mensagem e não mostra `Item aplicado`;
- falha de rede entra na fila local com `event_id` estável;
- retry é idempotente e não soma duas vezes;
- fila local é filtrada pela sessão/inventário/filial validados;
- itens de outra sessão ficam preservados, sem serem aplicados, descartados ou usados para bloquear indevidamente a sessão corrente;
- uma transição offline → online deve produzir um único flush;
- importação de arquivo mostra o resumo de linhas aceitas, rejeitadas e conflitos e atualiza os eventos da sessão;
- arquivo continua com formato `código,quantidade`, acumula repetidos conforme o contrato e só declara sucesso completo após arquivamento confirmado.

### 5. Reentrada e autorização

Ao reabrir uma sessão existente, o servidor deve validar sessão, inventário, filial, estado e autorização do usuário. Usuário diferente do criador pode retomar quando possuir a permissão correspondente; não exigir igualdade do usuário iniciador como única regra.

A tela deve carregar eventos persistidos, inclusive de outros dispositivos, antes de liberar bipagem, arquivo e Finalizar. Inventário e filial vindos do servidor/sessão validada prevalecem sobre valores digitados ou armazenados no aparelho.

### 6. Layout para celular e tablet

Manter layout mobile-first:

- câmera e leitura manual como ações primárias;
- botões grandes e acessíveis;
- foco automático no código;
- indicador de sessão, estado, último produto, quantidade, pendências, erros e conflitos;
- tablet pode usar duas colunas para câmera e eventos;
- arquivo continua disponível quando câmera for negada;
- nenhum fluxo essencial depende exclusivamente de hover ou duplo clique.

## Critérios de aceite mobile

- Uma leitura manual por Enter e uma leitura por câmera produzem o mesmo contrato de evento, mudando somente o canal.
- Duas bipagens confirmadas do mesmo código somam duas vezes no item, sem duplicação causada por frames concorrentes.
- Pausar desliga a câmera e impede novas leituras até Retomar.
- Erro ou conflito do servidor não aparece como sucesso.
- Fila de outra sessão não é aplicada nem bloqueia indevidamente a sessão atual.
- Reentrada válida por usuário autorizado não cria nova sessão e mostra eventos anteriores antes de liberar a operação.
- Permissão de câmera negada ou `BarcodeDetector` ausente mantém digitação e importação funcionais.
- Todos os fluxos acima têm testes de componente/integração com mocks de câmera, rede, estados da sessão, fila e respostas de erro.

## Regras técnicas obrigatórias

Usar queries set-based, binds e decimal exato. Incrementos devem ser atômicos. Enriquecimentos devem usar `IN`, `= ANY(array)` ou `unnest` quando aplicável; nunca uma query por bipagem em lote. Relações obrigatórias com campos `NOT NULL` usam `INNER JOIN`; `LEFT JOIN` somente para relações opcionais comprovadas.

Não inventar tabela, coluna, FK, função ou parâmetro ausente do snapshot. Não testar driver, não testar `hasTable`/`Schema::has*` em runtime e não pedir que o agente verifique diretamente fontes Delphi.

## Entrega

Produzir a especificação corretiva, contratos de payload, matriz de permissões, estados de UI, estratégia de sequência/incremento e tasks implementáveis para a mesma base. Incluir evidências de testes do checkout efetivamente revisado, sem reutilizar logs de outro caminho do projeto.
