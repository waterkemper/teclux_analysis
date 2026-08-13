# Pesquisar o fluxo fiscal da Transferência de Requisição no Delphi

Type: research
Status: resolved
Blocked by:

## Question

Qual é o fluxo fiscal efetivamente executado quando a Transferência de Requisição para Exposição confirma e emite uma nota: métodos, condições, parâmetros, ordem dos efeitos, agrupamentos, tabelas dadosfiscais, notas, seriesfiliais, vencimentos, notaspag e relacionadas, VendaTransferencia, Artefatos e projeções? Separar o que acontece antes/depois da numeração e o que o Delphi deixa parcialmente persistido em falhas.

## Answer

Pesquisa concluída em [01-fluxo-fiscal-transferencia-delphi.md](../research/01-fluxo-fiscal-transferencia-delphi.md).

- **CONFIRMADO:** o Delphi processa linhas elegíveis em ordem de Requisitante/Produto e fecha uma NF-e por grupo de Filial Requisitante.
- **CONFIRMADO:** raiz de CNPJ igual à FilialBase leva a Transferencia; raiz diferente permite VendaTransferencia ou DevolucaoTransferencia.
- **CONFIRMADO:** estoque, série, cabeçalho, itens, impostos, movimentos e pedidos são preparados antes do commit; a transmissão, XML, DANFE e e-mail ocorrem depois.
- **CONFIRMADO:** seriesfiliais é bloqueada e avançada antes da persistência fiscal; a transmissão não devolve automaticamente a numeração em caso de falha.
- **POSSÍVEL BUG LEGADO:** commits separados e ausência de rollback global permitem grupos anteriores, estoque, número, contrato ou nota parcial persistirem quando um grupo posterior ou a transmissão falha.
- **NÃO LOCALIZADO:** outbox durável, reconciliação, retenção/checksum de artefatos e corpo das funções legadas de contrato/impostos/saldo.

Esta resposta não decide ainda se haverá documento fiscal de entrada, nem a atomicidade desejada no Laravel; essas decisões permanecem nos tickets 02 e 03.
