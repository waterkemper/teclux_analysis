# Pesquisar lotes, agrupamentos e atendimento parcial da Transferência

Label: wayfinder:issue
Type: research
Status: resolved

## Question

Qual é a semântica completa de `lotestransferencia`/`pedidosfiliais.lotetransferencia` na Transferência de Requisição para Exposição e como ela deve ser preservada no Laravel, inclusive quando a quantidade confirmada é menor que a quantidade pedida?

## Evidence to inspect

- Delphi: `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas`, especialmente `ConfirmaRequisicao`, `VerificarLoteTransferencia`, `GerarLoteTransferencia`, `ReincluirRequisicao` e as validações de `qtderecebida`.
- Delphi: `delphi/biblio/clparametrossistema.pas`, parâmetro `ReincluirRequisicaoSaldoPendente`.
- Laravel: `TransferenciaRequisicaoConfirmarService`, `TransferenciaRequisicaoGerarLoteService`, `TransferenciaRequisicaoReabrirService` e `TransferenciaFiscalFormarGruposService`.

## Required output

Documentar, classificando cada ponto como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA:

1. Se o lote operacional apenas seleciona/consolida itens para a conferência ou se também define a unidade de emissão fiscal.
2. Se uma NF continua sendo formada por filial requisitante, mesmo contendo itens de lotes diferentes, ou se o lote impõe uma separação adicional.
3. Em que momento a quantidade é lida novamente com lock e qual é a fonte de verdade para `qtdepedida`, `qtderecebida` e saldo.
4. Como o parâmetro de saldo pendente deve ser representado no Laravel: desligado, por filial, global ou configuração equivalente.
5. Como criar a nova requisição/linha de saldo sem copiar `dadofiscal`, sem duplicar movimento de estoque e sem reabrir a requisição já atendida parcialmente.
6. Se a nova requisição deve manter `codigoorigem`/referência da original e como impedir duplicação em retry.

Do not implement code. End with the smallest set of decisions needed for a future `/speckit.specify` prompt.

## Answer

### CONFIRMADO — lote operacional não define a NF

No Delphi, `lotestransferencia` é criado/associado às linhas selecionadas para conferência. A consulta é ordenada por requisitante e produto, e `ConfirmaRequisicao` encerra o grupo fiscal apenas quando muda a filial requisitante. Os números dos lotes são acumulados em `ListadeLotes` e gravados nas observações da NF.

Assim, uma NF é formada por filial requisitante e pode conter linhas de vários lotes operacionais. O lote não é lote SEFAZ e não cria uma NF por lote. O Laravel já segue essa regra: `TransferenciaFiscalFormarGruposService` agrupa por requisitante e trata `lotetransferencia` como metadado operacional.

### CONFIRMADO — saldo pendente

O Delphi usa o parâmetro `ReincluirRequisicaoSaldoPendente`. Quando `qtdepedida > qtderecebida`, cria uma nova requisição aberta com saldo `qtdepedida - qtderecebida`, mesmo produto/filiais, `codigoorigem` apontando para a linha original, observação “Saldo pendente da requisição n. X” e sem `dadofiscal`. A linha original permanece concluída pela NF; não é reaberta.

O Laravel já tem o parâmetro no `TransferenciaRequisicaoExposicaoParameterManifest` e o handler fiscal já:

- relê as linhas com `lockForUpdate`;
- fecha as linhas confirmadas vinculando `dadofiscal`;
- libera a diferença de reserva com `TPE/TFR`;
- cria a nova requisição aberta;
- cria `TEP` para o saldo quando a requisição subtrai estoque.

### DIVERGENTE — ajuste de compatibilidade ainda necessário

O Laravel não grava atualmente a observação “Saldo pendente da requisição n. X” na nova linha; grava `codigoorigem` e deixa a observação nula. Isso não muda a quantidade nem o documento fiscal, mas perde a rastreabilidade textual existente no Delphi.

### POSSÍVEL BUG LEGADO / DECISÃO A VALIDAR

O Delphi expõe uma `filial_estoque` física derivada do cadastro da filial requisitada. O Laravel usa a filial ativa em partes da fotografia e resolve a filial física nos repositórios de estoque. O próximo ticket de auditoria deve confirmar que a fotografia, a nova requisição e os movimentos usam a mesma identidade física, inclusive para filiais virtuais.

Pesquisa detalhada: [Pesquisa — lotes, agrupamentos e saldo parcial](../research/24-lotes-agrupamentos-e-saldo-parcial.md).
