# Padronizar a visualização de fotos de Produtos no Laravel

Label: wayfinder:map

## Destination

Produzir um contrato funcional e uma análise de lacunas Delphi–Laravel para um Visualizador de Fotos de Produto compartilhado, adotado de uma vez em todos os grids Laravel que exibem fotos, pronto para ser convertido em especificação de implementação sem alterar as fontes neste workspace.

## Notes

- Consultar `grilling` e `domain-modeling` durante decisões; obter fatos no código e apresentar escolhas funcionais ao responsável de domínio uma por vez.
- Tratar `delphi/` e `laravel/` como fontes somente de leitura. Toda conclusão deve apontar evidência concreta e usar CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA.
- O visualizador é compartilhado entre Orçamentos, Contratos, consultas de Estoque e quaisquer outros grids de Produtos; a adoção Laravel será tratada integralmente neste esforço.
- O recurso é somente de visualização: inclusão, alteração, exclusão e download explícito de fotos estão fora do escopo.
- A coluna `Foto` é o ponto único de entrada. Clicar na miniatura seleciona a linha e abre o modal; botões separados ao lado do grid devem ser eliminados onde se tornarem redundantes.
- O modal mostra somente fotos do Produto atual, com foto principal, miniaturas, contador, zoom, ajuste à tela, código e descrição.
- Há duas navegações distintas: fotos do Produto e Produtos do contexto, com controles explicitamente separados.
- A navegação entre Produtos segue a ordenação e os filtros atuais do grid, elimina Produtos repetidos e inclui somente Produtos que possuam fotos.
- Produtos adicionados ao documento e ainda não persistidos participam quando já estiverem identificados e tiverem fotos disponíveis.
- Carregar sob demanda o Produto atual e pré-carregar os Produtos anterior e próximo.
- A autorização acompanha a consulta do contexto de origem, sem Permissão funcional adicional de fotos e sem dependência indevida de outro módulo.
- Em telas pequenas, o modal ocupa praticamente toda a área e mantém navegação e zoom acessíveis por toque.
- Distinguir ausência de fotos, imagem indisponível/corrompida e falha de comunicação; permitir repetição de tentativa sem fechar o modal.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Regra autoritativa de ordenação das fotos, escolha da foto principal e significado dos campos legados de foto/miniatura.
- Contrato mínimo de metadados no grid para contador, elegibilidade da navegação e Produtos ainda não persistidos.
- Estratégia exata de cache, prefetch, cancelamento de requisições e invalidação quando o Produto muda.
- Tratamento de imagens grandes, formatos não suportados, URLs expiradas e falhas parciais em uma galeria.
- Inventário definitivo dos consumidores Laravel e dos botões Delphi equivalentes que precisam ser substituídos.
- Forma final do prompt `/speckit.specify` e limites técnicos a prescrever ao checkout de implementação.

## Out of scope

- Incluir, alterar, excluir, ordenar ou definir foto principal por meio do visualizador.
- Oferecer ação explícita de download.
- Misturar automaticamente fotos de Produtos relacionados por Característica ou grade.
- Exibir Produtos sem fotos na navegação entre Produtos.
- Alterar dados em `delphi/` ou `laravel/`, ou executar migrations, Composer, npm, builds, formatadores ou geradores nesses diretórios.
- Implementar qualquer código funcional neste workspace de análise.

