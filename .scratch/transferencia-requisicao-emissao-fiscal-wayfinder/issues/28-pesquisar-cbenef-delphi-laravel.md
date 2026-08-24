# Pesquisar `cBenef` no Delphi e no Laravel

Label: wayfinder:issue
Type: research
Status: resolved
Blocked by: 

## Question

Como o Delphi define, resolve, grava e serializa o `cBenef` na NF-e de saída
de transferência, e o estado atual do Laravel reproduz essa regra? Existe
alguma lacuna que justifique um prompt `/speckit.specify`?

## Required output

- evidência primária nos fontes Delphi disponíveis;
- evidência no código e nos testes atuais do Laravel;
- distinção entre `cBenef` do item, CST/CSOSN, UF e benefício fiscal;
- decisão CONFIRMADO/INFERIDO/DÚVIDA/NÃO LOCALIZADO/DIVERGENTE;
- prompt SpecKit somente se houver ajuste necessário;
- não implementar código Laravel.

## Answer

A pesquisa confirmou uma lacuna específica.

No Delphi, `clnfe.pas:16548-16578` chama a função de banco
`Codigo_cBenef(produto, CRT, UF emitente, CST, CSOSN, CFOP, natureza)`. Em
`clnfe.pas:5543-5550` e `4337-4344`, o retorno não vazio é escrito como
`<prod><cBenef>` para o item corrente; retorno vazio não gera a tag.

No Laravel, `LegacyCaracteristicasCbenefRepository` atende somente o
cadastro administrativo. A preparação da fotografia, o adapter NFePHP e o
serializer da Transferência não resolvem nem serializam `cBenef`, e não há
teste de emissão que valide a tag. O corpo da função PostgreSQL não foi
localizado nos fontes versionados, portanto a spec não deve reimplementar sua
regra em PHP.

Foi publicado o prompt:

- `modules/interlojas/transferencia-requisicao-emissao-fiscal/42-speckit-prompt-specify-cbenef-paridade-delphi.md`

O prompt exige resolução por item, preservação da função legada, bloqueio em
erro de infraestrutura, retorno vazio sem tag, serialização em `<prod>` e
paridade entre fotografia, XML NFePHP e `xmlnfe`. Não foi alterado código.
