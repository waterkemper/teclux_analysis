# Pesquisa — lotes, agrupamentos e saldo parcial

## Sources

- Delphi: `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas`
- Delphi: `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.dfm`
- Delphi: `delphi/apps/interlojas/dmrequisicaoexposicao.pas`
- Delphi: `delphi/apps/interlojas/dmrequisicaoexposicao.dfm`
- Delphi: `delphi/biblio/clparametrossistema.pas`
- Laravel: `laravel/backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalFormarGruposService.php`
- Laravel: `laravel/backend/app/Services/Interlojas/TransferenciaRequisicaoExposicao/TransferenciaRequisicaoConfirmarGroupHandler.php`
- Laravel: `laravel/backend/app/Services/Interlojas/TransferenciaRequisicaoExposicao/TransferenciaRequisicaoExposicaoParameterManifest.php`

## Findings

### CONFIRMADO — lote operacional não define a NF

O Delphi cria/associa `lotestransferencia.codigo` às linhas marcadas para conferência. A consulta da transferência é ordenada por `pf.requisitante, pf.produto`, e `ConfirmaRequisicao` só encerra o grupo fiscal quando a filial requisitante muda. O código acumula os números de lote em `ListadeLotes` e os grava nas observações da NF.

Portanto, a regra é:

- um grupo fiscal/NF por filial requisitante;
- vários lotes operacionais podem estar no mesmo grupo;
- lote operacional não é lote SEFAZ nem deve gerar uma NF por lote.

O Laravel já expressa a mesma decisão em `TransferenciaFiscalFormarGruposService`: agrupa por requisitante e trata `lotetransferencia` como metadado operacional.

### CONFIRMADO — atendimento parcial cria nova requisição

No Delphi, após incluir a quantidade recebida nos produtos da NF, `ConfirmaRequisicao` verifica `qtdepedida > qtderecebida`. Com `ReincluirRequisicaoSaldoPendente) ativo, chama `ReincluirRequisicao`, que cria uma nova linha aberta com:

- o mesmo produto, requisitante, requisitada e filial de estoque resolvida;
- quantidade `qtdepedida - qtderecebida);
- `codigoorigem) apontando para a linha original;
- observação “Saldo pendente da requisição n. X”;
- nenhum `dadofiscal) herdado.

A linha original continua sendo concluída pela NF emitida; ela não é reaberta.

### CONFIRMADO — movimentos do saldo

No Delphi, `IncluirMovimentos` libera a parte não confirmada da reserva, usando `TPE) e, quando necessário, `TFR). A nova requisição é gravada e a reserva correspondente é criada como `TEP).

O Laravel já possui a mesma coreografia no `TransferenciaRequisicaoConfirmarGroupHandler`: libera a diferença por produto, insere a nova requisição e cria o `TEP) do saldo quando `requisicao_subtrai_estoque) está ativo.

### CONFIRMADO — parâmetro já existe no Laravel

O parâmetro legado `Reincluir requisições com saldo pendente) já está no `TransferenciaRequisicaoExposicaoParameterManifest`, resolvido pelo `ParameterService) para a filial ativa e consumido pelo handler fiscal. Não é necessário criar um novo parâmetro para este comportamento.

### DIVERGENTE — rastreabilidade textual da nova requisição

O método Laravel `inserirReinclusao) grava `codigoorigem), quantidade, situação aberta e `dadofiscal) nulo, mas atualmente recebe observação nula. O Delphi grava explicitamente “Saldo pendente da requisição n. X”. A compatibilidade textual/auditável deve ser tratada no ticket de auditoria posterior.

### POSSÍVEL BUG LEGADO / DECISÃO A VALIDAR — filial física

O Delphi expõe `filial_estoque) como filial física derivada do cadastro da filial requisitada, inclusive para filial virtual. O Laravel usa a filial ativa em partes da fotografia e deixa a resolução física para os repositórios de estoque. Antes de fechar o prompt de ajuste, deve ser confirmado que a fotografia fiscal e a nova requisição usam a mesma filial física que os movimentos.

## Decisions for the next prompt

1. Manter um grupo fiscal por filial requisitante; não separar NF por `lotetransferencia).
2. Manter o lote operacional como metadado de conferência/observação, distinto do lote fiscal de transmissão.
3. Reutilizar o parâmetro existente de saldo pendente.
4. Criar uma nova linha aberta por linha original com saldo positivo, `codigoorigem), observação compatível e sem documento fiscal herdado.
5. Calcular o saldo somente sobre linhas relidas sob lock; liberar e reservar a diferença sem duplicar movimentos.
6. Validar a filial física antes de publicar o prompt final.
