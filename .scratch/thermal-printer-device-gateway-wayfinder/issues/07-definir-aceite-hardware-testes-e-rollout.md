# Definir aceite físico, testes, suporte e rollout

Type: grilling
Status: resolved
Blocked by: 03, 04, 05, 06

## Question

Qual matriz mínima de testes de contrato/agente/Laravel e hardware real comprova Epson TM 58/80 mm, acentos, QR/barcode, corte, spool offline, reinício, duplicidade, NFC-e e segurança; e como fazer piloto, diagnóstico, suporte e rollout reversível por estação?

## Comments

- Decisão confirmada: laboratório físico mínimo bloqueante usa Epson TM-T20X USB/80 mm, TM-T20X Ethernet como fila Windows/58 mm e uma compatível ESC/POS 80 mm de outro fabricante. Windows 11 x64 é normativo; Windows 10 LTSC/ESU só se existir na operação. Driver/firmware/porta/perfil/capabilities e evidências formam ficha por combinação; TM-T88VII é adicional.
- Decisão confirmada: pacote físico por combinação inclui TEST_PRINTER BASIC/FULL, QR lido por dois celulares, barcodes lidos pelo scanner operacional, recibo curto/longo/três cópias e DANFE golden detalhado 58/80. Verifica acentos/layout/corte/papel, guarda foto/scan+hashes e repete cada caso cinco vezes sem divergência.
- Decisão confirmada: injeção obrigatória cobre quedas em RENDERED/DISPATCHING/StartDoc/Write/EndDoc/resultado, rede antes/depois do claim, Spooler/fila/impressora/papel, corrida de cancelamento, replay/conflito, journal ausente/corrompido, relógio e falha na segunda de três cópias. Possível aceite nunca gera retry automático; estados/contagens devem coincidir com journal.
- Decisão confirmada: gates CI cobrem schemas/compatibilidade/lock, golden/property renderer, Rust protocolo/Win32/falhas, Node journal/idempotência/outbox, Laravel HMAC/rota/auth/snapshots/outbox, vetores cruzados, Windows MSI/Service SID/ACL/DPAPI/upgrade e segurança (deps/secrets/tamper/fuzz/logs), sempre em ambiente descartável sem base legada real.
- Decisão confirmada: desempenho bloqueante: agente aquecido SENT_TO_DEVICE p95 <= 250 ms/p99 <= 500 ms, início perceptível <= 500 ms; 100 comprovantes físicos consecutivos por modelo; soak 24 h/10.000 Tentativas controladas, memória estável, zero duplicidade/evidência sem journal, outbox reconciliada e SQLite íntegro, segmentado por USB/Ethernet/58/80.
- O Usuário autorizou todas as recomendações seguintes desta fronteira, sem confirmações intermediárias; haverá confirmação final do entendimento completo.
- Recomendação aceita por autorização: rollout por feature flags e Estação, sem ativação global: laboratório; estação interna só TEST_PRINTER; recibo não fiscal em uma estação piloto; piloto operacional de baixo volume; expansão 10%/25%/50%/100%. Cada estágio observa no mínimo 2 dias úteis no teste interno e 5 dias úteis no piloto operacional, com checklist/go-no-go antes de avançar.
- Recomendação aceita por autorização: NFC-e possui trilha separada e só entra após provider fiscal, DANFE v6.0 golden/QR, homologação fiscal e hardware, treinamento de reimpressão e piloto em uma única Estação/Filial. Nunca é habilitada porque recibo genérico passou; expansão exige aprovação Fiscal, Operação e Engenharia.
- Recomendação aceita por autorização: rollback funcional desliga flags apenas para novas Tentativas por Estação/Purpose e retorna ao fluxo anterior/manual antes de criar novo Job. Tentativas existentes continuam reconciliadas; nunca troca de backend após DISPATCHING. Agente pode permanecer instalado para diagnóstico; rollback MSI só pelo processo assinado/compatível já definido.
- Recomendação aceita por autorização: parada imediata do rollout diante de duplicidade, conteúdo/rota fiscal incorreto, vazamento de segredo/dado, perda/corrupção do journal, reenvio de UNKNOWN ou falsa mensagem de impressão física. Pausa também se FAILED+UNKNOWN > 1%, p95 > 250 ms por janela sustentada, outbox não reconciliar ou agente/binding ficar instável; retomada exige causa, correção, regressão e nova aprovação.
- Recomendação aceita por autorização: dashboard por versão/Filial/Estação/modelo mostra online/offline, binding, filas, latência p50/p95/p99, backlog, resultados/códigos, UNKNOWN, cópias e versão de contrato/perfil/template, sem conteúdo fiscal. Alertas são acionáveis e apontam runbook; métricas não substituem Auditoria.
- Recomendação aceita por autorização: suporte L1 verifica saúde, papel/fila/serviço/binding e coleta bundle; L2 analisa contrato/journal/outbox/perfil e reproduz fixture; L3 trata renderer/Rust/Laravel/fiscal. Nenhum nível envia comando RAW, edita SQLite, apaga fila/job, muda estado ou pede segredo. Ações sensíveis usam ferramenta administrativa, Permissão e Auditoria.
- Recomendação aceita por autorização: runbooks cobrem agente offline, fila stale, acesso negado, sem papel/pausada, unsupported character/layout/capability, helper crash, CLOCK_UNTRUSTED, JOURNAL_UNAVAILABLE, UNKNOWN, parcial de cópias, falha de HMAC, upgrade/rollback e reimpressão fiscal. Bundle diagnóstico recebe identificador e prazo de retenção, com verificação de redaction antes do compartilhamento.
- Recomendação aceita por autorização: homologação é por combinação de modelo+firmware+driver/versão+porta+largura+perfil/hash+renderer/helper+SO. Mudança relevante revoga/expira certificação e bloqueia NFC-e até regressão; atualização apenas de Laravel que não altera snapshot também roda contrato/integracão, mas não exige papel se hashes golden permanecerem idênticos.
- Recomendação aceita por autorização: evidências de release incluem SBOM, assinaturas/hashes, versões pinadas, resultados CI/soak/físicos, fichas/fotos/scans, QR/barcodes lidos, checklist de segurança/fiscal e aprovação nominal. Artefato sem pacote completo não é promovido.
- Recomendação aceita por autorização: treinamento explica “aceito pela fila” versus impresso, UNKNOWN, cancelamento pré-envio, cópia parcial, troca de papel, seleção de Estação e reimpressão fiscal. Piloto registra feedback e chamados; sucesso exige zero duplicidade/fiscal/security critical e suporte capaz de operar os runbooks.

## Answer

O release exige laboratório com TM-T20X USB/80 mm, TM-T20X Ethernet/58 mm e uma compatível ESC/POS 80 mm de outro fabricante, em Windows 11 x64; Windows 10 LTSC/ESU só quando ainda operacional. Cada combinação registra hardware, firmware, driver, porta, perfil/capabilities e evidências. TM-T88VII é certificação adicional.

Por combinação, executar TEST_PRINTER BASIC/FULL, acentos/layout/corte, QR em dois celulares, barcodes no scanner operacional, recibos curto/longo/três cópias e DANFE detalhado golden 58/80. Comparar visualmente, guardar foto/scan e hashes e repetir cinco vezes. Além disso, imprimir 100 comprovantes consecutivos por modelo sem perda, reordenação ou divergência.

Injetar falhas em RENDERED/DISPATCHING/StartDoc/Write/EndDoc/resultado, serviço/helper/rede/Spooler/fila/impressora/papel, cancelamento concorrente, replay/conflito, journal ausente/corrompido, relógio e segunda de três cópias. Qualquer possível aceite deve produzir UNKNOWN/contagem honesta, nunca retry automático.

CI bloqueante cobre contrato/lock/retrocompatibilidade, renderer golden/property, Rust/Win32/protocolo, Node/journal/outbox, Laravel/HMAC/rota/auth/snapshots, vetores cruzados, MSI/Service SID/ACL/DPAPI/upgrade e segurança/SBOM/tamper/fuzz/redaction em ambientes descartáveis. Soak: 24 h e 10.000 Tentativas, memória estável, zero duplicidade/evidência sem journal, outbox reconciliada e SQLite íntegro. Metas: SENT_TO_DEVICE p95 <= 250 ms/p99 <= 500 ms e início perceptível <= 500 ms.

Rollout é reversível por feature flag e Estação: laboratório, TEST interno, recibo em uma estação, piloto baixo volume e 10%/25%/50%/100%, com 2 dias úteis internos e 5 dias úteis no piloto. NFC-e segue trilha própria após provider fiscal, template v6.0, hardware/fiscal homologados, treinamento e aprovação Fiscal/Operação/Engenharia. Rollback afeta apenas novas Tentativas; nunca troca backend após DISPATCHING.

Parar imediatamente por duplicidade, rota/conteúdo fiscal errado, vazamento, corrupção do journal, retry de UNKNOWN ou falsa confirmação física; pausar também por FAILED+UNKNOWN > 1%, p95 sustentado acima da meta, outbox/agent/binding instáveis. Retomada exige causa, correção, regressão e aprovação.

Dashboard segmentado mostra saúde/versões/bindings/latências/backlog/resultados sem conteúdo fiscal. Suporte L1 coleta/verifica; L2 analisa contrato/journal/outbox/perfil; L3 trata renderer/Rust/Laravel/fiscal. Runbooks cobrem códigos e cenários definidos; ninguém envia RAW, edita SQLite, apaga job ou pede segredo.

Homologação pertence à combinação modelo+firmware+driver+porta+largura+perfil/hash+renderer/helper+SO; mudança relevante exige regressão e bloqueia NFC-e. Promoção exige SBOM, assinaturas/hashes, CI/soak/físicos, fichas/evidências, checklist fiscal/segurança, aprovações e treinamento que diferencie fila, impressão física, UNKNOWN, parcial e reimpressão.
