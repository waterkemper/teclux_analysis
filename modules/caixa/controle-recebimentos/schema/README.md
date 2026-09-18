# Schema do Controle de Recebimentos

Snapshot autoritativo capturado em **2026-09-01 23:19:07 -03:00** na conexão PostgreSQL efetiva do container Laravel `teclux_cloud-php-1`.

- Banco: `tecsoft`
- Schema: `public`
- Usuário: `tecsoft`
- PostgreSQL: `9.5.25`
- Encoding do servidor/cliente: `SQL_ASCII`
- Timezone: `America/Sao_Paulo`
- Modo: `BEGIN; SET TRANSACTION READ ONLY; pg_catalog; ROLLBACK`
- Snapshot: [`postgresql-authoritative-2026-09-01.json`](postgresql-authoritative-2026-09-01.json)
- Manifesto: [`controle-recebimentos-schema-manifest.json`](controle-recebimentos-schema-manifest.json)
- SHA-256: `AC9136556EAE72DF6D33A312C3FF58B3A66FC957BEE39AEAA2B6B532758A70AC`

## Cobertura

O JSON registra, para as 16 relações diretas dos SQLs da consulta, datasets auxiliares e persistência extraídos do Delphi: colunas, tipos, nulabilidade, defaults, constraints, PK/FK, índices, triggers, estimativa estrutural de linhas e definição de view quando aplicável. Também registra 29 sequences descobertas por ownership/nome e 44 funções: as cinco funções solicitadas e as funções de trigger das relações capturadas.

Relações cobertas: `recebimentos`, `tiposrecebimentos`, `filiais`, `cheques`, `contastiposrecebimentos`, `contratos`, `vfornecedores`, `parcelas`, `autenticacoes`, `tef`, `documentospag`, `duplicatas`, `movtosbancos`, `movtosbancoseventos`, `parametros` e `parametrosfiliais`.

Funções solicitadas: `contratosdatransacao(integer)`, `orcamentosdatransacao(integer)`, `recebimentos_proximocodigo()`, `documentospag_proximonumero()`, e as sobrecargas disponíveis de `parametros_valor`.

Pontos estruturais relevantes para os prompts:

- `recebimentos.codigo` é a PK; `tiporecebimento` e `filial` têm FKs para `tiposrecebimentos.codigo` e `filiais.codigo`, mas são nullable no snapshot. A escolha de `INNER` ou `LEFT` deve seguir a semântica do caso, não copiar cegamente o join legado.
- `contastiposrecebimentos` possui chave composta `(tiporecebimento, filial)` e campos de vínculo `NOT NULL`; é uma relação opcional de configuração somente quando a ausência for funcionalmente válida.
- `cheques.numero` e `contratos.numero` são obrigatórios em suas próprias tabelas; a presença da referência em `recebimentos.cheque`/no contrato derivado continua opcional porque os campos de origem são nullable.
- `parcelas.transacao` e `autenticacoes.transacao` são nullable; suas consultas auxiliares devem ser agregadas/set-based, nunca uma consulta por linha.
- `movtosbancos` usa PK `(conta, data, sequencia)` e `movtosbancoseventos` usa PK `(conta, data, sequencia, evento, sequenciaevento)`; o snapshot não autoriza `MAX()+1` como alocação concorrente.
- `parametros` e `parametrosfiliais` comprovam a origem estrutural do catálogo de parâmetros. O acesso Laravel deve usar a abstração existente para `parametros_valor`, sem catálogo em request.

## Como repetir a captura

1. Executar a coleta no ambiente PostgreSQL autoritativo efetivamente usado pelo Laravel, nunca em SQLite de teste.
2. Abrir uma transação, executar `SET TRANSACTION READ ONLY`, consultar somente os catálogos necessários para as relações/funções listadas e finalizar com `ROLLBACK`.
3. Produzir um novo arquivo `postgresql-authoritative-YYYY-MM-DD.json` sem sobrescrever este snapshot; registrar timestamp com fuso, banco, schema, usuário, versão, encodings, timezone, objetos requisitados, objetos ausentes e contagens.
4. Recalcular SHA-256 do JSON e atualizar o manifesto no mesmo change set. Validar que o hash do manifesto corresponde byte a byte ao arquivo.
5. Comparar a cobertura nova com os SQLs e com este manifesto. Relação, coluna, tipo, nulabilidade, PK/FK, índice, trigger ou função divergente bloqueia o SQL afetado até a análise ser registrada.

As consultas de catálogo são ferramenta explícita de captura. Não devem ser copiadas para request, service, policy ou teste condicional de driver. O caminho de negócio não pode usar `hasTable`, `Schema::has*`, `information_schema` ou `pg_catalog` para decidir comportamento.

## Regras de uso

Este snapshot é gate de especificação/CI para evitar SQL inventado. Antes de escrever uma query, localizar a tabela e a coluna neste JSON e conferir o significado no dossiê Delphi/Laravel. Usar projeção explícita, binds e consultas set-based com `IN`, `= ANY(array)` ou `unnest` quando necessário; não usar `select *`, concatenação de SQL, N+1, loops `Locate` ou `MAX()+1`.

Cardinalidade, desempenho e cancelamento real de consultas devem ser verificados contra PostgreSQL durante a implementação, com `F6` cancelável desde o início. A captura do schema não é uma justificativa para introspecção runtime.
