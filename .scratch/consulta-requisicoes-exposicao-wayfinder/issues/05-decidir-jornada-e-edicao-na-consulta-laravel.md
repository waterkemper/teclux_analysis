# Decidir jornada e edição na Consulta Laravel

Type: grilling
Status: resolved
Blocked by: 01, 03, 04

## Question

Como a Consulta Laravel deve organizar filtros, geração do resultado, abas, seleção, estados e atalhos, e deve preservar a edição direta de quantidade na grade Delphi ou encaminhar a alteração ao Cadastro Manual, sem criar duas experiências concorrentes para a mesma mutação?

## Answer

A jornada Laravel preservará o comportamento operacional da Consulta Delphi, adaptado aos padrões de interface do Laravel.

### Abertura e filtros

- A Filial Requisitante fica fixa na filial ativa/autorizada do usuário; não há lookup editável de requisitante.
- Data Inicial e Data Final começam com a data do servidor.
- Situação inicial é **Aberto**.
- A página abre sem resultado carregado.
- Os filtros aceitam as quatro situações do domínio: `A` Aberto, `F` Fechado, `D` Confirmado e `C` Cancelado.
- Gerar executa a consulta; Enter na Data Final equivale a Gerar.
- A leitura segue a ordem legada por filial requisitada e produto.

### Abas e seleção

- A aba **Pedidos** permanece sempre visível e contém a seleção de uma linha.
- A aba **Confirmados** só aparece quando a linha selecionada está Fechada (`F`), é carregada pelo `dadofiscal` e é totalmente somente leitura.
- Ao trocar a seleção, o detalhe Confirmados é recarregado ou ocultado conforme a situação.
- Alterar quantidade e cancelar atuam exclusivamente sobre a linha selecionada.

### Estados da tela

A página explicita os estados **Inicial** (sem consulta), **Carregando**, **Vazio**, **Resultado** e **Erro recuperável**. Filtros e ações não devem perder seus valores quando ocorre erro. Imprimir só fica habilitado quando existe resultado.

### Mutação e limites

A Consulta mantém edição direta somente de `qtdepedida` em requisição aberta. A operação usa um adapter/request específico com identidade, revisão e nova quantidade, delegando ao núcleo `RequisicaoFiliaisCommandService`; não expõe a alteração ampla do Cadastro Manual (produto, filiais ou observação). Após salvar, a linha é recarregada com nova revisão, saldos e alertas.

Cancelar continua sendo ação sobre a linha selecionada, com confirmação visível, motivo conforme parâmetro e delegação às regras já compartilhadas de revisão, auditoria, reserva prévia, futuro e movimentos.

Criar requisição, alterar `qtderecebida`, transferir, expedir, receber e geração em lote permanecem fora da Consulta.

### Barra e atalhos

Os botões seguem a barra de operações padrão do Laravel, com rótulos, estados habilitado/desabilitado e confirmação visual do design system existente; não será copiada a aparência da barra Delphi. Como acessibilidade complementar, os atalhos permanecem:

- `F7`: Gerar;
- `F5`: Salvar quantidade;
- `F6`: Cancelar;
- `F12`: Imprimir.

Cada atalho respeita foco, edição pendente, permissões e conflitos do navegador/componente. Os botões visíveis continuam sendo o caminho principal.

### Resultado da decisão

A Consulta e o Cadastro Manual não concorrem: a Consulta é a visão operacional filtrável com mutação estreita de quantidade e cancelamento; o Cadastro é a ficha completa de inclusão/manutenção. O termo canônico é **Consulta de Requisições para Exposição**, conforme o glossário Laravel.
### Contrato técnico de leitura e grid

A Consulta deve ter um read repository próprio. O SQL equivalente ao Delphi deve ser parametrizado (sem macros textuais/interpoladas):

```sql
select
    pf.codigo,
    pf.produto,
    pf.data,
    pf.hora,
    pf.requisitante,
    pf.requisitada,
    f.nome as nomefilialrequisitada,
    pf.qtdepedida,
    pf.qtderecebida,
    pf.situacao,
    pf.observacao,
    pf.dadofiscal,
    pf.lotetransferencia,
    pf.motivo,
    p.codigovisual,
    p.descricao,
    p.referencia,
    p.valorgrade1,
    p.valorgrade2,
    p.resultadocurvaabc,
    n.numero as nota_numero,
    n.serie as nota_serie,
    e_req.emestoque as estoquerequisitante,
    e_dest.emestoque as estoquerequisitada,
    e_dest.reservaprevia
from pedidosfiliais pf
join produtos p on p.codigo = pf.produto
join filiais f on f.codigo = pf.requisitada
left join notas n on n.dadofiscal = pf.dadofiscal
left join estoques e_req
       on e_req.produto = pf.produto
      and e_req.filial = :filial_fisica_requisitante
left join estoques e_dest
       on e_dest.produto = pf.produto
      and e_dest.filial = case when f.tipofilial = 'V'
                              then coalesce(f.filial_estoque, f.codigo)
                              else f.codigo end
where pf.requisitante = :requisitante
  and (:data_inicial is null or pf.data::date >= :data_inicial)
  and (:data_final   is null or pf.data::date <= :data_final)
  and pf.situacao = :situacao
order by pf.requisitada asc, pf.produto asc, pf.codigo asc
```

A implementação Laravel deve adaptar a sintaxe de data ao driver e resolver `filial_fisica_requisitante`/`filial_fisica_requisitada` pelo resolver já existente, inclusive filiais do tipo `V`. O filtro de reserva prévia só deve ser projetado/visível quando `REQUISICAOSUBTRAI ESTOQUE` estiver verdadeiro; o parâmetro literal correto é `REQUISICAOSUBTRAIESTOQUE` (sem espaço), conforme o manifesto.

A aba **Confirmados** usa uma segunda leitura somente leitura, vinculada ao `dadofiscal` selecionado:

```sql
select
    pf.codigo,
    pf.produto,
    p.codigovisual,
    p.descricao,
    p.valorgrade1,
    p.valorgrade2,
    c.grupo,
    pf.situacao
from pedidosfiliais pf
join produtos p on p.codigo = pf.produto
left join caracteristicas c on c.codigo = p.caracteristica
where pf.dadofiscal = :dadofiscal
order by pf.produto asc, pf.codigo asc
```

O `left join` de característica evita ocultar silenciosamente itens sem característica; a situação exibida usa os rótulos canônicos `F = Fechado` e `D = Confirmado`.

### Colunas disponíveis na grade Pedidos

| Coluna | Fonte/projeção | Visibilidade | Edição |
|---|---|---|---|
| Produto | `pf.produto`, `p.codigovisual` | sempre | somente leitura |
| Descrição | `p.descricao` | sempre | somente leitura |
| Linha | `p.valorgrade1`/característica | parâmetro `USAR GRADES PRODUTOS` | somente leitura |
| Coluna | `p.valorgrade2`/característica | parâmetro `USAR GRADES PRODUTOS` | somente leitura |
| Data/Hora | `pf.data`, `pf.hora` | sempre | somente leitura |
| Filial Requisitada | `pf.requisitada`, `f.nome` | sempre | somente leitura |
| Estoque Requisitada | `e_dest.emestoque` | sempre | somente leitura |
| Reserva Prévia | `e_dest.reservaprevia` | `REQUISICAOSUBTRAIESTOQUE` verdadeiro | somente leitura |
| Estoque Requisitante | `e_req.emestoque` | sempre | somente leitura |
| Pedida | `pf.qtdepedida` | sempre | editável somente em `A` |
| Recebida | `pf.qtderecebida` | sempre | somente leitura |

Campos auxiliares que devem acompanhar cada linha, mesmo que não sejam exibidos como colunas, são `codigo`, `dadofiscal`, `situacao`, `revisao`, `observacao`, `nota_numero`, `nota_serie`, `referencia`, `lotetransferencia`, `resultadocurvaabc`, `motivo` e `filial_fisica_requisitada`. Eles sustentam seleção, Confirmados, impressão, mutação e auditoria.

### Colunas da aba Confirmados

Produto, Descrição, Linha, Coluna, Grupo/Setor e Situação. Todas são somente leitura; Linha/Coluna seguem `USAR GRADES PRODUTOS`. Não há botões de inclusão, exclusão, transferência ou recebimento nessa aba.

### Persistência

A Consulta não executa `insert/update` manual em `pedidosfiliais`, `estoques` ou `movimentos`. Salvar quantidade chama o adapter restrito que delega `AlterarRequisicaoFiliaisCommand`; Cancelar delega `CancelarRequisicaoFiliaisCommand`. O núcleo executa locks, TEP/TPE/TFR, liberação Reserva Prévia/Venda Futura, revisão e auditoria em transação única.
