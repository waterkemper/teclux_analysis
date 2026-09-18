# Pesquisa de SQLs, parâmetros e dados Delphi — Controle de Recebimentos

## Escopo e fontes

Pesquisa focada nos SQLs e no contrato de dados efetivamente usado por:

- `C:/projetos.vcl/apps/caixa/dmcontrolerecebimentos.pas` — montagem de filtros, abertura de datasets, edição e persistência (`:234-369`, `:374-1021`, `:1444-1562`);
- `C:/projetos.vcl/apps/caixa/dmcontrolerecebimentos.dfm` — SQL, macros, parâmetros, campos e opções dos datasets (`:7-209`, `:426-1210`);
- `C:/projetos.vcl/apps/caixa/fmcontrolerecebimentos.pas` — valores enviados à consulta (`:129-142`);
- `C:/projetos.vcl/biblio/clparametrossistema.pas` — catálogo/carregamento de parâmetros (`:1889-1913`, `:2250-2275`, `:5778-5804`, `:7040-7195`);
- `C:/projetos.vcl/repositorio/dmbasico.pas` — gate de integração bancária (`:17225-17230`).

As classificações são `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE` e `POSSÍVEL BUG LEGADO`. Nenhum SQL de produção Laravel foi implementado.

## 1. Consulta principal `qryRecebimentos`

### Configuração

`qryRecebimentos` é `TtecQuery`, ligado a `dtmTecSoft.dbaTecSoft`/`tstTecSoft`, com `CachedUpdates = True`, `RequestLive = True`, `BeforeInsert`, `BeforeDelete`, `AfterScroll` e `OnCalcFields` (`dmcontrolerecebimentos.dfm:7-20`; `:221-418`). A consulta recebe somente o bind `:operacao` (`:207-220`); os demais filtros são macros textuais.

### Projeção e relações

O SQL em `dmcontrolerecebimentos.dfm:67-209` é, em essência:

```sql
select
  coalesce(ct.cliente,
    (select aut.cliente from autenticacoes aut
     where aut.transacao = r.transacao and cliente is not null limit 1)) as cliente,
  coalesce(ct.tipocliente, 'C') as tipolciente,
  coalesce(vf.razao, vf.nome) as nomecliente,
  r.*,
  cast(substr(r.cheque,1,3) as varchar) as cheque_banco,
  cast(substr(r.cheque,4,4) as varchar) as cheque_agencia,
  cast(substr(r.cheque,12,6) as varchar) as cheque_cheque,
  cast(substr(r.cheque,20,10) as varchar) as cheque_conta,
  0.00 as juros,
  (select coalesce(tef.nomeredensu,'') from tef
   where cast(tef.codigo as varchar) = r.tef) as nomeredetef,
  1 as quantidade
from (
  select r.*,
    (select p.contrato from parcelas p
     where p.transacao = r.transacao limit 1) as contrato
  from (
    select r.codigo, r.situacao, r.datavencto, r.valorvencto,
      r.valorlancto, r.tiporecebimento as codigotiporecebimento,
      r.tiporecebimento as codigotiporecebimento_auxiliar, r.datalancto,
      tr.descricao as descricaotiporecebimento, tr.tiporecebimento, r.cheque,
      r.desagio as pdesagio, r.controle, r.controlerecebimento,
      r.valorlancto-r.valorvencto as valordesagio, r.valortotal,
      case when (:operacao = 2) then not r.confirmado else r.confirmado end as confirmado,
      r.transacao, ch.vencto as cheque_vencto, ch.titular as cheque_titular,
      r.tef, r.valor_confirmacao, r.valor_confirmacao as valor_confirmacao_old,
      r.filial, f.nome as nomefilialemissao,
      coalesce(r.conta, ctr.conta) as conta, r.data_confirmacao, r.sequencia,
      coalesce(r.evento, ctr.evento) as evento, r.sequenciaevento,
      r.data_confirmacao as data_confirmacao_old, r.documentopag, r.duplicata,
      (select count(*) from recebimentos rc
       where rc.controlerecebimento = r.controlerecebimento
         and rc.confirmado) as quantidadeconfirmacoes,
      coalesce(r.fornecedor, tr.fornecedor) as fornecedor,
      coalesce(r.eventodocumentopag, tr.evento) as eventodocumentopag,
      cast(contratosdatransacao(r.transacao) as varchar(50)) as listacontratos,
      cast(orcamentosdatransacao(r.transacao) as varchar(50)) as listaorcamentos
    from recebimentos r
      join tiposrecebimentos tr on r.tiporecebimento = tr.codigo
      join filiais f on r.filial = f.codigo
      left join cheques ch on r.cheque = ch.numero
      left join contastiposrecebimentos ctr
        on r.filial = ctr.filial and tr.codigo = ctr.tiporecebimento
    where r.tiporecebimento = tr.codigo
      and r.filial = f.codigo
      %SQLRecebimentosDataVencto
      %SQLRecebimentosDataLancto
      %SQLRecebimentosDataRecebimento
      %Filial_Recebimento
      and r.situacao = 'N'
      %TipoRecebimento_Recebimentos
      %FormadeRecebimentos
      %CondicaoOperacao
      %meiosdepagamento_Recebimentos
  ) as r
) as r
left join (contratos ct join vfornecedores vf
  on vf.codigo = ct.cliente and vf.tipo = ct.tipocliente)
  on r.contrato = ct.numero
where true
  %Cliente_Contrato
order by r.filial, r.datalancto, r.transacao, r.valorvencto,
         r.codigo, r.codigotiporecebimento, r.datavencto
```

Classificação e implicações:

- **CONFIRMADO:** fatos-base vêm de `recebimentos`; `tiposrecebimentos` e `filiais` são `JOIN`; `cheques`, `contastiposrecebimentos` e o conjunto `contratos`/`vfornecedores` são opcionais no SQL legado (`dmcontrolerecebimentos.dfm:166-204`).
- **CONFIRMADO:** a projeção usa `r.*`, subconsultas correlacionadas para `parcelas`, `autenticacoes`, `tef` e contagem de confirmações, além das funções `contratosdatransacao` e `orcamentosdatransacao` (`:70-164`).
- **POSSÍVEL BUG LEGADO:** há joins explícitos e predicados redundantes de `r.tiporecebimento = tr.codigo` e `r.filial = f.codigo` (`:166-182`); há também SQL comentado com `datalacnto` grafado incorretamente (`:112-119`).
- **DÚVIDA:** o DFM não prova nulabilidade, FK ou cardinalidade. No Laravel, relações com colunas obrigatórias `NOT NULL` devem ser `INNER JOIN`; `LEFT JOIN` só pode permanecer se a ausência for funcionalmente válida e comprovada pelo snapshot do schema.
- **INFERIDO:** subconsultas por linha podem produzir custo repetido; o read model Laravel deve pré-agregar/juntar uma vez, sem N+1.

## 2. Macros e parâmetros da consulta

`ConsultarRecebimentos` define `:operacao` e as seguintes macros (`dmcontrolerecebimentos.pas:234-369`):

| Macro | Regra observada | Evidência |
|---|---|---|
| `SQLRecebimentosDataLancto` | `cast(r.datalancto as date) >=`, `<=`, `between` ou vazio | `:253-266` |
| `SQLRecebimentosDataVencto` | `r.datavencto >=`, `<=`, `between` ou vazio | `:270-283` |
| `SQLRecebimentosDataRecebimento` | `r.data_confirmacao >=`, `<=`, `between` ou vazio | `:288-301` |
| `Filial_Recebimento` | `and r.filial in (<filial>)` ou vazio | `:305-308` |
| `TipoRecebimento_Recebimentos` | `and r.tiporecebimento in (<tipo>)` ou vazio | `:310-313` |
| `Cliente_Contrato` | cliente e tipo de cliente em `ct`, com `or` para cliente vazio conforme código | `:315-319` |
| `meiosdepagamento_Recebimentos` | `r.tef is not null` para TEF, `r.tef is null` para POS, vazio nos demais casos | `:322-328` |
| `CondicaoOperacao` | operação 0/1: `not r.confirmado`; operação 2: `r.confirmado` | `:331-335` |
| `FormadeRecebimentos` | `position(tr.tiporecebimento in '<DHBCPT>') <> 0`, omitido quando nenhum/todos | `:337-359` |

- **CONFIRMADO:** datas, listas e cliente são interpolados em macros, não enviados como binds (`:253-319`).
- **CONFIRMADO:** listas de Filial, Tipo e códigos selecionados são construídas como texto e inseridas em `IN (...)` (`:305-313`, `:790`).
- **POSSÍVEL BUG LEGADO:** valores vindos da interface entram em macro textual após `StrToDateTime`, em vez de bind (`:253-299`).
- **DÚVIDA:** `r.tef IS NULL` ser POS é uma convenção de dados, não uma prova sem o schema.
- **Regra Laravel:** DTO/Form Request tipado, allowlist de filtros/ordenação e binds obrigatórios. Listas devem usar `whereIn`/`IN` ou `= ANY(array)`/`unnest` com arrays vazios definidos; nunca concatenação, macro SQL recebida do cliente ou loop por registro.

## 3. Datasets auxiliares

| Dataset | SQL/finalidade | Evidência |
|---|---|---|
| `qryTiposRecebimentos` | tipos ativos (`inativo is null`) + linha vazia via `UNION ALL`, ordenados por descrição | `dmcontrolerecebimentos.dfm:437-469` |
| `qrySituacaoRecebimentos` | conjunto fixo `N - NORMAL` e `C - CANCELADO` | `:481-499` |
| `qryTipoRecebimento` | `tiposrecebimentos` + conta/evento opcional por Filial; bind `:filialrecebimento`, `:codigo` | `:511-543` |
| `qryAtualizarRecebimentos` | `select r.* from recebimentos r where true %ListadeRecebimentos order by r.controlerecebimento, r.controle` | `:560-569` |
| `qryAtualizarRecebimentos_Aux` | linhas de `recebimentos` usadas para rateio por `codigo` | `:1180-1189` |
| `qryMovtosBancos` | `movtosbancos` por tupla `(conta,data) in (...)`, origem `X` | `:587-623` |
| `qryMovtosBancosEventos` | eventos por `(conta,data,sequencia)` derivados dos movimentos filtrados | `:653-661` |
| `qryMovtosBancosProximaSequencia` | `MAX(sequencia)` em `movtosbancos` por conta/data, com binds | `:718-735` |
| `qryMovtosBancosProximaSequenciaEvento` | `MAX(sequenciaevento)` em `movtosbancoseventos` por conta/data/sequência/evento, com binds | `:752-773` |
| `qryAutenticacoes` | dados de contratos/cupons para uma transação, `tipo <> 'H'`, bind `:transacao` | `:809-846` |
| `spcRecebimentosProximo` | `recebimentos_proximocodigo()` | `:858-860` |
| `qryDocumentosPag` | `documentospag` pelas chaves de documentos, macro `ListaDocumentosPag` | `:884-1038` |
| `qryDuplicatas` | `duplicatas` por tupla `(documentopag, datavencto, numero)`, macro `ListaDuplicatas` | `:1065-1170` |
| `spcDocumentosPagProximo` | `documentospag_proximonumero()` | `:1201-1203` |

**CONFIRMADO:** datasets de consulta e escrita usam o mesmo objeto de transação; os datasets de escrita são `CachedUpdates`/`RequestLive` e são aplicados em conjunto por `Perpetrar` (`dmcontrolerecebimentos.dfm:560-1203`; `dmcontrolerecebimentos.pas:1014`).

## 4. Fluxo de gravação e SQL derivado

`GravarRecebimentos` exige autorização e percorre o dataset principal (`dmcontrolerecebimentos.pas:699-824`). Para cada linha selecionada, acumula listas de:

- códigos de `recebimentos` para `qryAtualizarRecebimentos` (`:786-792`);
- documentos a pagar e duplicatas (`:798-809`);
- pares conta/data de `movtosbancos` e eventos associados (`:810-822`).

Depois, abre os datasets auxiliares, faz `Locate` em memória, cria/edita/apaga documentos, duplicatas, movimentos e eventos, atualiza `recebimentos` e chama `Perpetrar([qryDocumentospag, qryDuplicatas, qryMovtosBancos, qryMovtosBancosEventos, qryAtualizarRecebimentos])` (`:824-1014`).

- **CONFIRMADO:** confirmar atualiza `valor_confirmacao`, `data_confirmacao`, `confirmado`, documento/duplicata e integração bancária; estornar limpa confirmação e remove/ajusta os efeitos relacionados (`:838-1000`).
- **CONFIRMADO:** alterar tipo usa `qryAtualizarRecebimentos` e `qryAtualizarRecebimentos_Aux`, gera novos códigos por `recebimentos_proximocodigo()`, rateia parcelas e persiste (`:1444-1562`).
- **POSSÍVEL BUG LEGADO:** `MAX(sequencia)+1` e `MAX(sequenciaevento)+1` são usados para sequências bancárias (`dmcontrolerecebimentos.pas:923-925`; DFM `:718-773`); concorrência deve ser resolvida pelo contrato autoritativo do banco, não copiada para PHP.
- **INFERIDO:** o percurso/`Locate` por registro caracteriza risco N+1 e de corrida. O Laravel deve preparar um change set set-based, reler e bloquear as chaves necessárias, e executar a unidade transacional definida pelo contrato.
- **Regra Laravel:** não transportar `select *`, listas textuais, `Locate` por item, `MAX()+1` ou efeitos parciais; usar projeção explícita, binds, pré-agregação, `IN`/`ANY(array)`/`unnest`, funções PostgreSQL autoritativas quando comprovadas e auditoria/idempotência.

## 5. Parâmetros do sistema

### O que a tela realmente lê

- **CONFIRMADO:** o DataModule não chama literalmente `parametros_valor('', '')`. Ele consulta `parsistema.RecebimentosIntegradoComBancos`, propriedade cujo getter lê `FList[ctRecebimentosIntegradoComBancos].AsBoolean` (`dmcontrolerecebimentos.pas:856`, `:988`, `clparametrossistema.pas:5792-5800`).
- **CONFIRMADO:** o identificador do parâmetro é `ctRecebimentosIntegradoComBancos = 'Recebimentos Integrado com Bancos'` (`clparametrossistema.pas:2270`), e a integração também exige `DataServidor >= InicioIntegracaoBancos` e data posterior a 01/01/1980 (`dmbasico.pas:17225-17230`).
- **CONFIRMADO:** o catálogo geral é carregado por `ParametrosSistemasSQL`, unindo `parametrosfiliais` a `parametros`, normalizando Filial global para `-1` e ordenando por parâmetro/filial (`clparametrossistema.pas:1889-1910`).
- **INFERIDO:** o Laravel deve representar essa leitura pelo padrão existente de `parametros_valor(nome, filial)`/manifesto de parâmetros, com tipo booleano explícito, precedência Filial→global→ausente e fallback definido pelo contrato; o nome exato da abstração deve ser confirmado no ticket de padrões Laravel.

### SQL do catálogo de parâmetros

```sql
select pf.parametro as codigo,
       (select p.descricao from parametros p where p.codigo = pf.parametro) as parametro,
       valor,
       case when filial is null then -1 else filial end as filial,
       texto
from parametrosfiliais pf
union
select p.codigo, p.descricao as parametro,
       cast(null as varchar) as valor,
       cast(-1 as int2) as filial,
       cast(null as text) as texto
from parametros p
where not exists (
  select parametro from parametrosfiliais where p.codigo = parametro
)
order by parametro, filial desc
```

Fonte: `clparametrossistema.pas:1889-1910`. As rotinas de gravação de parâmetros usam templates `update parametrosfiliais`, `insert into parametrosfiliais` e `delete from parametrosfiliais` (`:1911-1913`), mas não são chamadas pela tela de Controle de Recebimentos nesta pesquisa.

## 6. Candidatos ao snapshot de schema

O snapshot autoritativo deve cobrir, no mínimo:

`recebimentos`, `tiposrecebimentos`, `filiais`, `cheques`, `contastiposrecebimentos`, `contratos`, `vfornecedores`, `parcelas`, `autenticacoes`, `tef`, `documentospag`, `duplicatas`, `movtosbancos`, `movtosbancoseventos`, `parametros`, `parametrosfiliais`.

Também deve comprovar as funções `contratosdatransacao`, `orcamentosdatransacao`, `recebimentos_proximocodigo`, `documentospag_proximonumero` e qualquer trigger/função acionada por `Perpetrar`/gravação. Confirmar no schema as relações, FKs, nulabilidade, cardinalidade, índices, constraints e sequências antes de escrever SQL Laravel.

O snapshot deve ser capturado por procedimento explícito, read-only, versionado com JSON, data, banco/versão, hash SHA e manifest. Não fazer introspecção de schema no request, não usar `information_schema`/`pg_catalog` como fallback de negócio, não testar driver e não usar `hasTable`/`Schema::has*`.

## 7. Lacunas e handoff

- **NÃO LOCALIZADO:** relatório SQL/relatório Delphi associado; a saída observável é o grid. Relatório Laravel com F6 deve compartilhar contrato/read model do grid.
- **NÃO LOCALIZADO:** `parametros_valor('', '')` literal na fonte; há uma camada `TtecParametrosSistema` baseada em `FList` e catálogo `parametros`/`parametrosfiliais`.
- **DÚVIDA:** nulabilidade/cardinalidade de todos os joins; não escolher `LEFT`/`INNER` por aparência do SQL legado.
- **DÚVIDA:** se funções `contratosdatransacao`/`orcamentosdatransacao` são aceitáveis como autoridade compartilhada no Laravel ou precisam de contrato/adaptador documentado.
- **POSSÍVEL BUG LEGADO:** subconsultas correlacionadas, `r.*`, `select *`, concatenação de macros, `MAX()+1` e `Locate` por registro.

Prompts futuros devem citar este artefato, consultar o checkout Laravel e prompts já gerados, usar binds e consultas set-based, explicitar projeções e joins pelo schema, e nunca pedir a reabertura direta dos fontes Delphi.
