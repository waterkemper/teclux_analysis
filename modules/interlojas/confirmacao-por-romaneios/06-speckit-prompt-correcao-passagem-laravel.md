# Prompt para `/speckit.specify` — correcao Laravel do Romaneio de Passagem

~~~text
/speckit.specify

Crie a especificacao funcional e tecnica para implementar, exclusivamente no
Laravel, a correcao do fluxo de Romaneio de Passagem da Confirmacao por
Romaneios. Nao altere, gere ou proponha alteracao em arquivos Delphi `.pas` ou
`.dfm`. O Laravel deve continuar compartilhando o PostgreSQL legado com o
Delphi; nao crie estado paralelo de conferencia.

Leia antes de especificar:

- modules/interlojas/confirmacao-por-romaneios/README.md
- modules/interlojas/confirmacao-por-romaneios/01-speckit-prompt-fundacao-dominio-seguranca.md
- modules/interlojas/confirmacao-por-romaneios/02-speckit-prompt-consulta-f6-cancelavel.md
- modules/interlojas/confirmacao-por-romaneios/03-speckit-prompt-confirmacao-transacional.md
- modules/interlojas/confirmacao-por-romaneios/04-speckit-prompt-interface-grids-operacoes.md
- modules/interlojas/confirmacao-por-romaneios/05-speckit-prompt-aceite-testes-observabilidade.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-interface-delphi.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-sql-dominio-efeitos-delphi.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-parametros-autorizacoes-menu.md
- modules/interlojas/confirmacao-por-romaneios/schema/README.md
- modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json
- laravel/CONTEXT.md

Fontes Delphi usadas apenas como contrato comportamental, sem modificar o
legado:

- C:/projetos.vcl/apps/entrega/dmConfirmarRomaneiosSaida.pas
- C:/projetos.vcl/apps/entrega/dmConfirmarRomaneiosSaida.dfm
- C:/projetos.vcl/apps/entrega/fmConfirmarRomaneiosSaida.pas
- C:/projetos.vcl/apps/entrega/fmConfirmarRomaneiosSaida.dfm
- C:/projetos.vcl/apps/interlojas/dmconfirmarromaneiostransferencia.pas
- C:/projetos.vcl/apps/interlojas/dmconfirmarromaneiostransferencia.dfm
- C:/projetos.vcl/apps/interlojas/fmconfirmarromaneiostransferencia.pas
- C:/projetos.vcl/apps/interlojas/fmconfirmarromaneiostransferencia.dfm
- C:/projetos.vcl/repositorio/fmConferenciaDocumentos.pas
- C:/projetos.vcl/repositorio/fmConferenciaDocumentos.dfm

## Objetivo

Reproduzir no Laravel o comportamento observavel da conferencia de volumes
quando uma carga sai da filial de origem, passa por um deposito intermediario
com eventual troca de veiculo e chega a filial de destino, corrigindo as
consultas e projecoes que atualmente confundem os tipos de conferencia.

A implementacao deve manter a paridade funcional Delphi, mas corrigir defeitos
tecnicos comprovados: tipos de conferencia fixados incorretamente, leituras que
desaparecem da grade, reprocessamento nao idempotente, N+1, SQL concatenado,
commit parcial e cancelamento apenas visual.

## Contrato dos tipos de conferencia

Preserve os codigos existentes e documente sua finalidade no dominio:

- `ROS`: conferencia de saida normal do Romaneio.
- `ROP`: conferencia de passagem no deposito/filial intermediaria.
- `RPS`: conferencia de saida associada a um Romaneio que esta em situacao de
  passagem, inclusive a saida posterior do deposito quando essa etapa for
  necessaria para a transicao.
- `ROE`: conferencia de entrada normal na filial de destino.

Nao substitua esses codigos por estados Laravel, enums isolados ou tabelas
paralelas. A fonte compartilhada continua sendo `conferencia` e
`volumesdadosfiscaisconferencia`, respeitando suas chaves, constraints,
triggers e funcoes PostgreSQL autoritativas.

O fluxo deve suportar, com volumes multiplos:

1. saida na origem;
2. passagem pelo deposito, quando aplicavel;
3. saida posterior do deposito, quando essa etapa for exigida pelo estado do
   Romaneio;
4. entrada na filial destino.

Nao invente uma etapa que o banco ou o Delphi nao reconhecam. Quando a regra
de situacao depender da ordem temporal entre `ROP` e `RPS`, preserve a ordem
persistida e delegue o calculo a funcao PostgreSQL autoritativa, em vez de
duplica-lo em PHP.

## Correcoes obrigatorias

### 1. Projecao por operacao, nunca tipo fixo

Corrija a consulta Laravel da Confirmacao por Romaneios para nao calcular
`Lidos`, `conferido`, usuario, filial e data sempre com `ROE`.

- Para Romaneio de Passagem, a projecao da etapa de passagem deve ler `ROP`.
- Para entrada normal no destino, deve ler `ROE`.
- A consulta de saida deve ler `RPS` quando a operacao for saida de passagem e
  `ROS` quando for saida normal.
- Se a tela precisar exibir historico das duas etapas, projete explicitamente
  ambas, com nomes distintos, sem sobrescrever uma com a outra.
- A linha exibida apos o bip deve continuar identificavel pela chave NF-e,
  numero do volume, quantidade do volume, Romaneio e Documento Fiscal, mesmo
  depois da atualizacao da Situacao do Romaneio.

Defina a regra de selecao da operacao no servidor, com binds e contrato
explicito. Nunca aceite da UI um tipo arbitrario para decidir qual operacao
persistir.

### 2. Conferencia de volumes por chave composta

Use a identidade legada da Leitura por Chave + Volume:

`chave NF-e de 44 digitos + numero sequencial do volume em 3 digitos + total de volumes em 3 digitos`.

O componente Laravel compartilhado deve normalizar a entrada, validar a chave
NF-e, preservar zeros a esquerda e rejeitar ambiguidades. A pesquisa deve usar
bind e localizar uma unica unidade de volume, sem marcar todos os volumes do
Documento Fiscal por engano.

Para Romaneio Normal, nao substitua a granularidade da Leitura por Chave +
Volume por uma confirmacao da NF-e inteira. Para Romaneio de Passagem, preserve
a mesma identidade de volume e apenas altere o tipo da operacao conforme a
etapa autorizada.

### 3. Idempotencia e concorrencia

Cada bip deve ser idempotente pela chave do tipo, Romaneio, Documento Fiscal,
numero do volume e sequencia do volume.

- Repetir o mesmo bip nao pode criar linhas duplicadas nem efeitos duplicados.
- Retry depois de timeout deve consultar a evidencia persistida antes de
  informar falha.
- Nao apagar `RPS` ou `ROP` automaticamente em um retry identico.
- Qualquer limpeza ou invalidacao de uma etapa anterior deve ser uma operacao
  explicita, autorizada, auditada e protegida contra apagar uma conferencia mais
  nova feita pelo Delphi ou pelo Laravel.
- Bloqueie o Romaneio e seus volumes em ordem deterministica, releia a
  Situacao e a Revisao apos o lock e rejeite conflitos por unidade.
- Cada Romaneio e uma Unidade Atomica da Confirmacao; falha em um Romaneio nao
  desfaz outro Romaneio ja concluido no mesmo lote.

### 4. Situacao compartilhada

Apos a gravacao, invoque as funcoes PostgreSQL autoritativas de situacao e
persista/publique o resultado somente apos o commit. Nao calcule localmente
`PASSAGEM`, `EM TRANSITO`, `CONFIRMADA`, `CONFIRMADA PARCIAL` ou `ENTREGUE`.

Especifique e teste, no minimo, estas transicoes:

- volumes de saida ainda pendentes;
- saida completamente conferida;
- `ROP` conferido sem saida posterior `RPS`, resultando em situacao de
  passagem conforme a funcao legada;
- `ROP` seguido por `RPS`, respeitando a ordem temporal;
- entrada `ROE` no destino;
- volumes conferidos parcialmente;
- documento fiscal cancelado, ja casado ou alterado entre consulta e comando.

### 5. Consulta F6 e cancelamento real

Reutilize a decisao ja fechada: F6 e consulta direta completa, sem paginacao,
sem fila pesada e sem N+1.

- Monte uma consulta set-based, parametrizada, com `IN`, `ANY(array)`,
  `unnest` ou `VALUES` quando houver multiplos Romaneios/Documentos Fiscais.
- Nao faca uma consulta por linha para buscar conferencia, usuario, filial,
  volume ou situacao.
- Antes do primeiro `await`, disponibilize Cancelar.
- O cancelamento deve interromper a consulta PostgreSQL em execucao com
  `pg_cancel_backend()` ou mecanismo Laravel equivalente, usando a sessao
  correta, e retornar estado `cancelado` distinguivel de erro.
- Nao implemente cancelamento apenas desabilitando botao ou ignorando a
  resposta no navegador.

### 6. Schema e joins

Use o snapshot PostgreSQL autoritativo do pacote como contrato de geracao e
validacao de SQL. O schema gate deve detectar colunas, tipos, constraints,
funcoes e indices incompativeis antes do deploy.

- Nao use `Schema::hasTable`, `information_schema` ou `pg_catalog` no caminho
  normal da aplicacao.
- Nao teste driver.
- Nao teste `hashtablefs`.
- Use `INNER JOIN` quando a relacao e os campos envolvidos forem obrigatorios
  ou `NOT NULL` para o resultado.
- Use `LEFT JOIN` somente quando a ausencia do registro representar
  explicitamente “ainda nao conferido” ou outra ausencia valida.
- Evite subconsultas correlacionadas repetidas por linha; agregue uma vez e
  junte o resultado.

### 7. Interface Laravel

Preserve os contratos ja definidos nas specs 01–05:

- menu e capability em `Interlojas -> Confirmacao por Romaneios`;
- F5, F6, Ctrl+Espaco, Enter e F9 conforme os prompts anteriores;
- F9 usando o modal compartilhado de pesquisa;
- mascara NF-e usando `NfeAccessKey*` compartilhado;
- grids sem paginacao nesta consulta, com ordenacao, exportacao,
  personalizacao, selecao de colunas e demais recursos padrao;
- radio buttons quando houver escolha mutuamente exclusiva;
- breadcrumbs e acoes com icones/atalhos do padrao Laravel;
- estados claros de vazio, carregando, cancelado, conflito, falha e sucesso;
- acao de conferencia mostrando a operacao efetivamente executada (`ROS`,
  `ROP`, `RPS` ou `ROE`) e sua evidencia persistida.

Nao criar cadastro, migration especulativa, copia de tabela, API paralela ou
alteracao do menu Delphi.

## Seguranca e auditoria

Separe acesso ao menu, capability da operacao e autorizacao sensivel. Revalide
Filial, usuario, Romaneio, etapa permitida e elegibilidade no comando, nunca
confiando no snapshot da grade.

Audite operador, autorizador, Filial, Romaneio, Documento Fiscal, volume,
operacao, revisao anterior, revisao nova, resultado, conflito, retry,
cancelamento e rollback. Nao registre senha, SQL com valores, chave NF-e
completa ou payload fiscal sensivel.

## Testes de aceite obrigatorios

Crie uma matriz requisito -> teste -> evidencia e cubra:

- Romaneio com um volume e com varios volumes;
- sequencia completa de origem, deposito e destino;
- passagem sem troca de veiculo e passagem com troca de veiculo;
- `ROS`, `ROP`, `RPS` e `ROE` persistidos no momento correto;
- `Lidos` de passagem calculado por `ROP`, nao por `ROE`;
- conferencia de saida de passagem refletida por `RPS`, nao perdida por join
  fixo em `ROS`;
- bip duplicado, retry apos timeout e duas sessoes concorrentes;
- edicao/confirmacao pelo Delphi entre F6 e o comando Laravel;
- documento cancelado, ja casado, volume inexistente, volume repetido e chave
  NF-e malformada;
- rollback sem linha parcial e sem situacao publicada antes do commit;
- query count constante, sem N+1, com joins e binds verificaveis;
- F6 cancelavel no banco, estado cancelado na UI e ausencia de efeito mutavel;
- F9, mascara, grid, exportacao, atalhos, capability e auditoria.

Os testes de integracao devem usar PostgreSQL autoritativo ou fixture
equivalente ao schema aprovado. Nao criar teste de driver, `hashtablefs` ou
benchmark baseado em limiar nao decidido.

## Entregaveis da especificacao

Entregue:

1. fluxo de estados e tabela de decisao dos tipos `ROS/ROP/RPS/ROE`;
2. contrato dos comandos Laravel e respostas por Romaneio;
3. desenho SQL set-based com binds, joins justificados e plano anti-N+1;
4. estrategia de lock, idempotencia, retry, conflito e rollback;
5. integracao com funcoes PostgreSQL e schema gate;
6. matriz de capability, autorizacao e auditoria;
7. matriz de aceite e testes cobrindo a correcao encontrada;
8. lista explicita do que permanece fora do escopo: qualquer alteracao Delphi,
   Cadastro de Romaneios, Confirmacao por Notas, driver e `hashtablefs`.

Nao implemente codigo nesta etapa e nao altere arquivos fora do Laravel e da
especificacao gerada.
~~~
