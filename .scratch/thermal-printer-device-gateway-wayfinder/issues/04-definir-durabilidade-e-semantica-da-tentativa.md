# Definir durabilidade, idempotência e semântica da tentativa de impressão

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Como modelar journal local durável, claim, idempotência, reinício na janela crítica, retries, UNKNOWN, copies não fiscais, reimpressão fiscal, cancelamento pré-Spooler e reconciliação com o backend para impedir duplicidade sem perder trabalhos?

## Comments

- Decisão confirmada: journal local em SQLite/WAL, exclusivo do agente, com migrações, writer serializado, transações, unicidade de `attemptId`/`jobId` e `synchronous=FULL` nas transições próximas ao Spooler. Guarda hashes/referências/metadados necessários à recuperação, protegido pela conta do Windows Service.
- Decisão confirmada: estados locais `RECEIVED`, `VALIDATED`, `RENDERED`, `DISPATCHING`, `SENT_TO_DEVICE`, `FAILED`, `UNKNOWN`, `CANCELLED`. `DISPATCHING` é persistido/sincronizado antes do helper e inicia a janela sem retry automático; recuperação desse estado vira `UNKNOWN`. Cada cópia tem subestado próprio.
- Decisão confirmada: claim atômico usa `claimToken` e lease renovável antes do Spooler, vinculado a agente/dispositivo. Expiração antes do efeito permite retomada/replanejamento; depois de `DISPATCHING` nunca redistribui a mesma Tentativa. Outro agente/dispositivo exige nova Tentativa autorizada.
- Decisão confirmada: repetição com mesmos `jobId`, `attemptId` e hashes nunca executa de novo; devolve `IN_PROGRESS` ou resultado persistido. Identidade associada a documento/perfil/binding/bytes divergentes retorna `IDEMPOTENCY_CONFLICT`. Evidência idempotente dura enquanto o journal retiver a Tentativa; Laravel trata replay como reconciliação.
- Decisão confirmada: retries de backend são idempotentes; antes de `DISPATCHING` validação/render podem repetir. Helper só repete quando responde `effectStarted: false`; falha transitória segura usa `RETRY_WAIT`, backoff+jitter, máximo 3 dentro da validade. Timeout/crash/resposta incompleta vira `UNKNOWN`; nunca repete UNKNOWN, aceite ou cópia aceita.
- Decisão confirmada: por cópia registra `NOT_STARTED`, `DISPATCHING`, `ACCEPTED`, `FAILED_SAFE`, `UNKNOWN`. Qualquer UNKNOWN domina; sem ambiguidade, algum aceite agrega `SENT_TO_DEVICE` com contagens; nenhum aceite agrega `FAILED`. Após aceite parcial/falha não continua, e faltantes exigem nova Tentativa explícita.
- Decisão confirmada: cancelamento só é aceito em `RECEIVED`, `VALIDATED`, `RENDERED`, `RETRY_WAIT`; transação que entra em `DISPATCHING` verifica ausência de cancelamento. Depois retorna `TOO_LATE`; não usa `SetJob`. Repetição é idempotente, e `CANCELLED` exige nova Tentativa para imprimir.
- Decisão confirmada: Laravel é autoridade de autorização/criação/cancelamento solicitado; journal é autoridade da evidência local. Outbox durável reenvia eventos com `eventId` e sequência até ACK. Na recuperação, DISPATCHING vira UNKNOWN antes da reconciliação; estados são monotônicos e aceite/UNKNOWN não regredem mesmo contra cancelamento tardio.
- Decisão confirmada: `UNKNOWN` técnico é imutável. Resolução operacional separada e auditada é `ACKNOWLEDGED_NO_REPRINT` ou `REPRINT_REQUESTED`. Nova saída sempre cria Tentativa; NFC-e usa `REPRINT_NFCE_DANFE` referenciando snapshot/Tentativa anterior. Relatórios exibem evidência e decisão separadas.
- Decisão confirmada: journal detalhado/outbox confirmada retém 90 dias; pendentes, UNKNOWN e não reconciliados nunca são podados. Terminais reconciliados viram tombstone com identidades, hashes, resultado, contagens/data e sem conteúdo sensível, mantida por toda a vida do pareamento. Poda só após ACK transacional.
- Decisão confirmada: journal indisponível/corrompido bloqueia impressão e anuncia `JOURNAL_UNAVAILABLE`; nunca reinicia vazio automaticamente. Integridade e backup consistente são obrigatórios; restauração é administrativa com reconciliação, e evidência irrecuperável é potencialmente UNKNOWN. Catálogo/diagnóstico podem continuar.
- Decisão confirmada: offline executa somente Job já autorizado, claimed, integralmente persistido/validado e ainda válido, sem cancelamento local; resultado vai à outbox. Não recebe/cria Job offline nem executa persistência incompleta. NFC-e segue igual por usar snapshot fiscal previamente autorizado.
- Decisão confirmada: expiração usa referência do horário do servidor, offset/incerteza e relógio monotônico; persiste última referência. Reinício offline sem tempo confiável, regressão/salto relevante geram `CLOCK_UNTRUSTED` e bloqueiam. Job expirado falha antes de DISPATCHING, sem tolerância que estenda validade fiscal.
- Decisão confirmada: reimpressão fiscal nunca é automática. FAILED comprovadamente pré-Spooler permite nova Tentativa original; UNKNOWN/SENT_TO_DEVICE somente `REPRINT_NFCE_DANFE`, com Permissão, motivo/confirmação, snapshot/documento original, nova identidade e alerta de possível duplicidade quando UNKNOWN.
- Decisão confirmada: Job AVAILABLE pode ser recebido/persistido; Job remoto CLAIMED/RUNNING pelo agente sem evidência local nunca executa, torna-se `UNKNOWN_LOCAL_EVIDENCE` e requer reconciliação. Reinstalação não reutiliza identidade sem journal; nenhum agente assume a mesma Tentativa, e novo efeito exige nova Tentativa.
- Decisão confirmada: uma Tentativa em `DISPATCHING` por Dispositivo Local e até 10 Jobs persistidos aguardando por dispositivo. Claim somente com journal/helper/binding/relógio saudáveis; ao atingir limite, mantém AVAILABLE no Laravel. Heartbeat anuncia capacidade/profundidade; fiscal prioriza testes sem interromper DISPATCHING.
- O Usuário autorizou seguir com todas as recomendações apresentadas nesta fronteira, sem ampliação do escopo do ticket.

## Answer

O agente mantém journal exclusivo em SQLite/WAL, com migrações, writer serial, unicidade de `jobId`/`attemptId`, transações e `synchronous=FULL` nas transições críticas. Journal indisponível ou corrompido bloqueia impressão; catálogo/diagnóstico podem continuar. O banco nunca é recriado vazio automaticamente, possui verificação/backup consistente e exige restauração administrativa seguida de reconciliação.

Estados locais são `RECEIVED`, `VALIDATED`, `RENDERED`, `RETRY_WAIT`, `DISPATCHING`, `SENT_TO_DEVICE`, `FAILED`, `UNKNOWN`, `CANCELLED`. `DISPATCHING` é persistido e sincronizado antes do helper e marca o ponto sem retorno automático. Reinício encontrado nessa janela converte para `UNKNOWN`. Cada cópia tem subestado `NOT_STARTED`, `DISPATCHING`, `ACCEPTED`, `FAILED_SAFE` ou `UNKNOWN`.

Claim é atômico, vinculado a agente/dispositivo e protegido por `claimToken`/lease. Lease pode permitir retomada ou replanejamento antes do efeito, mas nunca redistribui a mesma Tentativa após `DISPATCHING`; outro agente/dispositivo exige nova Tentativa. O agente mantém uma Tentativa em dispatch por dispositivo e até 10 Jobs aguardando; só reclama com journal, helper, binding e relógio saudáveis, anunciando capacidade/profundidade no heartbeat.

Idempotência combina identidades e hashes de documento, perfil, binding e bytes. Replay idêntico reapresenta `IN_PROGRESS` ou o resultado persistido; qualquer divergência fecha com `IDEMPOTENCY_CONFLICT`. Retry de backend é idempotente; validação/renderização podem repetir antes do efeito. Helper só repete quando há prova `effectStarted: false`, com `RETRY_WAIT`, backoff/jitter e máximo de três dentro da validade. Timeout, crash ou resposta incompleta após o ponto crítico terminam `UNKNOWN`, nunca retry automático.

Para múltiplas cópias, qualquer ambiguidade domina o resultado agregado; sem ambiguidade, algum aceite gera `SENT_TO_DEVICE` com `copiesRequested`/`copiesAccepted`; nenhum aceite gera `FAILED`. Aceite parcial interrompe as restantes e nova saída exige nova Tentativa. Cancelamento é idempotente e permitido somente antes de `DISPATCHING`, verificado na mesma transação; depois retorna `TOO_LATE` e não remove job do Spooler.

Laravel governa autorização, criação e cancelamento solicitado; journal governa evidência local. Outbox durável usa `eventId` e sequência por Tentativa, reenviando até ACK. Na recuperação, estados são monotônicos: aceite/UNKNOWN nunca regredem. Job remoto em andamento sem evidência local vira `UNKNOWN_LOCAL_EVIDENCE` e nunca executa. Jobs já authorized/claimed/persistidos podem concluir offline se íntegros, válidos e sem cancelamento; nenhum Job novo nasce offline.

Validade usa horário do servidor e relógio monotônico; salto, regressão ou reinício offline sem referência confiável produz `CLOCK_UNTRUSTED`. `UNKNOWN` é evidência técnica imutável, com resolução operacional separada `ACKNOWLEDGED_NO_REPRINT` ou `REPRINT_REQUESTED`. Falha comprovadamente pré-Spooler permite nova Tentativa original; `UNKNOWN`/`SENT_TO_DEVICE` fiscal exigem `REPRINT_NFCE_DANFE`, Permissão, motivo, confirmação, snapshot original e nova identidade.

Detalhes reconciliados/outbox confirmada ficam 90 dias; pendentes, UNKNOWN e não reconciliados nunca são podados. Depois, terminais viram tombstones compactas sem conteúdo pessoal/fiscal, mantidas durante todo o pareamento para impedir reexecução. Auditoria histórica de longo prazo permanece no Laravel.
