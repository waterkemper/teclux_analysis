# Adaptação da lupa de Produto da Consulta de Estoques

Label: wayfinder:map

## Destination

Produzir um adendo funcional e técnico autocontido que descreva exatamente a lupa enriquecida de Produto usada pela Consulta de Estoques no Delphi — query, filtros, colunas, dados calculados e contrato de seleção —, confronte-a com o framework de lookup do Laravel e defina uma adaptação exclusiva da Consulta de Estoques, pronta para atualizar sua especificação e seu prompt SpecKit.

## Notes

- O foco Delphi é a lupa/pesquisa acionada pelo componente de Produto dentro de **Estoques → Consulta de Estoques**, incluindo o framework compartilhado somente até onde explica seu comportamento especial.
- Localizar a origem efetiva da pesquisa: identificador/tipo de pesquisa, callbacks, datasets, SQL, macros, parâmetros, configuração de colunas, títulos, formatos, ordenação, filtros e valores devolvidos ao componente.
- Confirmar especialmente Produto, código visual, descrição, Filial, Saldo de Estoque, preço de venda e quaisquer dados comerciais, fiscais, de Lote, Grade ou situação que realmente apareçam na lupa.
- Distinguir campos selecionáveis/pesquisáveis, campos apenas exibidos, campos ocultos usados no retorno e cálculos derivados.
- Confrontar com o Laravel atual e com os artefatos já publicados da Consulta de Estoques.
- A adaptação deve existir **somente dentro da Consulta de Estoques**. Não alterar globalmente todas as lupas de Produto nem mudar o contrato comum sem necessidade demonstrada.
- Priorizar extensão/configuração local sobre fork/copiar componentes; se o framework atual não suportar, definir o menor seam local.
- Toda Filial e todo dado sensível devem respeitar autorização server-side no Laravel.
- O Delphi é fonte de paridade funcional, mas bugs, vazamentos de Filial e exposição financeira devem ser classificados e não copiados silenciosamente.
- O resultado final deve permitir atualizar `.scratch/consulta-estoques-laravel/PRD.md` e `modules/estoque/consulta-estoques/09-speckit-prompt.md` sem mandar o SpecKit investigar o Delphi.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar a lupa Delphi da Consulta de Estoques](issues/01-inventariar-lupa-delphi-consulta-estoques.md) — confirmou `pesItemProdutosConsulta` e a query Produto+Filial com identidade, Grade, estoques, Pedidos, preços, situação, comissões e pesquisa avançada, delimitando visibilidade por parâmetros, retorno somente do Produto e riscos legados de Filial/SQL/confidencialidade.
- [Mapear o framework Laravel da lupa da Consulta de Estoques](issues/02-mapear-framework-lupa-laravel-consulta-estoques.md) — confirmou o modal de catálogo configurável e a lupa enriquecida de Vendas como precedentes, mas não uma implementação da Consulta; recomenda wrapper e endpoint/provider locais com Filiais e dados sensíveis autorizados no servidor.
- [Definir paridade e adaptação isolada da lupa](issues/03-definir-paridade-e-adaptacao-isolada-lupa.md) — fixou a matriz de colunas, buscas, parâmetros, capacidades e Filiais, com seleção somente do Produto e desenho exclusivo sobre o modal comum, incluindo consolidação identificada e limitada às Filiais autorizadas.
- [Consolidar o adendo e atualizar os artefatos](issues/04-consolidar-adendo-e-atualizar-artefatos.md) — publicou o adendo autocontido e incorporou o contrato completo da lupa exclusiva na PRD e no prompt SpecKit, sem dependência do Delphi e sem alterar outras lupas.

## Not yet specified

Nenhuma. O destino deste mapa foi alcançado.

## Out of scope

- Implementar a adaptação no Laravel durante este Wayfinder.
- Alterar o comportamento das lupas de Produto fora da Consulta de Estoques.
- Refazer o Cadastro de Produtos ou a Consulta de Estoques inteira.
- Alterar o Delphi.
- Copiar vulnerabilidades, SQL concatenado, cores ou layout literal do componente legado.
