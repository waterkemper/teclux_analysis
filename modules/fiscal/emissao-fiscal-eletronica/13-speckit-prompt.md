# Prompt para /speckit.specify — contingências de NF-e

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para operar contingências de NF-e modelo 55 e retornar ao fluxo normal. Depende de `05`, `07` e `10` em em /mnt/c/teclux_analysis/modules/fiscal/emissao-fiscal-eletronica/; reutilize configuração, Eventos, Reconciliação e Artefatos existentes.

Não implemente. Especifique somente modalidades oficialmente habilitadas por UF/modelo/ambiente/vigência.

## Limite desta entrega

- Episódio de Contingência com modalidade, motivo, ator, abertura/fechamento e estados próprios;
- decisão manual autorizada e auditada para SVC, EPEC e FS-DA quando habilitadas;
- revisão derivada da Fotografia quando mudar chave, `tpEmis` ou horário, preservando a revisão normal;
- geração, assinatura, transmissão/impressão e Artefatos corretos por modalidade;
- retorno controlado ao normal, transmissão/regularização pendente e reconciliação antes de qualquer ação duplicadora;
- capabilities e pendências correspondentes na Central;
- limites/circuit breaker isolados por UF, autorizador, ambiente e serviço.

Não inclua NFC-e offline, seleção automática não autorizada ou failover para Delphi.

## Decisões e testes obrigatórios

- modalidade não habilitada é recusada no servidor;
- entrada/saída exige motivo e responsável; relógio inválido bloqueia nova assinatura;
- testes específicos cobrem cada modalidade habilitada, indisponibilidade, reabertura e retorno ao normal;
- revisão derivada não destrói a fotografia normal;
- reprocessamento não duplica Emissão, protocolo ou evento;
- DANFE e Artefatos identificam a contingência efetivamente usada.

Produza spec, plano, máquina do Episódio, matriz UF/modalidade e testes. Não implemente durante `/speckit.specify`.
```
