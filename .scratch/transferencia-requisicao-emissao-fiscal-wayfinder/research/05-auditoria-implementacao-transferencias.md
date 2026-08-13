# Auditoria da implementação — Transferência de Requisição e emissão fiscal

Data: 11 de agosto de 2026

## Base revisada

- Commit da feature: Laravel 383c5bbc, nota transferencia.
- Checkout atual do submódulo Laravel: a75bb88a.
- Spec de origem: laravel/specs/332-trf-exposicao-emissao-fiscal/spec.md.
- Código: backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal, backend/app/Infrastructure/Fiscal e controller/rotas relacionados.
- Testes: backend/tests/Feature/Interlojas/TransferenciaRequisicaoEmissaoFiscal e backend/tests/Unit/Interlojas/TransferenciaRequisicaoEmissaoFiscal.

Os testes não puderam ser executados neste ambiente: o checkout exige PHP >= 8.4.1 e o runtime disponível é PHP 8.2.21.

## O que foi implementado

**CONFIRMADO:** formação de grupos por Filial Requisitante, chave de idempotência, enumeração de Transferencia/VendaTransferencia/DevolucaoTransferencia, dry-run, emissão por grupo, lote multi-grupo, endpoints de pendência/reconciliação/projeção, tabelas Cloud de ponte e cobertura Fake.

**CONFIRMADO:** a feature separa situação fiscal de situação de processamento e possui contratos de porta para selagem, emissão, status e reconciliação.

**CONFIRMADO:** há testes para replay, múltiplos requisitantes, certificado, fotografia, Delphi, projeção, tipos de operação e saldo de devolução.

## Lacunas que atualizam os prompts

### P0 — a ponte não está ligada à plataforma fiscal real

**CONFIRMADO:** AppServiceProvider liga todas as portas a FakeFiscalPlatformAdapter em 390-407. TransferenciaFiscalPlatformAdapter ainda lança RuntimeException em 15-51. O Fake guarda fotografia, emissão, número e autorização em Cache, não nas tabelas/serviços duráveis da plataforma nem na linha real de seriesfiliais.

Consequência: os testes demonstram o contrato do Fake, mas a emissão não está pronta para homologação/produção.

### P0 — projeção pode ser aplicada sem autorização real

**CONFIRMADO:** TransferenciaFiscalProjecaoDestinoHandler injeta FakeFiscalPlatformAdapter e chama markAuthorized antes de criar a projeção, em 13-35. A rota projetar-destino é manual, em routes/web.php 2025-2026. Não foi localizado listener/subscription de EmissaoAutorizada.

Consequência: o caminho atual pode transformar PENDENTE em AUTORIZADA artificialmente e aplicar projeção sem resposta SEFAZ.

### P0 — fotografia aceita dados controlados pelo request

**CONFIRMADO:** o controller recebe linhas e overrides fiscais no request, em TransferenciaRequisicaoEmissaoFiscalController.php 49-142. O serviço de fotografia usa esses valores e defaults de totais zerados e transporte, em TransferenciaFiscalPrepararFotografiaService.php 34-98.

Consequência: a emissão não está derivando a fotografia de uma Transferência confirmada e os testes não comprovam produto, preço, estoque, lote, tributos, transporte, contrato ou pagamentos reais.

### P1 — elegibilidade operacional e origem não são revalidadas

**CONFIRMADO:** TransferenciaFiscalFormarGruposService filtra apenas código positivo e quantidade recebida positiva, em 29-37. Não valida situação elegível, lote marcado, reserva/estoque, filial autorizada, vínculo com uma transferência confirmada ou revisão esperada.

### P1 — repositórios legados são incompletos e não estão no caminho de emissão

**CONFIRMADO:** LegacyTransferenciaFiscalLinhasReadRepository carrega apenas poucos campos de pedidosfiliais e devolve filial_estoque igual ao parâmetro requisitada, em 21-49. LegacyTransferenciaFiscalDestinatarioReadRepository carrega apenas CNPJ, IE e razão, em 20-33. O serviço de fotografia não injeta o repositório de linhas.

Faltam endereço/UF/IBGE/regime, produto e classificação fiscal, preço, estoque/reserva, lote/validade/fabricação, impostos, volumes, contratos, pagamentos, vencimentos e referências completas.

### P1 — efeitos e Delphi ainda são apenas marcadores/Fake

**CONFIRMADO:** para VendaTransferencia a projeção acrescenta somente o texto contrato_credito_venctos ao hash, em 36-50; não aplica contrato, crédito ou vencimento. A reconciliação usa o port do Fake e seed de Cache nos testes, não leitura autoritativa de notas/dadosfiscais/seriesfiliais/artefatos legados.

### P1 — autorização e replay precisam ser derivados do estado fiscal

**CONFIRMADO:** o endpoint aceita filial_requisitante e linhas no request, em 117-136, e o replay retorna PENDENTE/AGUARDANDO fixos, em 44-54. A consulta de pendências reforma grupos a partir do payload recebido, em TransferenciaFiscalPendenciasQuery.php 25-41.

O fluxo de produção precisa carregar a origem por identificador autorizado, comparar revisão/hash e retornar o estado da plataforma, sem permitir que o cliente fabrique grupo ou pendência.

## Conclusão

A implementação atual é um MVP de contrato e Fake. Os prompts devem preservar o que já foi entregue e acrescentar uma segunda fatia obrigatória de integração real, fotografia autoritativa, autorização por evento, efeitos idempotentes reais, reconciliação Delphi autoritativa, segurança server-side e testes PostgreSQL/plataforma.
