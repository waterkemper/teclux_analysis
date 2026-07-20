# F6 — Exclusão e Cancelamento do Orçamento

Label: wayfinder:map

## Destination

Produzir uma análise de lacunas baseada em evidências e pronta para `$to-spec` sobre todas as funcionalidades do comando F6 no Cadastro de Orçamentos: descarte de rascunho, Cancelamento e Exclusão física, incluindo parâmetros, confirmações, motivos, vínculos, efeitos, permissões, Auditoria, concorrência e diferenças Delphi–Laravel.

## Notes

- Consultar `grilling` e `domain-modeling`. Usar **Cancelamento** para preservação do Orçamento com mudança de Situação e **Exclusão** para remoção física definitiva.
- Tratar `delphi/` e `laravel/` como somente leitura. Analisar PAS e DFM conjuntamente, incluindo ancestral, data module, queries, eventos, actions, SQL, units compartilhadas, parâmetros e permissões.
- Classificar toda descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- Não converter automaticamente limitações ou bugs do Delphi em requisitos.
- O Parâmetro do Sistema `ExclusaoOrcamento` possui três comportamentos funcionais a preservar: Cancelar, Excluir ou Perguntar.
- Se configurado para Cancelar, F6 abre o fluxo de Cancelamento; se configurado para Excluir, confirma explicitamente a Exclusão; se configurado para Perguntar, apresenta as duas ações e suas consequências.
- Exclusão física só pode ocorrer em Orçamento aberto e sem Contrato, Documento Fiscal, Atendimento, envio registrado ou qualquer uso/vínculo relevante. Existindo vínculo, oferecer somente Cancelamento.
- Cancelamento exige Motivo; a descrição é obrigatória somente conforme `Obrigar digitação ao excluir`.
- Cancelamento preserva Produtos, Serviços, Planos, Parcelas e histórico, registrando data/hora, Usuário, Motivo e descrição.
- Nunca criar Cliente automaticamente para cancelar Orçamento sem Cliente.
- Quando houver Cliente e descrição obrigatória, preservar o Atendimento de tipo `CancelamentoOrcamento`. Sem Cliente, manter Motivo/descrição no Orçamento, sem Cliente ou Atendimento artificiais.
- Ao cancelar, invalidar envios de e-mail pendentes e preservar envios processados, enviados ou com erro como histórico.
- Para Orçamento novo ainda não persistido, F6 apenas descarta o rascunho após confirmação; não é Cancelamento nem Exclusão de domínio.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Proteções efetivas do ancestral Delphi e do banco que podem impedir Exclusão física além da Situação aberta.
- Inventário completo de tabelas filhas, vínculos externos, cascatas e triggers afetados.
- Semântica física real dos valores do Parâmetro do Sistema e sua resolução por Filial.
- Diferenças entre Cancelamento pela tela de Cadastro e Cancelamento em lote pela Consulta de Orçamentos.
- Política de reativação de Orçamento cancelado, caso exista, e sua relação com este fluxo.
- Contrato de revisão, idempotência e retorno autoritativo.
- Matriz completa de testes e critérios de aceite.

## Out of scope

- Implementar o fluxo ou alterar Delphi/Laravel.
- Cancelar Contrato, Documento Fiscal ou Venda derivados.
- Reativar Orçamentos cancelados, salvo se a investigação comprovar que é uma consequência inseparável do F6.
- Redesenhar motivos, Atendimentos, e-mail ou Auditoria fora do necessário ao Cancelamento/Exclusão do Orçamento.
- Executar migrations, Composer, npm, builds, formatadores ou geradores nas junctions.

