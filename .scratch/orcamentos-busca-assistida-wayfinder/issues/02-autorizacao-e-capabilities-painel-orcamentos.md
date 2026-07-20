# Definir autorização e capabilities do painel em Orçamentos

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como o `capabilities` (`can_visualizar_precos`/`can_visualizar_comissoes`) e o contexto de autorização de fotos/detalhe (`busca_assistida`) do painel devem ser alimentados em Orçamentos, dado que este hospedeiro não tem um serviço de capabilities pronto como o de Estoque — só `OrcamentosAuthorizationService` (acesso grosso a módulo) e as flags de perfil `usuarioAlterarPreco`/`usuarioGerenteVendas` computadas no controller?

## Answer

- **`can_visualizar_precos`**: sempre `true` para quem tem acesso ao Cadastro de Orçamentos (`OrcamentosAuthorizationService::canAccessCadastro`) — construir um orçamento exige ver preço, é o núcleo do trabalho do vendedor. Não atrelar a `usuarioAlterarPreco`, que é uma permissão diferente (alterar preço, não ver), já aplicada separadamente no modal de item, após a inclusão.
- **`can_visualizar_comissoes`**: sempre `false` neste hospedeiro. Não há campo de comissão exibido nem gateado no modal de item de Orçamentos hoje (`comissao_produto`/`comissao_grupo` existem no tipo da linha, mas não são renderizados nesta tela; `usuarioGerenteVendas` só libera desconto, não comissão) — não introduzir uma exposição de informação que o resto de Orçamentos ainda não tem.
- **Contexto de autorização de fotos/detalhe**: novo contexto nomeado `busca_assistida_orcamentos`, delegando para `OrcamentosAuthorizationService::canAccessCadastro` — mesma checagem grossa que já autoriza o próprio Cadastro de Orçamentos onde o painel vive, seguindo o mesmo padrão de reaproveitar o acesso ao módulo do hospedeiro já usado em Consulta de Estoques.

**Achado repassado para novo ticket, fora do escopo desta pergunta**: existe um mecanismo real de Desconto por Cargo (`CargoVenda`, `ProdutoPrecosCargosTabReadService`, `VendasCargoAuthorizationService`) que ajusta o Preço Efetivo na Filial conforme o Cargo do Cliente do Orçamento, quando já identificado. Isso é uma decisão de **cálculo** de preço (o que mostrar), não de visibilidade/autorização (quem pode ver) — ver [Definir preço por Cargo do Cliente na Busca Assistida de Orçamentos](07-definir-preco-por-cargo-cliente.md).
