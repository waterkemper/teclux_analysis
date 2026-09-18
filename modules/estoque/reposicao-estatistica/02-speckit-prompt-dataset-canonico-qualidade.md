# Prompt 02 — Dataset canônico e qualidade dos dados

## Prompt para /speckit.specify

/speckit.specify

Especifique e implemente o dataset canônico da Reposição Estatística. Antes, leia o prompt 01, o relatório .scratch/reposicao-estatistica-wayfinder/research/qualidade-da-amostra.md, o ticket de qualidade e as autoridades reais de Laravel/Delphi.

O Laravel deve montar o dataset por repositórios existentes; o motor não acessa diretamente PostgreSQL legado nem escreve em tabelas legadas. O dataset deve ser versionável e rastreável por produto, filial, dia e execução.

Separe explicitamente:

- vendas fiscais concluídas como demanda observada;
- entradas de NF como abastecimento;
- transferências e pedidos entre filiais como compromissos/sinais de rede;
- saldo e componentes de estoque como posição;
- devoluções com a mesma semântica da Consulta de Compras;
- vendas perdidas fora da primeira entrega.

Permita que cada cliente escolha os componentes de estoque considerados, por exemplo emestoque, reservado, transito, demonstracao, conserto, futuro, danificada, estoquefisico e reservaprevia, somente quando a coluna existir e for validada. Não assumir que todos os campos têm a mesma semântica entre bases.

A elegibilidade deve obedecer:

- produtos.inativol exclui transferência e compra;
- produtos.foralinhal exclui compra de fornecedor, mas não transferência;
- produtos sem histórico não devem ser descartados silenciosamente: recebem status de baixa amostra e fallback posterior;
- dias sem operação, produto indisponível ou ruptura conhecida são censurados; não convertê-los automaticamente em venda zero.

Crie gate de qualidade antes do cálculo: atraso de carga, cobertura temporal, nulos, duplicidades, chaves inválidas, movimentos sem produto/filial, divergência entre snapshot e saldo atual e taxonomia desconhecida. O gate deve bloquear a recomendação estatística ou marcar fallback, com motivo auditável.

Inclua consultas/serviços para produzir estatísticas agregadas de cobertura, primeira/última data, dias operacionais, dias sem movimento e cardinalidade produto × filial. Nenhuma amostra de cliente deve ser persistida sem anonimização.

## Aceite

- [ ] O dataset é criado pelo Laravel e possui linhagem por campo.
- [ ] Os componentes de estoque são configuráveis por cliente.
- [ ] Demanda, abastecimento, compromisso e posição não são misturados.
- [ ] inativol e foralinhal seguem os dois canais corretamente.
- [ ] Vendas perdidas continuam fora da primeira entrega.
- [ ] O gate impede cálculo quando os dados não são confiáveis.
- [ ] Ausência de movimento não vira demanda zero sem evidência de dia operacional.
- [ ] Consultas funcionam no PostgreSQL 9.5/9.6.
