# Prompt para /speckit.specify - Hardening pos-prompt 01 da Geracao da Curva ABC

## Objetivo

O prompt 01 ja foi especificado e implementado no checkout Laravel. Antes de iniciar o prompt 02 (Gravacao da Classificacao ABC), produza uma nova especificacao para revisar a implementacao existente, corrigir os desvios comprovados abaixo e fechar o aceite do incidente Top N grande.

Este prompt e de especificacao: nao implemente codigo durante `/speckit.specify`.

## Leituras obrigatorias

Leia primeiro, nesta ordem:

- `modules/estoque/relatorio-curva-abc/README.md` e `dossie.md`;
- `modules/estoque/relatorio-curva-abc/01-speckit-prompt-geracao-curva-abc.md`;
- `.scratch/relatorio-curva-abc-wayfinder/research/04-diagnostico-top-n-zerado.md`;
- `.scratch/relatorio-curva-abc-wayfinder/research/05-revisao-implementacao-pos-prompt-01.md`;
- `laravel/specs/474-fix-curva-abc-gerar/spec.md`, `plan.md`, `tasks.md`, `research.md`, `contracts/*` e o ADR correspondente;
- o diff implementado desde `97376be77` ate o HEAD vigente do checkout Laravel;
- as regras atuais de heavy-reports e os arquivos efetivamente usados pela rota F6.

Revalide os nomes e seams no checkout antes de escrever a especificacao. Trate a revisao como auditoria de codigo atual, nao como reexecucao cega do prompt 01.

## Contexto confirmado

O commit de implementacao adicionou a instrumentacao `raw_row_count`, alterou o SQL/migration PostgreSQL, preservou nulos no mapper, criou o gate `@group postgres` e ajustou o fluxo efemero. Porem a revisao encontrou divergencias entre o contrato produzido e o codigo atual. A nova especificacao deve resolver cada uma com evidencia e teste, sem inventar comportamento do Delphi ou da funcao legada.

## Requisitos da nova especificacao

### 1. Fechar o contrato de Top N

- O contrato vigente do spec 474 exige Top N inteiro `>= 1` e default 100.
- O codigo implementado passou a aceitar `0` como “todos” no request, no payload React e no default do controller.
- Decida explicitamente se `0` sera removido ou formalmente adotado. Nao mantenha uma divergencia silenciosa entre spec, backend e UI. A recomendacao, salvo decisao de produto contraria registrada, e restaurar `min: 1` e default 100.
- Cubra request, payload, tela, service, filtros e testes.

### 2. Tornar `raw_row_count` honesto

- Nao usar `row_count`, `count($rows)` ou a quantidade emitida como fallback silencioso para o universo.
- Se `current_setting('teclux.abc_nitens')` nao estiver disponivel, o resultado deve falhar de modo observavel ou declarar explicitamente que a contagem do universo nao esta disponivel; nunca afirmar um numero falso.
- Defina o comportamento para as duas assinaturas suportadas pelo repository: a funcao Cloud `teclux_abc_prod` e a funcao legada `abc_prod` de 22 parametros. Se a segunda nao fornecer instrumentacao, documente a limitacao e o contrato nullable/erro, com teste.
- Prove que a leitura do GUC ocorre na mesma conexao/escopo da chamada da funcao.

### 3. Corrigir a proveniencia numerica

- O campo `numeric_provenance.mapper_null_to_zero` nao pode ser um valor estatico que afirma uma propriedade sem observar os dados.
- Escolha e documente um contrato real: remover o campo, ou fornecer diagnostico verificavel que diferencie nulo do banco, zero real da funcao e perda no mapper.
- Preserve `null` como `null` no JSON e na grade; zero calculado deve continuar sendo zero.

### 4. Fortalecer o gate PostgreSQL

- O caso minimo continua sendo universo aproximado de 4500, periodo `2026-03-01` a `2026-09-01`, Top N 100, com movimento positivo.
- O teste deve exercitar a funcao implantada e, quando possivel, o caminho enqueue/poll/ready; se houver separacao entre gate SQL/service e gate assincrono, justifique-a.
- Cubra modos 0, 1 e 2 com metricas positivas, `raw_row_count` maior que `row_count`, no maximo 100 linhas e nenhum preenchimento artificial com zeros.
- Substitua o teste de overflow que usa valores de aproximadamente 250 milhoes e apenas afirma `> 11`: ele nao excede `numeric(11,2)` e nao prova o bug alegado. Use valores/quantidades que ultrapassem `999999999.99`, ou renomeie o teste para o que ele realmente verifica; em qualquer caso, afirme valores exatos, positivos e nao saturados.
- Troque assercoes de corpo SQL baseadas apenas em `str_contains('itens := 1')`/`str_contains('posicao := 1')` por uma prova robusta da ordem/reset efetivo ou por comportamento observado da funcao implantada, incluindo a migration que reaplica o corpo.
- Nao aceite mocks vazios, SQLite ou apenas contagem do array como encerramento do incidente.

### 5. Impedir resultado antigo na UI

- Quando a geracao falhar, expirar, for cancelada ou retornar 404/resultado indisponivel, limpar o resultado anterior e o estado de “resultado gerado”.
- Ao iniciar uma nova geracao, nao deixar a grade antiga parecer resultado do novo payload.
- O resultado exibido deve estar vinculado ao job/payload corrente; cobrir ready, erro tecnico, expiracao, cancelamento e nova tentativa.

### 6. Auditar a alteracao compartilhada do heavy-reports

- Revisar a mudanca em `TrackOperationalExecution` que permite continuar o job quando falta `OperationalExecution` em ambientes locais.
- Nao aceitar execucao silenciosamente sem rastreamento. Escolha fail-closed ou fallback explicitamente instrumentado, autorizado e testado, sem quebrar os testes locais por conveniencia.
- Preservar o isolamento de idempotencia por ambiente somente se houver teste de nao-regressao para chamadas iguais em ambientes diferentes.

### 7. Higiene do diff

- Separar correcao funcional de limpeza de whitespace nos SQL exportados e documentos.
- Nao reformatar o SQL legado inteiro sem necessidade; a migration e o SQL versionado devem continuar reproduziveis e revisaveis.

## Criterios de aceite obrigatorios

Inclua na especificacao uma matriz executavel com:

- Top N 100 para universo ~4500, universo menor que Top N e universo igual ao limite;
- validacao/default de Top N conforme a decisao registrada;
- modos 0, 1 e 2 com valores positivos, nulos reais e zeros reais;
- comparacao de valores crus antes do mapper, valores serializados e celulas da grade;
- `raw_row_count` ausente/indisponivel sem fallback falso;
- assinaturas Cloud e legada, quando ambas permanecerem suportadas;
- overflow que realmente exceda o antigo `numeric(11,2)`;
- falha/404/expiracao/cancelamento sem linhas antigas na UI;
- F6 sem qualquer escrita em `produtos.resultadocurvaabc` ou `veiodatriggercaracteristicas`;
- heavy-reports sem execucao nao rastreada.

O gate deve registrar a versao/definicao da funcao implantada, os binds efetivos (Top N como 7o argumento), a migration aplicada e os limites de aceite. Um teste que nao consegue conectar ao PostgreSQL deve ficar como bloqueado/inconclusivo, nao verde por fallback.

## Fora de escopo

- Nao especificar nem implementar a Gravacao da Classificacao ABC; isso continua no prompt 02.
- Nao criar historico, fotografia persistente, PDF, impressao, Excel ou uma arquitetura paralela de relatorios.
- Nao reescrever a funcao `abc_prod` sem prova do defeito e sem preservar as assinaturas suportadas.
- Nao alterar Delphi nesta fatia.

## Saida esperada do SpecKit

Produza `spec.md`, `plan.md`, `tasks.md`, contratos de teste/observabilidade e atualizacoes de ADR/documentacao necessarias. Liste cada divergencia como CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO, DIVERGENTE ou POSSIVEL BUG LEGADO. A especificacao so pode liberar o prompt 02 depois que o gate PostgreSQL e os cenarios de perda tecnica/resultado antigo estiverem aprovados.
