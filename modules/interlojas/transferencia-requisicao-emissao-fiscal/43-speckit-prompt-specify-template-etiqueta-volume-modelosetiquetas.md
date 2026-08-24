# Prompt `/speckit.specify` — templates configuráveis para etiquetas de volumes

Revise o código Laravel atual, o prompt 41 deste módulo, o mapa Wayfinder
`/mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/map.md` e a pesquisa
29 sobre `modelosetiquetas`, FastReport e `.fr3`.

Não implemente código nesta execução. Produza somente a spec, contratos, plano,
tarefas, testes, critérios de aceite e quickstart necessários para a execução
posterior.

Este prompt complementa e corrige o prompt 41. Onde houver conflito, prevalece
este prompt: a query Delphi de volumes possui pesos na tabela legada, mas a
query observada do relatório não os seleciona; não tratar pesos como campos
obrigatórios sem uma decisão/projeção explícita.

## Objetivo

Definir no Laravel uma solução de layout flexível para gerar PDF das etiquetas
de volumes de uma NF-e de saída da Transferência de Requisição para Exposição,
preparando a futura migração de `delphi/apps/estoque/dmemissaoetiquetas.pas` e
`.dfm`, sem migrar agora o módulo inteiro e sem ligar impressoras.

## Evidências que a spec deve preservar

- `modelosetiquetas` é consultada no Delphi com metadados como `codigo`,
  `descricao`, `modelo`, `tipo`, `coluna`, `arquivo` e margens; o campo `arquivo`
  é uma referência textual, não prova de que o binário `.fr3` esteja no banco.
- O caminho de volumes usa `volumesdadosfiscais`, expande uma linha por volume
  e aplica fallback para um volume quando a linha existe com quantidade nula ou
  zero.
- O Delphi calcula uma chave derivada do volume a partir da chave NF-e, número
  do volume e total, e o layout padrão usa essa chave em Code128C.
- A rotina legada específica carrega `frxEtiquetasNfSaidaVolumes.fr3` a partir
  do diretório do executável. Variantes existentes não devem ser consideradas
  seleção dinâmica comprovada.
- O Laravel atual já possui `BrowsershotPdfGenerator` para HTML/CSS→PDF; usar
  esse renderer comum ou uma porta sobre ele, não FastReport Delphi, UniDANFE,
  executável Windows ou impressora local.

## Contrato de dados

Especificar um DTO/Value Object `VolumeLabelData` somente leitura, com origem
por campo, normalização, limites e regras de ausência. Exigir pelo menos:

- `dadofiscal`, filial emitente, série, número, data e chave NF-e;
- destinatário e cidade/UF;
- `volume_numero`, `volumes_total` e `chave_volume` validada;
- marca e espécie quando presentes;
- romaneio e transportadora quando presentes.

`numeracao`, `pesobruto` e `pesoliquido` só podem entrar no contrato se a
consulta/projeção Laravel os selecionar explicitamente e houver teste de
paridade. O renderer não pode inventar valores nem ler o XML para descobrir
quantidade de volumes.

Definir a expansão determinística: `1..volumes_total`, com fallback `1` apenas
para linha existente de `volumesdadosfiscais` cujo valor seja nulo/zero. Ausência
da linha deve ser erro diagnosticável, conforme o prompt 41.

## Registro e seleção de templates

Definir um registro versionado de templates, sem copiar cegamente a semântica
legada. O contrato deve contemplar:

- `template_key`, inicialmente `NF_SAIDA_TRANSFERENCIA_VOLUME`;
- versão imutável, descrição, ativo/padrão e data de publicação;
- dimensões físicas, orientação, margens e quantidade de etiquetas por página;
- origem (`laravel`, `legacy-fr3`, `converted`), mime type, storage path e hash;
- compatibilidade do template com o schema de `VolumeLabelData`;
- trilha de auditoria da publicação e da escolha usada no PDF.

O template não pode conter PHP, PascalScript, SQL ou JavaScript arbitrário.
Placeholders devem ser whitelistados, escapados e rejeitar campos desconhecidos.
O arquivo `.fr3` deve ser tratado apenas como referência/insumo de conversão,
com diagnóstico explícito de “não convertido” quando não houver template
Laravel aprovado. Não executar `.fr3` no request ou em worker Laravel.

A seleção inicial deve ser determinística, sem usuário informar caminho de
arquivo: chave da operação + versão ativa/padrão. Deixar extensão preparada
para filial, cliente/contribuinte ou contexto logístico somente se a regra for
documentada e testada; não criar seleção implícita pela raiz de CNPJ.

## Renderer e ação de PDF

Especificar uma porta/serviço de renderização de etiquetas sobre o mecanismo
HTML/CSS→PDF já existente, aceitando dimensões do template e `VolumeLabelData[]`.
O resultado deve:

- gerar uma etiqueta por volume;
- abrir como `application/pdf` inline em nova aba;
- manter DANFE e etiquetas como ações distintas;
- não imprimir automaticamente nem criar fila de impressora;
- não alterar `dadosfiscais`, `volumesdadosfiscais`, `romaneiosnotas`, estoque,
  `pedidosfiliais` ou o estado fiscal;
- registrar template/version/hash e `dadofiscal` no metadado do artefato, sem
  segredos;
- rejeitar documento inexistente, cancelado, fora da filial autorizada,
  incompatível com transferência, sem chave válida ou sem linha de volume.

O layout padrão deve reproduzir apenas os dados comprovados no `.fr3` padrão:
destinatário, filial/série/número, data, marca, espécie, transportadora,
romaneio quando presente, `nrvolume/volumes`, chave NF-e e código de barras da
`chave_volume`. Não exigir peso enquanto ele não fizer parte da projeção.

## Preparação para `dmemissaoetiquetas`

Separar explicitamente:

1. `VolumeLabelDataProvider` para a transferência;
2. `ProductLabelDataProvider` e demais providers futuros;
3. registro/seleção de template;
4. renderer PDF;
5. eventual saída para impressora, fora desta fase.

Definir como uma futura migração inventariará `modelosetiquetas`, resolverá o
arquivo referenciado, calculará hash e produzirá um relatório de conversão para
HTML/CSS ou outro formato seguro. Layouts legados sem conversão não podem ser
silenciosamente substituídos nem executados no backend.

## Testes e aceite

Exigir testes para:

1. `volumes = 3` gerar exatamente três páginas/etiquetas;
2. nulo/zero gerar exatamente uma etiqueta;
3. ausência da linha de volume falhar sem mutação;
4. chave de volume ser formada e validada com o mesmo padding definido no
   contrato;
5. template ativo/padrão ser selecionado por chave e versão, sem caminho
   arbitrário;
6. template incompatível, não convertido ou com placeholder desconhecido
   produzir erro explícito;
7. dados opcionais (romaneio, transportadora, marca, espécie) não serem
   inventados;
8. pesos não aparecerem nem serem obrigatórios quando não selecionados pela
   projeção;
9. retry produzir o mesmo PDF sem escrita nas tabelas legadas;
10. autorização por filial e documento ser aplicada;
11. PDF usar dimensões do template e abrir inline em nova aba;
12. nenhum teste depender de FastReport, `.fr3`, Delphi, UniDANFE ou impressora.

Entregar matriz evidência → requisito → tarefa → teste, contrato HTTP, modelo
de seleção/versionamento de template, diagnóstico de migração `.fr3`, quickstart
e critérios de aceite. Não alterar código nesta execução do `/speckit.specify`.
