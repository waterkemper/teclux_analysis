# Inventariar documentação existente para usuário final e suporte

Type: task
Status: resolved
Blocked by:

## Question

O que já existe em `laravel/docs/usuario/` e `laravel/docs/suporte/` — quais módulos têm manual ativo, quais são placeholder, quais domínios previstos ainda não têm nenhum documento? Produzir um resumo do estado real da documentação (cobertura por domínio, status Ativo/Placeholder/Planejado) para citar na apresentação como prova de que o cliente já terá material de apoio, e apontar as lacunas mais visíveis.

## Answer

Os índices (`docs/usuario/README.md`/`index.md`) estão desatualizados e subestimam bastante o que existe de fato — listam só Marketplaces como "Ativo". A realidade, lendo o conteúdo real dos arquivos (frontmatter padronizado, passo a passo numerado, tabelas de status/erros, FAQ — guias completos, não stubs):

**Manual do usuário (`laravel/docs/usuario/`) — 85 guias de conteúdo real, em 9 domínios:**

| Domínio | Guias | Exemplos |
|---|---|---|
| Vendas (inclui Contratos e Orçamentos) | 40 | contratos-faturar, contratos-cancelar-reverter, orcamentos-gerar-contrato, venda-perdida |
| Estoque | 15 | ficha-produtos, consulta-estoques, busca-assistida-produtos, pedidos-compra, manutencao-precos |
| Cadastros | 10 | clientes, usuarios (cobre usuários e permissões), filiais, bancos, grupos |
| Financeiro | 8 | contas-a-pagar, dre, extrato-balancete, movimentacao-bancaria |
| Marketplaces | 6 | guia-operador, produtos, manutencao-precos, pedidos, dashboard-conta |
| Contas a Pagar | 4 | autorizacao-pagamentos, quitacao-em-lote, estorno-pagamento-em-lote |
| Cobrança e SAC | 4 | atendimentos, ligar-clientes, mala-direta |
| Interlojas | 2 | requisicao-para-exposicao, consulta-requisicoes |
| ERP Grid (padrão transversal) | 2 | títulos e configurações de grid |

Único domínio previsto e ainda vazio: **Fiscal** (`fiscal/`) — coerente com NFe/NFC-e ainda não implementado.

**Documentação de suporte (`laravel/docs/suporte/`) — 45 runbooks técnicos de diagnóstico** (para quem atende o cliente, não para o cliente ler direto): erros de marketplace (Magalu/ML), autorização/quitação de contas a pagar (5 documentos), busca assistida, CNPJ alfanumérico, e uma pasta `vendas/` com ~20 runbooks de contratos. O único item ainda "Planejado" no README (`problemas-comuns.md`, `checklist-atendimento.md`) segue realmente não escrito — é a lacuna real confirmada.

**Frase-síntese para o slide:** "O tecLUX Cloud já sai com manual do usuário pronto para praticamente todo o sistema — 85 guias cobrindo Cadastros, Vendas/Contratos, Estoque, Financeiro, Contas a Pagar, Cobrança/SAC, Interlojas e Marketplaces — mais 45 runbooks internos de suporte para diagnóstico rápido de problemas reais já resolvidos. O único domínio ainda sem documentação é o Fiscal (NF-e), porque a funcionalidade em si ainda está em especificação."

(Nota à parte, fora de escopo deste mapa: os índices `docs/usuario/README.md`/`index.md` estão desatualizados e merecem correção como dívida de manutenção da documentação — não uma decisão deste mapa.)
