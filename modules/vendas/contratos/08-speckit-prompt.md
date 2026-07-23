# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a agenda logística compartilhada (capacidade por parada, concorrência, reagendamento) e para a execução quantitativa de entrega e retirada do Cadastro de Contratos — Etapa 4 (Logística), segundo e último spec dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), a promessa logística e a cotação de frete já definidas (`07-speckit-prompt.md`) e sobre a reserva/identidade estáveis do Contrato (`05-speckit-prompt.md`).

Este spec consome a modalidade por item, o endereço e a filial de retirada já definidos no spec 7 — não os redefine. Agenda/execução dependem de itens e reserva já estabilizados; por isso este spec vem depois de reserva (spec 5), ainda que promessa/frete (spec 7) tenham avançado em paralelo com reserva/lotes. Não implemente agenda, equipe ou execução de montagem — isso é o módulo `montagens`, mapeado como esforço próprio fora desta série de specs (ver `26-consolidar-ordem-de-specs...`). Não reescreva o registro de entrega em loja já implementado (`RegistrarContratoEntregaLojaService`); integre-o.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt, incluindo as matrizes douradas, como o pacote funcional legado autoritativo — trate-as como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real, especialmente o que já existe para Orçamento e para o atalho de entrega em loja de Contrato; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- um motor de **agenda logística compartilhado** entre Cadastro e Consulta de Contratos, com unidade canônica de capacidade a **parada logística agendada** (mesmo contrato, destino, modalidade, data e período — vários itens/documentos na mesma parada consomem uma única unidade);
- **reserva atômica de capacidade**: bloquear a chave `regiao + data + periodo`, descontar a alocação anterior do próprio grupo e ocupar a nova, tudo na mesma transação; retry pela mesma `revision`/idempotency key não duplica; excesso falha sem alterar a promessa anterior;
- **reagendamento** atômico (libera a parada anterior e ocupa a nova na mesma transação) e **cancelamento/conclusão** de parada (libera capacidade futura, preserva histórico);
- um motor de **execução quantitativa** de entrega/retirada por item/alocação fiscal, modalidade e parada — eventos mínimos `saida_para_entrega`, `entrega_confirmada`, `retirada_confirmada` e seus estornos — com operador/autorizador e idempotency key;
- projeções de pendência **separadas**: `pendente_documentar`, `pendente_entregar`, `pendente_retirar` (`pendente = quantidade elegível − eventos confirmados + eventos estornados`, sempre por identidade de obrigação/alocação, nunca agregação incidental por produto/filial);
- integração do atalho de entrega em loja já existente como um caso particular do novo motor ("concluir todo o saldo elegível de retirada"), sem reescrevê-lo;
- a decisão de onde os eventos quantitativos são persistidos, já que a tabela legada `entregas` não tem coluna de produto/quantidade — resolver isso, não presumir uma solução.

Não inclua: modalidade, endereço, "aplicar a todos" e cotação de frete (spec 7, já definidos — este spec só os consome); reserva, movimentos, lotes e conferência `CTR` (specs 5/6); agenda, equipe e execução de montagem (módulo `montagens`, fora desta série); consumo definitivo de estoque, transferência física e documentos fiscais (Etapa 5) — execução que dependa de cobertura fiscal apenas se prepara aqui e aguarda essa guarda; devolução, troca e regularização de `P/N` pós-faturamento.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo as matrizes douradas, já foram extraídas no workspace de análise a partir de `dmcadastrocontratos.pas/.dfm`, `dmoperacoescontratos.pas/.dfm` e `fmcadastroprodutoscontrato.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Services\Vendas\Orcamentos\OrcamentoEntregaAgendaService` (rota `GET vendas.orcamentos.entrega_agenda_capacidade`) e `App\Infrastructure\Persistence\Legacy\Vendas\LegacyOrcamentoEntregaAgendaRepository` — **já existe** leitura on-demand de capacidade (resolução de região por bairro/cidade com fallback, `capacidadeMaxima` de `limites_entregas_regioes`, `totalAgendado`). **DIVERGENTE confirmada**: `totalAgendado` conta `COUNT(*)` sobre linhas de `produtosorcamentos` com `entrega='S'` na mesma data/período/região — ou seja, conta por **item**, não por **parada logística** — contradizendo diretamente a unidade canônica exigida pelos casos dourados ("mesmo grupo, 4 itens... consome 1"). Além disso, não há lock, reserva nem persistência de ocupação — é puramente informativo, replicando a limitação já registrada como `DIVERGENTE` no editor Delphi. Decida e documente explicitamente: este spec corrige a unidade de contagem (impactando também o Orçamento) ou constrói uma trilha própria para Contrato coexistindo com o comportamento atual do Orçamento até este ser corrigido à parte — não presuma que "generalizar o serviço existente" já resolve a unidade correta.
- `App\Infrastructure\Persistence\Legacy\Cadastros\LegacyLimiteEntregaRegiaoRepository` — leitura administrativa de `limites_entregas_regioes` (`dia_da_semana`, `periodo`, `quantidade`); reaproveite a mesma fonte de limite, não crie uma segunda leitura divergente.
- `App\Support\Vendas\ConsultaContratosGravarAlteracaoEntregaDiff`/`App\Services\Vendas\ConsultaContratosGravarAlteracaoService` (já citados no spec 7) — hoje gravam agenda por item **sem consultar nem reservar capacidade**. Este spec acopla a reserva atômica de capacidade ao mesmo caminho de gravação generalizado no spec 7; não cria um terceiro caminho de escrita de agenda.
- `App\Services\Vendas\RegistrarContratoEntregaLojaService`, `App\Support\Vendas\ContratoEntregaLojaEligibility`, `App\Infrastructure\Persistence\Legacy\Vendas\LegacyContratoEntregaLojaWriteRepository` — atalho **já implementado e testado**: exige nota fiscal válida, prova sensível, restrito a `P/N`, grava em `entregas` (`codigo, data_hora, situacao, contrato, notafilial, notaserie, notanumero, codigo_postagem` — **sem coluna de produto ou quantidade**) e projeta resumo em `contratos.usuarioentregaloja`/`entrega_na_loja`. Retry após sucesso retorna erro "já registrada" (não é idempotência silenciosa) — isso é aceitável para o atalho existente, mas o novo motor de execução quantitativa deve entregar idempotência real (retry devolve o mesmo resultado, sem erro nem efeito adicional).
- **Gap confirmado**: a tabela `entregas` não tem granularidade de item/quantidade — qualquer evento quantitativo por alocação fiscal exige uma estrutura aditiva nova (tabela própria, compatível com o schema Delphi). Decida e documente nome, colunas e convivência com `entregas`, `contratos_log`/`_log_new` e a auditoria física já confirmada, sem reescrever a semântica de `entregas`.
- `ConsultaContratosRegistrarEntregaLojaSensitiveOperationGate` — precedente de prova sensível para qualquer operação sensível deste motor (ex.: estorno de entrega/retirada).
- O comando de reserva (`ExecuteContratoEstoqueReservaCommand`, spec 5) e a Fundação (`revision`, envelope de auditoria/outbox) — a execução quantitativa não reabre nem reimplementa reserva; consome apenas identidade/quantidade já estabilizadas.

## Evidência Delphi confirmada

### Unidade e concorrência da agenda

- `CONFIRMADO` — o limite é configurado por região, dia da semana e opcionalmente período, com campo `quantidade`; o endereço específico de entrega prevalece sobre o cadastral. Evidência: `dmcadastrocontratos.dfm:13354-13432`, chamada em `dmcadastrocontratos.pas:20551-20594`.
- `CONFIRMADO` — o total agendado conta **uma entrega** por documento fiscal ainda não recebido e por contrato `F/P` ainda pendente, usando o menor item apenas como marcador — não soma quantidade, peso nem itens. Evidência: `dmcadastrocontratos.dfm:13457-13493,13568-13632`.
- `CONFIRMADO` — documento deixa de consumir capacidade quando há romaneio recebido sem justificativa; contrato pendente desconta devoluções e quantidades já documentadas. Evidência: `dmcadastrocontratos.dfm:13547-13560,13687-13706`.
- `DIVERGENTE` — no editor Delphi, limite e total são apenas exibidos (`TtecDBText`); não há reserva atômica nem bloqueio de excesso. Evidência: `fmcadastroprodutoscontrato.pas:1251-1252`, DFM `:2833-2868`.
- `DECISÃO NOVA` — a unidade canônica é a **parada logística agendada**: mesmo contrato, destino, modalidade, data e período. Vários itens/documentos na mesma parada consomem uma unidade; agendas distintas consomem unidades distintas. Documento fiscal não é a identidade da capacidade.
- `DECISÃO NOVA` — gravação bloqueia a chave `regiao + data + periodo`, desconta a alocação anterior do próprio grupo e ocupa a nova atomicamente. Retry pela mesma `revision`/idempotency key não duplica. Excesso falha sem alterar a promessa anterior.

### Casos de capacidade

| Caso | Limite/estado | Resultado |
|---|---|---|
| Nova parada | limite 3, ocupadas 2 | ocupa 1; total 3 |
| Concorrência | limite 3, ocupadas 2, duas gravações | uma confirma; outra recebe indisponibilidade |
| Mesmo grupo, 4 itens | mesma data/destino/período | consome 1 |
| Dividir agenda | 2 itens manhã, 2 à tarde | consome 1 em cada período |
| Reagendar | manhã → tarde | libera manhã e ocupa tarde na mesma transação |
| Cancelar/concluir | parada futura ativa | libera capacidade futura; histórico permanece |

### Pendência e execução quantitativa

- `CONFIRMADO` — em `O/R`, pendência comercial é quantidade menos cancelado, incluindo expansão de compostos quando `conferircomposto`. Evidência: `dmoperacoescontratos.dfm:2066-2229`.
- `CONFIRMADO` — em `F`, a consulta apresenta toda a quantidade não cancelada; em `P`, desconta documentos autorizados, excluindo nota vinculada e simples faturamento. A agregação atual usa produto/filial e linhagem `primogenito`. Evidência: `dmoperacoescontratos.dfm:659-1050`.
- `DIVERGENTE` — essa "pendência para entregar" mistura pendência fiscal e física; documento emitido não prova entrega. A agregação por produto/filial também perde identidade de linha, lote, série e parada — não será reproduzida assim.
- `DECISÃO NOVA` — manter projeções separadas: `pendente_documentar`, `pendente_entregar`, `pendente_retirar` (e, futuramente, `pendente_montar`, quando o módulo `montagens` existir). Para execução: `pendente = quantidade elegível − eventos confirmados + eventos estornados`, sempre por identidade de obrigação/alocação.
- `CONFIRMADO` — o comando atual de entrega na loja exige `P/N`, nota válida e autorização, mas registra um evento/resumo global e impede segunda execução. Evidência: `RegistrarContratoEntregaLojaService.php:18-131`, `ContratoEntregaLojaEligibility.php`.
- `DECISÃO NOVA` — preservar esse comando como atalho de "concluir todo o saldo elegível de retirada". O motor novo aceita eventos quantitativos por item/alocação fiscal, modalidade e parada, com operador/autorizador e idempotency key.

### Casos de execução

| Caso | Elegível | Evento | Pendência resultante |
|---|---:|---:|---:|
| Retirada total simples | 5 documentados | retirar 5 | 0; resumo `concluído` |
| Retirada parcial | 5 documentados | retirar 2 | 3; resumo `parcial` |
| Entregas em dois documentos | 3 + 2 | entregar 3 do primeiro | 2; segundo documento continua pendente |
| Híbrido | 2 para entrega + 3 para retirada | entregar 2 | entrega 0, retirada 3 |
| Estorno operacional | entregue 4, estornar 1 | compensação `-1` | pendente volta a 1; evento original permanece |
| Retry | mesma chave/evento | repetir comando | nenhum efeito adicional |
| Excesso | elegível 2, tentar 3 | nenhum evento | falha sem alterar projeção |

### Mutabilidade e eventos (recorte agenda/execução)

| Situação | Agenda/capacidade | Execução |
|---|---|---|
| `O` | Planejável, sujeita a capacidade. | Proibida. |
| `R` | Planejável/reagendável atomicamente. | Proibida. |
| `F` | Reagendamento operacional permitido por capability, sem mutar totais. | Apenas preparação; execução que exige documento aguarda cobertura fiscal. |
| `P/N` | Reagendável apenas para pendências. | Eventos parciais, conclusão e estorno guardado. |
| `C` | Alocações futuras canceladas/liberadas. | Apenas compensação autorizada, nunca apagar eventos. |

- `DECISÃO NOVA` — eventos mínimos: `parada_agendada`, `parada_reagendada`, `parada_cancelada`, `saida_para_entrega`, `entrega_confirmada`, `retirada_confirmada` e respectivos estornos. Promessa/agendamento não movimentam estoque nem alteram cobertura fiscal.
- `DECISÃO NOVA` — gravação comercial em `O/R` (spec 7) e reagendamento/execução operacional em `F/P/N` (este spec) são comandos distintos; não reabrem todo o agregado apenas para alterar uma data operacional.
- `DECISÃO NOVA` — Cadastro e Consulta chamam o mesmo serviço de agenda/execução. Propagação a documentos fiscais é projeção idempotente; nenhuma tela edita `dadosfiscais` diretamente.

## Estado Laravel confirmado

- Existe leitura de capacidade **somente para Orçamento**, on-demand, sem lock e contando por item (não por parada) — nenhuma reserva atômica de capacidade existe hoje para Orçamento nem para Contrato.
- A Consulta de Contratos já grava agenda por item (diff do spec 7), mas nunca consultou nem reservou capacidade.
- O atalho de entrega em loja está implementado, testado e restrito a `P/N`, com resumo global em tabela sem granularidade de item/quantidade (`entregas`) — nenhum motor de execução quantitativa existe.
- Nenhuma projeção `pendente_entregar`/`pendente_retirar`/`pendente_documentar` existe no Laravel — são construções novas desta fatia.
- Nenhuma tabela ou classe relacionada a "parada logística" ou capacidade atômica existe no checkout (`NÃO LOCALIZADO`).

## Decisões obrigatórias

1. Unidade canônica de capacidade é a **parada logística agendada** (contrato + destino + modalidade + data + período); nunca item, documento fiscal ou quantidade.
2. Reserva de capacidade é atômica: lock da chave `regiao + data + periodo`, leitura pós-lock, desconto da alocação anterior do próprio grupo, ocupação da nova — tudo na mesma transação da gravação de agenda.
3. Decida explicitamente a relação com `OrcamentoEntregaAgendaService`/`LegacyOrcamentoEntregaAgendaRepository`: corrigir a unidade de contagem (afetando Orçamento) ou construir uma trilha própria para Contrato — documentar a escolha e suas consequências, não herdar silenciosamente o comportamento por item.
4. Reagendar é liberar a parada anterior + ocupar a nova, atomicamente; cancelar/concluir libera capacidade futura sem apagar histórico.
5. Cadastro e Consulta chamam exatamente o mesmo serviço de agenda; a reserva de capacidade se acopla ao mesmo caminho de gravação generalizado no spec 7, nunca um terceiro gravador.
6. Execução quantitativa é sempre por item/alocação fiscal, modalidade e parada — nunca um booleano ou resumo global como identidade de obrigação.
7. Pendências são projeções separadas (`pendente_documentar`, `pendente_entregar`, `pendente_retirar`); calculadas como quantidade elegível menos eventos confirmados mais eventos estornados, por identidade de obrigação/alocação — nunca agregação incidental por produto/filial nem por linhagem `primogenito`.
8. Estorno é evento compensatório que referencia o evento original; nunca apaga ou edita o evento anterior.
9. Cada comando de agenda/execução tem chave idempotente (`contrato + parada/evento + revision` ou equivalente); retry devolve o mesmo resultado sem duplicar movimento nem efeito.
10. O atalho de entrega em loja é preservado como está e reaproveitado como caso particular ("concluir todo o saldo elegível de retirada") do novo motor — não é reescrito, e seu comportamento de retry (erro em segunda execução) não precisa mudar, mas o motor novo em si deve ser genuinamente idempotente.
11. Resolva e documente onde eventos quantitativos são persistidos, dado que `entregas` não tem coluna de produto/quantidade — extensão aditiva compatível com o schema Delphi, nunca reaproveitar `entregas` com semântica incompatível.
12. Execução em `F` só prepara; a execução que depende de documento fiscal aguarda a guarda de cobertura fiscal (mockada nesta fatia, real na Etapa 5/9) — nunca simula sucesso sem essa guarda.
13. Agenda/execução de montagem não pertence a este spec; a captura de necessidade (spec 7) não ganha aqui nenhuma mecânica de agendamento ou execução.
14. Propagação a documentos fiscais é projeção idempotente; nenhuma tela ou comando desta fatia edita `dadosfiscais` diretamente.
15. Autorização, capabilities e prova sensível reaproveitam a matriz e a infraestrutura já fixadas na Fundação e o precedente de `ConsultaContratosRegistrarEntregaLojaSensitiveOperationGate`; nenhum mecanismo de permissão ou senha paralelo.

## Contrato do comando de agenda (parada logística)

- Entrada: identidade/`revision` do Contrato, itens/documentos elegíveis (produto, filial, alocação fiscal quando aplicável), destino/modalidade já definidos no spec 7, data/período desejados.
- Processo: resolver região a partir do destino (reaproveitando `resolveRegiaoCodigo`) → agrupar itens/documentos elegíveis na mesma parada (contrato+destino+modalidade+data+período) → bloquear a chave `regiao+data+periodo` → reler capacidade e ocupação pós-lock → liberar alocação anterior do grupo, se houver → ocupar a nova → persistir agenda + ocupação + `revision` na mesma transação.
- Saída: fotografia autoritativa da(s) parada(s), capacidade restante, avisos de lotação, nova `revision`.
- Falha em qualquer etapa não deixa ocupação parcial; a transação inteira reverte.

## Contrato do motor de execução quantitativa

- Entrada: identidade do Contrato, item/alocação fiscal, quantidade, modalidade, parada/local, operador/autorizador, idempotency key.
- Processo: validar elegibilidade (quantidade documentada/pendente) → validar guardas de situação e, quando aplicável, cobertura fiscal → registrar evento (`saida_para_entrega`/`entrega_confirmada`/`retirada_confirmada` ou estorno) → recalcular pendência derivada → atualizar resumo do Contrato como projeção, nunca como fonte de verdade.
- Saída: evento persistido, pendência recalculada por identidade de obrigação, resumo derivado atualizado.
- Excesso (tentar além do elegível) falha sem registrar evento nem alterar a projeção; retry pela mesma idempotency key devolve o mesmo resultado.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações/parâmetros já fixada na Fundação e a infraestrutura de prova sensível, seguindo o precedente de `ConsultaContratosRegistrarEntregaLojaSensitiveOperationGate` para operações sensíveis desta fatia (ex.: estorno de entrega/retirada, reagendamento em `F`).
- Não introduza um segundo mecanismo de senha ou aprovação; parâmetros próprios (limite por região, capacidade) seguem a mesma fonte já lida por `LegacyLimiteEntregaRegiaoRepository`.

## Testes obrigatórios

1. Toda a matriz dourada de capacidade (6 casos) e de execução (7 casos) como Feature tests dos comandos transacionais reais.
2. Concorrência real: duas transações disputando a mesma parada — uma confirma, a outra recebe indisponibilidade sem saldo negativo de capacidade.
3. Reagendar: libera a parada anterior e ocupa a nova atomicamente; falha na nova não deixa a anterior liberada.
4. Cancelar/concluir parada: libera capacidade futura sem apagar histórico.
5. Execução: pendência calculada por identidade de obrigação/alocação (nunca por produto/filial agregado); estorno referencia o evento original e nunca o apaga; excesso falha sem efeito.
6. Idempotência real do novo motor: retry pela mesma chave devolve o mesmo resultado sem duplicar evento nem ocupação — diferente do comportamento de erro do atalho de entrega em loja, que este spec preserva sem alterar.
7. Regressão: `RegistrarContratoEntregaLojaService` continua funcionando sem alteração de contrato, rota ou comportamento; ele pode ser acionado como caso particular do novo motor sem quebrar seus próprios testes.
8. Teste explícito da decisão sobre `OrcamentoEntregaAgendaService`: se corrigida a unidade de contagem, teste de regressão do Orçamento cobrindo o novo comportamento por parada; se mantida trilha própria, teste de que Contrato não herda a contagem por item.
9. Execução que exige documento fiscal aguarda a guarda de cobertura fiscal mockada; nunca simula sucesso sem ela.
10. Autorização server-side: payload manipulado no frontend não concede parada, execução ou estorno sem capability/prova válidas.

Prefira Feature tests nos comandos/endpoints reais; reutilize os testes existentes do atalho de entrega em loja como base de regressão e os helpers de teste de reserva (`ContratoEstoqueReservaTestHelpers`) como padrão de teste de concorrência real com duas transações.

## Entregáveis

- Contrato do comando de agenda (parada logística) e do motor de execução quantitativa (entrada/processo/saída de cada um).
- Decisão documentada sobre a unidade de contagem compartilhada com Orçamento e sobre onde os eventos quantitativos são persistidos (schema aditivo).
- Matriz de evidência Delphi × Laravel, deixando explícito o que a leitura de capacidade do Orçamento e o atalho de entrega em loja já cobrem.
- Critérios de aceitação e testes, incluindo as duas matrizes douradas (capacidade e execução) como suítes obrigatórias.
- Riscos, dúvidas (unidade exata dos limites regionais quando confirmada por casos reais, se montagem compartilha ou não capacidade de entrega — `NÃO LOCALIZADO` preservado) e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- modalidade, endereço, "aplicar a todos" e cotação de frete (spec 7);
- reserva, movimentos, lotes e conferência `CTR` (specs 5/6);
- agenda, equipe, ordem e execução de montagem (módulo `montagens`, esforço próprio);
- consumo definitivo de estoque, transferência física e documentos fiscais (Etapa 5);
- devolução, troca e regularização de `P/N` pós-faturamento;
- reescrever o registro de entrega em loja já implementado;
- corrigir a contagem por item do `OrcamentoEntregaAgendaService` sem uma decisão explícita e documentada nesta fatia;
- alterar o schema Delphi além de migrations aditivas exigidas pela decisão de persistência de eventos quantitativos.
```
