Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Quais comportamentos de produtos e serviços pertencem ao Cadastro de Contratos e quais são serviços reutilizáveis: inclusão, edição, exclusão, ordenação, cópia, quantidades, preços, descontos, brindes, séries, impostos, conferência, fotos e recálculo de totais?

Produzir limites e dependências, não uma especificação de implementação; confrontar componentes equivalentes já criados para Orçamentos.

## Answer

### Fronteira do agregado comercial

- `CONFIRMADO` — Produtos e Serviços pertencem ao rascunho do Contrato e participam da gravação atômica definida no núcleo. No Delphi, inclusão/edição de produto só ocorre antes de `F` e quando não está somente leitura (`fmcadastrocontratos.pas:2017-2072`); o estado geral torna o contrato somente leitura depois de `R` (`dmcadastrocontratos.pas:4018-4026`). Para o recorte Laravel já decidido, mutações comerciais ficam em `O/R`; `F/C` são leitura.
- `DECISÃO NOVA` — Um item comercial de Produto preserva identidade do produto e filial, sequência, quantidade, preço de tabela, preço de venda, desconto do item, desconto geral rateado, cashback rateado, brinde, vendedor e flags comerciais de entrega/montagem. Campos de estoque, lote/série e fiscais podem ser projetados no grid, mas não são propriedade do editor comercial.
- `DECISÃO NOVA` — Serviço é coleção distinta, habilitada por `ContratoComServico`, com serviço, quantidade, valor, equipamento/complemento e dados necessários à estimativa de ISSQN/retenção. Não transformar Produto e Serviço em uma única tabela ou tipo artificial.
- `CONFIRMADO` — O DFM materializa coleções distintas: Produto com comandos e grid nas linhas 5703-7474; Serviço com inclusão, exclusão, CFPS, grid e retenções nas linhas 7487-7928.

### Operações de Produtos

- `CONFIRMADO` — O Delphi oferece copiar de outro contrato, incluir, editar por duplo clique/atalho, excluir com confirmação, marcar brinde, reordenar, importar DAICO, conferir, trocar filial de estoque e visualizar foto (`fmcadastrocontratos.dfm:5715-6542`; PAS `:1416-1540,3161-3252,3855-3992,4102-4183`).
- `DECISÃO NOVA` — Inclusão e edição usarão um editor reutilizável derivado de `CadastroItemOrcamentoModal`, com os intents já existentes `insert`, `replace` e `increment`, busca de produto, quantidade efetiva e defesa server-side de preço/desconto. O Contrato fornece contexto, capabilities e adaptador de persistência; não duplica a lógica do Orçamento.
- `DECISÃO NOVA` — Excluir em `O/R` remove o item do rascunho após confirmação, renumera a sequência, recalcula toda a composição comercial e marca pagamentos como desatualizados. Cancelamento/devolução de quantidade já faturada não é “exclusão de item” e pertence às fatias de estoque/faturamento/cancelamento.
- `CONFIRMADO` — O Delphi exclui, refaz numeração e recalcula dados dependentes (`dmcadastrocontratos.pas:5979-6005`; `fmcadastrocontratos.pas:3161-3169`).
- `DECISÃO NOVA` — Reordenação é comportamento do Contrato porque a sequência afeta apresentação, impressão e rateio residual. Persistir sequência explícita; mover acima/abaixo não altera identidade, preço ou quantidade.
- `DECISÃO NOVA` — Copiar produtos de outro contrato será comando do Cadastro, disponível em `O/R`. A seleção da origem e dos itens é específica do Contrato, mas cada item copiado passa pelo mesmo serviço de inclusão, preço vigente, autorização, duplicidade e recálculo; não copiar cegamente campos fiscais, estoque, lote/série, cancelamento ou nota.
- `CONFIRMADO` — O Delphi abre seletor de contrato, permite cópia conforme permissão de preço e recalcula o total ao concluir (`fmcadastrocontratos.pas:3891-3915`; `dmcadastrocontratos.pas:15966`).
- `DECISÃO NOVA` — Importações específicas como DAICO não entram no primeiro spec do Cadastro. Só serão migradas mediante demanda e ticket próprio; não são requisito transversal do editor reutilizável.

### Quantidade, preço, descontos e brindes

- `CONFIRMADO` — O total bruto de produtos Delphi soma `quantidade × precovenda` apenas para itens não brindes; subtrai descontos por item; brindes são acumulados separadamente (`dmcadastrocontratos.pas:3764-3839`).
- `DECISÃO NOVA` — Brinde continua sendo atributo explícito do item, permitido somente em `O/R` e quando `PermitirAlterarBrindenoContrato` estiver ativo. Item brinde não compõe o total cobrado, mas seu valor de referência permanece disponível. Marcar todos/desmarcar todos usa o mesmo comando em lote e um único recálculo.
- `CONFIRMADO` — O Delphi aplica essa guarda e recalcula após marcação individual ou em lote (`dmcadastrocontratos.pas:15790-15827`).
- `DECISÃO NOVA` — Preço de tabela é referência imutável da resolução de preço; preço de venda e desconto são entradas autorizáveis. A gravação revalida no servidor preço vigente, promoção e prova sensível; UI habilitada não concede autorização.
- `CONFIRMADO` — O Laravel já possui `OrcamentoProdutoPrecoAlteracaoDefense` com perfis `alterarprecocontrato`/`gerentevendas` e prova consumida na gravação; o modal de item já recebe permissões e parâmetros de inclusão.
- `DECISÃO NOVA` — Desconto geral pertence ao cabeçalho comercial, é rateado proporcionalmente entre produtos cobrados e atribui o resíduo de arredondamento ao último item elegível em sequência estável. Brindes não recebem base de rateio. Cashback/cupom usam rateios próprios, sem serem fundidos ao desconto do item.
- `CONFIRMADO` — O Delphi ordena por número, rateia e põe o resíduo no último registro (`dmcadastrocontratos.pas:18745-18820`); autorização de desconto excedente usa `PercentualDescontoFrenteCaixa`, percentual já autorizado e segunda credencial (`:19787-19870`).

### Serviços e retenções

- `CONFIRMADO` — Serviço admite inclusão/edição em modal, exclusão confirmada e marcação de retenção; o grid contém quantidade, valor, ISSQN, retenção, UF e cidade (`fmcadastrocontratos.pas:1543-1558,2078-2095,3173-3180`; DFM `:7728-7928`).
- `DECISÃO NOVA` — Reaproveitar `CadastroServicoOrcamentoModal` e `ServicosGrid` como base visual/contratual, extraindo um editor de serviço comercial neutro. Regras de equipamento, CFPS, município e retenção serão adaptadores/capabilities do contexto Contrato.
- `CONFIRMADO` — O Delphi calcula Serviços por soma de `quantidade × valorservico` e soma ISSQN somente nos registros marcados para retenção (`dmcadastrocontratos.pas:3939-3990`).
- `DECISÃO NOVA` — O cálculo comercial fornece estimativa e total de Serviços; escrituração, documento fiscal de serviço e incidências definitivas pertencem à fatia fiscal. A fatia de Pagamentos consome o total líquido e retenções, sem possuir o editor de Serviços.

### Motor de cálculo e dependências

- `DECISÃO NOVA` — Criar um motor comercial compartilhável por Orçamento e Contrato, puro quanto possível, com políticas/adaptadores por documento. O backend é autoridade; cálculos no navegador são apenas resposta imediata e devem ser reconciliados na validação/F8.
- `DECISÃO NOVA` — Saída mínima do recálculo: subtotal e total de Produtos, quantidade total, desconto de itens, valor de brindes, total de Serviços, ISSQN/retenções estimadas, desconto geral/cupom/cashback rateados e total líquido comercial. Também retorna razões que tornam Pagamentos obsoletos.
- `CONFIRMADO` — O Laravel já contém `OrcamentoTotaisCalculator`, `OrcamentoRateioDescontoCalculator`, `OrcamentoDescontoGlobalService`, sincronizadores/teto de desconto e recálculo de planos. Eles devem ser generalizados por contratos de entrada/saída, não chamados pelo Cadastro sob nomes de Orçamento.
- `DIVERGENTE` — `OrcamentoTotaisCalculator` trunca valores, enquanto o Delphi arredonda `vProduto` com `RoundTo` antes do total (`dmcadastrocontratos.pas:3830-3844`). Antes do spec deve haver casos dourados com dados reais para fixar arredondamento por item, agregado e rateio; não presumir equivalência numérica.
- `DECISÃO NOVA` — Toda inclusão, edição, exclusão, cópia, reordenação que altere resíduo, brinde ou desconto dispara uma única cascata: normalizar itens → recalcular itens/totais/rateios → revalidar desconto → marcar planos/parcelas obsoletos. Não salvar automaticamente cada item; F8 continua atômico.

### Capacidades reutilizáveis já existentes

- `CONFIRMADO` — Conferência deve reutilizar `CadastroConferenciaDialog` e `useCadastroConferenciaGate`. Só é aberta para itens persistidos sem mudança pendente de inclusão/exclusão/quantidade, padrão já aplicado em `Orcamentos/Cadastro.tsx:2457-2465`.
- `CONFIRMADO` — Fotos devem reutilizar `ProductPhotoThumbCell`, `ProductPhotoGalleryModal`, `useProductPhotos` e sequência navegável. A foto na coluna abre o modal para o produto selecionado; o antigo botão lateral Delphi (`fmcadastrocontratos.pas:4179-4183`) não será reproduzido.
- `CONFIRMADO` — `ConsultaContratosDetalheProdutosGrid` e `ConsultaContratosDetalheServicosGrid` já projetam itens em leitura e algumas alterações operacionais. O Cadastro deve compartilhar catálogos/colunas básicas, mas não transformar o detalhe da Consulta em editor completo.

### Encaminhado para outras fatias

- `CONFIRMADO` — Estoque, reserva, futuro, troca da filial emitente e disponibilidade aparecem no grid/ações Delphi, mas são efeitos de estoque. Pertencem a “Delimitar estoque, reserva e conferência”; esta fatia apenas publica item/filial/quantidade e consome a disponibilidade.
- `CONFIRMADO` — Séries/lotes são verificados ao faturar (`fmcadastrocontratos.pas:3872-3884`) e existem amplos campos fiscais no data module. Seleção/consumo de séries, geração de movimento e valores fiscais definitivos pertencem a Estoque/Faturamento/Documentos fiscais.
- `CONFIRMADO` — IPI, ST e retenções podem alterar o valor comercial e o Delphi os recalcula durante totais quando parametrizado (`dmcadastrocontratos.pas:3864-3905`), mas a regra tributária pertence ao serviço fiscal. O motor comercial consome um resultado fiscal versionado; não incorpora CFOP/CST/NCM e escrituração.
- `DECISÃO NOVA` — Conferência é infraestrutura reutilizável, porém a obrigatoriedade e seus efeitos na transição ficam na fatia de Estoque. Frete/transportadora e marcações de entrega ficam na fatia de Entrega.

### Classificações restantes

- `DÚVIDA` — A semântica exata de duplicidade de Produto no Contrato (mesma filial, grade, lote, preço ou sequência) precisa de casos dourados do formulário `TfrmCadastroProdutosContrato`; o serviço do Orçamento não deve ser adotado sem confirmar essas chaves.
- `DÚVIDA` — Confirmar se reordenar itens após desconto geral deve redistribuir apenas o centavo residual. Até essa confirmação, a sequência persistida continua parte da entrada determinística do rateio.
- `NÃO LOCALIZADO` — Não foi evidenciado editor Laravel de Serviços que cubra equipamento, CFPS, município e retenções do Contrato; há somente a base do Orçamento e projeção da Consulta.

### Fronteiras de especificação

Esta investigação recomenda três prompts independentes após fechar as dúvidas de casos dourados:

1. motor comercial compartilhado, arredondamento, descontos, brindes e defesa de preço;
2. aba Produtos do Contrato, incluindo editor, exclusão, ordem, cópia, fotos e integração com conferência;
3. aba Serviços do Contrato, incluindo equipamento, CFPS e retenções estimadas.

Cada uma comporta `$to-spec` próprio. Estoque/séries, pagamentos e fiscal permanecem nos tickets já existentes e não devem ser embutidos nesses prompts.
