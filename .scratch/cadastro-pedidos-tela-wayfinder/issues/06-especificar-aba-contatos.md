# Especificar a aba "Contatos"

Type: grilling
Status: resolved
Blocked by:

## Question

A aba "5-Contatos" (`contatos.png`) lista os contatos do fornecedor (nome, DDD, telefone, ramal, e-mail) num grid à esquerda, e um painel à direita com "Cargo" e "Observações" (texto livre, no exemplo contendo notas de negociação como frete/prazo/desconto). Localizar em `dmcadastropedidos.pas`/`.dfm` a query que alimenta o grid e o painel. Confirmar: os contatos são os mesmos do cadastro de fornecedores (reaproveitar) ou uma entidade própria deste contexto? O painel "Cargo/Observações" edita o registro selecionado do grid, ou é um campo solto do cabeçalho do pedido? Esta é a mesma fonte já usada pelo botão "Envio de Pedido" (destinatário de e-mail, ticket 12 do mapa anterior) — confirmar a relação.

## Answer

### SQL completa confirmada (CONFIRMADO, `dmcadastropedidos.dfm:4461-4489`)

```sql
select cf.codigo, cf.contato, cf.fonenumero, cf.foneddd, cf.foneramal, cf.email,
       cf.codigovfornecedores, cf.tipovfornecedores, cf.cargo, cf.observacoes,
       c.descricao as descricaocargo
from contatosvfornecedores cf
left join cargos c on cf.cargo = c.codigo
where cf.codigovfornecedores = :fornecedor and cf.tipovfornecedores = 'F'
order by cf.Contato
```

**Confirmado: são os mesmos contatos do cadastro de fornecedores** (`contatosvfornecedores`, filtrado por `codigovfornecedores = :fornecedor` e `tipovfornecedores = 'F'`) — não é uma entidade própria do pedido. Reaproveitar a entidade de contatos de fornecedor já existente no Laravel, não duplicar.

O painel "Cargo/Observações" **não é um campo solto do pedido** — `cargo`/`observacoes` são colunas do próprio registro de contato selecionado no grid (cada contato tem seu cargo e suas observações próprias); o painel lateral só espelha o registro ativo do mesmo dataset, mesmo padrão de "master-detail de uma linha" já visto em outras telas. Grid é read-only (`ReadOnly = True` no `.dfm`); `CachedUpdates = True` na query é infraestrutura padrão do framework, não uma indicação de que esta tela edita os contatos.

### Relação com Envio de Pedido (CONFIRMADO)

O ticket 12 do mapa anterior já confirmou que o destinatário do e-mail de Envio de Pedido vem de `qryContatosFornecedoresemail` — **mesma tabela-base** (`contatosvfornecedores`), reforça que não há duplicação de conceito: contatos do fornecedor são uma coisa só, usada tanto na aba informativa quanto no envio de e-mail.

### Decisão

Especificação simples: endpoint read-only que reaproveita a entidade de contatos de fornecedor já existente, filtrado pelo fornecedor do pedido; grid + painel lateral mostrando cargo/observações do contato selecionado. Publicado junto no prompt `11-speckit-prompt.md`.
