# Definir testes e critérios de aceite

Type: task
Status: resolved
Blocked by: 05-reconciliar-contrato-cancelamento-lote, 06-definir-contrato-exclusao-fisica-lote, 07-definir-permissoes-auditoria-concorrencia-lote, 08-definir-experiencia-tela-cancelamento-lote

## Question

Qual é a matriz completa de testes e critérios de aceite verificáveis para Cancelamento e Exclusão em lote de Contratos, cobrindo os três valores de `ExclusaoContrato`, as três abas, seleção parcial/total, Motivo obrigatório, permissões, concorrência/idempotência e resultado detalhado por item?

## Answer

Consolidação direta das decisões dos tickets 04–08; nenhuma decisão nova aqui, só a matriz de verificação.

### Parâmetro e resolução por Situação

- `ExclusaoContrato = E/C/P`/ausente-outro (`Nenhuma`), cruzado com Situação filtrada `O`, `R`, `F`.
- Orçado: `E` só oferece Excluir; `C` só oferece Cancelar; `P` pergunta uma vez para o lote inteiro (Excluir ou Cancelar, nunca por item); ausente/outro desabilita a ação.
- Reservado e Faturado: sempre só Cancelar, para qualquer valor do parâmetro — Exclusão nunca aparece fora de Orçado.
- Filtro de Situação é exclusivo: nenhuma seleção/execução mistura `O`/`R`/`F` na mesma leva.

### Seleção e listagem

- Seleção total (`selecionar todos`) e parcial, com contadores/totais corretos (geral vs. marcados).
- Filtros Filial/Vendedor/Cliente/Data de emissão aplicados corretamente à listagem, sem afetar a Filial usada na operação (que é sempre a do Usuário autenticado, nunca a do filtro).
- Selecionar/gerar lista vazia não permite confirmar.

### Cancelamento (`CancelarContrato` reaproveitado)

- Motivo informado e não informado (Motivo continua opcional) — sem filtro de `tipomotivo`.
- Descrição ausente quando `ObrigarDigitacaoaoExcluir` inativo; descrição exigida e validada quando ativo.
- Todas as guardas de `CancelarContrato` (ticket 21) se aplicam por item: financeira (`QualQuerPagamento`), fiscal, `DevolucoesouTrocasEfetuadas`, estoque, logística — incluindo o caso que faltava no Delphi legado (Faturado com devolução/troca efetuada mas parcelas tecnicamente em aberto deve ser bloqueado, não passar despercebido).
- Cancelamento de `O`, `R`, `F` cada um respeitando sua guarda própria (guarda de autorização de `R`/`F` só dispensada quando aplicável, replicando `AutorizacaoCancelarContratoFaturado`).
- Parcelas de Faturado corretamente encerradas como `E`/Estornado ao cancelar.
- Atendimento criado uma única vez quando descrição exigida/informada; nenhum Atendimento quando não há descrição.

### Exclusão física (`ExcluirContratoOrcado`, só em Orçado)

- Exclusão bem-sucedida remove Produtos e Parcelas e por último o cabeçalho; nenhum órfão.
- Bloqueio por Atendimento, anexo, foto ou aplicação de Questionário vinculados — cada um com seu próprio caso de teste, oferecendo Cancelamento como alternativa.
- Nenhuma tentativa de excluir Movimentos (Orçado nunca tem).
- `RetiraContratodoOrcamento` **não** é exercido nem exigido nos testes desta fatia — dúvida registrada, fora de critério de aceite até decisão de negócio.

### Permissões e autorização sensível

- Sem permissão de acesso à tela: bloqueado antes de listar.
- Com acesso à tela mas sem a capability da operação (`contrato.cancelar_orcado/reservado/faturado` ou `contrato.excluir_orcado`): ação individual bloqueada mesmo com Contrato elegível.
- `SensitiveOperationProof` ausente/inválido/expirado bloqueia tanto Cancelamento quanto Exclusão.
- Prova sensível de uso único não pode ser reaproveitada entre itens do mesmo lote.

### Concorrência e idempotência

- Revalidação de `revision`/Situação/capability/vínculos ocorre na execução, não na listagem — Contrato alterado por outra sessão entre listar e confirmar produz "conflito de revision" só para aquele item, sem abortar o lote.
- Duplo clique, repetição do comando e duas sessões processando lotes sobrepostos não duplicam efeito, Atendimento ou movimento — resultado idempotente por item ("já cancelado"/"já excluído"/"conflito").
- Falha de um item não impede o processamento independente dos demais (transação por item, não por lote).

### Confirmação e resultado na tela

- Confirmação mostra contagem e ação corretas antes de executar (nunca mistura Cancelar/Excluir na mesma confirmação).
- Modo `Perguntar`: a escolha feita se aplica a todos os itens do lote, nunca varia por item dentro da mesma execução.
- Tela exibe, após executar, a lista dos Contratos que tiveram sucesso.
- API/resposta do backend contém o resultado tipado por item (sucesso, já processado, cada tipo de bloqueio, sem permissão, conflito, falha), mesmo quando a tela não renderiza todos os tipos.

### Auditoria

- Cada item processado gera Auditoria via triggers `_log_new`, sem duplicidade.
- Cada item tem seu próprio `correlation id`; não existe/não é necessário um identificador de lote agrupando-os.

## Critérios de aceite

1. `ExclusaoContrato` é interpretado como enum `E/C/P`/ausente→Nenhuma via `parametros_valor`, nunca como booleano.
2. O filtro de Situação é exclusivo; nenhuma execução mistura `O`/`R`/`F`.
3. Exclusão física só é oferecida em Orçado; Reservado/Faturado só Cancelamento, para qualquer valor do parâmetro.
4. Modo `Perguntar` pergunta uma vez por lote, nunca por item.
5. Motivo é opcional; descrição é exigida somente quando `ObrigarDigitacaoaoExcluir` está ativo.
6. Cancelamento reaproveita `CancelarContrato` (ticket 21) com todas as suas guardas, incluindo a guarda de devolução/troca ausente no Delphi legado desta tela.
7. Exclusão física reaproveita `ExcluirContratoOrcado`, bloqueando por vínculo de Atendimento/anexo/foto/Questionário — proteção que nenhum caminho do Delphi tem hoje.
8. Filial usada nas guardas/registro é sempre a do Usuário autenticado, nunca a do filtro de listagem.
9. Capabilities corretas por operação (`contrato.cancelar_orcado/reservado/faturado`, `contrato.excluir_orcado`) e permissão de acesso à tela, verificadas no backend, não só ocultadas na UI.
10. `SensitiveOperationProof` exigido para as duas operações, de uso único, não reaproveitável entre itens.
11. Revalidação de `revision`/Situação/guardas ocorre na execução; conflito produz resultado tipado por item, sem abortar o lote.
12. Comandos repetidos ou concorrentes não duplicam efeito, Atendimento ou Auditoria.
13. Cada item é sua própria transação; falha de um item não aborta os demais.
14. Confirmação declara contagem e ação corretas antes de executar.
15. Tela exibe a lista de sucesso após execução; API retorna resultado tipado completo por item.
16. Auditoria permanece a cargo dos triggers `_log_new`, com `correlation id` por item, sem agrupamento de lote.
17. `RetiraContratodoOrcamento` não é reativado nem exigido — permanece dúvida registrada para decisão de negócio separada.
