# Prompt para \`/speckit.specify\`

## Correção urgente da primeira NF-e de transferência: conteúdo fiscal e projeção legada

Você está no repositório Laravel \`C:/teclux_analysis/laravel\`. Produza somente a especificação corretiva; não implemente código.

Leia \`especificacao.md\`, os prompts 24 a 29 deste diretório e o código atual, especialmente:

- \`TransferenciaFiscalEmitirNfeOperadorCommand\`;
- \`TransferenciaFiscalEmitirGrupoCommand\`;
- \`TransferenciaFiscalPrepararFotografiaService\`;
- \`TransferenciaFiscalNaturezaCodigoResolver\`;
- \`TransferenciaFiscalPlatformAdapter\`;
- \`AlocarEmissaoNfe55Service\`;
- \`LegacyDadosFiscaisNotasWriteRepository\`;
- \`LegacyTransferenciaFiscalDestinatarioReadRepository\`;
- \`LegacyTransferenciaFiscalLinhasReadRepository\`;
- testes de \`TransferenciaFiscalEmitirNfeOperador\` e \`TransferenciaFiscalEmitirGrupo\`.

Leia também o Delphi local:

- \`delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas/.dfm\`;
- \`delphi/repositorio/dmbasico.pas\`;
- \`delphi/repositorio/ctcontantesdmbasico.pas\`.

## Incidente

A primeira NF-e saiu sem:

- destinatário fiscal correspondente à filial requisitante;
- \`cliente\`/filial e \`tipocliente = 'L'\`;
- produtos/itens fiscais;
- chave de acesso;

e recebeu natureza genérica de venda. A tela informou somente que a nota estava gerada/aguardando transmissão.

Não faça correção cosmética de UI. Feche o conteúdo e os efeitos persistidos do documento.

## Diagnóstico já observado

A especificação deve confirmar e corrigir estas lacunas:

1. \`AlocarEmissaoNfe55Service\` grava cabeçalho de \`dadosfiscais\`, \`notas\`, Cloud, revisão e outbox, mas \`linhaDadosFiscais()\` não projeta identidade, natureza e destinatário completos.
2. \`TransferenciaFiscalPlatformAdapter::allocateNumberAndOutbox()\` chama o alocador sem executar o callback de efeitos da transferência. Assim pode existir número/dadofiscal com zero linhas em \`produtosdadosfiscais\`, sem efeitos completos e sem vínculos corretos.
3. O normalizador permite participantes incompletos e o adapter não deve ser a única barreira contra fotografia sem itens.
4. O repositório da filial não entrega ao shape fiscal todos os campos legados necessários, incluindo código da filial e \`tipocliente\`.
5. \`TransferenciaFiscalNaturezaCodigoResolver\` procura \`naturezaspadrao.descricao = 'TRANSFERENCIA'\` e usa fallback heurístico por texto. Isso não comprova a regra Delphi e pode escolher natureza de venda.
6. O teste do operador valida HTTP 200, número e processamento, mas não valida fotografia, \`dadosfiscais\`, \`produtosdadosfiscais\`, \`movimentos\` e \`pedidosfiliais\`.

## Paridade Delphi obrigatória

Documente uma matriz Delphi → Laravel com origem, regra, tabela e campo:

- \`PreencherDadoFiscal\`: destinatário é a filial destino/requisitante; grava \`cliente\` com o código da filial, \`tipocliente = 'L'\`, CNPJ, IE, endereço, \`filialemissao = FilialBase\`, \`filialvenda = FilialBase\), natureza, código da natureza e código fiscal.
- \`NovoMovimento\`: grava \`cliente = filial\` e \`tipocliente = 'L'\`.
- \`IncluirProdutos\`: agrega por produto/filial de estoque, soma \`qtderecebida\`, exige preço não zerado e chama \`AtribuirDadosProdutos\` e \`AtribuirDadosCalculosImpostos\`.
- Transferência simples: \`TransferenciaSaida\` com a constante Delphi \`noTRANSFERENCIAMERCADORIASSAIDA\`, cujo valor exato em \`delphi/biblio/ctconstantes.pas\` é \`TRANSFERÊNCIA DE MERCADORIAS - S\`.
- A resolução Delphi chama \`SelecionarDadosNaturezaPadrao('TRANSFERÊNCIA DE MERCADORIAS - S', ...)\`; essa rotina faz \`Locate('descricao', Descricao)\` no dataset carregado pela SQL que une \`naturezaspadrao np\` a \`naturezas n\`. O Laravel deve consultar o mesmo campo e a mesma descrição, retornando conjuntamente \`np.natureza\`, \`n.descricao\` e \`n.codigofiscal\`.
- O resolver Laravel deve receber a UF/estado do destinatário e reproduzir o ajuste de CFOP do ramo \`TransferenciaSaida\`: código base do cadastro para mesma UF; código base + 1000 para outra UF brasileira; código base + 2000 para destino estrangeiro, observando as exceções do Delphi. Persistir separadamente o código base da natureza e o CFOP efetivamente aplicado.
- \`TRANSFERENCIA\`, \`TRANSFERÊNCIA DE MERCADORIAS\` sem o sufixo \`- S\` e \`VENDAS - TRANSFERENCIA ENTRE EMPRESAS\` não são equivalentes ao padrão de transferência simples. Não usar normalização textual, busca por contém, pontuação ou fallback heurístico para escolher outro registro.
- \`qryDadosFiscaisNewRecord\` fornece defaults de documento, mas não autoriza inventar destinatário, produto, CFOP ou natureza.
- Para o Delphi o fluxo só fica completo após persistir dados fiscais, produtos, movimentos, nota e vínculos. Transmissão e impressão são etapas posteriores.

## Resultado obrigatório

Especifique uma correção integrada que:

1. Recarregue e bloqueie as linhas autoritativas no instante da emissão. O request/tela nunca é fonte de produtos ou quantidades.
2. Monte e sele a fotografia completa antes da numeração, com:
   - filial emitente, filial de estoque e filial requisitante;
   - emitente e destinatário completos;
   - código da filial destinatária, CNPJ, IE, endereço e \`tipocliente = 'L'\`;
   - itens não vazios, agregados como no Delphi, com produto, descrição, unidade, quantidade recebida, preço, valor, GTIN quando aplicável, NCM, CFOP e tributos;
   - totais coerentes;
   - natureza padrão, código da natureza e CFOP da regra Delphi;
   - série, ambiente, modelo e IDE.
3. Recuse sem consumir número e sem cabeçalho parcial se faltar destinatário, item, preço, quantidade, unidade, NCM, CFOP, tributo, natureza, código fiscal ou total.
4. Na mesma transação curta de alocação, projete:
   - \`dadosfiscais\` completo, inclusive identidade, natureza, destinatário, filial, \`cliente\`, \`tipocliente\`, transporte e totais;
   - \`notas\` com série, número e \`dadofiscal\`;
   - uma linha de \`produtosdadosfiscais\` por item fiscal;
   - vínculos dos movimentos de confirmação e de \`pedidosfiliais\` ao mesmo \`dadofiscal\`;
   - nenhum SPT/SET/TPE/TFR/TEP duplicado quando já criado no F8.
5. Seja idempotente: replay não pode duplicar nota, produto fiscal, movimento, vínculo ou efeito de estoque.
6. Preserve \`FOR UPDATE\`/locks da série, pedidos e idempotência.

## Natureza e CFOP

A especificação deve identificar no banco qual registro representa \`noTRANSFERENCIAMERCADORIASSAIDA\`, seu \`natureza\`, descrição, código fiscal e regras de UF. Deve definir:

- mapeamento explícito do identificador Delphi;
- ajuste local/interestadual conforme \`SelecionarDadosNaturezaPadrao\`;
- tratamento de ICMS próprio/ST usado pelo ramo de transferência simples;
- bloqueio para cadastro ausente, inativo, ambíguo ou inválido.

É proibido:

- natureza padrão de venda;
- a descrição genérica \`TRANSFERENCIA\` como substituta do valor Delphi;
- \`VENDAS - TRANSFERENCIA ENTRE EMPRESAS\` ou qualquer variante de venda/devolução;
- primeiro registro textual com “TRANSFERENCIA”, busca por contém, pontuação heurística ou fallback para outro padrão;
- CFOP fixo sem UF/cadastro;
- natureza/CFOP fornecidos pelo request como autoridade.

## Estados e UI

Diferencie:

- \`bloqueada_por_conteudo_fiscal\`: nada numerado;
- \`preparada\`: fotografia validada, sem número;
- \`pendente_transmissao\`: documento completo persistido, número/dadofiscal existentes;
- \`transmitindo\`, \`aguardando_reconciliacao\`, \`autorizada\`, \`rejeitada\` e falha.

Número alocado não é NF-e autorizada. A chave pode ser nula antes do XML assinado, mas a mensagem deve deixar isso claro. Nunca mostrar “nota gerada” quando houver somente cabeçalho/número. Exibir filial, destinatário, quantidade de itens, natureza/CFOP, série/número, chave quando disponível, situações e próxima ação. Não informar DANFE disponível antes do artefato existir.

## Testes de aceite

Exigir testes de integração que verifiquem, além do HTTP:

1. fotografia, \`dadosfiscais\`, \`notas\`, \`produtosdadosfiscais\`, \`movimentos\` e \`pedidosfiliais\` em caso com ao menos dois produtos;
2. \`cliente = filial requisitante\`, \`tipocliente = 'L'\`, CNPJ/IE/endereço e \`filialemissao/filialvenda\`;
3. natureza, \`codigonatureza\` e CFOP contra o registro usado pela regra Delphi;
4. agregação, quantidade, preço, valor, NCM e tributos;
5. rejeição de item/destinatário/natureza ausente antes de avançar série ou gravar cabeçalho;
6. concorrência com \`FOR UPDATE\` e ausência de duplicidade;
7. distinção entre número/dadofiscal, chave e autorização;
8. worker até serialização do XML e disponibilização da chave.

Incluir consultas por \`dadofiscal\` para cabeçalho/destinatário, nota, itens fiscais, movimentos, pedidos, Cloud, fotografia/hash, outbox, chave e protocolo.

## Compatibilidade

Definir como tratar emissões já alocadas apenas com cabeçalho: não duplicar número nem nota; reparar somente quando houver identidade idempotente e vínculo autoritativo, ou bloquear para saneamento administrativo explícito.

## Fora do escopo

Não incluir venda entre filiais, devolução entre filiais, NFS-e, cancelamento, inutilização, impressão automática, etiquetas ou DANFE simplificada. PDF/DANFE só depois do conteúdo fiscal, XML e artefatos estarem corretos.

## Entregáveis

Produzir diagnóstico, especificação funcional/técnica, matriz Delphi → Laravel, transação/locks, contratos de fotografia/adapter/projeção/worker/UI, compatibilidade, testes, consultas de evidência, critérios de aceite e lista de arquivos a alterar.

Não alterar código durante o \`/speckit.specify\`.
