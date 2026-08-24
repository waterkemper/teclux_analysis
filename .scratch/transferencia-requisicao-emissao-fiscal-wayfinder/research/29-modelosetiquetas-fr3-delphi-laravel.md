# Pesquisa: `modelosetiquetas`/`.fr3` e etiquetas de volumes

Data: 2026-08-20  
Ticket: [Pesquisar `modelosetiquetas` e `.fr3` para etiquetas de volumes](../issues/29-pesquisar-modelosetiquetas-fr3-delphi-laravel.md)

## Conclusão

O Laravel não deve tentar executar diretamente os arquivos FastReport `.fr3` do
Delphi. A evidência mostra que o Delphi usa o runtime FastReport, datasets com
nomes fixos e arquivos externos ao banco; esse runtime não faz parte do Laravel
Linux atual. A solução recomendada é separar:

1. um contrato normalizado e versionado de dados de etiqueta de volume;
2. um registro de templates/layouts aprovados;
3. um renderer HTML/CSS para PDF baseado no Browsershot já existente;
4. um adaptador futuro para importar ou mapear modelos legados, sem tratar `.fr3`
   como código executável no servidor.

Na etapa atual, o único caso necessário é `NF_SAIDA_TRANSFERENCIA_VOLUME`, com
PDF em nova aba e sem impressão automática. O mesmo contrato deve poder receber,
no futuro, os datasets de `dmemissaoetiquetas` para produtos, marketplace,
movimentos e outras etiquetas.

## Evidência primária do Delphi

### O que `modelosetiquetas` realmente fornece

O dataset do Delphi consulta `modelosetiquetas` por `codigo` e seleciona
`codigo`, `descricao`, `configurar`, `modelo`, `coluna`, `tipo`, `arquivo`,
`margemesquerda` e `margemsuperior` ([dmemissaoetiquetas.dfm](../../../delphi/apps/estoque/dmemissaoetiquetas.dfm:1205)). A pesquisa geral usa apenas `codigo` e `descricao` ([dmemissaoetiquetas.dfm](../../../delphi/apps/estoque/dmemissaoetiquetas.dfm:1277)).

**CONFIRMADO:** nesse caminho não foi localizado um campo de conteúdo `.fr3`
na consulta. O campo `arquivo` é textual e funciona como nome/referência de
arquivo. Não se deve assumir que o banco contenha o binário do relatório.

### O caso de volumes da NF de saída

Quando o modelo selecionado possui exatamente o arquivo
`frxEtiquetasNfSaidaVolumes.fr3`, ou quando a rotina é forçada, o Delphi liga o
parâmetro `IncluirVolumesDadosFiscais` ([dmemissaoetiquetas.pas](../../../delphi/apps/estoque/dmemissaoetiquetas.pas:1398)). A query então faz `LEFT JOIN` em
`volumesdadosfiscais` e expande `generate_series(1, coalesce(nullif(vodf.volumes,0),1))`
([dmemissaoetiquetas.dfm](../../../delphi/apps/estoque/dmemissaoetiquetas.dfm:2750)), produzindo uma linha por volume.

O dataset do relatório é `frxDBEtiquetasNfSaidaVolumes_` e contém os campos da
query, incluindo `filial`, `serie`, `numero`, `cliente`, `nomecliente`,
`data`, `dadofiscal`, `nrvolume`, `volumes`, `chv_nfe`,
`filialemissao`, `filialemissaomnemonico`, `marca`, `especietransporte`,
`romaneio` e `nomefornecedortransporte` ([dmemissaoetiquetas.dfm](../../../delphi/apps/estoque/dmemissaoetiquetas.dfm:37367)).

`chv_nfe_volumes` é calculada concatenando a chave da NF com o número do
volume e o total, ambos preenchidos com zeros para três posições
([dmemissaoetiquetas.pas](../../../delphi/apps/estoque/dmemissaoetiquetas.pas:7572)). O `.fr3` padrão usa esse valor em um código Code128C e mostra `nrvolume/volumes`
([frxEtiquetasNfSaidaVolumes.fr3](../../../delphi/apps/tecsoft/frxEtiquetasNfSaidaVolumes.fr3:14)).

### Como o `.fr3` é carregado

A rotina específica de volumes monta o caminho relativo ao executável,
carrega sempre `frxEtiquetasNfSaidaVolumes.fr3` e chama `ShowReport(true)`
([dmemissaoetiquetas.pas](../../../delphi/apps/estoque/dmemissaoetiquetas.pas:7589)). Há variantes no repositório, como `frxEtiquetasNfSaidaVolumes_cerom.fr3` e
`frxEtiquetasNfSaidaVolumes_apolonia.fr3`, mas não foi localizada nessa rotina
uma seleção dessas variantes por `modelosetiquetas`.

**DIVERGENTE/POSSÍVEL BUG LEGADO:** o registro selecionado controla a inclusão
dos dados de volumes, mas a rotina específica carrega um arquivo padrão pelo
nome. Portanto, não é seguro inferir que trocar `modelosetiquetas.arquivo`
trocará o layout efetivamente usado para volumes.

### Pesos e demais campos

O esquema autoritativo confirma que `volumesdadosfiscais` possui
`volumes`, `numeracao`, `marca`, `pesobruto`, `pesoliquido` e
`especietransporte` ([schema PostgreSQL](../../../modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json:14349)). Contudo, a query específica de `qryNotasSaidas` mostrada acima seleciona `volumes`, `marca` e `especietransporte`, mas não seleciona `numeracao`, `pesobruto` ou `pesoliquido` ([dmemissaoetiquetas.dfm](../../../delphi/apps/estoque/dmemissaoetiquetas.dfm:2713)).

**CONFIRMADO:** a spec nova não deve declarar pesos como dados já disponíveis
no dataset atual. Se forem desejados no Laravel, devem ser requisito explícito
de uma consulta/projeção e de teste; não podem ser inventados no renderer.

## Evidência primária do Laravel

Não foi localizada referência de `modelosetiquetas`, `frxEtiquetasNfSaidaVolumes`
ou execução de `.fr3` no Laravel atual fora dos prompts/documentos desta
investigação.

O relatório existente da transferência usa uma view Blade e o serviço
`TransferenciaRequisicaoImprimirService`, que chama `BrowsershotPdfGenerator`
([TransferenciaRequisicaoImprimirService.php](../../../laravel/backend/app/Services/Interlojas/TransferenciaRequisicaoExposicao/TransferenciaRequisicaoImprimirService.php:29)). O gerador usa Node/Chromium para converter HTML em PDF ([BrowsershotPdfGenerator.php](../../../laravel/backend/app/Support/Pdf/BrowsershotPdfGenerator.php:21)) e já possui opções de A4, meia folha e formato contínuo; não há contrato de página de etiqueta nem de template externo nessa API.

As rotas atuais da transferência expõem o PDF operacional e ações fiscais,
mas não uma ação de etiquetas por `dadofiscal` ([web.php](../../../laravel/backend/routes/web.php:1985)). O prompt 41 já propõe essa ação, mas assume um renderer fixo e lista pesos como campos do volume; o prompt 43 abaixo complementa e corrige essa fronteira.

## Classificação das conclusões

- **CONFIRMADO:** o Delphi possui vários formatos de etiquetas e usa FastReport;
  `modelosetiquetas` referencia metadados/nome de arquivo e margens.
- **CONFIRMADO:** a etiqueta de volume é uma linha por volume, baseada em
  `volumesdadosfiscais`, com chave derivada para código de barras.
- **CONFIRMADO:** o Laravel possui renderer HTML/CSS→PDF via Chromium.
- **NÃO LOCALIZADO:** suporte Laravel para executar `.fr3` ou cadastro legado
  `modelosetiquetas`.
- **DIVERGENTE:** variantes `.fr3` existem, porém a rotina de volumes observada
  carrega o arquivo padrão; não há prova de seleção dinâmica por cadastro.
- **INFERIDO:** executar `.fr3` diretamente no backend Linux criaria dependência
  do runtime FastReport Delphi e manteria datasets/scripts legados acoplados.
- **DECISÃO NOVA RECOMENDADA:** usar contrato de dados + registro de template
  versionado + renderer PDF HTML/CSS, deixando `.fr3` como insumo de migração,
  referência visual ou item explicitamente não suportado até ser convertido.

## Solução recomendada

### Fase atual: volumes da transferência

O prompt deve exigir um `VolumeLabelData` normalizado, somente leitura, com a
origem e a transformação de cada campo documentadas. O conjunto mínimo
confirmado é documento fiscal, filial emitente, destinatário, cidade/UF, série,
número, chave NF-e, chave do volume, número/total do volume, marca, espécie,
romaneio e transportadora quando disponíveis.

O renderer deve receber `VolumeLabelData[]`, não uma query Delphi nem um nome de
arquivo arbitrário. Deve gerar PDF com uma página/etiqueta por volume, dimensões
de página definidas pelo template, código de barras somente com valor validado,
escape de texto e sem mutação de NF, estoque, romaneio ou volumes.

O primeiro template pode ser o layout padrão equivalente ao
`frxEtiquetasNfSaidaVolumes.fr3`. A seleção inicial deve ser determinística por
uma chave de operação, por exemplo `NF_SAIDA_TRANSFERENCIA_VOLUME`, e versão
ativa. Não deve depender de o usuário digitar `fr3` nem de caminho local do
servidor.

### Preparação para a migração futura

O registro lógico do template deve preservar, no mínimo, chave de operação,
versão, descrição, dimensões, orientação, origem, mime type, storage path,
hash, status ativo/padrão e data de publicação. O conteúdo deve ser um template
declarativo aprovado (HTML/CSS ou formato equivalente), com placeholders
whitelist; não aceitar script Pascal, PHP, JavaScript arbitrário ou SQL dentro
do template.

Uma futura ferramenta de migração poderá inventariar cada linha legada de
`modelosetiquetas`, resolver o arquivo referenciado, calcular hash, registrar o
layout e produzir um relatório de conversão. O conversor deve marcar campos
sem correspondência e exigir aprovação visual; não deve executar o `.fr3` no
request do Laravel.

O mesmo `TemplateRenderer` poderá ser reutilizado quando a migração de
`dmemissaoetiquetas` abranger etiquetas de produto, movimento, marketplace ou
outros documentos. Cada caso deverá fornecer seu próprio data provider e sua
própria chave de template; não se deve generalizar a query de volumes para todos
os tipos de etiqueta.
