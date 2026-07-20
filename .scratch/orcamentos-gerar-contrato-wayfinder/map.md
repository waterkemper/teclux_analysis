# Gerar Contrato a partir do Orçamento

Label: wayfinder:map

## Destination

Produzir uma análise Delphi–Laravel baseada em evidências e pronta para `$to-spec` para completar a geração atômica de Contrato a partir do Orçamento, encerrando na exibição do número gerado na própria tela, sem depender do Cadastro de Contratos.

## Notes

- Analisar PAS e DFM conjuntamente, especialmente botão F7/Contrato, `GerarContrato`, data modules envolvidos, queries, sequences, funções de banco, Atendimento, Questionário, Qualidade da Venda, Cliente, Produtos, séries, Serviços, Planos e Parcelas.
- Comparar com o gerador Laravel já existente: controller, request, policy, service, repository, parameter manifest, página e testes.
- Classificar cada descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- CONFIRMADO: Delphi só habilita o botão para Orçamento gravado e aberto; valida endereço de entrega completo quando existe entrega.
- CONFIRMADO: `Produtos no orçamento com estoque` bloqueia geração quando existem Produtos não atendidos ou parcialmente atendidos.
- CONFIRMADO: há confirmação explícita, validação/autorização de Qualidade da Venda, Plano selecionado e vencimentos das Parcelas.
- CONFIRMADO: Orçamento sem Cliente provoca criação e vínculo de Cliente antes do Contrato.
- CONFIRMADO: o Delphi registra/transfere Atendimento `OrcamentoParaContrato` antes de criar o Contrato.
- CONFIRMADO: Contrato nasce em Situação `O`; Orçamento passa para `T` e recebe o número.
- CONFIRMADO: o Delphi copia cabeçalho comercial/cadastral, entrega, frete, descontos/cashback/cupom, Produtos, séries, Serviços e Parcelas, além de marcar quantidades dos Produtos do Orçamento como vendidas.
- CONFIRMADO: após persistência, executa vínculo Cliente–Contrato e aciona Questionário/Enquete com Orçamento e Contrato.
- CONFIRMADO: Laravel já possui endpoint, policy, service, repository, botão e teste básico de geração.
- DIVERGENTE: Laravel cria Contrato em `A`, não `O`.
- DIVERGENTE: repository Laravel atual copia somente número/origem/situação e poucos campos financeiros; Produtos recebem apenas Contrato/Produto/Filial e Parcelas recebem dados mínimos.
- NÃO LOCALIZADO no gerador Laravel atual: Cliente obrigatório/criação, Atendimento, Qualidade da Venda, estoque parametrizado, endereço de entrega, séries, Serviços, cópia cadastral/comercial completa, marcação vendida, vínculo Cliente–Contrato e Questionário.
- `delphi/` e `laravel/` são somente leitura. Nenhuma implementação será feita neste workspace.

## Decisions so far

- DECISÃO NOVA: revisar e completar o gerador Laravel existente, não criar fluxo paralelo.
- DECISÃO NOVA: geração idempotente; Orçamento já vinculado retorna/exibe o mesmo número e nunca cria outro Contrato.
- DECISÃO NOVA: botão fica indisponível quando já existe Contrato e o número permanece visível.
- DECISÃO NOVA: Orçamento sem Cliente cria/vincula Cliente quando os dados obrigatórios forem suficientes; caso contrário, bloqueia apontando campos faltantes.
- DECISÃO NOVA: Contrato nasce em `O — Orçado`; Orçamento passa a `T` e referencia o número.
- DECISÃO NOVA: preservar integração de Atendimentos e fluxo de Questionário já especificados.
- DECISÃO NOVA: não redirecionar para Cadastro/Consulta de Contratos; atualizar a tela, mostrar o número e confirmação de sucesso.
- DECISÃO NOVA: toda geração e efeitos essenciais são atômicos; pós-commit do Questionário segue seu contrato durável sem desfazer Contrato já gerado.

## Not yet specified

- Inventário campo a campo completo e tratamento de null/default entre Orçamento e Contrato.
- Regra exata de Filial do Contrato: `FilialBase` no legado versus Filial efetiva do Orçamento.
- Critérios obrigatórios para criar Cliente a partir de Orçamento anônimo e prevenção de duplicidade cadastral.
- Semântica de Cliente dos tipos `C`, `F` e `L` conforme parâmetro já documentado.
- Forma de autorização da Qualidade da Venda e persistência do Analista no Laravel.
- Cálculo de estoque/situação de Produto no instante transacional e concorrência com outras vendas.
- Validação de vencimentos das Parcelas e comportamento para Plano único não marcado.
- Cópia de reservas, agendamento, entrega, montagem, séries e quantidades vendidas.
- Fronteira transacional de Atendimento e vínculo Cliente–Contrato; compensação se conexões forem distintas.
- Comportamento quando Questionário falha após commit, conforme spec próprio.
- Proteções contra clique/requisição concorrente e consumo seguro do próximo número.
- Auditoria e triggers `_log_new` de todas as tabelas afetadas.

## Out of scope

- Implementar ou abrir Cadastro de Contratos nesta entrega.
- Redirecionar o Usuário para Consulta/Cadastro de Contratos.
- Faturar, reservar, imprimir ou editar o Contrato após a geração.
- Simplificar a geração para copiar somente os campos já cobertos pelo repository Laravel atual.
- Alterar Delphi ou executar migrations, Composer, npm, builds, formatadores ou geradores nas junctions.
