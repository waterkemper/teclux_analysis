# Prompt 37 - Correção residual da política canônica ECC após o Prompt 36

## Contexto

O Prompt 36 foi implementado no commit `884fb6bb` (`ecc 36`), comparado ao fechamento anterior `f760ede6` (`ecc 35`). A revisão estática encontrou resíduos que ainda podem produzir falha em PostgreSQL 9.5/9.6 ou resultados diferentes entre emissão, leitura e reconhecimento.

Não reabrir cadastro de Rotinas, agenda, snapshot, cálculo, confirmação, pedidosfiliais, migration, coluna, índice ou DDL. Não misturar esta tarefa com o ajuste do F10 já registrado no Prompt 37 de outra frente.

## Achados confirmados

### 1. A expressão NULL-safe não é compatível com `rotina_id` UUID

Em `backend/app/Infrastructure/Persistence/Cloud/Estoque/ReposicaoEcc/CloudReposicaoEccAlertaRepository.php:270-279`, a implementação usa:

```sql
COUNT(DISTINCT COALESCE(rotina_id, ''))
```

`rotina_id` é UUID. Quando houver candidato com `rotina_id` nulo, o PostgreSQL pode tentar converter `''` para UUID, produzindo erro em vez de classificar o par. Isso viola o contrato para `NULL + UUID` e para todos os candidatos nulos. A solução não pode converter UUID/lista para texto nem depender de `MIN`/`MAX` com `NULL`.

### 2. `mapRow` ainda diverge do resolver para alvo órfão ou não confiável

Em `CloudReposicaoEccAlertaRepository.php:443-485`, quando o alvo materializa um `rotina_alvo_id`, mas a Rotina viva (`r_alvo`) não existe, `mapRow` mantém esse UUID na saída. O resolver `ReposicaoEccAlertaVinculoResolver` retorna Rotina nula e vínculo não confiável nesse cenário.

Além disso, as constantes `FILIAL_RESOLVIDA`/`ROTINA_RESOLVIDA` (`:18-24`) fazem fallback para os campos persistidos do alerta. Para alvo com vínculo nulo e alerta persistido preenchido, isso pode incluir o alerta no filtro e projetar um vínculo que o resolver não reconhece. As comparações de divergência também não são NULL-safe: valor preenchido contra alvo nulo pode resultar em `UNKNOWN` e escapar da exclusão.

Consequências possíveis:

- alerta órfão aparece com uma Rotina que não pode ser resolvida;
- filtro por Rotina encontra alerta que deveria ser inelegível;
- listagem, detalhe, contagem e reconhecimento discordam da emissão;
- persistido `NULL` versus valor preenchido não é tratado como divergência.

### 3. A política de pares continua duplicada nos repositórios de snapshot e janela

`CloudReposicaoEccSnapshotRepository::pickCanonical` e `CloudReposicaoEccJanelaRepository::pickCanonical` mantêm classificação própria por arrays de Rotina/filial (`(string) null` e `(int) null`), enquanto o resolver usa `ReposicaoEccAlertaVinculoPares::classificar`.

Mesmo que os casos atuais coincidam, continuam existindo duas fontes de semântica para pares, `NULL`, blank e escolha do menor identificador. O contrato do Prompt 36 exige política única de fato ou prova de equivalência completa.

### 4. O caminho direto de `upsertAtivo` ainda pode burlar o resolver

`CloudReposicaoEccAlertaRepository::upsertAtivo` aceita `rotina_id` e `filial_requisitante` diretamente e preenche campos nulos sem revalidar que o payload corresponde ao alvo. `ReposicaoEccAlertaService::payloadVinculoParaUpsert` também devolve o payload quando o vínculo não é confiável, desde que `divergentePersistido` seja falso.

Assim, um alvo órfão, agregado ou não resolvível pode receber vínculo inventado pelo payload, contrariando a regra de que alvo ambíguo/não confiável não deve gravar vínculo do payload. Vínculos preenchidos continuam imutáveis.

### 5. O predicado atômico de reconhecimento não recebe o escopo autorizado

`ReposicaoEccAlertaService::reconhecer` valida o alerta pelo serviço de autorização antes de chamar `CloudReposicaoEccAlertaRepository::reconhecer`, mas o método do repositório recebe apenas id, revisão e usuário. O `UPDATE` em `CloudReposicaoEccAlertaRepository.php:184-197` não contém predicado de escopo autorizado.

No PostgreSQL o bloqueio de linha reduz a janela, porém no SQLite e em qualquer ambiente sem lock equivalente a gravação ainda não prova escopo no instante do `UPDATE`. A solução deve reutilizar o escopo já fornecido pelo serviço de autorização, sem criar um segundo mapa de filiais.

## Objetivo

Fazer com que a classificação de candidatos, a projeção do envelope, a elegibilidade de leitura, a reemissão e o reconhecimento usem exatamente a mesma política, com SQL compatível com UUID/`NULL`, sem fallback indevido para campos persistidos e com escopo incluído na gravação atômica.

## Alterações obrigatórias

### A. Corrigir NULL sem converter UUID para texto

1. Substituir `COALESCE(rotina_id, '')` e qualquer variante equivalente por uma expressão NULL-safe que preserve o tipo da coluna e funcione em PostgreSQL 9.5/9.6 e SQLite.
2. A expressão deve distinguir explicitamente:
   - Rotina nula e Rotina preenchida;
   - filial nula e filial preenchida;
   - todos os candidatos com o mesmo par, inclusive ambos nulos;
   - pares distintos.
3. Não usar `MIN <> MAX`, `MIN = MAX`, cast de UUID para texto, `DISTINCT ON` ou `DISTINCT` como máscara de conflito.
4. Aplicar a mesma regra às subconsultas canônicas, à exclusão de conflito, à divergência persistido-versus-alvo e aos predicados usados no reconhecimento.
5. Adicionar teste de integração que execute a SQL real com:
   - candidato `rotina_id = NULL` e candidato UUID;
   - todos os candidatos com Rotina nula;
   - filial nula e filial preenchida;
   - persistido preenchido contra alvo nulo.

### B. Alinhar a projeção ao resultado do resolver

1. Extrair um read model/projeção canônica reutilizável ou adaptar a consulta para que `mapRow`, listagem, detalhe, contagem, filtro por Rotina e reconhecimento consumam o mesmo resultado lógico do resolver.
2. Para Rotina alvo inexistente/órfã, a projeção deve retornar `rotina_id = NULL`, `nome_rotina = NULL`, vínculo não confiável e sem alegar que o UUID histórico é uma Rotina resolvida.
3. Para alvo com vínculo nulo e persistido preenchido, tratar a diferença como divergência; não usar o campo persistido como fallback de vínculo resolvido.
4. Preservar apenas os ids históricos (`a.id` e `a.alvo_id`), sem alterar fatos, alvo ou snapshot.
5. Manter a regra já aceita para alerta agregado explícito, mas diferenciá-la de alvo órfão e não permitir que um payload arbitrário crie Rotina/filial resolvida.
6. O filtro por `rotina_id`, a listagem e a contagem devem concordar tanto no resultado quanto no envelope (`rotina_id`, nome, filial e `agregado`).

### C. Centralizar classificação de candidatos

1. Fazer `CloudReposicaoEccSnapshotRepository` e `CloudReposicaoEccJanelaRepository` consumirem `ReposicaoEccAlertaVinculoPares::classificar` ou uma política compartilhada equivalente.
2. Se a escolha do menor id precisar continuar no repositório, a política compartilhada deve devolver explicitamente o candidato canônico, e o repositório deve somente materializar esse resultado.
3. Garantir que snapshot tenha precedência sobre janela para execução em todos os caminhos.
4. Provar que dois candidatos com o mesmo par produzem o mesmo envelope e que qualquer par distinto produz conflito, inclusive nos casos com `NULL`.

### D. Fechar o contrato de emissão e reemissão

1. `payloadVinculoParaUpsert` só pode usar valores do payload quando a política permitir expressamente esse caso.
2. Para vínculo ambíguo, órfão, divergente ou não confiável, não gravar `rotina_id` nem `filial_requisitante` derivados do payload.
3. Para vínculo confiável, permitir apenas valores iguais ao alvo e preencher somente campos persistidos ausentes.
4. Tornar impossível que uma chamada direta de `upsertAtivo` introduza vínculo conflitante com o alvo: validar o contrato no limite do repositório ou substituir a API por uma entrada já normalizada pela política.
5. Adicionar teste direto do repositório e teste pelo service para payload conflitante em alerta novo e em alerta existente com campos nulos.

### E. Reconhecimento atômico com escopo

1. Reutilizar `ReposicaoEccAuthorizationService::authorizedFiliais` ou o contrato de escopo existente e transportar o conjunto efetivo para o predicado de gravação.
2. No `UPDATE`, exigir simultaneamente:
   - id do alerta;
   - revisão esperada;
   - estado `ativo`;
   - elegibilidade canônica do vínculo;
   - escopo autorizado, preservando a semântica de alerta agregado e filial vazia já definida.
3. Manter `FOR UPDATE` quando suportado, mas não depender apenas dele nem apenas de uma segunda leitura.
4. Se a elegibilidade ou o escopo deixar de existir, retornar exatamente a recusa segura de alerta inexistente e manter a linha ativa.
5. Se apenas a revisão mudar enquanto a linha continua elegível e autorizada, manter o conflito de concorrência.

## Testes obrigatórios

1. PostgreSQL 9.5/9.6: NULL + UUID não gera erro SQL e é conflito; todos nulos coerentes não geram erro e seguem a política.
2. SQLite: os mesmos casos têm o mesmo desfecho do resolver.
3. Alvo com Rotina histórica inexistente: resolver, listagem, detalhe, contagem, filtro e reconhecimento concordam em Rotina nula/não elegibilidade.
4. Alvo com Rotina nula e alerta persistido preenchido: divergência, fora da listagem e recusa segura.
5. Snapshot presente com janelas conflitantes: somente snapshot participa da política.
6. Dois candidatos iguais: uma linha, envelope estável pelo menor id e contagem unitária.
7. Dois candidatos diferentes, incluindo diferenças por `NULL`: fora da listagem/count e recusa segura no detalhe/reconhecimento.
8. Reemissão e `upsertAtivo` não gravam payload conflitante em alerta novo nem sobrescrevem vínculo preenchido.
9. Reconhecimento com escopo perdido entre leitura e gravação: recusa segura, estado permanece `ativo`.
10. Reconhecimento com revisão antiga e escopo ainda válido: conflito de concorrência.
11. Regressão integral dos testes ECC 438–450, testes de vínculo/read model, Pint e TypeScript.
12. Confirmar zero migration, zero DDL, zero alteração de snapshot/fatos históricos e zero ramo novo por `tipo`.

## Não fazer

- não adicionar migration, coluna, índice ou DDL;
- não alterar snapshots, nome no corte, alvo ou fatos históricos;
- não converter UUID ou listas de UUID para texto para comparar `NULL`;
- não usar fallback de vínculo persistido quando o alvo não é resolvível;
- não escolher um candidato conflitante;
- não deduplicar somente na interface;
- não depender só de segunda leitura ou lock como garantia de escopo;
- não criar um segundo mapa de autorização de filiais;
- não reabrir cadastro, agenda, cálculo, confirmação ou pedidosfiliais.

