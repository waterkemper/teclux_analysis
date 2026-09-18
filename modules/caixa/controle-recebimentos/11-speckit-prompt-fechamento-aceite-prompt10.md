# Prompt 11 — Fechamento do aceite do Prompt 10

Execute `/speckit.specify` para fechar somente o aceite e a higiene dos testes
da correção 469 (`Prompt 10`) em `/caixa/controle-recebimentos`. Leia a
auditoria atual, o Prompt 10, a spec `laravel/specs/469-fix-cr-evento-destino/`
e o checkout Laravel atual. Use apenas os artefatos versionados; não peça para
abrir, reler ou conferir diretamente qualquer fonte Delphi. Não implemente
nesta execução do `/speckit.specify`.

## Decisão funcional já fechada

Para o snapshot autoritativo atual não existe alocador seguro para
`movtosbancos.sequencia` ou `movtosbancoseventos.sequenciaevento`. Portanto, a
mudança de `data_confirmacao` que exige um novo efeito bancário deve continuar
recusando com `movimento_sem_alocador` antes da primeira escrita. Não criar
inserção bancária, não inventar sequência e não copiar `MAX()+1`.

O código atual já removeu a sobrescrita do evento destino e bloqueia a
transição antes de `recebimentos`, Contas a Pagar, DELETE/UPDATE de eventos,
movimentos ou vínculos. Não alterar essa regra nem reabrir UI, grid, relatório,
F6/Cancelar, F5/F7, F9, autorização, menu, breadcrumb, máscara NF-e, read model,
`VlrDesagio`, Contas a Pagar, lote ou estorno.

## Correções obrigatórias no aceite

1. Remover dos testes novos ou tocados por este prompt toda verificação
   explícita de driver: não usar `DB::connection()->getDriverName()`,
   `assertSame('pgsql', ...)`, `markTestSkipped` por driver ou ramificação de
   driver. A seleção da conexão PostgreSQL é responsabilidade do comando de
   execução/ambiente da suíte; `@group postgres` pode permanecer como filtro
   externo. Não testar `hasTable`, `Schema::has*`, `information_schema` ou
   `pg_catalog`.
2. Substituir o limite arbitrário de consultas do teste de transição pelo
   `Tests\Support\DatabaseQueryCountAsserter`. O teste deve comparar um lote
   pequeno e um lote maior, mantendo o custo de leitura independente da
   quantidade de linhas e sem uma consulta por linha. Não declarar sucesso
   bancário para satisfazer o orçamento: o cenário vigente continua sendo
   recusa pré-escrita.
3. Fortalecer os cenários de recusa para comparar o estado completo antes e
   depois, incluindo, quando existentes, `recebimentos`,
   `documentospag`/`duplicatas`, `movtosbancos` antigo e destino e todos os
   `movtosbancoseventos` envolvidos. Deve ficar comprovado que 422 não altera
   valor, cabeçalho, identidade, datas, vínculos, títulos ou idempotência.
   Comparações devem ser determinísticas e feitas por chaves explícitas.
4. Manter casos para destino vazio, outro código de evento, múltiplos eventos,
   destino ambíguo, replay após recusa e mudança de data HTTP. Cada caso deve
   verificar o estado preservado, e nunca apenas ausência de exceção ou status
   HTTP.
5. Manter a regressão de confirmação na mesma data: o evento da linha pode
   sofrer somente seu delta; eventos irmãos não podem ser sobrescritos. Não
   transformar testes unitários de `rowCount`/rollback existentes em testes
   condicionais de ambiente; apenas garantir que não sejam removidos ou
   enfraquecidos.

## Guardrails

Não alterar produção para criar alocador bancário, não adicionar métodos de
sequência ao alocador de documento/recebimento, não usar `MAX()+1`, SQL
concatenado, inferência por valor/posição/ordem, N+1, `Locate`, introspecção de
schema ou teste de driver. Não adicionar tabela, migration, CRUD, permissão ou
novo comportamento de tela. Não pedir inspeção direta dos fontes Delphi.

O resultado deve ser um spec pequeno e executável, restrito aos testes e à
documentação necessária para o aceite do ramo de recusa atômica do Prompt 10.
