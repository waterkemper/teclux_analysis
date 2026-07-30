# Prompt para /speckit.specify — inutilização de numeração

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para inutilizar faixa de numeração fiscal, reutilizando o pipeline de Eventos Fiscais de `10-speckit-prompt.md` e coordenando-o com a numeração de `03-speckit-prompt.md`.

Não implemente. Trate inutilização como operação fiscal própria, nunca como cancelamento de uma Emissão existente.

## Limite desta entrega

- solicitação por Filial, ambiente, modelo, série, ano, faixa e justificativa;
- autorização reforçada, reautenticação/confirmação do intervalo e auditoria;
- verificação transacional contra números autorizados, reservados, já inutilizados e faixas concorrentes/sobrepostas;
- Reconciliação prévia obrigatória dos números duvidosos;
- transmissão idempotente, Tentativas, protocolo, XML e Artefatos;
- bloqueio definitivo da faixa para alocação somente após autorização confirmada;
- acompanhamento operacional na Central.

Não inclua distribuir inutilização por e-mail, reutilizar números ou alterar uma NF-e autorizada.

## Testes obrigatórios

- faixa livre autorizada e bloqueada para numeração futura;
- número usado/reservado/ambíguo, sobreposição, justificativa inválida e acesso negado;
- concorrência entre alocação e inutilização mantém resultado consistente;
- rejeição e timeout não marcam a faixa como inutilizada;
- retry idempotente e reconciliação de resposta ambígua;
- protocolo/XML ficam custodiados e auditados.

Produza spec, plano, modelo da faixa, contrato do comando e testes concorrentes. Não implemente durante `/speckit.specify`.
```
