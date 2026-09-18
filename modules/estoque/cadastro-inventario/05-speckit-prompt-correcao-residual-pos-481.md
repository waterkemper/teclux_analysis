# Prompt corretivo residual — Cadastro de Inventário pós-481

## Contexto

Revise e corrija in-place a implementação do Cadastro de Inventário no commit 3179d6c81, usando como referência:

- specs/481-fix-inventario-residuals/spec.md, tasks.md e contracts/;
- specs/480-fix-inventario-closeout/;
- os prompts em modules/estoque/cadastro-inventario/.

Não crie implementação paralela. Não peça para verificar fontes Delphi diretamente. Preserve o comportamento funcional já estabelecido e não reintroduza requisitos removidos deste módulo.

## Evidência da revisão

As evidências da spec 481 foram geradas em WSL, em /home/tecsoft/projects/teclux_cloud/backend. No checkout Windows atual, a execução de npx vitest run resources/js/Pages/Cadastros/Estoque/Inventario resources/js/hooks/useErpHeavyGerarRequest.test.ts falha em quatro suítes com Cannot find module 'C:/teclux_cloud/backend/resources/js/test/setup.ts'; somente o teste do resolver passa. A evidência 481 não pode ser considerada reproduzível até que o comando passe no checkout efetivamente utilizado.

## Pendências confirmadas

### 1. A coleta não restaura ou reabre uma sessão

Coleta.tsx só conhece sessaoId depois que o botão Iniciar sessão cria uma nova sessão. Ao montar a página, carregarEventos retorna imediatamente porque sessaoId é nulo. A fila offline pode ser descarregada no mount, mas os eventos da sessão antiga não são consultados nem exibidos. Também não há contrato de sessao_id inicial, restauração segura ou ação explícita de reabrir sessão.

Corrigir para permitir reentrada em uma sessão existente, sem criar outra sessão nem aceitar Inventário/Filial arbitrários:

- definir contrato explícito para restaurar sessao_id por prop, rota ou identificador informado pelo operador;
- validar a sessão no servidor e conferir Inventário, Filial, usuário e estado;
- ao restaurar a sessão, carregar os eventos persistidos antes de habilitar operações;
- associar a fila local à sessão e não descartar eventos de outro Inventário ou Filial;
- manter eventos de outros dispositivos visíveis;
- impedir bipagem, importação e Finalizar enquanto a sessão restaurada não estiver sincronizada;
- cobrir montagem ou reentrada em outro dispositivo com conflito remoto e fila local vazia.

Não tratar somente o valor guardado no navegador como autoridade de Inventário ou Filial.

### 2. Cancelamento F6 antes do enqueue pode deixar job ativo

Em useErpHeavyGerarRequest, cancelGerar consulta activeJobRef e envia o POST de cancelamento antes do abort local. Porém, enquanto o POST inicial de enqueue ainda aguarda, activeJobRef.current é nulo. Se o usuário cancelar nesse intervalo, o request local é abortado, mas, quando o enqueue retorna, o job pode já existir no servidor e nenhum POST de cancelamento é enviado para sua cancel_url.

Corrigir o ciclo para:

- guardar a geração como cancelada mesmo antes da resposta 202;
- quando o enqueue tardio retornar para geração cancelada, enviar imediatamente o cancelamento server-side usando a cancel_url retornada;
- só depois encerrar a geração e impedir qualquer publicação;
- manter idempotência do cancelamento e não enviar cancelamentos duplicados;
- testar a corrida cancelar antes do enqueue retornar, verificando a ordem cancelamento no servidor, depois abort local, e ausência de execução ou publicação do job.

### 3. Testes F6 não provam o comportamento da tela

O teste de inventarioF6 verifica apenas f6ResultIsCurrent(1, 2). O teste do hook verifica rejeição da Promise, mas não monta Index.tsx nem demonstra que setItens não recebe linhas antigas. Isso não comprova os cenários de resposta obsoleta, cancelamento e grid vigente definidos na spec.

Adicionar teste de integração/componente que:

- inicie uma geração, cancele ou torne-a obsoleta, inicie outra e entregue respostas fora de ordem;
- observe o grid renderizado e comprove que somente linhas da geração vigente aparecem;
- cubra resposta inline e resposta por result_url;
- cubra cancelamento antes e depois do 202;
- não aceite teste que valide apenas uma função booleana isolada.

### 4. Falha de Finalizar não é apresentada ao operador

O botão Finalizar é desabilitado pelos estados locais, mas o POST não possui tratamento catch. Em uma condição de corrida, por exemplo conflito persistido depois da última consulta, o servidor pode recusar a finalização e a tela não informa o motivo.

Corrigir para tratar a resposta de erro com mensagem e código de domínio, recarregar os eventos da sessão e manter Finalizar desabilitado. Adicionar teste para conflito remoto criado entre a consulta e o POST de Finalizar.

## Aceite e evidência obrigatórios

Adicionar ou ajustar testes para:

1. restauração ou reabertura de sessão e consulta de eventos de múltiplos dispositivos;
2. fila offline vinculada à sessão correta durante montagem e reentrada;
3. cancelamento F6 antes do retorno do enqueue, com POST server-side e ordem correta;
4. grid sem linhas de resposta obsoleta em Index.tsx;
5. erro de Finalizar visível e eventos recarregados;
6. execução das suítes no checkout Windows atual, sem resolver setup.ts por outra cópia do projeto.

Regenerar os logs somente a partir do checkout efetivamente executado. Não marcar tarefas como concluídas com evidência de WSL, outra raiz, saída parcial ou log copiado.

## Regressões a preservar

- F6 continua com Filial autorizada, estado running, Cancelar antes da espera e nenhuma publicação cancelada ou obsoleta.
- Coleta continua com câmera real, debounce, múltiplas bipagens do mesmo código, fila idempotente e canais controlados.
- Eventos continuam visíveis com origens de linha completas e Finalizar bloqueado por eventos abertos.
- Arquivo continua multipart, set-based, com falha de armazenamento verificada e limpeza de órfãos.
- Mutações continuam com Filial real, situação aberta, revisão, motivo de redução e auditoria.
- Não usar teste de driver, hasTable, hasColumn, introspecção de schema em runtime ou SQL vindo do navegador.
