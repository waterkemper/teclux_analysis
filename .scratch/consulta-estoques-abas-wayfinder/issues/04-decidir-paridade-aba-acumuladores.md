Type: task
Status: resolved
Blocked by: 01, 02

## Answer

### Decisão

A aba Acumuladores continuará lazy e gerencial, identificada por `produto + filial`. O Laravel pode manter a tabela combinada atual — Período, Compras e Vendas — em vez dos dois grids do Delphi, porque preserva a informação com melhor leitura. A semântica deve ser corrigida: classificação pelo snapshot `movimentos.operacao`, agregação SQL mensal, sinais legados e ausência de linhas artificiais.

### Fonte e escopo

- Fonte única: `movimentos`.
- Filtro obrigatório: `movimentos.produto = :produto AND movimentos.filial = :filial`.
- Não juntar `tiposmovimentos` para determinar Compra/Venda. `tipomovimento` é cadastro mutável; a operação histórica é `movimentos.operacao` gravada no lançamento.
- A Filial da URL deve ser autorizada e deve existir a relação Produto+Filial em `estoques`, igual às demais abas de detalhe. Isso impede exibir histórico de um Produto sob uma Filial sem vínculo de estoque.
- Não usar Filial ativa da sessão no lugar da Filial selecionada.

### Classificação e sinais

PostgreSQL conta posições a partir de 1:

- Venda: caractere 13, `substr(movimentos.operacao, 13, 1)`.
- Compra: caractere 14, `substr(movimentos.operacao, 14, 1)`.
- Somente `+` e `-` participam da respectiva série; vazio, string curta ou outro símbolo não cria valor nela.

Para equivalência literal com as queries Delphi:

- Venda `+`: `abs(quantidade)`; Venda `-`: `-quantidade`.
- Compra `+`: `quantidade`; Compra `-`: `-abs(quantidade)`.

Não aplicar sinal novamente no PHP/React. Como o legado não normaliza os dois ramos de modo simétrico, os testes devem incluir quantidade positiva e negativa para congelar a equivalência. Uma futura normalização de dados é outro esforço, não parte desta paridade.

### Agregação e período

- Agregar no banco por mês civil e Filial, usando a data do movimento. O bucket canônico é `date_trunc(''month'', movimentos.data)::date`.
- Ordenar por bucket decrescente; não ordenar por texto formatado.
- O JSON usa `ano_mes` em `YYYY-MM` para identidade estável e inclui `filial`, `compras` e `vendas` numéricos.
- A UI apresenta `MM/YYYY`, Filial, Compras e Vendas. Mesmo constante, Filial deve ser explícita para paridade e confirmação visual do escopo.
- Mesclar as duas séries por mês no backend/SQL: mês com somente Compra recebe Vendas `0.0`; mês com somente Venda recebe Compras `0.0`.
- Não criar meses sem qualquer Compra/Venda classificável. Movimentos irrelevantes não podem gerar linha `0/0`.
- Não há filtro de intervalo no Delphi; portanto, por padrão, considerar todo o histórico do Produto+Filial. Um filtro temporal futuro exigiria requisito próprio.

### Forma recomendada da consulta

Usar agregação condicional em uma única consulta, filtrando previamente linhas em que posição 13 ou 14 seja `+/-`:

```sql
SELECT
    m.filial,
    date_trunc(''month'', m.data)::date AS periodo,
    SUM(CASE
        WHEN substr(m.operacao, 14, 1) = ''+'' THEN m.quantidade
        WHEN substr(m.operacao, 14, 1) = ''-'' THEN -abs(m.quantidade)
        ELSE 0
    END) AS compras,
    SUM(CASE
        WHEN substr(m.operacao, 13, 1) = ''+'' THEN abs(m.quantidade)
        WHEN substr(m.operacao, 13, 1) = ''-'' THEN -m.quantidade
        ELSE 0
    END) AS vendas
FROM movimentos m
WHERE m.produto = :produto
  AND m.filial = :filial
  AND (
      substr(m.operacao, 13, 1) IN (''+'', ''-'')
      OR substr(m.operacao, 14, 1) IN (''+'', ''-'')
  )
GROUP BY m.filial, date_trunc(''month'', m.data)::date
ORDER BY periodo DESC;
```

O Query Builder pode expressar a consulta, mas não deve voltar a buscar todos os movimentos e agrupar em PHP. Também não deve executar `Schema::hasTable` no request: ausência de tabela/coluna é erro estrutural observável, não estado vazio de negócio.

### Payload e apresentação

DTO nominal:

```text
produto: int
filial: int
periodos: Array<{
  filial: int
  ano_mes: string       // YYYY-MM
  compras: number
  vendas: number
}>
```

- Valores usam a máscara de quantidade configurada; não são moeda.
- A tabela usa chave estável `filial:ano_mes`, não índice do array.
- Não adicionar total geral, acumulado progressivo, média ou valor financeiro: o Delphi não possui esses dados nesta aba e o nome “Acumuladores” significa total mensal por natureza.
- O estado vazio é `periodos: []` e mensagem “Sem compras ou vendas para este produto nesta filial.”, distinguindo vazio legítimo de erro de infraestrutura.
- Zero resultante de compensação dentro de um mês continua sendo linha válida se houve movimento classificável.

### Autorização e carregamento

- Exigir `viewGerencial` no servidor antes da consulta; sem capability, 403 e aba omitida no React.
- Manter cancelamento, chave de geração e descarte de resposta obsoleta do hook existente.
- Resposta deve repetir Produto+Filial; o frontend valida identidade antes de renderizar.
- Não há mutação ou navegação de detalhe nesta aba.

### Testes obrigatórios

1. Feature de 403 sem `viewGerencial` e ausência da aba no manifesto/UI.
2. Produto+Filial: movimentos iguais em outra Filial/Produto não entram; relação de estoque ausente gera 404 genérico.
3. Snapshot: alterar `tiposmovimentos.operacao` depois do lançamento não altera o resultado; idealmente nem criar o tipo no teste.
4. Posições 13/14: Compra e Venda positivas, negativas e um movimento que participa das duas séries.
5. Símbolos irrelevantes/string curta não criam bucket; movimento classificável compensado até zero preserva o mês.
6. Vários movimentos no mesmo mês agregam uma linha; meses diferentes ordenam recente→antigo, inclusive virada de ano.
7. Datas no primeiro/último dia do mês e `ano_mes` em `YYYY-MM`; UI em `MM/YYYY`.
8. Payload numérico, Filial explícita e máscara de quantidade no componente.
9. Estado vazio específico e erro estrutural não convertido em `[]`.
10. Teste de repository/SQL assegurando uso de `m.operacao`, `GROUP BY` no banco e ausência de join classificatório com `tiposmovimentos`.

### Classificação dos gaps atuais

- Uso de `tiposmovimentos.operacao`: defeito histórico grave.
- Agregação de todas as linhas em PHP: defeito de implementação/desempenho.
- `Schema::hasTable` retornando vazio: mascaramento de erro estrutural.
- Tabela combinada em vez de dois grids: adaptação válida, não gap.
- Ausência de total geral: paridade correta, não gap.
- Filial não exibida e DTO `Record<string, unknown>`: gaps de contrato/apresentação.

## Question

Qual deve ser o contrato corrigido da aba Acumuladores no Laravel: fontes e período, Compras/Vendas, sinais e agregações, granularidade Produto+Filial, ordenação, totais, capabilities, estados vazios e testes?
