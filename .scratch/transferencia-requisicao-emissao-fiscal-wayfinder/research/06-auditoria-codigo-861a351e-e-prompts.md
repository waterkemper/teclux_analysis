# Auditoria do código atualizado — 861a351e

Base comparada: `93eed411...861a351e`, mais a árvore atual de `laravel/backend`.

## Resultado

O commit `861a351e` removeu corretamente a implementação de `VendaTransferencia` e `DevolucaoTransferencia`. O pipeline HTTP, formação de grupo, preparação, reconciliação, emissão, adapter, projeção e listener agora rejeitam esses tipos; os efeitos financeiros e testes específicos foram removidos.

Ainda existem lacunas de produção na operação ativa `Transferencia`:

### F-01 — Estado fiscal crítico continua em memória

`TransferenciaFiscalPlatformAdapter` mantém `pendingSeals` e `pendingEmissions` em arrays de processo (`backend/app/Infrastructure/Fiscal/TransferenciaFiscalPlatformAdapter.php:42-45`). `createOrGetEmission` e `allocateNumberAndOutbox` dependem desses tokens. Restart entre seal, criação da emissão e numeração perde a fotografia e impede retry. É divergente da durabilidade exigida pela plataforma fiscal.

### F-02 — Fixture e defaults ainda entram no caminho HTTP real

`TransferenciaFiscalPrepararFotografiaService` sempre faz merge de `TransferenciaFiscalTestFotografiaFixture::get()` (`backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalPrepararFotografiaService.php:45`). O adapter e o preparador ainda têm defaults fiscais como CFOP `5152`, NCM `00000000` e UF `SP`. Isso permite fotografia aparentemente completa sem dados server-side resolvidos.

### F-03 — Projeção autorizada não carrega a fotografia selada

O listener de autorização chama o handler sem fotografia (`backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/Listeners/TransferenciaFiscalOnEmissaoAutorizadaListener.php:47`). A rota manual injeta explicitamente `TransferenciaFiscalTestFotografiaFixture::get()` (`backend/app/Http/Controllers/Interlojas/TransferenciaRequisicaoEmissaoFiscalController.php:318-323`). O handler aceita fotografia vazia e a projeção não valida a revisão selada. O caminho manual também usa apenas `administrador`, sem capability fiscal específica.

### F-04 — Falhas e estados ainda não são duráveis nem distintos

Listeners fazem SQL direto e capturam `Throwable` apenas para log (`.../Listeners/TransferenciaFiscalOnEmissaoAutorizadaListener.php:27-53`). O listener de pendência transforma rejeição corrigível, falha operacional e reconciliação ambígua no mesmo estado `AGUARDANDO_RECONCILIACAO` (`TransferenciaFiscalOnEmissaoPendenciaListener.php:26-30`). Isso não cria retry/outbox/pendência acionável.

### F-05 — Fronteiras e reconciliação permanecem incompletas

`TransferenciaFiscalIdempotencyGuard`, o handler, controller e listeners acessam tabelas Cloud diretamente. O adapter também resolve série com SQL próprio (`TransferenciaFiscalPlatformAdapter.php:291`) apesar de existir repositório de numeração. A reconciliação do adapter compara apenas parte do documento legado e não materializa uma comparação completa de origem, modelo, hash e artefatos.

### F-06 — Verificação limitada pelo ambiente

Lint PHP passa nos arquivos alterados. A suíte Laravel não inicializa no ambiente atual porque o runtime disponível é PHP 8.2.21 e o Composer exige PHP >= 8.4.1; a próxima especificação deve exigir execução em ambiente suportado e registrar bloqueios sem mascará-los.

## Correto e preservado

- Apenas `Transferencia` é aceita nos requests.
- Tipos históricos fora do escopo são rejeitados por serviços internos com `TRF_FISCAL_TIPO_OPERACAO_FORA_ESCOPO`.
- Repositório de efeitos financeiros, baixa de devolução, saldo de devolução e testes específicos foram removidos.
- `Transferencia` continua com projeção idempotente de satisfação, sem NF-e de entrada.

## Escopo da próxima especificação

Corrigir F-01 a F-06 somente para `Transferencia`. Não reintroduzir venda entre filiais, devolução, contrato/crédito/vencimentos financeiros ou baixa de origem. Os valores históricos podem continuar legíveis, mas nunca podem formar grupo, selar fotografia, emitir, reconciliar ou projetar.
