# Pesquisa — SQL e semântica do Relatório de Entregas Delphi

## Escopo e classificação

Pesquisa estática, sem implementação, baseada no data module e no frame do
relatório. A fonte informada como `C:\prjetos.vcl` não existe neste checkout;
os arquivos equivalentes foram encontrados em `delphi/apps/entrega/`.

- **CONFIRMADO** — texto, campo, macro, evento ou fluxo expresso no `.pas`/`.dfm`.
- **INFERIDO** — consequência estrutural do SQL/DFM que ainda depende de schema,
  dados ou contrato de domínio.
- **DÚVIDA** — a fonte não permite concluir a nulabilidade, cardinalidade ou
  intenção.
- **NÃO LOCALIZADO** — não há ocorrência nas fontes delimitadas.
- **POSSÍVEL BUG LEGADO** — comportamento observado que não deve ser copiado
  sem decisão explícita.
- **OPORTUNIDADE** — regra de tradução segura para o Laravel.

Fontes primárias consultadas:

| Fonte | Evidência |
| --- | --- |
| `delphi/apps/entrega/dmrelatorioentrega.dfm` | Dataset, SQL, macros, campos persistentes e FastReport, linhas 7–201, 205–320 e 323–790. |
| `delphi/apps/entrega/dmrelatorioentrega.pas` | Expansão de macros, modos, abertura do dataset e impressão, linhas 64–192. |
| `delphi/apps/entrega/fmrelatorioentrega.pas` | Defaults, validação, F9 de regiões e passagem dos filtros, linhas 63–232. |
| `delphi/apps/entrega/fmrelatorioentrega.dfm` | Controles, radio buttons, agrupamento desabilitado e lookup de regiões, linhas 1–183 e 184–506. |
| `delphi/biblio/clparametrossistema.pas` | Padrão geral de leitura de parâmetros por filial, linhas 1889–1909 e 3157–3247. |

## SQL efetivo do dataset

### Texto armazenado no DFM

**CONFIRMADO** — `qryRelatorioEntrega` usa `TtecQuery` na conexão e transação
globais do Delphi, com `CachedUpdates = False`, e declara sete macros
(`IntervaloDataVenda`, `IntervaloDataEntrega`, `ListaClientes`,
`ListaFornecedoresTransporte`, `ListaRegioes`, `CondicaoEntregue` e
`CondicaoemAberto`). Evidência: `dmrelatorioentrega.dfm:7-52`.

O SQL, removidas somente as concatenações de strings do DFM, é:

```sql
SELECT Selecao.*,
       Quantidade - QuantidadeEntregue AS aEntregar,
       COALESCE(r.Nome, CAST('NÃO DEFINIDA' AS VARCHAR(30))) AS NomeRegiao
FROM (
    SELECT ct.Numero AS Contrato,
           ct.Cliente,
           ct.TipoCliente,
           vf.Nome AS NomeCliente,
           COALESCE(ct.EntRua, ct.Rua) AS EntRua,
           COALESCE(ct.EntNumero, ct.EndNumero) AS EntNumero,
           COALESCE(ct.EntComplemento, ct.EndComplemento) AS EntComplemento,
           COALESCE(ct.EntCEP, ct.CEP) AS EntCEP,
           COALESCE(ct.EntEstado, ct.Estado) AS EntEstado,
           COALESCE(ct.EntCidade, ct.Cidade) AS EntCidade,
           COALESCE(ct.EntBairro, ct.Bairro) AS EntBairro,
           b.Nome AS NomeBairroEntrega,
           d.Nome AS NomeCidadeEntrega,
           pc.dataentrega,
           diadasemana(pc.dataentrega) AS nomediasemana,
           ct.EmitirNotaDepoisDe,
           ct.Faturamento,
           ct.FilialVenda,
           ct.MontagemObs,
           pc.Produto,
           p.Descricao AS DescricaoProduto,
           pc.Quantidade,
           CASE WHEN ct.Situacao = 'F' /* Faturado */
                THEN 0
                ELSE COALESCE(
                    (SELECT SUM(pdf.Quantidade)
                       FROM ProdutosDadosFiscais pdf
                       JOIN RomaneiosNotas rn
                         ON pdf.DadoFiscal = rn.DadoFiscal
                        AND rn.Entrega >= ct.Data
                        AND rn.Entrega IS NOT NULL
                      WHERE pdf.Produto = pc.Produto),
                    0)
           END AS QuantidadeEntregue,
           b.Regiao AS CodigoRegiao
    FROM Contratos ct
    JOIN vFornecedores vf
      ON ct.Cliente = vf.Codigo
     AND ct.TipoCliente = vf.Tipo
    JOIN ProdutosContratos pc
      JOIN Produtos p
        ON pc.Produto = p.Codigo
      ON ct.Numero = pc.Contrato
    LEFT JOIN Bairros b
      ON b.Estado = COALESCE(ct.EntEstado, ct.Estado)
     AND b.Cidade = COALESCE(ct.EntCidade, ct.Cidade)
     AND b.Codigo = COALESCE(ct.EntBairro, ct.Bairro)
    LEFT JOIN Cidades d
      ON d.Estado = COALESCE(ct.EntEstado, ct.Estado)
     AND d.Codigo = COALESCE(ct.EntCidade, ct.Cidade)
    LEFT JOIN (
        DadosFiscais df
        JOIN RomaneiosNotas rn
          JOIN Romaneios r
            JOIN vFornecedores vft
              ON r.Fornecedor = vft.Codigo
             AND vft.Tipo = 'F'
          ON rn.Romaneio = r.Numero
        ON df.Numero = rn.DadoFiscal
    )
      ON ct.Numero = df.Contrato
     AND df.Situacao = 'N'
    WHERE TRUE
      %IntervaloDataVenda
      %IntervaloDataEntrega
      AND pc.Entrega = 'S'
      AND ct.Situacao IN ('F', 'N', 'P')
      %ListaClientes
      %ListaFornecedoresTransporte
      %ListaRegioes
      AND ct.Cliente = vf.Codigo
      AND ct.TipoCliente = vf.Tipo
      AND ct.Numero = pc.Contrato
      AND pc.Produto = p.Codigo
) AS Selecao
LEFT JOIN Regioes r
  ON Selecao.CodigoRegiao = r.Codigo
WHERE TRUE
  %CondicaoEntregue
  %CondicaoEmAberto
ORDER BY r.Nome,
         r.Codigo,
         EntEstado,
         NomeCidadeEntrega,
         EntCidade,
         NomeBairroEntrega,
         EntBairro,
         EntCEP,
         EntRua,
         EntNumero,
         EntComplemento,
         Contrato,
         NomeCliente,
         Cliente,
         TipoCliente;
```

**CONFIRMADO** — o texto acima corresponde a `dmrelatorioentrega.dfm:53-201`.
As condições comentadas em `dmrelatorioentrega.dfm:177-182` não são executadas.

### Projeção

**CONFIRMADO** — `Selecao.*` contém estas colunas internas:

`Contrato`, `Cliente`, `TipoCliente`, `NomeCliente`, `EntRua`, `EntNumero`,
`EntComplemento`, `EntCEP`, `EntEstado`, `EntCidade`, `EntBairro`,
`NomeBairroEntrega`, `NomeCidadeEntrega`, `dataentrega`, `nomediasemana`,
`EmitirNotaDepoisDe`, `Faturamento`, `FilialVenda`, `MontagemObs`, `Produto`,
`DescricaoProduto`, `Quantidade`, `QuantidadeEntregue` e `CodigoRegiao`.

A projeção externa acrescenta `aEntregar` e `NomeRegiao`. Os tipos/formatação
persistentes confirmam números de cliente/quantidade, datas de faturamento,
emissão posterior e entrega, e textos de endereço, cliente, produto, região e
observação em `dmrelatorioentrega.dfm:205-312` e na declaração Pascal
`dmrelatorioentrega.pas:12-40`.

**INFERIDO** — a unidade natural da linha é um registro de
`ProdutosContratos` (contrato × produto), mas o SQL não fornece uma chave de
linha nem inclui `df.numero`, `rn.romaneio` ou `vft.codigo` na projeção.

## Macros e filtros

### Período de entrega

**CONFIRMADO** — `ImprimirRelatorio` expande:

| Entrada | Macro gerada | Cabeçalho |
| --- | --- | --- |
| inicial + final | `and pc.dataentrega between 'YYYY-MM-DD' and 'YYYY-MM-DD'` | `ENTREGAS ENTRE: ... E ...` |
| somente inicial | `and pc.dataentrega >= 'YYYY-MM-DD'` | `ENTREGA SUPERIOR A ...` |
| somente final | `and pc.dataentrega <= 'YYYY-MM-DD'` | `ENTREGAS ATÉ ...` |
| ambas vazias | string vazia | nenhum trecho |

Evidência: `dmrelatorioentrega.pas:72-95`. O frame inicializa a data de
entrega como `Date` e a final como `incWeek(Date)` em
`fmrelatorioentrega.pas:115-116`; se as duas forem apagadas, a validação bloqueia
a impressão em `fmrelatorioentrega.pas:216-222`.

**POSSÍVEL BUG LEGADO** — a data é convertida de texto para `TDateTime`,
reformatada e interpolada em SQL; a tradução não deve reproduzir isso. Usar
bindings de data (`>=`, `<=` e intervalo inclusivo conforme o tipo da coluna),
validar ordem/fuso no backend e definir explicitamente o comportamento de
intervalos vazios.

### Período de venda

**CONFIRMADO** — tem a mesma tabela de expansão, mas usa `ct.data` e os textos
`VENDAS ENTRE`, `VENDA SUPERIOR A` e `VENDAS ATÉ`. Evidência:
`dmrelatorioentrega.pas:98-121`.

### Clientes

**CONFIRMADO** — quando `ListaClientes` não está vazia, o Delphi monta
`and (` + `ListaClientes` + `)`; quando vazia, remove a macro. A origem é
`fraSelecaoAleatoriaClientes1.ListaCondicionalComTipo`, passada pelo frame em
`fmrelatorioentrega.pas:224-231`, e a expansão está em
`dmrelatorioentrega.pas:124-130`.

**POSSÍVEL BUG LEGADO** — a entrada é uma expressão SQL textual, não uma lista
tipada. No Laravel, aceitar somente um DTO de predicados com campos,
operadores e lógica em allow-list; cada valor deve ser binding. Para seleção de
IDs, usar `IN (...)` com bindings ou `= ANY(?::integer[])`. Não aceitar SQL,
nome de coluna ou operador vindo diretamente do browser.

### Fornecedores de transporte

**CONFIRMADO** — quando presente, o Delphi monta
`and (` + `StringReplace(ListaFornecedoresTransporte, 'vf.', 'vft.', all)` + `)`;
quando vazio, remove a macro. Evidência: `dmrelatorioentrega.pas:132-139`.
O frame configura a consulta de fornecedor com `TipoPesquisa =
pesFORNECEDORESTRANSPORTE`, `TipoCliente = 'F'`, `Tipovfornecedor = 'F'` e
consulta de todos em `fmrelatorioentrega.pas:119-123`.

**OPORTUNIDADE** — como `vft` só é necessário para filtrar e não é projetado,
traduzir por `EXISTS` correlacionado ou por uma relação pré-agregada de
fornecedores, evitando que vários documentos/romaneios do contrato gerem
duplicatas. A identidade do fornecedor deve continuar sendo
`codigo + tipo = 'F'`.

### Regiões

**CONFIRMADO** — uma lista não vazia vira:

```sql
and ((b.regiao in (<lista textual>)) or (d.regiao in (<lista textual>)))
```

e uma lista vazia remove a macro (`dmrelatorioentrega.pas:141-147`). A seleção
de regiões é um dataset inicial `select r.* from regioes r where false`
(`fmrelatorioentrega.dfm:93-99`), com código editável, nome somente leitura e
lookup `Regiões` (`fmrelatorioentrega.pas:63-112`).

**DÚVIDA** — a fonte usa `d.regiao` embora `d` seja o alias de `Cidades`, e o
resultado usa `b.Regiao` como `CodigoRegiao`; é necessário confirmar no schema
qual tabela possui a região efetiva e se o caminho por cidade é intencional.
Não corrigir essa assimetria por suposição.

**OPORTUNIDADE** — normalizar códigos em array tipado e emitir
`b.regiao = ANY(?::...) OR d.regiao = ANY(?::...)`, ou uma única lista de
bindings compatível com o tipo real. Array explicitamente vazio deve significar
conjunto vazio quando a seleção for explícita; não gerar `IN ()`.

### Situação

**CONFIRMADO** — o frame tem um `TRadioGroup` com `ItemIndex = 0` e opções
`EM ABERTO`/`ENTREGUE` (`fmrelatorioentrega.dfm:148-166`). Antes da consulta o
Delphi limpa as duas macros:

```text
CondicaoEntregue = ''
CondicaoemAberto = ''
```

(`dmrelatorioentrega.pas:149-150`). Para índice `0`, ele expande
`CondicaoemAberto` para `and (quantidade - quantidadeentregue) > 0` e define o
título `RELAÇÃO DE PRODUTOS A ENTREGAR`; para índice `1`, expande para
`and quantidadeentregue > 0` e define `RELAÇÃO DE PRODUTOS ENTREGUES`
(`dmrelatorioentrega.pas:154-164`). O SQL usa `%CondicaoEntregue` e
`%CondicaoEmAberto` em `dmrelatorioentrega.dfm:191-201`.

**DÚVIDA** — a macro declarada como `CondicaoemAberto` e a referência SQL
`CondicaoEmAberto` diferem em capitalização; o componente pode tratar nomes sem
distinção, mas isso não foi validado aqui.

**POSSÍVEL BUG LEGADO** — `CondicaoEntregue` nunca recebe conteúdo; os dois
modos dependem de uma macro de nome diferente do rótulo. No Laravel, modelar
`status_mode` como enum fechado, gerar a condição diretamente sobre a projeção
numérica e cobrir ambos os cenários com testes de paridade. Não deixar o usuário
enviar uma condição SQL.

### Agrupamento

**CONFIRMADO** — o grupo `AGRUPAMENTO` existe mas está `Visible = False`, com
checkboxes de regiões e clientes (`fmrelatorioentrega.dfm:102-147`). Não há
leitura desses checkboxes em `InternoImpressao`; eles não alteram o SQL
(`fmrelatorioentrega.pas:205-231`).

## Quantidades e cardinalidade

### Quantidade contratada

**CONFIRMADO** — `Quantidade` é `pc.Quantidade`, e `aEntregar` é calculado como
`Quantidade - QuantidadeEntregue` na consulta externa (`dmrelatorioentrega.dfm:54-55,
94-117`). O modo aberto testa `aEntregar > 0`; o modo entregue testa
`QuantidadeEntregue > 0`.

### Quantidade entregue

**CONFIRMADO** — para contrato com `ct.Situacao = 'F'`,
`QuantidadeEntregue = 0`. Para qualquer outra situação permitida (`N` ou `P`),
é a soma de `pdf.Quantidade` para o mesmo `pdf.Produto = pc.Produto`, ligada a
`rn.DadoFiscal = pdf.DadoFiscal`, somente onde `rn.Entrega >= ct.Data` e
`rn.Entrega IS NOT NULL`; `COALESCE(..., 0)` fecha ausência em zero
(`dmrelatorioentrega.dfm:98-119`).

**POSSÍVEL BUG LEGADO** — a subconsulta não relaciona `rn`/`pdf` ao contrato
atual, cliente ou documento fiscal do contrato; correlaciona apenas produto e
data de corte. Assim, entregas de outros contratos com o mesmo produto podem
ser somadas. Também não há `GROUP BY` por contrato/produto na subconsulta.
Esse comportamento deve ser preservado como observação de paridade, não como
regra de domínio aprovada.

**OPORTUNIDADE** — no Laravel, primeiro decidir com evidência do schema qual é
a unidade correta da entrega (contrato, documento fiscal, romaneio e produto).
Depois calcular todos os saldos em uma CTE/pré-agregação set-based, com a chave
da unidade explícita, e fazer um único join ao conjunto de linhas. Não fazer
uma consulta de entregas por linha nem somar somente por produto sem declarar
essa semântica.

### Riscos de multiplicação

**CONFIRMADO** — o caminho principal é `Contratos → ProdutosContratos →
Produtos`, com `vFornecedores` por cliente/tipo; regiões são enriquecimentos
por bairro/cidade e há uma subárvore opcional `DadosFiscais → RomaneiosNotas →
Romaneios → vFornecedores`. Evidência: `dmrelatorioentrega.dfm:122-158`.

**INFERIDO** — se um contrato tiver mais de um `DadosFiscais` ativo (`df.Situacao
= 'N'`) ou mais de um romaneio/documento relacionado, o `LEFT JOIN` aninhado
pode devolver várias cópias da mesma linha contrato × produto, porque nenhum
campo de `df`, `rn`, `r` ou `vft` é projetado para distinguir as cópias.

**DÚVIDA** — a cardinalidade de `Bairros`, `Cidades`, `Regioes`,
`vFornecedores` e da relação de documentos não pode ser provada sem o snapshot
dessas tabelas. O snapshot existente de Romaneios confirma chaves e
nulabilidade de parte do domínio, mas não autoriza presumir todas as
cardinalidades desta consulta.

**OPORTUNIDADE** — usar `EXISTS` quando o relacionamento serve somente como
filtro; pré-agregar relações 1:N antes do join; e definir a chave de unicidade
da linha. Se o contrato exigir uma linha por contrato × produto, testar essa
unicidade em dados dourados e rejeitar qualquer SQL que a viole.

### Nulabilidade e tipo de join

**CONFIRMADO** — o legado usa `LEFT JOIN` para `Bairros`, `Cidades`, a subárvore
fiscal/romaneio e `Regioes`; usa `JOIN` para cliente/fornecedor e
produto/contrato/produto. Evidência: `dmrelatorioentrega.dfm:122-158,
187-189`.

**OPORTUNIDADE** — o Laravel deve conferir o schema versionado antes de finalizar
a consulta: se os campos de junção forem `NOT NULL` e a ausência não for caso
funcional, usar `INNER JOIN`; manter `LEFT JOIN` apenas para enriquecimento
opcional cuja nulabilidade/órfão seja parte do contrato. Não inferir `LEFT JOIN`
pela cópia Delphi. Não testar driver, `hasTable` ou `Schema::has*` em runtime.

## Ordenação

**CONFIRMADO** — a ordenação é ascendente implícita por região, endereço,
contrato e cliente:

```text
r.Nome, r.Codigo, EntEstado, NomeCidadeEntrega, EntCidade,
NomeBairroEntrega, EntBairro, EntCEP, EntRua, EntNumero, EntComplemento,
Contrato, NomeCliente, Cliente, TipoCliente
```

Evidência: `dmrelatorioentrega.dfm:197-201`.

**INFERIDO** — `Produto` não está no `ORDER BY`, portanto a ordem entre vários
produtos da mesma chave de endereço/contrato/cliente não é determinística. O
grid/relatório Laravel deve usar catálogo de colunas allow-list e acrescentar
um desempate estável compatível com a chave de linha; não interpolar a coluna
recebida do browser.

## FastReport e saída

**CONFIRMADO** — `frpRelatorioEntrega` usa `fdsRelatorioEntrega`, cujo dataset é
`qryRelatorioEntrega`, e chama `frpRelatorioEntregaBeforePrint`, que aplica
`ZebrarLinhaRelatorio` (`dmrelatorioentrega.dfm:314-320, 791-796`;
`dmrelatorioentrega.pas:187-192`). A impressão só ocorre depois de abrir o
dataset; vazio produz aviso e resultado não vazio chama
`ImprimirRelatoriofast` (`dmrelatorioentrega.pas:167-183`).

O FastReport armazenado no DFM contém agrupamentos por região/código, estado +
cidade, endereço e cliente/tipo, além de campos de cliente, endereço, produto,
quantidades, contrato, faturamento, filial, data para emissão de NF,
observação, entrega e dia da semana. As expressões estão serializadas no bloco
`ReportForm` em `dmrelatorioentrega.dfm:323-789`; exemplos legíveis incluem o
grupo de região em `:334-339`, estado/cidade em `:340-346`, cliente/tipo em
`:356-360`, produto/descrição em `:430-445`, quantidade textual de entrega em
`:447-450`, contrato/faturamento/filial em `:727-758`, observação em `:766-774`
e entrega/dia da semana em `:775-784`.

**CONFIRMADO** — o relatório usa variáveis `Titulo`, `Outras` e `emAberto` no
DFM (`:712-718, :786-789`); o Pascal define `Outras` com os filtros e `Titulo`
por modo (`dmrelatorioentrega.pas:70-77, 98-117, 152-164`).

**POSSÍVEL BUG LEGADO / DÚVIDA** — o frame não atribui explicitamente a variável
FastReport `emAberto`; o DFM contém valor inicial `True`. Confirmar no runner
FastReport antes de afirmar que a legenda textual troca corretamente entre
`A ENTREGAR` e `JÁ ENTREGUE`. O Laravel deve usar um único DTO de resultado
para grid, visualização e exportação, com título/modo calculados no backend,
sem copiar a dependência de estado global do relatório.

## Parâmetros de sistema

**NÃO LOCALIZADO** — não há chamada a `parametros_valor(...)`, nem chave de
parâmetro de sistema, em `dmrelatorioentrega.pas/.dfm` ou
`fmrelatorioentrega.pas/.dfm`. A unit declara apenas os componentes básicos e
`dmrelatorioentrega.pas:5-8` não importa `clparametrossistema` diretamente.

**CONFIRMADO** — o padrão geral do legado em `clparametrossistema.pas` lê
`parametrosfiliais`, completa parâmetros sem valor filial a partir de
`parametros`, e ordena por parâmetro/filial em `ParametrosSistemasSQL`
(`clparametrossistema.pas:1889-1909`). `TtecParametrosSistema.Ler` abre esse
dataset, consolida valores por nome e filial e carrega texto auxiliar
(`clparametrossistema.pas:3157-3195`).

**OPORTUNIDADE** — não inventar um `parametros_valor('', '')` para esta tela.
Se uma decisão posterior descobrir parâmetro necessário, mapear a chave
existente para o serviço de parâmetros do Laravel, resolver no backend com
escopo de Filial e registrar default/ausência. A pesquisa de schema deve ser
versionada no repositório, não executada via introspecção durante a consulta.

## Regras de tradução Laravel para o prompt

1. Preservar a projeção e os textos de situação, mas transformar datas,
   estados, clientes, fornecedores e regiões em filtros tipados e allow-listed.
2. Usar bindings para todos os valores. Para coleções, usar `IN` com placeholders
   gerados pelo driver/query builder ou `= ANY(?::tipo[])`; definir explicitamente
   o caso de coleção vazia e nunca montar `IN ()`.
3. Converter filtros condicionais de cliente/fornecedor em AST/DTO seguro;
   jamais aceitar a expressão SQL legada como request.
4. Evitar N+1: uma consulta set-based, ou fases set-based limitadas, com
   pré-agregação de quantidades entregues e relações 1:N. Não consultar
   fornecedor, bairro, cidade, região ou saldo em loop por linha.
5. Preferir `EXISTS` para testar existência de documento/fornecedor/região sem
   projetar seus campos; usar `INNER JOIN` quando o snapshot provar
   obrigatoriedade e `LEFT JOIN` somente quando a nulabilidade justificar.
6. Definir uma chave de linha e uma ordenação determinística. O catálogo de
   ordenação deve ser servidor-side e terminar com desempate estável.
7. O F6 deve publicar o mesmo conjunto no grid e na saída do relatório; o botão
   Cancelar deve aparecer antes do primeiro `await` e cancelar a query
   PostgreSQL real, conforme o contrato compartilhado do mapa.
8. O SpecKit deve inspecionar somente o checkout Laravel atual para localizar
   seams, runner de cancelamento, grid/exportação e snapshot de schema. Não
   pedir que a implementação reabra fontes Delphi, teste driver ou faça
   `hasTable`/`Schema::has*`.

## Lacunas que bloqueiam uma SQL final

- schema e cardinalidade autoritativos de `Contratos`, `ProdutosContratos`,
  `Produtos`, `Bairros`, `Cidades`, `Regioes`, `DadosFiscais`,
  `ProdutosDadosFiscais` e as chaves de `RomaneiosNotas` usadas pela consulta;
- regra de domínio que vincula uma entrega ao contrato/produto, em vez do
  somatório legado somente por produto e data;
- tipo real de `Regiao` em bairro/cidade e nulabilidade dos campos de endereço;
- contrato do FastReport para a variável `emAberto`;
- catálogo Laravel para a chave de linha, filtros/ordenação e cancelamento.

Essas lacunas devem ser resolvidas por snapshot/inspeção do checkout Laravel e
decisão de domínio nos próximos tickets; não justificam reabrir a fonte Delphi
durante a implementação.
