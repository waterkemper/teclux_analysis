# Reposição estatística e inteligente entre Filiais

Label: wayfinder:map

## Destination

Produzir uma especificação e um roadmap, prontos para `$to-spec`/Speckit, para um módulo de reposição de estoques de filiais baseado em dados históricos e políticas modernas de inventário, integrado ao Laravel e ao legado Delphi. O resultado deve definir o problema de negócio, dados confiáveis, segmentação, previsão de demanda, incerteza, estoque de segurança, ponto de pedido, níveis mínimo/máximo, lead time, alocação entre filiais, explicabilidade, aprovação, backtesting, rollout e fallback operacional.

O módulo poderá ser novo ou uma evolução do ECC existente; essa decisão deve ser tomada com base nas fronteiras encontradas. A primeira entrega deve ser aditiva e segura: gerar recomendações/propostas que passem pela revalidação e pelo fluxo já existente de `pedidosfiliais`/Requisição entre Filiais, sem substituir prematuramente as regras atuais.

## Notes

- Entrega obrigatoria desta frente: apos as decisoes do Wayfinder, gerar prompts sequenciais para `speckit.specify` em `modules`, seguindo o padrao existente de pastas e arquivos `*-speckit-prompt.md`. Nao implementar diretamente durante o planejamento.
- O ECC atual de Consulta de Compras e sua automação são a baseline funcional e a integração de destino. Consultar [automação da Consulta de Compras](../consulta-compras-automacao-wayfinder/map.md) e [Consulta de Compras](../consulta-compras-wayfinder/map.md).
- Investigar conjuntamente `delphi/` e `laravel/`, respeitando as autoridades e o vocabulário de `laravel/CONTEXT.md`, incluindo Produto, Filial, estoque por filial, vendas, entradas/NF, pedidos entre filiais, reserva, concentração e autorização de gerente.
- A análise deve separar claramente: previsão da demanda; política de inventário; otimização/alocação; e workflow operacional. Um modelo estatístico não deve receber responsabilidade implícita por regras de autorização, segurança ou efetivação da requisição.
- Avaliar técnicas modernas em contexto, sem assumir que KNN, regressão linear ou Monte Carlo sejam padrão universal. A comparação deve incluir baselines simples e modelos adequados a sazonalidade, intermitência, promoções, produtos novos e censura por ruptura.
- Classificar toda descoberta como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `DECISÃO NOVA`, sempre com evidência concreta.
- Usar pesquisa baseada em fontes primárias/autoridades e registrar os resultados em Markdown; decisões de produto devem ser explicitadas e não escondidas dentro da escolha do algoritmo.
- Planejamento somente: não criar migrations, endpoints, jobs, modelos treinados ou alterações em Delphi/Laravel dentro deste mapa.

## Decisions so far

- [Consolidar especificação e roadmap implementável](issues/11-consolidar-especificacao-e-roadmap.md) — handoff em modules/estoque/reposicao-estatistica com nove prompts Speckit sequenciais, cobrindo domínio, dados, modelos, política, alocação, execução, revisão, rollout e aceite.

- [Prototipar tela de revisão e explicabilidade](issues/09-prototipar-revisao-explicavel.md) — variante A, Bancada de decisão: lista de recomendações com painel de evidências, revisão auditável, revalidação ECC e tratamento explícito de exceções.

- [Medir qualidade de uma amostra dos dados](issues/12-medir-qualidade-de-amostra-dos-dados.md) — a estrutura necessária está confirmada, mas não há base de cliente no workspace; as métricas ficam pendentes e o relatório entrega consultas reproduzíveis sem inventar números.

- [Definir backtest, rollout e guardrails](issues/10-definir-backtest-e-rollout.md) — backtest temporal walk-forward, modo sombra e piloto controlado antes da promoção, aprovação humana inicial, gates independentes por canal, limites configuráveis, circuit breaker e auditoria imutável.

- [Definir objetivo e métricas de sucesso](issues/03-definir-objetivo-e-metricas.md) — o objetivo primário é reduzir rupturas e elevar o fill rate; transferência cobre primeiro a necessidade e compra atende o residual, com métricas próprias por canal.
- [Pesquisar padrões da indústria de reposição varejista](issues/02-pesquisar-padroes-da-industria.md) — soluções maduras combinam previsão, incerteza, lead time, nível de serviço, posição de estoque e restrições; o módulo deve comparar baselines e modelos por resultado operacional.
- [Inventariar dados históricos e qualidade](issues/01-inventariar-dados-e-qualidade.md) — a estrutura já oferece estoques atuais, movimentos com snapshots, vendas/documentos fiscais, vendas perdidas e pedidos entre filiais; a qualidade e a cobertura real ainda não foram medidas.

- DECISÃO NOVA: o motor estatístico será tratado inicialmente como recomendação aditiva ao ECC, com comparação objetiva contra a operação atual antes de qualquer automação plena.
- DECISÃO NOVA: a efetivação da recomendação continuará sujeita às regras existentes de revalidação, disponibilidade, concentradora, alocação, autorização e geração de `pedidosfiliais`, salvo decisão posterior documentada.
- DECISÃO NOVA: a demanda estatística usará vendas fiscais concluídas por produto/filial e dia local; transferências, requisições e entradas de NF serão sinais separados de abastecimento ou compromisso.
- DECISÃO NOVA: `vendasperdidas` ficará fora da primeira entrega. Dias sem estoque/disponibilidade ou sem operação serão censurados; somente dias operacionais com produto ativo e disponível poderão representar demanda zero.
- DECISÃO NOVA: devoluções manterão a semântica da Consulta de Compras; picos reais e promoções serão preservados, enquanto anomalias de dados serão sinalizadas separadamente.
- DECISÃO NOVA: produtos novos ou com pouco histórico usarão fallback hierárquico e baixa confiança; sazonalidade, feriados e mix só serão aplicados quando houver evidência suficiente.
- DECISÃO NOVA: `produtos.inativol` exclui ambas as reposições; `produtos.foralinhal` exclui compras de fornecedor, mas não transferências entre filiais.
- [Comparar modelos de previsão e incerteza](issues/05-comparar-modelos-de-previsao.md) — portfólio por segmento: baselines e ETS primeiro; SBA/TSB para intermitência; regressão e boosting sob validação; KNN para analogia; previsões probabilísticas e Monte Carlo para incerteza e cenários.
- [Modelar lead time e rede de abastecimento](issues/07-modelar-lead-time-e-rede-de-abastecimento.md) — medir criação, trânsito e recebimento; separar transferência e compra; usar disponibilidade líquida e compromissos; tratar marcos ausentes como censura e manter revalidação do ECC.
- [Definir política de inventário e nível de serviço](issues/06-definir-politica-de-inventario-e-servico.md) — revisão periódica com nível-alvo; proteção por quantis; mínimo/máximo como guardrails; posição configurável e fotografada; necessidade única dividida entre transferência e compra.
- [Decidir arquitetura do motor e integração com ECC](issues/08-decidir-arquitetura-e-integracao.md) — módulo separado, primeira entrega Laravel-only, execução assíncrona e fotografada, dataset canônico, seleção de modelos auditável e gate fail-safe com fallback para ECC/revisão manual.

## Not yet specified

- Calibração em uma base representativa de cada cliente: medição de qualidade, escolha efetiva de segmentos/modelos, parâmetros e limites de rollout. O caminho técnico está definido nos prompts; os valores dependem dos dados reais.

## Out of scope

- Substituir de imediato `Consulta de Compras`, ECC ou `pedidosfiliais`.
- Alterar sem decisão específica as regras M/D/U/F/O/C, senha de gerente de vendas, concentração ou autorização já definidas.
- Autoaprovar requisições sem trilha de auditoria, revalidação e guardrails.
- Escolher ou treinar um algoritmo apenas por ser mais sofisticado, sem baseline e validação fora da amostra.
- Criar um padrão de filtros, depósitos, filiais, períodos ou perfis para todos os clientes.
