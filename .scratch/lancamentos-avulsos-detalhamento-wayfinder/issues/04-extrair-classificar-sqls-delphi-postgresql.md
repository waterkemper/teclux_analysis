Type: task
Status: resolved
Blocked by: 01

## Question

Quais SQLs sustentam os lookups, contexto, validações, grades, preparação e gravação de Lançamentos Avulsos; quais são seus parâmetros, joins, filtros, ordenação, cardinalidade e locks; e como reexpressá-los com bindings e fronteiras trigger-aware sem copiar defeitos do Delphi?

## Answer

### Classificação

Foram identificadas cinco classes:

1. **lookup/resolve:** Filiais, Tipos, Produto e Lote;
2. **contexto e grades:** Estoque do Produto, Estoque do Lote e últimos dez Movimentos;
3. **pré-validação financeira:** Custo Médio histórico;
4. **dataset de comando:** seleção vazia/editável de `movimentos`;
5. **mecanismos legados a eliminar:** próximo número, cópia temporária e UPDATE global de última compra.

Produto e Lote usam SQLs do frame compartilhado já fixados em **Inventariar lookups e resolvers do Delphi**. Todas as entradas variáveis no Laravel devem usar bind tipado; nenhuma macro pode receber valor do usuário.

### Lookups e resolvers

| Contrato | SQL/fonte | Parâmetros | Cardinalidade/ordem |
|---|---|---|---|
| Resolver Filial origem | `filiais where codigo=:codigo` | `codigo smallint/int` | 0..1 |
| Resolver Filial destino | mesma consulta em dataset separado | `codigo` | 0..1 |
| Lupa Filial | `filiais` | texto tratado pelo framework | N, nome sem acento/caixa |
| Resolver Tipo | `tiposmovimentos where codigo=:codigo and not interno and operacao<>'********************'` | `codigo char(3)` | 0..1 |
| Lupa Tipo | mesmos predicados, retorna código/descrição | texto | N, descrição sem acento/caixa |
| Resolver Produto | Produtos + Característica e auxiliares; código visual normalizado ou código de barras | `produtovisual` | 0..1 esperado |
| Lupa Produto | full-text em `produtos.busca`; macro fixa para compostos | texto e parâmetro do sistema | página/ranking |
| Resolver Lote | `lotes join produtos`, por Produto + Nº Lote | `produto bigint, nrlote` | 0..1 esperado |
| Lupa Lote | `lotes join produtos`, condição do Produto, `order by validade` | `produto bigint` | N |

As consultas Delphi de Filial não aplicam autorização; Produto não filtra Estoque da Filial; Lote não filtra Filial/saldo/situação. No Laravel, esses fatos não podem virar autorização implícita: `UserBranchAccessService` limita Filiais e o servidor valida os pares Produto+Filial e Produto+Filial+Lote.

### Contexto atual do Produto

SQL legado, reexpresso:

```sql
select e.emestoque, e.reservado, e.transito, e.demonstracao,
       e.conserto, e.futuro, e.danificada, e.reservaprevia,
       e.estoquefisico, e.precocomicms, e.precosemicms, e.financeiro,
       case when (e.emestoque+e.reservado+e.transito+e.demonstracao+
                       e.conserto+e.danificada+e.reservaprevia) > 0
            then e.financeiro / (e.emestoque+e.reservado+e.transito+
                       e.demonstracao+e.conserto+e.danificada+e.reservaprevia)
            else 0 end as customedio,
       e.valorultimacompra
from estoques e
where e.produto=:produto and e.filial=:filial
```

- **Parâmetros:** Produto bigint e Filial smallint.
- **Cardinalidade:** 0..1 pela chave Produto+Filial.
- **Uso:** snapshot, valores atuais, defaults e prova de cadastro na Filial.
- **Sem join/ordem/lock na leitura Delphi.** O comentário com join a Movimentos está inativo.
- **Correção:** a expressão omite `futuro` do divisor embora o selecione; não deve ser tomada como fórmula normativa. Preferir valor canônico já adotado pelo domínio/serviço Laravel ou alinhar exatamente à regra da trigger. Nunca recalcular para atualizar projeção.

### Contexto atual do Lote

É a mesma projeção sobre `estoqueslotes el`, filtrada por `:produto, :lote, :filial`, retornando as nove quantidades, preços, Financeiro, Custo Médio calculado e Última Compra.

- **Tipos:** Produto/Lote bigint, Filial smallint.
- **Cardinalidade:** 0..1 pela chave Produto+Filial+Lote.
- **Sem joins, ordenação ou lock na leitura.**
- **Uso:** snapshot do Lote e validação contextual; zero linhas é diferente de uma linha zerada.
- **Correção:** o mesmo alerta sobre a fórmula de Custo Médio se aplica. Lote deve antes ser validado em `lotes.produto=:produto`.

### Últimos dez Movimentos

```sql
select m.numero,
       m.emestoque, m.reservado, m.transito, m.demonstracao,
       m.futuro, m.danificada, m.conserto, m.financeiro,
       m.precosemicms, m.precocomicms, m.data, m.tipomovimento,
       m.referencia, m.quantidade, m.valor, l.nrlote
from movimentos m
left join lotes l on l.lote=m.loteproduto
where m.produto=:produto and m.filial=:filial
order by m.numero desc
limit 10
```

O Delphi não seleciona `numero`; o contrato Laravel deve incluí-lo como chave técnica. Parâmetros são Produto bigint e Filial smallint; cardinalidade 0..10; sem lock. A ordem observada é `numero desc`, não Data/Lancto. Essa consulta alimenta as três grades históricas e deve ser executada após commit para capturar efeitos das triggers.

### Custo Médio histórico para confirmação

```sql
select round(
  m.financeiro /
  (m.emestoque+m.reservado+m.reservaprevia+m.transito+
   m.demonstracao+m.conserto+m.danificada), 2
) as customedio
from movimentos m
where m.produto=:produto
  and m.filial=:filial
  and m.data<=:data
  and (m.emestoque+m.reservado+m.reservaprevia+m.transito+
       m.demonstracao+m.conserto+m.danificada)<>0
  and m.financeiro>0
order by m.data desc, m.lancto desc
limit 1
```

Cardinalidade 0..1; parâmetros Produto, Filial e Data. O Delphi compara esse valor anterior ao Custo Médio posterior e pode desfazer a gravação. No Laravel, preparação não abre transação nem simula INSERT; deve mostrar contexto anterior sem prometer o resultado. Confirmações de risco são anteriores ao POST, e exceções/resultado real vêm das triggers.

### Dataset de inclusão e INSERT raiz

O Delphi abre:

`movimentos m join produtos p left join lotes l where m.numero=:numero`, normalmente com `:numero=0`, e insere por dataset live. Os joins servem apenas à apresentação de código visual e datas do Lote; não pertencem ao INSERT.

Contrato seguro equivalente:

```sql
insert into movimentos (
  produto, filial, data, tipomovimento, quantidade,
  valor, precosemicms, precocomicms, aliquotaipi,
  referencia, trffilial, loteproduto,
  usuariologado, usuarioautorizacao, valorultimacompra
) values (
  :produto, :filial, :data, :tipomovimento, :quantidade,
  :valor, :precosemicms, :precocomicms, :aliquotaipi,
  :referencia, :trffilial, :loteproduto,
  :usuariologado, :usuarioautorizacao, :valorultimacompra
)
returning numero
```

Esta é uma **allowlist máxima**, não uma lista de campos sempre preenchidos. Campos condicionais incompatíveis devem ser omitidos/nulos conforme schema e Tipo. O servidor relê Tipo, Produto, Filiais, Lote e parâmetro; `operacao`, `lancto`, saldos, Financeiro calculado, relações derivadas, flags de bypass, Grupo e timestamps não entram no payload.

O INSERT ocorre em transação curta com auditoria, idempotência e revalidação. `RETURNING numero` é preferível se o driver/triggers devolverem a chave final; caso contrário, usar a identificação canônica já definida pelo repositório e reler depois. Nunca buscar “o último” sem chave.

### SQLs legados proibidos

1. **`select movimentos_proximonumero()`:** o Delphi reserva número antes do post. No fluxo Laravel, deixar a trigger/mecanismo PostgreSQL canônico atribuir número; nunca `MAX()+1`.
2. **`qryMovimentos_Copia where numero=0`:** cópia de estado visual para recuperar o formulário após rollback. Substituir por estado imutável do request/preparação; não é SQL de domínio.
3. **`update estoques set valorultimacompra=:valor where produto=:produto`:** defeito grave, sem Filial e paralelo às triggers. Não reproduzir. A posição 11 do Tipo e a trigger controlam Última Compra.
4. **log em `C:\lancamentosprodutos.sql`:** não é contrato nem auditoria aceitável; usar auditoria estruturada sem SQL/segredos locais.

### Locks, transação e triggers

As SELECTs de tela são leituras sem lock. Preparação também não deve bloquear nem manter transação entre requests. No POST:

- iniciar transação;
- reservar/reconhecer idempotência;
- aplicar contexto de auditoria;
- reler e validar Filiais, Produto, Tipo, Lote e prova de autorização;
- inserir **uma** linha raiz;
- deixar `movimentos_antesinseriratualizar` bloquear `estoques(produto,filial) for update`;
- deixar a cadeia de Lote bloquear `estoqueslotes(produto,filial,lote) for update`;
- commit; somente depois recarregar raiz, relacionados, projeções e histórico.

Laravel não deve adicionar locks concorrentes em ordem diferente nem escrever em `estoques`, `estoqueslotes`, `movimentoslotes` ou Movimentos derivados.

### SQLs não locais ao Delphi

Filiais autorizadas, idempotência, prova de autorização, Auditoria web e leitura de relacionados após trigger são contratos Laravel, não datasets encontrados nesta tela. Devem reutilizar infraestrutura atual, a ser confirmada em **Auditar o Laravel atual**, sem inventar equivalentes Delphi. Data Contábil e limite retroativo vêm de parâmetros do sistema, não de SQL próprio no módulo.

### Regra para o adendo final

- SQL de leitura pode ser apresentado como exemplo parametrizado com shape normativo.
- Predicados de autorização, identidade, cardinalidade e ordem são normativos.
- O INSERT deve ser normativo por allowlist e fronteira transacional.
- Corpo interno das triggers deve ser descrito por responsabilidades, nunca copiado para PHP ou duplicado como SQL aplicativo.
