$# Prompt SpecKit — Prontidão para homologação real da transferência

Use este prompt após o prompt 09. Ele deve gerar especificação, não implementar código.

```text
/speckit.specify

Faça uma especificação incremental para tornar a emissão fiscal de Transferencia apta a um teste real de NF-e modelo 55 em ambiente de homologação, usando o código Laravel atualmente atualizado e sem reabrir venda entre filiais ou devolução entre filiais.

Leia obrigatoriamente:

- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/07-auditoria-atual-e-prontidao-homologacao.md
- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/06-auditoria-codigo-861a351e-e-prompts.md
- /mnt/c/teclux_analysis/laravel/specs/349-trf-fiscal-plataforma-real/spec.md
- /mnt/c/teclux_analysis/laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md
- /mnt/c/teclux_analysis/laravel/specs/349-trf-fiscal-plataforma-real/contracts/*.md
- /mnt/c/teclux_analysis/modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md
- /mnt/c/teclux_analysis/modules/interlojas/transferencia-requisicao-emissao-fiscal/09-speckit-prompt-specify-revisao-apos-861a351e.md
- /mnt/c/teclux_analysis/backend/app/Infrastructure/Fiscal/NfePhp/NfePhpFiscalGateway.php
- /mnt/c/teclux_analysis/laravel/backend/app/Application/Fiscal/RunFiscalHomologacaoDiagnosticoService.php
- /mnt/c/teclux_analysis/laravel/backend/app/Console/Commands/FiscalDiagnosticoHomologacaoCommand.php
- /mnt/c/teclux_analysis/laravel/backend/config/fiscal.php
- /mnt/c/teclux_analysis/laravel/backend/AGENTS.md e regras aplicáveis

Produza somente a especificação incremental. Não altere código nesta etapa. Classifique cada requisito como bloqueador de código, bloqueador de ambiente, dependência fiscal externa, risco, evidência ou fora de escopo.

Escopo obrigatório:

- O único tipo ativo é `Transferencia`.
- `VendaTransferencia` e `DevolucaoTransferencia` são históricos de leitura e continuam rejeitados para grupo, fotografia, emissão, consulta, reconciliação, projeção, efeitos, pendência e testes de implementação.
- Não criar NF-e de entrada, contrato/crédito/vencimento, baixa de origem, efeitos de venda/devolução, pipeline fiscal paralelo, contador paralelo ou certificado paralelo.

A especificação deve fechar, com contratos, estados, migrações compatíveis, testes e critérios de aceite rastreáveis:

1. Gateway real de homologação

   - substituir o skeleton de `NfePhpFiscalGateway` por serialização completa da NF-e 55 a partir da fotografia fiscal selada;
   - validar contra o pacote XSD/normativo vigente registrado para UF, ambiente e modelo;
   - assinar com certificado A1 PKCS#12 real, sem hash substituto ou assinatura fake;
   - transmitir para o autorizador correto da UF, consultar recibo/chave, persistir protocolo e `nfeProc`, tratar rejeição, timeout ambíguo e eventos necessários à reconciliação;
   - remover CNPJ, versão, schema, endpoint e qualquer outro valor hardcoded ou de diagnóstico;
   - manter Fake somente em testes/dry-run explicitamente isolados, nunca como fallback de homologação.

2. Durabilidade da emissão

   - eliminar `pendingSeals`/`pendingEmissions` como autoridade;
   - persistir fotografia, revisão, hash, comando, vínculo grupo-emissão, número/série, outbox, pendência, tentativa e resposta sanitizada;
   - definir transação curta, lock, retomada após reinício, retry, ownership, idempotência e reconciliação;
   - impedir segunda emissão ao repetir a mesma chave idempotente ou ao reprocessar eventos.

3. Fotografia e projeção autoritativas

   - remover fixture global, defaults fiscais e dados de teste do caminho HTTP/homologação;
   - resolver e validar no servidor todos os campos fiscais antes do seal;
   - listener e rota manual devem carregar exatamente a fotografia persistida, validando grupo, emitente, destinatário, modelo, chave, tipo, revisão e hash;
   - exigir capability fiscal administrativa e reautenticação na operação manual;
   - projetar somente uma `Transferencia` autorizada e aplicar apenas satisfação idempotente da transferência.

4. Estados, falhas e fronteiras

   - separar rejeição corrigível, falha operacional e aguardando reconciliação;
   - persistir pendência/retry/dead-letter e evidência, sem catch silencioso ou sucesso baseado somente em log;
   - mover SQL de Application/HTTP/listeners para portas e repositórios de Infrastructure;
   - completar reconciliação com origem, filial base, filial requisitante, tipo, modelo 55, série, número, chave, fotografia/hash e artefatos.

5. Gate de ambiente e credenciamento

   - criar preflight fail-closed que valide PHP >= 8.4.1, extensões, NFePHP, schemas, CA/TLS, rede, banco, fila, armazenamento, configuração de homologação e ausência de Fake;
   - exigir UF e filial emissora concretas como configuração/entrada, sem inventar valores;
   - validar CNPJ, IE, credenciamento de cada estabelecimento emissor, certificado A1 e vínculo explícito do certificado ao contribuinte/estabelecimento, UF, ambiente, modelo e prioridade;
   - selecionar endpoint/autorizador conforme UF e pacote normativo atual, sem assumir SVAN ou endpoint nacional;
   - exigir `FISCAL_TRANSFERENCIA_SKIP_SEFAZ_TESTING=false` no smoke test.

6. Teste real e evidências

   Defina um runbook sem segredos que cubra: diagnóstico; status de serviço; uma NF-e 55 de transferência; persistência de XML assinado, `nfeProc`, chave, protocolo e resposta; projeção autorizada; replay idempotente; rejeição corrigível; timeout ambíguo; reconciliação por recibo/chave; e confirmação de que não há NF-e de entrada nem efeitos financeiros/de venda/devolução.

   Para cada passo defina pré-condições, comando/rota, dados mínimos, estado antes/depois, evidências sanitizadas, critério de aprovação e rollback operacional. O aceite final deve exigir um smoke test real autorizado em homologação e aprovação fiscal/operacional. Deixe explícito que documentos de homologação não têm validade jurídica e que nenhum teste deve usar produção.

Entregue uma matriz de rastreabilidade F-01..F-06 e H-01..H-06, uma lista de bloqueadores ainda abertos e a ordem segura de implementação, validação automatizada e execução do smoke test.
```
