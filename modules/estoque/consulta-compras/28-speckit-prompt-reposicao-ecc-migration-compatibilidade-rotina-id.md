# Prompt 28 - Migration e compatibilidade do modelo de Rotina ECC

## Objetivo

Adaptar o schema atual, que usa `tipo` como identidade operacional, para permitir N Rotinas ECC nomeadas por filial sem quebrar snapshots, lotes, janelas, excecoes, alertas ou integracoes existentes.

## Migration da rotina

Inspecionar a migration 427 e adicionar, de forma compativel com PostgreSQL 9.5/9.6:

- `nome` ou `nome_exibicao` como nome canonico editavel, com backfill dos tres registros existentes;
- `agenda_json`;
- `regras_temporais_json`;
- `politicas_ecc_json`;
- `config_version` e qualquer metadado necessario para hash/auditoria;
- `tipo` mantido como legado durante a transicao, podendo ser nulo para novas rotinas.

Nao usar funcoes, indices ou sintaxe inexistentes no PostgreSQL suportado pelo projeto. Validar a migration no mesmo ambiente de CI/Docker usado pelo Laravel.

## Identidade e unicidade

- Remover a unicidade `(filial_requisitante, tipo)` como regra de negocio.
- Criar unicidade case-insensitive de nome por filial, ou outra estrategia equivalente compativel com a versao PostgreSQL.
- Mudar lote pendente, janela, identidade de dispatch e consultas de rotina para usar `rotina_id`.
- Manter `tipo` somente onde for necessario para leitura legada, relatorio antigo ou replay de dados historicos.

Inspecionar todas as tabelas ECC que hoje gravam `tipo` e adicionar `rotina_id` onde a referencia da rotina for necessaria, especialmente lotes, janelas, excecoes e auditoria. Snapshots ja vinculados a `rotina_id` devem continuar imutaveis.

## Backfill

Para cada rotina existente:

- nomeia-la com o rotulo atual;
- converter a agenda atual para `agenda_json` equivalente: Geralzao 15 dias; demais 1 dia;
- converter o overlay atual para `regras_temporais_json`;
- copiar os payloads existentes sem inventar filtros;
- converter as regras ECC existentes para `politicas_ecc_json`;
- preservar UUID, revisao, situacao, auditoria, lotes, janelas e snapshots.

O backfill nao deve reescrever snapshots nem recalcular lotes antigos. Uma nova rotina nasce sem defaults de cliente e inativa ate configuracao valida.

## Compatibilidade de leitura

Durante a transicao, leitores antigos podem receber um rotulo derivado do nome ou do codigo legado, mas nenhum novo fluxo deve exigir que `tipo` exista. Documentar a data/condicao para remover a coluna ou o adapter legado.

## Testes obrigatorios

- migration sobe e reverte no PostgreSQL suportado;
- dados legados sao convertidos sem perda;
- N rotinas na mesma filial coexistem;
- dois lotes pendentes de rotinas diferentes nao colidem;
- renomear nao altera referencias;
- snapshots anteriores permanecem byte a byte inalterados;
- clone cria nova rotina e nao compartilha estado mutavel.

