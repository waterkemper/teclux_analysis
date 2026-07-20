# Auditar o fluxo atual de inclusão de produto em Orçamentos

Type: task
Status: resolved
Blocked by:

## Question

Como um Produto é incluído hoje num Orçamento (seam de dados, não de UI), qual o formato de uma linha de Orçamento, como Filial/Vendedor/Cliente são resolvidos, onde o painel de Busca Assistida se encaixaria na tela, e qual o modelo de autorização/capabilities disponível para alimentar o painel neste hospedeiro?

## Answer

### Seam de inclusão (dados, não UI)

`ProdutosGrid` é só grade de exibição + toolbar (Incluir/Excluir/Frete/Conferir); "Incluir item" abre `CadastroItemOrcamentoModal`, um wrapper fino sobre o modal compartilhado `CadastroItemVendaProdutoModal` (também usado por Contratos), injetando `authAlterarPreco: VENDA_PRODUTO_AUTH_ORCAMENTOS` e `contextoDocumento: 'orçamento'`.

O seam real para um adaptador novo é **`handleConfirmProdutoModal`** em `Cadastro.tsx`: um callback puro `(linha: OrcamentoProdutoLinha) => void` que faz upsert por `numero` (`handleIncluirProduto` para nova linha, `handleSalvarProduto` para existente), aplica `applyProdutosTotais` e agenda `agendarCascataValores()`. Não depende da máquina de estados de bipe/comando do modal — qualquer código capaz de montar uma `OrcamentoProdutoLinha` válida pode chamá-lo diretamente.

Para ir de um código de produto (tudo que a Busca Assistida devolve) a uma linha completa, o caminho já existente é `POST` no endpoint `produto_lookup` (mesmo usado pelo modal tradicional ao hidratar um código digitado/bipado): `{produto: codigo, filial, ...}` → `{ linha: VendaProdutoLinha, aviso?, includes? }`. `nextProdutoNumero` (máx+1 das linhas atuais) dá o próximo id de linha.

### Formato da linha (`OrcamentoProdutoLinha` = `VendaProdutoLinha`)

Campos principais: `numero`, `produto`, `produtovisual`/`produtodigitado`, `filial`, `descricao`, `quantidade`, `precovenda`, `precotabela`, `valordescontoitem`/`percentualvalordescontoitem`, `descontogeral`, `desconto_cashback`, `total`, `montagem`/`entrega`, `situacao_produto`, `emestoque`/`reservado`/`futuro`, campos de grade, `vendedor`/`vendedor_nome` (vendedor por item), `comissao_produto`/`comissao_grupo`, `thumb_url`/`foto_media_url`/`photo_count`, campos de entrega. Valores monetários/quantidade são strings (estilo decimal Delphi).

### Filial, Vendedor, Cliente

- **Filial**: única (`data.cabecalho.filial: number`), resolvida server-side por `OrcamentoCadastroPageService::resolveFilialCodigo()` via contexto de sessão/branch — não é uma lista como `filiaisAutorizadasEfetivas` da Consulta de Estoques.
- **Vendedor**: campo de primeira classe do cabeçalho (`vendedor`/`vendedor_nome`), default o usuário logado, editável por lookup próprio (`vendedor_lookup`, busca por código, não por CPF); pode ser travado por parâmetro (`naoPermitirAlterarVendedor`) quando o Cliente já tem vendedor vinculado. Cada linha de produto também pode ter seu próprio `vendedor`/`vendedor_nome`.
- **Cliente**: resolvido por `CatalogCodeLookup` apontado para `cliente_expresso_urls.lookup`, que já suporta busca exata por documento (`search_field=documento`, usado hoje para detectar duplicidade de CPF/CNPJ). `CadastroExpressoClienteModal` cria Cliente inline quando não há match.

### Onde o painel se encaixa

`Cadastro.tsx` é uma página com **abas** (Produtos, Serviços, Endereço, Entrega, Observações, Login/Site, Atendimentos, Contatos) — estrutura diferente da Consulta de Estoques. Porém `BuscaAssistidaPanel` já é um overlay fixo de tela cheia (`fixed inset-y-0 right-0`), independente de estar dentro de qualquer aba — pode ser montado como sibling perto dos outros modais (mesmo padrão de `CadastroItemOrcamentoModal`), com um gatilho (`BuscaAssistidaTrigger`) ao lado de "Incluir item" na toolbar de `ProdutosGrid`. Nenhum redesenho de aba/seção é necessário.

### Autorização e capabilities

Não existe um serviço de capabilities para Orçamentos equivalente a `EstoqueConsultaEstoquesModuleAccessService` (que expõe `can_visualizar_precos`/`can_visualizar_comissoes` prontos). Orçamentos usa `OrcamentosAuthorizationService` (booleans grossos de acesso a módulo: `canAccessCadastro`, `canCreate/Update/Delete` etc.) mais flags de perfil computadas à parte no controller: `usuarioAlterarPreco` (via `resolveUsuarioPerfilFlag($user, 'alterarprecocontrato')`) e `usuarioGerenteVendas` (`'gerentevendas'`). Alimentar o `capabilities` do painel aqui exige mapear essas flags de perfil, não reaproveitar um serviço pronto.

### Risco de sequenciamento (fato levantado, decisão na ticket de coordenação)

O PRD `orcamentos-modal-produtos-speckit` (status `ready-for-agent`, ainda não implementado) vai reescrever a máquina de estados de quantidade/comandos do modal tradicional de bipe (`CadastroItemVendaProdutoModal`), incluindo a semântica de `onConfirm`'s `meta?.intent` (`replace`/`insert`/`increment`). Isso toca perto — mas não necessariamente dentro — do seam `handleConfirmProdutoModal` que este mapa pretende usar.