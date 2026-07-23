# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para o **adapter de e-mail do Contrato** — Etapa 7 (Capacidades transversais), quarto e último spec dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`) e a política documental (`15-speckit-prompt.md`), cuja `ContratoDocumentPolicy` este adapter reaproveita para elegibilidade.

O motor de e-mail (`DocumentEmailEngine`) já é genérico e completo — contexto, preview, revalidação, submit, status, fila Laravel e outbox Site — e já tem um adapter real (`OrcamentoDocumentEmailAdapter`). Este spec cria o adapter irmão para Contrato, **não um motor novo**. O ponto que exige decisão de verdade é o modo Site: não existe hoje nenhum outbox físico de Contrato equivalente a `email_orcamento`, e gravar ali sem suporte do consumidor é uma ação explicitamente proibida pela evidência — resolver isso é o núcleo real deste spec.

Não implemente nesta etapa: impressão/PDF (já coberto pelo spec 15); carnê, boleto, e-mail de boleto, saldo ou etiquetas (comandos financeiros/documentais distintos, fora deste adapter); qualquer motor de e-mail novo ou paralelo ao `DocumentEmailEngine`. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real do engine e do adapter de Orçamento; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- `ContratoDocumentEmailAdapter` (`type=contrato`), implementando `DocumentEmailDocumentAdapterInterface` sobre o `DocumentEmailEngine` genérico já existente — identidade pelo número do Contrato, Filial de venda/origem, elegibilidade delegada à `ContratoDocumentPolicy` do spec 15 (`SoImprimirFaturados` ativo restringe a `F/P/N`; inativo permite `O/R/F/P/N`; `C` nunca é enviado);
- **destinatários e composição**: sugestão automática do e-mail da fotografia do Contrato e dos e-mails dos Contatos documentais do próprio Contrato (spec 13), deduplicados e normalizados — nunca o e-mail do usuário logado; múltiplos destinatários permitidos, qualquer endereço inválido rejeita a solicitação inteira; assunto padrão `Contrato <numero>`; corpo é sempre HTML (nunca PDF/foto/anexo), reconstruído no submit a partir de dados autoritativos — mudança de `revision` entre abertura e envio exige atualizar preview/confirmar de novo;
- **dois modos de entrega**, resolvidos por `UsaitecLUX` na Filial efetiva (mesma regra já usada pelo Orçamento): modo Site insere exatamente uma solicitação idempotente no outbox suportado pelo consumidor do site (nunca "enviado", sempre "envio solicitado"); modo Laravel enfileira após commit, uma entrega privada por destinatário, com estados `issued/queued/sent/failed` e status consultável; sem fallback entre os dois modos — modo indisponível falha com diagnóstico e permite retry após correção;
- a **decisão e o desenho do outbox de Contrato**: como não existe hoje nenhuma tabela/consumidor equivalente a `email_orcamento` para Contrato, este spec cria ou confirma um contrato de integração próprio ou genérico com o site — nunca grava Contrato em `email_orcamento` sem suporte explícito do consumidor;
- idempotency key pertencente à solicitação (não ao botão): duplo submit retorna o mesmo estado, sem duplicar fila/outbox;
- auditoria: evento vinculado ao Contrato para solicitação, enfileiramento, confirmação do site/resultado (quando disponível) e falha definitiva, com destinatários protegidos conforme policy de auditoria;
- revalidação, no submit, de qualquer autorização sensível/analista exigida pelo domínio — nunca representada apenas pela habilitação do botão.

Não inclua: impressão/PDF (spec 15); carnê, boleto, e-mail de boleto, saldo, etiquetas; qualquer alteração no `DocumentEmailEngine` genérico, no modal, na normalização, na fila Laravel ou no `LaravelDocumentEmailDelivery`/`SiteDocumentEmailDelivery` além do necessário para o novo adapter; envio de PDF, fotos ou anexos pelo e-mail geral do Contrato (é sempre HTML puro).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm`, `dmbasico.pas` e `fmenviaremail.pas`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual do engine/adapter existentes e construa a matriz de lacunas, especialmente em torno do outbox de Contrato.

## Investigação Laravel obrigatória

- `App\Domain\Shared\DocumentEmail\DocumentEmailDocumentAdapterInterface` — contrato completo já definido: `type`, `supports`, `assertReadable`, `authorizeSend`, `assertEligible`, `resolveFilialCodigo`, `resolveDeliveryMode`, `suggestedRecipients`, `defaultComposition`, `editableFields`, `authoritativeCompositionData`, `composeHtml`, `recordAttendance`, `siteOutboxSupported`, `documentLabel`. Implemente cada método para Contrato; não invente uma interface paralela.
- `App\Application\Shared\DocumentEmail\DocumentEmailEngine` — já fornece contexto, preview, revalidação, submit e status; reaproveite integralmente, sem reimplementar fila/idempotência/estado.
- `App\Infrastructure\Persistence\Legacy\Vendas\DocumentEmail\OrcamentoDocumentEmailAdapter` — único adapter real existente hoje; use-o como precedente estrutural direto, incluindo como ele resolve `UsaitecLUX` por Filial para escolher `Site|Laravel` (linhas equivalentes a `:69-84` na extração original).
- `LaravelDocumentEmailDelivery`/`SiteDocumentEmailDelivery` — implementações dos dois modos de entrega já existentes e genéricas; o adapter de Contrato as consome via `resolveDeliveryMode`/`siteOutboxSupported`, não as reimplementa.
- **Investigação obrigatória e bloqueante**: busque por qualquer tabela/outbox de Contrato equivalente a `email_orcamento` (usada pelo modo Site do Orçamento). Se nada existir — confirme antes de prosseguir — decida e documente se o spec cria uma tabela/outbox própria de Contrato ou reaproveita um mecanismo genérico já compatível com o consumidor do site; é proibido gravar em `email_orcamento` sem suporte explícito confirmado desse consumidor.
- `ContratoDocumentPolicy` (spec 15) — fonte única de elegibilidade (`SoImprimirFaturados`); o adapter consulta a mesma decisão em `assertEligible`, nunca uma regra paralela.
- Contatos documentais do Contrato (spec 13) — fonte dos e-mails sugeridos além da fotografia do próprio Contrato; reaproveite a persistência já definida ali, não crie uma segunda leitura de contato.
- `App\Support\Vendas\ContratoCadastroParameterManifest` (Fundação) — reaproveite para ler `UsaitecLUX`/`SoImprimirFaturados` pela mesma infraestrutura de parâmetros já usada pelas demais fatias, não uma leitura direta paralela.

## Evidência Delphi confirmada

### E-mail geral do Contrato

- `CONFIRMADO` — o Delphi habilita o envio somente com Contrato gravado e até `F`, exige `AutorizacaoAnalistaCredito` e monta HTML com cabeçalho, produtos e serviços. Evidências: `fmcadastrocontratos.pas:944,3122-3151`; `dmbasico.pas:12008-12044`.
- `CONFIRMADO` — o Delphi envia o Contrato como corpo HTML, não como PDF: o handler chama `MontarOrcamento(..., ContratosEmail)` (`fmcadastrocontratos.pas:3146-3149`).
- `DECISÃO NOVA` — o e-mail geral continua HTML, sem PDF, fotos ou outros anexos; enviar PDF/boleto é outro comando (fora deste spec).
- `DECISÃO NOVA` — `SoImprimirFaturados` também rege `assertEligible` do adapter: ativo permite só `F/P/N`; inativo permite proposta persistida em `O/R/F/P/N`; `C` nunca é enviado.

### Destinatários e composição

- `DECISÃO NOVA` — sugerir o e-mail da fotografia do Contrato e os e-mails dos Contatos documentais do próprio Contrato, deduplicados e normalizados; nunca sugerir automaticamente o e-mail do Usuário logado.
- `DECISÃO NOVA` — flags `enviar_nfe` e `enviar_boleto` servem só aos respectivos documentos; não incluem o contato no e-mail geral do Contrato.
- `DECISÃO NOVA` — múltiplos destinatários permitidos; qualquer endereço inválido rejeita a solicitação inteira; o backend revalida a lista e não expõe destinatários indevidamente entre mensagens.
- `DECISÃO NOVA` — assunto padrão `Contrato <numero>`; introdução, referência e conclusão seguem o engine e os textos finais parametrizados; preview é gerado do mesmo HTML autoritativo usado pelo modo Laravel.

### Dois modos de entrega

- `CONFIRMADO` — o adapter de Orçamento resolve `Usa itecLUX` pela Filial e escolhe `Site|Laravel`.
- `CONFIRMADO` — no Delphi, o desvio iTecLUX é restrito a `OrcamentoEmail`; Contrato segue SMTP (`fmenviaremail.pas:161-165`). Não foi localizada tabela `email_contrato`.
- `DECISÃO NOVA` — o Contrato adota a regra nova comum: consultar `UsaitecLUX` na Filial efetiva; ativo usa modo Site, inativo usa modo Laravel.
- `DECISÃO NOVA` — modo Laravel enfileira mensagens após commit, uma entrega privada por destinatário, com estados `issued/queued/sent/failed`, tentativas e status consultável; nunca envio síncrono.
- `DECISÃO NOVA` — modo Site valida e insere exatamente uma solicitação idempotente no outbox suportado pelo consumidor do site; não enfileira e-mail Laravel; responde "envio solicitado", nunca "enviado".
- `NÃO LOCALIZADO` — não existe outbox físico/consumer de Contrato equivalente a `email_orcamento`; o spec cria/confirma um contrato de integração próprio ou genérico — proibido gravar em `email_orcamento` sem suporte explícito do consumidor.
- `DECISÃO NOVA` — se o modo configurado estiver indisponível, falha com diagnóstico e permite retry após correção; nunca fallback Site→Laravel ou Laravel→Site.
- `DECISÃO NOVA` — campos de composição seguem a estratégia já existente: no modo Laravel são editáveis conforme policy; no modo Site, só os campos realmente consumidos pelo outbox podem ser editados, e a UI avisa que o modelo final é produzido pelo site.

### Auditoria e concorrência

- `DECISÃO NOVA` — idempotency key pertence à solicitação, não ao botão; duplo submit retorna o mesmo estado, sem duplicar fila/outbox.
- `DECISÃO NOVA` — registrar evento vinculado ao Contrato para solicitação, enfileiramento, confirmação do site/resultado quando disponível, e falha definitiva; destinatários protegidos conforme policy de auditoria.
- `DECISÃO NOVA` — o HTML é reconstruído no submit com dados autoritativos; mudança de `revision` entre abertura e envio exige atualizar preview/confirmar novamente.
- `DECISÃO NOVA` — autorização sensível/analista exigida pelo domínio é revalidada no submit e registrada como autoria efetiva, nunca representada apenas pela habilitação do botão.

## Estado Laravel confirmado

- `DocumentEmailEngine` genérico e um único adapter real (`OrcamentoDocumentEmailAdapter`) já existem, cobrindo contexto/preview/revalidação/submit/status e os dois modos de entrega; só falta o adapter de Contrato.
- Existe apenas um adapter fake de teste para Contrato — nenhuma implementação real.
- Nenhum outbox de Contrato equivalente a `email_orcamento` foi localizado; este é o gap bloqueante do modo Site.
- `ContratoDocumentPolicy` (spec 15) e Contatos documentais do Contrato (spec 13) são pré-requisitos diretos deste adapter.

## Decisões obrigatórias

1. `ContratoDocumentEmailAdapter` implementa a interface genérica existente sem alterá-la; reaproveita `DocumentEmailEngine`, modal, normalização, fila e status já prontos — nenhum fluxo de e-mail paralelo.
2. Elegibilidade do adapter delega inteiramente a `ContratoDocumentPolicy`; `SoImprimirFaturados` ativo restringe a `F/P/N`, inativo permite `O/R/F/P/N`, `C` nunca é elegível.
3. Destinatários sugeridos vêm da fotografia do Contrato e dos Contatos documentais do próprio Contrato, deduplicados/normalizados; nunca o e-mail do usuário logado; endereço inválido em qualquer posição rejeita a solicitação inteira.
4. O corpo é sempre HTML autoritativo, reconstruído no submit; nunca inclui PDF, fotos ou outros anexos.
5. O modo de entrega é resolvido por `UsaitecLUX` na Filial efetiva, sem fallback entre Site e Laravel; modo indisponível falha com diagnóstico e permite retry.
6. Modo Site nunca responde "enviado" — só "envio solicitado", via inserção idempotente no outbox suportado pelo consumidor real; é proibido gravar em `email_orcamento`.
7. O outbox de Contrato (novo ou reaproveitado) é decidido e documentado explicitamente nesta fatia, com o contrato de integração do consumidor confirmado antes de declarar o modo Site pronto.
8. Idempotency key pertence à solicitação; duplo submit não duplica fila/outbox e retorna o mesmo estado.
9. Toda solicitação, enfileiramento, confirmação/resultado e falha definitiva geram evento auditável vinculado ao Contrato, com destinatários protegidos conforme policy de auditoria.
10. `revision` divergente entre abertura e envio exige novo preview/nova confirmação; autorização sensível/analista é revalidada no submit, nunca inferida da UI.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações já fixada na Fundação; `documents.contract.email` segue a mesma precedência (regra de estado → Permissão → Parâmetro → prova sensível), reaproveitando a infraestrutura de prova sensível já usada por operações análogas (ex.: `AutorizacaoAnalistaCredito`, quando aplicável).
- Parâmetros (`UsaitecLUX`, `SoImprimirFaturados`) são lidos pela mesma infraestrutura de parâmetros já usada pelo restante do Cadastro.

## Testes obrigatórios

1. Elegibilidade: matriz completa `SoImprimirFaturados` ativo/inativo × situação, delegada a `ContratoDocumentPolicy`; `C` nunca elegível.
2. Destinatários: sugestão correta (fotografia + Contatos documentais, deduplicados), nunca o e-mail do usuário logado; endereço inválido rejeita a solicitação inteira.
3. Composição: corpo é sempre HTML sem anexos; assunto padrão correto; preview usa o mesmo HTML autoritativo do envio.
4. Modo Site: solicitação idempotente única no outbox real (não `email_orcamento`); resposta é sempre "envio solicitado", nunca "enviado"; retry com a mesma chave não duplica.
5. Modo Laravel: enfileiramento após commit, uma entrega privada por destinatário, estados `issued/queued/sent/failed` consultáveis.
6. Sem fallback: modo indisponível falha com diagnóstico claro e não tenta o outro modo automaticamente.
7. Concorrência: `revision` divergente entre abertura e envio exige novo preview/confirmação; envio com `revision` obsoleta é rejeitado.
8. Auditoria: cada estado (solicitação, fila, resultado, falha) gera evento vinculado ao Contrato; destinatários não vazam entre mensagens/eventos.
9. Autorização: payload manipulado no frontend não concede envio sem `documents.contract.email` e, quando exigida, prova sensível/autorização de analista revalidada no submit.
10. Regressão: `OrcamentoDocumentEmailAdapter` e o `DocumentEmailEngine` genérico continuam funcionando sem alteração de contrato.

Prefira Feature tests no adapter/engine reais; reutilize os testes existentes do adapter de Orçamento como base de regressão e padrão de teste para o adapter de Contrato.

## Entregáveis

- Contrato do `ContratoDocumentEmailAdapter` (implementação de cada método da interface).
- Decisão documentada e desenhada do outbox de Contrato para o modo Site, incluindo o contrato de integração com o consumidor.
- Matriz de evidência Delphi × Laravel, deixando explícito o que o engine genérico já cobre e o que este adapter adiciona.
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi ou confirmação do consumidor do site antes da implementação.

## Fora de escopo

- implementar durante `/speckit.specify`;
- impressão/PDF (spec 15);
- carnê, boleto, e-mail de boleto, saldo, etiquetas;
- qualquer alteração no `DocumentEmailEngine`, no modal genérico, na fila Laravel ou nas implementações de entrega além do necessário para o novo adapter;
- envio de PDF, fotos ou anexos pelo e-mail geral do Contrato;
- alterar o schema Delphi além de migrations aditivas para o outbox de Contrato.
```
