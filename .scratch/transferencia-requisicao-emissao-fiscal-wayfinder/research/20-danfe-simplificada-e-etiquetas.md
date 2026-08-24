# Pesquisa — DANFE padrão, DANFE simplificada e etiquetas da Transferência

Data: 2026-08-15

## Escopo e conclusão

Foram consultados somente fontes locais: código Delphi do fluxo de Transferência de Requisição, pesquisas Delphi existentes, documentação/especificação fiscal Laravel e referências locais à NFePHP. Não houve implementação.

**CONFIRMADO:** o fluxo Delphi da Transferência gera a NF-e usando `GerarNFe(..., qryVolumesDadosFiscais, ...)` e, após transmissão/retorno, chama `NFe.ImprimirDanfe` com filial, série, número, quantidade de vias, logotipo, impressora configurada, opção de visualizar, data, itens, executável DANFE e modo de envio.

**CONFIRMADO:** `NomeImpressoraNotaMercadorias` é configuração de infraestrutura passada ao DANFE; não é permissão nem regra de emissão.

**CONFIRMADO:** o cabeçalho da Transferência fixa `formatodanfe = 1`, documentado no próprio código como retrato (`1-Retrato / 2-Paisagem`). Isso evidencia um DANFE padrão em orientação retrato, mas não evidencia uma “DANFE simplificada”.

**CONFIRMADO:** volumes são parte do payload fiscal legado: `volumesdadosfiscais` é carregado, vinculado ao `dadofiscal`, persistido no mesmo `Perpetrar` e fornecido ao gerador da NF-e. Os campos observados incluem quantidade, numeração, marca, espécie, peso bruto e peso líquido.

**NÃO LOCALIZADO:** não foi encontrada, nas fontes do fluxo pesquisado, uma chamada de `emiteetiqueta`, rotina de impressão de etiqueta de mercadoria/volume vinculada a esta Transferência, ou regra que derive etiquetas automaticamente da quantidade de volumes.

**NÃO LOCALIZADO:** não foi encontrada evidência local suficiente de um renderer/layout específico de “DANFE simplificada” para NF-e modelo 55 da Transferência, nem de um ciclo de geração/reimpressão dedicado a ela.

**NÃO CONFUNDIR:** `formatodanfe = 1` é orientação/formato do DANFE no legado. Não é evidência de `tpImp = 1`, nem prova de DANFE simplificada. `tpImp` aparece como campo a ser coberto/validado na especificação fiscal Laravel, mas não foi localizada nesta pesquisa uma atribuição concreta equivalente no código atual da Transferência.

## Evidências primárias do Delphi

### Impressão do DANFE

**CONFIRMADO.** Em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1677-1688`, o fluxo mostra “Imprimindo o DANFE!” e chama:

```pascal
NFe.ImprimirDanfe(
  filialemissao,
  SerieSugestao,
  nrdocumento,
  localentrega_cep,
  email,
  IntToStr(NFeNVias),
  NFeLogotipoDANFE,
  ParSistema.NomeImpressoraNotaMercadorias,
  NFeVisualizarDANFE,
  data,
  qryProdutos,
  NFeExecDANFE,
  Enviar,
  'S');
```

Há uma segunda chamada equivalente em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1737-1748`, usada no caminho sem a etapa anterior de transmissão/retorno. Em ambos os casos, o resultado é uma operação de impressão/visualização do DANFE e não uma rotina de etiqueta.

**CONFIRMADO.** Depois do commit principal, quando `CondicaoEmissorNFE` é falsa, o fluxo chama `TdtmImprimeFiscal.ImprimirNota(numero, modelonota)` em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1955-1966`; quando é verdadeira, chama `ImprimirNFE`, que conduz geração/transmissão e a impressão DANFE. A distinção é entre impressão fiscal convencional e emissão eletrônica, não entre DANFE padrão e simplificada.

### Dados de volumes

**CONFIRMADO.** `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:194-202` declara os campos de `qryVolumesDadosFiscais`: `dadofiscal`, `codigo`, `volumes`, `numeracao`, `marca`, `pesobruto`, `pesoliquido` e `especietransporte`.

**CONFIRMADO.** Em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1321-1332`, esses dados são copiados para a estrutura de transporte (`Volumes`, `PesoBruto`, `PesoLiquido`, `Numeracao`, `Marca`, `EspecieTransporte`).

**CONFIRMADO.** Em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1468`, o volume é vinculado ao número de `dadosfiscais`; em `:1600-1601`, `qryVolumesDadosFiscais` é passado a `GerarNFe`; e em `:1916-1918`, o dataset é persistido junto aos demais objetos fiscais.

**INFERIDO:** os volumes podem aparecer no DANFE porque integram a NF-e/payload fiscal entregue ao gerador, mas o corpo de `ImprimirDanfe`/renderer não está neste repositório pesquisado. Não é possível afirmar o layout visual ou se há uma etiqueta derivada sem fonte adicional.

### Configuração de impressoras

**CONFIRMADO.** `modules/interlojas/transferencia-requisicao-exposicao/pesquisa-parametros-autorizacoes-menu.md` registra, com origem em `delphi/apps/adminsistema/fmconfiguracaosistema.pas:539-545,781-786` e uso em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1679-1688,1738-1748`, que `ParSistema.NomeImpressoraNotaMercadorias` é o nome da impressora utilizado na impressão do DANFE.

**CONFIRMADO, mas separado do ticket:** o mesmo levantamento identifica configuração distinta para `NomeImpressoraEtiqueta` e `TipoImpressoraEtiqueta` em `delphi/apps/adminsistema/fmconfiguracaosistema.pas:539-544,899-954`. Isso prova que o produto possui infraestrutura geral para impressoras de etiquetas, inclusive tipos Argox, Zebra, Rabbit, matricial e jato, mas não prova que a Transferência invoque essa impressão.

**DIVERGENTE/SEM VÍNCULO:** ocorrências de `ImprimirEtiquetas` em `delphi/apps/estoque/fmemissaoetiquetas.pas` e rotinas de etiquetas em cobrança/estoque pertencem a outros fluxos. Não foram tratadas como evidência da Transferência porque não há chamada cruzada localizada a partir de `dmtransferenciarequisicaoexposicao`.

## DANFE padrão, simplificada e `tpImp`

**CONFIRMADO:** a inicialização fiscal em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:2716-2726` grava `formatodanfe = 1` e comenta `1-Retrato / 2-Paisagem`. Também grava versão de layout 3.10, forma de pagamento 2, forma de emissão, regime, presença e finalidade normal.

**NÃO LOCALIZADO:** não foi localizado nesse módulo campo/flag com nome “simplificada”, seleção de layout resumido, segunda chamada de renderer, ou parâmetro que altere a impressão para DANFE simplificada.

**NÃO LOCALIZADO:** não foi localizada atribuição concreta de `tpImp` em `dmtransferenciarequisicaoexposicao.pas/.dfm` nem no código Laravel atual pesquisado. As especificações/prompts Laravel citam `tpImp` como campo que deve ter origem e teste — por exemplo `modules/interlojas/transferencia-requisicao-emissao-fiscal/17-speckit-prompt-specify-correcoes-residuais-r15-r17.md` —, mas isso é requisito de integração, não evidência de implementação concluída.

**INFERIDO:** a DANFE padrão da Transferência deve permanecer no pipeline fiscal comum, derivada do XML/artefato autorizado. Uma eventual DANFE simplificada exigiria contrato explícito de layout, elegibilidade normativa, renderer/versionamento e artefato próprio; não há fonte local que autorize tratá-la como simples valor de `formatodanfe` ou como `tpImp=1`.

## Geração e reimpressão

**CONFIRMADO:** no Delphi, a impressão ocorre no fluxo pós-geração/transmissão em `dmtransferenciarequisicaoexposicao.pas:1598-1605,1677-1688,1737-1748`; não há persistência local observável de um artefato DANFE, hash, versão do renderer ou tentativa de impressão.

**NÃO LOCALIZADO:** não foi localizado comando/endpoint/rotina de reimpressão da DANFE específica da Transferência. `NFeNVias` fornece número de vias na impressão original, mas não é reimpressão auditada.

**CONFIRMADO na documentação Laravel comum:** `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md:176-188` e `modules/fiscal/emissao-fiscal-eletronica/07-speckit-prompt.md:15-35` estabelecem que DANFE deve derivar do XML arquivado, registrar versão/hash e que reimpressão deve reutilizar o artefato/XML arquivado. Isso é a regra arquitetural da plataforma fiscal, não implementação comprovada da ponte de Transferência.

**CONFIRMADO na documentação NFePHP local:** `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/research/03-stack-php-emissao-fiscal.md:7,21,30` identifica `nfephp-org/sped-da` como candidato para DANFE/DANFC-e e recomenda adapter próprio; não foi localizado `vendor/`, `composer.json` ou código instalado de `sped-da`/NFePHP no checkout pesquisado. Portanto a biblioteca é documentação/decisão candidata, não renderer disponível comprovado.

## Etiquetas da transferência

**NÃO LOCALIZADO:** nenhum uso de `emiteetiqueta` no código Delphi específico da Transferência (`dmtransferenciarequisicaoexposicao.pas/.dfm`) ou nas pesquisas específicas existentes.

**CONFIRMADO:** o schema local de entregas registra uma coluna `emiteetiqueta` em `modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json:711`, mas esse campo pertence ao domínio de entregas/romaneios e não demonstra regra de emissão de etiquetas na Transferência de Requisição.

**NÃO LOCALIZADO:** não foi encontrada origem autoritativa de conteúdo de etiqueta (produto, lote, código de barras, chave, volume, destinatário), cardinalidade, modelo de etiqueta, momento pós-autorização, reimpressão ou impressora da etiqueta para esta jornada.

## Matriz final

| Pergunta | Resultado | Fonte principal |
|---|---|---|
| DANFE padrão é impresso? | **CONFIRMADO** | `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1677-1688,1737-1748` |
| Impressora do DANFE | **CONFIRMADO** | `ParSistema.NomeImpressoraNotaMercadorias`, mesmos trechos; pesquisa de parâmetros |
| Volumes participam da NF-e | **CONFIRMADO** | `...pas:194-202,1321-1332,1468,1600-1601,1916-1918` |
| DANFE simplificada da Transferência | **NÃO LOCALIZADO** | nenhum renderer/flag específico encontrado |
| `formatodanfe = 1` | **CONFIRMADO** como retrato | `...pas:2716-2726` |
| `formatodanfe = 1` significa `tpImp=1` | **DIVERGENTE/NÃO COMPROVADO** | comentários Delphi só dizem retrato; `tpImp` não foi atribuído no fluxo |
| `emiteetiqueta` no fluxo | **NÃO LOCALIZADO** | nenhuma ocorrência no módulo específico |
| Impressora de etiquetas existe no produto | **CONFIRMADO** em configuração geral | `delphi/apps/adminsistema/fmconfiguracaosistema.pas:539-544,899-954` |
| Etiqueta gerada/reimpressa pela Transferência | **NÃO LOCALIZADO** | nenhuma chamada/artefato/endpoint encontrado |
| Reimpressão DANFE durável Laravel | **INFERIDO/CONTRATUAL** | especificação fiscal comum; ponte atual não comprovada |

## Implicação para o ticket

O contrato seguro é manter uma única geração fiscal comum: Fotografia Fiscal selada → XML assinado/processado → DANFE padrão derivado do artefato autorizado. A impressão usa a rota/dispositivo resolvido pela plataforma; `NomeImpressoraNotaMercadorias` deve ser tratado como legado de configuração, não como autoridade do novo domínio. Volumes devem permanecer na fotografia/XML quando presentes.

Não há evidência para implementar, neste ticket, uma DANFE simplificada ou etiquetas de transferência. Antes de especificar esses documentos, é necessária fonte adicional do renderer/rotina Delphi ou decisão normativa/operacional explícita que defina conteúdo, elegibilidade, formato, geração, custódia, reimpressão e dispositivo. `formatodanfe=1` não resolve essa lacuna e não deve ser reinterpretado como `tpImp=1`.
