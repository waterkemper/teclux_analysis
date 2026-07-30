# Prompt para /speckit.specify — reconciliação de NF-e ambígua

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para reconciliar NF-e cujo resultado de autorização ficou incerto. Construa sobre `04-speckit-prompt.md`; não reimplemente autorização normal.

Não implemente nesta etapa. Inspecione o Laravel e use a especificação consolidada como autoridade funcional.

## Limite desta entrega

- fila `fiscal-reconciliacao`, comandos, leases, tentativas e sweeper de trabalhos parados;
- consulta por chave/recibo e janela configurável para “não localizada”;
- comparação obrigatória de chave, emitente, modelo, série, número, digest e assinatura antes de importar protocolo;
- convergência para autorizada, rejeitada ou permanência acionável em reconciliação;
- resposta de duplicidade tratada como indício para consulta;
- incidente crítico e bloqueio mutável quando a autorização encontrada for incompatível;
- liberação de retransmissão dos mesmos bytes somente após evidência conclusiva de inexistência.

Não inclua correção de conteúdo, eventos, contingência ou telas gerais da Central.

## Invariantes e testes

- nunca há retentativa cega após envio possivelmente iniciado;
- consultas continuam permitidas com circuit breaker de autorização aberto;
- execuções concorrentes/repetidas convergem sem duplicar protocolo ou projeção;
- teste cobre timeout antes/depois do aceite, duplicidade, não localizada dentro/fora da janela, autorização compatível e incompatível;
- último erro, próxima tentativa, idade e correlação permanecem observáveis;
- desvio excessivo de relógio bloqueia assinatura/transmissão, não reconciliação.

Produza spec, plano, algoritmo de decisão explícito, estados e matriz de testes. Não implemente durante `/speckit.specify`.
```
