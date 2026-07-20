# Adaptar a Busca Assistida de Produtos para Orçamentos

Label: wayfinder:map

## Destination

Produzir um dossiê autocontido, pronto para posteriormente virar prompt SpecKit, que especifique a adaptação do painel reutilizável de Busca Assistida de Produtos (já implementado e evoluído em Consulta de Estoques) para uso em Orçamentos: o vendedor busca produtos por necessidade do cliente, seleciona vários e **inclui os selecionados no Orçamento em edição**. O painel em si (voz, multisseleção, modal de detalhe) não é redesenhado — só o adaptador do hospedeiro Orçamentos.

## Notes

- Este mapa complementa, sem reabrir, as decisões de [Experiência reutilizável da Busca Assistida de Produtos](../busca-assistida-produtos-experiencia-wayfinder/dossie.md) (voz, multisseleção, `onApply`, modal de detalhe, sanitização) e de [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md) (recuperação híbrida, embeddings, cache). O painel e seu contrato `onApply(selections[])`/`currentSelection` são reaproveitados sem alteração.
- Usar `/grilling` e `/domain-modeling` para as decisões de adaptador; fatos do código são levantados diretamente, não perguntados ao usuário.
- Seam de inclusão já identificado e estável: `handleConfirmProdutoModal` (`Cadastro.tsx`) — callback `(linha: OrcamentoProdutoLinha) => void` que faz upsert por `numero` e recalcula totais; não depende da máquina de estados do modal tradicional de bipe. Hidratar cada produto selecionado via o endpoint `produto_lookup` já existente antes de chamar esse callback.
- Vendedor já é campo de primeira classe do Orçamento (`cabecalho.vendedor`, busca por código); Cliente já tem busca por CPF/CNPJ (`cliente_expresso_urls.lookup`, `search_field=documento`) — relevante para a ideia futura de "iniciar orçamento por voz", que fica fora deste mapa.
- Risco de sequenciamento: existe um PRD pronto (`orcamentos-modal-produtos-speckit`, `ready-for-agent`, ainda não implementado) que vai reescrever a máquina de estados de quantidade/comandos do modal tradicional de inclusão de produto, tocando perto do mesmo contrato `onConfirm`/`handleConfirmProdutoModal`. Confirmar estabilidade desse contrato antes de fechar o design do adaptador.
- Fora de escopo desde a nomeação do destino: o fluxo de voz "iniciar orçamento com os produtos selecionados para o cliente CPF X, código do vendedor Y" — cria um Orçamento do zero por comando, é um recurso futuro e diferente de incluir itens num Orçamento já aberto.
- Este mapa planeja e especifica; não implementa e não gera ainda o prompt SpecKit.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

- [Auditar o fluxo atual de inclusão de produto em Orçamentos](issues/01-auditar-fluxo-inclusao-produto-orcamentos.md) — seam estável é `handleConfirmProdutoModal` + `produto_lookup`; Filial é única no cabeçalho; Vendedor e Cliente (busca por CPF) já são campos de primeira classe; painel se encaixa como overlay igual ao modal tradicional; não há serviço de capabilities pronto, só flags de perfil (`usuarioAlterarPreco`/`usuarioGerenteVendas`).
- [Verificar coordenação com o PRD de reforma do modal tradicional de produto](issues/04-verificar-coordenacao-speckit-modal-produtos.md) — sem conflito, contrato de página confirmado estável; achado relevante (regra de identidade Produto+Filial) repassado ao ticket do adaptador.
- [Definir autorização e capabilities do painel em Orçamentos](issues/02-autorizacao-e-capabilities-painel-orcamentos.md) — preço sempre visível (acesso ao Cadastro já basta); comissão sempre oculta (não existe hoje nesta tela); novo contexto `busca_assistida_orcamentos` delega para o mesmo acesso grosso ao Cadastro. Achado repassado: Desconto por Cargo do Cliente vira ticket novo.
- [Decidir escopo de Filial (única vs. múltipla) no painel em Orçamentos](issues/03-filial-unica-vs-multipla.md) — Filial única, a Filial Base da sessão (mesmo mecanismo de Consulta de Estoques), sem checagem cruzada; `produto_lookup` já opera assim para preço/estoque/Cargo em toda a cadeia de inclusão.
- [Definir preço por Cargo do Cliente na Busca Assistida de Orçamentos](issues/07-definir-preco-por-cargo-cliente.md) — busca/detalhe ficam Cargo-aware quando o Cliente já está identificado (mesmo comportamento do `produto_lookup` tradicional, que já é Cargo-aware desde a prévia); extrair `resolveEmpcargo`+`resolveMarkupPercent` de `OrcamentoProdutoInclusaoService` para um serviço compartilhado, reaproveitado pelos dois caminhos.
- [Definir o adaptador de Aplicar seleção para linhas do Orçamento](issues/05-definir-adaptador-aplicar-selecao.md) — Produto+Filial já existente incrementa 1, senão inclui linha nova com 1; falha parcial por item, sem derrubar o lote; painel nunca fecha sozinho, mesmo comportamento geral; feedback via mensagem flash local, sem toast novo.
- [Consolidar o dossiê da adaptação para Orçamentos](issues/06-consolidar-dossie-orcamentos.md) — dossiê autocontido em [`dossie.md`](dossie.md), pronto como fonte primária para uma futura conversão em prompt SpecKit.

## Not yet specified

Nenhuma névoa adicional identificada além dos tickets já abertos — o destino é estreito o suficiente para já especificar tudo que se sabe hoje. Pode surgir necessidade de ajustar `produto_lookup` para aceitar quantidade inicial diferente de 1, a confirmar somente se o ticket do adaptador expuser essa necessidade.

## Out of scope

- Redesenhar o painel de Busca Assistida (voz, multisseleção, modal de detalhe) — já decidido em [Experiência reutilizável da Busca Assistida de Produtos](../busca-assistida-produtos-experiencia-wayfinder/dossie.md).
- Reabrir recuperação híbrida, embeddings, cache ou orçamento de tokens — já decidido em [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md).
- O fluxo de voz "iniciar orçamento com os produtos selecionados para o cliente CPF X, vendedor Y" — recurso futuro, diferente de incluir itens num Orçamento já aberto.
- Reescrever a máquina de estados de quantidade/comandos do modal tradicional de bipe — escopo do PRD separado `orcamentos-modal-produtos-speckit`.
- Adaptar para Contratos ou outros hospedeiros além de Orçamentos nesta entrega.
