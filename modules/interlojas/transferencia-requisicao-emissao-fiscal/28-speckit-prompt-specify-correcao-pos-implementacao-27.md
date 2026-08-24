# Prompt /speckit.specify - pos-implementacao do prompt 27

Revise o Laravel no commit 40bc655e contra a spec
specs/398-fix-trf-emit-atomic/, seus contratos, ADR e o prompt 27.
Nao implemente codigo nesta etapa: produza apenas spec, plano, tarefas,
testes, aceite e quickstart.

## Limites preservados

Continuam validas as decisoes anteriores:

- escopo somente Transferencia de Requisicao para Exposicao;
- pedidosfiliais.dadofiscal atual e a unica evidencia de vinculo;
- sem busca de NF Delphi orfa;
- documento ja vinculado nao recebe nova numeracao, transmissao ou movimento;
- cancelamento/inutilizacao ficam em Estoque -> Notas Fiscais Avulsas;
- fora de escopo venda/devolucao, entrada, NFS-e, financeiro, etiquetas,
  DANFE simplificada, UniDANFE, impressoras e pipeline paralelo.

## Lacunas confirmadas

### 1. Prova dos movimentos deve conferir todos os campos

ProvaMovimentosConfirmacao.casaSlot ainda nao confere filial e referencia
para todos os tipos e nao confere quantidade para TPE/TFR/TEP. Isso permite
aceitar movimento errado apesar de o tipo e produto coincidirem.

Especificar que cada movimento esperado confira, conforme o contrato
operacional 328:

- pedido por referencia contratual;
- produto;
- quantidade;
- filial;
- tipomovimento;
- referencia nao vazia e pertencente ao pedido;
- campos adicionais efetivamente gravados pela confirmacao.

Aplicar a mesma regra a SPT, SET, TPE, TFR e TEP quando aplicaveis. Ausencia,
duplicidade ou divergencia deve bloquear antes de numero/outbox e gerar a
pendencia existente. Criar testes de filial, referencia vazia/estranha e
quantidade divergente para cada familia de movimento, sem inserir ou
recalcular movimentos.

### 2. Linha ausente no lock nao pode reutilizar payload antigo

No relerLinhasCompletas, uma linha que nao aparece no resultado bloqueado
continua usando a linha recebida da tela. Isso viola a autoridade da leitura
atual e pode permitir prova ou numeracao sobre uma linha que nao foi
confirmada pelo lock.

Especificar que:

- toda linha relevante deve ser encontrada no conjunto bloqueado;
- linha ausente, duplicada ou fora do escopo do lock gere erro deterministico
  e pendencia, sem usar dados antigos;
- nao haja fallback para produto, quantidade, filial, situacao ou dadofiscal
  da tela;
- testes provem linha removida, linha trocada e conjunto incompleto, sem
  numero, outbox ou vinculo parcial.

### 3. Falha operacional no lote deve ser duravel

O catch generico do emissor em lote apenas adiciona falhas[] e devolve a
mensagem. Especificar que toda falha operacional capturavel com grupo
identificavel tente usar o servico unico de pendencia antes de entrar em
falhas[]. Falha da propria persistencia deve ser reportada sem mascarar o
erro original.

O resultado individual e de lote deve devolver identificador do grupo,
estado e pendencias efetivamente persistidas, incluindo tentativa atualizada.
Mensagens, codigos e correlacoes devem ser sanitizados antes do JSON. Nao
alterar situacao, documento, movimentos ou numero quando a falha ocorrer.

### 4. Envelope DANFE deve cobrir leitura e shape completo

findNfeProcIntegro ainda ocorre fora do try. Qualquer excecao nessa leitura
deve usar o mesmo fluxo duravel de falha, inclusive quando nao houver grupo.

A pendencia DANFE sem grupo deve persistir, no mesmo item idempotente, codigo,
tentativa, proxima_acao, correlacao e mensagem sanitizados. A proxima acao
deve ser derivada do codigo da etapa. Auditoria ocorre somente depois da
pendencia e nunca pode desfazer ou impedir o registro principal.

Testar excecao na leitura inicial, retry da mesma etapa, shape completo do
JSON e mensagens invalidas do legado. Falha DANFE continua sem alterar
autorizacao, situacao, movimentos ou vinculo.

### 5. Higiene de contrato

Se ainda aplicavel, remover parametros opcionais de ProvaMovimentosConfirmacao
sem consumidor produtivo e reduzir duplicacao de releitura/conversao sem
mover predicados do dominio. Manter o controller fino e nao usar
introspeccao de schema em runtime.

## Testes obrigatorios

Provar:

1. filial, referencia e quantidade conferidas em SPT/SET/TPE/TFR/TEP;
2. linha ausente no lock bloqueando sem fallback da tela;
3. falha operacional do lote com pendencia duravel e resposta com pendencias;
4. retry incrementando a mesma pendencia;
5. excecao de leitura inicial do nfeProc com pendencia sem grupo;
6. pendencia DANFE contendo codigo, tentativa, proxima_acao, correlacao e
   mensagem sanitizados;
7. nenhuma alteracao fora do escopo fechado.

Entregar spec, matriz achado -> requisito -> tarefa -> teste, contratos,
plano, quickstart e criterios de aceite. Nao alterar codigo nesta execucao
do /speckit.specify.
