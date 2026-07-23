# Atualizar o dossiê e o prompt Spec Kit da Quitação

Type: task
Status: resolved
Blocked by: 03, 04

## Question

Como incorporar as decisões ao dossiê e ao prompt `/speckit.specify` existentes, de forma autocontida e sem pedir ao Cursor para recriar componentes Laravel já implementados?

## Answer

As decisões foram incorporadas diretamente aos artefatos canônicos existentes, sem criar addendum ou prompt concorrente:

- `modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md` foi revalidado para 2026-07-21, passou a registrar as divergências concretas do Laravel atual e ganhou a seção “Correção prioritária do vínculo bancário”.
- `modules/financeiro/contas-pagar/quitacao-duplicata/speckit-prompt.md` continua sendo um único prompt `/speckit.specify` autocontido e agora coloca a correção bancária observada em produção como requisito prioritário.

O dossiê e o prompt agora fixam:

- `movtosbancos.documento` derivado de `chequepagto`, vazio sem cheque e nunca de `documentopag`;
- histórico canônico `[NF|DOC][ complemento] DUP {documentopag}/{numero} - {Parte Fornecedora}`, incluindo o exemplo `DOC DUP 209120/1 - ANDRA UNIFORMES`;
- `PAGTO DIVERSAS DUPLICATAS` no cabeçalho agregado e histórico individual nos eventos;
- aprofundamento de `ContasPagarMovimentoBancarioWriter`/`LegacyContasPagarMovtosBancosRepository`, sem recriar commands, rotas, repositories ou UI existentes;
- interface interna tipada de registrar/estornar, resultado `APPLIED|SKIPPED` e link completo `{conta,data,sequencia,evento,sequenciaevento}`;
- persistência atômica de `evento`, `sequencia` e `sequenciaevento` na Duplicata;
- integração condicionada também por `datapagto >= Início Integração Bancos`, sem Movimento para zero/Adiantamento;
- agregação explícita por cheque e recomposição determinística do cabeçalho;
- Cancel por evento exato e Rebuild estornar/reaplicar sem duplicação;
- locks PostgreSQL determinísticos e `MAX+1` permitido somente sob lock, eliminando a contradição do texto anterior;
- mapper/schema SQLite com `sequenciaevento` e fail-fast para o shape PostgreSQL legado;
- diagnóstico dry-run, classes de inconsistência, `--apply-safe` restrito a prova única, backup, Auditoria e tratamento humano dos ambíguos;
- fases de rollout e asserts literais/concorrentes/idempotentes para formatter, Pay, Cancel, Rebuild, adapters, UI, PostgreSQL e saneamento.

O prompt instrui o Cursor a inspecionar o Laravel atual apenas para encaixar a mudança, preservar ativos compatíveis e produzir uma spec pronta para `/speckit.plan`; não pede nova leitura do Delphi, entrevista ou implementação. Nenhum arquivo Laravel/Delphi foi alterado neste Wayfinder.
