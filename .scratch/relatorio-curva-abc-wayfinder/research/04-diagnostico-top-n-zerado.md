# Diagnóstico: Top N reduzido com universo grande e métricas zeradas

Data da verificação: 2026-09-09

## Sintoma informado

Ao gerar a Curva ABC para aproximadamente 4500 produtos, no período de 1º de março a 1º de setembro, a tela deveria limitar o resultado com Top N 100, mas exibe o universo de 4500 linhas com valores zerados. O checkout Laravel contém uma atualização recente para investigar/corrigir o comportamento; os prompts ainda não foram executados.

## Baseline atual

- Laravel está em `97376be77 (abb 4500)`, precedido por `f06ca462e (ajustes abc)`.
- `buildGerarPayload.ts` envia `quantidade` como Top N.
- `GerarCurvaAbcRequest` aceita Top N inteiro com mínimo 1.
- `CurvaAbcService` preserva `quantidade` em `compiled` e registra `quantidade`, `raw_row_count` e `row_count` no log `curva_abc.gerar_ok`.
- `LegacyCurvaAbcRepository` envia `quantidade` como 7º argumento da função PostgreSQL.
- `teclux_abc_prod.sql` usa `QuantidadeaExibir` para limitar a segunda leitura (`vendas`) e usa a primeira leitura (`vendas_aux`) para calcular `nitens` e os totais.
- O commit atual trocou `numeric(11,2)` por `numeric` nos acumuladores e adicionou reset de `itens`/`posicao` antes da segunda leitura. A migration `2026_09_09_030000_refresh_teclux_abc_prod_topn_numeric_pgsql.php` reaplica a função no PostgreSQL.

## Hipóteses ranqueadas

1. **Alta — overflow/precisão do acumulador:** `numeric(11,2)` poderia estourar ou perder a capacidade de representar o total para o período/universo informado, produzindo métricas inválidas ou zero. A troca para `numeric` é uma hipótese de correção, não uma prova.
2. **Alta — contrato de Top N não verificado no banco:** o universo e o limite são calculados em passagens/cursors diferentes. Um erro de estado (`itens`, `posicao`, cursor ou condição de saída) pode emitir quantidade errada ou um conjunto sem métricas. A suíte atual não exercita esse caminho.
3. **Média — implantação incompleta:** o arquivo SQL foi alterado, mas a migration pode ainda não ter sido executada no ambiente que apresenta o sintoma; nesse caso o serviço continua chamando o corpo antigo da função.
4. **Média — dados/seleção:** filtros de filial, período, flags ou vendedor podem produzir total zero legitimamente; é necessário distinguir “rows retornadas com métricas zero” de “não há vendas no universo”.
5. **Baixa — mapeamento/UI:** o mapper converte campos ausentes/nulos para `0.0`, mas isso não explica por si só uma contagem de 4500; deve ser verificado comparando `raw_row_count`, campos crus e rows serializadas.

## Feedback loop disponível e limitação

O teste existente `CurvaAbcGerarAsyncTest::test_gerar_ok_log_includes_top_n_and_raw_row_count` usa apenas duas linhas mockadas e confirma que `quantidade=4500` aparece no log. Os testes de `LegacyCurvaAbcRepository` confirmam a assinatura de 22/23 parâmetros, mas não executam `teclux_abc_prod`.

Foi tentada a execução dos testes focados, mas o ambiente não pode carregá-los: o `vendor` exige PHP `>= 8.4.1` e o runtime disponível é PHP `8.2.21`. O Docker também não está acessível neste ambiente. Portanto, ainda não há reprodução PostgreSQL executável localmente.

## Conclusão para os prompts

Os prompts precisam ser atualizados antes do `/speckit.specify`. A geração deve incluir um gate de regressão PostgreSQL com universo grande e Top N menor, verificando simultaneamente:

- payload/SQL efetivo com Top N 100;
- universo de aproximadamente 4500 antes do limite;
- no máximo 100 rows emitidas quando Top N é 100;
- valores não zerados quando a fixture contém movimento positivo;
- `raw_row_count` versus `row_count` e campos crus antes/depois do mapper;
- comportamento equivalente nos modos 0, 1 e 2;
- comprovação de que a migration atualizou a função no ambiente alvo;
- caso Top N maior que o universo e caso Top N zero, se o contrato permitir zero como “todos”.

Não há evidência suficiente para implementar outra correção neste diagnóstico. O próximo SpecKit deve primeiro tornar essa reprodução automatizada e só então decidir se mantém, ajusta ou reverte cada parte do commit `97376be77`.
