# Pesquisa — mapeamento da Fotografia Fiscal da Transferência

## Escopo e conclusão

Esta pesquisa mapeia a origem dos dados de Transferência de Requisição para Exposição para a Fotografia Fiscal da plataforma existente. Não decide se a operação produz somente NF-e de saída, também NF-e de entrada ou apenas projeções no destino.

- **CONFIRMADO:** o Delphi monta uma saída fiscal a partir de linhas de pedidosfiliais com quantidade recebida, agrega por produto/filial física, prepara dadosfiscais, produtosdadosfiscais, volumesdadosfiscais, venctosdadosfiscais, notas e movimentos, e só depois persiste o conjunto.
- **CONFIRMADO:** a plataforma fiscal exige valores já resolvidos e IDs de origem em fotografia autocontida, versionada, canônica, hashada e imutável. Geração, retry, DANFE e explicação não podem completar uma revisão consultando cadastros atuais.
- **DÚVIDA:** o snapshot autoritativo do módulo de transferência não inclui as tabelas fiscais, precos, contratos ou rastreabilidade completa de lote de produto.
- **POSSÍVEL BUG LEGADO:** a confirmação agrupa por requisitante e persiste grupos sequenciais; a fonte não prova rollback dos grupos anteriores se um grupo posterior falhar.

## Autoridade e evidências

1. Identificação, participantes, itens, tributos, totais, transporte, cobrança, pagamentos, referências, configurações e versões devem estar na fotografia; cálculos ocorrem antes da selagem (especificacao.md:84-94).
2. A fotografia preserva IDs de origem, revalida antes da alocação e não consulta cliente, produto, Filial ou regra atual depois da selagem (issues/12-definir-fotografia-payload-fiscal.md:13-40).
3. O inventário de transferência excluiu dados fiscais, notas, séries, vencimentos, impostos, DANFE/NF-e, contratos, crédito e duplicatas (pesquisa-sql-dominio-efeitos-delphi.md:1-20).
4. O snapshot autoritativo foi coletado em 2026-08-06, SHA-256 02F944BFEB2D97F47D3F124803E28F99989AE55040E01E56B6BA9073455A86DB (schema/README.md:1-18,45-75).

## Matriz de mapeamento

| Grupo | Fonte e transformação antes da selagem | Ausência/conflito | Nunca consultar depois da selagem |
|---|---|---|---|
| **CONFIRMADO — identidade e origem** | pedidosfiliais.codigo, codigoorigem, dadofiscal, data/hora, situação, requisitante, requisitada, produto, qtdepedida, qtderecebida, observação e lotetransferencia. Guardar IDs de todas as linhas, não somente o agregado. O Delphi seleciona linhas abertas com quantidade recebida positiva e lote marcado, agrupando por requisitante (dmtransferenciarequisicaoexposicao.pas:896-971). | Linha sem identidade, situação elegível, lote exigido ou quantidade resolvida impede o sealing; quantidade parcial fica explícita. Não inferir uma nota única sem a decisão do ticket 02. | Requisição, Transferência/grupo, linha, lote, estado, quantidades e vínculo dadofiscal. |
| **CONFIRMADO — emitente e destinatário** | Emitente vem de FilialBase; a Filial requisitante é carregada por qryFilialDestino com código, CNPJ, razão, endereço, cidade/IBGE, IE, telefone e contribicms (dmtransferenciarequisicaoexposicao.dfm:1053-1171). PreencherDadoFiscal copia esses valores para dadosfiscais como destinatário, tipo de cliente L (dmtransferenciarequisicaoexposicao.pas:1352-1457). | CNPJ, IE, endereço, UF/IBGE ou papel fiscal ausente/inconsistente bloqueia; não escolher outra Filial por nome, raiz de CNPJ ou cadastro atualizado. O papel fiscal segue decisão do ticket 02. | Cadastro atual de Filial, Contribuinte Fiscal, endereço, regime, credenciamento e certificado. |
| **CONFIRMADO — itens e quantidades** | IncluirProdutos agrega por produto e FilialEstoque, soma qtderecebida em quantidade/tribquantidade, preserva Listacodigopedidofilial, calcula qtdeestoque por fator de conversão e marca entrega (dmtransferenciarequisicaoexposicao.pas:2173-2235,2248-2274). A query fiscal usa produtosdadosfiscais pd unido a produtos e caracteristicas (dmtransferenciarequisicaoexposicao.dfm:742-766). | Produto sem unidade, conversão, código fiscal, descrição ou quantidade coerente bloqueia. Agregar duplicidade somente com a mesma chave de negócio e regra de tributação; caso contrário, conflito bloqueia. | Produto, característica, unidade, fator, quantidade, filial física e classificação fiscal resolvida. |
| **CONFIRMADO — cadastro candidato de produto** | O snapshot confirma produtos.codigo, descrição, característica, preço, referência, código visual e código de barras (schema/postgresql-authoritative-2026-08-06.json:4530-4650), e caracteristicas.unidade, IPI, ICMS, PIS/COFINS, CST/CSOSN, CEST e GTIN (schema/postgresql-authoritative-2026-08-06.json:36-120). São fontes candidatas, não o payload final. | O snapshot não contém a versão fiscal efetivamente selecionada por AtribuirDadosProdutos; divergência com o conjunto fiscal consolidado não pode ser resolvida silenciosamente. | Cadastro de produto/característica, NCM/CEST/GTIN, regras fiscais e tabelas atuais. |
| **DÚVIDA / NÃO LOCALIZADO — lote e rastreabilidade** | pedidosfiliais.lotetransferencia referencia lotestransferencia; o lote tem apenas código, usuário e data/hora (schema/postgresql-authoritative-2026-08-06.json:3271-3327). A conferência TRF guarda produto, quantidade lida e número (schema/postgresql-authoritative-2026-08-06.json:5338-5443). qryProdutos cria validade, fabricacao e nrlote como NULL (dmtransferenciarequisicaoexposicao.dfm:742-766). | Se a operação exigir lote/validade, ausência bloqueia antes da selagem. Não promover lotetransferencia a lote fiscal sem mapeamento confirmado; registrar para os tickets 01/02. | Lote de produto, validade, fabricação, conferência e rastreabilidade atual. |
| **CONFIRMADO — estoque e reserva** | O bloqueio lê estoques.produto, filial, emestoque, reservaprevia e futuro com FOR UPDATE (dmtransferenciarequisicaoexposicao.dfm:826-876). A relação tem PK (produto, filial) (schema/postgresql-authoritative-2026-08-06.json:1125-1288,1359-1377). A disponibilidade depende do parâmetro: reserva prévia ou estoque (pesquisa-sql-dominio-efeitos-delphi.md:78-111). | Saldo insuficiente, linha inexistente ou divergência sob lock aborta antes de selar/numerar. O comportamento de remover produto e continuar quando falta saldo é POSSÍVEL BUG LEGADO (pesquisa-sql-dominio-efeitos-delphi.md:91-96); não virar nota parcial silenciosa. | Saldo, reserva, futuro, filial de estoque e resultado da revalidação sob lock. |
| **DÚVIDA / NÃO LOCALIZADO — preço e valor comercial** | O Delphi transporta precovenda, financeiro, precosemicms, precocomicms e valor, e rejeita precovenda = 0 (dmtransferenciarequisicaoexposicao.pas:2038-2069,2173-2385). O snapshot confirma produtos.preco com FK para precos (schema/postgresql-authoritative-2026-08-06.json:4530-4567,4995-5027) e preço/financeiro em estoque/movimento (schema/postgresql-authoritative-2026-08-06.json:1169-1189,3480-3508), mas não contém precos. | Preço zero, moeda, arredondamento ou divergência fiscal/operacional bloqueia até decisão explícita. Não recalcular depois da selagem. | precos, promoção, custo, preço atual, fator, moeda e arredondamento. |
| **CONFIRMADO na execução / DÚVIDA no contrato — impostos** | O Delphi chama AtribuirDadosCalculosImpostos com TransferenciaSaida e códigos diferentes para transferência comum, venda entre empresas e devolução (dmtransferenciarequisicaoexposicao.pas:2234,2273,2365), depois CalcularImpostos por tipo (dmtransferenciarequisicaoexposicao.pas:1810-1840). | Classificação/tributação ausente, divergente ou dependente de consulta posterior bloqueia. Regras e campos de produtosdadosfiscais não estão no snapshot: NÃO LOCALIZADO, não licença para usar valores atuais. | CFOP, CST/CSOSN, NCM, bases, alíquotas, reduções, diferimentos, créditos, valores, rateios e totais. |
| **CONFIRMADO — transporte e volumes** | GravarInformacoesFornecedorTransporte copia fornecedor, frete, via, placa/UF, observação, volumes, pesos, numeração, marca e espécie (dmtransferenciarequisicaoexposicao.pas:1317-1339). volumesdadosfiscais é por dadofiscal (dmtransferenciarequisicaoexposicao.dfm:2013-2070). A preparação inicializa frete 1 e via R (dmtransferenciarequisicaoexposicao.pas:1420-1430). | Default legado é valor resolvido e auditável, não comportamento do adapter. Conflito entre volumes e itens bloqueia ou exige decisão. | Transportadora, placa, volumes, peso, frete/via e observações atuais. |
| **CONFIRMADO — cobrança e vencimentos legados** | qryVenctosDadosFiscais usa dadofiscal, número, data, valor, tipo, forma e transação (dmtransferenciarequisicaoexposicao.dfm:2429-2470). Na venda cria vencimento único à vista; com creditotroca, parcela T e saldo D (dmtransferenciarequisicaoexposicao.pas:1857-1908). | Soma diferente do total, forma inválida ou crédito não reconciliado bloqueia. Política moderna ainda não está decidida. | valortotal, valorvista, desconto, acréscimo, crédito, parcelas, datas, formas e transações. |
| **NÃO LOCALIZADO / DÚVIDA — pagamentos** | Foram encontrados vencimentos e transacao, mas não contrato completo de pagamento, adquirente, autorização ou integração no snapshot; duplicatas e efeitos fiscais foram excluídos (pesquisa-sql-dominio-efeitos-delphi.md:1-20). | Se a NF-e exigir pagamento, a estrutura completa deve existir antes de selar; não emitir com pagamento a consultar depois. | Integração, autorização, NSU, adquirente e estado financeiro atual. |
| **CONFIRMADO — contrato** | Para VendaTransferencia, copia numContrato para contratofrentecaixa, chama gerarcontratopordadofiscal(dadofiscal, Transferencia) e move a referência para contrato (dmtransferenciarequisicaoexposicao.pas:1937-1951). movimentos.contrato possui FK para contratos (schema/postgresql-authoritative-2026-08-06.json:3359-3598,3817-3828). | Identificador e versão devem estar resolvidos antes da selagem; contrato ausente, ambíguo ou incompatível bloqueia. Tabela e conteúdo não estão no snapshot. | Contrato atual, função de geração, preço/condição e vinculação posterior. |
| **CONFIRMADO — referências de devolução e origem** | A devolução consulta notas de entrada por Filial, produto e saldo não devolvido; mantém codigonota e linha em qryProdutos (dmtransferenciarequisicaoexposicao.dfm:2578-2647, dmtransferenciarequisicaoexposicao.pas:2284-2366). pedidosfiliais.dadofiscal e notas.dadofiscal vinculam pedido e documento (dmtransferenciarequisicaoexposicao.dfm:498-532; schema/postgresql-authoritative-2026-08-06.json:4083-4177). | Documento ausente, já devolvido, quantidade excedida ou chave divergente bloqueia. Copiar identificação e quantidade; não consultar a nota atual depois. | Nota de origem, chave, série, número, item, quantidade e vínculo. |
| **CONFIRMADO — movimentos e efeitos** | movimentos guarda produto/filial, quantidade, valor, trfproduto, trffilial, dadofiscal, contrato e lote (schema/postgresql-authoritative-2026-08-06.json:3359-3778). O Delphi referencia nota/transferência e persiste movimentos junto com os fiscais (dmtransferenciarequisicaoexposicao.pas:2020-2158,1916-1925). | Divergência entre itens fotografados e movimentos impede commit ou exige reconciliação; não reconstruir XML a partir de saldo posterior. | Movimentos, estoque, número fiscal, contrato, lote e saldos derivados. |

## Fronteira de selagem

Antes de selar:

1. Resolver linhas e grupos sob a unidade do ticket 03; guardar todos os IDs e a regra de agrupamento.
2. Resolver emitente, destinatário, Filial física, Contribuinte Fiscal, certificado, série, modelo, ambiente e finalidade na plataforma comum. Raiz de CNPJ não é fallback.
3. Carregar em conjunto produto, fiscal, preço, lote/rastreabilidade, transporte, volume, contrato, referência e vencimento; revalidar sob lock antes do número.
4. Calcular impostos, totais, rateios, parcelas, pesos e defaults legados (via=R, frete=1) como valores explícitos.
5. Rejeitar ausência, divergência ou conflito; ausência de tabela não é NULL fiscal válido.
6. Selar JSON com origem, IDs, versões, serialização e SHA-256; só então numeração/outbox.

Depois de selar, o adapter apenas serializa, valida, assina e transmite. Não consulta pedidosfiliais, produtos, filiais, estoques, lotes, contratos, notas de origem, preços, regras fiscais ou pagamentos. Correção cria nova revisão; retry técnico reutiliza a mesma fotografia e bytes (REQ-SNAP-004 e REQ-SNAP-005).

## Lacunas para os próximos tickets

- **DÚVIDA:** documento fiscal e papéis de emitente/destinatário, especialmente entre Filiais do mesmo Contribuinte Fiscal.
- **NÃO LOCALIZADO:** schema/contrato Laravel para dadosfiscais, produtosdadosfiscais, notas, vencimentos, volumes, notaspag, precos, contratos e lote de produto.
- **DIVERGENTE:** Delphi usa dadofiscal=0 como preparação; a plataforma nova exige fotografia selada, revisão imutável e numeração curta. Não transportar o sentinel 0.
- **POSSÍVEL BUG LEGADO:** grupos anteriores podem persistir após falha posterior; saldo insuficiente pode ser removido e o fluxo continuar.
- **DÚVIDA:** se cobrança, pagamentos, entrada no destino e efeitos financeiro/contábil pertencem à mesma operação ou a projeções posteriores.

## Arquivos consultados

- .scratch/emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md
- .scratch/emissao-fiscal-eletronica-laravel-wayfinder/issues/12-definir-fotografia-payload-fiscal.md
- modules/interlojas/transferencia-requisicao-exposicao/pesquisa-sql-dominio-efeitos-delphi.md
- modules/interlojas/transferencia-requisicao-exposicao/schema/README.md
- modules/interlojas/transferencia-requisicao-exposicao/schema/postgresql-authoritative-2026-08-06.json
- C:\projetos.vcl\apps\interlojas\dmtransferenciarequisicaoexposicao.pas
- C:\projetos.vcl\apps\interlojas\dmtransferenciarequisicaoexposicao.dfm

## Arquivos alterados

- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/04-mapeamento-fotografia-fiscal-transferencia.md
