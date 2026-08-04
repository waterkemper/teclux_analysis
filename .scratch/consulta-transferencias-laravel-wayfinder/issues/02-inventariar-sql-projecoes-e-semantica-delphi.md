# Inventariar SQL, projeções e semântica da Consulta de Transferências Delphi

Type: research
Status: resolved
Blocked by:

## Question

Quais SQLs são construídos ou executados por `dmconsultatransferencias.pas/.dfm`, incluindo joins, campos, macros, binds, filtros condicionais, regras de período/situação/Curva ABC/filiais, ordenação, datasets relacionados e efeitos de seleção, e como converter essa evidência em requisitos seguros para repositórios de leitura Laravel sem perpetuar injeção ou N+1?

## Comments

## Answer

Inventário concluído em [pesquisa-sql-delphi.md](../../../modules/interlojas/consulta-transferencias/pesquisa-sql-delphi.md).

A consulta Delphi usa um único dataset de leitura sobre `pedidosfiliais`, com joins de filiais, produto/característica e dados fiscais/notas, mais subconsultas escalares para grades, estoques, reserva e CST. Cinco macros textuais controlam período, filiais requisitantes/requisitadas, situações e Curva ABC; não existem binds no componente e datas/listas de filiais são concatenadas, portanto essa técnica não pode ser levada ao Laravel.

O contrato Laravel deve adotar filtros tipados, binds/`whereIn`, agrupamentos OR explícitos, projeção set-based numa consulta com cardinalidade verificada, paginação e ordenação por whitelist com desempate estável. O artefato registra campos, joins, semântica de cada combinação, efeitos de resultado/seleção, riscos de injeção e N+1 e os pontos ainda sujeitos a decisão (rótulo D, “FECHADADA”, cardinalidades e inversão linha/coluna), todos com citações `arquivo:linha`.
