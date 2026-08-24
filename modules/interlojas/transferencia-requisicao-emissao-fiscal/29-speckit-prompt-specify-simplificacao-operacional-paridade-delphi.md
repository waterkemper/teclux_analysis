# Prompt /speckit.specify - simplificacao operacional paridade Delphi

Revise o codigo atual, assumindo 27 e 28 implementados, contra os relatorios Delphi versionados, a spec 398 e os contratos vigentes. Nao implemente codigo: produza spec, matriz, plano, tarefas, testes, aceite e quickstart.

## Objetivo

O Delphi concentra ConfirmaRequisicao, validacao, estoque, numeracao, dados fiscais, movimentos e commit em uma jornada; depois transmite, salva XML e imprime. O Laravel pode estar expondo ao operador diagnostico/gate/smoke, escolha sanear_fiscal/replay, segunda acao depois de F8, replay, reconciliacao, outbox e custodia DANFE.

Confirmar no codigo/UI o que e passo humano. Ferramentas tecnicas nao devem ser etapas manuais da emissao normal.

## Desenho desejado

Projetar uma interface operacional pequena:

1. operador confirma a Transferencia;
2. apos o commit operacional, uma acao unica "Emitir NF-e da Transferencia" ou disparo automatico equivalente inicia o fluxo;
3. backend executa classificacao atual, prova, fotografia, numeracao FOR UPDATE, Cloud, outbox, transmissao, reconciliacao e DANFE;
4. operador ve processando, autorizado/PDF disponivel, documento existente ou pendencia com proxima acao.

sanear_fiscal vira recuperacao administrativa; replay, retry, status e reconciliacao viram automacoes; diagnostico/gate/smoke tornam-se pre-condicoes internas; grupos e multi-grupo sao automaticos.

## O que nao simplificar

Preservar releitura e FOR UPDATE, dadofiscal atual, prova dos movimentos, seriesfiliais, fotografia imutavel, idempotencia, outbox, retry, pendencia, nao duplicacao de NF/movimento/efeito, separacao entre commit e SEFAZ, XML/nfeProc/protocolo/DANFE/hash e PDF apos autorizacao.

Nao reintroduzir VendaTransferencia, DevolucaoTransferencia, NFS-e, cancelamento/inutilizacao nesta origem, etiquetas, DANFE simplificada, UniDANFE ou impressoras.

## Decisao F8

Comparar e recomendar: A) F8 e emissao separados tecnicamente, com emissao enfileirada apos commit; B) acao "confirmar e emitir", disparando emissao somente apos commit F8. Escolher a alternativa que preserve rollback operacional, nunca mantenha SEFAZ na transacao de estoque e elimine modo tecnico no caminho normal.

## Aceite

Testar uma acao principal para emissao valida; operador sem escolha de modo tecnico; falha como pendencia compreensivel; retry sem duplicacao; documento existente sem nova emissao; grupos automaticos; preservacao de locks, fotografia, outbox e fronteiras transacionais.

Entregar comparacao Delphi/Laravel, matriz manter/ocultar/automatizar, interface minima, estados/mensagens, contratos de retry/observabilidade e plano incremental. Nao alterar codigo nesta execucao do /speckit.specify.
