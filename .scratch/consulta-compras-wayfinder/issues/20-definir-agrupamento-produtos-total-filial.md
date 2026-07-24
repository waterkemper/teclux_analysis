# Definir o agrupamento do grid principal (produto agregado vs. por filial) e corrigir o achado do ticket 03

Type: grilling
Status: resolved
Blocked by:

## Question

No Delphi, os produtos no grid principal "Produtos dos Grupos de Filiais" (`qryComprasTotal`) nunca aparecem repetidos — mesmo quando nenhuma filial está filtrada (o que significa analisar o grupo inteiro). No Laravel, os produtos estão aparecendo repetidos por filial. Qual é o mecanismo exato no Delphi que controla isso, é a seleção de filial que decide, e quais operações mudam de comportamento conforme o filtro de filial? Verificar o código atual do Laravel para elaborar a correção da query.

## Answer

### Correção ao ticket 03 — "nenhuma marcada" NÃO é uma ambiguidade preservada, é comportamento deliberado (CONFIRMADO)

O ticket [Definir parâmetros de Filial/Grupo Filial e filtro de produtos](03-definir-parametros-filial-grupo-filial-filtro-produtos.md) registrou como "POSSÍVEL BUG LEGADO" o fato de `TodasFiliais` ficar `False` quando nenhuma filial é marcada — mas essa leitura parou no meio da função. `MontarFiltroFiliais` (`dmconsultacompras.pas:2117-2158`) tem, **depois do loop**, estas duas linhas que a investigação anterior não chegou a ler:

```pascal
if (Trim(STRFiliais) = '') then
  TodasFiliais := true;
```

Ou seja: se **nenhuma** filial foi marcada, `STRFiliais` fica vazio e `TodasFiliais` é explicitamente **revertido para `True`** — exatamente o comportamento que o usuário descreveu ("se não seleciono nenhuma filial, quer dizer que estou analisando o grupo inteiro"). `Filial` (a variável que alimenta a macro SQL) também fica `''` nesse caso — o mesmo resultado de quando **todas** as filiais estão marcadas. **Não há ambiguidade nem bug**: "nenhuma marcada" e "todas marcadas" produzem deliberadamente o mesmo estado (`Filial=''`, sem restrição) — só "algumas, mas não todas, marcadas" produz uma lista explícita. **Correção ao registro do ticket 03**: remover a classificação de "possível bug legado" — é comportamento confirmado e intencional.

### O que controla se o grid principal agrega por produto ou mostra uma linha por filial — CONFIRMADO, e não é a seleção de filial

A pergunta original supôs que a seleção de filial decidia o agrupamento. **Não é isso** — é um macro SQL (`Agrupamento`) cujo valor depende de **`UsarTabelaRedutora`** (o checkbox "Usar Tabela Redutora", ticket 06), lido em `qryComprasTotalBeforeOpen` (`dmconsultacompras.pas:4769-4785`):

```pascal
if qryComprasTotal.ParamByName('UsarTabelaRedutora').asBoolean then
begin
  qryComprasTotal.Macrobyname('Agrupamento').AsString := '';
  qryComprasTotal.Macrobyname('Campo_ListaFiliais').AsString := 'string_agg(cast(e.filial as varchar), '','') as ListaFiliais';
end
else
begin
  qryComprasTotal.Macrobyname('Agrupamento').AsString := 'e.filial,';
  qryComprasTotal.Macrobyname('Campo_ListaFiliais').AsString := 'cast(e.filial as varchar) as ListaFiliais';
end;
```

A SQL de `qryComprasTotal` (`dmconsultacompras.dfm:6-...`) lê `FROM estoques e` (uma linha por filial) e agrega com `SUM(e.emestoque)`, `SUM(e.transito)`, `SUM(e.reservado)`, `SUM(e.minimo)`, `SUM(maximo)`, etc., fechando com `group by p.produto, %Agrupamento p.datacadastro, p.linha, p.coluna, ...` (`:945-994` — nenhum campo de filial fixo nessa lista, só o que a macro insere).

- **`UsarTabelaRedutora = true`** → `Agrupamento = ''` → `GROUP BY` só por atributos do produto → **uma linha por produto**, com todos os `SUM(...)` somando através de **todas as filiais no escopo** (não importa se é 1, várias ou nenhuma marcada = grupo inteiro). `ListaFiliais` vira uma lista concatenada (`string_agg`) de todas as filiais que contribuíram. **A fórmula da sugestão em si roda sobre esses totais agregados** — não é só um agrupamento de exibição, é o que ticket 07 já tinha identificado (achado #5, "usando os números agregados entre todas as filiais/grupo... quando `:UsarTabelaRedutora` está ativo") — este ticket confirma o mecanismo exato por trás daquele achado.
- **`UsarTabelaRedutora = false`** → `Agrupamento = 'e.filial,'` → `GROUP BY` inclui `e.filial` → **uma linha por produto×filial** (cada filial no escopo gera sua própria linha, com seus próprios números, sem soma entre filiais). `ListaFiliais` vira só o código daquela filial.

Ou seja: no Delphi, "nunca aparece repetido" é a experiência de quem usa a tela com **Tabela Redutora ativada** (aparentemente o modo de uso mais comum/esperado) — com ela desativada, o Delphi **também mostra uma linha por filial**, isso é comportamento legítimo, não um bug a evitar.

### Gate de edição ortogonal — `SomenteUmaFilialMarcada` (já existente, mas não conectado ao agrupamento acima)

`SomenteUmaFilialMarcada` (`dmconsultacompras.pas:2144-2146`, `true` só quando exatamente uma filial está marcada — nem zero, nem várias) controla **separadamente** se `minimo`/`maximo` são editáveis no grid principal (`qryComprasTotalminimo.readonly := not SomenteUmaFilialMarcada`, já usado em `07-speckit-prompt-correcao-grid-principal.md` mas **sem essa condição registrada** — correção necessária àquele prompt também). Faz sentido: mesmo com `UsarTabelaRedutora` ativo (uma linha agregada por produto), editar o mínimo/máximo só é seguro/não-ambíguo quando existe exatamente uma filial em jogo — com múltiplas filiais agregadas numa única linha, não haveria "a" filial certa para gravar o novo mínimo.

### Comparação com o Laravel (CONFIRMADO — gap real de agrupamento, não só de exibição)

`LegacyConsultaComprasSugestaoRepository::loadCandidatos()` (`:37-230`) lê `FROM estoques e ... WHERE e.filial IN (:filiaisEfetivas) ... ORDER BY p.codigo, e.filial` **sem nenhum `GROUP BY`** — cada linha do resultado é um par (produto, filial) direto de `estoques`, e `ConsultaComprasSugestaoService::gerar()` (`:140-156`) itera `foreach ($candidatos as $cand)` produzindo **uma `$linha` por candidato** — ou seja, sempre uma linha por produto×filial, **independente do valor de `usar_redutora`**. Existe um `$agregadoPorProduto` (`:119-134`) com `estoque`/`vendido` somados por produto, mas ele só alimenta o cálculo interno de `diasestoque_geral`/lookup da Tabela Redutora (replicando parte do achado #5 do ticket 07) — **não** colapsa as linhas de saída em uma por produto.

**Consequência dupla, não só cosmética**: (1) linhas duplicadas por produto sempre que há mais de uma filial no escopo (inclusive quando "nenhuma filial" marcada = grupo inteiro, que é justamente o caso citado pelo usuário); (2) quando `usar_redutora` está ativo, a própria **sugestão calculada é diferente da do Delphi** — Delphi computaria uma sugestão só, usando estoque/vendido/pedidos somados de todas as filiais do escopo; o Laravel atual computa uma sugestão **por filial**, isolada, e simplesmente lista todas — não é o mesmo número.

### Decisão

Vira um novo prompt de correção (`11`, mesma série): (1) corrigir `loadCandidatos`/`ConsultaComprasSugestaoService` para colapsar em uma linha por produto (somando os campos agregáveis através das filiais do escopo) **quando `usar_redutora` estiver ativo** — replicando `Agrupamento=''`; manter uma linha por produto×filial quando `usar_redutora` estiver desativado — replicando `Agrupamento='e.filial,'`; (2) reconectar a edição de `minimo`/`maximo` à condição "exatamente uma filial selecionada" (`SomenteUmaFilialMarcada`), independente do agrupamento por Tabela Redutora — correção também a `07-speckit-prompt-correcao-grid-principal.md`; (3) remover a classificação de "possível bug legado" do achado de `TodasFiliais` no ticket 03 — é comportamento confirmado, não uma ambiguidade a preservar por decisão.
