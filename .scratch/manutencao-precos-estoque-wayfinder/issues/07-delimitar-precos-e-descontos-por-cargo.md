Type: task
Status: resolved
Blocked by: 01, 02, 05

## Question

Como preços e descontos por Cargo são calculados, exibidos e persistidos pela manutenção interna; quais parâmetros e autorizações os habilitam; como interagem com preço normal/Promoção; e quais fluxos de Vendas os consomem no Delphi e no Laravel?

## Answer

### Modelo e habilitação

- **CONFIRMADO:** a identidade persistida é `Produto + Cargo`, em `produtoscargos.markup`. Apesar do nome físico, o valor é tratado pela interface e pelas fórmulas como **desconto percentual**; preço e margem são projeções. Evidências: `delphi/apps/estoque/dmmanutencaopreco.pas:1214-1230,1638-1656,1730-1746`; `laravel/backend/app/Services/Estoque/ProdutoPrecosCargosWriteService.php:29-122`.
- **CONFIRMADO:** os Cargos dinâmicos são aqueles ativos que possuem vínculo em `produtoscargos` no conjunto filtrado, não papéis do usuário autenticado. Evidência: `qryProdutosCargos`, `delphi/apps/estoque/dmmanutencaopreco.dfm:785-843`.
- **DECISÃO NOVA:** nomear o valor como “Desconto por Cargo” e o resultado como “Preço calculado do Cargo”; reservar `markup` ao legado físico.
- **CONFIRMADO:** `ParSistema.PrecosporCargo` habilita as colunas e a escolha da Coluna de Promoção. No Laravel, `ProdutosPrecosPorCargoParameter` resolve o mesmo parâmetro pela Filial e protege leitura, prévia e mutação. Evidências: `delphi/apps/estoque/fmmanutencaopreco.pas:627`; `dmmanutencaopreco.pas:1200-1255`; `laravel/backend/app/Support/ModuleParameters/ProdutosPrecosPorCargoParameter.php:12-23`; `ProdutoPrecosCargosTabReadService.php:30-67`.
- **NÃO LOCALIZADO:** não existe autorização exclusiva de Cargo; o F5 usa a prova única de Gerente de Estoque já delimitada. Evidência: `dmmanutencaopreco.pas:1616-1674,1730-1746`.
- **DECISÃO NOVA:** Cargo participa do mesmo commit atômico e da mesma autorização única do F5, sem credencial por célula ou nova permissão específica.

### Grid, propagação e cálculo

- **CONFIRMADO:** cada Cargo gera `cargo_<id>` (preço editável), `margem_pc<id>` (somente leitura) e `desconto_pc<id>` (editável). Evidências: `dmmanutencaopreco.pas:1214-1255,1495-1516`; `fmmanutencaopreco.pas:1256-1267`.
- **CONFIRMADO:** editar o desconto propaga a todos os Produtos visíveis da mesma `Característica + Faixa`, mas prepara uma mutação para cada `Produto + Cargo`. Editar o preço final deriva o desconto por `100 - preçoCargo × 100 / preçoBase`. Evidências: `AtualizarDescontoCargos`, `dmmanutencaopreco.pas:2456-2546`; `AtualizarPrecoCargos`, `dmmanutencaopreco.pas:2548-2582`.
- **DECISÃO NOVA:** a interface sem paginação manterá edição por desconto e por preço final, exibirá a prévia completa das linhas afetadas e permitirá desfazer a preparação antes do F5. Propagação usa `Característica + Faixa`; persistência usa `Produto + Cargo`.
- **CONFIRMADO:** vazio é normalizado para zero e inserido/atualizado como zero; não exclui o vínculo. Evidências: `dmmanutencaopreco.pas:2485-2510,1730-1746`.
- **DIVERGENTE:** a aba Laravel existente trabalha por Produto selecionado, exige valor, e possui inclusão, alteração e exclusão explícita; não possui propagação em lote. Evidências: `ProdutoPrecosCargosWriteService.php:29-158,206-228`; `laravel/backend/resources/js/Pages/Cadastros/Estoque/Produtos/PrecosCargosTabPanel.tsx:163-254`.
- **DECISÃO NOVA:** vazio na manutenção significa desconto zero; exclusão física continua ação explícita distinta, reaproveitando a operação do Cadastro de Produtos.
- **CONFIRMADO:** sem Coluna de Promoção, a base é o preço normal. Com coluna escolhida, `manutencao_precocargo` recebe normal, promocional, validade e desconto e decide o preço efetivo. Mudanças nas bases recalculam preço e margem `(1 - última compra / preçoCargo) × 100`. Evidências: `dmmanutencaopreco.dfm:915-965`; `dmmanutencaopreco.pas:2065-2120`.
- **DECISÃO NOVA:** usar o oráculo PostgreSQL já encapsulado em `LegacyProductPriceEngineRepository`; não duplicar a seleção normal/promocional no cliente ou em fórmula Laravel.
- **POSSÍVEL BUG LEGADO:** a edição do desconto usa `filialbase`, enquanto a consulta inicial usa a Filial selecionada, e divide pela projeção sem proteção contra zero. Não reproduzir: usar Filial efetiva e a proteção do motor comercial. Evidência: `dmmanutencaopreco.pas:2520-2539`.

### Persistência, auditoria e Vendas

- **CONFIRMADO:** F5 atualiza vínculos existentes e insere ausentes a partir de `DescontosProdutosCargosAlterados`; preço e margem não são persistidos. Evidência: `dmmanutencaopreco.pas:1638-1656,1730-1746`.
- **CONFIRMADO:** o Laravel já possui operações transacionais auditadas de incluir, alterar e excluir `Produto + Cargo` e impede incluir Cargo inativo. Evidência: `ProdutoPrecosCargosWriteService.php:29-189`.
- **DECISÃO NOVA:** a manutenção precisa de uma mutação de lote atômica, não várias chamadas unitárias do navegador; cada item deve ser auditável e correlacionado ao lote F5.
- **CONFIRMADO:** Orçamentos, Contratos, Ordem de Serviço e Troca de Mercadorias consultam `produtoscargos.markup` por Cargo e passam o desconto a `estoques_preco` quando o parâmetro está ativo. Evidências: `delphi/apps/vendas/dmorcamentos.pas:1580-1595,5498,5779-5790`; `dmorcamentos.dfm:742-780,1264-1272,2543-2583`; `dmcadastrocontratos.pas:4863-4906,16877-16888`; `dmordemservico.pas:1727-1781,6605`; `dmtrocamercadorias.pas:3930-3938,7903`.
- **CONFIRMADO:** o Orçamento fotografa o Cargo em `orcamentos.empcargo`; com Cliente, a origem é `clientes.empcargo`; sem Cliente, o Laravel já contempla Cargo padrão. Evidências: `dmorcamentos.dfm:63-88,1663-1666`; `laravel/backend/app/Services/Vendas/Orcamentos/OrcamentoProdutoInclusaoService.php:379-413`.
- **CONFIRMADO:** a inclusão de produto no Orçamento Laravel aplica `markup do Cliente → desconto do Cargo → preço normal/promocional`. Evidência: `OrcamentoProdutoInclusaoService.php:435-470`.
- **DIVERGENTE:** `VendaProdutoPesquisaService::resolveMarkupPercent` retorna zero e delega o desconto específico a outro lookup, sem demonstrar uma política única entre pesquisa e linha final. Evidência: `VendaProdutoPesquisaService.php:385-415`.
- **DIVERGENTE:** `OrcamentoProdutoInclusaoService::mapPrecosCargosInclude` lê `produtoscargos.preco`, mas os fluxos comprovados persistem `markup`; nenhuma outra leitura dessa suposta coluna foi localizada. Evidência: `OrcamentoProdutoInclusaoService.php:826-851`.
- **DECISÃO NOVA:** reutilizar motor, parâmetro, repositórios e auditoria do Cadastro de Produtos, não sua UX unitária. As divergências dos consumidores serão tratadas nas respectivas specs, não escondidas na manutenção.

### Casos de aceitação para o futuro `$to-spec`

1. Parâmetro desligado não monta nem aceita mutações de Cargo.
2. F6 monta todos os Cargos ativos aplicáveis e as três projeções, sem paginação.
3. Alterar desconto ou preço final propaga por Característica + Faixa e mostra a prévia completa.
4. Preço normal e Promoção válida/inválida são resolvidos pelo oráculo na Filial efetiva.
5. Vazio grava zero; exclusão física é explícita.
6. F5 usa uma autorização, grava atomicamente e correlaciona auditoria do lote e dos itens.
7. Falha de qualquer `Produto + Cargo` impede commit parcial.

Fatia suficientemente independente para um `$to-spec` próprio após o fechamento do mapa, com dependência explícita do motor de cálculo e de Promoções.
