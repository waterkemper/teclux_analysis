+# Prompt 34 - Fechar filtros de execucoes e vinculo tardio dos alertas ECC

## Contexto

Os prompts 27 a 33 foram implementados no `origin/main`, atualmente no commit `0f1383cd` (`ecc 33`). A revisao do codigo encontrou lacunas residuais no contrato de leitura por Filial/Rotina. O prompt 33 deve continuar sendo a base; esta fatia apenas fecha superficies que ainda escapam ao contrato.

Nao reabrir cadastro de Rotinas, agenda, snapshot, calculo, confirmacao, migracoes ou DDL.

## Achados confirmados

### 1. Execucoes ignoram os filtros da listagem

`ReposicaoEccController::execucoesIndex` chama `listRecent` apenas com todas as filiais autorizadas. A rota nao encaminha a query bruta ao `ReposicaoEccListagemFiltrosResolver`, e `CloudReposicaoEccJanelaRepository::listRecent` nao recebe/aplica `rotina_id`.

Consequencias:

- `GET execucoes?filial_requisitante=2` pode devolver a lista autorizada inteira;
- `GET execucoes?rotina_id[]=A&rotina_id[]=B` nao filtra as janelas;
- a superficie de execucoes quebra a promessa de um contrato unico entre lotes, excecoes, alertas, indicadores e janelas.

### 2. Alertas antigos sem vinculo nao sao resolvidos pelo alvo

`CloudReposicaoEccAlertaRepository` faz join de nome somente por `a.rotina_id`. Se uma linha historica tem `rotina_id` nulo, mas aponta para um lote, janela ou execucao existente, o read model nao recupera a Rotina, nome atual e filial do alvo.

O mesmo problema afeta:

- filtro por `rotina_id`;
- `find` e reconhecimento;
- classificacao `agregado`;
- reemissao quando somente o alvo permite descobrir o vinculo.

O alvo deve ser resolvido de forma deterministica:

- `alvo_tipo=lote`: lote por `alvo_id`;
- `alvo_tipo=janela`: janela por `alvo_id`;
- `alvo_tipo=execucao`: snapshot por `operational_execution_id = alvo_id`, com fallback para janela que possua `execution_id = alvo_id` quando esse for o vinculo disponivel.

### 3. Contrato de valores vazios de filial esta incoerente

O texto do prompt 33 define filial ausente, nula ou vazia como todas as filiais autorizadas. O resolvedor atual marca `[]`/string vazia como informado e produz escopo vazio; os testes atuais cristalizam esse comportamento.

Alinhar explicitamente o contrato escolhido em todos os documentos e testes. Para esta fatia, adotar o contrato do prompt 33:

- filial ausente, nula, `[]` ou string vazia -> filiais autorizadas;
- filial presente com valores invalidos, inexistentes ou fora do escopo -> intersecao vazia;
- mistura de valores validos e invalidos -> somente os validos autorizados;
- `rotina_id` continua diferente: chave ausente = todas as Rotinas do escopo; chave presente vazia = nenhuma Rotina; UUID invalido/inexistente/fora do escopo = recusa segura 404.

Nao resolver a ambiguidade simplesmente mudando um teste isolado: atualizar o contrato, o resolvedor e as superficies consumidoras de maneira coerente.

## Objetivo

Fechar o contrato de leitura por Filial/Rotina para janelas e alertas, sem ampliar escopo, sem expor nome de Rotina de outra filial e sem alterar fatos historicos.

## Alteracoes obrigatorias

### A. Execucoes

1. Fazer `execucoesIndex` encaminhar a query bruta ao resolvedor unico.
2. Passar ao repositorio:
   - `filiais` efetivas;
   - `rotina_id` como lista quando informado;
   - filtros de legado somente quando nao houver UUID.
3. Alterar `CloudReposicaoEccJanelaRepository::listRecent` para aplicar:
   - `whereIn` de UUIDs;
   - zero linhas para lista de Rotinas informada e vazia;
   - recusa ja produzida pelo resolvedor antes da consulta.
4. Manter a regra de integridade Rotina/filial: janela divergente nao aparece, inclusive quando filtrada por UUID.
5. Aplicar os mesmos filtros na leitura usada pela tela e nao somente na UI.

### B. Resolucao central do vinculo do alerta

1. Criar ou consolidar um resolvedor de vinculo de alerta reutilizado por `list`, `find` e emissao/reemissao.
2. O resolvedor deve retornar, quando confiavel:
   - `rotina_id`;
   - `nome_rotina` atual;
   - `filial_requisitante`;
   - ids historicos do alvo sem substitui-los.
3. Considerar confiavel somente alvo existente e coerente:
   - a Rotina do alvo existe;
   - a filial persistida, se preenchida, e a filial do alvo coincidem;
   - nao escolher um lado silenciosamente quando houver divergencia.
4. Se o vinculo resolvido divergir dos campos persistidos, excluir da listagem e produzir recusa segura no detalhe/reconhecimento. Nao corrigir filial, UUID, snapshot ou nome no corte.
5. Se nao houver Rotina e nao houver estabelecimento resolvivel:
   - manter a classe do alerta, por exemplo `job_falhou`;
   - projetar `rotina_id: null`;
   - projetar `nome_rotina: null`;
   - marcar `agregado: true`.
6. Alerta de backlog explicitamente agregado continua `agregado: true`, mesmo tendo filial.
7. Alerta com alvo resolvivel nao pode ser tratado como agregado apenas porque a coluna persistida `rotina_id` esta nula.
8. Filtro por `rotina_id` deve considerar o vinculo resolvido, inclusive para linhas historicas ainda nao backfilladas.
9. A contagem de alertas nao reconhecidos deve usar o mesmo predicado de escopo e a mesma resolucao de vinculo da listagem, quando essa contagem for consumida pela tela.

### C. Reemissao

1. `upsertAtivo` pode preencher somente campos ausentes:
   - `rotina_id`;
   - `filial_requisitante`.
2. Vinculos ja preenchidos nao podem ser trocados.
3. Nao atualizar snapshot, `nome_no_corte`, alvo, historico ou fatos fotograficos para fazer o backfill.
4. Se payload e alvo trouxerem vinculos conflitantes, recusar ou ignorar com seguranca conforme o contrato; nunca sobrescrever o valor historico.

### D. Indicadores e consistencia de leitura

1. Confirmar que o card de aprovacoes, cards restantes e series continuam usando:
   - as mesmas filiais efetivas;
   - os mesmos UUIDs de Rotina;
   - o mesmo legado somente quando aplicavel;
   - o mesmo periodo.
2. Confirmar que consultas de indicadores nao contam filhos com filial divergente da Rotina vinculada.
3. Se `excecoes_abertas` for deliberadamente um backlog acumulado ate o fim do periodo, documentar essa semantica no contrato e testar separadamente; caso seja uma metrica do periodo, aplicar limite inferior como nas series. Nao deixar a diferenca acidental.

### E. Contratos TypeScript

Atualizar os tipos e consumidores para refletir:

- execucao aceita filtros escalares ou listas;
- alerta sempre possui `rotina_id: string | null`, `nome_rotina: string | null` e `agregado: boolean`;
- alerta resolvido por alvo e alerta agregado sao distinguiveis sem usar `tipo` como identidade;
- valores nulos historicos permanecem permitidos onde o backend realmente os retorna.

## Testes obrigatorios

1. `execucoesIndex` sem filtro, com filial escalar/lista, com filial vazia, com rotina escalar/lista e com rotina vazia.
2. Usuario da Filial 1 nunca recebe janela da Filial 2; filtro invalido de filial nao vira universo autorizado; UUID invalido continua 404 seguro.
3. Duas Rotinas da mesma filial isolam corretamente as execucoes.
4. Alerta legado com `alvo_tipo=lote` e `rotina_id=NULL` recupera rotina, nome atual e filial; aparece no filtro da Rotina e nao e agregado.
5. O mesmo cenario para alvo janela e alvo execucao, usando as tabelas existentes.
6. Alerta sem alvo resolvivel aparece com classe original, `agregado=true`, `rotina_id=null` e `nome_rotina=null`.
7. Alerta com filial/Rotina conflitantes nao aparece e o detalhe/reconhecimento produz a mesma recusa segura de inexistente.
8. Reemissao preenche campos nulos, preserva campos ja preenchidos e nao altera snapshot/nome no corte.
9. Indicadores continuam distinguindo Rotinas irmas e nenhuma metrica/serie vaza filial ou Rotina.
10. Regressao dos testes ECC dos prompts 27 a 33, Pint e verificacao TypeScript.

## Nao fazer

- nao adicionar migration, coluna ou DDL;
- nao alterar snapshots ou dados historicos para sanar inconsistencias;
- nao reintroduzir comportamento fixo por tipo legado;
- nao filtrar somente no frontend;
- nao converter lista para string;
- nao tratar UUID vazio informado como ausencia;
- nao transformar filial invalida em ausencia de filtro;
- nao misturar classe do alerta com codigo legado;
- nao criar um segundo mapa de autorizacao de filiais.

