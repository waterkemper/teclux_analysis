# Prompt `/speckit.specify` — correções pós-implementação dos prompts 39–43

Revise o código Laravel atual, as specs implementadas dos prompts 39, 40, 41,
42 e 43, os contratos publicados em `laravel/specs/412-trf-nfe-ibscbs`,
`laravel/specs/413-trf-pos-emissao-romaneio` e
`laravel/specs/416-trf-etiquetas-layout`, além das evidências Delphi já
registradas no Wayfinder.

Não implemente código nesta execução. Produza somente a spec corretiva, os
contratos, o plano, as tarefas, os testes, os critérios de aceite e o
quickstart necessários para implementação posterior.

## Objetivo

Corrigir as lacunas encontradas após a implementação dos prompts 39–43 sem
reabrir o escopo da Transferência de Requisição para Exposição.

O escopo permanece limitado a:

- preparação e emissão fiscal da NF-e de transferência;
- congelamento e serialização de IBS/CBS quando aplicável;
- decisão pós-emissão de romaneio;
- PDF de etiquetas de volumes;
- resolução e serialização de cBenef já prevista no prompt 42.

Ficam fora: `VendaTransferencia`, `DevolucaoTransferencia`, NFS-e,
cancelamento, inutilização, impressoras, UniDANFE, etiquetas de produtos,
alteração do Delphi e novo gateway fiscal.

## Achados que a spec deve corrigir

### 1. IBS/CBS: pré-voo e congelamento

Corrigir o fluxo de `TransferenciaFiscalEmitirGrupoCommand` para que:

1. a regra de aplicabilidade IBS/CBS seja avaliada antes de reservar número,
   criar outbox ou publicar qualquer intenção de transmissão;
2. erro de pré-voo, ausência de regra vigente, configuração incompleta ou
   resultado inconsistente bloqueie a emissão antes da numeração;
3. `aplicavel=false` só seja usado quando a regra autoritativa comprovar que o
   grupo não é aplicável, nunca como conversão silenciosa de erro;
4. a fotografia IBS/CBS seja congelada dentro da transação fiscal, antes de o
   outbox/XML poder observá-la;
5. retry não gere nova numeração nem substitua silenciosamente uma fotografia
   já selada.

O contrato deve deixar claro a ordem mínima:

```text
releitura FOR UPDATE
  -> pré-voo IBS/CBS
  -> fotografia fiscal completa
  -> congelamento IBS/CBS
  -> validações de coerência
  -> reserva da numeração
  -> persistência/outbox
  -> commit
  -> transmissão posterior
```

### 2. IBS/CBS: ausência, zeros e coerência

Não inventar `0`, `0.00` ou `0.0000` para campo ausente, inválido ou não
resolvido.

Definir na spec:

- quando o leiaute/regra autoritativa comprovar não aplicabilidade, o grupo
  poderá ser omitido;
- quando o grupo for aplicável, CST, classificação, base, alíquotas, valores e
  totais obrigatórios devem estar presentes e válidos;
- ausência, texto inválido ou grupo parcial deve bloquear a emissão;
- zero só pode ser serializado quando vier comprovadamente do cálculo
  autoritativo ou for permitido pelo leiaute vigente;
- `vBC` deve ser comparado entre IBS UF, IBS Município e CBS quando o contrato
  exigir a mesma base; divergência deve bloquear;
- o serializer não pode omitir um grupo parcialmente preenchido nem criar um
  XML aparentemente válido com dados fiscais artificiais.

Exigir testes para pré-voo ausente, erro de pré-voo, grupo aplicável incompleto,
alíquota inválida, base divergente, zero legítimo e grupo não aplicável.

### 3. Romaneio: uma única autoridade de inclusão

Revisar `TransferenciaPosEmissaoRomaneioPgsqlAdapter` e o trigger/função
legada. Escolher e documentar uma única autoridade para executar a inclusão:

- ou o comando Laravel chama a função de inclusão e o trigger não a repete;
- ou o comando apenas grava o modo e o trigger executa a inclusão.

É proibido manter os dois caminhos ativos. Exigir teste que comprove um único
registro em `romaneiosnotas`, sem duplicidade em retry ou replay.

Preservar os modos legados: `1` para novo romaneio, `2` para romaneio
existente e `0` para decisão explícita de não incluir.

### 4. Romaneio existente: contrato coerente

O código atual aceita um campo `romaneio`, mas a tela não o envia e o comando
não o considera integralmente na idempotência. A spec deve resolver essa
inconsistência após revisar a evidência Delphi e o contrato 413.

A decisão documentada deve ser uma destas, sem comportamento híbrido:

1. se o operador informa o número do romaneio existente, o campo deve ser
   obrigatório nessa escolha e percorrer UI, HTTP, comando, hash, porta,
   adapter, validação de escopo e testes; ou
2. se a paridade Delphi determina que o operador apenas escolhe “existente” e
   o banco/contrato Entregas localiza o romaneio compatível, remover o campo do
   contrato público e usar somente o caminho autoritativo do Entregas.

Não aceitar um número que seja ignorado nem criar automaticamente um romaneio
novo quando a escolha foi “existente”.

### 5. “Não incluir” versus cancelar a pergunta

Separar as duas interações:

- botão explícito “Não incluir”: deve chamar o POST idempotente com
  `escolha=nao_incluir`, persistir o modo `0`, produzir o estado durável
  `nao_incluido` e retirar o documento da fila;
- cancelar/fechar o modal: não deve chamar POST, não deve gravar modo e deve
  manter o documento em `aguardando_decisao` para reaparecer posteriormente.

O backdrop não pode reutilizar o callback de “Não incluir”. O estado projetado
deve distinguir decisão persistida de simples fechamento da interface.

Exigir testes de reload, retry, replay idempotente, cancelamento e múltiplos
documentos/grupos.

### 6. Etiquetas: dados do destino

Completar o provider e o DTO de etiquetas para carregar cidade/UF do
destinatário a partir da fonte autoritativa já existente. Não preencher cidade
ou UF com `null`, texto vazio ou valor inferido de forma silenciosa quando o
contrato exigir esses dados.

O layout aprovado deve exibir o dado de destino conforme o contrato de
`VolumeLabelData`. Se a fonte obrigatória estiver ausente, o endpoint deve
falhar com diagnóstico explícito antes de gerar PDF.

Preservar os campos opcionais já comprovados: marca, espécie, transportadora e
romaneio. Não reintroduzir pesos ou numeração sem projeção e evidência
específicas.

### 7. Código de barras — preservar e testar

Não alterar a regra já correta:

```text
chave_volume = chave_nfe canônica de 44 dígitos
             + volume_numero com 3 dígitos
             + volumes_total com 3 dígitos
```

O resultado deve ter 50 dígitos e ser codificado em Code 128 subset C, usando
pares numéricos, checksum, start e stop válidos.

O renderer deve continuar enviando `chave_volume` — e não apenas a chave NF-e
de 44 dígitos — ao gerador do barcode. A chave textual exibida na etiqueta
pode continuar sendo a chave NF-e formatada, mas o conteúdo das barras deve
ser a chave de volume completa.

Adicionar teste de regressão que valide o payload completo para os volumes
`001003`, `002003` e `003003`, além de validar os codewords/checksum ou decodificar
o SVG com um verificador Code 128C confiável. Não aceitar teste que confira
somente a existência de `<svg>`, `<rect>` ou atributo `data-chave-volume`.

### 8. cBenef

Preservar a resolução por item e a serialização condicional já implementadas
no prompt 42. Adicionar apenas testes de regressão que confirmem que:

- o valor resolvido pelo contrato autoritativo chega ao item correto;
- ausência tratável não gera cBenef inventado;
- o campo não é aplicado a item diferente nem sobrescrito por entrada não
  autoritativa da requisição.

## Testes e aceite

Entregar testes de aplicação, infraestrutura, integração e frontend que
comprovem:

1. pré-voo IBS/CBS ocorre antes da reserva e do outbox;
2. fotografia congelada é a mesma consumida pelo XML;
3. erros e dados incompletos bloqueiam sem mutação fiscal;
4. não existem inclusões duplicadas em romaneio;
5. romaneio existente respeita integralmente o contrato escolhido;
6. “Não incluir” é persistido e cancelar não é persistido;
7. cidade/UF aparecem corretamente nas etiquetas;
8. três volumes geram payloads Code 128C com finais `001003`, `002003` e
   `003003`;
9. o PDF continua sendo gerado em nova aba, sem impressão automática;
10. retry e replay são idempotentes e não repetem estoque, numeração,
    romaneio ou publicação de artefato.

Entregar também uma matriz `achado -> requisito -> tarefa -> teste`, contratos
HTTP atualizados, estados atualizados, decisões de paridade Delphi/Laravel,
quickstart de validação e critérios de aceite. Não alterar código nesta
execução do `/speckit.specify`.
