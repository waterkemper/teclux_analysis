# Prompt 32 - Escopo por filial e read models por Rotina ECC

## Contexto da revisao

Os prompts 27 a 31 foram implementados no `origin/main` ate o commit `d5bce473`. O caminho de cadastro, agenda, snapshot e calculo ja usa `rotina_id` como identidade principal. Esta fatia corrige as superficies que ainda podem expor, filtrar ou agrupar dados pelo codigo legado ou sem respeitar o escopo de Filiais autorizado ao usuario.

## Achados que devem ser corrigidos

### 1. Escopo de Filial Requisitante nas leituras

`ReposicaoEccPageService::indexProps()` chama `listAll()` e lista lotes sem receber um escopo de filiais do usuario. `filiaisLookup()` descarta o usuario e devolve todas as filiais. `rotinasShow()`, `lotesShow()`, `lotesIndex()` e consultas operacionais semelhantes autorizam somente o acesso ao modulo, sem validar a Filial Requisitante do registro.

Corrigir para que:

- Administrador veja todas as Filiais autorizadas pelo contrato administrativo;
- usuario nao administrador veja somente Filiais cobertas por `UserBranchAccessService`;
- index, rotinas, lotes, janelas, excecoes, alertas e indicadores usem o mesmo escopo;
- GET por UUID de Rotina ou lote de outra filial retorne recusa segura, sem revelar se o UUID existe;
- filtros de filial informados pelo cliente sejam intersectados com o escopo autorizado, nunca usados para ampliar acesso;
- lookups de filial exibam somente filiais selecionaveis pelo usuario;
- store/update/ativar/desativar/clonar e todas as leituras tenham a mesma regra de autorizacao.

Nao aceitar o argumento “o usuario tem grant do modulo” como substituto da autorizacao da filial. O grant habilita a folha; `UserBranchAccessService` habilita o estabelecimento.

### 2. Read models por Rotina, nao por tipo

As listagens devem identificar a rotina pelo UUID e exibir o nome apropriado:

- `CloudReposicaoEccJanelaRepository::listRecent()` deve retornar `rotina_id`, nome atual da rotina e, quando houver snapshot, `nome_no_corte`;
- `ReposicaoEccPageService::loteListItem()` deve exibir o nome atual da rotina e separar dele o nome fotografado no snapshot;
- excecoes devem aceitar filtro `rotina_id` e retornar o nome atual, mantendo `tipo_rotina` somente como codigo legado opcional;
- alertas devem aceitar filtro e retorno por `rotina_id`; falhas de job devem preservar o vinculo da execucao/lote com a rotina quando essa informacao existir;
- indicadores devem aceitar `rotina_id` como filtro principal e exibir series agrupadas pela mesma selecao;
- `tipo`, `tipo_rotina` e `codigo_legado` nao podem ser o titulo, a chave ou o agrupamento principal de uma rotina nova.

Ao renomear uma rotina, listagens vivas mostram o nome atual. O snapshot continua mostrando o `nome_no_corte` congelado. Expor ambos quando isso for necessario para auditoria, sem sobrescrever a fotografia.

### 3. Indicadores coerentes com o filtro

`ReposicaoEccIndicadoresService::consultar()` aplica `rotina_id` a algumas metricas, mas `calcularSeries()` recebe somente filiais. Isso pode devolver cards filtrados para uma rotina e series calculadas para todas as rotinas da filial.

Propagar o filtro normalizado de `rotina_id` e, se mantido por compatibilidade, o codigo legado, para todas as consultas e agrupamentos. A resposta deve declarar o escopo efetivo e produzir cards e series sobre o mesmo conjunto de Rotinas. Cache keys devem incluir todos os filtros efetivos.

### 4. Excecoes e alertas

Adicionar o filtro de `rotina_id` ao request/controller/service/repository de excecoes e alertas. Para consultas sem filtro explícito, aplicar o escopo autorizado do usuario em vez de buscar todos os clientes/filiais.

Preservar alertas agregados que nao pertencem a uma rotina, como backlog global, mas marcá-los explicitamente como agregados. Um alerta de lote, janela ou execucao deve carregar a rotina quando o alvo permitir resolvê-la.

Nao misturar `alertas.tipo` (classe do alerta, como `job_falhou`) com `tipo` legado da rotina. Sao conceitos diferentes.

## Contratos e tipos TypeScript

Atualizar os envelopes e tipos para que:

- `rotina_id` seja obrigatorio nos registros novos que pertencem a uma rotina;
- `nome_rotina` ou equivalente seja fornecido nos read models atuais;
- `tipo`/`tipo_rotina` sejam opcionais e marcados como legado;
- filtros aceitem UUIDs de rotina, com validacao de pertencimento ao escopo antes da consulta;
- uma rotina nova sem codigo legado seja exibida normalmente em todas as telas.

## Testes obrigatorios

1. Usuario com acesso ao modulo e Filial 1 nao ve nem abre rotina, lote, excecao, alerta ou indicador da Filial 2; Administrador continua vendo ambos.
2. Lookup de filiais do mesmo usuario nao devolve Filial 2.
3. Duas Rotinas sem codigo legado na mesma Filial aparecem separadas por UUID e nome.
4. Filtro `rotina_id` de excecoes, alertas, lotes e indicadores retorna somente aquela rotina.
5. Indicadores com `rotina_id` filtrado produzem cards e series sem dados de outras rotinas.
6. Apos rename, listagem viva mostra nome novo, enquanto snapshot mostra nome antigo no corte.
7. Falha de job ligada a uma rotina preserva `rotina_id`; alerta agregado continua sem rotina e explicitamente agregado.
8. Filtro por codigo legado continua funcionando apenas como compatibilidade e nao inclui rotinas novas sem codigo.
9. Nenhum endpoint de leitura permite IDOR usando somente um UUID conhecido.
10. Regressao dos testes ECC 27-31 permanece verde.

## Nao fazer

- Nao reintroduzir `tipo` como categoria comportamental;
- nao remover snapshots nem alterar historico;
- nao misturar codigo de tipo de alerta com codigo legado de rotina;
- nao conceder acesso a filial apenas porque o usuario possui grant do modulo;
- nao resolver o problema filtrando apenas na UI: o escopo deve ser aplicado no backend e no repositorio.

