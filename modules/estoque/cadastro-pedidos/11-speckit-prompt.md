# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, 3 abas informativas somente-leitura do Cadastro de Pedidos de Compra que não foram capturadas na investigação original: **"Fornecedor"** (dados cadastrais completos do fornecedor do pedido), **"Notas Fiscais"** (notas fiscais de entrada vinculadas aos produtos deste pedido) e **"Contatos"** (contatos do fornecedor). Esta é a décima primeira fatia do Cadastro de Pedidos de Compra, construída sobre o cabeçalho/itens já especificados (specs 01-08).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` como requisito legado autoritativo. Inspecione o checkout Laravel — em especial se as entidades de fornecedor/contatos já existem e podem ser reaproveitadas diretamente — antes de propor qualquer nova tabela ou endpoint. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta entrega

A entrega termina quando existirem as 3 abas, cada uma somente leitura:

1. **Fornecedor**: endereço completo (rua/número/complemento/bairro/cidade/UF/CEP), 2 telefones (DDD+número — o segundo é fax no legado), CPF/CNPJ, inscrição estadual, contato principal — dados do fornecedor **já selecionado no pedido**, sem nova consulta ao backend (reaproveitar o mesmo objeto/resposta já usado para popular o cabeçalho).
2. **Notas Fiscais**: grid com data, fornecedor, razão social, série, número da nota, situação (Nota/Parcial/Cancelada) — notas fiscais de entrada já recebidas contra os produtos deste pedido.
3. **Contatos**: grid de contatos do fornecedor (nome, DDD, telefone, ramal, e-mail) + painel lateral com cargo e observações do contato selecionado.

Não inclua nesta entrega: a aba "Notas Pendentes de Entrada" (spec 12, depende de infraestrutura SEFAZ maior); qualquer alteração em cabeçalho/itens/grade já especificados.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmcadastropedidos.pas`/`.dfm` e `fmcadastropedidos.pas`/`.dfm`.
- Inspecione o checkout Laravel para confirmar se as entidades de fornecedor e contatos de fornecedor já são acessíveis (o módulo `Estoque/Fornecedores` já migrado é a fonte mais provável).
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- o objeto/resposta que já popula os dados do fornecedor no cabeçalho do pedido (specs 06-07) — a aba "Fornecedor" deve reaproveitar exatamente essa fonte, sem nova query;
- o módulo `Estoque/Fornecedores` já migrado (`resources/js/Pages/Cadastros/Estoque/Fornecedores/`, `app/.../Fornecedores*`) — para os campos de endereço/telefone/CNPJ/IE e para a entidade de contatos de fornecedor;
- se já existe uma tabela/model de "notas fiscais de entrada" e "produtos de nota fiscal de entrada" equivalentes a `notaspag`/`produtosnotaspag` do legado;
- se já existe um endpoint de contatos de fornecedor reaproveitável (o mesmo já usado, ou a usar, pelo Envio de Pedido por e-mail, spec 08).

## Evidência Delphi confirmada

### Aba "Fornecedor" (CONFIRMADO, `fmcadastropedidos.dfm:2717-2900`, `dmcadastropedidos.dfm:950-1113`)

Alimentada inteiramente por `dtmCadastroPedidos.dsrProcuraFornecedores` — **a mesma datasource já usada** para exibir o nome do fornecedor ao lado do lookup no cabeçalho. Todos os campos têm `ReadOnly = True` explícito no `.dfm`. A query (`qryProcuraFornecedores`) seleciona: `codigo, nome, estado, foneddd, fonenumero, faxddd, faxnumero, inscricaoestadual, contato, rua, numero, complemento, nomecidade, nomebairro, pessoanumero (CPF/CNPJ), bairro, cidade, cep, markup, crt`. Recarregada sempre que o fornecedor do pedido muda — mesmo ponto que já atualiza o cabeçalho. **Não é uma query nova.**

### Aba "Notas Fiscais" (CONFIRMADO, `dmcadastropedidos.dfm:2770-2830`)

```sql
SELECT DISTINCT(n.Codigo), n.Fornecedor, n.TipoFornecedor,
  (SELECT vf.nome FROM vfornecedores vf
   WHERE vf.tipo = n.TipoFornecedor AND vf.codigo = n.Fornecedor LIMIT 1) AS NomeFornecedor,
  n.Serie, n.Numero, n.Data,
  CAST(CASE WHEN n.Situacao = 'N' THEN 'NOTA'
            WHEN n.Situacao = 'P' THEN 'PARCIAL'
            WHEN n.situacao = 'C' THEN 'CANCELADA'
       END AS VARCHAR) AS DescricaoSituacao
FROM notaspag n, produtosnotaspag pn
WHERE n.Codigo = pn.CodigoNota AND pn.pedido = :pedido
```

Grid 100% read-only (`ReadOnly = True`, `CanDelete = False`, `CanNotInsertFromGrid = False`), sem drill-down associado no `.dfm`. **`notaspag`/`produtosnotaspag` são tabelas distintas de `documentospag`/`duplicatas`** (já especificadas na spec 08 — Documentos a Pagar) — são as notas fiscais de entrada efetivamente recebidas contra os produtos deste pedido, não o título financeiro.

### Aba "Contatos" (CONFIRMADO, `dmcadastropedidos.dfm:4461-4489`)

```sql
select cf.codigo, cf.contato, cf.fonenumero, cf.foneddd, cf.foneramal, cf.email,
       cf.codigovfornecedores, cf.tipovfornecedores, cf.cargo, cf.observacoes,
       c.descricao as descricaocargo
from contatosvfornecedores cf
left join cargos c on cf.cargo = c.codigo
where cf.codigovfornecedores = :fornecedor and cf.tipovfornecedores = 'F'
order by cf.Contato
```

São os mesmos contatos do cadastro de fornecedores (`contatosvfornecedores`), não uma entidade própria do pedido — reaproveitar a entidade já existente/a existir no módulo de Fornecedores. `cargo`/`observacoes` são colunas do próprio contato (cada contato tem seu cargo e observações), o painel lateral só espelha o registro selecionado no grid — não é um campo solto do pedido. Grid é read-only no `.dfm`. **Mesma tabela-base já usada pelo Envio de Pedido** (spec 08, destinatário de e-mail via `qryContatosFornecedoresemail`) — não duplicar o conceito.

## Decisões obrigatórias

1. Aba "Fornecedor" não faz nova chamada de rede — reaproveita o objeto do fornecedor já carregado para o cabeçalho.
2. Aba "Notas Fiscais" é uma consulta nova mas simples (join de 2 tabelas, sem paginação necessária — poucas notas por pedido), sem ação de drill-down (não inventar navegação não confirmada no legado).
3. Aba "Contatos" reaproveita a entidade de contatos de fornecedor do módulo de Fornecedores — se esse módulo ainda não expõe contatos, especificar o endpoint mínimo necessário, mas sem duplicar o conceito caso já exista.
4. Nenhuma das 3 abas tem qualquer ação de escrita — são puramente informativas.

## Critérios de aceite

- [ ] Aba "Fornecedor" exibe endereço completo, 2 telefones, CPF/CNPJ, inscrição estadual e contato principal do fornecedor do pedido, sem chamada de rede adicional.
- [ ] Aba "Notas Fiscais" lista as notas fiscais de entrada vinculadas aos produtos do pedido, com data/fornecedor/razão social/série/número/situação, situação traduzida (Nota/Parcial/Cancelada).
- [ ] Aba "Contatos" lista os contatos do fornecedor do pedido (nome/DDD/telefone/ramal/e-mail); selecionar um contato mostra seu cargo e observações no painel lateral.
- [ ] Nenhuma das 3 abas permite edição inline.
- [ ] Trocar o fornecedor do pedido atualiza as 3 abas para refletir o novo fornecedor.

## Matriz mínima de testes

- **Fornecedor — sem chamada extra**: abrir a aba "Fornecedor" não dispara requisição de rede adicional (usa dado já carregado).
- **Notas Fiscais — pedido com múltiplas notas**: pedido recebido em 2 notas fiscais distintas → grid lista as 2, com situação correta de cada uma.
- **Notas Fiscais — pedido sem notas ainda**: pedido aberto, nada recebido → grid vazio, sem erro.
- **Contatos — seleção**: selecionar contatos diferentes no grid → painel lateral atualiza cargo/observações correspondentes.
- **Troca de fornecedor**: trocar o fornecedor do pedido → as 3 abas recarregam com os dados do novo fornecedor.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais das 3 abas;
- identifiquem os repositórios/serviços/componentes Laravel atuais a estender ou criar, após inspecioná-los (em especial o módulo de Fornecedores já migrado);
- detalhem as queries/fontes de dados acima, reaproveitando o que já existe;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que a aba "Notas Pendentes de Entrada" (spec 12) não faz parte desta entrega.

## Fora de escopo

- implementar durante `/speckit.specify` além do que os critérios acima descrevem;
- a aba "Notas Pendentes de Entrada" (spec 12);
- qualquer alteração de lógica de negócio do cabeçalho/itens/grade já implementados (specs 01-08);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
