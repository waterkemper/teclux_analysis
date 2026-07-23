# Definir parâmetros de Filial/Grupo Filial e filtro de produtos

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como migrar a aba Parâmetros — seleção de Filial e Grupo Filial (com listas de marcação múltipla), o filtro de produtos (sem reaproveitar a Busca Assistida, descartada por decisão do usuário — avaliar o precedente mais simples de `modules/estoque/consulta-estoques`), o período de vendas (datas inicial/final ou número de dias), e as opções auxiliares (estoque para N dias, inclusão de produtos em linha/fora de linha/com ou sem montagem/brinde/ativo/composto, filtros por conceito e por grupo de fornecedores)?

## Answer

### Filtro de produtos: seguir o padrão da Consulta de Estoques

DECISÃO: o filtro de produtos desta tela replica a arquitetura já usada pela Consulta de Estoques (`ConsultaEstoquesParameterManifest`, `GerarConsultaEstoquesRequest`, filtros nativos por cadastro — Item de Produto, Grupo, Classe, Marca, Modelo, Promoção, e os equivalentes aos `tstSelecaoAleatoria*` do Delphi: CST/CSOSN, Lista Padronizada, Localizações de Estoque, Lotes, Atributos, Serviços), sem componente compartilhado — cada Consulta constrói sua própria Parameter Manifest/Request seguindo essa mesma estrutura. Busca Assistida confirmadamente não entra.

### Filial/Grupo Filial: comportamento do Delphi mantido como está (inclusive a ambiguidade)

CONFIRMADO (`MontarFiltroFiliais`, `dmconsultacompras.pas:2117-2142`): a variável `TodasFiliais` só fica `True` quando **todas** as filiais da lista estão marcadas; o loop marca `TodasFiliais := False` a cada filial desmarcada encontrada — inclusive no caso em que **nenhuma** filial está marcada (toda a lista cai no `else`), produzindo `STRFiliais` vazio e `TodasFiliais = False`. POSSÍVEL BUG LEGADO: o nome da variável sugere a intenção "nenhuma marcada = todas", mas a lógica implementada não faz essa distinção — o caso "nenhuma marcada" e o caso "algumas desmarcadas" são tratados de forma idêntica (`TodasFiliais=False`, filtro por lista explícita, que fica vazia no primeiro caso).

**DECISÃO DO USUÁRIO**: manter o comportamento do Delphi exatamente como está, sem corrigir a ambiguidade — o Laravel replica fielmente `TodasFiliais`/`STRFiliais` tal como evidenciado, incluindo o caso de lista vazia quando nenhuma Filial está marcada. Grupo Filial (`MontarFiltroGrupoFiliais`) segue a mesma lógica, espelhada.

### Período de vendas

CONFIRMADO (`edtDataInicialExit`/`edtDataFinalExit`/`edtNumerodediasExit`, `fmconsultacompras.pas`): datas inicial/final e número de dias são campos com recálculo bidirecional automático — preencher o número de dias recalcula a data inicial a partir da final (ou de hoje, se a final estiver vazia); preencher/alterar qualquer uma das datas recalcula o número de dias. Este comportamento de auto-cálculo é preservado.

### Estoque para N dias

Campo distinto do período de vendas — define quantos dias de cobertura futura de estoque a sugestão deve considerar (consumido pelo ticket [Definir o cálculo de estoque disponível](05-definir-calculo-estoque-disponivel.md)).

### Opções auxiliares de produto e fornecedor

Filtros de inclusão/exclusão por status do produto (em linha/fora de linha, com/sem montagem, brinde/não brinde, ativo/inativo, composto/não composto) e por Grupos de Fornecedores e Conceitos (`qryConceitos` — `ConceitoVenda` já existe como Model no Laravel, reaproveitar) fazem parte da mesma Parameter Manifest desta tela, sem lógica adicional além de filtros de igualdade/pertencimento simples.
