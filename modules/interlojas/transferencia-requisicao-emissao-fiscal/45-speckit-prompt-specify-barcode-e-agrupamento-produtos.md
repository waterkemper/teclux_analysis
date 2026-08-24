# Prompt `/speckit.specify` — correção do barcode e agrupamento fiscal da transferência

Este prompt complementa o prompt 44 deste módulo. Revise o código Laravel
atual, os contratos das specs 412, 413 e 416, o prompt 44 e as evidências
Delphi abaixo.

Não implemente código nesta execução. Produza somente a spec, contratos,
plano, tarefas, testes, critérios de aceite e quickstart para implementação
posterior.

## 1. Barcode Code 128C — bloqueador de impressão

O artefato
`.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/etiqueta_volume.png`
deve ser tratado como evidência de que a implementação atual não está
comprovada para impressão: as barras aparecem comprimidas, os espaços são
muito estreitos e não há decodificação real do PDF.

Preservar a carga correta:

```text
chave_volume = chave_nfe canônica de 44 dígitos
             + volume_numero com 3 dígitos
             + volumes_total com 3 dígitos
```

O resultado tem 50 dígitos e deve ser Code 128 subset C. A etiqueta de volume
1 de 4, por exemplo, deve codificar o sufixo `001004`.

A spec corretiva deve:

- avaliar a substituição de `Code128CSvg` por uma biblioteca Code 128C mantida
  e já disponível no projeto, como `tecnickcom/tc-lib-barcode`, ou outra
  biblioteca aprovada;
- não aceitar a implementação artesanal somente por produzir `<svg>`,
  `<rect>` ou `data-chave-volume`;
- preservar a largura modular, as proporções das barras e as quiet zones;
- não esticar o símbolo arbitrariamente com CSS ou
  `preserveAspectRatio="none"`;
- calcular a largura necessária pelos módulos e rejeitar o template se a
  etiqueta não comportar a largura mínima, em vez de comprimir o código;
- gerar PDF vetorial ou raster com qualidade adequada ao dispositivo de saída;
- manter o payload completo disponível para conferência. Se a representação
  textual continuar exibindo apenas a chave NF-e de 44 dígitos, documentar que
  ela é diferente do payload escaneado e validar ambos no teste.

Exigir teste que gere o PDF e decodifique realmente os volumes `001003`,
`002003` e `003003`, conferindo o retorno exato de 50 dígitos. Repetir a
validação em renderizações equivalentes a impressão de 203 DPI e 300 DPI.
Teste estrutural do SVG, isoladamente, não é critério de aceite.

## 2. Paridade Delphi — agrupamento dos itens da transferência

Usar como evidência confirmada:

- `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:2207`, onde a
  operação `Transferencia` localiza o item por `produto;filial`;
- `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:2217`, onde
  soma `qtderecebida` no registro já localizado;
- `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:2230`, onde
  acumula os códigos de `pedidosfiliais` em
  `Listacodigopedidofilial`;
- `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1916`, onde
  `qryProdutos` é persistido junto com o documento fiscal.

Na operação fiscal `Transferencia`, dois registros de `pedidosfiliais` do
mesmo produto e da mesma filial de estoque, pertencentes ao mesmo grupo
fiscal/requisitante, produzem um único registro em `produtosdadosfiscais`,
com a soma das quantidades recebidas.

A spec Laravel deve exigir:

- um único item fiscal/XML `<det>` para esse caso;
- soma de `qtderecebida`, nunca duplicação de linhas;
- preservação dos vínculos com todos os `pedidosfiliais` de origem para
  atualização de situação, movimentos e idempotência;
- separação quando mudar a filial requisitante, o grupo fiscal ou a filial de
  estoque;
- nenhuma consolidação baseada somente em `producaopropria`;
- cálculo de impostos, CFOP, natureza e valores sobre o item fiscal
  consolidado, sem perder a regra fiscal individual do produto.

O agrupamento não deve misturar grupos que geram NF-e diferentes. O fluxo
Delphi encerra o grupo atual antes de iniciar outro quando muda o requisitante,
conforme a transição observada em
`delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:931`.

## 3. Testes obrigatórios

Exigir testes que comprovem:

1. duas linhas do mesmo produto, mesma filial de estoque e mesmo grupo fiscal
   geram um único item fiscal com quantidade somada;
2. ambos os `pedidosfiliais` permanecem vinculados ao documento e aos efeitos
   de estoque;
3. requisitantes diferentes geram grupos/NF-e separados;
4. filiais de estoque diferentes não são consolidadas;
5. o XML contém a quantidade consolidada e não duas linhas duplicadas;
6. o Code 128C dos volumes é decodificado e retorna exatamente
   `chave_nfe + nnn + nnn`;
7. retry não duplica item fiscal, vínculo, movimento ou etiqueta.

Entregar matriz `evidência -> requisito -> tarefa -> teste`, contrato do
agrupamento, contrato do barcode, quickstart de validação física e critérios
de aceite. Não alterar código nesta execução do `/speckit.specify`.
