# Prompt para /speckit.specify — correção e retransmissão de NF-e rejeitada

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para corrigir e retransmitir uma NF-e explicitamente rejeitada e elegível. Depende de `04-speckit-prompt.md` e deve reutilizar seus comandos e pipeline.

Não implemente. Confirme no checkout Laravel quais dados da Nota Fiscal de Saída podem ser editados e mantenha regras fiscais server-side.

## Limite desta entrega

- classificação de rejeição corrigível e capabilities calculadas no servidor;
- comando autenticado de correção com `expected_revision`, motivo, ator e idempotency key;
- nova revisão imutável da Fotografia ligada à anterior, com nova serialização/hash;
- preservação ou substituição do número somente conforme regra fiscal aplicável;
- nova tentativa pelo pipeline normal e encaminhamento à reconciliação quando ambígua;
- histórico comparável de revisões sem expor XML/segredos na auditoria.

Não inclua alteração de documento autorizado, cancelamento, CC-e ou edição livre de XML.

## Decisões obrigatórias

1. Retentativa técnica reutiliza revisão e bytes; mudança de conteúdo sempre cria revisão.
2. Autorização bloqueia correção de conteúdo.
3. Elegibilidade e campos corrigíveis vêm do servidor, nunca do navegador.
4. Número alocado não é liberado para outra emissão.

## Testes obrigatórios

- rejeição elegível corrigida e autorizada;
- rejeição inelegível, revisão obsoleta e usuário sem permissão;
- comparação prova imutabilidade das revisões;
- retry da mesma chave não cria revisão/tentativa duplicada;
- falha ambígua segue para reconciliação;
- tentativa de corrigir autorizada é recusada.

Produza spec, plano, contrato do comando, matriz de elegibilidade e testes. Não implemente durante `/speckit.specify`.
```
