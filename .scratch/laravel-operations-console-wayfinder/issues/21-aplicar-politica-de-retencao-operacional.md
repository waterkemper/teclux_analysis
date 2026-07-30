# 21 — Aplicar a Política de Retenção Operacional

**What to build:** aplicar automaticamente prazos distintos a payloads técnicos, Execuções, métricas, Programações, Alertas e auditoria, permitindo Exclusão Imediata Operacional e Preservação Operacional seguras. O Administrador vê o resultado da purga e nenhuma operação apaga evidência protegida ou deixa lojas divergentes silenciosamente.

**Blocked by:** 14 — Controlar pausa e retomada com auditoria e reconciliação; 15 — Gerenciar Execuções Operacionais de relatórios pesados; 17 — Registrar todas as Tarefas Operacionais; 19 — Calcular Saúde Operacional e apresentar Pendências Acionáveis.

**Status:** done

- [ ] Retenção começa somente em estado terminal; registro ativo, pendente, em execução, suspenso ou reconciliando não expira.
- [ ] Payload técnico de falha e metadata Horizon falha expiram em sete dias, sem remover o histórico sanitizado correspondente.
- [ ] Sucessos expiram em 30 dias; falhas, cancelamentos, suspensões definitivas, exclusões, skips e ocorrências perdidas, em 90 dias.
- [ ] Alertas e versões substituídas de programação expiram em 13 meses; auditoria mínima append-only permanece cinco anos.
- [ ] Rollups de cinco minutos/30 dias, horários/90 dias e diários/13 meses são produzidos antes da exclusão e não carregam identificadores ou dados de negócio.
- [ ] Exclusão Imediata Operacional aceita somente dados terminais elegíveis, remove material técnico/detalhado e preserva tombstone e auditoria.
- [ ] Preservação Operacional registra autoridade, motivo, escopo, início, revisão/expiração e liberação; purge-now é recusado enquanto ativa.
- [ ] Liberação de preservação concede sete dias de graça a registros já vencidos antes do expurgo automático.
- [ ] Purga automática e imediata usam serviço idempotente, registram contagens/falhas/política e reconciliam remoção parcial entre lojas.
- [ ] Exports são criptografados, auditados e destruídos em até 24 horas; restauração de backup reaplica ledger de purga antes de disponibilizar dados.
- [ ] Testes de fronteira temporal cobrem relógio, lote, retry, preservação, liberação, restore e ausência de payload na Console.
