# Prompt SpecKit — Adaptar a Busca Assistida de Produtos para Orçamentos

Crie uma especificação e um plano de implementação completos para adaptar, no Laravel já existente, o painel reutilizável de **Busca Assistida de Produtos** (já implementado e evoluído em Consulta de Estoques — `modules/estoque/busca-assistida-produtos/09-speckit-prompt.md` e `10-speckit-prompt.md`) para uso em **Orçamentos**: o vendedor busca produtos por necessidade do cliente, seleciona vários e **inclui os selecionados no Orçamento em edição**. O painel em si (voz, multisseleção, faixa de seleção, modal de detalhe, sanitização) **não é redesenhado — não reabra essas decisões**; esta entrega é só o adaptador do hospedeiro Orçamentos.

## Regra de investigação

Você tem acesso somente ao Laravel atual. Inspecione detalhadamente `Cadastro.tsx` (Vendas/Orçamentos), `ProdutosGrid`, `CadastroItemOrcamentoModal`/`CadastroItemVendaProdutoModal`, `OrcamentoProdutoInclusaoService`, `OrcamentoCadastroPageService`, `OrcamentosAuthorizationService` e `BuscaAssistidaPanel` — e trate-os como ponto real de partida. **Não procure, não solicite e não dependa de Delphi**. Todo contrato necessário está neste prompt.

## Estado atual e seam de inclusão

`ProdutosGrid` é só grade de exibição + toolbar (Incluir/Excluir/Frete/Conferir); "Incluir item" abre o modal tradicional compartilhado com Contratos (`CadastroItemVendaProdutoModal`, via wrapper `CadastroItemOrcamentoModal`). O seam real e estável para o novo adaptador é **`handleConfirmProdutoModal`** em `Cadastro.tsx`: um callback puro `(linha: OrcamentoProdutoLinha) => void` que faz upsert por `numero`, aplica `applyProdutosTotais` e agenda `agendarCascataValores()` — não depende da UI/máquina de estados de bipe do modal. Não altere esse callback.

Para ir de um código de produto (tudo que a Busca Assistida devolve) a uma linha completa, reaproveite `produto_lookup` (`OrcamentoProdutoInclusaoService`), o mesmo usado pelo modal tradicional ao hidratar um código digitado/bipado.

`BuscaAssistidaPanel` já é um overlay fixo, independente de abas — monte-o como sibling perto dos outros modais (mesmo padrão de `CadastroItemOrcamentoModal`), com um gatilho (`BuscaAssistidaTrigger`) ao lado de "Incluir item" na toolbar de `ProdutosGrid`. Nenhum redesenho de aba/seção é necessário.

## Coordenação com o PRD do modal tradicional de bipe

Existe um PRD pronto e ainda não implementado (`orcamentos-modal-produtos-speckit`) que reescreve a máquina de estados de quantidade/comandos do modal tradicional de bipe (F5, buffer de scan, `onConfirm`'s `meta.intent`). **Sem conflito confirmado**: esse PRD escopa a reforma explicitamente para dentro do modal e declara que o contrato de página (`handleConfirmProdutoModal`, upsert por `numero`) deve ser preservado — exatamente o que este adaptador usa diretamente, contornando a UI do modal. Não toque nesse PRD nem na máquina de estados do modal.

Herde dele a regra de identidade já estabelecida no domínio: **Produto+Filial é a chave de igualdade para soma automática** — use-a no adaptador (ver "Adaptador de Aplicar seleção" abaixo).

## Autorização e capabilities do painel

Orçamentos não tem um serviço de capabilities pronto como o de Estoque — só `OrcamentosAuthorizationService` (acesso grosso a módulo) e flags de perfil (`usuarioAlterarPreco`, `usuarioGerenteVendas`).

- `can_visualizar_precos`: sempre `true` para quem tem acesso ao Cadastro de Orçamentos (`OrcamentosAuthorizationService::canAccessCadastro`) — construir um orçamento exige ver preço. Não atrele a `usuarioAlterarPreco` (permissão de alterar, não de ver, já aplicada separadamente no modal de item após a inclusão).
- `can_visualizar_comissoes`: sempre `false` neste hospedeiro — não há campo de comissão exibido nem gateado no modal de item de Orçamentos hoje; não introduza uma exposição de informação que o resto de Orçamentos ainda não tem.
- Registre um novo contexto nomeado `busca_assistida_orcamentos` no mecanismo de autorização de fotos/detalhe, delegando para `OrcamentosAuthorizationService::canAccessCadastro` — mesma checagem grossa que já autoriza o próprio Cadastro de Orçamentos, seguindo o padrão de reaproveitar o acesso ao módulo do hospedeiro já usado em Consulta de Estoques (contextos não registrados são negados por padrão; preserve isso).

## Escopo de Filial

Filial única — `filiaisAutorizadasEfetivas = [filialBase]`, usando a **Filial Base** (`filial_ativa_codigo` da sessão, mesmo mecanismo já usado em Consulta de Estoques), não uma derivação separada de `cabecalho.filial` (embora as duas coincidam na prática, pois `cabecalho.filial` já é resolvido do mesmo contexto de sessão). Sem checagem de disponibilidade cruzada entre Filiais: `OrcamentoProdutoInclusaoService` já exige uma única Filial para tudo — preço, estoque e Cargo — e um item só pode ser incluído neste Orçamento saindo da Filial Base.

## Preço por Cargo do Cliente

A busca e o detalhe **devem ser Cargo-aware** quando o Cliente do Orçamento já está identificado — não é aceitável mostrar um preço genérico e só ajustar por Cargo na inclusão. Motivo: no fluxo tradicional, `produto_lookup` já resolve o Cargo assim que o código é digitado/bipado — o preço já sai ajustado desde a prévia, não existe estágio "genérico antes"; a Busca Assistida precisa replicar esse mesmo comportamento.

Mecanismo a extrair, hoje privado dentro de `OrcamentoProdutoInclusaoService`, para um **serviço pequeno e compartilhado**:

- `resolveEmpcargo(clienteCodigo, empcargoOverride, filialCodigo)` — Cliente → Cargo (`clientes.empcargo`, se `PRECOS_POR_CARGO` estiver ligado); sem Cliente, cai no Cargo Tabela Preço Padrão por parâmetro (paridade Delphi `qryProcuraClienteAfterOpen`) — sempre resolve algum Cargo, com ou sem Cliente.
- `resolveMarkupPercent(produtoCodigo, clienteCodigo, empcargo, filialCodigo)` — precedência markup do Cliente → markup do Cargo (`produtoscargos`) → zero.
- `resolvePrecoVenda`, que alimenta o markup em `priceEngineRepository->mapPrecoParaProdutosFilialMarkup(produto, Filial, markup)` — a mesma engine de preço usada em todo o Orçamento.

Consuma esse serviço compartilhado tanto em `OrcamentoProdutoInclusaoService` (comportamento inalterado) quanto na busca/detalhe da Busca Assistida em Orçamentos — nunca duplique a query/regra em dois lugares. A busca/detalhe computa preço como: Filial Base + Cliente do Orçamento (se identificado, senão `null` — o serviço já cai no Cargo Tabela Preço Padrão sozinho) → Cargo → markup → `priceEngineRepository`. O preço mostrado na busca deve ficar idêntico ao que sairia na inclusão.

## Adaptador de Aplicar seleção

Substitua/estenda o `onApply(selections: BuscaAssistidaSelection[])` em `Cadastro.tsx`:

- **Duplicidade vs. incremento**: para cada produto selecionado, verifique se já existe uma linha com o mesmo Produto+Filial em `data.produtos` (regra de identidade herdada do PRD do modal tradicional). Se existir, incremente a quantidade em 1; se não, inclua uma linha nova com quantidade 1 — o painel não tem campo de quantidade, cada item aplicado vale 1 unidade, igual a um bipe físico.
- **Falha parcial no lote**: processe cada produto selecionado independentemente via `produto_lookup`; sucessos são incluídos/incrementados normalmente, falhas (produto ficou inativo ou sem estoque na Filial Base entre a busca e o Aplicar) são reportadas individualmente sem derrubar os demais. O painel permanece aberto para o vendedor ver a falha e decidir se tenta de novo.
- **Fechamento ao Aplicar**: mesmo comportamento geral já decidido para o painel — nunca fecha sozinho. Produtos aplicados somem da faixa de seleção; o vendedor pode buscar e aplicar mais, fechando só por ação explícita (X/Esc/backdrop).
- **Feedback visual**: reaproveite o padrão leve de mensagem flash local já existente no Orçamento (ex. `documentEmailFlash` em `Cadastro.tsx`) — mensagem perto da grade ("N produtos incluídos", com detalhe de eventuais falhas), sem inventar um sistema de toast novo. Linhas novas/incrementadas aparecem na grade normalmente, sem destaque especial, igual ao modal tradicional.

## Contratos técnicos consolidados

**`BuscaAssistidaPanelProps` em Orçamentos**: mesmo contrato já definido para Consulta de Estoques (`onApply(selections[])`, `currentSelection` ampliado, painel nunca fecha sozinho) — nada muda na interface do painel em si. O hospedeiro Orçamentos alimenta: `filiaisAutorizadasEfetivas = [filialBase]`; `capabilities = { can_visualizar_precos: true, can_visualizar_comissoes: false }`; e um `clienteCodigo` opcional (do cabeçalho do Orçamento, se já identificado) que flui para o cálculo de preço Cargo-aware.

**Serviço compartilhado de preço por Cargo**: extraído de `OrcamentoProdutoInclusaoService`; consumido por (a) `OrcamentoProdutoInclusaoService` na inclusão (comportamento inalterado) e (b) a busca/detalhe da Busca Assistida em Orçamentos, recebendo `produtoCodigo`, `clienteCodigo` (opcional), `filialCodigo` (Filial Base).

**Novo contexto de autorização**: `busca_assistida_orcamentos`, delegando para `OrcamentosAuthorizationService::canAccessCadastro`.

**Adaptador `Cadastro.tsx`**: `onApply` resolve, para cada seleção, se existe linha com mesmo Produto+Filial em `data.produtos`; incrementa ou chama `produto_lookup` + `handleConfirmProdutoModal` para incluir. Falhas por item acumulam numa lista reportada via mensagem flash; sucessos seguem o fluxo normal de `applyProdutosTotais`/`agendarCascataValores`.

## Fases de implementação

Planeje tracer bullets verificáveis:

1. Extrair o serviço compartilhado de Cargo/markup de `OrcamentoProdutoInclusaoService`, sem alterar o comportamento existente da inclusão tradicional.
2. Novo contexto de autorização `busca_assistida_orcamentos`.
3. Busca/detalhe da Busca Assistida em Orçamentos: Filial Base + Cliente (se identificado) → preço Cargo-aware via o serviço compartilhado.
4. Montar `BuscaAssistidaPanel` como overlay em `Cadastro.tsx`, gatilho na toolbar de `ProdutosGrid`.
5. Adaptador `onApply`: duplicidade/incremento por Produto+Filial, `produto_lookup` por item, `handleConfirmProdutoModal`, falha parcial, mensagem flash.

Cada fase deve manter o modal tradicional de bipe e o restante do Cadastro de Orçamentos funcionando sem regressão.

## Matriz mínima de testes

Backend:

- Unit (seguindo `OrcamentoPricePrecedenceTest.php`): serviço compartilhado de Cargo/markup — com Cliente e `PRECOS_POR_CARGO` ligado, sem Cliente (cai no Cargo Tabela Preço Padrão), override de `empcargo`, precedência markup do Cliente vs. Cargo.
- Feature HTTP (seguindo `OrcamentoCadastroTest.php`): `produto_lookup` com/sem Cliente; endpoint de busca/detalhe da Busca Assistida em Orçamentos autoriza `busca_assistida_orcamentos` e nega contexto não registrado; preço muda conforme Cliente identificado/não identificado; Filial sempre a Filial Base, nunca lista.

Frontend (seguindo a convenção `Cadastro.exclusaoProduto.test.tsx`, novo arquivo `Cadastro.buscaAssistida.test.tsx`):

- Produto+Filial já existente incrementa; produto novo insere linha com quantidade 1.
- Falha parcial num lote de N não derruba os demais; painel permanece aberto após Aplicar.
- Mensagem flash reflete sucessos e falhas.
- `can_visualizar_comissoes` sempre falso; `can_visualizar_precos` sempre verdadeiro para quem acessa o Cadastro.

Regressão: modal tradicional de bipe continua funcionando sem alteração de comportamento (contrato de página preservado).

## Critérios de conclusão

Considere concluído somente quando:

- selecionar produtos e Aplicar inclui exatamente os produtos selecionados como linhas do Orçamento, sem fechar o painel;
- um produto já presente no Orçamento (mesma Produto+Filial) tem sua quantidade incrementada em 1, nunca duplicado;
- o preço mostrado na busca/detalhe é idêntico ao preço que a linha recebe ao ser incluída, com ou sem Cliente identificado;
- uma falha isolada num item do lote não impede os demais de serem incluídos, e é reportada especificamente;
- um hospedeiro sem o contexto `busca_assistida_orcamentos` registrado não consegue carregar fotos nem detalhe;
- nenhuma comissão é exibida pelo painel neste hospedeiro;
- o modal tradicional de bipe não tem regressão nem dependência nova;
- testes relevantes (unit do serviço de Cargo/markup, Feature HTTP, frontend do adaptador) passarem.

## Saída esperada do SpecKit

Produza especificação executável e plano, não apenas análise. Liste requisitos funcionais/não funcionais, contratos e payloads, serviços/endpoints/componentes atuais a alterar após inspecioná-los, fases, riscos, critérios de aceite e matriz de testes.

Não mande investigar Delphi. Não reabra decisões do painel reutilizável (voz, multisseleção, modal de detalhe, sanitização) já fixadas em `modules/estoque/busca-assistida-produtos/09-speckit-prompt.md` e `10-speckit-prompt.md`. Não reescreva a máquina de estados de quantidade/comandos do modal tradicional de bipe — escopo do PRD separado `orcamentos-modal-produtos-speckit`. Não implemente o fluxo de voz "iniciar orçamento para o cliente CPF X, vendedor Y" — recurso futuro, fora desta entrega. Não simplifique a resolução de Cargo, a regra de identidade Produto+Filial ou a Filial Base decidida.
