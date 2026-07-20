Type: task
Status: resolved
Blocked by: 07, 11, 12

## Question

Como o Cadastro deve reutilizar a preparação/PDF de Contrato, os relatórios da Consulta e o engine genérico de e-mail, incluindo opções de fotos, políticas por situação, adapter documental, destinatários, preview, fila/idempotência e modo iTeclux?

Separar Contrato, carnê, boleto, saldo e etiquetas como documentos/comandos distintos.

## Answer

### Fronteira documental

- `DECISÃO NOVA` — a barra do Cadastro expõe **Imprimir** e **Enviar contrato por e-mail** para o Contrato persistido. O primeiro abre o diálogo documental compartilhado; o segundo abre `DocumentEmailModal`. Ambos recebem `document_type=contrato`, número, revision persistida, situação, Filial e capabilities calculadas pelo servidor.
- `DECISÃO NOVA` — Contrato completo, meia página, carnê, boleto, saldo e etiquetas são documentos/comandos distintos. A proximidade no mesmo diálogo não cria uma transação ou serviço único.
- `DECISÃO NOVA` — nenhuma saída grava o Contrato nem altera sua revision. Com alterações locais não salvas, os comandos ficam bloqueados e explicam “grave o Contrato antes de gerar/enviar”; não será produzido documento silenciosamente a partir de uma fotografia anterior.
- `DECISÃO NOVA` — impressão/PDF e e-mail são efeitos pós-persistência e idempotentes. Falha de renderização, fila ou site não reverte Contrato, faturamento ou documento fiscal.

## PDF do Contrato

### Evidência Delphi e Laravel

- `CONFIRMADO` — o Delphi reúne contrato completo/meia página, fotos, carnê, carnê em aberto, boleto/e-mail de boleto, saldo e etiquetas em um modal: `delphi/apps/vendas/fmcadastrocontratos.pas:1957-2009`; os controles estão em `delphi/repositorio/fmconfirmarimpressaonocontrato.dfm:80-261`.
- `CONFIRMADO` — `SoImprimirFaturados` controla a disponibilidade do Contrato em `fmcadastrocontratos.pas:1966-1975`; a opção de fotos é repassada às variantes completa e meia página em `:1985-1989`.
- `CONFIRMADO` — o Laravel já implementa variantes `full/meia`, flag de foto, HTML/PDF e preparação compartilhada em `ContratoClienteImpressaoOrchestrator.php:35-69,153-188` e `ContratoImpressaoService.php:47-135`.
- `CONFIRMADO` — o diálogo Laravel já representa contrato, meia página, foto, carnê, parcelas, saldo, boleto/e-mail e etiquetas em `ContratoClienteImpressaoDialog.tsx:26-74,243-326`.
- `DIVERGENTE` — no orquestrador, somente `contrato` e `contrato_meia_pagina` integram `ACOES_IMPLEMENTADAS`; as demais retornam “Documento ainda não implementado” (`ContratoClienteImpressaoOrchestrator.php:15-24,159-164`).

### Policy e preparação

- `DECISÃO NOVA` — centralizar elegibilidade em `ContratoDocumentPolicy`; UI, preparação do PDF e adapter de e-mail consultam a mesma decisão. Não inferir permissão pelo checkbox visível.
- `DECISÃO NOVA` — quando `SoImprimirFaturados=true`, somente situações `F`, `P` ou `N` podem gerar ou enviar o Contrato, conforme confirmação do usuário. `O`, `R` e `C` são inelegíveis.
- `DECISÃO NOVA` — quando o parâmetro estiver inativo, o PDF pode representar Contratos persistidos `O/R/F/P/N`; `C` permanece disponível apenas para consulta histórica com identificação visual inequívoca de cancelado e não pode ser enviado como proposta vigente.
- `DECISÃO NOVA` — capabilities mínimas: `documents.contract.view`, `documents.contract.generatePdf` e `documents.contract.email`. Variante/fotos não criam permissões separadas, mas podem ser ocultadas por disponibilidade técnica.
- `DECISÃO NOVA` — a preparação recebe número, revision esperada, variante `full|half` e `includeProductPhotos`. O backend revalida situação/parâmetro e monta o view model autoritativo; Cliente, produtos, serviços, parcelas e totais nunca vêm do navegador.
- `DECISÃO NOVA` — contrato completo e meia página são alternativas mutuamente exclusivas numa execução. “Fotos dos produtos” inicia desmarcado, aplica-se às duas variantes e inclui somente fotos de Produtos, nunca Serviços.
- `DECISÃO NOVA` — o contexto temporário deve vincular usuário, Contrato, revision e opções, expirar e impedir acesso cruzado. Se a revision mudar entre preparar e renderizar, exigir nova preparação em vez de misturar fotografias.
- `POSSÍVEL BUG LEGADO` — o Delphi baseia `SoImprimirFaturados` em comparação ordinal de situação (`fmcadastrocontratos.pas:1966-1972`), que pode liberar estados posteriores sem semântica explícita. O Laravel usa conjunto nominal `F/P/N`.
- `DECISÃO NOVA` — FastReport/matricial e reprodução pixel a pixel não são requisitos. PDF/HTML Laravel é a saída canônica.

## Carnê, boleto, saldo e etiquetas

| Documento/comando | Contexto | Regra |
|---|---|---|
| Carnê | Contrato + seleção de parcelas | somente parcelas elegíveis; gera documento financeiro próprio |
| Carnê em aberto | Contrato + parcelas ainda abertas | seleção reconstruída no servidor |
| Boleto | parcela(s)/título(s) | depende de carteira, conta, situação e autorização financeira |
| E-mail de boleto | boleto já gerado | comando financeiro distinto do e-mail geral do Contrato |
| Saldo | Cliente/Contrato + data-base | reutiliza cálculo da Ficha Financeira |
| Etiquetas de casamento | vínculo/lista elegível | comando especializado, exibido apenas quando aplicável |

- `DECISÃO NOVA` — o Cadastro pode hospedar atalhos para esses comandos, mas não os implementa dentro de `ContratoImpressaoService`. Cada um tem policy, request, idempotência e resultado próprios.
- `CONFIRMADO` — a policy atual já separa `sendBoletoEmail` e exige feature flag em `ContratoClienteImpressaoPolicy.php:27-33`.
- `DECISÃO NOVA` — opções não implementadas não aparecerão como checkboxes que falham depois do clique. O diálogo recebe capabilities/availability por documento e renderiza somente operações funcionais.
- `DECISÃO NOVA` — múltiplos documentos selecionados podem ser preparados em lote, mas cada resultado mostra sucesso/falha separadamente; falha de boleto não invalida PDF do Contrato já preparado.

## Relatórios da Consulta

- `CONFIRMADO` — a Consulta Laravel já possui relatórios de produtos por localização e relação de Contratos, com fotos opcionais e seleção derivada da pesquisa: `ConsultaContratosImpressaoService.php:34-51,139-279` e `ConsultaContratosImpressaoDialog.tsx:25-167`.
- `DECISÃO NOVA` — relatórios operacionais e em lote permanecem na Consulta. O Cadastro não duplica filtros, SQL, exportação ou layouts.
- `DECISÃO NOVA` — “Abrir relatórios” navega para Consulta de Contratos com filtro exato pelo número atual e preserva retorno ao Cadastro. A Consulta revalida acesso e permite ampliar/remover o filtro conscientemente.
- `DECISÃO NOVA` — imprimir o PDF individual usa `ContratoImpressaoService`; gerar relação/localização usa `ConsultaContratosImpressaoService`. Não haverá endpoint híbrido.

## E-mail geral do Contrato

### Evidência e adapter

- `CONFIRMADO` — o Delphi habilita o envio somente com Contrato gravado e até `F`, exige `AutorizacaoAnalistaCredito` e monta HTML com cabeçalho, produtos e serviços: `fmcadastrocontratos.pas:944,3122-3151` e `dmbasico.pas:12008-12044`.
- `CONFIRMADO` — o engine Laravel já define autorização, elegibilidade, Filial, modo, destinatários, defaults, campos editáveis, composição, Atendimento e suporte a outbox em `DocumentEmailDocumentAdapterInterface.php:12-63`.
- `CONFIRMADO` — `DocumentEmailEngine` já fornece contexto, preview, revalidação, submit e status; entrega Laravel enfileira após commit e entrega Site registra solicitação idempotente. Evidências: `DocumentEmailEngine.php:38-228`, `LaravelDocumentEmailDelivery.php:83-121` e `SiteDocumentEmailDelivery.php:34-135`.
- `DIVERGENTE` — há `OrcamentoDocumentEmailAdapter`, mas não adapter real de Contrato; somente adapter fake de teste foi localizado.
- `DECISÃO NOVA` — criar `ContratoDocumentEmailAdapter` com `type=contrato`, número como id, Filial de venda/origem, mesma policy documental e composição HTML autoritativa do Contrato. Reutilizar engine, modal, normalização, fila, idempotência e status; não criar fluxo de e-mail paralelo.

### Destinatários e composição

- `DECISÃO NOVA` — sugerir o e-mail da fotografia do Contrato e os e-mails dos Contatos documentais do próprio Contrato, deduplicados e normalizados. Nunca sugerir automaticamente o e-mail do Usuário logado.
- `DECISÃO NOVA` — flags `enviar_nfe` e `enviar_boleto` servem somente aos respectivos documentos; não incluem o contato no e-mail geral do Contrato.
- `DECISÃO NOVA` — permitir múltiplos destinatários; qualquer endereço inválido rejeita a solicitação inteira. O backend revalida a lista e não expõe destinatários indevidamente entre mensagens.
- `DECISÃO NOVA` — assunto padrão `Contrato <numero>`; introdução, referência e conclusão seguem o engine e os textos finais parametrizados. Preview é gerado do mesmo HTML autoritativo usado pelo modo Laravel.
- `CONFIRMADO` — o Delphi envia o Contrato como corpo HTML, não como PDF: o handler chama `MontarOrcamento(..., ContratosEmail)` em `fmcadastrocontratos.pas:3146-3149`.
- `DECISÃO NOVA` — o e-mail geral continua HTML, sem PDF, fotos ou outros anexos. Enviar PDF/boleto é outro comando.
- `DECISÃO NOVA` — `SoImprimirFaturados` também rege `assertEligible` do adapter, conforme decisão do usuário: ativo permite somente `F/P/N`; inativo permite proposta persistida em `O/R/F/P/N`. `C` nunca é enviado.

### Dois modos de entrega

- `CONFIRMADO` — o adapter de Orçamento resolve `Usa itecLUX` pela Filial e escolhe `Site|Laravel`: `OrcamentoDocumentEmailAdapter.php:69-84`.
- `CONFIRMADO` — no Delphi inspecionado, o desvio iTecLUX é restrito a `OrcamentoEmail`; Contrato segue SMTP (`fmenviaremail.pas:161-165`). Não foi localizada tabela `email_contrato`.
- `DECISÃO NOVA` — por confirmação do usuário, o Contrato adotará a regra nova comum: consultar `UsaitecLUX` na Filial efetiva. Ativo usa modo Site; inativo usa modo Laravel.
- `DECISÃO NOVA` — modo Laravel: enfileirar mensagens após commit, uma entrega privada por destinatário, com estados `issued/queued/sent/failed`, tentativas e status consultável. Não enviar sincronamente.
- `DECISÃO NOVA` — modo Site: validar e inserir exatamente uma solicitação idempotente no outbox suportado pelo consumidor do site; não enfileirar e-mail Laravel e responder “envio solicitado”, nunca “enviado”.
- `NÃO LOCALIZADO` — não existe hoje outbox físico/consumer de Contrato equivalente a `email_orcamento`. O spec deve criar/confirmar um contrato de integração próprio ou genérico com o site. É proibido gravar Contrato em `email_orcamento` sem suporte explícito do consumidor.
- `DECISÃO NOVA` — se o modo configurado estiver indisponível, falhar com diagnóstico e permitir retry após correção; não fazer fallback Site→Laravel ou Laravel→Site.
- `DECISÃO NOVA` — campos de composição seguem a estratégia já existente: no modo Laravel são editáveis conforme policy; no modo Site, somente os campos realmente consumidos pelo outbox podem ser editados e a UI avisa que o modelo final é produzido pelo site.

### Auditoria e concorrência

- `DECISÃO NOVA` — idempotency key pertence à solicitação, não ao botão. Duplo submit retorna o mesmo estado e não duplica fila/outbox.
- `DECISÃO NOVA` — registrar evento vinculado ao Contrato para solicitação, enfileiramento, confirmação do site/resultado quando disponível e falha definitiva; destinatários ficam protegidos conforme policy de auditoria.
- `DECISÃO NOVA` — o HTML é reconstruído no submit com dados autoritativos. Mudança de revision entre abertura e envio exige atualizar preview/confirmar novamente.
- `DECISÃO NOVA` — a autorização sensível/analista exigida pelo domínio é revalidada no submit e registrada como autoria efetiva, nunca representada apenas pela habilitação do botão.

## Matriz de reutilização

| Capacidade | Componente/engine | Integração do Cadastro |
|---|---|---|
| PDF individual | `ContratoImpressaoService` + diálogo existente | contexto `cadastro-contratos`, revision e policy |
| Relatórios | `ConsultaContratosImpressaoService` | abrir Consulta filtrada |
| E-mail | `DocumentEmailEngine` + modal | adapter `contrato` e outbox Site |
| Carnê/boleto/saldo/etiqueta | serviços documentais/financeiros próprios | atalhos condicionais, sem incorporar no PDF |

## Spec boundary

Esta fatia comporta dois `$to-spec`:

1. **Integrar impressão e saídas documentais ao Cadastro de Contratos** — policy por situação/parâmetro, diálogo, revision, PDF completo/meia página/fotos e roteamento dos comandos separados.
2. **Implementar adapter de e-mail do Contrato** — elegibilidade, destinatários, composição, preview, modos Laravel/Site, outbox, fila, idempotência, status e auditoria.

Relatórios da Consulta não precisam de engine/spec novo; entram no primeiro spec apenas como navegação filtrada. O segundo spec deve tratar a criação/adequação do outbox de Contrato e sua compatibilidade com o consumidor do site como requisito bloqueante do modo iTecLUX.
