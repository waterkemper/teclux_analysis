# Consolidar impressão térmica no Device Gateway tecLUX Cloud

## Destination

Produzir três prompts /speckit.specify coordenados em modules/erp/device-gateway/: contrato compartilhado, agente Windows e integração Laravel, para entregar impressão térmica real em Epson TM e compatíveis ESC/POS, incluindo TEST_PRINTER, recibo térmico genérico e DANFE NFC-e, sem comandos arbitrários.

## Notes

- Repositórios reais: C:/teclux_cloud_contracts, C:/teclux_cloud_agent e o Laravel teclux_cloud representado neste checkout por laravel/backend.
- Saídas finais:
  - modules/erp/device-gateway/01-contracts-speckit-prompt.md
  - modules/erp/device-gateway/02-agent-speckit-prompt.md
  - modules/erp/device-gateway/03-laravel-speckit-prompt.md
- Usar /codebase-design para concentrar hardware, transporte e persistência atrás de módulos profundos; usar /domain-modeling para separar Documento Lógico, Tentativa de Impressão, Dispositivo Local, Fila de Impressão e reimpressão.
- Nenhuma implementação será feita neste workspace de análise; o destino são os três prompts.
- Estrutura já localizada:
  - contratos v1.0.0 em repositório próprio e copiados no agente;
  - agente TypeScript com registry, validação, fila, deduplicação em memória, SSE/polling e somente MockPrinterAdapter/TEST_PRINTER;
  - Laravel com DeviceGateway, pareamento, autenticação/replay protection, heartbeat, jobs, snapshots, estados, Auditoria, painel e operações de teste/crédito de troca.
- Dependências do agente foram restauradas com `npm ci`: build passou e 26/26 testes passaram; a auditoria de instalação apontou 2 vulnerabilidades altas ainda não triadas.
- Os 39 testes DeviceGateway selecionados no Laravel foram bloqueados antes das asserções pela proteção contra `migrate:fresh` na base configurada; a trava não foi desativada.
- Decisões já confirmadas durante o charting:
  - Windows RAW/Spooler + ESC/POS é o adapter real inicial; Mock permanece;
  - primeira entrega cobre TEST_PRINTER real, PRINT_THERMAL_RECEIPT e PRINT_NFCE_DANFE;
  - Laravel envia snapshot lógico autorizado; agente renderiza bytes, nunca recebe comando bruto;
  - agente descobre filas Windows e envia inventário saneado; Administrador vincula deviceId a fila exata;
  - perfil ESC_POS_GENERIC com capabilities/overrides cobre Epson TM e compatíveis, sem operationType por modelo;
  - blocos iniciais: texto, separador, rótulo-valor, tabela, QR Code, código de barras, avanço e intenção de corte; imagens/logos ficam fora;
  - SENT_TO_DEVICE significa apenas aceite pelo Spooler; nunca confirmação física;
  - execução como Windows Service, mínimo privilégio, DPAPI, logs seguros, diagnóstico e instalador; auto-update fica posterior;
  - journal local durável impede reenvio ambíguo; reinício na janela crítica resulta UNKNOWN;
  - cancelar somente antes do Spooler; remoção administrativa da fila fica fora;
  - contrato UTF-8, perfil escolhe CP860/CP850, preflight obrigatório; documento fiscal nunca translitera silenciosamente;
  - corte entra; gaveta fica desabilitada e será operação futura própria;
  - recibo não fiscal pode usar copies de 1 a 3 com contagem aceita; documento fiscal usa uma tentativa e reimpressão auditada separada.

## Decisions so far

- [Inventário dos contratos, fluxo e incompatibilidades](issues/01-inventariar-contratos-e-incompatibilidades.md) — os schemas copiados coincidem hoje, mas autenticação e identificadores não; somente TEST_PRINTER/Mock é executável, payload por operação não tem fonte única, e faltam journal e toda a fronteira Windows RAW/ESC-POS.
- [Definir o contrato versionado de impressão térmica](issues/02-definir-contrato-termico-versionado.md) — adota `1.1.0` aditivo, JSON Schema/release/lockfile como fonte única, Documento Lógico estrito e portátil, identidades e tentativas separadas, negociação por capabilities e resultados honestos do Spooler.
- [Definir o adapter Windows RAW e o renderer ESC/POS](issues/03-definir-adapter-windows-raw-escpos.md) — separa catálogo/envio em interfaces profundas, usa renderer determinístico e helper Rust persistente por dispositivo, binding estrito, RAW/Spooler honesto, perfis fechados e matriz mínima homologada.
- [Definir durabilidade, idempotência e semântica da tentativa de impressão](issues/04-definir-durabilidade-e-semantica-da-tentativa.md) — usa journal SQLite/outbox, ponto sem retorno `DISPATCHING`, claims/retries seguros, estados monotônicos, UNKNOWN imutável, cancelamento pré-efeito e reimpressão sempre como nova Tentativa.
- [Definir instalação, credenciais e operação como Windows Service](issues/05-definir-instalacao-e-operacao-windows.md) — adota MSI offline assinado, conta virtual/ACLs mínimas, pareamento com credenciais efêmeras e DPAPI por serviço, diagnósticos seguros, recovery previsível e upgrades manuais preservando evidência.
- [Definir integração Laravel, roteamento e DANFE NFC-e](issues/06-definir-integracao-laravel-e-nfce.md) — separa inventário/binding, roteia exatamente no servidor, cria snapshots/outbox idempotentes, generaliza recibos e só habilita DANFE v6.0 após fonte fiscal autorizada, com reimpressão sensível/auditada.
- [Definir aceite físico, testes, suporte e rollout](issues/07-definir-aceite-hardware-testes-e-rollout.md) — exige CI/soak/falhas e hardware real com evidências, metas de latência, homologação por combinação, piloto gradual por Estação, gates fiscais e rollback/stop/runbooks objetivos.
- [Consolidar os três prompts SpecKit coordenados](issues/08-consolidar-prompts-coordenados.md) — gera três prompts autocontidos em `modules/erp/device-gateway`, sequenciados por release/tag `v1.1.0`, lockfile verificável e suporte anunciado pelo agente; nenhuma etapa depende de branch não mesclada.

## Not yet specified

- Nenhum; as áreas restantes já estão representadas por tickets abertos.

## Out of scope

- Leitura ou escrita de diretórios e arquivos locais; será um mapa posterior após a fundação de impressão.
- TEF e troca de arquivos TEF; será esforço separado com requisitos de segurança próprios.
- Autorizar, assinar, transmitir, calcular tributos ou decidir regras fiscais da NFC-e no agente.
- Impressão A4, PDF, GDI/gráfica, acesso USB/serial direto, logos/imagens rasterizadas e adapters não Windows.
- Abertura de gaveta, balança e outros periféricos.
- Atualização automática do agente na primeira entrega.
- Comandos ESC/POS brutos, scripts, shell, executáveis ou caminhos arbitrários enviados pelo Laravel.
