# Prompt SpecKit 13 — Preflight, smoke gate e runtime de homologação

```text
/speckit.specify

Especifique a correção incremental do preflight e do gate operacional para executar o smoke real da NF-e 55 de Transferencia em homologação. Não implemente código nesta etapa.

Leia:

- /mnt/c/teclux_anlysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/08-revisao-implementacao-356-e-prompts-restantes.md
- /mnt/c/teclux_anlysis/specs/356-trf-fiscal-homologacao/contracts/preflight-ambiente-credenciamento.md
- /mnt/c/teclux_anlysis/specs/356-trf-fiscal-homologacao/contracts/smoke-runbook-evidencias.md
- docs/operations/fiscal-transferencia-homologacao-smoke.md
- backend/app/Application/Fiscal/RunFiscalHomologacaoDiagnosticoService.php
- backend/app/Console/Commands/FiscalDiagnosticoHomologacaoCommand.php
- backend/app/Providers/FiscalServiceProvider.php
- backend/backend/composer.json ou backend/composer.json, conforme o layout atual
- backend/tests/Feature/Fiscal/FiscalDiagnosticoHomologacaoCommandTest.php
- backend/tests/Support/Fiscal/HomologacaoSmokeTestHelpers.php

Escopo exclusivo: Transferencia, NF-e modelo 55, ambiente de homologação. VendaTransferencia e DevolucaoTransferencia ficam fora. Produção nunca pode ser usada.

Especifique:

1. Gate de binding por allowlist de classes/adapters reais, não por substring `Fake` no nome da classe. Anonymous class, mock, decorator de teste e fallback devem reprovar o diagnóstico.
2. Gate de status SEFAZ que interprete cStat conforme o contrato: comunicação passará somente quando a resposta representar serviço disponível; endpoint, autorizador, UF, ambiente e versão efetivamente utilizados devem ser evidenciados.
3. Liberação segura do `CertificateMaterial` em status/preflight; nenhum PFX, senha ou binário deve permanecer em memória ou aparecer em logs/evidências.
4. Etapas explícitas e fail-closed para PHP compatível com Composer/Docker, extensões, NFePHP, schemas/imports, certificado e vínculo, CA/TLS/DNS, banco, Horizon/worker, Redis e storage/S3 de artefatos.
5. Alinhar `composer.json`, lock, Docker e preflight para uma única versão mínima suportada, preferencialmente PHP 8.5 conforme o container; a suíte não pode declarar `^8.3` e reprovar PHP 8.3/8.4 somente em runtime sem explicar o contrato.
6. Criar ou especificar um comando/serviço de smoke que não execute RB-03 quando o diagnóstico não estiver APROVADO, quando `FISCAL_TRANSFERENCIA_SKIP_SEFAZ_TESTING` estiver true, quando Fake estiver ligado ou quando modelo/UF/filial não forem válidos.
7. Separar diagnóstico, status e smoke: diagnóstico APROVADO não equivale a NF-e autorizada. O smoke deve registrar idempotency key, fotografia/hash, XML assinado, chave, recibo, protocolo, `nfeProc`, projeção, replay e aprovação fiscal/operacional.
8. Executar os testes automatizados no container PHP suportado e registrar o resultado; o host PHP incompatível deve reprovar ou ser explicitamente isolado, nunca produzir falso verde.

Entregue matriz de pré-condições, códigos de falha, contratos do comando, runbook RB-00…RB-10, critérios de aceite e dependências externas pendentes (UF/filial, credenciamento, A1, endpoint/autorizador). Não altere código nesta etapa.
```
