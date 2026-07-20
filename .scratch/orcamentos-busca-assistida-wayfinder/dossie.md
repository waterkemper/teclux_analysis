# Dossiê — Adaptar a Busca Assistida de Produtos para Orçamentos

Autocontido: quem for converter isto em prompt SpecKit não precisa reabrir os tickets, redescobrir os fatos sobre Orçamentos, nem investigar o Delphi. Complementa, sem reabrir, [Experiência reutilizável da Busca Assistida de Produtos](../busca-assistida-produtos-experiencia-wayfinder/dossie.md) (voz, multisseleção, `onApply`, modal de detalhe, sanitização) e [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md) (recuperação híbrida, embeddings, cache).

## Objetivo

O painel reutilizável de Busca Assistida (já implementado e evoluído para Consulta de Estoques) passa a rodar também em Orçamentos: o vendedor busca produtos por necessidade do cliente, seleciona vários e **inclui os selecionados no Orçamento em edição**. O painel em si (voz, checkboxes, faixa de seleção, modal de detalhe) não muda — só o adaptador do hospedeiro Orçamentos.

Fora de escopo desta entrega: o fluxo de voz "iniciar orçamento com os produtos selecionados para o cliente CPF X, vendedor Y" (cria um Orçamento do zero por comando — recurso futuro, diferente de incluir itens num Orçamento já aberto); adaptar para Contratos ou outros hospedeiros; reescrever a máquina de estados de quantidade/comandos do modal tradicional de bipe (escopo de um PRD separado, ver abaixo).

## Estado atual e seam de inclusão

`ProdutosGrid` é só grade de exibição + toolbar (Incluir/Excluir/Frete/Conferir); "Incluir item" abre o modal tradicional compartilhado com Contratos (`CadastroItemVendaProdutoModal`, via wrapper `CadastroItemOrcamentoModal`). O seam real e estável para o novo adaptador é **`handleConfirmProdutoModal`** em `Cadastro.tsx`: um callback puro `(linha: OrcamentoProdutoLinha) => void` que faz upsert por `numero`, aplica `applyProdutosTotais` e agenda `agendarCascataValores()` — não depende da UI/máquina de estados de bipe do modal.

Para ir de um código de produto (tudo que a Busca Assistida devolve) a uma linha completa, o caminho existente é `produto_lookup` (`OrcamentoProdutoInclusaoService`), o mesmo usado pelo modal tradicional ao hidratar um código digitado/bipado.

`BuscaAssistidaPanel` já é um overlay fixo, independente de abas — encaixa como sibling perto dos outros modais (mesmo padrão de `CadastroItemOrcamentoModal`), com um gatilho (`BuscaAssistidaTrigger`) ao lado de "Incluir item" na toolbar de `ProdutosGrid`. Nenhum redesenho de aba/seção é necessário.

Vendedor já é campo de primeira classe do cabeçalho do Orçamento (busca por código); Cliente já tem busca por CPF/CNPJ funcionando — relevante só para o fluxo de voz futuro, fora de escopo aqui.

## Coordenação com o PRD do modal tradicional

Existe um PRD pronto e ainda não implementado (`orcamentos-modal-produtos-speckit`) que reescreve a máquina de estados de quantidade/comandos do modal tradicional de bipe (F5, buffer de scan, `onConfirm`'s `meta.intent`). **Sem conflito**: esse PRD escopa a reforma explicitamente para dentro do modal e declara "preserve the existing lookup and page contracts where possible" — o limite de página (`handleConfirmProdutoModal`, upsert por `numero`) é tratado como contrato estável a preservar, exatamente o que este adaptador usa diretamente, contornando a UI do modal.

Achado relevante herdado desse PRD, usado no design do adaptador (ver abaixo): "Use Product+Filial as the equality key for automatic summation" — a regra de identidade já estabelecida no domínio para decidir quando um produto soma numa linha existente em vez de duplicar.

## Autorização e capabilities do painel

Orçamentos não tem um serviço de capabilities pronto como o de Estoque — só `OrcamentosAuthorizationService` (acesso grosso a módulo) e flags de perfil (`usuarioAlterarPreco`, `usuarioGerenteVendas`).

- `can_visualizar_precos`: sempre `true` para quem tem acesso ao Cadastro de Orçamentos (`OrcamentosAuthorizationService::canAccessCadastro`) — construir um orçamento exige ver preço. Não atrelar a `usuarioAlterarPreco`, que é uma permissão diferente (alterar, não ver), aplicada separadamente no modal de item após a inclusão.
- `can_visualizar_comissoes`: sempre `false` neste hospedeiro — não há campo de comissão exibido nem gateado no modal de item de Orçamentos hoje; não introduzir uma exposição de informação que o resto de Orçamentos ainda não tem.
- Contexto de autorização de fotos/detalhe: novo contexto nomeado `busca_assistida_orcamentos`, delegando para `OrcamentosAuthorizationService::canAccessCadastro` — mesma checagem grossa que já autoriza o próprio Cadastro de Orçamentos, seguindo o padrão de reaproveitar o acesso ao módulo do hospedeiro já usado em Consulta de Estoques.

## Escopo de Filial

Filial única — `filiaisAutorizadasEfetivas = [filialBase]`, usando a **Filial Base** (`filial_ativa_codigo` da sessão, mesmo mecanismo já estabelecido para Consulta de Estoques), não uma derivação separada de `cabecalho.filial` (embora as duas coincidam na prática, pois `cabecalho.filial` já é resolvido do mesmo contexto de sessão). Sem checagem de disponibilidade cruzada entre Filiais: `OrcamentoProdutoInclusaoService` já exige uma única Filial para tudo — preço, estoque e Cargo — e um item só pode ser incluído neste Orçamento saindo da Filial Base; qualquer coisa além disso seria informação que não pode virar ação aqui.

## Preço por Cargo do Cliente

A busca e o detalhe **precisam ser Cargo-aware** quando o Cliente do Orçamento já está identificado — não é aceitável mostrar um preço genérico e só ajustar por Cargo na inclusão. Motivo: no fluxo tradicional, `produto_lookup` já resolve o Cargo assim que o código é digitado/bipado — o preço já sai ajustado desde a prévia, não existe estágio "genérico antes".

Mecanismo a reaproveitar, hoje privado dentro de `OrcamentoProdutoInclusaoService`:

- `resolveEmpcargo(clienteCodigo, empcargoOverride, filialCodigo)` — Cliente → Cargo (`clientes.empcargo`, se `PRECOS_POR_CARGO` estiver ligado); sem Cliente, cai no Cargo Tabela Preço Padrão por parâmetro (paridade Delphi `qryProcuraClienteAfterOpen`) — sempre resolve algum Cargo, com ou sem Cliente.
- `resolveMarkupPercent(produtoCodigo, clienteCodigo, empcargo, filialCodigo)` — precedência markup do Cliente → markup do Cargo (`produtoscargos`) → zero.
- `resolvePrecoVenda` alimenta o markup em `priceEngineRepository->mapPrecoParaProdutosFilialMarkup(produto, Filial, markup)` — a mesma engine de preço usada em todo o Orçamento.

**Decisão**: extrair `resolveEmpcargo` + `resolveMarkupPercent` de `OrcamentoProdutoInclusaoService` para um serviço pequeno e compartilhado, chamado tanto pela inclusão quanto pela busca/detalhe da Busca Assistida em Orçamentos — sem duplicar a query/regra em dois lugares. A busca/detalhe computa preço como: Filial Base + Cliente do Orçamento (se identificado, senão `null` — o serviço compartilhado já cai no Cargo Tabela Preço Padrão sozinho) → Cargo → markup → `priceEngineRepository`. O preço mostrado na busca fica idêntico ao que sairia na inclusão.

## Adaptador de Aplicar seleção

- **Duplicidade vs. incremento**: para cada produto selecionado, o adaptador checa se já existe uma linha com o mesmo Produto+Filial no Orçamento (regra de identidade herdada do PRD do modal tradicional). Se existir, incrementa a quantidade em 1; se não, inclui uma linha nova com quantidade 1 — o painel não tem campo de quantidade, cada item aplicado vale 1 unidade, igual a um bipe físico.
- **Falha parcial no lote**: cada produto selecionado é processado independentemente via `produto_lookup`; sucessos são incluídos/incrementados normalmente, falhas são reportadas individualmente sem derrubar os demais. O painel permanece aberto para o vendedor ver a falha e decidir se tenta de novo — mesmo padrão de falha parcial localizada já estabelecido no painel.
- **Fechamento ao Aplicar**: mesmo comportamento geral já decidido para o painel — nunca fecha sozinho. Produtos aplicados somem da faixa de seleção; o vendedor pode buscar e aplicar mais, fechando só por ação explícita.
- **Feedback visual**: reaproveita o padrão leve de mensagem flash local já existente no Orçamento (ex. `documentEmailFlash` em `Cadastro.tsx`) — mensagem perto da grade ("N produtos incluídos", com detalhe de falhas), sem toast novo. Linhas novas/incrementadas aparecem na grade normalmente, sem destaque especial, igual ao modal tradicional.

## Contratos técnicos consolidados

**`BuscaAssistidaPanelProps` em Orçamentos**: mesmo contrato já definido para Consulta de Estoques (`onApply(selections[])`, `currentSelection` ampliado, painel nunca fecha sozinho) — nada muda na interface do painel em si. O que muda é só o que o hospedeiro alimenta: `filiaisAutorizadasEfetivas = [filialBase]`; `capabilities = { can_visualizar_precos: true, can_visualizar_comissoes: false }` (via `OrcamentosAuthorizationService::canAccessCadastro`); e um `clienteCodigo` opcional (do cabeçalho do Orçamento, se já identificado) que passa a fluir para o cálculo de preço Cargo-aware.

**Serviço compartilhado de preço por Cargo**: extrai `resolveEmpcargo` + `resolveMarkupPercent` de `OrcamentoProdutoInclusaoService`; consumido por (a) `OrcamentoProdutoInclusaoService` na inclusão (comportamento inalterado) e (b) a busca/detalhe da Busca Assistida em Orçamentos, recebendo `produtoCodigo`, `clienteCodigo` (opcional), `filialCodigo` (Filial Base).

**Novo contexto de autorização**: `busca_assistida_orcamentos`, delegando para `OrcamentosAuthorizationService::canAccessCadastro`.

**Adaptador `Cadastro.tsx`**: `onApply` resolve, para cada seleção, se existe linha com mesmo Produto+Filial em `data.produtos`; incrementa ou chama `produto_lookup` + `handleConfirmProdutoModal` para incluir. Falhas por item acumulam numa lista reportada via mensagem flash; sucessos seguem o fluxo normal de `applyProdutosTotais`/`agendarCascataValores`.

## Critérios de aceite

- Selecionar produtos e Aplicar inclui exatamente os produtos selecionados como linhas do Orçamento, sem fechar o painel.
- Um produto já presente no Orçamento (mesma Produto+Filial) tem sua quantidade incrementada em 1, nunca duplicado.
- O preço mostrado na busca/detalhe é idêntico ao preço que a linha recebe ao ser incluída, com ou sem Cliente identificado.
- Uma falha isolada num item do lote não impede os demais de serem incluídos, e é reportada especificamente.
- Um hospedeiro sem o contexto `busca_assistida_orcamentos` registrado não consegue carregar fotos nem detalhe.
- Nenhuma comissão é exibida pelo painel neste hospedeiro.

## Estados de erro

Herda os estados de voz e de busca já definidos no painel reutilizável (sem mudança). Novo no adaptador: falha de `produto_lookup` por item do lote (reportada individualmente, painel permanece aberto, demais itens seguem).

## Matriz mínima de testes

- Serviço compartilhado de Cargo/markup: com Cliente e `PRECOS_POR_CARGO` ligado, sem Cliente (cai no Cargo Tabela Preço Padrão), com override de `empcargo`, precedência markup do Cliente vs. Cargo.
- Busca/detalhe em Orçamentos: preço muda conforme Cliente identificado/não identificado; Filial sempre a Filial Base, nunca lista.
- Adaptador: Produto+Filial já existente incrementa; produto novo insere linha com quantidade 1; falha parcial num lote de N não derruba os demais; painel permanece aberto após Aplicar; mensagem flash reflete sucessos e falhas.
- Autorização: contexto `busca_assistida_orcamentos` autoriza quem tem `canAccessCadastro`, nega quem não tem; `can_visualizar_comissoes` sempre falso.
- Regressão: modal tradicional de bipe continua funcionando sem alteração de comportamento (contrato de página preservado).

## Fora de escopo

- O fluxo de voz "iniciar orçamento com os produtos selecionados para o cliente CPF X, vendedor Y" — recurso futuro, diferente de incluir itens num Orçamento já aberto.
- Redesenhar o painel de Busca Assistida (voz, multisseleção, modal de detalhe) — já decidido em [Experiência reutilizável da Busca Assistida de Produtos](../busca-assistida-produtos-experiencia-wayfinder/dossie.md).
- Reabrir recuperação híbrida, embeddings, cache ou orçamento de tokens — já decidido em [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md).
- Reescrever a máquina de estados de quantidade/comandos do modal tradicional de bipe — escopo do PRD separado `orcamentos-modal-produtos-speckit`.
- Adaptar para Contratos ou outros hospedeiros além de Orçamentos nesta entrega.

## Rastreabilidade

Mapa e tickets resolvidos: [`map.md`](map.md).
