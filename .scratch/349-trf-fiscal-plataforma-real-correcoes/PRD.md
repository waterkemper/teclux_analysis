# Correções pós-revisão da plataforma fiscal real da transferência

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

A implementação `93eed411` substitui parte do caminho Fake pela plataforma fiscal real, mas a revisão encontrou estado de selagem em memória, fotografia incompleta, filial física não resolvida, listener sem fotografia, efeitos financeiros parcialmente fictícios, reconciliação Delphi incompleta, estados misturados, capability insuficiente, schema gate incompleto e violações de fronteira de persistência.

## Solution

Executar a spec complementar em cinco frentes ordenadas: durabilidade/persistência, fotografia autoritativa, eventos/projeção/estados, efeitos/Delphi e gates/testes/padrões. Cada frente possui prompt específico no módulo de emissão fiscal e deve preservar os contratos 332 e da plataforma 333–348.

## User Stories

1. Como operador, quero que uma emissão sobreviva a restart entre selagem, alocação e retry, para não perder fotografia nem disputar novo número.
2. Como plataforma fiscal, quero que toda fotografia e estado sejam duráveis, para que workers e listeners possam continuar o fluxo.
3. Como negócio, quero que filial física, preços, tributos e efeitos sejam resolvidos no servidor, para impedir autoridade fabricada.
4. Como suporte, quero distinguir situação fiscal, processamento, projeção e pendência, para operar rejeições e falhas corretamente.
5. Como financeiro, quero contrato/crédito/vencimentos aplicados de verdade ou pendência explícita.
6. Como rollout híbrido, quero reconciliar Delphi por documento, fotografia e artefatos sem segunda emissão ou mutação.

## Implementation Decisions

- A ordem é R1 → R2 → R3 → R4 → R5.
- Fake só pode ser selecionado explicitamente em teste/dry-run.
- Query Builder e acesso legado ficam em Infrastructure/Persistence.
- Eventos de autorização só acionam projeção após persistência do status e carregamento da fotografia selada.
- O schema gate é de CI/teste; introspecção de schema não decide negócio em runtime.

## Testing Decisions

Unit para invariantes e hashes; Feature para HTTP, autorização e eventos; PostgreSQL para locks, rollback, durabilidade e idempotência. Os testes devem observar efeitos persistidos e estados retornados, não detalhes de arrays internos.

## Out of Scope

NF-e de entrada, novo gateway/certificado/fila/contador, pipeline fiscal paralelo e alterações no domínio operacional de confirmação, estoque, lote e conferência.

## Further Notes

Spec detalhada: `laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md`.
