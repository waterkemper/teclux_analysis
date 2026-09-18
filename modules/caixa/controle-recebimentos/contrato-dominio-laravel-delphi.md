# Contrato de domínio — Consulta Operacional de Recebimentos

Este documento fixa o contrato funcional que os prompts SpecKit devem usar. A
fonte de comportamento legado é o dossiê
[`pesquisa-interface-fluxo-delphi.md`](pesquisa-interface-fluxo-delphi.md),
complementado por
[`pesquisa-sqls-parametros-delphi.md`](pesquisa-sqls-parametros-delphi.md),
[`pesquisa-autorizacoes-menu.md`](pesquisa-autorizacoes-menu.md),
[`pesquisa-padroes-laravel-prompts.md`](pesquisa-padroes-laravel-prompts.md) e
o snapshot de schema em
[`schema/README.md`](schema/README.md).

## Limite do domínio

O módulo é uma **Consulta Operacional de Recebimentos**. Ele consulta
recebimentos existentes e executa **Alterações de Recebimento** autorizadas;
não é Cadastro, não faz Inclusão e não faz Exclusão.

O grid Delphi confirma esse limite: `BeforeInsert` e `BeforeDelete` abortam a
operação (`dmcontrolerecebimentos.pas:1156-1168`), e o grid não permite criar ou
excluir registros (`fmcontrolerecebimentos.dfm:741-781`). A identidade da linha
é `recebimentos.codigo`; `controlerecebimento` agrupa linhas relacionadas para
as regras de confirmação e para a alteração de tipo.

Não transformar campos expostos pelo dataset em um CRUD. Uma coluna só pode ser
alterada quando a regra do modo de operação abaixo permitir explicitamente.

## Modos e operações permitidos

O `TRadioGroup` começa no índice 0 e expõe exatamente estes modos
(`fmcontrolerecebimentos.dfm:531-550`):

| Índice | Modo Delphi | Candidatos consultados | Alterações permitidas |
|---:|---|---|---|
| 0 | Alterar tipos de recebimentos | `not r.confirmado` | alterar `tiporec`/tipo de recebimento; confirmar a alteração; recalcular as linhas do mesmo `controlerecebimento`, criando a quantidade de linhas exigida pelo tipo e rateando valores |
| 1 | Confirmar recebimentos | `not r.confirmado` | selecionar linhas e alterar data/valor de confirmação e deságio; confirmar o recebimento e seus efeitos relacionados |
| 2 | Estornar recebimentos | `r.confirmado` | selecionar linhas e remover confirmação/data, desfazendo os efeitos relacionados |

As operações são alterações de registros existentes. Não adicionar ações
semelhantes a incluir, duplicar, excluir, cancelar cadastro ou editar livremente
qualquer coluna.

### Alteração de tipo

O Delphi pede confirmação textual e autorização antes de
`RecalcularRecebimentos` (`dmcontrolerecebimentos.pas:1444-1562`). O fluxo
consulta as linhas relacionadas por `controlerecebimento`, obtém conta/evento
para filial e tipo, gera novas linhas conforme `numerorecebimentos`, rateia os
valores arredondando as parcelas intermediárias e atribuindo o saldo à última,
e persiste em uma unidade de gravação.

Se a integração bancária estiver ativa e o tipo não possuir conta/evento para a
filial, o Delphi recusa/restaura a alteração
(`dmcontrolerecebimentos.pas:1051-1074`). Se já houver confirmações, o tipo fica
somente leitura após o scroll (`dmcontrolerecebimentos.pas:1437-1442`).

### Confirmação

O Delphi altera `data_confirmacao`, `valor_confirmacao` e `confirmado`, valida
datas e pode calcular `valor_confirmacao` a partir de `pdesagio`
(`dmcontrolerecebimentos.pas:1033-1145`). A data não pode ser anterior ao
lançamento nem posterior à data do servidor.

Ao gravar, pode atualizar/criar Documento a Pagar e Duplicata e, quando a
integração bancária estiver ativa, criar/atualizar Movimento Bancário e seus
eventos (`dmcontrolerecebimentos.pas:838-983`). Esses efeitos pertencem à mesma
intenção de confirmação; não publicar sucesso antes do commit.

### Estorno

O modo 2 remove a confirmação e a data e desfaz Documento a Pagar, Duplicata e,
quando aplicável, Movimento Bancário/evento (`dmcontrolerecebimentos.pas:985-1000`).
Não interpretar “estorno” como exclusão do Recebimento ou da Duplicata: é uma
alteração financeira reversora que preserva as identidades existentes conforme
o comportamento observado.

## Editabilidade e seleção do grid

O contrato de UI deve declarar editabilidade por coluna e modo:

- `filial`, `datalancto`, `valorlancto`, `datavencto`, `valorvencto`, `cliente`,
  `nomecliente`, `listacontratos` e `ListaOrcamentos` são apresentados como
  informação; não conceder edição livre.
- `tiporec` é editável apenas no modo 0 e fica bloqueado quando
  `quantidadeconfirmacoes <> 0`.
- `data_confirmacao`, `valor_confirmacao`, `pdesagio` e `VlrDesagio` são
  editáveis apenas no modo 1, respeitando as validações do Delphi.
- `confirmado` é a marcação/seleção operacional. Duplo clique, `Ctrl+Space` e
  “Confirmar todos” alteram a seleção; no modo 0 a seleção pode propagar-se a
  linhas do mesmo `controlerecebimento`, e nos modos 1/2 preenche ou limpa
  confirmação.
- `valorlancto` tem divergência entre coluna visualmente editável e field
  `ReadOnly=True` (`fmcontrolerecebimentos.dfm:801-808`;
  `dmcontrolerecebimentos.dfm:234-238`). Classificar como possível bug legado e
  manter somente leitura no contrato, sem ampliar a permissão.

O grid deve preservar ordenação, seleção, totalizadores, cores de situação e
preferências pelo padrão Laravel (`Catálogo de Grid` e `Preferência de Grid`),
sem permitir que preferências alterem autorização ou editabilidade. A saída de
um eventual Relatório Laravel deve usar o mesmo contrato/read model e o mesmo
leiaute de colunas; relatório não foi localizado no Delphi e, portanto, é
requisito adicional, não comportamento legado.

## Consulta, filtros e atalhos

Preservar os filtros observados: intervalos abertos de emissão, vencimento e
recebimento; Filiais; tipos de recebimento; cliente/tipo de cliente; forma de
recebimento; TEF/POS; e operação. A situação fixa observada é `r.situacao =
'N'`. Filiais devem ser validadas no backend pelo escopo do Usuário, não apenas
aceitas do frontend.

F6 gera a consulta. O Laravel deve mostrar Cancelar imediatamente e executar
cancelamento PostgreSQL real, pois isso não existe no Delphi. F5 grava a
alteração selecionada. Esc retorna da aba de resultados aos parâmetros. F9 deve
usar o modal padrão de pesquisa do Laravel; o Delphi só fornece pesquisa herdada
e o frame de cliente, não uma janela própria desta tela.

As listas devem ser tipadas e set-based, usando uma única consulta com `IN`,
`= ANY(array)` ou `unnest` quando aplicável. Não reproduzir macros textuais,
concatenação, subconsulta N+1, `Locate` por item ou `select *`. Consultar o
snapshot antes de escrever SQL; relações obrigatórias comprovadas por
`NOT NULL`/FK/semântica usam `INNER JOIN`, e `LEFT JOIN` fica restrito às
relações opcionais comprovadas.

## Autorização, parâmetro e transação

Abrir/consultar a tela não tem autorização sensível localizada nas units. A
gravação chama `ObterAutorizacaoPagamento` (`dmcontrolerecebimentos.pas:699-706`):
o Analista de Crédito atual informa senha; os demais fluxos solicitam login dos
tipos `ctANALISTACREDITO`/`ctAUTORIZADO`; o usuário obtido só é aceito se tiver
`analistacredito` (`:1567-1587`). Não inventar senha de gerente/supervisor ou
capability Delphi não evidenciada. No Laravel, separar acesso ao menu/capability
da autorização sensível, usando prova contextual, Filial, auditoria e sem
armazenar senha.

O único parâmetro específico confirmado é
`RecebimentosIntegradoComBancos`, com o gate de data de
`InicioIntegracaoBancos` (`clparametrossistema.pas:2270`, `:5792-5800`;
`dmbasico.pas:17225-17230`). A leitura Laravel deve passar pela abstração
existente de `parametros_valor`, sem carregar catálogo no request.

O Delphi acumula alterações e chama `Perpetrar` sobre recebimentos, documentos,
duplicatas, movimentos e eventos ao final (`dmcontrolerecebimentos.pas:824-1021`).
O prompt Laravel deve exigir atomicidade, revalidação das linhas e efeitos
antes do commit, idempotência e conflito explícito entre Delphi/Laravel. A
evidência não comprova uma estratégia legada de idempotência, lock, auditoria
ou concorrência; esses pontos devem ser definidos como proteção do novo fluxo,
sem afirmar paridade inexistente.

## Requisitos adicionais, não atribuídos ao Delphi

- menu `Caixa → Controle de Recebimentos`, folha em `acessosmodulos`, middleware
  e grants seguem o padrão Laravel auditado, pois não foram localizados nas
  units Delphi;
- relatório com F6, Cancelar e o mesmo leiaute do grid é requisito novo, pois
  não há componente/rotina de relatório na tela;
- máscara de chave NF-e deve reutilizar o componente compartilhado do Laravel,
  pois nenhuma chave NF-e ocorre nesta tela;
- breadcrumb, ícones e atalhos devem seguir o padrão Laravel correspondente às
  ações existentes, sem criar operações que o Delphi não permite;
- não usar `hasTable`, `Schema::has*`, `information_schema`, `pg_catalog` ou
  teste condicional de driver no caminho de negócio, e não pedir ao agente futuro
  para reabrir os fontes Delphi.
