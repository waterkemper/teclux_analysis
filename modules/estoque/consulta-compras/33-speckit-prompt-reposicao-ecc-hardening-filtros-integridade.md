# Prompt 33 - Hardening dos filtros, integridade e contratos dos read models ECC

## Contexto

Os prompts 27 a 32 ja foram implementados no `origin/main` ate o commit `689ab1c5`.
O prompt 32 fechou o recorte basico por Filial Requisitante, a recusa segura, a identidade por `rotina_id`, os nomes vivo/fotografado e o recorte inicial dos indicadores. Esta fatia corrige lacunas residuais encontradas na revisao do codigo. Nao reabrir o modelo de Rotinas livres, agenda, snapshot, calculo ECC ou fluxo de confirmacao.

## Achados que devem ser corrigidos

### 1. Normalizacao segura e consistente dos filtros

Hoje alguns services tratam `rotina_id` como escalar, embora o repositorio use `whereIn`, e `ReposicaoEccIndicadoresService` descarta valores invalidos de `filial_requisitante` como se o filtro nao tivesse sido enviado. Isso permite que um filtro invalido signifique todas as filiais autorizadas e faz filtros com varios UUIDs falharem com conversao de array para string.

Criar ou consolidar um resolvedor reutilizavel para os filtros de listagem:

- `filial_requisitante` ausente, nulo ou array vazio significa todas as filiais autorizadas;
- filtro de filial informado com valores invalidos ou fora do escopo resulta na intersecao efetiva, vazia quando nada for autorizado, nunca no universo da base;
- `rotina_id` aceita valor unico e lista, remove duplicatas sem perder a informacao de que foi informado e valida cada UUID antes de consultar filhos;
- UUID inexistente ou fora do escopo gera a mesma recusa segura 404 da rotina inexistente; nao tratar lista invalida como ausencia;
- aplicar o mesmo contrato em lotes, excecoes, alertas e indicadores;
- quando UUID e codigo legado vierem juntos, UUID prevalece e o legado nao faz UNION nem amplia o conjunto.

### 2. Indicadores realmente no mesmo escopo

`ReposicaoEccIndicadoresService::calcularMetricas` ainda conta `aprovacoes_gerente` diretamente em `cloud_estoque_reposicao_ecc_decisoes`, sem filtrar Filial Requisitante, `rotina_id` ou codigo legado. Assim, um card pode conter decisoes de outras filiais/rotinas mesmo quando os demais cards e series estao filtrados.

Corrigir a metrica usando o relacionamento da decisao com o lote e o mesmo periodo/escopo efetivo dos demais dados. Evitar duplicidade no join e revisar que nenhuma outra metrica de `calcularMetricas` escape do mesmo recorte usado por `calcularSeries`.

### 3. Integridade entre Rotina e seus registros

Os joins atuais exibem o nome da Rotina pelo UUID, mas nao protegem o caso de dados inconsistentes em que a `filial_requisitante` do lote, janela, excecao ou alerta diverge da filial da Rotina vinculada. Nao expor nome de uma Rotina de outra filial nem corrigir silenciosamente a inconsistencia.

Para leituras e detalhes:

- validar que o registro e a Rotina vinculada pertencem a mesma Filial Requisitante;
- se qualquer estabelecimento envolvido estiver fora do escopo, aplicar recusa segura ou excluir da listagem, conforme o contrato do prompt 32;
- preservar UUID e fotografia; nao alterar dados historicos para sanar a inconsistencia;
- ao projetar alerta de lote, janela ou execucao sem `rotina_id`, resolver a rotina pelo alvo quando houver vinculo confiavel; sem rotina e sem estabelecimento, projetar explicitamente `agregado=true`.

### 4. Alertas sem rotina e atualizacao de vinculo

`agregado` hoje e derivado somente de `alvo_tipo=agregado`. Uma falha de job sem alvo resolvivel fica sem rotina, mas nao e marcada como agregada e pode ser recusada na leitura. Alem disso, um `upsertAtivo` existente nao completa `rotina_id`/filial quando uma nova emissao traz o vinculo que faltava.

Garantir que:

- alerta sem Rotina e sem alvo de estabelecimento seja explicitamente agregado;
- alerta de lote, janela ou execucao com alvo resolvivel carregue `rotina_id`, nome atual e filial;
- `job_falhou` continue sendo a classe do alerta, independente do codigo legado da Rotina;
- reemissao do mesmo alerta possa preencher vinculo ausente sem reescrever snapshot ou historico;
- reconhecimento de alerta continue protegido pelo escopo da filial e pela recusa segura.

### 5. Contratos TypeScript

Alinhar os tipos aos contratos reais dos read models:

- lote e janela com Rotina devem declarar `rotina_id: string` e `nome_rotina: string`, nao campos opcionais;
- excecao e alerta podem declarar `rotina_id: string | null` para historico orfao, mas o campo deve existir no envelope; `nome_rotina` e `agregado` devem refletir o retorno efetivo;
- `nome_no_corte` deve ser `string | null` quando houver suporte a snapshot;
- filtros de listagem devem aceitar escalar ou lista quando o backend aceitar ambos;
- marcar apenas `tipo`/`tipo_rotina`/`codigo_legado` como legado/opcional; nao usa-los como identidade.

## Testes obrigatorios

1. Filtros de filial ausentes, vazios, invalidos, escalares e multiplos nunca ampliam o escopo; usuario da Filial 1 nao recebe dados da Filial 2.
2. `rotina_id` unico e multiplo filtram corretamente em lotes, excecoes, alertas e indicadores; UUID desconhecido ou fora do escopo retorna recusa segura, sem conversao de array para string.
3. Usuario da Filial 1 e Administrador recebem o mesmo contrato de filtros, com escopos efetivos diferentes conforme autorizacao.
4. Duas Rotinas da mesma filial com dados distintos produzem `aprovacoes_gerente` distintas; nenhum card ou serie inclui a rotina irma.
5. Registro com filial divergente da Rotina nao aparece e detalhe produz recusa segura; snapshot permanece intacto.
6. Falha de job sem alvo resolvivel aparece como alerta agregado explicito; falha com snapshot/lote preserva `rotina_id`; reemissao completa vinculo ausente.
7. Tipos TypeScript compilam e exigem `rotina_id`/`nome_rotina` onde o schema os garante.
8. Regressao dos testes ECC 27 a 32 permanece verde, sem reintroduzir ramos de comportamento por `tipo`.

## Nao fazer

- nao reintroduzir tipos fixos ou comportamento por `tipo`;
- nao transformar filtro invalido em ausencia de filtro;
- nao filtrar apenas na UI;
- nao alterar snapshots, nomes no corte ou historico;
- nao adicionar migration/DDL;
- nao esconder inconsistencia relacional sobrescrevendo filial, UUID ou nome;
- nao misturar classe do alerta com codigo legado de Rotina.
