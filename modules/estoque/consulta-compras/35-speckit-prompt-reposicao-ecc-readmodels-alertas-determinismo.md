+# Prompt 35 - Hardening final dos read models e vinculos de alertas ECC

## Contexto

O prompt 34 foi implementado no commit `a465d19e` (`ecc 34`). A implementacao fechou filtros de execucoes, filial vazia e resolucao basica de alertas pelo alvo. Esta fatia corrige residuos de consistencia, cardinalidade e tratamento seguro nas leituras.

Nao reabrir cadastro de Rotinas, agenda, snapshot, calculo, confirmacao, pedidosfiliais, migration ou DDL.

## Achados confirmados na revisao do prompt 34

### 1. O resolvedor central ainda nao e a unica fonte de verdade

`ReposicaoEccAlertaVinculoResolver` e usado por `ReposicaoEccAlertaService::emitir`, mas `CloudReposicaoEccAlertaRepository::list`, `find` e `countNaoReconhecidos` repetem a resolucao por meio de `COALESCE` e joins proprios.

Isso permite que emissao e leitura discordem sobre:

- qual alvo e prioritario;
- quando um vinculo e confiavel;
- quando existe divergencia;
- qual filial/Rotina entra no filtro;
- quando o alerta e agregado.

O contrato do prompt 34 exige uma resolucao unica reutilizada por listagem, detalhe, contagem e emissao/reemissao.

### 2. Cardinalidade dos joins pode duplicar o mesmo alerta

A resolucao de `alvo_tipo=execucao` pode encontrar mais de uma janela com o mesmo `execution_id`. O `baseQuery` usa `LEFT JOIN` direto e a listagem nao garante uma linha por `a.id`.

Consequencias:

- o mesmo alerta pode aparecer repetido;
- `countNaoReconhecidos` pode inflar;
- `limit` pode consumir varias posi??es com o mesmo alerta;
- a contagem da tela pode divergir da listagem.

A mesma prote??o deve valer para qualquer alvo que possa possuir m?ltiplos candidatos.

### 3. Resolucao de execu??o sem politica para m?ltiplos candidatos

`findByExecution` e o fallback por janela usam o primeiro registro encontrado. Se houver mais de um snapshot/janela para o identificador, o resultado depende da ordenacao ou do plano do banco.

A resolucao precisa ser deterministica:

- um ?nico candidato coerente -> confiavel;
- candidatos com mesmo vinculo -> escolher de forma estavel e documentada, sem duplicar;
- candidatos com vinculos conflitantes -> nao confiavel/divergente, nunca escolher arbitrariamente;
- nenhum candidato -> alvo nao resolvivel.

### 4. Recusa segura na p?gina Inertia

`ReposicaoEccPageService::indexProps` agora resolve a query da requisicao. A rota `index` nao possui o mesmo `try/catch` das rotas JSON. Um `rotina_id` ilegal, inexistente ou fora do escopo pode escapar como excecao de pagina em vez de produzir a recusa segura 404 prevista para filtros de UUID.

O tratamento deve ser uniforme entre:

- pagina Inertia;
- listagens JSON;
- indicadores;
- execucoes;
- detalhes/reconhecimento.

## Objetivo

Garantir uma unica semantica de vinculo de alerta, uma linha por alerta, resolucao deterministica e recusa segura em todas as superficies ECC.

## Alteracoes obrigatorias

### A. Resolver/projecao unica

1. Extrair uma operacao de read model ou contrato reutilizavel que seja consumida por:
   - `CloudReposicaoEccAlertaRepository::list`;
   - `find`;
   - `countNaoReconhecidos`;
   - `ReposicaoEccAlertaService::emitir` e reemissao.
2. Nao manter duas implementacoes independentes da regra em PHP/SQL sem testes de equivalencia.
3. A projecao deve produzir sempre:
   - `rotina_id`;
   - `nome_rotina`;
   - `filial_requisitante`;
   - `agregado`;
   - alvo historico intacto.
4. O filtro por Rotina deve usar o mesmo vinculo projetado usado no envelope.
5. Se a estrategia escolhida for SQL para evitar N+1, encapsular a expressao em um unico componente/consulta reutilizavel e cobrir sua equivalencia com o resolver usado na emissao.

### B. Cardinalidade e determinismo

1. Garantir no SQL e no read model que cada alerta tenha no maximo uma linha no resultado.
2. Nao resolver duplicacao apenas removendo itens no React.
3. Para alvo de execucao com varios snapshots/janelas:
   - selecionar candidato deterministico;
   - detectar conflito de rotina/filial;
   - marcar como nao confiavel quando nao for possivel provar um unico vinculo.
4. Aplicar a mesma politica em `findByExecution`, listagem, contagem e emissao.
5. Testar que:
   - listagem nao duplica `a.id`;
   - `countNaoReconhecidos` conta alertas, nao linhas de join;
   - `limit` e ordenacao continuam sendo por alerta;
   - duas janelas do mesmo execution id nao alteram o envelope.

### C. Integridade e reemissao

1. Manter exclusao/recusa segura para:
   - filial persistida divergente;
   - Rotina persistida divergente;
   - filial da Rotina divergente da filial do alvo;
   - alvo ambiguo ou inconsistente.
2. Alvo resolvivel continua com `agregado=false`, mesmo quando `a.rotina_id` e nulo.
3. Alvo inexistente e sem estabelecimento resolvivel continua com classe original, rotina/nome nulos e `agregado=true`.
4. Reemissao:
   - preenche somente campos ausentes;
   - nao substitui vinculos preenchidos;
   - nao grava payload conflitante com alvo;
   - nao altera alvo, snapshot, nome no corte ou fatos fotograficos.
5. O caminho direto de persistencia nao pode permitir que um payload conflitante burle a validacao feita pelo service.

### D. Tratamento seguro da p?gina

1. Garantir que `GET estoque.reposicao-ecc.index?rotina_id=...` tenha o mesmo resultado de recusa segura das listagens JSON.
2. Nao converter excecao de UUID invalido em pagina 500.
3. Preservar o comportamento de filial ausente/nula/vazia = autorizadas e filial invalida presente = intersecao vazia.
4. Se a pagina nao deve aceitar filtros, nao resolver a query nela: remover o acoplamento e deixar isso documentado. Nao manter uma resolucao parcial.

### E. Reconhecimento concorrente

Revisar o reconhecimento para que a validacao de escopo nao seja burlada por uma alteracao concorrente entre `find` e `UPDATE`. Se necessario, revalidar dentro da transacao ou usar predicado atomico. A resposta deve continuar indistinguivel de alerta inexistente quando o alerta deixou de ser elegivel.

## Testes obrigatorios

1. Um alerta com duas janelas para o mesmo `execution_id` aparece uma vez e e contado uma vez.
2. Snapshots multiplos com mesmo execution id e mesmo vinculo produzem resultado estavel.
3. Snapshots/janelas multiplos com vinculos conflitantes nao escolhem um lado e geram exclusao/recusa segura.
4. Listagem, detalhe, contagem e emissao apresentam a mesma rotina, filial, nome e marca `agregado`.
5. Filtro por `rotina_id` usa o vinculo resolvido e nao duplica linhas.
6. Reemissao conflitante nao preenche campos nulos com valores do payload.
7. P?gina Inertia com UUID de Rotina ilegal, inexistente ou fora do escopo retorna recusa segura 404; pagina com filial vazia mant?m escopo autorizado.
8. Reconhecimento concorrente nao permite reconhecer alerta que deixou de pertencer ao escopo.
9. Regressao integral dos testes ECC 438 a 446, Pint e TypeScript.
10. Verificar PostgreSQL 9.5/9.6: sem funcoes, sintaxe ou DDL incompat?veis.

## Nao fazer

- nao adicionar migration, coluna, indice ou DDL;
- nao alterar snapshots ou nome no corte;
- nao reintroduzir comportamento por `tipo`;
- nao resolver duplicidade somente no frontend;
- nao usar `DISTINCT` como mascara se o envelope puder combinar dados de candidatos conflitantes;
- nao escolher arbitrariamente um alvo ambiguo;
- nao converter lista de UUID para string;
- nao transformar filtro invalido em ausencia;
- nao criar segundo mapa de autorizacao de filiais.

