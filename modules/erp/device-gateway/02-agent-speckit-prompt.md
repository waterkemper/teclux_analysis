# Prompt para /speckit.specify — agente Windows de impressão térmica

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para evoluir o teclux_cloud_agent em um Windows Device Gateway capaz de imprimir cupons e DANFE NFC-e em impressoras térmicas por Windows Print Spooler RAW e ESC/POS. Não implemente nesta etapa.

Este é o segundo trabalho coordenado. Antes de especificar arquivos finais, confirme que teclux_cloud_contracts v1.1.0 está mesclado e publicado. O agente deve fixá-lo em device-gateway-contract.lock.json com versão, commit e SHA-256; se a tag não existir ou os hashes divergirem, declare o trabalho bloqueado. Não copie conhecimento de branch anterior nem redefina schemas localmente.

## Investigação obrigatória

Inspecione registry, validação, autenticação, SSE/polling, fila, deduplicação, adapters, build, testes, empacotamento e contratos embutidos. Confirme que hoje somente TEST_PRINTER/Mock é executável, a deduplicação é volátil, Bearer diverge do HMAC Laravel e o uso de caminhos de contrato é frágil. Registre CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE. Execute build/test existentes com ambiente seguro e não contorne proteções.

## Fronteiras profundas

Exponha no Node LocalPrinterCatalog.scan() e ThermalPrintPort.submit(attempt). Mantenha Mock e crie Windows adapters. Internamente, PrintBackend isola o mecanismo nativo, permitindo substituir Rust por .NET sem alterar o protocolo do Device Gateway.

Implemente o backend inicial como helper Rust separado e persistente, supervisionado pelo Node por dispositivo ativo. Comunicação exclusiva por JSON Lines versionado em stdin/stdout, com requestId, HELLO, HEALTH, SUBMIT_RAW, QUERY_JOB e SCAN_PRINTERS. Bytes são base64 com tamanho e SHA-256. stdout contém apenas respostas; stderr somente logs saneados. Proíba arquivos, shell, executáveis, caminhos e comandos arbitrários. Crash/timeout do helper não encerra o agente: afeta apenas o dispositivo e torna a tentativa corrente UNKNOWN. Use fila serial por deviceId, paralelismo entre dispositivos, expiração ociosa e limite de processos.

## Descoberta, binding e perfis

Descubra somente filas/conexões instaladas e visíveis à identidade do serviço, sem varredura de rede ou alteração de configuração. Inventário básico deve ser rápido; detalhes, sob demanda e timeout. Binding usa fingerprint normalizado de servidor/nome, driver, processor, datatype e porta. Mudança estrutural torna-o STALE e exige reconfirmação administrativa; offline/papel não. Nunca use fila parecida ou padrão como fallback.

Adote ESC_POS_GENERIC@1, versionado e hashado por Tentativa. Overrides fechados: largura, colunas, code page, corte, QR, barcode e feed; jamais bytes/hex/scripts. Capabilities efetivas têm origem e bindingRevision. Filas RAW com driver oficial são preferidas; Generic/Text Only somente homologado; GDI/XPS/EMF são incompatíveis.

EscPosRenderer.render(document,effectiveProfile) é puro e determinístico e retorna RenderPlan, bytes/hash, code page, tamanho, capacidades usadas e estimativa de papel. PrintBackend recebe somente bytes finais. Uma code page por documento: CP860, depois CP850; preflight falha sem transliteração. Corte exige capability e mapeia intenção para PARTIAL/FULL; sem fallback silencioso. QR/barcode usam variantes fechadas e homologadas. O agente não acrescenta conteúdo ao documento TEST.

## Spooler, cópias e desempenho

Use Winspool DOC_INFO_1 com pDatatype RAW. O ciclo captura spoolJobId em StartDocPrinter, escreve e encerra com WritePrinter/EndDocPrinter. SENT_TO_DEVICE somente após EndDocPrinter; não aguarde o job desaparecer. GetJob é diagnóstico best-effort, sem alegar impressão física.

Para copies, uma solicitação ao helper cria um job RAW por cópia, sem driver copies. Pare após falha; agregue: qualquer cópia ambígua => UNKNOWN; alguma aceita e nenhuma ambígua => SENT_TO_DEVICE com contagem; zero aceita => FAILED. NFC-e sempre uma cópia. Nome seguro: `tecLUX <operationType> <shortAttemptId> <copyIndex>`, sem PII ou dado fiscal.

Metas com helper aquecido: aceite pelo Spooler p95 <=250 ms, p99 <=500 ms e início perceptível <=500 ms, medidos separadamente de rede e tempo mecânico.

## Durabilidade e idempotência

Use journal SQLite WAL protegido, migrations, writer serializado, unicidade Job/Tentativa e synchronous=FULL no caminho crítico. Estados: RECEIVED, VALIDATED, RENDERED, RETRY_WAIT, DISPATCHING, SENT_TO_DEVICE, FAILED, UNKNOWN e CANCELLED; estado por cópia: NOT_STARTED, DISPATCHING, ACCEPTED, FAILED_SAFE e UNKNOWN.

Persistir e fsync DISPATCHING antes de chamar o helper é o ponto sem retorno. Reinício, crash, timeout ou evidência incompleta depois dele produz UNKNOWN imutável e nunca retry automático. Retry máximo 3, backoff+jitter, somente com effectStarted:false e dentro da validade. Cancelamento é atômico apenas antes de DISPATCHING. Tentativa repetida com mesmo hash retorna progresso/resultado; hash diferente gera IDEMPOTENCY_CONFLICT.

Laravel mantém autoridade de autorização/claim/cancel request; journal é autoridade do efeito local. Outbox durável usa eventId e sequence até ACK e reconciliação monotônica. Offline executa apenas trabalho já autorizado, claimed, completo, válido e persistido. Relógio não confiável falha fechado. Journal indisponível/corrupto bloqueia impressão, não é recriado vazio. Um DISPATCHING e até dez aguardando por dispositivo.

## Serviço e segurança Windows

Especifique MSI offline x64 assinado com runtime Node, agente, helper e contrato pinado. Windows 11 x64 é alvo; Windows 10 somente LTSC/ESU suportado pela organização. Serviço usa conta virtual NT SERVICE\TecLuxDeviceAgent, service SID e mínimo privilégio, nunca LocalSystem.

Program Files é imutável; ProgramData separa configuração, journal, logs, backup e diagnóstico com ACL. Pareamento ocorre em ferramenta administrativa que solicita URL HTTPS, usuário, senha e estação/código; senha é efêmera, nunca armazenada/logada, e chega ao serviço por named pipe ACL. O segredo HMAC usa DPAPI no escopo da conta virtual com entropia da instalação; perda exige revogação e novo pareamento. Não exponha porta TCP local.

SCM: delayed auto start, dependência do Spooler, recovery 5s/30s/2m, shutdown gracioso de 30s. Logs JSON por allowlist até 200 MiB/30 dias, sem payload, bytes, credenciais ou conteúdo fiscal. Diagnóstico valida ACL, DPAPI, SQLite, disco, contrato/hash, helper, filas, HTTPS, tempo e HMAC sem imprimir. Upgrade MSI é manual, com backup, migrations forward e bloqueio de downgrade; uninstall preserva estado em quarentena por padrão.

## Aceite, homologação e rollout

CI inclui contratos/vetores, renderer goldens, Rust, Node, HMAC, journal/fault injection, MSI e segurança em Windows descartável. Teste físico mínimo: Epson TM-T20X USB, TM-T20X Ethernet e uma compatível de outra marca; 58/80 mm, BASIC/FULL, QR em dois celulares, barcode com scanner, recibos curtos/longos/3 cópias e DANFE detalhado. Hardware não homologado executa apenas TEST; NFC-e exige combinação homologada de modelo, firmware, driver, porta, largura, perfil, renderer, helper e OS.

Exija 100 impressões consecutivas, soak de 24h/10.000 trabalhos, fault injection em todas as fases e metas p95/p99. Rollout por estação: laboratório, TEST interno, piloto recibo, baixo volume, 10/25/50/100%, com flags separadas. Pare por duplicidade, retry após UNKNOWN, corrupção do journal, falha de segurança ou roteamento fiscal; pause se FAILED+UNKNOWN >1% ou latência/filas degradarem.

## Fora de escopo

Autorização fiscal; PDF/A4/GDI; imagem/logo; gaveta; USB/serial direto; leitura de diretórios; TEF; auto-update; impressão bidirecional/garantia física; exclusão administrativa de job do Spooler; Linux/macOS; comandos RAW recebidos do servidor.

## Formato esperado

Produza Problem Statement, Solution, User Stories, arquitetura/processos/protocolo JSONL, estados e recuperação, contratos das interfaces, segurança, instalação, operação, métricas, critérios verificáveis, matriz de testes físicos e automatizados, rollout/rollback/runbooks e Out of Scope. Separe dúvidas de requisitos normativos.
```
