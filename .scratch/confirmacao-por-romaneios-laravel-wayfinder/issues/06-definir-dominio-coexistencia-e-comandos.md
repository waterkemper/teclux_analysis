# Definir domínio, coexistência e comandos da Confirmação por Romaneios

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 05

## Answer

A modelagem foi fechada com entrevista HITL e está registrada também no [CONTEXT.md](../../../laravel/CONTEXT.md). A regra de compatibilidade é paridade funcional com o Delphi: mesmos filtros, elegibilidade, mensagens, estados, operações e efeitos observáveis; a implementação Laravel pode corrigir N+1, commits parciais, concatenação SQL e cancelamento apenas visual.

- **Fronteira:** Cadastro de Romaneios mantém o agregado; Confirmação por Romaneios reproduz o fluxo de confirmação de romaneios do Delphi; Confirmação por Notas permanece fluxo distinto. Não há estado Laravel paralelo.
- **Unidade atômica:** cada Romaneio selecionado é uma unidade independente; todos os seus efeitos confirmam juntos ou sofrem rollback juntos; falhas não desfazem outros Romaneios do lote e o resultado é por unidade.
- **Concorrência:** reler e bloquear Romaneios em ordem determinística, validar Filial, revisão, situação e elegibilidade dentro da transação e rejeitar somente unidades alteradas. Não usar “última gravação vence”.
- **Idempotência:** retry após timeout ou resposta perdida não duplica efeitos; confirmação já concluída retorna sua evidência anterior; estado incompatível retorna conflito explícito.
- **Autorização/auditoria:** separar Operador e Autorizador, permitindo a mesma pessoa quando a regra Delphi permitir; acesso ao menu não concede autoridade sensível; registrar Filial, Romaneio, revisão, decisão, motivo e resultado sem senha e sem bypass administrativo implícito.
- **Rollback:** a unidade inclui efeitos fiscais, estoque, pedidos, financeiro, movimentos, situação e auditoria; qualquer falha desfaz tudo e não publica sucesso antes do commit.
- **Coexistência:** Delphi e Laravel compartilham tabelas, funções e situações PostgreSQL; funções autoritativas confirmadas não devem ser substituídas por cálculo PHP, MAX()+1 ou sequência paralela.
- **Elegibilidade:** manter as invariantes Delphi: não ser Romaneio de Passagem, entrada CONFIRMADA, Filial autorizada, documento ainda elegível, não casado e filtros fiscais/CFOP/situação/vínculos revalidados.
- **Transição:** após o commit, a situação é calculada pelos mesmos contratos PostgreSQL do Delphi; não criar status paralelo.

Nenhum PAS/DFM, módulo Laravel ou migration foi implementado nesta decisão; também não foram executados testes de driver ou hashtablefs.

## Question

Qual é a fronteira canônica entre Confirmação por Romaneios, Confirmação por Notas e Cadastro de Romaneios; quais agregados, estados, invariantes e transições a tela consulta ou altera; e qual contrato transacional Laravel preserva a coexistência com Delphi? Decidir unidade atômica, locks determinísticos, revisão/concorrência, idempotência, auditoria, autoria, autorização e rollback, sem portar cegamente commits parciais do legado.

Resolver com `/grilling` e `/domain-modeling`, confrontando cada decisão com o inventário e o schema. Se surgir termo novo ou conflito com `laravel/CONTEXT.md`, registrar a decisão de domínio antes de escrever prompts.
