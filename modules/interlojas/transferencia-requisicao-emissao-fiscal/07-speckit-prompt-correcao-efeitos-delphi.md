# Prompt de implementação — Projeção de transferência e reconciliação Delphi

```text
/speckit.implement

Implemente R4 de `laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md`, depois de R3.

A ponte fiscal desta feature aceita e executa somente `Transferencia`. Não implemente `VendaTransferencia` nem `DevolucaoTransferencia`: esses tipos ficam fora do escopo, inclusive seus efeitos financeiros, referências, baixas, pendências e testes. Valores históricos podem continuar legíveis no armazenamento, mas devem ser rejeitados pelo pipeline com erro explícito.

Para `Transferencia`, aplique apenas a projeção de satisfação no destino. O efeito deve ter evidência mensurável, chave natural, verificação de conteúdo e idempotência em retry/concorrência; o hash não pode declarar efeitos financeiros que não foram executados.

Reconcilie Delphi usando dados legados autoritativos: origem/transferência, FilialBase, requisitante, tipo, emitente, modelo 55, série, número, chave, fotografia/hash e artefatos. Documento compatível deve ser espelhado/vinculado sem retransmissão ou nova numeração; divergência deve gerar pendência sem mutar Delphi.

Cubra documento compatível, ausência, divergência de série/número/chave/hash/artefato, efeitos aplicados, efeito pendente e dois retries concorrentes.
```
