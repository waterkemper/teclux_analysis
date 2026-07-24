# Definir o motor de Impostos — ICMS normal

Type: grilling
Status: resolved
Blocked by: 05

## Question

Dentro de `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`), documentar a lógica de ICMS normal (não-substituição): base de cálculo (`IcmsBaseCalculo`, `dmbasico.pas:21221-21373`, duas sobrecargas — `TClientDataSet` e `TTecQuery`), valor (`IcmsValor`, `:21505-21514`), alíquota interna/interestadual (`AliquotaICMS`, `:21699-21792`, duas sobrecargas), redução de base (`ReducaoBase`/`ReducaoBase_Custo`, `:21569-21581`), ICMS sobre IPI/despesas acessórias (`ICMSSobreIPI`/`ICMSSobreDespesasAcessorias`, `:21182-21220`), FCP (`IcmsValorfcp`, `:21515-21519`), crédito ICMS Simples Nacional (`CredICMSSN`, `:21563-21568`), Simples Nacional (`IcmsValorCalculadoSimples`, `:21534-21562`), e diferimento (`naocalcularvaloresicmsdiferimento`, `:22417-22422`). Qual a ordem exata de cálculo (base → alíquota → valor, considerando reduções e diferimento) e quais parâmetros/flags (`ContribICMS`, `msgDifAliquotaICMS`) alteram o resultado?

## Answer

### Base de cálculo (CONFIRMADO, `IcmsBaseCalculo`, `dmbasico.pas:21221-21373`, duas sobrecargas idênticas em estrutura — `TClientDataSet` e `TTecQuery`)

`base = quantidade × preço unitário − desconto do item + frete + seguro + (IPI, se ICMSSobreIPI) + (despesas acessórias, se ICMSSobreDespesasAcessorias)`, sempre arredondado/truncado a 2 casas. Duas exceções que pulam esse cálculo: (1) se `HeImportacao` ou `OrigemCalculo = NotaAcrescimoFinanceiro`, usa direto o campo `icmsbasecalculo` já gravado, sem recalcular; (2) se existe um campo `produtototal` já calculado e o usuário não está em modo de alteração manual de ICMS (`not PermiteAlterarDadosICMS`), reaproveita esse total em vez de recalcular quantidade×preço do zero — evita divergência entre o total exibido e a base usada.

`ICMSSobreIPI`/`ICMSSobreDespesasAcessorias` (`:21182-21208`) são simples leitores de flag por produto (`icmssobreipi`/`icmssobredespesasacessorias`) — decidem se o IPI e as despesas acessórias do item entram ou não na base de cálculo do ICMS daquele produto especificamente (não é uma regra global, é por linha).

### Valor e alíquota (CONFIRMADO)

- `IcmsValor` (`:21505-21513`) = `base × aliquotaicms / 100` (arredondado/truncado), exceto importação/`NotaAcrescimoFinanceiro`, que usa o valor já gravado direto.
- `AliquotaICMS(EstadoOrigem, EstadoDestino, AliquotaInternadoEstadodeDestino)` (`:21710-21724`) — consulta uma tabela de alíquotas (`qryICMSTAbela_`) parametrizada por produto + UF origem + UF destino + tipo de pessoa + **se cada lado é contribuinte de ICMS** + **se é venda a consumidor final**. Existe uma versão anterior mais simples da mesma função **comentada/morta** logo acima (`:21699-21708`, sem os parâmetros de contribuinte/consumidor final) — evidência de que a lógica evoluiu para tratar as regras de partilha interestadual (tipo EC 87/2015) e a versão antiga não deve ser usada como referência.
- `ReducaoBase` / `ReducaoBase_Custo` (`:21569-21579`) — **duas reduções de base distintas**: `percentualreducaobase` (a oficial, usada no valor do ICMS declarado) e `percentualreducaobase_custo` (percentual separado, só para fins de custo) — confirma que o percentual de redução usado para apurar o imposto declarado pode ser diferente do usado para apurar o custo do produto. Não unificar os dois na especificação Laravel.
- `CredICMSSN` (`:21563-21567`) = `base × pCredSN / 100` — crédito presumido de ICMS quando a compra é de fornecedor do Simples Nacional (permite abater um percentual como se fosse crédito normal).
- `IcmsValorfcp`/`IcmsValorfcpst`/`IcmsValorfcpstRet` (`:21515-21528`) — FCP (Fundo de Combate à Pobreza) calculado sobre 3 bases diferentes (normal, ST, ST retido), cada uma com sua própria alíquota (`pfcp`/`pfcpst`/`pfcpstret`) — mecanicamente idênticos entre si, só a base e a alíquota mudam.

### Achado — código morto (não replicar)

`IcmsValorCalculadoSimples` (`:21534-21561`) está **inteiramente comentado** — cálculo alternativo de ICMS via consulta a uma tabela `qryICMSTAbela_` específica para regime Simples não está em uso. Não replicar como se fosse lógica ativa.

### Helpers de classificação de regime (CONFIRMADO, relevantes também ao ticket 17)

`NoSimples`/`ClienteNoSimples`/`OrgaoPublico` (`:21726-21757`) — funções de suporte que leem flags/regime da nota ou do cliente para decidir ramificações de cálculo. Um bloco de comentário extenso (`:21763-21791`) documenta uma regra específica de Santa Catarina (Decreto 306/2011, Convênio ICMS 35/2011) sobre qual MVA usar em operações interestaduais conforme o regime tributário do fornecedor e do adquirente — evidência de que **há lógica de substituição tributária específica por UF embutida no motor**, mais relevante ao ticket 14 (ICMS-ST) do que a este.

### Decisão

Especificar ICMS normal como: base de cálculo (fórmula acima, com as duas exceções de bypass), valor = base × alíquota, alíquota resolvida por tabela parametrizada por UF origem/destino/contribuinte/consumidor-final (não uma alíquota fixa por produto), duas reduções de base distintas (oficial vs. custo), crédito presumido Simples Nacional, e FCP em 3 variantes. Não replicar `IcmsValorCalculadoSimples` (morto). A regra de MVA por UF (SC) fica documentada como contexto, detalhada de fato no ticket 14.
