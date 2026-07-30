# Prompt para /speckit.specify — contratos do Device Gateway

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para evoluir o repositório teclux_cloud_contracts do Device Gateway da versão 1.0.0 para a versão aditiva 1.1.0, introduzindo impressão térmica real, sem implementar nesta etapa.

Este é o primeiro de três trabalhos coordenados. A entrega deve resultar, depois de implementada e aprovada, em release imutável e tag v1.1.0. O agente e o Laravel somente poderão iniciar suas respectivas implementações depois de consumir essa tag por um device-gateway-contract.lock.json contendo versão, commit e SHA-256 dos artefatos. Não dependa de branch não mesclada nem de cópia manual entre repositórios.

## Investigação obrigatória

Antes de especificar, inspecione todos os schemas, exemplos, manifestos, scripts de build/publicação e consumidores conhecidos. Compare a tag v1.0.0 com o checkout atual. Registre evidências como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE. Confirme a divergência atual entre HMAC no Laravel e Bearer no agente, IDs numéricos legados versus UUID e a cópia frágil dos schemas dentro do agente. Preserve integralmente a compatibilidade de 1.0.0; requisitos novos pertencem aos contratos 1.1.0.

## Fonte única e distribuição

- JSON Schema draft 2020-12 é normativo; tipos TypeScript são gerados, nunca mantidos manualmente em paralelo.
- O release inclui schemas, tipos, exemplos válidos/inválidos, manifesto e hashes. Builds de consumidores usam artefato pinado e falham em CI diante de drift.
- O runtime consome contrato empacotado no build, sem depender de process.cwd(), rede ou caminho de checkout.
- tenantId, branchId, stationId, agentId, deviceId e jobId são UUID canônicos. Mapeamentos para IDs legados são responsabilidade do Laravel, fora do wire contract.
- Heartbeat mantém contractVersion e adiciona supportedContractVersions e supportedOperations. Ausência dos campos novos identifica cliente 1.0. O Laravel nunca envia operação não anunciada.

## Autenticação e envelope

Após pareamento, somente HMAC-SHA256: X-Agent-Id, X-Timestamp, X-Nonce e X-Signature calculada sobre método, path, timestamp, nonce e hash do corpo. Defina canonicalização, janela de tempo, replay protection por agente e vetores cruzados. Bearer não faz parte de 1.1. Segredos nunca aparecem em payload, exemplo ou erro.

Modele separadamente Job, Documento Lógico de Impressão, Snapshot imutável e Tentativa. Canonical JSON + SHA-256 identifica conteúdo. Repetir a mesma Tentativa ou Job retorna o resultado conhecido e jamais reenvia bytes. O Job referencia apenas deviceId e requiredCapabilities, nunca nome de fila, driver, porta ou caminho.

## Operações e documento lógico

Crie ThermalPrintDocumentV1 para TEST_PRINTER, PRINT_THERMAL_RECEIPT, PRINT_NFCE_DANFE e REPRINT_NFCE_DANFE. Use discriminadores estritos e additionalProperties:false para: text, separator, labelValue, itemTable, qrCode, barcode, feed e cut.

Estilos semânticos: NORMAL, EMPHASIS, TITLE e SMALL; alinhamentos LEFT, CENTER e RIGHT; paperWidth MM58/MM80. Tabelas usam pesos e larguras mínimas proporcionais, quebra determinística e nunca truncamento silencioso. QR nativo aceita correção L/M/Q/H. Códigos nativos: CODE128, EAN13, EAN8 e UPC_A.

Limites obrigatórios: payload UTF-8 até 512 KiB; 2.000 blocos; 1.000 itens de tabela; texto 4.096 caracteres; QR 2.048 bytes; barcode 128 caracteres; feed 1..10 por bloco e até 50 no documento; ao menos um bloco imprimível; exatamente um cut, sempre no final. O texto lógico é UTF-8; o perfil escolhe uma única code page CP860 e depois CP850. Qualquer caractere não representável falha no preflight, sem transliteração, inclusive em recibos não fiscais.

Copies é 1..3 somente para recibo não fiscal; TEST e documentos fiscais usam uma cópia. Reimpressão fiscal é sempre REPRINT_NFCE_DANFE, referencia o Snapshot original e exige motivo, autorizador e permissão registrados pelo servidor.

## Capabilities, perfis e resultado

O agente é autoridade sobre capabilities efetivas. Modele origem DETECTED, DRIVER_REPORTED, ADMIN_CONFIGURED ou PROFILE_DEFAULT e bindingRevision. Capabilities incluem largura, corte, QR, barcode e code pages. O servidor pede capacidade, não escolhe mecanismo físico.

SENT_TO_DEVICE significa somente que o Spooler aceitou e encerrou o job; não confirma papel impresso. FAILED só quando a falha é conhecida antes do efeito; UNKNOWN quando o efeito é ambíguo; COMPLETED fica reservado para feedback físico confiável futuro. Resultados incluem copiesRequested e copiesAccepted. Erros têm stage CONTRACT, PREFLIGHT, RENDER, SPOOLER ou RECOVERY, código versionado, retryable e detalhes seguros por allowlist.

Metadados fiscais fora do documento limitam-se a fiscalDocumentId, accessKeyHash, environment e IDs/hashes do Snapshot. O contrato não autoriza, calcula, assina ou transmite NFC-e.

## Aceite e testes

Exija testes de schema para todos os limites, discriminadores e additionalProperties; exemplos válidos e inválidos; compatibilidade de leitura 1.0; canonicalização e hashes; vetores HMAC compartilhados com Node/PHP; IDs UUID; negociação de versões/operações; idempotência; copies e reimpressão; estados honestos; erros sem vazamento. Gere golden vectors do documento, canonical JSON e hash para os dois consumidores.

O release v1.1.0 só pode ser publicado com CI verde, manifesto/hashes reproduzíveis, changelog e instruções de migração. A especificação deve definir o conteúdo exato do lockfile e o gate que impede agente ou Laravel de usar contrato local divergente.

## Fora de escopo

Implementar agente, helper Rust ou Laravel; bytes ESC/POS; fila/driver/porta; autorização fiscal; PDF/A4/GDI; imagem/logo; gaveta; USB/serial direto; leitura de diretórios; TEF; auto-update; comandos RAW, scripts, shell ou caminhos arbitrários.

## Formato esperado

Produza Problem Statement, Solution, User Stories numeradas, modelo e diagramas de estado, catálogo completo de schemas, decisões de compatibilidade, estratégia de release/tag/lockfile, matriz 1.0×1.1, segurança, erros, critérios de aceite verificáveis, matriz de testes, rollout e Out of Scope. Toda dúvida descoberta deve ficar separada dos requisitos normativos acima.
```
