Type: task
Status: resolved
Blocked by: 01, 02, 05, 06, 07, 09

## Question

Quais módulos, queries, caches, triggers e integrações consomem ou reagem aos preços internos alterados — especialmente Orçamentos, Contratos, Frente de Caixa, Cadastro de Produtos, Promoções e regras por Cargo/Cliente — e quais efeitos devem ser síncronos, recalculados sob demanda ou publicados após a gravação?

Não incluir sincronização/publicação de Marketplace.

## Answer

### Regra de fronteira

- **DECISÃO NOVA** — separar preço corrente de catálogo de preço fotografado no documento comercial. A manutenção altera as fontes do motor oficial; consultas posteriores usam o valor corrente, mas itens já persistidos em Orçamentos, Contratos ou vendas não são reprecificados automaticamente.
- **CONFIRMADO** — Orçamentos e Contratos persistem precovenda e precotabela. O Laravel lê essa fotografia em LegacyOrcamentoProdutoRepository.php:53-56 e LegacyContratoDetalheRepository.php:197-242.
- **CONFIRMADO** — a geração de Contrato a partir de Orçamento copia precovenda e precotabela, sem consultar novamente o catálogo (LegacyGerarContratoOrcamentoRepository.php:102,222-235).
- **DECISÃO NOVA** — não atualizar produtosorcamentos, produtoscontratos, totais, parcelas, reservas, comissões, cashback, frete ou documentos fiscais como efeito da manutenção. Uma futura reprecificação de documento será outro caso de uso explícito e autorizado.

### Efeitos síncronos

- **CONFIRMADO** — o commit altera somente caracteristicas, precos, colunasprecos, produtos e produtoscargos; as triggers geram auditoria. Não foi localizada trigger dessas tabelas que atualize Orçamentos ou Contratos (migrations 2026_05_08_100003, 100004 e 100009).
- **CONFIRMADO** — triggers de produtos e produtoscargos calculam preço anterior/novo via estoques_preco somente para o log (2026_05_08_100003:97-165; 2026_05_08_100004:104-201).
- **DECISÃO NOVA** — o único efeito síncrono adicional é o cabeçalho idempotente/auditoria definido na decisão de gravação atômica. Não haverá fan-out para consumidores.

### Orçamentos: recálculo sob demanda

- **CONFIRMADO** — o Delphi resolve preço na localização/inclusão usando estoques_preco, colunasprecos, promoção vigente, markup do Cliente e produtoscargos (delphi/apps/vendas/dmorcamentos.dfm:724-780,1162-1163,1264-1273).
- **CONFIRMADO** — o Laravel consulta o motor oficial na pesquisa e inclusão (VendaProdutoPesquisaService.php:87,160-165,276-283; OrcamentoProdutoInclusaoService.php:76-93,158-163,467-470).
- **CONFIRMADO** — a precedência Cliente → Cargo → normal/promoção lê clientes.markup, clientes.empcargo e produtoscargos.markup (OrcamentoProdutoInclusaoService.php:373-464), além de Promoção para descrição e bloqueio de desconto (:487-568).
- **CONFIRMADO** — a gravação volta a obter preço autoritativo no servidor (GravarOrcamentoService.php:176-206).
- **DECISÃO NOVA** — nova pesquisa, inclusão, troca de Cliente/Cargo e validação de gravação usam o preço confirmado no lote. Orçamento aberto não é silenciosamente reprecificado; qualquer recálculo de linha deve ser explícito e visível.

### Contratos e Frente de Caixa

- **CONFIRMADO** — o Cadastro de Contratos Delphi consulta o mesmo conjunto de fontes em dmcadastrocontratos.dfm; o Laravel atual ainda não possui serviço completo equivalente para inclusão de produtos em Contrato.
- **DECISÃO NOVA** — o futuro Cadastro de Contratos reutilizará o resolvedor de preço passando Filial, Cliente, Cargo, data e contexto; nova linha fotografa o resultado e linhas antigas permanecem inalteradas.
- **DÚVIDA** — autorização e UX de reprecificação manual de linha existente pertencem à spec do Cadastro de Contratos.
- **CONFIRMADO** — o Frente de Caixa Delphi resolve tabela selecionada, markup de Cliente, markup por Cargo e promoção por Filial no momento da consulta (delphi/apps/caixa/dmfrentecaixa.dfm:21-29,110-147,3336-3373). Compostos consultam colunasprecos para formar a base (dmfrentecaixa.pas:3053-3055).
- **NÃO LOCALIZADO** — não há implementação Laravel completa do Frente de Caixa.
- **DECISÃO NOVA** — o futuro Frente de Caixa consulta o motor sob demanda; não recebe cópia publicada pelo F8. Produtos compostos exigirão casos dourados na migração desse módulo.

### Cadastro de Produtos, Promoções e Estoque

- **CONFIRMADO** — Cadastro de Produtos já lê colunasprecos/produtoscargos e usa LegacyProductPriceEngineRepository em prévias; nova abertura ou refresh vê o valor confirmado (ProdutoPrecosTabReadService, ProdutoPrecosCargosTabReadService, ProdutoCaracteristicaController.php:2280-2518).
- **CONFIRMADO** — Promoção não recebe preço materializado: efetividade decorre de Filial, vínculo em precos, coluna promocional e validade; Orçamentos consultam estoques_produtoempromocao (dmorcamentos.dfm:1162-1163).
- **CONFIRMADO** — Consulta de Estoques Laravel usa LegacyProductPriceEngineRepository e repositórios de colunas.
- **DECISÃO NOVA** — telas abertas conservam snapshot visual até refresh/nova consulta; não haverá broadcast obrigatório nesta migração.

### Cache e pós-commit

- **NÃO LOCALIZADO** — os serviços de preço, pesquisa e inclusão não possuem cache do valor de preço. As leituras vão ao banco/motor oficial.
- **CONFIRMADO** — existe cache de proposta de troca de Cliente no Orçamento, mas não de preço (ClienteTransitionProposalStore.php:22-62); não deve ser invalidado.
- **DECISÃO NOVA** — não criar cache de preço. Se surgir depois, a chave deverá incluir Produto, Filial, Faixa/tabela, Cliente/Cargo, Promoção/data e revisão do catálogo.
- **DECISÃO NOVA** — pós-commit: retornar resultado, atualizar a própria tela por F6 e disponibilizar auditoria. Não publicar evento funcional para Vendas nem executar jobs de reprecificação.
- **DÚVIDA** — mudanças feitas pelo Delphi ficam disponíveis às novas consultas Laravel, mas não avisam telas já abertas; a política é snapshot até refresh.

### Matriz de efeitos

| Consumidor | Quando vê o preço novo | Registro existente |
|---|---|---|
| Pesquisa de Vendas | nova pesquisa | nenhum |
| Inclusão/validação de Orçamento | lookup e gravação | fotografa linha incluída ou explicitamente recalculada |
| Orçamento gravado | somente ação explícita | preserva valores |
| Contrato originado de Orçamento | copia o Orçamento | não reconsulta |
| Nova linha de Contrato | lookup futuro | fotografa nova linha |
| Frente de Caixa | consulta/bipe futuro | operação corrente |
| Produto/Consulta de Estoques | refresh | somente visualização |
| Promoção | avaliação por Filial/data | não materializa em documentos |
| Marketplace | fora do fluxo | nenhuma chamada direta |

### Próxima decisão

Esta resolução desbloqueia “Comparar Laravel e definir arquitetura reutilizável”, que deve consolidar um contrato único de resolução para Orçamento, futuro Contrato e futuro Frente de Caixa, sem transformar a Manutenção de Preços em publicadora de eventos de Vendas.
