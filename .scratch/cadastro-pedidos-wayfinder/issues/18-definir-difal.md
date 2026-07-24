# Definir o motor de Impostos — DIFAL (diferencial de alíquota)

Type: grilling
Status: resolved
Blocked by: 05, 13

## Question

Dentro de `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`), documentar o cálculo de DIFAL (diferencial de alíquota interestadual para consumidor final): `ResponsavelDifal`/`fREsponsavelDifal` (`dmbasico.pas:20722-20755`), `datainiciodifal` (`:20756-20760`), `ObservacoesDifal` (`:20660-20690`), `ValorICMSInterPart` (`:23190-23212`), `Condicao_ICMSUFDest` (`:23277-23286`), `OperacaoInterEstadual` (`:23272-23276`), e `VendaouCompraConsumidorFinal` (`:22423-22431`). Para o Cadastro de Pedidos (compra, não venda ao consumidor final), avaliar se DIFAL sequer se aplica na prática — se a conclusão for "não se aplica a Pedidos de Compra", documentar isso explicitamente (com evidência) em vez de especificar em detalhe uma família de imposto que não vai ser exercitada por este módulo; se necessário para o motor genérico (dado que ele também serve Notas Fiscais), registrar a lógica mesmo assim, mas marcando a nota de escopo.

## Answer

### DIFAL não se aplica a Cadastro de Pedidos (CONFIRMADO por estrutura de código, não por inferência)

`ResponsavelDifal` (`dmbasico.pas:20722-20754`) retorna `false` **incondicionalmente** quando `not saida` — todo o corpo que consultaria a tabela `estados` (responsabilidade de DIFAL, data de início) só executa dentro do `if saida then`. Como Cadastro de Pedidos é sempre entrada (`saida = false`), `ResponsavelDifal` é sempre `false`.

`Condicao_ICMSUFDest` (`:23277-23285`) — a condição que efetivamente dispara o cálculo de DIFAL — tem `saida` como **primeiro termo de um `and` em cadeia**: `saida and VendaConsumidorFinal and OperacaoInterEstadual and (...)`. Estruturalmente, com `saida = false`, a condição inteira já é `false` antes de avaliar qualquer coisa sobre consumidor final, interestadualidade ou responsabilidade — não há como DIFAL disparar numa operação de entrada.

`ValorICMSInterPart` (`:23190-23211`, tabela de percentual de partilha 40%/60%/80%/100% por ano 2016-2019) só é consumida dentro do cálculo de `Condicao_ICMSUFDest`/DIFAL, então também não é exercitada.

### Decisão

**DIFAL fica fora da especificação funcional do Cadastro de Pedidos** — confirmado por análise estrutural do código (não apenas por não ter sido observado em uso), já que a guarda `saida` no início da cadeia de condições torna a ramificação inteira inalcançável para uma operação de entrada. Documentar essa conclusão com a evidência acima é suficiente; não é necessário detalhar a fórmula de partilha interestadual nem `ObservacoesDifal` neste mapa — ficam relevantes para um futuro mapa de Notas Fiscais de Saída/NF-e, onde `saida = true` é o caso comum.
