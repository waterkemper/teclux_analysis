# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica para implementar no Laravel o Cancelamento e a Exclusão física em lote de Contratos, cobrindo a tela dedicada de Consulta/Cancelamento do Delphi (`TfrmCancelamentoContratos`/`TdtmCancelamentoContratos`, `delphi/apps/vendas/fmcancelamentocontratos.pas`/`.dfm`, `dmcancelamentocontratos.pas`/`.dfm`), reconciliando com o comando `CancelarContrato` e as guardas já decididas para o Cadastro de Contratos.

Não implemente nesta etapa. Produza uma especificação pronta para planejamento e implementação. Inspecione o código e o schema disponíveis antes de concluir e corrija qualquer hipótese deste prompt que seja contrariada por evidência concreta.

## Pré-requisito de sequenciamento

Esta especificação assume que a Etapa 1 (Fundação: núcleo, ciclo de vida `O/R/F/C`, `revision`, capabilities recalculadas no servidor) e as Etapas 2–5 (Cliente, comercial, estoque/reserva, logística, faturamento) do Cadastro de Contratos — na ordem definida em `.scratch/cadastro-contratos-wayfinder/issues/26-consolidar-ordem-de-specs-rollout-e-compatibilidade.md` — já existem no Laravel, incluindo o comando `CancelarContrato` (Etapa 6, item 11 daquela ordem). Na data deste prompt, nenhuma dessas etapas está implementada; esta especificação prepara a fatia de lote para quando `CancelarContrato` existir, e não deve ser implementada isoladamente antes dele.

## Vocabulário obrigatório

- `Contrato`: registro comercial obrigatoriamente vinculado a um Cliente (ver `AGENTS.md`/`CONTEXT.md` de domínio). Situações: Orçado (`O`), Reservado (`R`), Faturado (`F`), Cancelado (`C`), Nota Parcial (`P`), Nota Fiscal (`N`).
- `Cancelamento do Contrato`: preservação do registro e do histórico, com mudança da Situação para Cancelado (`CancelarContrato`, já decidido em `.scratch/cadastro-contratos-wayfinder/issues/21-definir-cancelamento-reversao-e-devolucao-do-contrato.md`).
- `Exclusão física do Contrato`: remoção definitiva de um Contrato Orçado elegível e dos dados exclusivamente pertencentes a ele. Só existe para Situação Orçado.
- `ExclusaoContrato`: Parâmetro do Sistema (`parametros.descricao = 'EXCLUSAO CONTRATO'`, constante Delphi `ctEXCLUSAOCONTRATO`) com valores persistidos `E` (Excluir), `C` (Cancelar), `P` (Perguntar); qualquer outro valor equivale a Nenhuma. Deve ser lido via `parametros_valor(descricao, filial)`, nunca como booleano.
- `Motivo de Cancelamento`: registro estruturado do Cadastro de Motivos, opcional nesta tela, sem filtro por tipo.
- `ObrigarDigitacaoaoExcluir`: Parâmetro do Sistema booleano que, quando ativo, exige descrição/texto complementar ao Cancelar ou Excluir — já usado para Contrato no Cadastro principal via o componente `TfrmMotivos`, mas ausente nesta tela de lote hoje.

Não use Exclusão e Cancelamento como sinônimos. Não use "aba" — o Laravel unifica as três Situações numa única tela com filtro exclusivo (ver Solução).

## Regras de evidência

Analise PAS e DFM conjuntamente, incluindo data module, queries, eventos, actions, atalhos, SQL, units compartilhadas, Parâmetros do Sistema, Permissões, Autorizações, triggers e constraints. Compare cada comportamento com o Laravel existente. Classifique toda descoberta relevante como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta. Não converta automaticamente limitações, exclusões incompletas ou bugs do Delphi em requisitos — exceto onde este prompt já registra a decisão consciente de não replicar (ver Exclusão física).

## Evidência Delphi confirmada

### Navegação e escopo da tela

- `CONFIRMADO` — `TfrmCancelamentoContratos` é uma tela MDI standalone, registrada no menu (`delphi/apps/vendas/rgvendas.pas:34`) e também reaberta por `fmcadastrocontratos.pas:2522-2524` e `fmoperacoescontratos.pas:669-671` só para atualizar sua consulta após uma operação feita alhures.
- `CONFIRMADO` — F6 (`sbnGerar`) monta a lista com os filtros atuais; F7 (`sbnCancelar`) executa Cancelar/Excluir sobre os marcados (`fmcancelamentocontratos.pas:266-277`). Diferente do F6 de Orçamentos, que cancela direto.
- `DIVERGENTE (não ativo)` — existe um bloqueio mútuo comentado com o Cadastro de Contratos (`ctCANCELAMENTOCONTRATOABERTO`); está desligado hoje, não reproduzir como requisito.

### Abas/Situação e filtros

- `CONFIRMADO` — três modos por `rgbOperacao`: Orçados (`O`), Reservados (`R`), Faturados (`F`) — mutuamente exclusivos, trocar de modo fecha a consulta atual.
- `CONFIRMADO` — filtros: Filial, Vendedor, Cliente, Data de emissão (`edtDataEmissao`, default `DataServidor - 30`). Motivo é usado na operação, não como filtro de listagem.
- `CONFIRMADO` — query base (`dmcancelamentocontratos.dfm:165-230`), junta `contratos t`, `vfornecedores v` (Cliente/Parte Contratante), `usuarios u` (Vendedor); filtra `os IS NULL OR os='false'` (`DÚVIDA` — significado exato de `os` não confirmado).
- `CONFIRMADO` — filtro de Faturados só lista Contratos em que **nenhuma** parcela tem `datapagto`/`tipopagto` preenchidos — única guarda financeira de listagem para Faturados.

### Motivo

- `CONFIRMADO` — Motivo é opcional, sem filtro por `tipomotivo` (`dmcancelamentocontratos.pas:287-297`; `dmcancelamentocontratos.dfm:572-576`).
- `CONFIRMADO` — não existe campo de descrição nesta tela hoje, embora `ObrigarDigitacaoaoExcluir` já exista e já seja usado para Contrato no Cadastro principal via `TfrmMotivos` (`fmcadastrocontratos.pas:2271`).

### Alternância Cancelar × Excluir

- `CONFIRMADO` — o botão único (F7) alterna rótulo/ação conforme `rgbOperacao`: só na aba Orçados o botão segue `ExclusaoContrato` (`E`/`C`/`P`); em Reservados/Faturados é sempre "Cancelar F7", Exclusão nunca aparece ali (`fmcancelamentocontratos.pas:109-137`; `dmcancelamentocontratos.pas:432-459`).
- `CONFIRMADO` — no modo `P`, uma única pergunta (`ctCANCELARCONTRATOORCADO`) decide Excluir ou Cancelar para **todo o lote selecionado**, não por Contrato.
- `CONFIRMADO` — confirmação prévia única e genérica (`ctOPERACOESCONTRATOS = 'Confirme ''%s'' do(s) contrato(s).'`), sem contagem nem detalhe.

### Cancelamento (`CancelarContratos`, `dmcancelamentocontratos.pas:198-430`) — implementação própria, duplicada do Cadastro principal

- `CONFIRMADO` — autorização por `ObterAutorizacao`/permissão `DevolucaoProduto` (senha ou login), condicionada à Situação e a `AutorizacaoCancelarContratoFaturado`.
- `CONFIRMADO` — gera movimentos de estoque `TPE`/`SQU`/`TRE` para liberar reserva/futuro quando Situação `<> O`.
- `CONFIRMADO` — para Faturado: estorna crédito de troca quando existente e encerra **todas** as parcelas como `valorpagto=valorvencto`, `datapagto=DataServidor`, `filialpagto=FilialBase`, `tipopagto='E'`.
- `DIVERGENTE (confirmado)` — **não** verifica `DevolucoesouTrocasEfetuadas`, guarda que `CancelarContratoReservado` (Cadastro principal, `dmcadastrocontratos.pas:4033-4064`) aplica explicitamente para Faturado. Só a ausência de parcela paga (filtro de listagem) protege parcialmente — não cobre devolução/troca já efetuada.
- `CONFIRMADO` — cada Contrato é persistido (`Perpetrar`) individualmente dentro do loop; falha no meio interrompe o resto sem relatório por item.
- `DIVERGENTE (desativado)` — `RetiraContratodoOrcamento` está comentado tanto aqui quanto no Cadastro principal; nenhum caminho ativo desvincula o Orçamento de origem.

### Exclusão física (`ExcluirContratos`, `dmcancelamentocontratos.pas:477-534`, só em Orçados)

- `CONFIRMADO` — remove Produtos, Parcelas e o cabeçalho; nenhuma remoção de Movimentos.
- `CONFIRMADO` — Contrato Orçado nunca reserva estoque nem gera Movimentos (`.scratch/cadastro-contratos-wayfinder/issues/10-delimitar-estoque-reserva-e-conferencia.md`: "`O`: consultar disponibilidade... não reservar"), logo a ausência de exclusão de Movimentos não é lacuna.
- `NÃO LOCALIZADO` — nenhuma checagem de vínculo (Atendimento, anexo, foto, Questionário) antes de excluir, nem no Cadastro principal (`dmcadastrocontratos.pas:5899-5960`, mesmo padrão raso). Não é lacuna exclusiva desta tela — é comportamento consistente com o resto do Delphi.
- `NÃO LOCALIZADO` — nenhuma checagem de autorização explícita antes da Exclusão física, ao contrário do Cancelamento.

## Estado Laravel confirmado

- `CONFIRMADO` — não existe Cadastro de Contratos (Etapa 1 do rollout) nem os comandos `CancelarContrato`/`ReverterFaturamentoContrato` no Laravel. Existe apenas a Consulta de Contratos, majoritariamente leitura (`LegacyConsultaContratosRepository`, `ConsultaContratosPolicy`, `ConsultaContratosParameterManifest`, `ConsultaContratosGravarAlteracaoService`/`RegistrarContratoEntregaLojaService` como exceções pontuais de escrita).
- `CONFIRMADO` — precedente estrutural direto: `laravel/backend/app/Application/Vendas/Orcamentos/CancelarOrcamentoCommand.php` + `CancelarOrcamentoService.php`, cujo wayfinder de origem já chegou a produção em `laravel/specs/227-orcamento-f6-excluir-cancelar/` (spec/plan/tasks) e `laravel/docs/architecture/orcamentos-f6-cancel-exclude.md` — usar como referência de nível de detalhe e de shape de comando/serviço.
- `CONFIRMADO` — `EXCLUSAO CONTRATO` não está em nenhum manifesto Laravel; seguir exatamente o padrão de `laravel/backend/app/Support/Vendas/ConsultaContratosParameterManifest.php` (implementa `CadastroParameterManifestContract` + `PreloadsCadastroParameterManifest`, lê via `ParameterReadBundle`/`ParameterService::getMany` → `parametros_valor`, um round-trip por request) para o novo manifesto, tratando o valor como enum `E/C/P`/ausente, nunca como booleano.

## Solução funcional obrigatória

### 1. Unificação de tela e resolução por Situação

- Uma única tela/componente Laravel substitui as três telas Delphi. O filtro de Situação é um controle de escolha única (segmented/radio), nunca multi-seleção — nenhuma listagem ou execução mistura `O`/`R`/`F`.
- Dentro da Situação filtrada, resolver por item:
  - Orçado: `ExclusaoContrato = E` → só Excluir; `= C` → só Cancelar; `= P` → uma única escolha Cancelar/Excluir para todo o lote selecionado (não por item); ausente/outro → nenhuma ação.
  - Reservado e Faturado: sempre só Cancelar, para qualquer valor do parâmetro.
- Filial usada nas guardas e no registro da operação é sempre a Filial do Usuário autenticado, nunca a Filial do filtro de listagem (que é só critério de busca) — replica o padrão real do Delphi (`FilialBase` em `ExtornarParcelas`/`AtualizarSaldoCreditoCliente`).

### 2. Cancelamento em lote

Reaproveitar `CancelarContrato` (já decidido para o Cadastro de Contratos), invocado individualmente por item, uma transação por Contrato — nunca uma segunda implementação paralela da regra de negócio. Isso traz automaticamente todas as guardas já fixadas para `CancelarContrato` (financeira, fiscal, `DevolucoesouTrocasEfetuadas`, estoque, logística, `revision`, capability), fechando a lacuna real encontrada nesta tela do Delphi (ausência da guarda de devolução/troca).

Motivo continua opcional, sem filtro por tipo — fiel ao Delphi. Descrição passa a existir, condicionada a `ObrigarDigitacaoaoExcluir` (mecanismo já aplicado ao Contrato no Cadastro principal via `TfrmMotivos`, só ausente nesta tela) — quando exigida e informada, o comando reaproveitado gera Atendimento pela mesma lógica condicional já decidida para `CancelarContrato`; quando não há descrição, nenhum Atendimento é criado.

### 3. Exclusão física em lote (só Orçado)

Propor um comando novo (nome de trabalho `ExcluirContratoOrcado` — nenhum mapa anterior cobriu Exclusão física de Contrato), por item, dentro de uma transação:

1. revalidar Situação `= O` e `revision` esperada no momento da execução (infraestrutura já fixada como Fundação do Cadastro de Contratos, independente de o Delphi não ter conceito de `revision`);
2. revalidar capability `contrato.excluir_orcado` (nova, distinta de Cancelamento) e `SensitiveOperationProof`;
3. revalidar ausência de vínculo bloqueador: Atendimento, anexo, foto ou aplicação de Questionário — se houver, recusar com bloqueador tipado e oferecer Cancelamento como alternativa. **Esta é a única proteção deste prompt que não existe em nenhum caminho do Delphi** — justificada pela irreversibilidade da operação, não por rigor gratuito;
4. remover Produtos e Parcelas (não há Movimentos: Orçado nunca reserva estoque);
5. remover o cabeçalho por último;
6. preservar Auditoria por triggers `_log_new`;
7. **não** desvincular o Orçamento de origem — `RetiraContratodoOrcamento` está desativado em todo o Delphi (nesta tela e no Cadastro principal); registrar como `DÚVIDA`/`POSSÍVEL BUG LEGADO` para decisão de negócio separada, sem implementar nenhum dos dois lados por conta própria;
8. retornar resultado tipado por item.

### 4. Permissões e autorização sensível

- Acesso à tela: permissão própria (`viewAny`/`search`, mesmo padrão de `ConsultaContratosPolicy`), nunca substitui a checagem de capability por operação no backend.
- Cancelamento: capabilities `contrato.cancelar_orcado`/`contrato.cancelar_reservado`/`contrato.cancelar_faturado` (reaproveitadas tal como decidido para `CancelarContrato`), mais `SensitiveOperationProof` conforme a mesma decisão.
- Exclusão física: capability nova `contrato.excluir_orcado` mais `SensitiveOperationProof` — exigido mesmo o Delphi não tendo nenhuma checagem hoje, mesma razão de irreversibilidade do item 3 acima.
- Prova sensível de uso único, vinculada a ação/Contrato/Filial/`revision`, nunca reaproveitada entre itens do mesmo lote.

### 5. Concorrência, idempotência e resposta

- Revalidação de `revision`/Situação/capability/vínculos ocorre na execução (não na listagem). Um Contrato alterado por outra sessão entre listar e confirmar produz "conflito de revision" só para aquele item, sem abortar o restante do lote.
- Cada item é sua própria transação; falha de um não aborta os demais.
- Duplo clique, repetição de comando ou lotes sobrepostos de sessões diferentes produzem resultado idempotente por item ("já cancelado"/"já excluído"/"conflito"), nunca duplicam efeito, Atendimento, movimento ou Auditoria.
- Sem identificador de lote/`batch correlation id` — cada item usa só o `correlation id` do próprio comando (`CancelarContrato`/`ExcluirContratoOrcado`).
- Auditoria permanece a cargo dos triggers `_log_new`, sem trilha paralela específica desta tela.

### 6. Confirmação e resultado na tela

- Seleção múltipla com checkbox por linha, "selecionar todos" e contadores/totais (geral vs. marcados) — mesmo padrão do Delphi.
- Confirmação final é um resumo simples com contagem e ação ("N contratos serão cancelados"/"N contratos serão excluídos"), sem listar cada Contrato de novo — a grade acima já é a lista. No modo `Perguntar`, a escolha feita vale para todo o lote, nunca varia por item dentro da mesma execução.
- A API/resposta do backend contém o resultado tipado por item completo (sucesso, já processado, cada bloqueador tipado, sem permissão, conflito de `revision`, falha). A tela, nesta primeira versão, só precisa exibir a lista dos Contratos que tiveram sucesso — o restante do detalhamento fica disponível na resposta, sem exigência de UI dedicada para cada tipo de bloqueio.

## Contratos de API

Especificar contratos explícitos para:

1. listar/consultar Contratos elegíveis por Situação e filtros;
2. cancelar Contratos em lote (por item: `CancelarContrato`);
3. excluir fisicamente Contratos Orçados em lote (por item: `ExcluirContratoOrcado`);
4. resolver o modo Excluir/Cancelar/Perguntar por Situação e parâmetro, para a UI decidir o que oferecer antes de confirmar.

As respostas devem distinguir por item: sucesso de Cancelamento; sucesso de Exclusão; Situação não elegível; sem Motivo válido (quando informado mas inválido/inativo); descrição obrigatória ausente; Permissão negada; prova sensível ausente/inválida; bloqueio financeiro; bloqueio fiscal; bloqueio por devolução/troca; bloqueio por vínculo (Atendimento/anexo/foto/Questionário, só Exclusão); bloqueio de estoque/logística; conflito de `revision`; comando repetido (idempotente); falha transacional. Não exponha detalhes internos ou SQL na interface, mas retorne códigos estáveis e mensagens úteis.

## Costura principal de teste

Use como costura principal, no nível mais alto possível:

`abrir a tela → filtrar por Situação e demais critérios → gerar a lista (F6 equivalente) → marcar seleção total ou parcial → informar Motivo/descrição quando aplicável → confirmar (resolvendo Cancelar/Excluir/Perguntar conforme o parâmetro, escolha única para o lote no modo Perguntar) → executar o backend real por item → observar resultado (lista de sucesso na tela, resultado tipado completo na resposta) → reabrir/consultar e comprovar estado persistido e vínculos preservados/removidos corretamente`.

Essa costura deve cobrir interface, atalhos, parâmetro, Permissões, prova sensível, validações e transação por item. Testes isolados de services não a substituem.

## Testing Decisions

Ver matriz completa consolidada em `.scratch/contratos-cancelamento-lote-wayfinder/issues/09-definir-testes-e-aceite.md`. Resumo:

- Parâmetro `E`/`C`/`P`/ausente cruzado com Situação `O`/`R`/`F`; Exclusão nunca fora de Orçado.
- Seleção total/parcial, contadores, filtros sem afetar Filial da operação.
- Cancelamento: Motivo opcional, descrição condicionada a `ObrigarDigitacaoaoExcluir`, todas as guardas de `CancelarContrato` (incluindo devolução/troca), parcelas de Faturado encerradas como `E`, Atendimento único quando aplicável.
- Exclusão física: remoção completa e ordenada, bloqueio por cada tipo de vínculo, nenhuma tentativa de excluir Movimentos, `RetiraContratodoOrcamento` fora de escopo de teste.
- Permissões/prova sensível: tela, capability por operação e prova sensível de uso único, cada uma com seu próprio caso de bloqueio.
- Concorrência: conflito de `revision` na execução, idempotência por item, falha de um item não aborta os demais.
- Confirmação/resultado: contagem e ação corretas, modo `Perguntar` homogêneo por lote, lista de sucesso na tela, resposta tipada completa na API.
- Auditoria: trigger `_log_new` por item, `correlation id` por item, sem agrupamento de lote.

## User stories obrigatórias

Inclua lista extensa e numerada cobrindo, no mínimo:

1. filtrar e listar Contratos por Situação (exclusiva) e demais critérios;
2. selecionar total ou parcialmente, com contadores corretos;
3. resolver Cancelar/Excluir/Perguntar conforme `ExclusaoContrato` e Situação, por item;
4. no modo Perguntar, decidir uma vez para todo o lote;
5. informar Motivo opcional e descrição condicionada ao parâmetro;
6. cancelar em lote reaproveitando `CancelarContrato` e todas as suas guardas;
7. excluir fisicamente em lote apenas Contratos Orçados elegíveis, sem vínculo bloqueador;
8. bloquear Exclusão por Atendimento, anexo, foto ou Questionário vinculados, oferecendo Cancelamento;
9. aplicar Filial do Usuário autenticado nas guardas/registro, independente do filtro;
10. exigir Permissão de acesso à tela e capability por operação, revalidadas no backend;
11. exigir prova sensível de uso único para as duas operações;
12. revalidar `revision`/Situação/vínculos no momento da execução, não da listagem;
13. processar cada item em transação própria, sem abortar o lote inteiro por uma falha;
14. responder de forma idempotente a comandos repetidos ou lotes sobrepostos;
15. confirmar com contagem e ação corretas antes de executar;
16. exibir a lista de sucesso após a execução;
17. preservar Auditoria por triggers, com `correlation id` por item;
18. registrar `RetiraContratodoOrcamento` como dúvida de negócio, sem implementar nenhum dos dois lados.

Amplie para fluxos felizes, limites, falhas, parâmetros, permissões, concorrência, idempotência e acessibilidade.

## Critérios de aceite

Ver lista completa de 17 critérios em `.scratch/contratos-cancelamento-lote-wayfinder/issues/09-definir-testes-e-aceite.md`. Reproduzidos aqui como parte do prompt:

1. `ExclusaoContrato` é interpretado como enum `E/C/P`/ausente→Nenhuma via `parametros_valor`, nunca como booleano.
2. O filtro de Situação é exclusivo; nenhuma execução mistura `O`/`R`/`F`.
3. Exclusão física só é oferecida em Orçado; Reservado/Faturado só Cancelamento, para qualquer valor do parâmetro.
4. Modo `Perguntar` pergunta uma vez por lote, nunca por item.
5. Motivo é opcional; descrição é exigida somente quando `ObrigarDigitacaoaoExcluir` está ativo.
6. Cancelamento reaproveita `CancelarContrato` com todas as suas guardas, incluindo a guarda de devolução/troca ausente no Delphi legado desta tela.
7. Exclusão física reaproveita `ExcluirContratoOrcado`, bloqueando por vínculo de Atendimento/anexo/foto/Questionário — proteção que nenhum caminho do Delphi tem hoje.
8. Filial usada nas guardas/registro é sempre a do Usuário autenticado, nunca a do filtro de listagem.
9. Capabilities corretas por operação e permissão de acesso à tela, verificadas no backend, não só ocultadas na UI.
10. `SensitiveOperationProof` exigido para as duas operações, de uso único, não reaproveitável entre itens.
11. Revalidação de `revision`/Situação/guardas ocorre na execução; conflito produz resultado tipado por item, sem abortar o lote.
12. Comandos repetidos ou concorrentes não duplicam efeito, Atendimento ou Auditoria.
13. Cada item é sua própria transação; falha de um item não aborta os demais.
14. Confirmação declara contagem e ação corretas antes de executar.
15. Tela exibe a lista de sucesso após execução; API retorna resultado tipado completo por item.
16. Auditoria permanece a cargo dos triggers `_log_new`, com `correlation id` por item, sem agrupamento de lote.
17. `RetiraContratodoOrcamento` não é reativado nem exigido — permanece dúvida registrada para decisão de negócio separada.

## Out of Scope

- Alterar o Delphi.
- Implementar durante `/speckit.specify`.
- `ReverterFaturamentoContrato` (`F → R`) — o Delphi nunca ofereceu essa transição nesta tela, só no F6 inline do Cadastro principal.
- `TfrmCancelamentoReservas`/`dmcancelamentoreservas` (Cancelamento de Reserva prévia) — outro módulo.
- `TfrmCancelamentoContratosAberto`, `TfrmCancelamentoContratosReservados`, `TfrmExclusaoContratosOrcados` — sem ponto de entrada localizado em todo `delphi/`.
- Implementar a Etapa 1 (Fundação) do Cadastro de Contratos ou `CancelarContrato` em si — pré-requisitos desta fatia, não parte dela.
- Reativar `RetiraContratodoOrcamento` — fica como dúvida de negócio explícita, não decisão de implementação.
- Criar migrations sem necessidade comprovada.
- Identificador de lote/`batch correlation id` — decidido explicitamente que não é necessário.
- Redesenhar completamente Cadastros de Motivos, Atendimentos ou Auditoria fora do necessário a este recorte.

## Further Notes

- Vocabulário de domínio obrigatório em `AGENTS.md`/`CONTEXT.md` (raiz) e `modules/vendas/contratos/CONTEXT.md`.
- Precedente vivo de implementação equivalente: `laravel/specs/227-orcamento-f6-excluir-cancelar/` e `laravel/docs/architecture/orcamentos-f6-cancel-exclude.md` — use para calibrar granularidade de tasks/plan, não para copiar decisões de domínio (Contrato e Orçamento têm vocabulário e guardas distintos).
- Todo o histórico de decisões e evidências deste recorte está em `.scratch/contratos-cancelamento-lote-wayfinder/` (mapa e 10 tickets resolvidos).

## Formato esperado

Produza obrigatoriamente:

1. Problem Statement;
2. Solution;
3. User Stories extensas e numeradas;
4. Implementation Decisions (enum do parâmetro e resolução por Situação; matriz modo × Situação × ação; contrato de `CancelarContrato` reaproveitado; contrato de `ExcluirContratoOrcado` novo; capabilities e prova sensível; revision/locking/idempotência por item; ausência de identificador de lote; Auditoria por triggers);
5. Testing Decisions;
6. Out of Scope;
7. Further Notes;
8. matriz de evidências Delphi × Laravel;
9. matriz `E/C/P/ausente × Situação × ação`;
10. inventário de bloqueadores da Exclusão física (vínculos tipados);
11. sequência e fronteira transacional do Cancelamento em lote (por item);
12. sequência e fronteira transacional da Exclusão física em lote (por item);
13. contratos de API e erros;
14. matriz de Parâmetros, Permissões, capabilities e prova sensível;
15. critérios de aceite verificáveis (os 17 listados acima, mais quaisquer refinamentos justificados por evidência nova);
16. dúvidas remanescentes separadas dos requisitos, incluindo explicitamente `RetiraContratodoOrcamento` e o significado do campo `os` na query base.
```
