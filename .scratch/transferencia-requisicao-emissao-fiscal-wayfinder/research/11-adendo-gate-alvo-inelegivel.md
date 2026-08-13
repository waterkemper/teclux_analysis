# Adendo — gate não deve liberar grupo inelegível

Data: 2026-08-12

## Achado

`TransferenciaFiscalEnsureGrupoAlvoService` grava `estado_preparacao=FalhaOperacional` quando o dry-run encontra bloqueios de fonte. `TransferenciaHomologacaoSmokeGate`, porém, confere existência, tipo, filial, UF, diagnóstico e snapshot, mas não confere a elegibilidade persistida do grupo.

Consequência: um grupo real e coerente em identidade pode retornar `liberado_rb03=true` e só falhar depois no POST de emissão. Isso enfraquece o gate como decisão go/no-go.

## Recomendação

Criar prompt específico para que grupo ausente ou `FalhaOperacional` bloqueie RB-03 com código tipado e indique repetir o dry-run após corrigir as fontes. O gate deve continuar sem seal, série, número ou transmissão.
