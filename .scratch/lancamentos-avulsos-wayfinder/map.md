# Migração de Estoques — Lançamentos Avulsos

Label: wayfinder:map

## Destination

Produzir um dossiê funcional e técnico autocontido de **Estoques → Lançamentos Avulsos**, confrontando o comportamento Delphi, as funções/triggers PostgreSQL que transformam `movimentos` em saldos de `estoques` e estoque por Lote, e o estado atual do Laravel, até definir um contrato seguro e verificável pronto para gerar PRD e prompt SpecKit sem exigir nova investigação do legado.

## Notes

- O módulo Delphi identificado inicialmente é `fmlancamentosmanuais`/`dmlancamentosmanuais`; confirmar menu, permissões e eventuais units auxiliares antes de fixar o nome funcional.
- A tabela `movimentos` é o Livro-Razão operacional do estoque; `estoques` e as estruturas de estoque por Lote são projeções/materializações atualizadas por triggers. A aplicação Laravel não deve recalcular ou atualizar saldos em paralelo sem decisão explícita.
- A pesquisa PostgreSQL autorizada pelo Usuário é somente leitura na base local `puxare`, `localhost:5432`. Extrair DDL, triggers, funções chamadas, tabelas afetadas e regras de erro/transação; não inserir, atualizar, excluir, desabilitar triggers nem executar funções de negócio.
- Investigar inserção, alteração e exclusão de `movimentos`, inclusive relações `cmpmovimento`, `negmovimento`, `trfmovimento`, `loteproduto`, transferências, compostos, custo/financeiro, última compra e flags que suprimem triggers.
- Distinguir validações/UI Delphi, contrato da tabela `tiposmovimentos`, semântica posicional de `operacao`, efeitos realmente garantidos pelo banco e riscos que não devem ser copiados.
- Analisar sempre o Laravel atual: componentes de Produto/Filial/Lote, lookups, Policies, abilities, serviços de Filial, padrões de Auditoria, transações, repositories e precedentes de gravação em `movimentos`.
- Toda Filial deve ser autorizada server-side; operações sensíveis devem ter Permissão/Autorização e Auditoria explícitas.
- Priorizar o banco como autoridade de atualização dos saldos enquanto as triggers forem o contrato vigente; prevenir dupla aplicação, concorrência, retries duplicados e gravações parciais.
- O resultado final deve permitir criar `modules/estoque/lancamentos-avulsos/09-speckit-prompt.md` sem mandar o SpecKit investigar Delphi ou banco legado.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar o módulo Delphi de Lançamentos Avulsos](issues/01-inventariar-modulo-delphi-lancamentos-avulsos.md) — confirmou fluxo de inclusão-only em `movimentos`, autorização por Gerente de Estoque, campos/abas/lookups, semântica UI das 20 posições de `operacao`, Lotes/transferência/compostos e defeitos de Filial, concorrência, transação e Última Compra global.
- [Extrair triggers e funções de `movimentos` no PostgreSQL](issues/02-extrair-triggers-e-funcoes-movimentos-postgresql.md) — confirmou `movimentos` como livro encadeado, `estoques` como projeção Produto+Filial e a cadeia de Lotes `movimentos` → `movimentoslotes` → `estoqueslotes`, mantida transacionalmente por triggers.
- [Mapear o Laravel atual para estoque e gravação de movimentos](issues/03-mapear-laravel-estoque-e-gravacao-movimentos.md) — confirmou a ausência do módulo/comando e definiu o reuso seguro de Filiais, autorização sensível, auditoria, Tipos, lookups e consultas, exigindo novos limites para escrita trigger-aware, idempotência e tradução de erros.
- [Modelar o contrato de Movimento e projeções](issues/04-modelar-contrato-de-movimento-e-projecoes.md) — definiu Lançamento Avulso como inclusão imutável de uma única raiz, com `operacao`, encadeamento, relacionados, Lotes e projeções pertencendo à transação trigger-aware do PostgreSQL.
- [Definir o fluxo Laravel seguro de Lançamentos Avulsos](issues/05-definir-fluxo-laravel-seguro-lancamentos-avulsos.md) — fixou página e comando síncronos, preparação/confirmação prévia, acesso e autorização, lookups contextuais, idempotência durável, transação trigger-aware, erros e critérios de aceite.
- [Consolidar o dossiê e o prompt SpecKit](issues/06-consolidar-dossie-e-prompt-speckit.md) — publicou o dossiê e o prompt autocontidos, prontos para especificação sem acesso ao Delphi ou PostgreSQL.

## Not yet specified

## Out of scope

- Implementar o módulo Laravel durante este Wayfinder.
- Alterar, desabilitar ou substituir triggers/funções da base local.
- Corrigir dados ou saldos existentes.
- Alterar o Delphi.
- Migrar todos os fluxos que gravam `movimentos`; o foco é Lançamentos Avulsos e somente as dependências necessárias para explicar seus efeitos.
- Copiar bypasses de trigger, SQL concatenado, vazamentos de Filial ou autorização apenas visual.
