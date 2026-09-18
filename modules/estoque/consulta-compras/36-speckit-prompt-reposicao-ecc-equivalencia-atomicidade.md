+# Prompt 36 - Fechar equivalencia SQL/PHP e reconhecimento atomico ECC

## Contexto

O prompt 35 foi implementado no commit `f760ede6` (`ecc 35`). A revisao confirmou melhorias na cardinalidade e no tratamento de candidatos, mas encontrou residuos que ainda podem produzir resultados diferentes entre emissao e leitura, alem de uma janela de corrida no reconhecimento.

Nao reabrir cadastro de Rotinas, agenda, snapshot, calculo, confirmacao, pedidosfiliais, migration ou DDL.

## Achados confirmados

### 1. A fonte unica de vinculo ainda nao existe de fato

`ReposicaoEccAlertaVinculoResolver` e utilizado na emissao, mas `CloudReposicaoEccAlertaRepository::baseQuery`, `mapRow`, `excludeDivergentes` e `applyRotinaResolvidaFilter` implementam uma segunda politica em SQL.

O contrato 448 exige equivalencia entre emissao, listagem, detalhe e contagem. Hoje as duas implementacoes podem divergir em:

- prioridade entre snapshot e janela;
- tratamento de alvo sem rotina;
- tratamento de candidato conflitante;
- semantica de `NULL`;
- filial e Rotina projetadas;
- elegibilidade e marca `agregado`.

O teste atual de equivalencia compara apenas um caso coerente e nao prova que a mesma regra seja usada nos quatro caminhos.

### 2. A deteccao SQL de conflito nao e equivalente para NULL

As subconsultas canonicas usam express?es como:

```sql
HAVING MIN(rotina_id) = MAX(rotina_id)
```

e a exclusao de conflitos usa:

```sql
MIN(rotina_id) <> MAX(rotina_id)
```

Em PostgreSQL, agregacoes ignoram NULL e comparacoes com NULL resultam em UNKNOWN. Assim, candidatos `NULL + UUID`, ou candidatos todos nulos, podem ser classificados de modo diferente do metodo PHP `escolherCandidatos`.

A regra deve ser baseada no mesmo conceito de pares distintos, incluindo a presenca de NULL, sem depender de comparacao SQL com resultado UNKNOWN.

### 3. Reconhecimento ainda tem janela de corrida

O fluxo atual abre transacao e chama `find` antes de `UPDATE`, mas a leitura nao bloqueia a linha e o `UPDATE` continua filtrando somente por id, revision e estado.

Entre a validacao e a escrita, o alerta pode deixar de ser elegivel por alteracao de vinculo/alvo/escopo. Uma segunda releitura antes do update reduz o risco, mas nao elimina a janela.

O contrato 448 exige `SELECT ... FOR UPDATE` quando disponivel ou predicado de elegibilidade no `UPDATE` atomico.

### 4. Os testes nao exercitam os casos que diferenciam as implementacoes

A cobertura atual prova:

- candidatos duplicados coerentes;
- candidatos conflitantes com UUIDs preenchidos;
- recusa de rotina invalida na pagina.

Ainda faltam provas para:

- candidato com rotina nula misturado com candidato com UUID;
- candidatos todos nulos;
- filial nula misturada com filial preenchida;
- equivalencia de agregado entre resolver, listagem, detalhe e count;
- corrida real entre find e reconhecimento.

## Objetivo

Fazer a leitura e a emiss?o usarem a mesma politica de vinculo, corrigir a semantica de NULL/candidatos e tornar o reconhecimento atomicamente seguro.

## Alteracoes obrigatorias

### A. Politica canonica reutilizavel

1. Definir uma unica politica de resolucao, em componente de dominio/aplicacao ou consulta encapsulada, consumida por:
   - emissao e reemissao;
   - listagem;
   - detalhe;
   - contagem de nao reconhecidos;
   - reconhecimento.
2. Se a leitura precisar ser SQL para evitar N+1, extrair a expressao/consulta canonica para um ponto unico e fazer o resolver PHP consumir a mesma politica ou provar equivalencia por matriz completa.
3. Proibir que `mapRow` invente uma politica diferente da usada nos predicados de elegibilidade.
4. A politica deve devolver o mesmo resultado para os quatro estados:
   - vinculo confiavel;
   - vinculo divergente;
   - vinculo ambiguo;
   - alvo inexistente/orfao.
5. Manter ids historicos do alerta e do alvo intactos.

### B. Candidatos e NULL

1. Corrigir subconsultas canonicas e predicados de conflito para considerar explicitamente:
   - rotina nula versus rotina preenchida;
   - filial nula versus filial preenchida;
   - todos os candidatos nulos;
   - candidatos com pares diferentes.
2. A regra deve ser:
   - nenhum candidato: nao resolvivel;
   - um par coerente: confiavel se a Rotina viva existir e a filial for coerente;
   - varios candidatos com o mesmo par: um envelope estavel pelo menor id;
   - qualquer par distinto, inclusive por NULL: conflito, fora da listagem e recusa segura no detalhe/reconhecimento.
3. Snapshot tem precedencia sobre janela para alvo `execucao`; somente se nao houver snapshot candidato devem ser avaliadas janelas.
4. Nao usar `MIN <> MAX` sem tratamento de NULL.
5. Nao usar `DISTINCT` apenas para esconder candidatos conflitantes.

### C. Reconhecimento atomico

1. Dentro da transacao, bloquear a linha do alerta com `FOR UPDATE` no PostgreSQL quando o driver suportar, ou usar update atomico com todos os predicados de elegibilidade.
2. O update deve garantir, no minimo:
   - id;
   - revision esperada;
   - estado `ativo`;
   - alerta ainda elegivel pelo vinculo canonico e escopo autorizado.
3. Se a linha deixar de ser elegivel, responder exatamente como alerta inexistente.
4. Manter conflito de revision como conflito de concorrencia quando a linha continua elegivel.
5. Nao revelar se o alerta existia e depois saiu do escopo.
6. Reemissao nao pode alterar vinculos preenchidos nem introduzir payload conflitante.

### D. Testes de contrato

Criar testes de equivalencia que comparem, para o mesmo estado de banco:

- VO/resolver;
- listagem;
- detalhe;
- contagem;
- emissao/reemissao;
- reconhecimento.

Cobrir matriz:

1. um candidato confiavel;
2. dois candidatos iguais;
3. dois candidatos diferentes;
4. rotina NULL + UUID;
5. todos rotina NULL;
6. filial NULL + filial preenchida;
7. snapshot presente e janelas conflitantes, confirmando precedencia do snapshot;
8. alvo inexistente;
9. persistido divergente do alvo;
10. filtro por Rotina resolvida;
11. contagem e `limit` sem duplicacao;
12. reconhecimento apos tornar o alerta inelegivel dentro da corrida.

## Validacao

- Rodar os testes ECC 438 a 448;
- rodar especificamente os testes de vinculo, cardinalidade e reconhecimento;
- executar Pint e TypeScript;
- verificar PostgreSQL 9.5/9.6 e SQLite;
- confirmar 0 DDL, 0 migration e 0 ramo novo por `tipo`.

## Nao fazer

- nao adicionar migration, coluna, indice ou DDL;
- nao alterar snapshots, nome no corte, alvo ou fatos historicos;
- nao deduplicar somente no React;
- nao tratar NULL como equivalente a qualquer UUID;
- nao escolher arbitrariamente um candidato conflitante;
- nao usar apenas uma segunda leitura como garantia atomica;
- nao converter UUID/lista para string;
- nao reintroduzir comportamento por tipo legado;
- nao criar segundo mapa de autorizacao de filiais.

