# Reformulação da Consulta de Orçamentos

Label: wayfinder:map

## Destination

Produzir uma análise Delphi–Laravel baseada em evidências e pronta para `$to-spec` para transformar a prévia Laravel na Consulta de Orçamentos completa, com filtros avançados reutilizáveis, resultados mestre–detalhe, seleção e todas as operações aplicáveis.

## Notes

- Analisar `fmconsultaorcamentos.pas/.dfm` e `dmconsultaorcamentos.pas/.dfm` conjuntamente, incluindo ancestrais, queries, macros, frames, actions, atalhos, parâmetros, Permissões, Autorizações e integrações.
- Comparar com a Consulta de Orçamentos Laravel existente e usar Vendas → Consulta de Contratos como principal referência de componentes, composição SQL, estado, ajuda, geração cancelável, resultados, detalhes e operações.
- Reutilizar componentes existentes de Filial, Produto, Cliente, Fornecedor, vendedor, Plano de Pagamento, datas, Atendimento, barra de operações, grids e autenticação sensível; não criar versões específicas sem necessidade comprovada.
- Classificar toda descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- CONFIRMADO: Delphi separa `Parâmetros` e `Registros selecionados`; F6 executa a consulta, F7 cancela/exclui marcados e F11 imprime marcados.
- CONFIRMADO: operações contextuais incluem abrir Orçamento, Contrato, Atendimento, Vendas do Cliente e Ficha Financeira.
- CONFIRMADO: filtros incluem Filial, vendedor, Cliente/nome, Produto e dimensões, Plano, emissão, validade, Situação, valor total, Atendimentos, datas de contato/lembrar, não ligar e ordenação.
- CONFIRMADO: resultado exibe totais de registros/valores gerais e marcados, dados do cancelamento, Contrato, Situação do Contrato e último Atendimento.
- CONFIRMADO: Produtos podem ser visualizados com situação Atendido/Parcialmente atendido/Não atendido conforme `Visualizar Situação Produtos`.
- CONFIRMADO: cancelamento/exclusão em lote depende de `ExclusaoOrcamento`; cancelamento de múltiplos solicita Autorização contextual de Gerente de Vendas.
- CONFIRMADO: Laravel já tem uma Consulta de Orçamentos inicial com página, request, service, repository, grade, seleção e cancelamento em lote.
- DIVERGENTE: UI Laravel atual expõe somente emissão, nome do Cliente e Situação, apesar de o request declarar alguns filtros adicionais.
- DIVERGENTE: cancelamento Laravel atual usa prompt simples de código do Motivo, em vez do fluxo já especificado de Motivo/descrição/Atendimento/Autorização.
- NÃO LOCALIZADO: impressão em lote, painel mestre–detalhe, operações de Contrato/Atendimento/Vendas/Ficha e filtros avançados na Consulta Laravel atual.
- `delphi/` e `laravel/` são somente leitura. Nenhuma implementação será feita neste workspace.

## Decisions so far

- DECISÃO NOVA: transformar a prévia Laravel em Consulta de Orçamentos completa, não manter uma tela compacta de encaminhamento.
- DECISÃO NOVA: filtros somente são aplicados ao clicar em `Gerar`, seguindo a Consulta de Contratos; mudanças não disparam busca reativa.
- DECISÃO NOVA: preservar filtros e paginação/seleção até uma nova geração, conforme contrato final de estado.
- DECISÃO NOVA: Orçamento, Contrato, Atendimento, Vendas e Ficha Financeira atuam apenas sobre a linha ativa.
- DECISÃO NOVA: seleção múltipla é usada somente por Cancelar/Excluir e Imprimir.
- DECISÃO NOVA: substituir a mesclagem legada por mestre–detalhe, com grade de Orçamentos e detalhe do ativo, incluindo aba Produtos e filtro por situação.
- DECISÃO NOVA: reutilizar painéis Laravel de Filiais, Produto, Cliente, Fornecedor, vendedor, Plano de Pagamento, períodos e último Atendimento.
- DECISÃO NOVA: Fornecedor participa por meio dos Produtos, reutilizando exatamente componente e composição SQL da Consulta de Contratos.
- DECISÃO NOVA: manter todos os filtros específicos Delphi, adaptando `Clientes marcados para não ligar` à regra/campo atual do Cliente.

## Not yet specified

- Semântica completa de `Gerar F6`, validação mínima de filtros e limites de resultado.
- Valores/códigos de Situação e opções de ordenação, incluindo defaults e equivalência Laravel.
- Semântica de seleção entre páginas e após nova ordenação/filtro.
- Política de abertura em modal, painel ou nova rota para cada operação contextual.
- Elegibilidade detalhada de abrir Contrato quando não há vínculo e de consultar Vendas/Ficha para tipos de Cliente diferentes.
- Comportamento e precedência de Permissões por ação, Filiais autorizadas e autenticação sensível.
- Cancelamento/exclusão em lote deve ser alinhado integralmente ao spec específico já produzido.
- Impressão em lote deve ser alinhada integralmente ao spec específico já produzido.
- Modelo exato de totalização com paginação: página carregada versus conjunto total filtrado.
- Desempenho de filtros combinados, especialmente Produto/Fornecedor/Atendimento, e estratégia de consulta sem multiplicar linhas.
- Colunas configuráveis, persistência de layout de grid, exportação e ajuda contextual.

## Out of scope

- Implementar a consulta neste workspace.
- Copiar o layout visual Delphi ou a mesclagem de grids.
- Duplicar componentes/SQL já existentes na Consulta de Contratos.
- Redefinir regras de cancelamento/exclusão ou impressão já cobertas pelos respectivos specs; apenas integrá-las.
- Alterar Delphi ou executar migrations, Composer, npm, builds, formatadores e geradores nas junctions.
