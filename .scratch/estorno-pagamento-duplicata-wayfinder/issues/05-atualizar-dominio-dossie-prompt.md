# Atualizar o domínio, o dossiê e o prompt Spec Kit

Type: task
Status: resolved
Blocked by: 03, 04

## Contexto adicional

- Registrar a supersessão parcial da ADR-0246: preservar comandos financeiros dedicados, mas revogar Refazer Pagamento como operação oficial.

## Answer

- Atualizado `CONTEXT.md` com **Estorno do Pagamento** como termo canônico, separado de Exclusão e de nomes legados.
- Reescrito `modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md` como fonte canônica de Quitação, imutabilidade `PAID` e Estorno `PAID -> AUTHORIZED`.
- Reescrito `modules/financeiro/contas-pagar/quitacao-duplicata/speckit-prompt.md` como prompt pronto para gerar a spec: exige inspeção prévia do Laravel/Delphi, reaproveitamento da implementação atual, guard backend/UI, vínculo bancário exato, falha segura, preflight histórico, remoção ponta a ponta da reconstrução privilegiada e testes PostgreSQL reais.
- Criada `laravel/docs/adr/0247-duplicata-paga-imutavel-estorno-unico.md`, registrando a decisão e suas consequências.
- Marcada a ADR-0246 como parcialmente supersedida, preservando rascunho separado, commands financeiros, Writer origem `P`, reconciliador e gate contábil, mas revogando Refazer Pagamento.
- As referências restantes a Cancel/Rebuild nos novos artefatos são exclusivamente baseline a renomear/remover, nunca capacidade a manter.
- Nenhum código Delphi ou Laravel de runtime foi alterado neste Wayfinder.

## Comments

- Refinamento posterior: confirmado que a branch ativa é `246-documentos-pagar-parity`, com Spec Kit já existente. O prompt foi ajustado para emendar incrementalmente `spec.md`, `plan.md`, `tasks.md`, `data-model.md`, `research.md` e `contracts/` da feature 246, sem executar `/speckit.specify`, criar branch ou criar nova pasta de spec.

## Question

Como registrar o vocabulário definitivo e incorporar a imutabilidade pós-pagamento e o Estorno do Pagamento aos artefatos canônicos, removendo instruções conflitantes sobre Cancelamento/Refazer sem pedir ao Cursor para recriar o Laravel existente?
