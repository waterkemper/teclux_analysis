# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para o motor comercial compartilhado e as abas Produtos e Serviços do Cadastro de Contratos — Etapa 2 (Edição comercial), segundo dos três specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`) e sobre o spec de Cliente (`02-speckit-prompt.md`).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo, incluindo a matriz dourada de casos numéricos — trate-a como contrato de aceitação, não como sugestão. Inspecione somente o checkout Laravel para confirmar o estado atual; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- um **motor comercial compartilhável por Orçamento e Contrato**, com intenção explícita de linha (`incluir`/`substituir`/`incrementar`), aritmética decimal (nunca `float` como contrato público), ordem canônica de cálculo, exclusão de brindes da base de rateio, e rateio por identidade de linha (`lineId`), nunca por posição de array;
- a aba **Produtos** do Contrato: editor reutilizado, exclusão com renumeração e recálculo, reordenação com `lineSequence` explícito, marcação de brinde em lote, integração com Conferência e Fotos já existentes;
- a aba **Serviços** do Contrato: editor comercial neutro (quantidade, valor, ISSQN/retenção estimados), sem escrituração fiscal definitiva;
- a implementação concreta da porta `ClienteTransitionRecalculoComercialPort` deixada em aberto pelo spec de Cliente (`02-speckit-prompt.md`) para o caso "recalcular produtos/serviços/totais" — isso é o que desbloqueia, em implementação futura, a troca de Cliente num Contrato já populado (a decisão de reabrir essa restrição pertence à implementação, não a este prompt).

Não inclua: estoque/reserva/disponibilidade/troca de filial emitente, séries/lotes e seus efeitos, IPI/ST/retenções fiscais definitivas e escrituração, cópia/importação de produtos de **outro** Contrato (isso é conveniência separada e posterior — Etapa 8 —, ainda que o ticket original de delimitação a tenha listado como operação de Produtos; a ordem final consolidada a move para depois, dependente deste editor), desmembramento de Contrato, Planos/Parcelas e o motor de financiamento (spec 4, que consome a assinatura comercial produzida aqui), e qualquer regra fiscal pós-`F`.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo a matriz dourada numérica, já foram extraídas e validadas no workspace de análise a partir de `fmcadastroprodutoscontrato.pas/.dfm`, `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`, comparadas linha a linha com os calculators Laravel existentes.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código/schema Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual dos calculators e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Services\Vendas\Orcamentos\{OrcamentoTotaisCalculator,OrcamentoRateioDescontoCalculator,OrcamentoDescontoGlobalService,OrcamentoDescontoItemSync,OrcamentoCupomAplicacaoService,OrcamentoProdutoInclusaoService,OrcamentoProdutoPrecoAlteracaoDefense}` — base real a generalizar; **hoje operam em `float`, arrays posicionais e sem exclusão explícita de brinde da base** (confirme se isso mudou desde a extração da evidência abaixo).
- `CadastroItemVendaProdutoModal.tsx` (compartilhado) e seu wrapper `Pages/Vendas/Orcamentos/components/CadastroItemOrcamentoModal.tsx` — base do editor reutilizável de Produtos.
- `Pages/Vendas/Orcamentos/components/{CadastroServicoOrcamentoModal.tsx,ServicosGrid.tsx}` — base do editor de Serviços.
- `Components/erp/cadastro/CadastroConferenciaDialog.tsx` e `hooks/useCadastroConferenciaGate.ts` — infraestrutura de Conferência a reutilizar tal como está.
- `Components/product/{ProductPhotoThumbCell,ProductPhotoGalleryModal}.tsx` e `hooks/useProductPhotos.ts` — infraestrutura de Fotos a reutilizar tal como está.
- `Components/erp/vendas/{ConsultaContratosDetalheProdutosGrid,ConsultaContratosDetalheServicosGrid}.tsx` e `Support/ErpGrid/Catalogs/ConsultaContratosDetalheProdutosGridCatalog.php` — catálogos/colunas já usados pela Consulta de Contratos; compartilhe-os, não crie um segundo catálogo divergente.
- O spec da Fundação (`01-speckit-prompt.md`) — protocolo de seção, revision, cascata única de F8.
- O spec de Cliente (`02-speckit-prompt.md`) — o contrato da porta `ClienteTransitionRecalculoComercialPort` que este motor deve satisfazer.

## Evidência Delphi confirmada

### Fronteira do agregado comercial

- Produtos e Serviços pertencem ao rascunho do Contrato; mutações comerciais só em `O/R` — `F/C` são leitura (`fmcadastrocontratos.pas:2017-2072`; `dmcadastrocontratos.pas:4018-4026`).
- Um item de Produto preserva identidade do produto e filial, sequência, quantidade, preço de tabela, preço de venda, desconto do item, desconto geral rateado, cashback rateado, brinde, vendedor e flags comerciais de entrega/montagem. Estoque, lote/série e fiscais podem ser projetados no grid, mas não são propriedade do editor comercial.
- Serviço é coleção distinta, habilitada por `ContratoComServico`, com serviço, quantidade, valor, equipamento/complemento e dados para estimativa de ISSQN/retenção — nunca fundido com Produto numa tabela única.

### Operações de Produtos

- Delphi oferece incluir, editar (duplo clique/atalho), excluir com confirmação, marcar brinde, reordenar, conferir, trocar filial de estoque e ver foto (`fmcadastrocontratos.dfm:5715-6542`; PAS `:1416-1540,3161-3252,3855-3992,4102-4183`).
- Excluir remove, refaz numeração e recalcula dados dependentes (`dmcadastrocontratos.pas:5979-6005`; `fmcadastrocontratos.pas:3161-3169`); cancelamento/devolução de quantidade já faturada **não** é "exclusão de item" — pertence às fatias de estoque/faturamento/cancelamento.
- Reordenação persiste sequência explícita porque ela afeta apresentação, impressão e o resíduo do rateio; mover acima/abaixo não altera identidade, preço ou quantidade.
- Chave funcional de coincidência do produto no editor legado é `(produto, filial)`; alterar uma linha conserva sua identidade operacional `numero` (`dmcadastrocontratos.dfm:729-731`; `dmcadastrocontratos.pas:17875-17890`).

### Quantidade, preço, descontos e brindes

- Total bruto de Produtos = soma de `quantidade × precovenda` só para itens não-brinde, menos desconto por item; brindes acumulados separadamente (`dmcadastrocontratos.pas:3764-3839`).
- Brinde é atributo do item, permitido só em `O/R` e quando `PermitirAlterarBrindenoContrato` está ativo; não compõe o total cobrado, mas mantém valor de referência; marcar/desmarcar em lote usa o mesmo comando e um único recálculo (`dmcadastrocontratos.pas:15790-15827`).
- Preço de tabela é referência imutável; preço de venda e desconto são entradas autorizáveis — a gravação revalida no servidor preço vigente, promoção e prova sensível (Laravel já tem `OrcamentoProdutoPrecoAlteracaoDefense` com perfis `alterarprecocontrato`/`gerentevendas`).
- Desconto geral pertence ao cabeçalho, é rateado proporcionalmente entre produtos cobrados (resíduo no último item elegível em sequência estável); brindes não recebem base de rateio; cashback/cupom usam rateios próprios (`dmcadastrocontratos.pas:18745-18820`); desconto acima da alçada usa `PercentualDescontoFrenteCaixa` + segunda credencial (`:19787-19870`).

### Serviços e retenções

- Serviço admite inclusão/edição em modal, exclusão confirmada e marcação de retenção; grid com quantidade, valor, ISSQN, retenção, UF e cidade (`fmcadastrocontratos.pas:1543-1558,2078-2095,3173-3180`; DFM `:7728-7928`).
- Cálculo por soma de `quantidade × valorservico`; ISSQN somado só nos registros marcados para retenção (`dmcadastrocontratos.pas:3939-3990`); escrituração fiscal e incidências definitivas pertencem à fatia fiscal.

### Motor de cálculo — ordem canônica

1. Validar quantidade/preço e resolver desconto do item.
2. Calcular a base da linha: `trunc2(quantidade × preço − descontoItem)`.
3. Recalcular subtotal e total dos produtos não-brinde.
4. Ratear desconto geral e cashback só entre linhas comerciais elegíveis, na ordem canônica `numero`/`lineSequence`.
5. Revalidar e ratear o cupom só entre suas linhas elegíveis, sobre a base já reduzida por desconto do item, geral **e cashback**.
6. Somar serviços separadamente (nunca participam dos rateios de desconto de produto).
7. Compor o total líquido e invalidar a assinatura de Planos/Parcelas quando qualquer componente comercial mudar.

Todo o cálculo usa decimais, nunca `float` binário como contrato público; dinheiro é truncado em cada fronteira indicada e serializado com duas casas.

### Matriz dourada de Produtos e Serviços (contrato de aceitação — não reabrir sem novos fixtures)

| Caso | Entrada | Saída obrigatória |
|---|---|---|
| produto simples | `q=2`, `preço=50,00`, `descItem=5,00` | base/total da linha `95,00`; subtotal bruto `100,00`; desconto de item agregado `5,00` |
| quantidade fracionária | `q=0,333`, `preço=100,00`, sem desconto | linha `33,30`; quantidade permanece `0,333` |
| desconto percentual do item | base `1.584,50`, percentual `10%` | desconto `158,45`; linha líquida `1.426,05` |
| desconto em reais | base `100,67`, desconto digitado `15,00` | preservar `15,00`; percentual informativo `14,90%`; não recalcular os reais pelo percentual derivado |
| desconto acima da linha | base `100,00`, desconto `100,01` | rejeitar antes de totalizar |
| dois serviços | `2 × 75,00` e `3 × 10,00` | totais `150,00` e `30,00`; agregado `180,00`; nenhum rateio de desconto de produto |
| desconto geral exato | bases `[60,00; 40,00]`, desconto `10,00` | rateios `[6,00; 4,00]`; soma `10,00` |
| resíduo | bases em sequência `[33,33; 33,33; 33,34]`, desconto `10,00` | `[3,33; 3,33; 3,34]`; última linha canônica recebe o resíduo |
| cashback | mesmas bases e cashback `1,00` | `[0,33; 0,33; 0,34]`; campo distinto do desconto geral, mesma política de resíduo |
| cupom percentual | duas linhas elegíveis de `100,00`, cupom `10%` | `[10,00; 10,00]`; cabeçalho `20,00` |
| cupom percentual com fração | linha elegível líquida `33,33`, cupom `10%` | `3,33`, por truncamento, não `3,34` |
| cupom fixo seletivo | bases elegíveis `[60,00; 40,00]`, terceira linha não elegível, cupom `10,00` | `[6,00; 4,00; 0,00]`; resíduo só no último elegível |
| brinde misto | normal `2 × 50,00`; brinde `1 × 30,00`; desconto geral `10,00` | subtotal/total comercial antes do desconto `100,00`; brinde informado separadamente `30,00`; todo desconto fica na linha normal; brinde recebe zero |
| somente brindes | brindes `1 × 30,00` e `2 × 10,00` | total e quantidade comercial zero; total informativo de brindes `50,00`; Planos/Parcelas precisam ser revistos, sem fabricar venda negativa |
| excluir última linha normal | normal `49,00`, desconto geral anterior `50,00`, depois exclusão | descontos geral/cashback/cupom recalculados/zerados conforme elegibilidade; total líquido não pode ficar `-1,00` |

### Divergências confirmadas contra o Laravel atual (a corrigir no motor compartilhado)

- `OrcamentoTotaisCalculator` trunca; Delphi arredonda `vProduto` com `RoundTo` antes do total (`dmcadastrocontratos.pas:3830-3844`) — os casos dourados acima já fixam o comportamento correto por caso; não presumir equivalência numérica fora deles.
- `OrcamentoCupomAplicacaoService::aplicarPercentual` usa `round`; Delphi usa `Truncar` — caso `33,33 × 10%` fixa `3,33` como paridade correta.
- A base do cupom no Laravel atual (`totalItemLiquidoDescontoGeral`) desconta só o rateio geral, não o cashback; Delphi desconta ambos — o motor compartilhado usa `base − descontoGeralLinha − cashbackLinha`.
- O cupom Delphi localiza só por `produto`, ambíguo com múltiplas filiais do mesmo produto; o novo motor aplica elegibilidade a `lineId`/`(produto,filial)`, nunca só ao código do produto.
- `OrcamentoRateioDescontoCalculator::ratear` opera hoje sobre `list<float>` posicional, sem ordenar internamente por sequência nem devolver por `lineId` — o motor compartilhado deve ordenar explicitamente por `lineSequence` e devolver rateios associados a `lineId`.
- `CalcularRateioDescontoProdutos` do Delphi (`POSSÍVEL BUG LEGADO`) percorre todas as linhas sem excluir brindes explicitamente, embora o denominador as exclua — **não reproduzir**; o motor novo exclui brinde da base de desconto geral/cashback/cupom/financiamento de forma explícita.
- Hoje a decisão "incluir vs. incrementar" ao adicionar um produto já existente vive implicitamente no frontend (upsert por `numero` em `Cadastro.tsx`), não como intenção explícita de backend — o motor compartilhado deve receber a intenção explícita (`incluir`/`substituir`/`incrementar`) do chamador, nunca inferi-la de um erro de duplicidade.

## Estado Laravel confirmado

- Calculators de Orçamento (`OrcamentoTotaisCalculator`, `OrcamentoRateioDescontoCalculator`, `OrcamentoDescontoGlobalService`, `OrcamentoDescontoItemSync`, `OrcamentoCupomAplicacaoService`, `OrcamentoProdutoInclusaoService`) são boa base reutilizável, mas nomeados/acoplados a Orçamento, usam `float`, arrays posicionais, e não modelam intenção de linha nem excluem brinde explicitamente da base — confirme se algo mudou desde a extração desta evidência.
- Editor de Produto (`CadastroItemVendaProdutoModal`/`CadastroItemOrcamentoModal`) e de Serviço (`CadastroServicoOrcamentoModal`/`ServicosGrid`) já existem e são a base visual/contratual a estender, não recriar.
- Conferência (`CadastroConferenciaDialog`/`useCadastroConferenciaGate`) e Fotos (`ProductPhotoThumbCell`/`ProductPhotoGalleryModal`/`useProductPhotos`) já são infraestrutura pronta, usada em `Orcamentos/Cadastro.tsx`.
- `ConsultaContratosDetalheProdutosGrid`/`ConsultaContratosDetalheServicosGrid` já projetam itens em leitura para a Consulta de Contratos — compartilhe catálogos/colunas básicas com o novo editor, sem transformar o detalhe da Consulta num segundo editor.
- NÃO LOCALIZADO: editor Laravel de Serviços que já cubra equipamento, CFPS, município e retenções no nível exigido pelo Contrato — há só a base do Orçamento e a projeção de leitura da Consulta.
- NÃO LOCALIZADO: qualquer motor comercial já desacoplado de Orçamento, com intenção de linha explícita e rateio por `lineId` — precisa ser extraído/generalizado, não descoberto pronto.

## Decisões obrigatórias

1. Criar um motor comercial compartilhável por Orçamento e Contrato, o mais puro possível, com políticas/adaptadores por tipo de documento; o backend é autoridade — cálculo no navegador é só resposta imediata, sempre reconciliado na validação/F8.
2. O motor recebe intenção explícita por linha: `incluir` (rejeita `(documento, produto, filial)` já existente), `substituir` (exige `lineId`, troca os dados da linha) ou `incrementar` (exige `lineId` ou resolve exatamente uma linha por `(produto, filial)` e soma o delta). Nenhum endpoint infere incremento a partir de um erro de chave duplicada.
3. Serviços usam identidade própria de linha; repetir o mesmo código de serviço não é fundido automaticamente (complemento/equipamento/vínculo podem distinguir ocorrências).
4. A ordem canônica de cálculo (7 passos acima) é fixa e sempre reexecutada por inteiro quando qualquer linha, quantidade, preço, desconto ou ordem mudar — nunca um recálculo incremental parcial que possa divergir da ordem canônica.
5. Todo valor monetário do contrato público do motor é decimal (string/decimal, nunca `float`); truncamento em cada fronteira já especificada nos casos dourados; quantidade respeita a escala parametrizada.
6. Brinde é atributo explícito do item, permitido só em `O/R` e sob `PermitirAlterarBrindenoContrato`; tem preço de referência e total informativo, mas base comercial **zero** para desconto geral, cashback, cupom e financiamento — marcar/desmarcar (individual ou em lote) sempre recalcula tudo por inteiro.
7. Desconto geral e cashback são rateios independentes, mesma base (`total de produtos não-brinde`) e mesma política de resíduo (proporcional truncado, resíduo na última linha elegível pela ordem canônica `lineSequence`); cupom rateia sobre a base já líquida de item + geral + cashback, com elegibilidade por `lineId`/`(produto,filial)`, nunca só pelo código do produto.
8. `lineSequence` é entrada determinística do rateio e é persistida explicitamente; reordenar deliberadamente recalcula e pode mover o resíduo; mudar só a ordenação visual do grid não altera `lineSequence` nem valores persistidos.
9. Excluir um item em `O/R` remove do rascunho após confirmação, renumera sequência, dispara a cascata de recálculo completa (passos 1-7) e marca a assinatura comercial como alterada — o que invalida Planos/Parcelas vigentes (consumido pelo spec 4).
10. Preço de tabela é referência imutável; preço de venda/desconto de item são autorizáveis e sempre revalidados no servidor (reuso de `OrcamentoProdutoPrecoAlteracaoDefense`, generalizado); UI habilitada nunca concede autorização por si só.
11. A saída mínima do motor: subtotal/total de produtos, quantidade total, desconto de itens agregado, valor de brindes, total de serviços, ISSQN/retenções estimadas, desconto geral/cupom/cashback rateados (por `lineId`), total líquido comercial, avisos, e uma **assinatura comercial** que muda sempre que qualquer componente muda — usada para invalidar Planos/Parcelas.
12. Este motor implementa a porta `ClienteTransitionRecalculoComercialPort` (definida no spec de Cliente, `02-speckit-prompt.md`) para o caso "recalcular produtos/serviços/totais" a partir de um novo contexto de Cliente — sem essa peça, a troca de Cliente em Contrato populado continua bloqueada como especificado lá.
13. Conferência e Fotos são reutilizadas tal como já existem (infra pronta); a obrigatoriedade/efeito da Conferência na transição de situação não é definida aqui, pertence à fatia de Estoque.
14. Cópia/importação de produtos de outro Contrato **não** entra nesta entrega — é comando separado e posterior (Etapa 8), dependente deste editor.

## Seções "Produtos" e "Serviços" dentro do seam do núcleo

- Ambas seguem o protocolo de seção da Fundação: carregam sob demanda, participam do payload sujo do F8 só quando alteradas, têm namespace de validação próprio (`produtos[i].*`, `servicos[i].*`), e sua concorrência é coberta pela `revision` geral do Contrato.
- A aba Produtos reutiliza `CadastroItemVendaProdutoModal` como editor de linha (intents `incluir`/`substituir`/`incrementar` do motor), grid derivado de `ConsultaContratosDetalheProdutosGridCatalog`, `CadastroConferenciaDialog`/`useCadastroConferenciaGate` para conferência e `ProductPhotoThumbCell`/`ProductPhotoGalleryModal`/`useProductPhotos` para fotos.
- A aba Serviços reutiliza `CadastroServicoOrcamentoModal`/`ServicosGrid` como base, adaptando equipamento/CFPS/retenção como capabilities do contexto Contrato — sem inventar um segundo motor de cálculo para Serviços fora do compartilhado.
- F8 ordinário persiste as duas seções junto do restante do rascunho; nenhuma delas grava isoladamente fora do seam autoritativo.

## Autorizações e parâmetros

- Reaproveite a matriz de autorizações/parâmetros já fixada na Fundação; este spec só acrescenta os parâmetros próprios do motor: `ContratoComServico` (habilita a aba Serviços), `PermitirAlterarBrindenoContrato`, `PercentualDescontoFrenteCaixa` (teto + segunda credencial acima da alçada) e os perfis de defesa de preço já existentes (`alterarprecocontrato`/`gerentevendas`).
- Autorização de desconto acima da alçada e de alteração de preço reusa a infraestrutura de prova sensível já fixada na Fundação — não crie um novo mecanismo de senha.

## Testes obrigatórios

1. Toda a matriz dourada acima como testes parametrizados do motor (unit), incluindo os casos de brinde, resíduo e cupom fracionário — tratá-los como regressão obrigatória, não como sugestão.
2. Intenção explícita: `incluir` rejeita duplicidade `(documento,produto,filial)`; `substituir` exige `lineId` e não cria linha nova; `incrementar` soma delta na linha resolvida por `lineId` ou `(produto,filial)`; nenhuma rota infere incremento a partir de erro 409/duplicidade.
3. Exclusão de item: renumera sequência, recalcula tudo (matriz dourada "excluir última linha normal"), marca assinatura comercial alterada.
4. Reordenação: mudar só a visualização não persiste `lineSequence` nem recalcula; reordenar deliberadamente move o resíduo conforme a nova sequência.
5. Brinde: marcar/desmarcar individual e em lote recalcula tudo; brinde nunca entra na base de desconto geral/cashback/cupom; Contrato só com brindes zera total/quantidade comercial sem venda negativa.
6. Preço/desconto: defesa de preço rejeita alteração sem perfil/prova; payload manipulado no navegador não é aceito sem revalidação server-side.
7. Serviços: cálculo independente dos rateios de Produto; retenção agregada só nos itens marcados.
8. Assinatura comercial muda em qualquer alteração relevante e é consumida (stub, sem detalhar Planos) para sinalizar invalidação — cobertura de que a mesma entrada sempre produz a mesma assinatura.
9. Implementação da porta do spec de Cliente: dado um contexto de Cliente novo, o motor recalcula produtos/totais corretamente quando o Contrato já tem itens (fechando o caso que o spec 02 deixou bloqueado).
10. Conferência/Fotos: comportamento herdado sem alteração (regressão), incluindo a regra de só abrir Conferência para itens persistidos sem mudança pendente.

Prefira testes unitários table-driven para o motor (puro, sem I/O) e Feature tests no seam de aplicação real para inclusão/edição/exclusão/reordenação end-to-end, reutilizando fixtures/casos dourados já compartilháveis com Orçamento quando a regra for comum.

## Entregáveis

- Contrato público do motor comercial compartilhado (entrada/saída, intenção de linha, assinatura comercial).
- Matriz de evidência Delphi × Laravel para produtos/serviços/motor, incluindo as divergências já confirmadas e como corrigi-las.
- Contrato das seções "Produtos" e "Serviços" dentro do protocolo de seção da Fundação.
- Implementação da porta de recálculo comercial exigida pelo spec de Cliente.
- Critérios de aceitação e testes, incluindo a matriz dourada como suíte obrigatória.
- Riscos, dúvidas (duplicidade com `GravarProdutoContratoAutomaticamente` ativo, resíduo pós-reordenação) e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- estoque, reserva, disponibilidade, troca de filial emitente, séries e lotes;
- IPI, ST, retenções fiscais definitivas e escrituração;
- copiar/importar produtos de outro Contrato (Etapa 8, spec separado e posterior);
- desmembrar Contrato;
- Planos, Parcelas e o motor de financiamento (spec 4) — este spec só produz a assinatura/totais que eles consomem;
- qualquer regra fiscal ou de venda futura posterior a `F`;
- redesenhar Conferência, Fotos, ou os catálogos de grid da Consulta de Contratos;
- alterar o schema Delphi.
```
