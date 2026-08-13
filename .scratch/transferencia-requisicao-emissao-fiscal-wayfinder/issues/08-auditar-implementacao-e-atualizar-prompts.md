# Auditar a implementação fiscal das transferências e atualizar prompts

Type: review
Status: resolved
Blocked by:

## Question

O que da feature 332 já foi implementado no Laravel e quais lacunas devem voltar para os prompts sem duplicar o que já existe?

## Answer

Auditoria registrada em [05-auditoria-implementacao-transferencias.md](../research/05-auditoria-implementacao-transferencias.md).

O MVP implementou grupos, idempotência, dry-run, endpoints, tabelas Cloud e testes com Fake. Permanecem como complementação obrigatória: adapter e binding reais da plataforma fiscal, persistência durável sem Cache, fotografia carregada server-side com dados fiscais completos, validação da transferência confirmada, projeção somente após AUTORIZADA por evento, efeitos reais idempotentes, reconciliação Delphi autoritativa, capability/escopo de filial e schema gate fiscal.

Os prompts foram atualizados em [01-speckit-prompt-fiscal-transferencia.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/01-speckit-prompt-fiscal-transferencia.md) e [02-speckit-prompt-completar-integracao-real.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/02-speckit-prompt-completar-integracao-real.md). A spec agora contém REQ-TRF-FISCAL-025 a 038.
