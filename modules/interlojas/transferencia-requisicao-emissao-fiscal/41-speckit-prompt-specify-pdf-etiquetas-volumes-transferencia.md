# Prompt `/speckit.specify` — PDF de etiquetas de volumes da Transferência

Revise o código Laravel atual, o prompt 40 em /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/ deste módulo, o mapa Wayfinder
`/mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/map.md` e a
implementação Delphi indicada no ticket 26.

Não implemente código nesta execução. Produza somente spec, plano, tarefas,
contratos, testes, critérios de aceite e quickstart.

## Objetivo

Disponibilizar PDF de etiquetas de volumes para uma NF-e de saída de
Transferência já persistida e, quando aplicável, já vinculada a romaneio.
Reproduzir a semântica do Delphi sem acoplar o Laravel a impressoras locais.

## Evidência a preservar

- `delphi/apps/estoque/fmemissaoetiquetas.pas:2189-2205` prepara a impressão
  dos documentos selecionados.
- `delphi/apps/estoque/dmemissaoetiquetas.dfm:2678-2800` expande
  `generate_series(1, coalesce(nullif(vodf.volumes, 0), 1))`, produzindo uma
  saída por volume.
- A fonte é `volumesdadosfiscais`, com dados do documento, destinatário,
  romaneio, marca, espécie e pesos. O fallback para quantidade é 1 quando a
  linha existe mas `volumes` é nulo ou zero.
- O relatório Delphi é de volume (`frxEtiquetasNfSaidaVolumes`), não etiqueta
  de produto.

## O que já existe e não deve ser refeito

- a NF-e, chave, `dadofiscal`, XML, autorização e DANFE usam o pipeline fiscal
  comum;
- a projeção de volumes da transferência usa `volumesdadosfiscais` e
  `codigo = 1`;
- romaneio, quando escolhido, é tratado pelo prompt 40 e pelos contratos
  compartilhados de Entregas;
- DANFE padrão e DANFE simplificada não devem ser misturados ao renderer de
  etiquetas;
- não usar UniDANFE, não usar executável Delphi, não acessar impressora e não
  criar tabela/artefato fiscal paralelo.

## Escopo a especificar

### Contrato de consulta e PDF

Definir uma ação autenticada, autorizada e somente leitura para gerar/abrir o
PDF de etiquetas por `dadofiscal`, com:

- validação de que o documento existe, pertence à filial autorizada, é saída
  de transferência e não está cancelado;
- leitura de `volumesdadosfiscais` e expansão determinística de 1 até `qVol`;
- fallback `qVol = 1` apenas quando a linha de volume existir com quantidade
  nula/zero;
- bloqueio explícito e diagnosticável para documento sem linha de volume,
  chave/documento incompatível ou dados obrigatórios ausentes; não fabricar
  silenciosamente informação fiscal;
- uma etiqueta por volume, com número sequencial, total, chave NF-e,
  filial/número/série, destinatário, romaneio quando houver, marca, espécie,
  peso bruto e peso líquido;
- layout PDF compatível com o padrão visual do projeto e saída em nova aba;
- artefato rastreável, conteúdo sanitizado e sem segredos;
- retry da mesma consulta sem alterar dados legados, estoque, romaneio ou NF.

### Integração com a tela

Especificar que a tela da Transferência:

- ofereça `Abrir etiquetas de volumes` somente para documento elegível;
- possa abrir uma aba do navegador com o PDF, sem disparar impressão;
- mostre erro recuperável e ação de tentar novamente quando a geração falhar;
- mantenha separadas as ações `Abrir DANFE`, `Abrir DANFE simplificada` e
  `Abrir etiquetas de volumes`;
- para múltiplos grupos, permita abrir o PDF de cada `dadofiscal` sem misturar
  os volumes de notas diferentes.

## Fronteiras obrigatórias

Não implementar impressão automática, fila de impressora, UniDANFE, etiquetas
de produtos, leitura de XML para descobrir volumes, alteração de
`pedidosfiliais`, novo movimento, cancelamento/inutilização, NFS-e,
`VendaTransferencia`, `DevolucaoTransferencia`, NF-e de entrada ou gateway
fiscal paralelo.

O PDF é um artefato operacional derivado do documento/volume já persistido.
Não é condição para autorizar a NF-e nem para fechar a Transferência.

## Testes e aceite

Exigir testes para:

1. documento autorizado com `volumes = 3` gerar exatamente três etiquetas;
2. `volumes` nulo/zero gerar uma etiqueta;
3. ausência da linha em `volumesdadosfiscais` resultar em erro explícito,
   sem inserir ou alterar registros;
4. cada etiqueta conter número sequencial, total, chave e identificação do
   documento correto;
5. romaneio presente aparecer no PDF e romaneio ausente não ser inventado;
6. documento cancelado, filial sem acesso e documento que não é transferência
   serem recusados;
7. retry produzir o mesmo conteúdo sem mutações;
8. o frontend abrir nova aba e manter DANFE e etiquetas como ações distintas;
9. nenhum teste depender de impressora, UniDANFE ou fonte Delphi em runtime.

Entregar matriz achado -> requisito -> tarefa -> teste, contrato HTTP, matriz
de autorização/idempotência, quickstart e critérios de aceite. Não alterar
código nesta execução do `/speckit.specify`.
