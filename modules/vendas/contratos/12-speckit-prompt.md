# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **Desmembrar Contrato** — Etapa 6 (Operações sensíveis), segundo e último spec dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), o vínculo e a fotografia do Cliente (`02-speckit-prompt.md`), o motor comercial compartilhado (`03-speckit-prompt.md`), a proposta financeira (`04-speckit-prompt.md`) e a reserva (`05-speckit-prompt.md`/`06-speckit-prompt.md`), cujos motores este comando compõe numa única transação multiagregado.

**Desmembrar não é clonar.** O Delphi tem duas operações distintas: copiar o Contrato (que na verdade transfere quantidades selecionadas para um novo Contrato e reduz a origem) e "copiar produtos de outro contrato" (importação, que não altera a origem). Este spec entrega exclusivamente a primeira — **Desmembrar Contrato** (`O → O`, `R → R`, com transferência atômica de reserva quando `R`). A segunda é **Importar produtos de outro Contrato**, um spec independente da Etapa 8 (`17-speckit-prompt.md`, ainda não escrito) — não a implemente aqui, nem misture as duas interfaces.

Ao contrário de specs recentes desta série, **nenhuma implementação prévia deste comando existe no checkout** — confirme isso você mesmo antes de prosseguir (não presuma; busque por qualquer serviço de cópia/desmembramento de Contrato). O trabalho real desta fatia é compor, numa única transação, primitivas que **já existem ou já foram especificadas** em fatias anteriores (criação canônica do núcleo, motor comercial/rateio, motor de financiamento, reserva) — não reconstruir nenhuma delas.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real das primitivas que este spec compõe; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- o comando `DesmembrarContrato`: elegibilidade restrita a Contrato de origem persistido em `O` ou `R`, capability `contracts.split`, ao menos um produto selecionado (serviços nunca participam — permanecem integralmente na origem);
- a prévia obrigatória antes da confirmação: por produto, quantidade original, já comprometida, máxima transferível, quantidade a transferir e saldo restante; totais, desconto, parcelas, logística e reservas de origem e destino após a operação;
- criação do Contrato destino pelo **seam canônico do núcleo** (mesmo criador usado pela Fundação e pela geração via Orçamento) preservando a situação (`O → O`, `R → R`), com nova `revision`, `origin_type=contract_split`, `origin_id=<origem>` e correlation/split id; a origem registra referência inversa ao mesmo evento, sem alterar seu vínculo histórico com o Orçamento;
- cópia do vínculo e da **fotografia efetiva do Cliente** da origem (o objeto de fotografia versionado definido no spec 2, não uma allowlist derivada do PAS), sem consultar ou alterar o cadastro mestre;
- novas identidades de linha de produto no destino, preservando produto/variação, Filial, quantidade transferida, preço unitário efetivo, desconto/acréscimo de linha e vendedor — nunca copiando ids técnicos, hashes, flags de cancelamento/movimento/reserva ou fotografia fiscal obsoleta;
- rateio proporcional do desconto geral entre origem e destino usando o **motor de rateio compartilhado por `lineId`** que o spec 3 exige (resíduo determinístico; soma dos dois descontos exatamente igual ao desconto anterior); recálculo de subtotal/total bruto-líquido/assinatura comercial em ambos;
- recomposição separada das parcelas dos dois Contratos pelo motor de financiamento (spec 4), sem copiar pagamentos, recebimentos, baixas, boletos, conciliações ou crédito consumido; bloqueio explícito quando houver realização financeira incompatível com o novo rateio;
- transferência atômica de reserva/lote/série da origem para o destino quando `R → R`, sob os mesmos locks e ordem determinística já usados pela reserva (spec 5/6) — sem janela de liberação/re-reserva; em `O → O`, apenas recalcular disponibilidade, sem criar movimento;
- cópia de endereço/promessa de entrega e modalidades das linhas transferidas (fotografia do spec 7), sem copiar cotação de frete confirmada, transportadora, agenda, capacidade consumida ou execução logística;
- reconhecimento explícito (bloqueio, não implementação) de tudo que nunca é clonado: documentos fiscais, faturamento, devoluções, Atendimentos, Contatos, Questionários, Fotos/Anexos, e-mails, impressões, autorizações, logs e auditoria da origem;
- uma única transação atômica cobrindo número, destino, mutações da origem, rateios, parcelas e reservas; efeitos pós-commit via outbox; retry pela mesma idempotency key retorna o mesmo destino, nunca cria um segundo.

Não inclua: **Importar produtos de outro Contrato** (spec 17, Etapa 8 — caso de uso, endpoint e capability distintos); qualquer cópia real de dados/documentos fiscais, faturamento, devoluções, Atendimentos, Contatos, Questionários, Fotos, Anexos, e-mails, impressões, autorizações, logs ou auditoria da origem; agenda/execução logística real (specs 7/8) além de copiar a fotografia de promessa das linhas transferidas; cancelamento/reversão do Contrato (spec 11, já definido — a origem/destino de um desmembramento seguem as mesmas regras já fixadas ali, não redefinidas aqui).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual das primitivas compostas por este spec e construa a matriz de lacunas.

## Investigação Laravel obrigatória

- **Confirme a ausência**: busque por qualquer serviço de cópia/desmembramento de Contrato (`Desmembrar`, `Split`, `ContratoSplit`, `contracts.split`) no checkout atual antes de prosseguir. Se algo tiver surgido desde a extração desta evidência, trate como achado divergente a reconciliar, não ignore.
- O **seam canônico de criação do núcleo** (Fundação, spec 1) e o criador já usado por `GerarContratoOrcamentoService`/`LegacyGerarContratoOrcamentoRepository` (geração via Orçamento) — reaproveite a mesma alocação de número/criação atômica para o Contrato destino; não construa um segundo criador de Contrato.
- `App\Services\Vendas\Orcamentos\OrcamentoRateioDescontoCalculator` — hoje o único rateio de desconto geral existente, ainda acoplado a Orçamento, operando em `float`/arrays posicionais. O spec 3 exige generalizar isso num motor compartilhado por `lineId` — esse motor é **pré-requisito funcional** deste spec. Se ainda não existir generalizado quando este prompt rodar, registre isso como bloqueio explícito de dependência (não reconstrua um terceiro rateio paralelo só para o desmembramento).
- `App\Services\Vendas\Contratos\ContratoPropostaFinanceiraService` (spec 4) — reaproveite `mapInstallmentsToLegacyParcelas`/`installmentLineToPersistRow`/`assertFechamento` para recompor as parcelas dos dois Contratos após o rateio comercial, na mesma disciplina já usada pelos specs 9/10 — não recrie o mapeamento.
- `App\Application\Vendas\Contratos\Cadastro\Commands\ExecuteContratoEstoqueReservaCommand`, `StockKey` e `LegacyContratoEstoqueRepository::lockStockKeys` (spec 5/6) — a transferência de reserva origem→destino usa os mesmos locks e a mesma ordem determinística (`filial → produto → lote`) já estabelecidos; não é liberar na origem e reservar no destino em duas transações separadas — precisa ser uma única transação cobrindo as chaves de ambos os Contratos, sem janela de indisponibilidade.
- O envelope de auditoria/correlação já definido na Fundação (`origin_type`, `origin_id`, `correlation_id`, `causation_id`) — este spec só instancia `origin_type=contract_split`; não redefine o envelope.
- A fotografia de endereço/promessa logística do spec 7 (`ContratoEntregaPeriodoResolver` e estrutura equivalente) — reaproveite ao copiar a promessa das linhas transferidas; não recrie normalização de data/período/hora.
- A **Fotografia do Cliente no Contrato**, já definida como conceito de domínio no spec 2 (`CONTEXT.md`) — este é exatamente o objeto que deve ser copiado tal como especificado ali, não uma lista de campos derivada do PAS Delphi.
- `App\Domain\Vendas\Contratos\ContratoTransitionGraph`/`ContratoCadastroCapabilityResolver` — desmembramento não é uma transição de situação (a origem e o destino permanecem, cada um, na mesma situação: `O` ou `R`); confirme que este spec adiciona um comando/capability novo (`contracts.split`) fora da matriz de transições, sem colidir com F6/F11 já existentes.

## Evidência Delphi confirmada

### Duas operações, não uma "cópia"

- `CONFIRMADO` — o Delphi oferece duas operações diferentes: o botão/atalho de cópia do Contrato (`fmcadastrocontratos.pas:940,2787-2788,3111-3115`) e "Copiar produtos de outro contrato" (`:3891-3911`; botão no DFM `:5715-5754`).
- `CONFIRMADO` — a primeira não é clonagem: cria outro Contrato com quantidades selecionadas e reduz/exclui essas quantidades na origem (`dmcadastrocontratos.pas:4517-4533,4823-4828`).
- `DECISÃO NOVA` — no Laravel os comandos são **Desmembrar contrato** (este spec) e **Importar produtos de outro contrato** (spec 17); casos de uso, endpoints, capabilities e transações distintos — nenhum implementado como duplicação genérica de registros.

### Elegibilidade e interface

- `CONFIRMADO` — o Delphi habilita o comando somente até `R` (`fmcadastrocontratos.pas:940`), exige ao menos um produto selecionado e pede confirmação (`dmcadastrocontratos.pas:4426-4436,4831-4833`).
- `DECISÃO NOVA` — somente Contratos persistidos em `O` ou `R`, com capability `contracts.split`; serviços não participam, permanecem integralmente na origem.
- `DECISÃO NOVA` — quantidade transferida é positiva, respeita precisão/unidade e não excede a quantidade transferível; ao menos uma linha é obrigatória; o comando recebe `sourceRevision`, seleção explícita e idempotency key.

### Situação e identidade

- `CONFIRMADO` — o Delphi copia `situacao` e `datareservado` da origem (`dmcadastrocontratos.pas:4604-4605,4815-4816`) e executa tratamento especial de movimentos quando `FOperacaoCopia` está ativo (`:12660-12691,13082-13103`).
- `DECISÃO NOVA` — preservar a situação: `O → O` e `R → R`; `O` não movimenta estoque; em `R → R`, as reservas das quantidades selecionadas são transferidas atomicamente.
- `DECISÃO NOVA` — datas comerciais originalmente pactuadas (inclusive emissão/reserva) são preservadas como fotografia; `created_at`, operador e evento de desmembramento registram quando a nova entidade foi materializada.

### Cliente e fotografia cadastral

- `CONFIRMADO` — o Delphi copia Cliente/tipo e uma fotografia extensa do cabeçalho, endereço, documentos, renda, cônjuge e referências campo a campo (`dmcadastrocontratos.pas:4541-4554,4606-4806`).
- `POSSÍVEL BUG LEGADO` — a lista manual de dezenas de campos pode carregar dados sem significado atual e não é contrato de API; o Laravel copia o objeto de fotografia versionado do spec 2, não uma allowlist derivada do PAS.
- `DECISÃO NOVA` — avalista, dependentes e demais participantes da proposta são preservados só como fotografia necessária à mesma condição comercial; novas validações ocorrem na próxima transição sensível.

### Produtos e cálculo comercial

- `CONFIRMADO` — o Delphi permite quantidade parcial e copia produto/Filial, preço de tabela/venda, descrição do preço, entrega/montagem, pedido do Cliente, brinde, vendedor e classificação fiscal (`dmcadastrocontratos.pas:4453-4508`).
- `POSSÍVEL BUG LEGADO` — o Delphi limpa desconto/frete/seguro do novo Contrato e subtrai apenas o total selecionado da origem (`dmcadastrocontratos.pas:4555-4559,4823-4827`), podendo dissociar totais da condição original — **não será reproduzido**.
- `DECISÃO NOVA` — preços unitários e condições comerciais permanecem iguais; desconto geral é repartido proporcionalmente entre origem e destino pelo motor determinístico do spec 3; cupom/crédito promocional não é clonado como identificador consumível — seu benefício já materializado só entra no rateio quando a política do cupom permitir, senão o comando bloqueia para decisão explícita.

### Financeiro

- `CONFIRMADO` — o legado copia plano e taxa de juros, mas não há cópia explícita das parcelas no corpo de `CopiarContrato` (`dmcadastrocontratos.pas:4570-4573`).
- `DECISÃO NOVA` — preservar plano e condições da proposta, repartir a base pelo resultado comercial e recalcular separadamente as parcelas dos dois Contratos com o motor Laravel do spec 4; parcelas permanecem separadas, sem agrupamento.
- `DECISÃO NOVA` — nunca copiar pagamentos, recebimentos, baixas, boletos, conciliações, crédito consumido ou lançamentos; realização financeira incompatível com o novo rateio bloqueia o desmembramento e encaminha para operação financeira própria.

### Estoque, lotes, séries e logística

- `DECISÃO NOVA` — em `O → O`, apenas recalcular disponibilidade; em `R → R`, transferir a quantidade reservada preservando produto, Filial, lote, série e natureza da alocação, sob os mesmos locks da reserva, sem janela de liberação/re-reserva; falta, conflito de revision ou impossibilidade de transferir qualquer lote/série aborta toda a operação sem alterar origem/destino.
- `DECISÃO NOVA` — a conferência não é copiada: destino ganha identidade `CTR/<novo numero>` própria; eventual obrigatoriedade é reavaliada.
- `DECISÃO NOVA` — copiar endereço/promessa de entrega e modalidades das linhas transferidas; não copiar cotação de frete confirmada, transportadora, agenda, capacidade consumida, parada logística ou execução; efeitos logísticos já executados, ou que impeçam separar quantitativamente os produtos, bloqueiam o comando.

### O que nunca é clonado

- `DECISÃO NOVA` — não copiar documentos/dados fiscais, séries fiscais, faturamento, devoluções, notas, Atendimentos, Contatos documentais, Questionários/aplicações/respostas, venda perdida, Anexos, e-mails, impressões, autorizações, logs ou auditoria.
- `DECISÃO NOVA` — o novo Contrato produz sua própria auditoria de criação por desmembramento; a origem registra before/after das quantidades/totais/reservas; ambos compartilham correlation id e autoria efetiva.
- `DECISÃO NOVA` — o comando é uma única unidade atômica para número, destino, mutações da origem, rateios, parcelas e reservas; efeitos pós-commit usam outbox; retry retorna o mesmo destino.

## Estado Laravel confirmado

- Nenhum serviço, comando ou capability de desmembramento/cópia de Contrato existe no checkout (`NÃO LOCALIZADO`).
- O único rateio de desconto geral existente hoje é acoplado a Orçamento (`OrcamentoRateioDescontoCalculator`), ainda em `float`/arrays posicionais — a generalização exigida pelo spec 3 é dependência direta, não algo que este spec deva reconstruir.
- O seam canônico de criação do núcleo (spec 1) e o motor de financiamento (spec 4) já existem como contratos/implementações reaproveitáveis; a reserva (spec 5/6) já implementa locks/ordem determinística que a transferência atômica deve seguir.
- Nenhuma capability `contracts.split` existe hoje em `ContratoCadastroCapabilityResolver`.

## Decisões obrigatórias

1. Desmembrar Contrato e Importar produtos de outro Contrato são comandos, endpoints e capabilities distintos; este spec entrega só o primeiro.
2. Elegibilidade restrita a origem `O`/`R`, capability `contracts.split`, ao menos uma linha de produto selecionada; serviços nunca participam.
3. Situação é preservada (`O → O`, `R → R`); desmembramento nunca é uma transição de máquina de estados — origem e destino continuam, cada um, na situação em que estavam.
4. O destino nasce pelo mesmo seam canônico de criação do núcleo, com `origin_type=contract_split`, `origin_id`, correlation/split id; a origem registra referência inversa sem alterar seu vínculo histórico com o Orçamento.
5. A fotografia de Cliente copiada é o objeto versionado do spec 2, não uma allowlist ad hoc; o cadastro mestre nunca é consultado/alterado pela operação.
6. Desconto geral é repartido pelo motor de rateio compartilhado por `lineId` do spec 3, com resíduo determinístico e soma exatamente igual ao desconto original; preços unitários e condições comerciais das linhas transferidas não mudam.
7. Parcelas dos dois Contratos são recompostas separadamente pelo motor de financiamento do spec 4; nenhum efeito financeiro já realizado (pagamento, baixa, boleto, conciliação, crédito consumido) é copiado; incompatibilidade bloqueia o comando e encaminha à operação financeira própria.
8. Em `R → R`, a transferência de reserva/lote/série é atômica, sob os mesmos locks/ordem determinística da reserva (spec 5/6), sem janela de liberação/re-reserva; em `O → O`, nenhum movimento é criado.
9. Conferência, cotação de frete confirmada, agenda, capacidade consumida e execução logística nunca são copiadas; efeitos logísticos executados ou não separáveis quantitativamente bloqueiam o comando.
10. Documentos fiscais, faturamento, devoluções, Atendimentos, Contatos, Questionários, Fotos/Anexos, e-mails, impressões, autorizações, logs e auditoria da origem nunca são clonados — apenas reconhecidos como fora de escopo, sem efeito no destino.
11. O comando inteiro é uma única transação atômica; falha em qualquer etapa (número, mutação da origem, rateio, parcelas, reserva) não deixa nenhum dos dois Contratos em estado parcial; efeitos pós-commit usam outbox; retry pela mesma idempotency key retorna o mesmo destino, nunca cria um segundo.
12. Capabilities e prova sensível vêm sempre do servidor e são reavaliadas na execução; a visibilidade do botão nunca autoriza o comando sozinha.

## Contrato do comando `DesmembrarContrato`

- Entrada: identidade/`sourceRevision` da origem, seleção explícita de linhas com quantidade a transferir, contexto do ator, prova sensível quando a política exigir, idempotency key.
- Processo: validar elegibilidade e `sourceRevision` → validar quantidades selecionadas contra o transferível → criar destino pelo seam canônico (nova identidade, mesma situação) → copiar fotografia de Cliente → criar linhas de produto no destino e ratear desconto geral pelo motor do spec 3 → recompor parcelas dos dois Contratos pelo motor do spec 4 (bloqueando se houver realização financeira incompatível) → transferir reserva/lote/série atomicamente quando `R` → copiar fotografia de promessa logística das linhas transferidas → gravar mutações da origem (quantidades/totais/reservas reduzidos) e o evento de auditoria/correlação de ambos → agendar outbox para efeitos pós-commit.
- Saída: fotografia autoritativa de origem e destino, novas `revision` de ambos, número do Contrato destino.
- Falha em qualquer etapa não deixa nenhum dos dois Contratos parcialmente alterado; a transação inteira reverte.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações/parâmetros já fixada na Fundação; `contracts.split` é uma capability nova, resolvida com a mesma precedência (regra de estado → Permissão → Parâmetro → prova sensível).
- Prova sensível, quando exigida por parâmetro/política, reaproveita a infraestrutura de uso único já fixada na Fundação — não cria um mecanismo paralelo.

## Testes obrigatórios

1. `O → O`, quantidade parcial: origem reduzida exatamente, destino criado com a quantidade selecionada, nenhum movimento de estoque.
2. `R → R`, quantidade parcial: reserva transferida atomicamente, sob os mesmos locks; origem e destino refletem saldo correto; falta ou conflito de revision aborta sem alterar nenhum dos dois.
3. `R → R` com lote/série: decomposição transferida preservando lote/série/natureza da alocação; falha em qualquer parte aborta a operação inteira.
4. Desconto geral com resíduo: soma dos descontos de origem e destino é exatamente igual ao desconto original, mesmo com valores não divisíveis.
5. Parcelas: recomposição separada dos dois cronogramas fecha exatamente os novos totais; nenhum pagamento/baixa/crédito consumido é copiado; realização financeira incompatível bloqueia o comando antes de qualquer efeito.
6. Fotografia de Cliente: destino recebe a mesma fotografia versionada da origem; cadastro mestre não é consultado nem alterado.
7. Logística: fotografia de promessa copiada nas linhas transferidas; cotação de frete confirmada/agenda/execução nunca copiadas; execução logística já ocorrida bloqueia o comando.
8. Nada do "nunca clonado" aparece no destino: nenhum documento fiscal, Atendimento, Contato, Questionário, Anexo, e-mail, impressão ou log da origem é replicado.
9. Idempotência: retry com a mesma chave retorna o mesmo Contrato destino, sem criar um segundo nem duplicar mutações na origem.
10. Autorização server-side: payload manipulado no frontend não concede o comando sem `contracts.split` e, quando exigida, prova sensível válida.
11. Atomicidade: falha simulada em qualquer etapa (criação do destino, rateio, parcelas, reserva) não deixa origem nem destino em estado parcial.

Prefira Feature tests no comando real, com asserts de origem e destino persistidos juntos na mesma transação; reutilize os helpers de teste de reserva (`ContratoEstoqueReservaTestHelpers`) para os casos de concorrência/lock.

## Entregáveis

- Contrato do comando `DesmembrarContrato` (entrada/processo/saída), explicitando cada primitiva composta (núcleo, rateio, financiamento, reserva, promessa logística) e sua origem.
- Matriz de evidência Delphi × Laravel, deixando explícito o que já existe como primitiva reutilizável e o que é composição nova desta fatia.
- Critérios de aceitação e testes, incluindo os casos dourados `O → O`, `R → R`, desconto com resíduo, parcelas, lote/série, conflito de revision e retry idempotente como suíte obrigatória.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise — incluindo, explicitamente, se o motor de rateio compartilhado por `lineId` do spec 3 já está disponível no momento da implementação.

## Fora de escopo

- implementar durante `/speckit.specify`;
- Importar produtos de outro Contrato (spec 17, Etapa 8);
- cópia real de documentos fiscais, faturamento, devoluções, Atendimentos, Contatos, Questionários, Fotos/Anexos, e-mails, impressões, autorizações, logs ou auditoria da origem;
- agenda/execução logística real além de copiar a fotografia de promessa das linhas transferidas;
- cancelamento e reversão do Contrato (spec 11, já definido);
- reconstruir o motor de rateio ou o motor de financiamento — apenas compô-los;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas.
```
