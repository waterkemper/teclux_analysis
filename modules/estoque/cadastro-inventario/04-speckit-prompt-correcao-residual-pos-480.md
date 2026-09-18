# Prompt corretivo residual — Cadastro de Inventário pós-480

## Contexto

Revise e corrija a implementação existente do Cadastro de Inventário no commit `c6a1bea66`, comparando-a com:

- `specs/480-fix-inventario-closeout/spec.md`, `tasks.md` e os contratos em `specs/480-fix-inventario-closeout/contracts/`;
- `specs/478-cadastro-inventario/` e `specs/479-fix-inventario-aceite/`;
- `modules/estoque/cadastro-inventario/01-speckit-prompt-cadastro-inventario.md`;
- `modules/estoque/cadastro-inventario/02-speckit-prompt-correcao-implementacao.md`;
- `modules/estoque/cadastro-inventario/03-speckit-prompt-correcao-residual-pos-479.md`.

Corrija in-place. Não crie implementação paralela, não reabra nem peça para verificar fontes Delphi diretamente e não reintroduza requisitos removidos deste módulo.

## Evidências da revisão

O commit `c6a1bea66` adicionou evidências de PHPUnit, Vitest e Pint, mas a execução da suíte Vitest neste checkout foi repetida e falhou em três suítes (`Coleta.test.tsx`, `inventarioF6.test.tsx` e `inventarioFiltros.test.tsx`) com `Cannot find module 'C:/teclux_cloud/backend/resources/js/test/setup.ts'`; apenas `resolverProdutoColeta.test.ts` passou. Portanto, os logs anexados em `specs/480-fix-inventario-closeout/evidence/` não podem ser aceitos sem reprodução no mesmo checkout e correção do caminho resolvido pelo Vite/Vitest.

## Pendências confirmadas

### 1. Eventos persistidos da coleta não aparecem na tela

`Coleta.tsx` recebe a URL `eventos`, mas não a chama. A tela exibe apenas erros mantidos no estado local da resposta imediata. Assim, ao reabrir a sessão, trocar de dispositivo ou receber um conflito persistido no servidor, o operador não vê o detalhe e o botão Finalizar não fica visualmente bloqueado por esses eventos.

Corrigir para:

- tornar a URL de eventos obrigatória no contrato da página;
- consultar eventos da sessão após iniciar, ao montar/reabrir a sessão, após flush/Retry e após importar arquivo;
- renderizar individualmente código, quantidade, canal, dispositivo, resultado, mensagem e origem de linha quando disponível;
- manter uma distinção clara entre eventos `erro`/`conflito` abertos e eventos aceitos;
- desabilitar Finalizar enquanto houver fila local, erro/conflito aberto ou sincronização em andamento;
- cobrir o cenário em que o servidor possui conflito, a fila local está vazia e a tela ainda não pode habilitar Finalizar.

Não basta mostrar um contador nem apenas repetir a mensagem retornada pelo POST atual.

### 2. A câmera bloqueia leituras consecutivas do mesmo código

`Coleta.tsx` guarda o último `rawValue` em `lastScanRef` e nunca o libera. Depois de uma leitura, o mesmo produto não pode ser bipado novamente durante a sessão. Isso quebra a coleta por repetição do mesmo produto e não preserva o comportamento de múltiplas bipagens.

Corrigir para usar debounce/intervalo curto ou confirmação de envio: o mesmo código deve poder gerar novos eventos após a leitura anterior ser enviada/confirmada, sem disparar dezenas de eventos pelo mesmo quadro do vídeo. O ciclo deve continuar seguro quando `detect()` rejeitar, quando a sessão for pausada e quando a câmera for desligada.

Adicionar teste de componente que produza duas detecções do mesmo código em momentos distintos e comprove dois eventos `camera`, além do teste de permissão negada e detector ausente.

### 3. Listener `online` não é removido corretamente

O efeito registra uma função anônima em `addEventListener` e outra função anônima diferente em `removeEventListener`. Cada montagem deixa um listener residual, provocando vários flushes e reenvios após navegação/remontagem.

Usar uma referência estável para o callback e removê-la exatamente no cleanup. Cobrir montagem, desmontagem e nova montagem; o retorno da rede deve executar um único flush por transição.

### 4. Produto inexistente perde linhas de origem

`particionarGruposArquivo()` usa somente `$grupo['line_nos'][0]` quando o mesmo código inexistente aparece em mais de uma linha. O contrato exige conservar todas as origens, por exemplo linhas 17 e 42, sem linha zero e sem esconder a segunda ocorrência.

Corrigir o modelo de resultado/evento para:

- retornar todas as linhas de origem do grupo inválido;
- tornar cada ocorrência consultável/auditável, ou guardar explicitamente `line_nos[]` no evento/resultados;
- manter o agrupamento set-based para resolução e gravação, sem voltar a uma query por linha ou por grupo.

Adicionar teste com o mesmo código inexistente em pelo menos duas linhas e verificar todas as origens no JSON e na consulta de eventos.

### 5. Falha de escrita do arquivo não é verificada

`AplicarArquivoColetaCommand` chama `file_put_contents($abs, $conteudo)` sem verificar retorno `false`. O contrato exige que falha de armazenamento seja visível e que a transação não deixe metadado/arquivo órfão.

Corrigir para validar a escrita, lançar erro de domínio sanitizado e manter a limpeza em falha de metadados/transação. Cobrir falha simulada de escrita e confirmar ausência de soma de quantidade, metadado parcial ou arquivo órfão.

### 6. Rastreio de geração F6 não é validado no cliente

O dispatch retorna `trace_id`, mas `useErpHeavyGerarRequest`/`Index.tsx` não guardam nem conferem o identificador antes de publicar `data.rows`. O código impede duas gerações simultâneas, porém não há prova de descarte de resposta antiga após cancelamento ou troca de geração.

Implementar um token/`trace_id` por geração no hook e no consumidor, descartar resposta que não seja da geração ativa e publicar o grid somente para a geração atual e não cancelada. O cancelamento no servidor deve continuar ocorrendo antes do abort local. Adicionar teste que entregue resposta antiga depois de uma nova geração e prove que as linhas antigas não são aplicadas.

### 7. Evidência Vitest não é reproduzível no checkout atual

O arquivo `backend/resources/js/test/setup.ts` existe no caminho lógico, mas a execução real resolve o setup por `C:/teclux_cloud/backend/...` e falha ao carregar as três suítes JSX. Corrigir a configuração/raiz/resolução para que o setup seja encontrado pelo checkout efetivamente executado, sem depender de caminho absoluto de outra cópia ou junction não garantida.

Depois executar, no mesmo checkout e com os mesmos caminhos:

- `npx vitest run resources/js/Pages/Cadastros/Estoque/Inventario`;
- PHPUnit do módulo pelo `./scripts/docker-php.sh`;
- Pint pelo `./scripts/docker-php.sh`.

Substituir os logs de evidência por saídas reais da execução atual. Não marcar tarefas como concluídas com base em log de outra raiz, log parcial ou saída copiada.

## Regressões a preservar

- F6 deve continuar exigindo Inventário/Filial autorizados no controller e no job, exibindo `running` e Cancelar antes da primeira espera, sem publicar resultado cancelado/obsoleto.
- Importação deve continuar sendo multipart com sessão, arquivo e nome original; linhas válidas e inválidas devem ser processadas de modo independente.
- Resolução, atualização de itens e eventos da importação devem permanecer set-based, com binds e sem N+1.
- Dispositivo e canal continuam obrigatórios e limitados a `camera`, `manual` e `arquivo`.
- Finalizar continua recusando `fila_local_vazia=false` e eventos persistidos `erro`/`conflito`.
- Mutações continuam conferindo a Filial real, situação aberta, revisão concorrente, motivo de redução e auditoria.
- Filtros continuam whitelistados, persistidos e distinguindo origem da tela/persistida.
- Não usar teste de driver, `hasTable`, `hasColumn`, introspecção de schema em runtime ou SQL vindo do navegador.

## Aceite obrigatório

Adicionar/ajustar testes para:

1. consulta/renderização dos eventos persistidos e bloqueio visual de Finalizar por conflito remoto;
2. duas bipagens do mesmo código, debounce e cleanup do listener `online`;
3. produto inexistente repetido com todas as linhas de origem;
4. falha de escrita do arquivo sem efeitos parciais/orfandade;
5. resposta F6 antiga/cancelada descartada pelo `trace_id`/token;
6. execução real das suítes no checkout atual, com logs verificáveis.

Somente declarar a implementação concluída quando esses cenários passarem e os logs forem regenerados no checkout atual.
