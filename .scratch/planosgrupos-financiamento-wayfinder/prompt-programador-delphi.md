# Ajuste da seleção de planos por grupos de produtos no Delphi

Precisamos ajustar a seleção de planos de pagamento no Cadastro de Orçamentos, utilizando corretamente a tabela `planosgrupos`.

## Regra de negócio

Um plano vinculado a grupos de produtos somente pode ser utilizado quando todos os grupos dos produtos do orçamento estiverem contemplados no plano.

Exemplo obrigatório:

- Produto 1 pertence ao grupo `A`;
- Produto 2 pertence ao grupo `B`;
- O plano está vinculado somente ao grupo `A`.

Nesse caso, o plano não pode aparecer na seleção e também não pode ser confirmado ou gravado.

## Situação atual identificada

No Cadastro de Contratos existe o método:

```delphi
TdtmCadastroContratos.MontarListaGruposClasses
```

Esse método percorre `qryProdutosContratos`, obtém a `caracteristica` dos produtos e consulta o grupo em `caracteristicas.grupo`.

Depois, os arrays `Grupos` e `Classes` são enviados para:

```delphi
frmCalculoFinanciamento.DefinirValoresCalculo(...)
```

O filtro efetivo está no método compartilhado:

```delphi
TdtmCalculoFinanciamento.FiltrarGruposClasses
```

Esse método consulta:

```text
planosgrupos
planosclasses
```

e monta a condição aplicada às consultas de planos.

Porém, no Contrato, os arrays `Grupos` e `Classes` ficam armazenados no formulário e podem estar desatualizados quando a tela de parcelas é aberta. Além disso, quando os arrays chegam vazios, o método não aplica filtro.

No Orçamento, a situação é ainda mais incompleta:

- `dmorcamentos.pas/.dfm` não possui uso direto de `planosgrupos`;
- `qryPlanosOrcamentos` consulta apenas os planos já gravados no orçamento;
- `fmorcamentos.pas` chama o cálculo financeiro sem montar os grupos dos produtos;
- em alguns pontos os parâmetros `Grupos` e `Classes` são enviados como `nil`;
- `DefinirParcelas` permite gravar um plano sem validar se ele é compatível com os produtos atuais.

## Alterações necessárias

### 1. Montar os grupos atuais do orçamento

Criar no `dmorcamentos.pas` um método equivalente a:

```delphi
procedure MontarListaGruposClassesOrcamento(
  var Grupos: vString;
  var Classes: vString
);
```

Esse método deve:

- percorrer todas as linhas atuais de `qryProdutosOrcamentos`;
- considerar produtos incluídos, editados, excluídos ou ainda não gravados;
- obter a `caracteristica` de cada produto;
- obter o grupo em `caracteristicas.grupo`;
- montar listas distintas de grupos e classes;
- limpar as listas quando não existirem produtos;
- não depender apenas dos campos visíveis no grid.

A consulta pode seguir a mesma lógica usada no Contrato:

```sql
select grupo as codigo
from caracteristicas
where codigo in (
  select caracteristica
  from produtos
  where codigo in (...)
)
group by grupo
```

Verificar também se a query de produtos do orçamento já possui todos os campos necessários. Atualmente ela possui joins com `caracteristicas` e `grupos`, mas o grupo não está sendo utilizado para filtrar os planos.

### 2. Recalcular imediatamente antes da seleção

Em `fmorcamentos.pas`, antes de chamar:

```delphi
frmCalculoFinanciamento.DefinirValoresCalculo(...)
```

executar obrigatoriamente:

```delphi
dtmOrcamentos.MontarListaGruposClassesOrcamento(
  Grupos,
  Classes
);
```

A chamada deve ocorrer imediatamente antes da abertura da tela de seleção de planos. Não utilizar apenas arrays montados anteriormente em eventos antigos.

### 3. Passar os arrays reais ao cálculo

Passar os arrays calculados para o método compartilhado:

```delphi
frmCalculoFinanciamento.DefinirValoresCalculo(
  ...,
  Parcelas,
  Grupos,
  Classes,
  ...
);
```

Não deixar `Grupos` e `Classes` como `nil` ou com valores antigos.

### 4. Atualizar após alterações nos produtos

Atualizar as listas depois das operações que alteram produtos:

- inclusão de produto;
- edição de produto;
- exclusão de produto;
- importação de produtos;
- cópia de produtos;
- conversão de orçamento;
- recálculo dos totais;
- abertura da tela de parcelas.

### 5. Validar também na gravação

Não basta esconder o plano da consulta. Antes de gravar em:

```delphi
DefinirParcelas
```

validar novamente se o plano selecionado atende aos grupos/classes atuais do orçamento.

Isso é necessário porque o usuário pode:

- manter uma tela antiga aberta;
- selecionar um plano antes de alterar os produtos;
- enviar um código de plano que não esteja mais na lista;
- alterar produtos enquanto as parcelas já estão gravadas.

Criar uma função centralizada, por exemplo:

```delphi
function PlanoAtendeProdutos(
  Plano: Integer;
  Grupos: vString;
  Classes: vString
): Boolean;
```

Essa validação deve ser utilizada tanto na exibição quanto na confirmação e gravação.

### 6. Corrigir a regra do filtro

A regra deve considerar todos os grupos distintos dos produtos.

| Grupos dos produtos | Grupos do plano | Resultado |
|---|---|---|
| A | A | Permitido |
| A | A, B | Permitido |
| A | B | Bloqueado |
| A, B | A | Bloqueado |
| A, B | A, B | Permitido |
| A, A | A | Permitido |

O valor do produto não deve influenciar essa regra. Um produto de R$ 5.000,00 e outro de R$ 1,00 devem ter o mesmo peso na validação dos grupos.

### 7. Tratar produto sem grupo

Não considerar uma lista vazia como ausência de restrição automaticamente.

Diferenciar as situações:

- plano sem vínculos em `planosgrupos` e `planosclasses`: possível plano irrestrito;
- orçamento com produto sem grupo/classe: produto cuja elegibilidade não pôde ser determinada;
- orçamento sem produtos: não deve permitir cálculo de parcelas.

A decisão esperada deve ser documentada, mas um plano restrito não deve ser liberado simplesmente porque o grupo do produto não foi encontrado.

### 8. Validar plano padrão e venda à vista

Verificar também os caminhos que utilizam diretamente:

```delphi
ParSistema.PlanoOrcamentoPadrao
ParSistema.PlanoVendaVista
```

Atualmente esses planos podem ser aplicados diretamente, sem passar pela validação dos grupos.

Antes de gravar o plano padrão ou o plano à vista, validar sua compatibilidade com os produtos atuais.

### 9. Comparação com Contratos

Usar `fmcadastrocontratos.pas` e `dmcadastrocontratos.pas` como referência para a montagem dos grupos, especialmente:

```delphi
TdtmCadastroContratos.MontarListaGruposClasses
```

Porém, não copiar o comportamento atual sem correção, pois no Contrato os arrays podem estar desatualizados. A recomposição deve ocorrer no momento do cálculo e também antes da gravação.

## Testes obrigatórios

Validar manualmente ou criar testes para:

1. Plano vinculado ao mesmo grupo do produto: deve aparecer.
2. Plano vinculado a grupo diferente: não deve aparecer.
3. Dois produtos dos grupos A e B, plano vinculado apenas ao grupo A: não deve aparecer.
4. Dois produtos do mesmo grupo A: deve aparecer se o plano estiver vinculado ao grupo A.
5. Produto sem grupo: comportamento deve ser explícito e documentado.
6. Plano sem registros em `planosgrupos`: validar se deve ser considerado irrestrito.
7. Alterar o produto depois de abrir a tela de parcelas.
8. Excluir o produto que tornava o plano compatível.
9. Tentar gravar manualmente um plano incompatível.
10. Plano padrão e plano de venda à vista incompatíveis.

## Arquivos principais

```text
delphi/apps/vendas/dmorcamentos.pas
delphi/apps/vendas/dmorcamentos.dfm
delphi/apps/vendas/fmorcamentos.pas
delphi/apps/vendas/fmorcamentos.dfm
delphi/apps/vendas/dmcadastrocontratos.pas
delphi/apps/vendas/dmcadastrocontratos.dfm
delphi/apps/vendas/fmcadastrocontratos.pas
delphi/repositorio/dmcalculofinanciamento.pas
delphi/repositorio/dmcalculofinanciamento.dfm
```

