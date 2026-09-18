Type: grilling
Status: resolved

## Question

## Answer

Uma entrada exata aceita `produtos.codigo`, `produtos.codigovisual` ou qualquer `produtoscodigobarras.codigobarras` associado ao Produto. O texto permanece textual durante a busca, preservando zeros a esquerda e sem converter barcode em inteiro.

Se houver mais de um Produto correspondente, o Laravel retorna ambiguidade e abre a tela de selecao de Produto; nao escolhe silenciosamente. Entrada inexistente retorna nao encontrado. Produto e Caracteristica permanecem contratos distintos.

Qual é o contrato canônico de resolução exata de um texto de produto no Laravel: fontes (`codigo`, `codigovisual`, `produtoscodigobarras`), precedência, comparação (`to_ascii`/case folding), preservação de zeros, resultados ambíguos/inexistentes e distinção entre resolver um Produto e resolver uma Característica?
