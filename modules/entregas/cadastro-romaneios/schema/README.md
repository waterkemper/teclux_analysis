# Snapshot autoritativo — Cadastro de Romaneios

## Origem e integridade

Coleta somente leitura realizada em **2026-08-01 02:48:14 -03**, pela conexão PostgreSQL configurada no contêiner de desenvolvimento `teclux_cloud-php-1`. A coleta executou `BEGIN`, `SET TRANSACTION READ ONLY`, consultas a `pg_catalog` e `ROLLBACK`; não executou DDL, DML de negócio ou migrations.

- Banco lógico: `tecsoft`; schema: `public`.
- Servidor encontrado: **PostgreSQL 9.5.25**, `SQL_ASCII`, timezone `America/Sao_Paulo`.
- Snapshot bruto: [postgresql-authoritative-2026-08-01.json](postgresql-authoritative-2026-08-01.json), SHA-256 `14C3EBCEA42662AD0A5EE5560B6BFEA798022664DF5E37CD6EC67B03DC4A65DE`.
- Funções destacadas: [functions-2026-08-01.sql](functions-2026-08-01.sql), SHA-256 `83DE94DDE11E9AEF7D0F2195B81B6F4CAAEC693FBC9A5D6BFD0273ECAAA57A8A`.

O JSON contém 26 relações, 1.431 colunas, 314 constraints, 118 índices, 115 triggers, oito funções alcançadas e duas sequences. Nenhum objeto solicitado ficou ausente.

## Descobertas que alteram premissas

- **DIVERGENTE** — o ambiente consultado é PostgreSQL **9.5.25**, não 9.6. Prompts e SQL devem mirar a capacidade realmente confirmada ou exigir nova coleta no ambiente de implantação se este não for o autoritativo de produção.
- **CONFIRMADO** — todos os 26 nomes alcançados são tabelas. `vfornecedores`, apesar do prefixo, é tabela física, não view.
- **CONFIRMADO** — `romaneios_proximonumero()` e `documentospag_proximonumero()` chamam `nextval` em sequences homônimas. Elas não são sequences “owned by” de uma coluna; por isso não podem ser substituídas por `MAX()+1`.
- **CONFIRMADO** — `Atualizar_situacao_romaneio(integer)` chama `situacao_romaneio(integer)` e atualiza `romaneios.situacao_romaneio`. A dependência transitiva também está no arquivo de funções.
- **CONFIRMADO** — `incluirconferenciadocumentos` escreve em `conferencia`, `volumesdadosfiscais` e `volumesdadosfiscaisconferencia`.
- **CONFIRMADO** — tabelas escritas possuem triggers legadas e triggers `*_audit_log_new`/`replicacao_set_timestamps_fn`. Duas triggers chamadas `romaneiosnotas_antesinseriratualizar*` estão desabilitadas (`tgenabled = D`); as triggers de inclusão, log, auditoria e timestamps permanecem habilitadas.

## Chaves e joins relevantes

- `romaneios.numero` é PK. `romaneiosnotas` tem PK composta `(romaneio, dadofiscal)` e FKs obrigatórias para `romaneios(numero)` e `dadosfiscais(numero)`: nesses caminhos o contrato normal usa **INNER JOIN**.
- `romaneiosnotas.codigofrete`, `motivoentrega` e `usuario_data_hora_recebimento` são anuláveis; seus relacionamentos opcionais precisam de **LEFT JOIN** quando a linha deve continuar visível sem catálogo/autorizador.
- `romaneios.fornecedor`, `documentopag` e `usuariotransito` são anuláveis. Não converter seus joins para INNER sem que o fluxo filtre explicitamente pela presença.
- `dadosfiscais.filialemissao`, `notas.dadofiscal`, `cupons.dadofiscal`, `produtosdadosfiscais.dadofiscal/produto`, `volumesdadosfiscais.dadofiscal` e `duplicatas.documentopag` são NOT NULL e têm relações confirmadas no snapshot; usar INNER JOIN quando a ausência não for um caso de órfão deliberadamente suportado.
- Endereço e contrato em `dadosfiscais` são anuláveis; os joins correspondentes permanecem opcionais quando usados apenas para enriquecer a grade.

## Cardinalidade e estratégia de consulta

As estimativas confirmam conjuntos grandes: `produtosdadosfiscais` ~8,5 milhões, `conferencia` ~4,1 milhões, `notas`/`dadosfiscais`/`contratos` ~3,6–3,8 milhões, `volumesdadosfiscais` ~1,46 milhão, `romaneiosnotas` ~235 mil e `romaneios` ~126 mil.

Consequências para os prompts:

1. Consulta e grid devem ser server-side; nenhum carregamento integral ou limite silencioso.
2. Eliminar subconsultas correlacionadas repetidas do Delphi. Agregações e enriquecimentos devem ser set-based e apoiados pelos índices confirmados.
3. Relações para um lote usam uma consulta com bindings e `IN`/`= ANY(array)`, incluindo contrato para array vazio e chunking quando necessário; nunca consulta por linha.
4. A PK de `romaneiosnotas` e o índice separado em `dadofiscal` sustentam buscas por romaneio/documento, mas cada SQL final ainda precisa de `EXPLAIN` no ambiente alvo.
5. O Cursor deve consultar este snapshot e o checkout atual antes de escrever SQL. Introspecção em runtime no caminho de negócio continua proibida.

## Limites da evidência

O snapshot registra estrutura e definições, não prova distribuição real, locks, duração das consultas ou comportamento concorrente. `reltuples` é estimativa do catálogo. A coleta deve ser repetida se banco/schema/versão ou data de implantação diferirem, mantendo novo arquivo datado e checksum; nunca sobrescrever evidência histórica sem registrar a troca de origem.
