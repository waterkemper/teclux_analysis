# Levantar vantagens estratégicas e diferenças operacionais concretas vs Delphi

Type: task
Status: resolved
Blocked by: 01

## Question

Quais são as vantagens estratégicas de alto nível do Laravel sobre o Delphi (acesso via navegador/nuvem, sem instalação, multi-dispositivo, atualizações contínuas, etc.) e, para cada módulo já migrado listado no inventário (ticket 01), 2-3 exemplos operacionais concretos de diferença prática — coisas que mudam no dia a dia do operador (ex.: grids/preferências, autorização, PDF substituindo impressão fiscal antiga, revisão otimista/conflito concorrente)? Extrair evidência dos mapas Wayfinder e ADRs já existentes no repo, não inventar.

## Answer

**Vantagens estratégicas de alto nível** (sustentadas pela arquitetura confirmada na ticket 01): acesso via navegador em qualquer computador/loja sem instalar nada; atualização automática para todo mundo ao mesmo tempo (sem visitar cada PC para atualizar uma versão do Delphi); mesmo banco de dados do sistema atual, então a transição é módulo a módulo, sem migração de dados nem "corte" arriscado de um fim de semana; acesso de qualquer lugar, não preso à rede local da loja.

**Exemplos operacionais concretos por domínio:**

**Vendas / Orçamentos**
- Cotação de frete direto na tela do orçamento — o vendedor não digita valor de frete manualmente nem liga para a transportadora; o sistema consulta e traz as opções automaticamente, com histórico salvo de qual foi escolhida.
- Conferência de produtos por bipagem de código de barras, com alerta automático se o orçamento tiver produto não conferido na hora de emitir a nota.
- Histórico de atendimentos do cliente aparece direto dentro do orçamento, sem precisar abrir outra tela.

**Grids/telas de consulta (recurso transversal a todos os módulos)**
- Cada usuário personaliza a largura e o título das colunas do jeito que quiser, e essas preferências ficam salvas — coisa que não existia no Delphi. Dá para exportar essa configuração e importar em outro usuário, e o administrador consegue aplicar um layout padrão para todo mundo de uma vez, com um clique.

**Contas a Pagar**
- Quitação em lote e Estorno em lote são "tudo ou nada": o sistema mostra uma prévia antes de confirmar, e se algo der errado no meio do processo, nada fica pago pela metade — no Delphi cada duplicata era processada uma de cada vez e podia parar no meio, deixando o lote inconsistente.

**Interlojas**
- Requisição entre filiais preserva as regras de hoje, mas moderniza o controle de concorrência: o sistema identifica exatamente quem alterou o quê e quando, mesmo com Delphi e Laravel mexendo na mesma requisição ao mesmo tempo.

**Impressão (loja física)**
- Documentos (orçamento e, no futuro, fechamento de caixa) saem em PDF direto do navegador — sem depender de impressora matricial ou driver instalado numa máquina específica.
- Impressão térmica (cupom/recibo) passa a ser centralizada por um agente que controla a fila de impressão da loja com histórico e status de cada tentativa, em vez de cada PC ter sua própria configuração solta de impressora.

**Marketplaces**
- Já é 100% nativo em Laravel, em produção — não é uma migração pendente: Mercado Livre e Magalu já sincronizam produto, preço e pedido automaticamente, com mecanismos próprios de recuperação quando uma sincronização trava.

**Ressalva:** há bugs recorrentes específicos de sincronização de marketplace (SKU duplicado/truncado) ainda em diagnóstico — não citar a integração como "totalmente livre de problemas", só como prova de que já roda de verdade em produção.

Fontes: `.scratch/orcamentos-cotacao-frete-wayfinder`, `.scratch/orcamentos-conferencia-produtos-wayfinder`, `.scratch/orcamentos-atendimentos-wayfinder`, `.scratch/erp-grid-preferences-optimization-wayfinder`, `.scratch/quitacao-em-lote-contas-pagar-wayfinder`, `.scratch/estorno-pagamento-em-lote-wayfinder`, `.scratch/cadastro-requisicoes-entre-filiais-wayfinder`, `laravel/docs/adr/229-orcamento-impressao-pdf.md`, `.scratch/thermal-printer-device-gateway-wayfinder`, `.scratch/marketplace-sync-review-wayfinder`.

> **Adendo (2026-07-30, refinamento pós-publicação):**
>
> - **Agente local de periféricos (Device Gateway) já em produção.** Não é só especificação: pareamento de dispositivo, fila de trabalhos, heartbeat, auditoria e painel administrativo já funcionam de verdade no Laravel (`DeviceGatewayActivationService`, `DeviceGatewayOperatorJobService`, `DeviceGatewayAuditLogger` e controllers Admin/Operador/Agente). O que falta é só a impressão térmica em impressora física real — hoje só o modo de teste/mock funciona; a especificação técnica para o adapter real (ESC/POS) já está fechada e publicada em `modules/erp/device-gateway/`.
> - **Atualizações mais frequentes.** Reforçar que a atualização automática (já registrada acima) também significa um ritmo de entrega mais frequente que o ciclo de versões do Delphi — melhorias chegam em semanas, não em um próximo grande release.

> **Adendo (2026-08-06, novidades desde 30/07):**
>
> - **Interlojas — Confirmação de recebimento entre lojas (por Nota ou por Romaneio).** No Delphi, confirmação é uma nota/romaneio de cada vez, sem garantia de tudo-ou-nada, e "cancelar" uma busca não interrompe de fato a consulta no banco. No Laravel, seleção múltipla com confirmação atômica (tudo ou nada) e cancelamento real; a chave de NF-e usada para localizar passa a ser validada automaticamente (dígito verificador), não só "somente números" como no Delphi.
> - **Entregas — Cadastro de Romaneios.** Uma única tela reúne o que no Delphi era espalhado em passos separados: inclusão múltipla de notas, conferência de volumes, assinatura do recebedor e justificativa de entrega, com o frete lançado automaticamente em Contas a Pagar (sem lançamento manual à parte).
