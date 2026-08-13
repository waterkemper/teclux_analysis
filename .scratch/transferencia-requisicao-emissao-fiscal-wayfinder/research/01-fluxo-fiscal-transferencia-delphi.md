# Pesquisa — fluxo fiscal da Transferência de Requisição no Delphi

Data: 2026-08-11

## Fontes e limite

Fontes primárias locais:

- C:\teclux_analysis\delphi\apps\interlojas\dmtransferenciarequisicaoexposicao.pas
- C:\teclux_analysis\delphi\apps\interlojas\dmtransferenciarequisicaoexposicao.dfm
- C:\teclux_analysis\delphi\repositorio\dmbasico.pas

O diretório local delphi é um junction para C:\projetos.vcl. Perpetrar, CancelarAtualizacoes, CalcularImpostos, AtribuirDadosProdutos, AtribuirDadosCalculosImpostos, TTecNotaFiscalEletronica e as funções PostgreSQL são caixas-pretas quando seus corpos não pertencem a estas fontes.

## Resumo

**CONFIRMADO:** ConfirmaRequisicao percorre pedidosfiliais em ordem de Requisitante/Produto, seleciona apenas quantidade recebida maior que zero, situação A e lote marcado, e fecha uma nota por grupo de Filial Requisitante. Trocar de requisitante finaliza a nota anterior; os lotes entram na observação.

**CONFIRMADO:** Se os oito primeiros dígitos do CNPJ do destino forem iguais aos da FilialBase, o tipo é Transferencia. Caso contrário, a tela escolhe entre VendaTransferencia e DevolucaoTransferencia.

**CONFIRMADO:** O fluxo avança série e cria o cabeçalho/itens antes do commit principal. A NF-e é validada antes do commit, mas transmissão, XML, DANFE e e-mail ocorrem depois.

**POSSÍVEL BUG LEGADO:** Há commits separados e ausência de rollback global. Falhas pós-numeração ou pós-commit podem deixar dados fiscais, série, estoque, pedidos, lotes, contrato ou artefatos incompletos.

## 1. Entrada, condições e agrupamento

**CONFIRMADO:** A consulta mestre lê pedidosfiliais, notas, produtos, características, filiais e estoques; inclui dado fiscal, série/número, filiais físicas, situação, quantidades, lotes e dados tributários; ordena por pf.requisitante, pf.produto.

Fonte: dmtransferenciarequisicaoexposicao.dfm:156-273.

**CONFIRMADO:** Antes do loop, são verificadas inconsistências entre quantidade recebida e reserva prévia, quantidade lida e quantidade confirmada, além de produtos não conferidos quando MensagemProdutosNaoConferidosnaNF está ativa.

Fonte: dmtransferenciarequisicaoexposicao.pas:902-905, 3155-3262, 3795-3831.

**CONFIRMADO:** O loop só processa qtderecebida > 0, situacao = A e marcarlotetransferencia=true. Quando o requisitante muda, fecha WhereSQL/ListadeLotes, chama ImprimirNotaFiscal, reinicializa os datasets e inicia outro grupo; ao final fecha o último grupo.

Fonte: dmtransferenciarequisicaoexposicao.pas:924-970.

**INFERIDO:** A unidade fiscal legada é uma nota por requisitante, não uma nota por linha nem necessariamente por lote. Isso depende da ordenação da consulta, não de uma chave de agrupamento persistida.

**CONFIRMADO:** IncluirProdutos consulta a Filial destino. ehRaizCNPJ compara os oito primeiros dígitos do CNPJ do destino com os oito primeiros dígitos de cnpjfilialbase; raiz igual define Transferencia, raiz diferente exibe NF de Venda ou NF de Devolução.

Fontes: dmtransferenciarequisicaoexposicao.pas:2180-2196; dmbasico.pas:17851-17854.

**DÚVIDA:** O código não documenta a regra externa que escolhe devolução em vez de venda; apenas registra a escolha do usuário e usa DevolucaoPorTransferencia depois.

## 2. Preparação antes da numeração

**CONFIRMADO:** Na primeira nota, ComplementoDadosFiscais insere dadosfiscais e abre o modal de transportador. Depois copia transportadora, frete, via, placa, observação e volume para dadosfiscais/volumesdadosfiscais. Nos grupos seguintes reutiliza TranspNotaFiscal.

Fonte: dmtransferenciarequisicaoexposicao.pas:834-893, 1317-1332.

**CONFIRMADO:** qryDadosFiscaisNewRecord define modelodocto, manual=false, versaolayout=3.10, formapagto=2, formato DANFE retrato, forma de emissão, regime tributário, presença 1 e finalidade normal.

Fonte: dmtransferenciarequisicaoexposicao.pas:2711-2727.

**CONFIRMADO:** VerificarSerieFilial consulta filial/série em seriesfiliais com FOR UPDATE e rejeita ausência da série ou de modelonota.

Fontes: dmtransferenciarequisicaoexposicao.dfm:774-794; dmtransferenciarequisicaoexposicao.pas:1817-1824, 2646-2665.

**CONFIRMADO:** Antes da numeração, BloquearEstoque cria estoques ausentes e chama Perpetrar([qryEstoques]); em seguida abre qryEstoqueBloqueio para os pares produto/filial. VerificarSaldoEstoqueouReserva compara reserva prévia ou estoque conforme ParSistema.RequisicaoSubtraiEstoque.

Fontes: dmtransferenciarequisicaoexposicao.pas:693-746, 3084-3128; dmtransferenciarequisicaoexposicao.dfm:826-876.

**POSSÍVEL BUG LEGADO:** A inclusão de linhas de estoque já é persistida antes do número e da nota. Além disso, produtos sem saldo são removidos do dataset; se restar algum, o fluxo pode emitir somente uma parte do conjunto selecionado.

## 3. Numeração e cabeçalho

**CONFIRMADO:** PreencherNotaFiscal acrescenta notas com filial=FilialBase, serie=SerieSugestao e numero=seriesfiliais.numeroinicial; depois incrementa numeroinicial. A alteração fica em CachedUpdates até o Perpetrar posterior.

Fonte: dmtransferenciarequisicaoexposicao.pas:2464-2482.

**CONFIRMADO:** qryNotas usa notas where dadofiscal=0; qrySeriesFiliais usa a linha de seriesfiliais da filial/série, com CachedUpdates e FOR UPDATE.

Fonte: dmtransferenciarequisicaoexposicao.dfm:498-532, 774-824.

**CONFIRMADO:** PreencherDadoFiscal chama dadosfiscais_proximonumero(), grava o número em notas.dadofiscal e dadosfiscais.numero, e preenche situação N, filial de venda/emissão, destinatário, natureza, código fiscal, transporte, totais e demais campos do cabeçalho.

Fontes: dmtransferenciarequisicaoexposicao.dfm:1033-1051; dmtransferenciarequisicaoexposicao.pas:1352-1445.

**CONFIRMADO:** O emitente é FilialBase; o destinatário é a Filial Requisitante, com CNPJ, razão, endereço, IE, cidade/IBGE e contribicms obtidos por qryFilialDestino.

Fontes: dmtransferenciarequisicaoexposicao.dfm:1053-1173; dmtransferenciarequisicaoexposicao.pas:1396-1441.

**CONFIRMADO:** Cada item recebe dadofiscal e número sequencial; volumesdadosfiscais é ligado ao mesmo dado fiscal.

Fonte: dmtransferenciarequisicaoexposicao.pas:1447-1468.

**CONFIRMADO:** ImprimirNFE preenche nrdocumento, código aleatório, chave de acesso, dígito módulo 11, ambiente, processo, versão TecLUX e informação complementar. CondicaoEmissorNFE depende de ParSistema.EmissorNfe e modelo 55 ou 57.

Fontes: dmtransferenciarequisicaoexposicao.pas:1483-1526, 3019-3031.

## 4. Itens, impostos e movimentos

**CONFIRMADO:** Transferencia e VendaTransferencia agregam por produto/FilialEstoque, somam quantidade e tribquantidade, acumulam Listacodigopedidofilial, marcam entregar=true, chamam AtribuirDadosProdutos e calculam impostos com operações distintas:

- TransferenciaSaida + noTRANSFERENCIAMERCADORIASSAIDA;
- TransferenciaSaida + noVENDAS_TRANSFERENCIA_ENTRE_EMPRESA.

Fontes: dmtransferenciarequisicaoexposicao.pas:2201-2277.

**CONFIRMADO:** DevolucaoTransferencia lê saldo de entradas em produtosnotaspag/notaspag, por filial/produto, considerando situação N e entradas de compra; distribui a quantidade sobre as entradas mais recentes e cria itens com codigonota/numeroprodutotabela. Usa DevolucaoporTransferencia e noSAIDADEVOLUCAO_TRANSFERENCIA_ENTRE_EMPRESA.

Fontes: dmtransferenciarequisicaoexposicao.dfm:2578-2620; dmtransferenciarequisicaoexposicao.pas:2279-2377.

**DÚVIDA:** vQuantidadeJaVerificada é atualizado somando qtdedevolvida depois do incremento, e não somente o incremento. Não é possível afirmar se é intencional.

**CONFIRMADO:** IncluirMovimentos aloca números com movimentos_proximonumero(), cria movimento por item, liga produto/filial, cliente=filial, tipocliente=L, trfproduto, trffilial, dadofiscal e referência NF-número/S-série TRANSFERENCIA; valor é quantidade vezes preço de venda, truncado em duas casas.

Fonte: dmtransferenciarequisicaoexposicao.pas:2020-2069; dmtransferenciarequisicaoexposicao.dfm:878-1011.

**CONFIRMADO:** O tipo é SPT quando a requisição subtrai estoque e SET caso contrário. Diferença pedida não confirmada gera TPE; futuro disponível pode gerar TFR.

Fonte: dmtransferenciarequisicaoexposicao.pas:2076-2135.

**INFERIDO:** SPT/SET/TPE/TFR representam baixa, transferência e recomposição de reserva/futuro conforme o motor legado. O efeito exato sobre saldos depende de triggers/funções não lidos.

**CONFIRMADO:** AtualizarPedidosFiliais grava situação F e dadofiscal em cada pedido listado pelo item agregado. O commit principal inclui também dtmRequisicaoExposicao.qryPedidosFiliais e qrymovimentos, portanto há efeito no DataModule compartilhado da Requisição.

Fontes: dmtransferenciarequisicaoexposicao.pas:642-691, 1913-1918.

## 5. VendaTransferencia, devolução, crédito e tabelas relacionadas

**CONFIRMADO:** VendaTransferencia grava contratofrentecaixa=NumContrato, vendedor=UsuarioLogin.CodigoUsuario e vendatransferencia=true. NumContrato é obtido por contratos_proximonumero(). Depois do commit principal chama gerarcontratopordadofiscal(dadofiscal, 'Transferencia'), move contratofrentecaixa para contrato, limpa o campo temporário e persiste novamente.

Fontes: dmtransferenciarequisicaoexposicao.pas:1377-1385, 1933-1953, 3052-3061; dmtransferenciarequisicaoexposicao.dfm:2396-2427.

**NÃO LOCALIZADO:** O corpo de gerarcontratopordadofiscal e suas tabelas de escrita não foram encontrados.

**CONFIRMADO:** DevolucaoTransferencia cria produtostrocados tipo E, com referência NF TRANSF. DEV. FILIAL. VendaTransferencia consulta ValorCreditoTrocaEntreFiliais; se houver crédito, grava produtostrocados tipo S e cria venctosdadosfiscais com forma T para crédito e D para o saldo; sem crédito cria uma parcela D.

Fontes: dmtransferenciarequisicaoexposicao.pas:1756-1813, 1857-1908; dmtransferenciarequisicaoexposicao.dfm:2429-2529.

**CONFIRMADO:** A tabela de vencimentos usada é venctosdadosfiscais; não foi localizado objeto chamado vencimentos. O fluxo lê notaspag/produtosnotaspag para devolução e qryNotaEntradaRef fornece as notas de entrada referenciadas ao GerarNFe.

Fontes: dmtransferenciarequisicaoexposicao.dfm:2429-2468, 2578-2620, 2651-2748; dmtransferenciarequisicaoexposicao.pas:3063-3082.

**NÃO LOCALIZADO:** Não há criação de nova notaspag, produtosnotaspag ou Nota Fiscal de Entrada no Perpetrar principal.

**POSSÍVEL BUG LEGADO:** Devolução edita qtdedevolvida em qryDadosNotasPag, mas o campo é alias calculado como 0.00 e qryDadosNotasPag não está na lista do Perpetrar principal. Não há evidência de persistência do consumo da entrada em produtosnotaspag/notaspag.

**DIVERGENTE:** A jornada separada de Confirmação por Notas, documentada em modules/interlojas/confirmacao-por-notas/pesquisa-transacao-delphi.md, cria notaspag e itens financeiros. Este DataModule de Transferência de Requisição não cria notaspag no commit observado; lê notaspag/produtosnotaspag apenas para montar uma devolução. A diferença é de jornada, não foi tratada como conflito entre fontes.

## 6. Ordem do commit e transmissão

**CONFIRMADO:** A sequência efetiva por grupo é:

1. ComplementoDadosFiscais;
2. VerificarSerieFilial;
3. BloquearEstoque e lock de estoque;
4. VerificarSaldoEstoqueouReserva;
5. PreencherNotaFiscal;
6. PreencherDadoFiscal;
7. IncluirMovimentos;
8. AtualizarPedidosFiliais;
9. CalcularImpostos;
10. anexar lotes à observação;
11. criar créditos e vencimentos;
12. ImprimirNFE(true), quando NF-e habilitada;
13. Perpetrar principal;
14. limpar lotes;
15. gerar contrato, quando VendaTransferencia;
16. ImprimirNFE sem validação ou TdtmImprimeFiscal.ImprimirNota.

Fonte principal: dmtransferenciarequisicaoexposicao.pas:1816-1977.

**CONFIRMADO:** O Perpetrar principal inclui dadosfiscais, venctosdadosfiscais, notas, movimentos, produtos, seriesfiliais, pedidos atualizados, volumes, produtostrocados e os datasets compartilhados da Requisição.

Fonte: dmtransferenciarequisicaoexposicao.pas:1910-1918.

**CONFIRMADO:** ImprimirNFE(true) apenas chama GerarNFe em modo de validação. Depois do commit, ImprimirNFE efetivo verifica o serviço quando NFeTipoEmissao está em [1,3], chama EnviarNFe e grava lote/protocolo/status. Depois tenta CompartilharXML, SalvarConteudoxml, ImprimirDanfe e EnviarEmail.

Fontes: dmtransferenciarequisicaoexposicao.pas:1598-1753, 1910-1966.

**CONFIRMADO:** Respostas 301/302 gravam situação D e exibem aviso de denegação. Outras respostas persistem protocolo, status e data de processamento; a rotina não mostra uma transição explícita para autorizado além desses campos.

Fonte: dmtransferenciarequisicaoexposicao.pas:1639-1668.

**CONFIRMADO:** A limpeza de lote é outro ExecSQL/Perpetrar e só zera lotetransferencia quando dadofiscal is null.

Fonte: dmtransferenciarequisicaoexposicao.dfm:2750-2775; dmtransferenciarequisicaoexposicao.pas:1925-1930.

**NÃO LOCALIZADO:** Diretório final, retenção, checksum, fila durável, tentativa/erro de artefato e reconciliação não aparecem neste módulo.

## 7. Falhas e persistência parcial

**CONFIRMADO:** PreencherDadoFiscal, IncluirMovimentos e AtualizarPedidosFiliais tratam exceções, chamam CancelarAtualizacoes([]) e relançam erro contextualizado.

Fonte: dmtransferenciarequisicaoexposicao.pas:1470-1478, 2160-2169, 680-688.

**CONFIRMADO:** ConfirmaRequisicao tem try/finally, mas não tem except nem rollback global.

Fonte: dmtransferenciarequisicaoexposicao.pas:920-986.

**POSSÍVEL BUG LEGADO:** ImprimirNotaFiscal é chamada sem atribuir seu retorno a result em 937 e 970. Uma falha que retorne False, sem exceção, pode não interromper o comando como esperado.

**POSSÍVEL BUG LEGADO:** O estoque ausente pode ser persistido antes da numeração; a série/número e os grupos anteriores podem permanecer mesmo se um grupo posterior falhar.

**CONFIRMADO:** A série é consumida antes do commit e a transmissão depois dele. Falha de transmissão não devolve automaticamente numeroinicial nem remove notas/dadosfiscais.

Fonte: dmtransferenciarequisicaoexposicao.pas:2464-2482, 1910-1966.

**CONFIRMADO:** Uma falha pós-commit pode deixar nota em situação N com número/chave/itens, sem protocolo final, XML compartilhado, DANFE ou e-mail.

Fonte: dmtransferenciarequisicaoexposicao.pas:1371-1374, 1483-1526, 1616-1720.

**NÃO LOCALIZADO:** Não há neste procedimento estado de erro de transmissão, outbox, lease, tentativa durável ou consulta automática da chave quando EnviarNFe retorna False.

**CONFIRMADO:** A finalização é grupo a grupo; um grupo anterior pode estar commitado quando outro falhar.

Fonte: dmtransferenciarequisicaoexposicao.pas:931-942, 952-970.

**DÚVIDA:** O alcance real de CancelarAtualizacoes e a atomicidade interna de Perpetrar dependem de implementações não lidas.

## 8. Matriz de efeitos

| Objeto | Efeito observado | Classificação |
|---|---|---|
| pedidosfiliais | Situação F, dadofiscal e limpeza condicional de lote | CONFIRMADO |
| dadosfiscais | Cabeçalho, chave, totais, protocolo/status, contrato/crédito | CONFIRMADO |
| notas | Filial/série/número/dadofiscal | CONFIRMADO |
| seriesfiliais | Avanço de numeroinicial, linha bloqueada por FOR UPDATE | CONFIRMADO |
| produtosdadosfiscais | Itens da saída | CONFIRMADO |
| movimentos | SPT/SET, TPE, TFR | CONFIRMADO |
| estoques | Linha ausente criada antes da nota; saldos dependem do motor | CONFIRMADO / INFERIDO |
| volumesdadosfiscais | Transporte e volumes | CONFIRMADO |
| venctosdadosfiscais | Parcelas T/D na venda entre filiais | CONFIRMADO |
| notaspag/produtosnotaspag | Leitura para devolução; escrita não confirmada | CONFIRMADO / NÃO LOCALIZADO |
| produtostrocados | Crédito de troca E/S | CONFIRMADO |
| contratos | Função pós-commit; tabelas internas não visíveis | NÃO LOCALIZADO |
| produtosconferencia | Pré-validação externa; escrita fiscal não observada | NÃO LOCALIZADO |

## 9. Implicações para a nova spec

1. Definir a identidade do grupo fiscal por Filial Requisitante, incluindo todos os códigos de pedidos agregados.
2. Separar preparação, numeração/commit, transmissão, artefatos, DANFE, e-mail e reconciliação.
3. Decidir explicitamente se Laravel preservará ou corrigirá os efeitos parciais: estoque antes da numeração, commits por grupo, limpeza de lotes separada, contrato pós-commit e transmissão pós-commit.
4. Dar fronteira própria a VendaTransferencia: contrato, crédito de troca, vencimentos e gerarcontratopordadofiscal.
5. Definir a persistência da baixa de notaspag/produtosnotaspag na devolução, pois a leitura existe mas a escrita não foi confirmada.
6. Usar chave de origem por grupo, tratar situação N pós-numeração e reconciliar falhas de transmissão/artefatos.

## Não confirmado neste ticket

- Corpo de Perpetrar e CancelarAtualizacoes.
- Triggers/funções de saldo de movimentos.
- Corpo de CalcularImpostos e AtribuirDados*.
- Corpo de gerarcontratopordadofiscal e ValorCreditoTrocaEntreFiliais.
- Diretórios e implementação interna de UniNFe/CompartilharXML/SalvarConteudoxml.
- Persistência real de qtdedevolvida no fluxo de devolução.
