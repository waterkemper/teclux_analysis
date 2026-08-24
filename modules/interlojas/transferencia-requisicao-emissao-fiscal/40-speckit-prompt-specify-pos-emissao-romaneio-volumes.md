# Prompt `/speckit.specify` — pós-emissão: romaneio e volumes da Transferência

Revise o código Laravel atual, as specs anteriores deste módulo e as decisões
dos tickets 24, 25, 26 e 27 do Wayfinder
`.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/`.

Não implemente código nesta execução. Produza somente a spec, o plano, as
tarefas, os contratos, os testes, os critérios de aceite e o quickstart para
o comportamento pós-emissão da Transferência de Requisição para Exposição.

## Objetivo

Completar a etapa posterior à criação/projeção da NF-e de saída, reproduzindo o
comportamento operacional comprovado no Delphi:

1. depois de existir um `dadofiscal` válido para o grupo, permitir ao operador
   decidir se a nota será incluída em romaneio;
2. suportar inclusão em romaneio existente ou criação de novo romaneio,
   conforme os contratos já existentes do módulo Entregas;
3. deixar os volumes fiscais persistidos e disponíveis para a etapa de
   etiquetas, sem imprimir automaticamente.

## Evidência Delphi que deve ser preservada

- `delphi/repositorio/dmbasico.pas:1738-1785`: quando o parâmetro
  `ParSistema.Incluir_nota_entre_filiais_automaticamente_nos_romaneios` está
  ativo, `modoinclusaoromaneio` ainda é nulo e a saída é elegível, o Delphi
  pergunta ao operador:
  - não incluir;
  - incluir em romaneio existente;
  - incluir em novo romaneio.
- O modo `2` representa romaneio existente e o modo `1` representa novo
  romaneio. Cancelar a pergunta não grava a inclusão.
- A consulta da transferência lê `df.modoinclusaoromaneio` em
  `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.dfm:734`.
- A decisão ocorre no fluxo genérico após a nota estar persistida; não manter
  transação aberta enquanto se aguarda interação do usuário.
- Após concluir as notas, `ConfirmaRequisicao` chama a etapa de volumes. A
  etiqueta é de volume, não de produto.

## O que já está implementado — não reimplementar nem substituir

Preservar os contratos já fechados e cobertos pelas specs anteriores:

- um grupo fiscal por filial requisitante; `lotetransferencia` é metadado
  operacional e não cria uma NF por lote;
- flag `caracteristicas.producaopropria` no nível do item; não agrupar a NF
  por essa flag;
- releitura atual com `FOR UPDATE` no instante de confirmação/emissão;
- `pedidosfiliais.dadofiscal` como única evidência de vínculo da transferência;
- numeração, fotografia, outbox, transmissão, autorização, DANFE e projeção
  usando a plataforma fiscal comum;
- idempotência, pendência durável, retry sem nova numeração e separação de
  sucesso/falha por grupo;
- fechamento `A -> F`, movimentos de estoque e vinculação de movimentos;
- saldo parcial parametrizado: a linha original fecha com o fiscal e uma nova
  linha aberta recebe `codigoorigem`, `dadofiscal` nulo e a diferença positiva;
- o chamador deve gravar na nova requisição a observação compatível com o
  Delphi, no formato `Saldo pendente da requisição n. {codigo_origem}`;
- `volumesdadosfiscais` continua sendo a fonte legada dos volumes fiscais. A
  projeção atual usa `codigo = 1` para a linha do documento e não deve criar
  uma tabela paralela.

## Escopo funcional a especificar

### 1. Escolha do romaneio após a NF-e

Definir um contrato de aplicação e de HTTP para a ação pós-emissão, por
`dadofiscal`, que:

- só aceite documento de saída de transferência pertencente ao grupo atual;
- só seja apresentado quando o parâmetro de inclusão automática estiver
  habilitado e `modoinclusaoromaneio` ainda estiver nulo;
- ofereça explicitamente `nao_incluir`, `romaneio_existente` e
  `novo_romaneio`;
- para romaneio existente, valide pelo serviço/contrato compartilhado do
  módulo Entregas: existência, situação aberta, tipo compatível, filial/origem
  e destino compatíveis e ausência de vínculo prévio;
- para novo romaneio, reutilize o caso de uso existente de criação do módulo
  Entregas. Não inserir diretamente uma estrutura que duplique esse agregado;
- grave os modos legados comprovados (`1` novo, `2` existente) em
  `dadosfiscais.modoinclusaoromaneio` somente após a validação da operação;
- crie o vínculo em `romaneiosnotas` pelo caminho autoritativo já adotado pelo
  projeto. Se o banco usar `dadosfiscais_incluirromaneio`/`incluir_romaneio`,
  tratar isso como contrato de infraestrutura e não reimplementar a função em
  PHP;
- em `nao_incluir` ou cancelamento da pergunta, não criar romaneio, não criar
  vínculo e não alterar estoque, `pedidosfiliais` ou a NF;
- devolva no envelope o resultado por documento: não incluído, pendente,
  incluído em romaneio existente ou incluído em novo romaneio.

### 2. Transação, idempotência e falhas

Especificar que a operação pós-emissão:

- ocorre em transação curta própria, com locks ordenados do documento e do
  romaneio quando aplicável;
- não renumera, não transmite novamente, não desfaz o fechamento da
  transferência e não repete movimentos de estoque;
- seja idempotente por `dadofiscal` + operação + chave da requisição;
- em retry, reconheça o vínculo já existente e devolva o mesmo resultado;
- se a inclusão falhar depois da NF estar concluída, mantenha a NF e a
  transferência fechadas, registre pendência durável e exponha uma ação de
  retry/reconciliação;
- não permita que uma nota seja vinculada a dois romaneios ativos;
- não faça cancelamento ou inutilização da NF. Essas operações continuam em
  Estoque -> Notas Fiscais Avulsas.

### 3. Interface da transferência

Definir o estado e a interação no Laravel para:

- exibir a pergunta somente depois de a emissão/projeção do documento estar
  concluída e o `dadofiscal` ser conhecido;
- apresentar a escolha por documento quando houver múltiplos grupos;
- atualizar o grid com o número do romaneio sem recarregar a tela inteira;
- oferecer a ação posterior de abrir o PDF de etiquetas de volumes;
- não integrar impressora local, UniDANFE ou agente de impressão nesta spec;
- manter o painel/modal de NF-e existente e não misturar estado fiscal com
  estado do romaneio.

## Fronteiras obrigatórias

Fora desta spec: `VendaTransferencia`, `DevolucaoTransferencia`, NF-e de
entrada automática, NFS-e, financeiro, cancelamento/inutilização, impressora,
UniDANFE, etiquetas de produto, novo gateway fiscal, novo contador, novo
certificado, novo agregado fiscal ou alteração do Delphi.

A confirmação por Romaneios continua sendo a autoridade para conferência e
recebimento de volumes depois que o documento foi incluído. Esta spec apenas
faz o handoff pós-emissão e não substitui aquela jornada.

## Testes e aceite

Exigir testes de aplicação/feature para:

1. parâmetro desligado não apresenta nem grava inclusão;
2. `nao_incluir` não cria romaneio nem vínculo;
3. inclusão em romaneio existente grava modo `2` e um único vínculo;
4. novo romaneio grava modo `1` e um único vínculo;
5. documento já vinculado é retry idempotente;
6. romaneio fechado, incompatível ou de outro escopo bloqueia sem mutação;
7. falha pós-NF gera pendência sem desfazer NF, estoque ou `dadofiscal`;
8. múltiplos grupos mantêm decisões independentes;
9. saldo parcial cria a nova requisição aberta com observação, origem,
   quantidade positiva, `dadofiscal` nulo e TEP quando parametrizado;
10. nenhum caminho cria venda/devolução, NF de entrada ou impressora.

Entregar matriz achado -> requisito -> tarefa -> teste, contrato de estados,
contrato HTTP, matriz de idempotência, quickstart e critérios de aceite. Não
alterar código nesta execução do `/speckit.specify`.
