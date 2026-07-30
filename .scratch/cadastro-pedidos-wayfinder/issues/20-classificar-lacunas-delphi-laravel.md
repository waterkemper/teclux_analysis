# Classificar as lacunas Delphi-Laravel do Cadastro de Pedidos

Type: task
Status: resolved
Blocked by: 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19

## Question

Consolidar, a partir de todos os tickets de investigação já resolvidos, a classificação completa de achados: o que é CONFIRMADO/reaproveitável, quais são as divergências internas do Delphi mantidas por decisão (ex.: bases oficial vs. custo em paralelo, tickets 13-14), quais são os possíveis bugs legados encontrados e a decisão de não replicá-los (situação "Concluído" reaproveitando código 'A', ticket 03; fórmula de total de IPI na grade, ticket 09; `CalcularAcrescimoDesconto` e `CalcularPrecoSugestao` mortos, tickets 11 e 08), quais dúvidas ficaram em aberto para a implementação confirmar (direção dos botões "Gerar Total X", tickets 15/16/19; persistência de observação; relevância de negócio da Importação Daico, ticket 12), e o que foi corrigido para fora do escopo (DIFAL, ticket 18; `SelecionarProdutosPedidoCopiar` e afins, ticket 10). Produzir a lista consolidada única, sem duplicar o que já está detalhado em cada ticket — só referenciar e resumir.

## Answer

### 1. CONFIRMADO / reaproveitável — arquitetura e contratos fechados

- **Inventário fechado** (ticket 01): 12 subsistemas no núcleo (dm+fm) + 2 satélites essenciais (`fmcadastroprodutospedidos_`, `fmcadastropedidosgrade`), ~19,9 mil linhas.
- **Contrato "Gerar Pedido de Compra"** (ticket 03), já fechado em `03-speckit-prompt.md` de Consulta de Compras: reconfirmado **sem nenhuma divergência** — filial de fatura, fornecedor, precedência de preço, filtro `sugestao ≠ 0`, padrão singleton de reabertura de tela. Nada a revisar.
- **Motor de Custo** (`dmCalcularCusto.pas`/`TdtmCalcularCusto`, tickets 02/06) — confirmado **compartilhado por escrita** entre Cadastro de Pedidos e o módulo de Notas Fiscais de Entrada já existente no legado (`dmcadastronotasfiscais.pas`), via `ParSistema.LocalCalculoPreco`. Distinto do motor read-only já usado em Consulta de Compras — não confundir os dois.
- **Motor de Impostos** (`TdtmBasico.CalcularImpostos_`, `dmbasico.pas`, ~6.122 linhas, tickets 07/13-19) — um único motor fiscal compartilhado (ICMS, ICMS-ST, IPI, PIS/COFINS, Simples/CSOSN, rateio+compostos), parametrizado por `OrigemCalculo`/`saida`. Pedidos exercita só 4 das 6 fases do corpo (preparação, rateio+laço principal, 2 ajustes finos de ICMS-ST) — quadro `Calculos` e bloco Serviços/ISS existem no motor mas não são exercitados por Pedidos.
- **Formação de Preço de Venda** (ticket 08) — Pedido delega inteiramente ao motor de custo (ticket 06); a tela `AcionarTelaFormacaoPrecoVenda` é confirmada **100% read-only** (~20 campos), compartilhada por outros módulos via parâmetro `Origem`.
- **Grade matriz** (ticket 09) e **cópia ligada à grade** (ticket 10) — mecânica de staging (`qryCopiaProdutosPedidos`) como "área de rascunho": nada grava no pedido real até fechar a grade com sucesso.
- **Documentos a Pagar** (ticket 11) — 1:1 com o Pedido, parcelas sempre espelho das Previsões, recriadas do zero a cada gravação, removidas por completo ao cancelar/excluir.
- **Envio de Pedido** (ticket 12) — e-mail manual, disparo explícito pelo usuário, nunca automático.

### 2. Divergências internas do Delphi mantidas por decisão (replicar como estão, não unificar)

- **Bases oficial vs. custo em paralelo** (tickets 13-14): `percentualreducaobase` vs. `percentualreducaobase_custo`; e, no ICMS-ST, o trio completo `icmsbasecalculost`/`aliquotaicmsst`/`IcmsValorST` com sua contraparte `_custo` — dois conjuntos de campos calculados lado a lado para propósitos distintos (imposto declarado vs. apuração de custo do produto). Replicar os dois pares.
- **`ExcluirICMSdePISeCOFINS` configurado por filial**, não por `ParSistema` (ticket 16) — quebra o padrão predominante de configuração global, mas é intencional (granularidade por filial).
- **`CondicaoCSOSN` usa o regime do fornecedor, não da filial própria** (ticket 17) — parece invertido à primeira vista, mas é o comportamento correto para uma compra (o que importa é o que o fornecedor vai declarar).

### 3. Possíveis bugs legados — decisão de não replicar

**Bugs de fato (corrigir no Laravel):**
- Situação "Concluído" reaproveita o código `'A'` de Aberto no cabeçalho (ticket 03) — usar um código de situação próprio para concluído.
- Fórmula de total de IPI na grade não multiplica por quantidade (ticket 09) — usar versão corrigida, simétrica à do desconto.

**Código morto no Delphi (não replicar, não é lógica ativa):**
- `CalcularAcrescimoDesconto` — cascata de desconto/acréscimo %, inteiramente comentada (ticket 11).
- `CalcularPrecoSugestao`/`CalcularPrecoSugestaoProdutos` — interface comentada, órfã; o caminho real é `CalcularCusto`/`CalcularPrecoVenda` (ticket 08, resolve a divergência aberta no ticket 06).
- `IcmsValorCalculadoSimples` (ticket 13) e `FatorSubstituicao` (ticket 14) — comentados.
- Versões antigas/simplificadas de `AliquotaICMS` e `AliquotaICMSST`, sem os parâmetros de contribuinte/consumidor final (tickets 13-14) — superadas, não usar como referência.
- `ParSistema.UsaitecLUX` — parâmetro com bloco de código comentado, tanto no cabeçalho (ticket 02) quanto no ramo alternativo de Envio de Pedido (ticket 12).

### 4. Dúvidas em aberto para a implementação confirmar

- **Direção dos botões "Gerar Total IPI"/"Gerar Total PIS"/"Gerar Total COFINS"** e **"Ratear Valor Total Produtos"/"Ratear Valor Total Frete"** (tickets 15, 16, 19) — handlers de UI em `fmcadastroprodutospedidos_.pas` não localizados nos arquivos-núcleo lidos; inferência (não confirmada) é que reforçam o cálculo padrão base×alíquota→valor por cima de um valor digitado.
- **Persistência/regras do campo "observações" do cabeçalho** — citado na pergunta original do ticket 03 (junto de fornecedor/filiais/transporte) mas não detalhado explicitamente na resposta; confirmar se é só texto livre ou se há alguma regra adicional.
- **Relevância de negócio da Importação Daico** (ticket 12) — o parser do arquivo-fonte não foi localizado nos arquivos-núcleo; confirmar com o negócio se algum fornecedor ainda usa esse formato antes de especificar. Se confirmada a necessidade, vira ticket próprio.
- **Se Manutenção de Preços (Laravel) já expõe uma visualização equivalente à Formação de Preço de Venda read-only** (ticket 08) — não investigado a fundo; verificar antes de implementar, para não duplicar.
- **Se já existe módulo de Contas a Pagar no Laravel** para reaproveitar o lado de escrita de Documentos a Pagar (ticket 11) — não confirmado.

### 5. Fora de escopo (confirmado/corrigido durante a investigação)

- **DIFAL** (ticket 18) — confirmado **estruturalmente inalcançável** para Pedidos: `Condicao_ICMSUFDest` tem `saida` como primeiro termo de uma cadeia `and`, e Pedidos é sempre entrada. Não é "não observado em uso", é código morto na prática para este módulo.
- **`SelecionarProdutosPedidoCopiar`/`AlterarPrecoProdutosPedidoCopiar`/`HaProdutoContratoCopiarSelecionado`** (ticket 10) — **correção ao inventário do ticket 01**: pertencem exclusivamente ao satélite autônomo `fmcopiarprodutospedidos` (mecanismo de "repetir pedido anterior"), não à grade. Mecanismo totalmente distinto (infraestrutura `dsrPedidosCopia`/`dsrProdutosPedidosCopia` própria), movido formalmente para a exclusão já existente do satélite no mapa.
- **Ramo `BaseDupla` do ICMS-ST** e **`AtribuirValoresRetidosST`** (ticket 14) — existem no motor compartilhado, mas `BaseDupla` só se aplica a saída e `AtribuirValoresRetidosST` só a devolução de compra via Nota Avulsa; nenhum dos dois é exercitado por Pedidos. Documentar a existência, não especificar em profundidade.
- **Fases "quadro `Calculos`" e "bloco de Serviços/ISS"** do motor de impostos (ticket 07) — existem no motor compartilhado, mas Pedidos passa `nil`/não tem itens de serviço; relevantes a um futuro mapa de Notas Fiscais/NF-e, não a este.
- Cancelamento de Pedidos, Consulta/Listagem de Pedidos, Cópia de Produtos autônoma, e a própria emissão de NF-e — já registrados na seção "Out of scope" do mapa desde o início; nenhuma mudança.

### Decisão

Classificação consolidada acima. Nenhum achado novo — é a fusão dos 19 tickets de investigação (01-19) num único quadro de referência para os tickets de síntese seguintes (21: critérios de aceite; 22: prompts SpecKit).
