# Definir a orquestração idempotente e a reconciliação com a SEFAZ

Type: grilling
Status: resolved
Blocked by: 03, 04, 05, 06, 07, 12, 14

## Question

Como filas, outbox, locks, idempotência, timeouts, retentativas e consultas impedem duplicidade, reconhecem respostas ambíguas e reconciliam após falhas?

## Answer

### Fonte durável e filas

PostgreSQL é a fonte durável de Comandos Fiscais, Tentativas, estados, leases e outbox. Redis é somente transporte rápido; perda ou duplicação de job não perde nem duplica a operação porque um despachante relê a outbox.

As filas são separadas em:

- `fiscal-nfce-prioritaria`, com workers/capacidade reservados;
- `fiscal-nfe`;
- `fiscal-eventos`;
- `fiscal-reconciliacao`;
- `fiscal-artefatos`;
- `fiscal-espelhamento-delphi`.

NF-e, S3 e varreduras nunca ocupam a capacidade reservada ao caixa.

### Comando Fiscal e idempotência

Transmitir, cancelar, corrigir, inutilizar e iniciar contingência são Comandos Fiscais persistidos. O comando e sua outbox nascem na mesma transação da mudança de estado. A API retorna seu identificador; repetir a mesma Chave de Idempotência retorna o comando existente.

Há no máximo um Comando Fiscal mutável ativo por Emissão, garantido no PostgreSQL. Consultas internas podem coexistir apenas quando não competem com a ação; em ambiguidade, somente Reconciliação Fiscal é admitida.

### Locks e leases

Redis pode reduzir jobs repetidos, mas não decide concorrência. O worker:

1. abre transação curta;
2. bloqueia comando/emissão com `FOR UPDATE`;
3. valida estado e adquire lease com token/expiração;
4. cria a Tentativa e confirma;
5. chama a SEFAZ sem transação aberta;
6. abre nova transação, confere lease/estado e aplica o resultado.

Outro worker que encontra lease ativo sai sem transmitir. Resultado só é aplicado pelo token esperado. Lease expirado recupera processamento, nunca autoriza reenvio: tentativa interrompida durante envio entra primeiro em Reconciliação Fiscal.

### Outbox

`DB::afterCommit` sinaliza imediatamente o Redis. Em paralelo, um despachante recorrente lê outboxes pendentes com `FOR UPDATE SKIP LOCKED`. A outbox é marcada entregue somente depois de o Redis aceitar o job. Publicação duplicada é segura.

Jobs e políticas Laravel não são a fonte de tentativas fiscais. Contagem, motivo e `proxima_tentativa_em` vivem no domínio e sobrevivem a `failed_jobs`, reinício e troca de backend.

### Checkpoints da transmissão

Geração, validação XSD e assinatura rodam no mesmo job para reduzir latência, especialmente na NFC-e. Antes da rede, o worker persiste XML assinado, hash, Versão de Certificado Fiscal, Tentativa e estado `PRONTO_PARA_ENVIO`. Reinício usa os mesmos bytes.

Qualquer resposta recebida é persistida imediatamente com seus bytes brutos. A aplicação conclusiva do resultado usa uma transação única para:

- finalizar Tentativa;
- atualizar os dois eixos de estado;
- registrar Artefatos em staging;
- preencher protocolo e Projeção Legada Fiscal;
- criar outboxes de S3, DANFE e notificação;
- concluir o Comando.

Falha antes do commit deixa a operação ambígua e aciona reconciliação; autorização fiscal nunca é desfeita por falha de S3 ou efeito posterior.

### Classificação de falhas e retentativas

Falha de DNS, TCP ou TLS comprovadamente anterior ao primeiro byte da requisição admite retentativa automática com backoff curto e jitter. Depois de iniciado o envio, timeout, desconexão, resposta truncada ou ilegível produz `AGUARDANDO_RECONCILIACAO`.

Não existe retentativa cega de autorização ou evento. Rejeição explícita segue o `cStat`. Timeouts, limites e políticas são configuráveis por UF, modelo, ambiente e serviço, menores no caminho interativo da NFC-e.

Ao esgotar falhas técnicas seguras, o Comando vai para `FALHA_OPERACIONAL`, permanece visível e recuperável. Uma ação do Usuário retoma a operação existente quando seguro. Ambiguidade não é encerrada por quantidade de tentativas: alerta e continua em cadência reduzida ou aguarda intervenção.

### Reconciliação de autorização

A Reconciliação Fiscal consulta a chave e:

- importa autorização somente após comparar chave, emitente, modelo, série/número e digest/assinatura com o XML arquivado;
- registra rejeição conclusiva;
- repete “não localizada” por uma janela configurável para absorver consistência eventual;
- só libera retransmissão dos mesmos bytes após sucessivas respostas conclusivas de inexistência;
- trata autorização incompatível como incidente crítico e bloqueia ações.

Resposta de duplicidade é pista para consulta e comparação, não sucesso automático.

### Reconciliação de eventos

Cancelamento, CC-e e inutilização recebem identidade determinística, XML, ID e sequência antes do envio. Timeout conserva tudo. Protocolo recuperado só é aceito quando corresponde ao Evento arquivado. Duplicidade exige consulta/evidência compatível.

Enquanto houver ambiguidade, não nasce outro cancelamento/inutilização nem próxima sequência de CC-e. Somente evento autorizado altera a Situação Fiscal e a Projeção Legada.

### Frente de caixa

NFC-e usa fluxo híbrido: a requisição persiste Comando/outbox, despacha imediatamente à fila prioritária e a tela aguarda por janela curta via polling rápido ou canal em tempo real. Se expirar, apresenta “processando/reconciliando” e continua acompanhando o mesmo comando. Repetir clique não retransmite, e o job sobrevive à queda da sessão/navegador.

### Proteção do autorizador e recuperação

Limite de taxa, concorrência, backoff e circuit breaker são isolados por `UF + autorizador + ambiente + serviço`. Circuito aberto pausa novos envios normais, permite sondagens controladas e Reconciliação, e sinaliza rapidamente contingência NFC-e. Falha de uma UF não bloqueia outras.

Sweeper periódico recupera outboxes, leases e Comandos parados. Encerramento de worker é gracioso; se não conseguir concluir, deixa checkpoint para reconciliação. Jobs manuais obedecem os mesmos locks e idempotência.

Workers usam NTP. Desvio de relógio além do limite configurado bloqueia novas assinaturas/transmissões e alerta, mas permite consultas/reconciliações. Cada Tentativa guarda horários de parede e duração monotônica. Logs e métricas usam IDs, estados, `cStat`, latência e hashes, nunca XML completo, certificado ou senha.
