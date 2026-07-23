# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **Impressão e saídas documentais** do Cadastro de Contratos — Etapa 7 (Capacidades transversais), terceiro dos quatro specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`).

O PDF do Contrato (completo e meia página) **já está implementado e funcionando** — este spec integra o diálogo/serviço existentes ao Cadastro (contexto, `revision`, policy), não os reconstrói. Carnê, boleto, saldo e etiquetas continuam **fora** de `ContratoImpressaoService`: o Cadastro no máximo hospeda atalhos condicionais para eles, cada um com sua própria policy/request/idempotência. Relatórios (produtos por localização, relação de Contratos) permanecem inteiramente na Consulta de Contratos — o Cadastro apenas navega até lá com filtro.

Não implemente nesta etapa: o adapter de e-mail do Contrato (`16-speckit-prompt.md`, spec seguinte desta etapa); qualquer engine novo de carnê/boleto/saldo/etiqueta; qualquer duplicação de filtro/SQL/exportação da Consulta. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real do PDF já implementado; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- os comandos **Imprimir** e (elegibilidade compartilhada com) **Enviar por e-mail** na barra do Cadastro, disponíveis só para Contrato persistido, recebendo `document_type=contrato`, número, `revision` persistida, situação, Filial e capabilities calculadas pelo servidor;
- a política centralizada `ContratoDocumentPolicy` (nova, consultada pela UI, pela preparação do PDF e — no spec 16 — pelo adapter de e-mail): quando `SoImprimirFaturados=true`, só `F/P/N` geram/enviam o Contrato; quando falso, `O/R/F/P/N` são elegíveis e `C` fica disponível só para consulta histórica com identificação visual inequívoca de cancelado, nunca como proposta vigente ou envio;
- integração do diálogo/serviço de impressão **já existentes** (`ContratoClienteImpressaoOrchestrator`, `ContratoImpressaoService`, `ContratoClienteImpressaoDialog.tsx`) ao contexto do Cadastro: variantes completa/meia página mutuamente exclusivas, "fotos dos produtos" desmarcada por padrão e aplicável às duas variantes (nunca a Serviços), preparação recebendo número/`revision` esperada/variante/`includeProductPhotos` — Cliente, produtos, serviços, parcelas e totais nunca vêm do navegador;
- o contexto temporário de preparação vinculado a usuário/Contrato/`revision`/opções, com expiração e sem acesso cruzado; `revision` divergente entre preparar e renderizar exige nova preparação;
- capabilities mínimas `documents.contract.view`/`documents.contract.generatePdf` (mais `documents.contract.email`, reservada ao spec 16); variante/fotos não criam permissões separadas, apenas disponibilidade técnica;
- atalhos condicionais (sem implementar) para Carnê, Carnê em aberto, Boleto, E-mail de boleto, Saldo e Etiquetas — cada documento aparece só quando funcional (capabilities/availability por documento, nunca checkbox que falha após o clique); seleção em lote mostra sucesso/falha por documento, sem que a falha de um invalide os demais já preparados;
- a navegação **"Abrir relatórios"**: leva à Consulta de Contratos filtrada pelo número atual, preservando retorno ao Cadastro; a Consulta revalida acesso e permite ampliar/remover o filtro conscientemente — nenhum SQL/exportação/layout de relatório é duplicado no Cadastro;
- a regra de que nenhuma saída documental grava o Contrato nem altera sua `revision`; com alterações locais não salvas, os comandos ficam bloqueados com mensagem explícita ("grave o Contrato antes de gerar/enviar").

Não inclua: adapter de e-mail (spec 16); implementação de Carnê/Carnê em aberto/Boleto/E-mail de boleto/Saldo/Etiquetas — apenas atalhos condicionais para comandos que já existem ou existirão em specs próprios; qualquer filtro, SQL, exportação ou layout de relatório (permanece na Consulta); FastReport/matricial ou reprodução pixel a pixel do Delphi.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `fmconfirmarimpressaonocontrato.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual — especialmente o que `ContratoClienteImpressaoOrchestrator` já implementa — e construa a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Services\Vendas\ContratoClienteImpressaoOrchestrator` — **já implementa** `full`/`meia` página, flag de foto, preparação compartilhada; confirme a constante `ACOES_IMPLEMENTADAS` no código atual (na extração desta evidência, continha só `contrato`/`contrato_meia_pagina`) antes de assumir que carnê/boleto/saldo/etiquetas já funcionam — se algo mudou, trate como achado divergente.
- `App\Services\Vendas\ContratoImpressaoService` — preparação/HTML/PDF já implementados; reaproveite tal como está, não recrie o pipeline de renderização.
- `resources/js/.../ContratoClienteImpressaoDialog.tsx` — diálogo já representa contrato, meia página, foto, carnê, parcelas, saldo, boleto/e-mail e etiquetas; confirme quais checkboxes já são funcionais versus decorativos antes de decidir o que ocultar por `availability`.
- `App\Policies\ContratoClienteImpressaoPolicy` — já separa `sendBoletoEmail` sob feature flag; reaproveite o mesmo mecanismo de policy para as novas capabilities de documento, não crie uma policy paralela.
- `App\Services\Vendas\ConsultaContratosImpressaoService` e `ConsultaContratosImpressaoDialog.tsx` — relatórios de produtos por localização e relação de Contratos já existem e já suportam fotos opcionais/seleção derivada; o Cadastro só precisa do link filtrado, não de uma nova implementação.
- Shell/capabilities da Fundação (`01-speckit-prompt.md`) — reaproveite a mesma disciplina de `revision`/bloqueio por alterações não salvas já definida ali; este spec não inventa uma segunda noção de "rascunho sujo".

## Evidência Delphi confirmada

### Fronteira documental

- `DECISÃO NOVA` — a barra do Cadastro expõe Imprimir e Enviar contrato por e-mail para o Contrato persistido; ambos recebem `document_type=contrato`, número, `revision` persistida, situação, Filial e capabilities calculadas pelo servidor.
- `DECISÃO NOVA` — Contrato completo, meia página, carnê, boleto, saldo e etiquetas são documentos/comandos distintos; a proximidade no mesmo diálogo não cria uma transação ou serviço único.
- `DECISÃO NOVA` — nenhuma saída grava o Contrato nem altera sua `revision`; com alterações locais não salvas, os comandos ficam bloqueados.
- `DECISÃO NOVA` — impressão/PDF são efeitos pós-persistência e idempotentes; falha de renderização/fila/site não reverte Contrato, faturamento ou documento fiscal.

### PDF do Contrato

- `CONFIRMADO` — o Delphi reúne contrato completo/meia página, fotos, carnê, carnê em aberto, boleto/e-mail de boleto, saldo e etiquetas em um modal. Evidências: `fmcadastrocontratos.pas:1957-2009`; `fmconfirmarimpressaonocontrato.dfm:80-261`.
- `CONFIRMADO` — `SoImprimirFaturados` controla a disponibilidade do Contrato (`fmcadastrocontratos.pas:1966-1975`); a opção de fotos é repassada às variantes completa e meia página (`:1985-1989`).
- `POSSÍVEL BUG LEGADO` — o Delphi baseia `SoImprimirFaturados` em comparação ordinal de situação, podendo liberar estados posteriores sem semântica explícita; o Laravel usa conjunto nominal `F/P/N` — **preservar o conjunto nominal, não a comparação ordinal**.
- `DECISÃO NOVA` — FastReport/matricial e reprodução pixel a pixel não são requisitos; PDF/HTML Laravel é a saída canônica.

### Carnê, boleto, saldo e etiquetas

| Documento/comando | Contexto | Regra |
|---|---|---|
| Carnê | Contrato + seleção de parcelas | somente parcelas elegíveis; gera documento financeiro próprio |
| Carnê em aberto | Contrato + parcelas ainda abertas | seleção reconstruída no servidor |
| Boleto | parcela(s)/título(s) | depende de carteira, conta, situação e autorização financeira |
| E-mail de boleto | boleto já gerado | comando financeiro distinto do e-mail geral do Contrato |
| Saldo | Cliente/Contrato + data-base | reutiliza cálculo da Ficha Financeira |
| Etiquetas de casamento | vínculo/lista elegível | comando especializado, exibido apenas quando aplicável |

- `DECISÃO NOVA` — o Cadastro pode hospedar atalhos para esses comandos, mas não os implementa dentro de `ContratoImpressaoService`; cada um tem policy, request, idempotência e resultado próprios.
- `DECISÃO NOVA` — opções não implementadas não aparecem como checkboxes que falham depois do clique; o diálogo recebe capabilities/availability por documento.
- `DECISÃO NOVA` — múltiplos documentos selecionados podem ser preparados em lote, mas cada resultado mostra sucesso/falha separadamente; falha de um não invalida os demais já preparados.

### Relatórios da Consulta

- `CONFIRMADO` — a Consulta já possui relatórios de produtos por localização e relação de Contratos, com fotos opcionais e seleção derivada da pesquisa.
- `DECISÃO NOVA` — relatórios operacionais e em lote permanecem na Consulta; o Cadastro não duplica filtros, SQL, exportação ou layouts.
- `DECISÃO NOVA` — "Abrir relatórios" navega para a Consulta com filtro exato pelo número atual e preserva retorno ao Cadastro; a Consulta revalida acesso.
- `DECISÃO NOVA` — imprimir o PDF individual usa `ContratoImpressaoService`; gerar relação/localização usa `ConsultaContratosImpressaoService`. Não haverá endpoint híbrido.

## Estado Laravel confirmado

- PDF completo e meia página do Contrato já funcionam (preparação, HTML/PDF, diálogo); as demais opções do mesmo diálogo (carnê, boleto, saldo, etiquetas) estão representadas na UI mas não implementadas no orquestrador.
- `ContratoClienteImpressaoPolicy` já existe e já trata `sendBoletoEmail` sob feature flag — precedente direto para as novas capabilities de documento.
- Relatórios da Consulta (produtos por localização, relação de Contratos) já existem e não precisam de mudança; falta apenas o link filtrado a partir do Cadastro.
- Nenhuma integração do diálogo de impressão com o shell do Cadastro de Contratos existe hoje (contexto/`revision`/policy específicos do Cadastro).

## Decisões obrigatórias

1. `ContratoDocumentPolicy` é a única fonte de elegibilidade documental; UI, preparação de PDF e (no spec 16) adapter de e-mail consultam a mesma decisão — nunca inferida pelo checkbox visível.
2. `SoImprimirFaturados=true` restringe geração/envio do Contrato a `F/P/N`; inativo permite `O/R/F/P/N`, com `C` disponível só para consulta histórica identificada visualmente, nunca como proposta vigente.
3. A regra usa conjunto nominal (`F/P/N`), nunca comparação ordinal de situação — a ambiguidade do Delphi não é reproduzida.
4. Contrato completo e meia página são mutuamente exclusivos numa execução; fotos dos produtos inicia desmarcada, aplica-se às duas variantes e nunca inclui Serviços.
5. A preparação sempre revalida situação/parâmetro no servidor e monta o view model autoritativo; nenhum dado comercial vem do navegador.
6. O contexto temporário de preparação expira, é vinculado a usuário/Contrato/`revision`/opções e nunca permite acesso cruzado; `revision` divergente entre preparar e renderizar exige nova preparação.
7. Nenhuma saída documental grava o Contrato ou altera sua `revision`; alterações locais não salvas bloqueiam os comandos com mensagem explícita.
8. Carnê/boleto/saldo/etiquetas continuam fora de `ContratoImpressaoService`; o Cadastro só hospeda atalhos condicionais, cada um com sua própria policy/idempotência/resultado, exibidos apenas quando funcionais.
9. Preparação em lote reporta sucesso/falha por documento; falha de um não invalida os demais.
10. Relatórios continuam exclusivamente na Consulta; o Cadastro só navega com filtro, nunca duplica SQL/exportação/layout.
11. Impressão é efeito pós-persistência e idempotente; falha de renderização/fila não reverte Contrato, faturamento ou documento fiscal.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações já fixada na Fundação; `documents.contract.view`/`generatePdf` seguem a mesma precedência (regra de estado → Permissão → Parâmetro → prova sensível quando aplicável).
- `ContratoClienteImpressaoPolicy` é estendida, não substituída; feature flags existentes (ex.: `sendBoletoEmail`) continuam válidas para os atalhos condicionais.

## Testes obrigatórios

1. `ContratoDocumentPolicy`: matriz completa de `SoImprimirFaturados` ativo/inativo × situação (`O/R/F/P/N/C`), incluindo a identificação visual de `C` e o bloqueio de envio para `C`.
2. Preparação de PDF: número/`revision`/variante/`includeProductPhotos` revalidados no servidor; payload manipulado no frontend não altera Cliente/produtos/totais.
3. Contexto temporário: expira, rejeita acesso cruzado entre usuários/Contratos, exige nova preparação quando a `revision` muda entre preparar e renderizar.
4. Bloqueio por rascunho sujo: com alterações locais não salvas, Imprimir/Enviar ficam indisponíveis com mensagem explícita.
5. Atalhos condicionais: cada documento aparece só quando `availability` permite; nenhum checkbox falha após o clique; lote reporta sucesso/falha por documento sem invalidar os demais.
6. "Abrir relatórios": navega para a Consulta com o filtro correto pelo número atual e preserva retorno; nenhuma duplicação de query/layout no Cadastro.
7. Regressão: PDF completo/meia página continuam funcionando exatamente como antes da integração ao Cadastro.

Prefira Feature tests nos endpoints/policy reais; reutilize os testes existentes de `ContratoClienteImpressaoOrchestrator`/`ContratoImpressaoService` como base de regressão.

## Entregáveis

- Contrato de `ContratoDocumentPolicy` (entrada/saída, matriz de elegibilidade por parâmetro/situação).
- Contrato de integração do diálogo/preparação de PDF ao contexto do Cadastro (revision, contexto temporário, capabilities).
- Matriz de evidência Delphi × Laravel, deixando explícito o que já funciona (PDF) e o que é atalho condicional (carnê/boleto/saldo/etiquetas).
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- adapter de e-mail do Contrato (spec 16);
- implementação de Carnê/Carnê em aberto/Boleto/E-mail de boleto/Saldo/Etiquetas;
- qualquer filtro, SQL, exportação ou layout de relatório da Consulta;
- FastReport/matricial ou reprodução pixel a pixel do Delphi;
- alterar o schema Delphi.
```
