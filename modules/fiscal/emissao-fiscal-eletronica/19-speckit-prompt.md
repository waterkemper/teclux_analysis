# Prompt para /speckit.specify — rollout, observabilidade e operação assistida

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para rollout, observabilidade, suspensão e operação assistida da plataforma fiscal. Esta etapa final depende de `08`, `13`, `15`, `17` e `18` implementados e homologados.

Não implemente. Inspecione Pulse, Sentry, filas, scheduler, autorização e configuração existentes. Os testes funcionais serão executados e aprovados manualmente pelo usuário; automação fornece evidência, mas não promove sozinha.

## Limite desta entrega

- Modo de Operação Fiscal por Filial, ambiente, modelo e Série: `DELPHI`, `LARAVEL_CANARIO` ou `LARAVEL`;
- mudança apenas para novas emissões, por Administrador fiscal, com justificativa e auditoria;
- suspensão da combinação afetada impedindo novas emissões, mas permitindo consulta, reconciliação e recuperação;
- métricas/painéis para filas, idade, latência, rejeições, reconciliação, contingência, eventos, outbox, leases, Artefatos, certificados, distribuição e relógio;
- Pulse para agregados, Sentry para exceções e Telescope fora de produção;
- incidente crítico persistente, e-mail a administradores e suspensão, sem failover automático Delphi;
- runbooks de recuperação, reconciliação, contingência/retorno, certificado, S3, transferência e suspensão;
- observabilidade de Contribuinte Fiscal, Filial e Vínculos de Certificado Fiscal, incluindo impacto de uma versão compartilhada;
- Observador Regulatório com polling HTTP dos catálogos oficiais, snapshots/hash/diff, classificação de impacto, revisão humana, homologação, aprovação, rollout e rollback de alterações normativas;
- roteiro/evidências de homologação e aceite.

## Decisões obrigatórias

1. Promoção é manual após testes executados e aprovados pelo usuário; não há gate automático de volume/duração.
2. Ordem: homologação → uma Filial canário → NF-e → NFC-e → demais Filiais, uma Série por vez.
3. Auditoria guarda usuário, Contribuinte Fiscal, Filial, vínculo, alvo, ação, justificativa, sessão/IP, correlação e antes/depois, nunca XML completo ou segredos.
4. A nomenclatura de rollout deve respeitar a especificação consolidada; não substituir por `off/mirror/active` sem mapear formalmente os estados.
5. Nenhuma atualização de MOC, NT, schema, tabela, endpoint, QR Code, TLS, contingência ou prazo pode ativar produção automaticamente.

## Testes e entregáveis

- transições de modo autorizadas/proibidas e efeito somente em novas emissões;
- suspensão não interrompe reconciliação/recuperação;
- alertas críticos, certificados compartilhados/exclusivos, vínculos, relógio, filas e S3 são exercitados;
- inclusão, alteração, retificação, republicação e retirada de artefato normativo geram evidência, impacto, aprovação e não ativam produção sem homologação;
- runbooks são testados por simulações de falha e registram evidência;
- matriz mínima cobre autorização/rejeição/timeout NF-e, NFC-e normal/offline, eventos, inutilização, contingência, S3, SMTP, espelhamento e transferência;
- spec define checklist de aceite manual e rollback por Série/Filial.

Produza spec, plano operacional, catálogo de sinais/alertas, runbooks e matriz de homologação. Não implemente durante `/speckit.specify`.
```
