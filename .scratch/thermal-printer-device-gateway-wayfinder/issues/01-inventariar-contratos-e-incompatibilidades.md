# Inventariar contratos, fluxos e incompatibilidades entre os três repositórios

Type: task
Status: resolved
Blocked by:

## Question

Qual é o fluxo ponta a ponta atualmente implementado entre Laravel, contratos e agente, quais schemas/tipos/rotas/estados/autenticações realmente coincidem ou divergem, como os contratos são copiados/versionados, quais testes passam após restaurar corretamente as dependências e quais lacunas bloqueiam impressão RAW/ESC-POS real?

## Answer

### Fluxo implementado hoje

1. O Laravel pareia um agente a uma estação e persiste o segredo criptografado, cria jobs/snapshots e os anuncia por SSE ou polling em `/api/local-agent` (há também rotas equivalentes sob `/api/device-gateway/agent/v1`).
2. O agente recebe o evento, busca o job completo, valida o envelope JSON Schema, expiração, versão, escopo e `operationType`, confirma `received`, marca `running`, executa a operação registrada e envia o resultado.
3. Somente `TEST_PRINTER` está registrado e ele termina em `MockPrinterAdapter`; portanto o fluxo chega ao executor, mas não chega ao Windows Spooler nem a hardware real.
4. O Laravel já orquestra impressão de crédito de troca, mas o contrato v1.0.0 documenta apenas `TEST_PRINTER` e o agente mantém essa operação como reservada/não executável. Não existe ainda operação NFC-e implementada.

### Contratos e versionamento

- `C:/teclux_cloud_contracts` é a fonte declarada, está no tag `v1.0.0` e contém quatro schemas: evento de disponibilidade, job, heartbeat e resultado.
- O agente contém uma cópia importada por commit do tipo subtree em `contracts/device-gateway/contracts/device-gateway`. Os quatro hashes SHA-256 coincidem hoje com a fonte, mas o caminho duplicado, a ausência de automação de atualização/verificação e o carregamento relativo a `process.cwd()` tornam a distribuição frágil.
- O envelope do job deixa `payload` como objeto genérico. A semântica por operação vive em validação Zod do agente e em código/testes do Laravel, fora da fonte de contratos; logo não há uma definição versionada única do documento de impressão.
- Heartbeat e configuração negociam na prática uma única versão exata (`1.0.0`, com tolerância Laravel a `1.0`), embora a documentação fale em versões suportadas. Não existe lista/faixa de capacidades contratuais.

### Compatibilidades confirmadas

- Rotas de heartbeat, SSE/poll, busca, `received`, `running` e resultado existem nos dois lados.
- O envelope base, expiração, `operationType`, `contractVersion` e estados finais `SENT_TO_DEVICE`, `COMPLETED`, `FAILED` e `UNKNOWN` têm correspondentes.
- Os quatro schemas copiados no agente são byte a byte iguais aos da fonte no momento deste inventário.
- O Laravel aceita `stationId` como código legado ou UUID da estação e valida a versão do heartbeat.

### Divergências e riscos bloqueadores

1. **Autenticação incompatível:** o middleware Laravel exige `X-Agent-Id`, `X-Timestamp`, `X-Nonce` e `X-Signature` HMAC; o `BackendClient` do agente envia somente `Authorization: Bearer`. O agente atual não autentica nas rotas atuais.
2. **Identidades incompatíveis:** o schema de configuração do agente exige UUID para tenant, filial e estação; o mapper Laravel emite tenant padrão `1`, filial numérica convertida em string e código legado de estação quando disponível.
3. **Operações divergentes:** Laravel pode criar crédito de troca; contratos/agente v1.0.0 só executam `TEST_PRINTER`. `PRINT_THERMAL_RECEIPT` e `PRINT_NFCE_DANFE` ainda não existem.
4. **Payload sem fonte única:** campos adicionais de `TEST_PRINTER` enviados pelo Laravel passam pelo envelope genérico e podem ser descartados/ignorados pela validação Zod. Não há schema dos blocos lógicos, limites, cópias, perfil ou capacidades.
5. **Estados duplicados:** Laravel persiste estados minúsculos internos e converte eventos; o agente mantém aliases legados e contratuais. A equivalência existe parcialmente, mas não é gerada de um modelo compartilhado.
6. **Sem durabilidade da tentativa:** deduplicação do agente é apenas em memória. Uma queda entre envio ao dispositivo e persistência/retorno pode repetir impressão; também não há classificação adequada da janela ambígua.
7. **Erro mal classificado:** exceções inesperadas do executor são reportadas como `INVALID_PAYLOAD`, mesmo quando a causa é transporte, adapter ou ambiente.
8. **Interface rasa de impressão:** `PrinterAdapter.print({message, lines})` não encapsula renderização ESC/POS, preflight, fila Windows, bytes RAW, código de página, corte, contagem aceita ou identificador do Spooler.
9. **Infraestrutura ausente:** não há descoberta de filas, binding lógico, adapter RAW, acompanhamento do Spooler, Windows Service, DPAPI, journal, instalador ou diagnóstico operacional.
10. **Sem evidência fiscal:** não existe integração implementada que produza snapshot autorizado de DANFE NFC-e, nem regra de reimpressão fiscal auditada.

### Evidência de build e testes

- Agente: após `npm ci` pelo lockfile, `npm run build` passou e `npm test -- --run` passou com **10 arquivos e 26 testes**. O `npm ci` informou **2 vulnerabilidades de severidade alta**, que precisam de triagem própria; não foi executado `npm audit fix` porque alteraria dependências sem decisão de escopo.
- Laravel: `php artisan test tests/Unit/DeviceGateway tests/Feature/DeviceGateway` selecionou **39 testes**, porém todos pararam antes das asserções porque a proteção de banco bloqueou `migrate:fresh`; resultado **39 falhas, 0 assertions**. Isso é bloqueio ambiental, não evidência de regressão funcional. A trava não foi desativada contra a base configurada.

### Consequência para o desenho

O próximo contrato deve primeiro unificar autenticação, tipos de identidade, versionamento/capabilities, schemas por operação e vocabulário de estados. Só depois o agente pode aprofundar a fronteira de hardware em um módulo que receba Documento Lógico validado e devolva uma Tentativa de Impressão honesta. O adapter RAW não deve conhecer Laravel, autenticação ou regras fiscais; e o Laravel nunca deve produzir bytes ESC/POS.
