# Prompt 03 — Relatório, F6, Cancelar, exportação e aceite

Execute `/speckit.specify` para especificar relatório e operação de consulta da
Consulta Operacional de Recebimentos. Consulte o checkout Laravel atual, os
dois prompts anteriores, os prompts já gerados e todos os artefatos do README.
Não peça inspeção direta dos fontes Delphi e não implemente durante specify.

## Resultado canônico compartilhado

O Delphi não possui relatório associado: a saída observável é o grid. O
Relatório Laravel é requisito adicional, mas deve reutilizar o mesmo read model,
projeção, filtros, escopo de Filial, identidade de linha, ordenação lógica,
totais e estados do grid. Não criar uma segunda query divergente para PDF,
preview, impressão ou exportação.

Todo relatório deve ser gerado por F6. F6 deve disponibilizar Cancelar assim que
a geração começar, preservar o último resultado completo em caso de
cancelamento e ignorar respostas tardias de execuções anteriores. A geração
deve ter identidade, estado, auditoria e fotografia do mesmo instante lógico
quando o padrão Laravel exigir; uma nova tentativa não sobrescreve a anterior.

## F6 e cancelamento PostgreSQL

Usar o protocolo Laravel existente de `PgsqlGerarQueryRunner`, registro do PID e
`PgsqlQueryCancelRegistry`/serviço equivalente. Antes do primeiro `await`, o
cliente deve marcar ocupado, renderizar Cancelar e criar o trace da execução.
No servidor, Cancelar deve solicitar `pg_cancel_backend` para a sessão real,
aguardar a resposta do servidor e só então encerrar a espera local. Não tratar
`AbortController`, timeout do navegador ou flag visual como cancelamento do
banco.

Aplicar o mesmo protocolo ao F6 da consulta e ao F6 do relatório. Cobrir consulta
vazia, erro, cancelamento antes de resposta, cancelamento depois de iniciar SQL,
resposta tardia e nova geração. Se o padrão de cargas pesadas exigir
`generationId`, polling ou `cancel_url`, seguir o contrato já existente sem
alterar o resultado canônico.

## Grid, exportação e personalização

Usar o Catálogo de Grid definido no Prompt 02 e os componentes Laravel atuais de
grid/preferências. Ordenação enviada pelo browser deve ser uma allowlist do
catálogo com desempate determinístico; preferências são do Usuário e não mudam
autorização, filtros obrigatórios ou editabilidade.

Exportação deve ser server-side, autorizada, limitada ao mesmo conjunto filtrado
e ao escopo de Filial, com as mesmas colunas/formatos do grid. Não aceitar uma
lista de linhas fornecida pelo cliente e não refazer a consulta em loop.

## Schema e SQL

Usar como contrato estrutural
`schema/postgresql-authoritative-2026-09-01.json`, seu manifesto e README. O
checksum deve ser validado em gate de teste/CI, não em request. Se faltar tabela,
coluna, função, tipo, nulabilidade, PK/FK ou relação no snapshot, bloquear o
SQL afetado e exigir nova captura datada.

Usar projeção explícita, bindings e uma consulta set-based. Para listas usar
`IN`, `= ANY(array)` ou `unnest`; pré-agregar fatos relacionados e eliminar
N+1/subconsulta por linha. Escolher `INNER JOIN` quando o vínculo obrigatório
estiver comprovado por `NOT NULL`, FK e semântica; `LEFT JOIN` somente quando a
ausência for funcionalmente opcional e comprovada. Não usar `select *`, SQL
concatenado, `Locate`, `MAX()+1`, teste de driver, `hasTable`, `Schema::has*`,
`information_schema` ou `pg_catalog` no caminho de negócio.

## Requisitos de apresentação

Adicionar breadcrumb padrão, command bar, ícones e atalhos somente para ações
existentes. F9 deve usar o modal padrão de pesquisa. Não transformar o módulo em
Cadastro nem criar campo de chave primária/situação de cadastro.

Nenhuma chave NF-e foi localizada nesta tela. Se uma área compartilhada precisar
desse controle, reutilizar o componente padrão de máscara/validação de chave
NF-e do Laravel; não inventar uma coluna ou filtro de NF-e para este módulo.

## Aceite final

Cobrir rastreabilidade dos filtros, SQL, parâmetro
`RecebimentosIntegradoComBancos`, Filial, autorização, menu, Catálogo de Grid,
preferências, ordenação, colunas editáveis, três operações, F5, F6, Cancelar,
relatório, exportação, F9, breadcrumb, rádio e schema checksum. Verificar que o
relatório e o grid são semanticamente o mesmo resultado, que não existe query
N+1 e que o cancelamento mata a sessão PostgreSQL. Manter como pendência explícita
o ticket de proteção das alterações quando ele ainda não estiver resolvido;
nenhuma lacuna do Delphi pode ser preenchida com uma alegação de comportamento
legado.
