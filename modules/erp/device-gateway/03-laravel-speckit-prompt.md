# Prompt para /speckit.specify — integração Laravel do Device Gateway

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para integrar o tecLUX Cloud Laravel ao Device Gateway 1.1.0, com roteamento seguro de impressoras locais, recibos térmicos e DANFE NFC-e detalhado. Não implemente nesta etapa.

Este é o terceiro trabalho coordenado. Antes de especificar a implementação, confirme a tag imutável teclux_cloud_contracts v1.1.0, valide device-gateway-contract.lock.json por versão/commit/SHA-256 e confirme que o agente alvo anuncia suporte às operações/capabilities necessárias. Não dependa de branch não mesclada. A existência do contrato não habilita NFC-e: esta exige também fonte fiscal autorizada, agente, binding, perfil e hardware homologados.

## Investigação obrigatória

Inspecione DeviceGateway existente: pareamento/HMAC/replay, heartbeat, SSE/polling, jobs, snapshots, estados, Auditoria, painel, teste e crédito de troca. Localize o fluxo fiscal real de NFC-e modelo 65. Registre CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE. Já foi observado que os IDs legados não são UUID, o agente atual usa Bearer, crédito de troca cria operação não suportada e os testes selecionados podem ser bloqueados pela proteção de migrate:fresh; nunca desative essa proteção contra uma base configurada.

## Módulos e autoridades

Projete interfaces profundas: AgentInventoryIngestor, LocalDeviceRouter, LogicalPrintSnapshotFactory, PrintAttemptCoordinator e PrintStatusProjector. Separe ObservedPrintQueue efêmera de LocalDeviceBinding durável. O agente é autoridade sobre inventário/capabilities/efeito local; Laravel é autoridade sobre usuário, filial, estação, autorização, conteúdo de negócio, snapshots, claims e cancelamento solicitado.

Ingestão de inventário exige HMAC 1.1, schema, rate limit e escopo. Converta IDs legados para UUID persistentes e estáveis sem expô-los como identidade canônica. Auditoria de binding e alterações é append-only. A UI administrativa mostra detalhes de fila/driver; operador comum não.

## Roteamento e snapshot

Roteie exatamente por Filial + Estação + Purpose: TEST, THERMAL_RECEIPT ou NFCE_DANFE. O navegador não envia agentId/deviceId; o servidor resolve a sessão. Sem binding/capability exatos, falhe: nunca use outra estação, fila padrão ou dispositivo parecido. Override administrativo exige permissão própria, prova sensível recente, motivo e Auditoria.

Sequência obrigatória: autorizar e ler dados consistentes; resolver rota/capabilities; construir e validar documento; canonicalizar/hash; persistir Snapshot imutável; criar Tentativa/Job e outbox transacional. Idempotency-Key é obrigatório e escopado por usuário, operação, documento de negócio, filial e estação; repetição idêntica retorna a mesma resposta e conflito de conteúdo retorna 409.

Jobs/eventos usam outbox transacional; SSE é otimização e polling é fallback. Não exponha conteúdo fiscal em polling, SSE, logs ou métricas. Claims, cancelamento, estados monotônicos, UNKNOWN imutável, copies e reimpressão seguem o contrato 1.1; nunca converta UNKNOWN em FAILED nem reenvie a mesma Tentativa.

## Recibos e teste

Migre impressões térmicas, inclusive crédito de troca, para builders fechados de ThermalPrintDocumentV1 e PRINT_THERMAL_RECEIPT com metadata de origem; não crie operação específica no agente. TEST_PRINTER usa fixtures BASIC/FULL construídas no Laravel; o agente não acrescenta texto. Recibos aceitam 1..3 cópias e exibem contagem aceita; uma falha parcial requer nova Tentativa explícita para cópias faltantes.

## DANFE NFC-e

Crie AuthorizedNfcePrintSource como porta obrigatória para fornecer somente NFC-e modelo 65 já autorizada e imutável. Se nenhum provider real for localizado, mantenha NFCE_DANFE desabilitado e especifique a integração pendente; o gateway não autoriza, assina, transmite, calcula tributos nem decide regra fiscal.

NfceDanfeDocumentBuilder apresenta dados fornecidos: ID, ambiente, status/protocolo, chave/QR, emitente, consumidor, itens, totais, pagamentos e mensagens. Fixe Manual de Especificações Técnicas do DANFE NFC-e e QR Code v6.0, março/2025, mais template version/hash. Primeira versão cobre somente DANFE detalhado; resumo, consentimento e contingência ficam desabilitados até contrato próprio.

Original é PRINT_NFCE_DANFE, após autorização, uma cópia. REPRINT_NFCE_DANFE referencia Snapshot original e exige capability/permissão específica, prova sensível recente, motivo, confirmação e Auditoria com iniciador/autorizador. accessKeyHash pode ficar fora do documento; chave e conteúdo nunca entram em telemetria.

## Segurança, permissões e UX

Separe permissões para gerenciar agentes, bindings, TEST, recibo, visualizar Tentativas e reimprimir NFC-e, sempre com escopo de filial. Permissões do gateway não conferem emissão fiscal. HMAC-SHA256 1.1 substitui Bearer após pareamento, com nonce/timestamp/replay por agente; segredos Laravel ficam criptografados.

Mensagens de estado são honestas: SENT_TO_DEVICE = “Aceito pela fila de impressão; isso não confirma a impressão física”; FAILED = falha conhecida antes do aceite; UNKNOWN = “A impressão pode ter ocorrido; verifique antes de reimprimir”; CANCELLED = cancelado antes do envio. Resolução operacional de UNKNOWN é ACKNOWLEDGED_NO_REPRINT ou REPRINT_REQUESTED e não altera o estado técnico.

Flags independentes: test, receipt, nfce e reprint. NFC-e só habilita com provider, contrato/tag, agente compatível, capabilities, binding, template e hardware homologados.

## Aceite, testes e rollout

Testes PHPUnit/integração cobrem lockfile/drift, schemas 1.0/1.1, vetores HMAC, UUID/legado, inventário, binding STALE, roteamento exato/sem fallback, autorização negativa, snapshot/hash/idempotência, outbox/SSE/poll, claims/cancelamento, estados e UNKNOWN, copies, builders e ausência de vazamento. Use ambiente descartável autorizado para migrations; se a proteção bloquear, reporte o bloqueio, não a desative.

Testes fiscais cobrem provider ausente/flag fechada, somente modelo 65 autorizado, template v6.0 detalhado, 58/80 mm, golden snapshots, chave/QR, original único, reimpressão sensível e nenhuma regra fiscal no builder. Costura end-to-end: usuário/filial/estação -> rota -> Snapshot -> outbox -> agente -> estado projetado -> mensagem honesta -> Auditoria.

Rollout: backend compatível fechado; inventário/binding; TEST interno por estação por 2 dias úteis; recibo piloto por 5 dias; 10/25/50/100%. NFC-e é rollout separado, uma estação/filial após aprovação fiscal, operacional e de engenharia. Rollback fecha flags apenas para novas Tentativas; trabalhos correntes são reconciliados. Pare por duplicidade, rota fiscal errada, vazamento, retry de UNKNOWN, corrupção/evidência ausente; pause com FAILED+UNKNOWN >1%, latência sustentada ou outbox/agente/binding instáveis.

Inclua dashboard saneado, runbooks L1/L2/L3 e treinamento. Suporte nunca envia RAW, edita SQLite, apaga journal ou manipula segredo. Evidências de release incluem SBOM, assinaturas/hashes, CI, soak, testes físicos e aprovações.

## Fora de escopo

Criar/autorizAR/assinar/transmitir NFC-e; tributação; DANFE resumido/contingência; PDF/A4; bytes ESC/POS; configuração de fila Windows; imagens/logos; gaveta; diretórios/arquivos locais; TEF; auto-update; troca de backend após DISPATCHING; confirmar impressão física.

## Formato esperado

Produza Problem Statement, Solution, User Stories numeradas, matriz estado atual×lacuna×mudança, interfaces e modelo de dados, contratos de API/eventos, sequência transacional, matriz de permissões, segurança, UX/erros, critérios verificáveis, testes, flags/gates, rollout/rollback/runbooks e Out of Scope. Liste separadamente qualquer dúvida, em especial a ausência de provider NFC-e real.
```
