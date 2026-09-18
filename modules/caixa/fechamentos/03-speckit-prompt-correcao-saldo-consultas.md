# Prompt para /speckit.specify

```text
/speckit.specify

Revise e corrija a implementacao existente do Fechamento de Caixa no checkout Laravel em `laravel/`, com foco na paridade do Saldo Atual/Saida final e na eliminacao de consultas indevidas. Nao reescreva a funcionalidade do zero. Inspecione o Laravel e, desta vez, confronte os trechos Delphi autorizados pelo solicitante (`delphi/apps/caixa/dmfechamentocaixa.pas/.dfm` e `delphi/apps/caixa/fmfechamentocaixa.pas/.dfm`). Classifique cada achado como CONFIRMADO, INFERIDO, DIVERGENTE, DUVIDA ou NAO LOCALIZADO, sempre citando arquivo e linha.

## Achados ja confirmados

1. `laravel/backend/app/Domain/Caixa/SaldoAtualFechamento.php` reproduz a formula unica usada pela tela/relatorio Delphi:

   SaldoAtual = SaldoAnterior
              + Prestacoes + DocEntrada + TransEntrada + ResgateCheque + AjustSldDevTroca
              - Devolucoes - DevolucoesSaldo - DocSaida - TransSaida - Deposito
              - ChequeAVista - ChequePre - ChequeNaoIdentificado - Duplicatas - Cartao - Pix.

   Preserve `MoneyDecimal` e mantenha `totais.saldo_atual` como a fonte autoritativa devolvida pelo backend. Nao substitua pela coluna fisica `autenticacoes.saldo` nem por uma formula que some apenas Prestacoes.

2. Ha uma divergencia de entrada do saldo anterior: `LegacyFechamentoCaixaTotalizacaoRepository::saldoAnterior()` usa `whereNotExists` para excluir o ultimo lancamento cancelado; a consulta Delphi que escolhe o ultimo lancamento anterior (`dmfechamentocaixa.dfm`, bloco `/*saldo*/`) nao possui esse filtro. Reproduza o comportamento Delphi confirmado, inclusive quando o ultimo lancamento anterior foi cancelado, e crie teste de regressao que torne essa diferenca observavel.

3. A tela `resources/js/Pages/Caixa/Fechamento/Index.tsx` exibe `Total entradas` como `ledger.recebimentos`, embora o Delphi some Prestacoes + DocEntrada + TransEntrada + ResgateCheque + AjustSldDevTroca. Corrija a projecao visual. Cartao/Pix pertencem as saidas na formula Delphi; nao os apresente como entrada e saida simultaneamente.

4. `consultar()` no controller chama `totalizar->execute()`, depois chama `estado->execute()` e em seguida chama `page->indexProps()`. `indexProps()` consulta novamente estado, nome do usuario, nome da filial e parametros. Para cada F9 isso gera trabalho e consultas extras, inclusive consultas de nomes que nao sao necessarias para a resposta JSON. `lookupCaixas()` repete o mesmo problema ao chamar `indexProps()` antes da consulta paginada.

5. `LegacyFechamentoCaixaTotalizacaoRepository::totalizar()` executa uma consulta para cada tipo em `somasTiposSimples()` e `resumoRenegociados()` executa uma consulta em `parcelas` para cada linha renegociada. Isso e N+1/perda de performance confirmada no codigo, ainda que o Delphi tenha uma query UNION principal. A implementacao pode manter queries separadas por responsabilidade, mas deve eliminar consultas por tipo/por linha e manter uma quantidade limitada e previsivel de queries por totalizacao.

## Requisitos da correcao

- Centralize a montagem das capabilities em um metodo barato ou reutilizavel; `consultar()` e `lookupCaixas()` nao podem montar o envelope completo de `indexProps()`.
- Nao introduza consulta automatica a cada tecla digitada. F9 deve fazer uma unica consulta de totalizacao; Enter deve ser tratado pelo prompt de foco separado abaixo.
- Reescreva `somasTiposSimples()` para uma agregacao agrupada/condicional equivalente, sem perder os filtros por caixa, filial, data e cancelamento. Batches equivalentes sao aceitos se nao houver consulta por item.
- Reescreva a busca das origens de renegociacao para carregar todas as origens dos contratos primogenitos em lote e indexa-las em memoria.
- Preserve as regras Delphi: `TransSaida` somente confirmada; `Cartao`/`Pix` por `recebimentos.valorlancto`; cancelamentos excluem os totais monetarios quando a query legada os exclui; `Perdas` nao entra no Saldo Atual; `Cancelamento` e contador.
- Preserve a comparacao cronologica de documentos e a formula de saldo anterior exatamente documentadas, sem trocar a semantica por uma aproximacao baseada apenas em `numero`.
- A resposta de consulta, PDF e Fechar Caixa deve usar o mesmo contrato de totalizacao para impedir que o saldo da tela, do PDF e do fechamento diverjam.

## Testes obrigatorios

- Fixture com saldo anterior e mix de todos os componentes: conferir cada componente e o Saldo Atual pela formula unica.
- Fixture em que o ultimo lancamento anterior e cancelado: conferir o saldo anterior conforme Delphi e o saldo final resultante.
- Conferir que Cartao/Pix reduzem o saldo e nao aumentam o total de entradas.
- Conferir que o total visual de entradas e a soma correta das cinco entradas do Delphi, e o total visual de saidas contem todos os onze componentes de saida.
- Medir queries com `DB::listen`: F9 nao pode disparar `indexProps()` completo; lookup de caixas nao pode consultar estado/nome/parametros antes da propria listagem.
- Medir a totalizacao com varias linhas simples e varias renegociacoes: nenhuma consulta pode crescer proporcionalmente ao numero de tipos ou de linhas.
- Executar a suite PHPUnit/feature do modulo e registrar qualquer bloqueio de ambiente.

## Saida

Produza a especificacao, o plano e os criterios de aceite da correcao. Nao implemente nesta etapa. Nao remova a formula unica ja adotada nem reabra a decisao sobre ECF/impressora/NumeroCopias.
```
