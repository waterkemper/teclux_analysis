# Prompt 02 — Grid, alterações Delphi, F5 e autorização

Execute `/speckit.specify` para especificar o grid e as alterações da Consulta
Operacional de Recebimentos. Consulte o Laravel atual, prompts já gerados e os
artefatos listados em `01-speckit-prompt-fundacao-consulta-filtros-acesso.md`.
Não peça inspeção direta dos fontes Delphi e não implemente durante specify.

## Limite obrigatório

O módulo não é Cadastro. Não especificar Inclusão, Exclusão, duplicação,
cancelamento cadastral ou edição livre. A identidade é `recebimentos.codigo` e
as únicas operações são exatamente as três observadas:

1. **Alterar tipos de recebimentos** (índice 0): somente candidatos não
   confirmados; editar tipo quando não houver confirmações relacionadas;
   recalcular o grupo `controlerecebimento`, gerar a quantidade exigida pelo
   novo tipo e ratear valores.
2. **Confirmar recebimentos** (índice 1): somente candidatos não confirmados;
   selecionar e alterar data/valor de confirmação e deságio, validar datas,
   marcar confirmação e aplicar seus efeitos.
3. **Estornar recebimentos** (índice 2): somente candidatos confirmados;
   selecionar, remover confirmação/data e desfazer os efeitos relacionados,
   preservando identidades. Estorno não é exclusão.

Não adicionar operações porque um botão, endpoint ou componente do Laravel as
tornaria conveniente.

## Catálogo e comportamento do grid

Especificar um `Catálogo de Grid` próprio com identidade estável (`gridId`,
`screenKey`, `schemaVersion`), título padrão, tipo/formato, visibilidade,
exportabilidade, ordenação permitida e desempate estável. Reutilizar o padrão
Laravel de preferências por Usuário para redimensionar/reordenar/mostrar
colunas, sem permitir que preferência altere identidade, autorização ou
editabilidade.

Preservar as colunas e estados observados: filial, lançamento, valor, vencimento,
valor do vencimento, recebimento, valor confirmado, tipo de recebimento,
percentual/valor de deságio, cliente, nome, contratos, orçamentos e OK. Declarar
explicitamente:

- dados de Filial, datas de lançamento/vencimento, valores originais, Cliente,
  nome, contratos e orçamentos são informativos;
- `tiporec` só é editável no modo 0 e fica somente leitura quando
  `quantidadeconfirmacoes <> 0`;
- `data_confirmacao`, `valor_confirmacao`, `pdesagio` e `VlrDesagio` só são
  editáveis no modo 1, com as validações evidenciadas;
- `confirmado` é seleção operacional por duplo clique, `Ctrl+Space` e
  “Confirmar todos”, não um campo de edição livre;
- `valorlancto` deve ficar somente leitura: a ausência de `ReadOnly` na coluna
  conflita com `ReadOnly=True` no field e é possível bug legado;
- não há inclusão/exclusão pelo grid.

Preservar totalizadores de selecionados, vencimentos, lançamentos, quantidade e
valor marcados, além de cores/legendas de confirmado e confirmações em outros
vencimentos. A seleção no modo 0 pode afetar linhas do mesmo
`controlerecebimento`; nos modos 1/2 altera a data/valor de confirmação como
registrado na pesquisa.

## F5, botões e efeitos

F5/`Confirma` deve operar somente sobre a seleção atual e refletir os três modos
acima. Usar ícones, captions, estados habilitado/desabilitado e atalhos do
command bar Laravel existente, sem criar um quarto comando. Preservar Esc para
voltar aos parâmetros e F9 do prompt 01.

Especificar os efeitos sem copiar a implementação Delphi: confirmação altera
`data_confirmacao`, `valor_confirmacao` e `confirmado`, podendo atualizar/criar
Documento a Pagar, Duplicata, Movimento Bancário e evento quando o parâmetro de
integração se aplicar; estorno desfaz esses efeitos; alteração de tipo recalcula
e rateia as linhas relacionadas. Tudo deve ser uma unidade atômica, com
projeções e comandos set-based, sem `Locate`, loops de query ou N+1.

Usar funções PostgreSQL apenas quando comprovadas no snapshot, principalmente
`recebimentos_proximocodigo()` e `documentospag_proximonumero()`. Não copiar
`MAX()+1`: sequences/estado capturados são informativos, não estratégia de
alocação concorrente.

## Quem pode gravar e senha

Separar três superfícies:

- acesso à página/menu por folha própria em `acessosmodulos` e capability Laravel;
- escopo de Filial validado no backend;
- autorização sensível da alteração.

O Delphi exige `ObterAutorizacaoPagamento` antes de gravar. O Analista de
Crédito pode informar senha; os demais fluxos pedem login dos tipos
`ctANALISTACREDITO`/`ctAUTORIZADO`, e o usuário obtido precisa ter
`analistacredito`. Reproduzir pelo catálogo Laravel de operações sensíveis,
prova contextual, limite de tentativas, auditoria e consumo da prova; nunca
armazenar senha ou tratá-la como autorização permanente. Não inventar senha de
gerente/supervisor nem atribuir ao Delphi capability que não foi localizada.

O parâmetro confirmado é `RecebimentosIntegradoComBancos`, lido pela abstração
Laravel de `parametros_valor(nome, filial)` com o gate de data correspondente.

## Concorrência e aceite

Antes de fechar detalhes de lock, idempotência, auditoria imutável, conflito
Delphi/Laravel e capability individual, consultar o ticket Wayfinder
`08-definir-protecao-alteracoes-financeiras.md`. O Delphi não prova essas regras;
não alegar paridade inexistente. O mínimo não negociável é revalidar as linhas e
efeitos, executar a alteração atomicamente e publicar sucesso somente após
commit. Divergência ou conflito deve ser explícito, nunca vitória silenciosa da
última gravação.

Aceitar somente com testes das três operações, editabilidade por modo, seleção,
rateio, validações de data, parâmetro, Filial, authorization proof, auditoria,
transação, conflito, ausência de N+1 e ausência de operações extras. Não usar
teste de driver, `hasTable`, `Schema::has*`, `information_schema` ou
`pg_catalog` em request, policy ou teste condicional.
