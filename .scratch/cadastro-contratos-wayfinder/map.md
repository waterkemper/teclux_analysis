Label: wayfinder:map

## Destination

Chegar a um conjunto ordenado de decisões, evidências e fronteiras de especificação que permita migrar incrementalmente o Cadastro de Contratos do Delphi para o Laravel, sem perder regras transversais e sem exigir um único spec monolítico.

## Notes

- Domínio: Vendas — Cadastro de Contratos.
- Fontes Delphi e Laravel são somente leitura; documentação pode ser gravada apenas em `modules`, `docs` ou `.scratch`.
- Toda investigação Delphi deve analisar PAS e DFM conjuntamente e seguir forms ancestrais, data modules, units compartilhadas, actions, eventos, SQL, relatórios, permissões, parâmetros e integrações.
- Comparar continuamente com Consulta de Contratos, geração a partir de Orçamento e componentes reutilizáveis já existentes no Laravel.
- Classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `DECISÃO NOVA`, sempre com evidência concreta.
- Limitações ou bugs Delphi não se tornam requisitos automaticamente.
- Cada fatia independente concluída deve indicar se comporta um `$to-spec` próprio.
- Este mapa produz decisões e recortes; implementação, migrations, Composer, npm, builds, formatadores e geradores estão fora desta atividade.

## Decisions so far

- [Inventariar superfície e dependências do Cadastro](issues/01-inventariar-superficie-e-dependencias-do-cadastro.md) — confirmou um monólito Delphi de cerca de 48 mil linhas e delimitou Consulta, Ficha Financeira, Impressão e geração por Orçamento como capacidades Laravel existentes a integrar.
- [Definir ciclo de vida e matriz de transições](issues/02-definir-ciclo-de-vida-e-matriz-de-transicoes.md) — fixou o recorte inicial `O/R/F/C`, avanço `O → R → F`, cancelamentos guardados, reversão `F → R`, mutabilidade e adiamento de `P/N` para a fatia fiscal.
- [Delimitar núcleo, abertura, localização e gravação](issues/03-delimitar-nucleo-abertura-localizacao-e-gravacao.md) — definiu F9 compartilhado, rascunho sem número, F8 atômico, `revision`, carregamento progressivo e um único seam de aplicação para o Cadastro.
- [Definir vínculo e fotografia do Cliente](issues/04-definir-vinculo-e-fotografia-do-cliente.md) — definiu Cliente `C/F/L`, autoridade cadastral até `F`, congelamento em `P/N/C`, edição pelo cadastro mestre e troca preparada somente em `O/R`.
- [Mapear autorizações, permissões e parâmetros](issues/06-mapear-autorizacoes-permissoes-e-parametros.md) — separou acesso, capacidade contextual, regra parametrizada, preferência visual e prova sensível; definiu capabilities recalculadas no servidor e reaproveitamento de policies, manifestos e provas já existentes no Laravel.
- [Definir shell, navegação e carregamento](issues/07-definir-shell-navegacao-e-carregamento.md) — validou abas horizontais, resumo e comandos persistentes, Produtos como área operacional inicial e carregamento progressivo por área/revision.
- [Delimitar produtos, serviços e cálculo comercial](issues/08-delimitar-produtos-servicos-e-calculo-comercial.md) — separou editores Produto/Serviço, motor comercial compartilhado e operações do Contrato; encaminhou estoque/séries e fiscal e definiu três specs incrementais.
- [Delimitar pagamentos e Ficha Financeira](issues/09-delimitar-pagamentos-e-ficha-financeira.md) — separou proposta financeira editável em `O/R` do razão financeiro após `F`, definiu invalidação por assinatura e reaproveitamento do motor de financiamento e da Ficha existentes.
- [Delimitar estoque, reserva e conferência](issues/10-delimitar-estoque-reserva-e-conferencia.md) — definiu reserva atômica em `O → R`, delta transacional em `R`, disponibilidade como projeção viva, compensações rastreáveis e conferência `CTR` sobre o motor genérico Laravel, deixando consumo fiscal e devoluções para fatias próprias.
- [Delimitar faturamento e documentos fiscais](issues/11-delimitar-faturamento-e-documentos-fiscais.md) — separou `R → F` da emissão fiscal posterior, limitou a primeira entrega a `F` e definiu seleção/alocação, planejamento fiscal, estados derivados `P/N` e integração externa como esforço próprio.
- [Delimitar entrega, retirada, frete, transportadora e montagem](issues/18-delimitar-entrega-retirada-frete-transportadora-e-montagem.md) — separou promessa, cotação, agenda e execução logística; definiu reutilização do motor de frete, da edição da Consulta e do registro sensível de entrega em loja.
- [Delimitar operações transversais e saídas](issues/12-delimitar-operacoes-transversais-e-saidas.md) — classificou relacionamento, fotos, anexos, venda perdida, saídas documentais e relatórios para reutilização; isolou cancelamento, cópia, auditoria e adapters faltantes em tarefas próprias.

- [Definir cancelamento, reversão e devolução do Contrato](issues/21-definir-cancelamento-reversao-e-devolucao-do-contrato.md) — separou descarte de rascunho, cancelamento `O/R/F`, reversão `F → R` e devolução pós-faturamento; definiu guardas financeiras, fiscais e logísticas, compensações idempotentes, autorização sensível e Atendimento consequente sem apagar histórico.

- [Definir projeção de auditoria e integrações do Contrato](issues/24-definir-projecao-de-auditoria-e-integracoes-do-contrato.md) — separou diffs técnicos, eventos de domínio, autorizações e efeitos vinculados; definiu envelope correlacionado, timeline segura, outbox/idempotência e graduou a confirmação física das triggers.

- [Confirmar cobertura física das triggers de auditoria do Contrato](issues/25-confirmar-cobertura-fisica-das-triggers-de-auditoria-do-contrato.md) — confirmou `_log_new` e chaves para as sete partes do núcleo, formato JSON uniforme, coexistência com logs legados e lacunas de correlação/contatos que o spec deve tratar.

- [Confirmar trigger de sincronização Cliente–Contrato](issues/13-confirmar-trigger-de-sincronizacao-cliente-contrato.md) — confirmou sincronização ampla parametrizada apenas para Cliente `C` em `O/R/F`, exceções de código/conceito/fiscal, ausência para `F/L`, fluxo inverso Delphi e efeitos sobre auditoria/revision.

- [Reconciliar Contrato originado de Orçamento](issues/05-reconciliar-contrato-originado-de-orcamento.md) — integrou a conversão existente ao seam canônico do Cadastro, com Contrato inicial `O`, vínculo único, transferência atômica da proposta e preservação sem duplicar atendimentos/questionários.

- [Confirmar casos dourados do motor comercial](issues/14-confirmar-casos-dourados-do-motor-comercial.md) — fixou identidade e intenções de linha, truncamento, ordem e resíduo dos rateios, bases de cupom, exclusão de brindes e a fronteira do motor compartilhado por Orçamento e Contrato.

- [Confirmar casos dourados do financiamento](issues/15-confirmar-casos-dourados-do-financiamento.md) — adotou o motor do Orçamento e parcelas sempre separadas como base canônica; fixou crédito/cashback, calendário, edição, resíduos e ST, mantendo juros/múltiplo condicionados a fixtures Delphi.

- [Confirmar casos dourados de reserva, movimentos, lotes, séries e conferência](issues/16-confirmar-casos-dourados-de-reserva-movimentos-lotes-series-e-conferencia.md) — confirmou autorização, deltas e compensações em `R`, bloqueio de falta para lotes e séries no faturamento; separou specs de reserva e `CTR` e adotou o número atual, não o primogênito, como identidade da conferência.

- [Confirmar casos dourados de seleção, cobertura e planejamento fiscal](issues/17-confirmar-casos-dourados-de-selecao-cobertura-e-planejamento-fiscal.md) — fixou cobertura por alocações autorizadas, seleção explícita de quantidade/lote/série, partição produto/serviço, rateios e modalidades fiscais; separou preparação, submissão e confirmação sem levar `P/N` ao primeiro Cadastro.

- [Confirmar casos dourados de modalidades e capacidade logística](issues/19-confirmar-casos-dourados-de-modalidades-e-capacidade-logistica.md) — confirmou operação híbrida por item, capacidade por parada logística, separação entre frete cobrado/pago/isento e pendências quantitativas distintas para documentar, entregar, retirar e montar.

- [Integrar relacionamento, questionários, fotos e anexos ao shell](issues/20-integrar-relacionamento-questionarios-fotos-e-anexos-ao-shell.md) — definiu contextos, capabilities e callbacks seletivos; preservou engines reutilizáveis, isolou Contatos e Anexos do Cliente mestre e fixou identidade/disparos idempotentes do Questionário de Contrato.

- [Definir semântica de cópia do Contrato](issues/22-definir-semantica-de-copia-do-contrato.md) — separou desmembramento `O→O/R→R` de importação de produtos, fixando rateio comercial/financeiro, transferência atômica de reservas, logística não clonável e política de preço/consolidação.

- [Consolidar impressão, relatórios e e-mail do Contrato](issues/23-consolidar-impressao-relatorios-e-email-do-contrato.md) — centralizou policy documental, reutilizou PDF/Consulta/e-mail, separou comandos financeiros e definiu destinatários, preview, fila e modo iTecLUX com outbox próprio.

- [Consolidar ordem de specs, rollout e compatibilidade](issues/26-consolidar-ordem-de-specs-rollout-e-compatibilidade.md) — ordenou 21 specs em nove etapas, definiu paralelização e compatibilidade Delphi–Laravel, liberação por Usuário, concorrência otimista e gate ponta a ponta até `F`.

## Not yet specified

Nenhuma névoa funcional restante. O mapa está concluído; a execução segue pelos `$to-spec` ordenados na decisão final.

## Out of scope

- Implementar ou testar código no Delphi ou Laravel durante o wayfinding.
- Reproduzir automaticamente bugs, limitações de interface ou tecnologia específica do Delphi/FastReport.
- Produzir agora um único prompt abrangente para `/speckit.specify`.
