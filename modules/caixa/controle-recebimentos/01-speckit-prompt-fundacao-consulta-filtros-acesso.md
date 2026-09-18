# Prompt 01 — Fundação, consulta, filtros e acesso

Execute `/speckit.specify` para especificar a fundação da **Consulta
Operacional de Recebimentos** no Laravel.

## Pré-condições e fontes

Consulte primeiro o checkout Laravel atual, os prompts já gerados e:

- `modules/caixa/controle-recebimentos/dossie-final.md`;
- `modules/caixa/controle-recebimentos/contrato-dominio-laravel-delphi.md`;
- `modules/caixa/controle-recebimentos/pesquisa-interface-fluxo-delphi.md`;
- `modules/caixa/controle-recebimentos/pesquisa-sqls-parametros-delphi.md`;
- `modules/caixa/controle-recebimentos/pesquisa-autorizacoes-menu.md`;
- `modules/caixa/controle-recebimentos/pesquisa-padroes-laravel-prompts.md`;
- `modules/caixa/controle-recebimentos/schema/README.md`;
- `modules/caixa/controle-recebimentos/schema/postgresql-authoritative-2026-09-01.json`;
- `modules/caixa/controle-recebimentos/schema/controle-recebimentos-schema-manifest.json`.

Não peça reabertura, inspeção ou teste dos fontes Delphi. Eles já estão
representados nos artefatos acima. Não implemente durante `/speckit.specify`.

## Escopo e navegação

Especificar uma página de consulta operacional, não um Cadastro: não criar
Inclusão, Exclusão, CRUD, edição livre ou formulário de chave primária/situação.
Preservar a identidade `recebimentos.codigo` e a situação legada observada
(`recebimentos.situacao = 'N'`). Usar breadcrumb, command bar e layout do padrão
Laravel atual. A seleção de operação deve ser `radio buttons`, não select, com
exatamente: Alterar tipos de recebimentos, Confirmar recebimentos e Estornar
recebimentos.

Criar o acesso da página no caminho `Caixa → Controle de Recebimentos` pelo
padrão atual de `acessosmodulos`, folha própria, rota canônica, middleware e
grant explícito. Isso não foi localizado no Delphi; não inventar grants fora do
catálogo Laravel. Validar no servidor o escopo de Filial do Usuário e tratar
Administrador conforme o padrão existente.

F9 deve abrir o modal padrão de pesquisa do sistema, paginado e autorizado,
especialmente para Cliente. Não criar uma janela de pesquisa específica desta
tela. O modo visual da tela pode manter Enter/Esc conforme o padrão de
navegação, mas F9 não pode ser uma busca improvisada.

## Filtros e read model

Especificar filtros tipados equivalentes aos evidenciados:

- intervalo aberto ou fechado de data de emissão;
- intervalo aberto ou fechado de vencimento;
- intervalo aberto ou fechado de recebimento;
- Filiais autorizadas;
- tipos de recebimento;
- cliente e tipo de cliente;
- forma de recebimento;
- TEF/POS;
- operação, que determina candidatos confirmados/não confirmados.

Preservar defaults e semântica de intervalo somente quando constarem nos
artefatos. Datas vazias não geram predicado; uma extremidade gera `>=` ou `<=`;
duas geram intervalo. Validar tipos e limites no backend.

Especificar uma consulta set-based com projeção explícita para a linha do grid,
sem `select *`, e com a ordenação inicial observada: Filial, data de lançamento,
transação, valor de vencimento, código, tipo e vencimento. Usar bindings em
todos os valores. Listas de Filiais/tipos/meios devem usar `IN`, `= ANY(array)`
ou `unnest`, nunca SQL textual vindo do browser.

Pré-agregar ou juntar uma única vez parcelas, autenticações, TEF, contagem de
confirmações, contratos e fornecedores. Não fazer N+1, query dentro de loop,
lookup por linha ou `Locate`. Consultar o snapshot para cada coluna e objeto.
Relações obrigatórias comprovadas por `NOT NULL`, FK e semântica usam `INNER
JOIN`; `LEFT JOIN` só permanece quando a ausência for funcionalmente opcional e
comprovada. Não decidir join pela aparência do SQL Delphi.

## Parâmetros

Especificar a leitura de `RecebimentosIntegradoComBancos` pela abstração Laravel
existente que chama `parametros_valor(nome, filial)` (ou a sobrecarga catalogada),
com tipo booleano, precedência Filial/global/ausente e fallback explícito. Usar
`ParameterService`/catálogo já existente após verificar os nomes no checkout.
Aplicar também o gate de `InicioIntegracaoBancos` e data do servidor. Não
carregar catálogo com introspecção no request e não gravar parâmetros nesta
tela.

## F6 e critérios desta fatia

F6/Gerar deve iniciar a consulta e renderizar Cancelar imediatamente, antes do
primeiro `await`. Especificar o protocolo padrão Laravel com rastreio da
execução, PID PostgreSQL e cancelamento real por `pg_cancel_backend`; abortar a
espera do cliente só depois de solicitar o cancelamento no servidor. Não tratar
`AbortController` como cancelamento do banco.

Aceitar somente se houver: filtro tipado, escopo de Filial validado no backend,
SQL com bindings e projeção explícita, ausência de N+1, cobertura do snapshot,
join justificado por nulabilidade/FK, F9 padrão, breadcrumb, rádio, menu/grant,
F6 cancelável e nenhuma chamada a teste de driver, `hasTable`, `Schema::has*`,
`information_schema` ou `pg_catalog` no caminho de negócio.
