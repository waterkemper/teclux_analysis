# Consolidar o dossiê e o prompt Spec Kit de Contas a Pagar

Type: task
Status: resolved
Blocked by: 05

## Question

Como consolidar todas as evidências e decisões em um dossiê de paridade e em um prompt Spec Kit autocontido, executável pelo Cursor e alinhado aos padrões atuais do Laravel, publicados em `modules/financeiro/contas-pagar/`, com requisitos, reusos obrigatórios, arquivos prováveis, cenários, segurança, testes, critérios de aceite e exclusões explícitas?

## Answer

Foram publicados dois artefatos finais:

1. [`modules/financeiro/contas-pagar/dossie.md`](../../../modules/financeiro/contas-pagar/dossie.md) — contrato autoritativo de paridade, com estado Laravel, domínio, fluxos, regras, Permissões/Autorizações, Filiais, parâmetros canônicos, transações, comandos, fases, testes, ADRs e exclusões.
2. [`modules/financeiro/contas-pagar/09-speckit-prompt.md`](../../../modules/financeiro/contas-pagar/09-speckit-prompt.md) — prompt autocontido para `/speckit.specify`, pronto para colar no Cursor, que proíbe nova investigação Delphi e orienta somente a inspeção de integração no Laravel atual.

O prompt preserva a implementação existente, organiza o trabalho em P0–P6, impede pagamento antes das correções de segurança/integridade, fixa os textos canônicos de `parametros_valor`, separa rascunho de comandos financeiros, exige prova sensível server-side, Filiais autorizadas, idempotência, locks, auditoria, reconciliação e integração PostgreSQL real.

Foram incorporados os ADRs Laravel aplicáveis: UI ERP (0002), parâmetros de módulo (0005) e fail-fast de schema legado (0007). O prompt inclui requisitos, fluxos felizes/falhas, contratos prováveis, erros, testes por camada, critérios globais e fora de escopo. Os arquivos foram validados quanto a estrutura e fechamento do bloco de prompt.

Não restaram decisões ou investigações necessárias antes da geração da spec; o destino do mapa foi alcançado.
