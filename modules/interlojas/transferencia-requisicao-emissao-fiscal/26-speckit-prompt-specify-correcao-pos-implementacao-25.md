# Prompt /speckit.specify — correções pós-implementação do prompt 25

## Instrução

Revise a implementação atual do Laravel no commit `b2492380`, comparando-a
com:

- `modules/interlojas/transferencia-requisicao-emissao-fiscal/25-speckit-prompt-specify-correcao-pos-implementacao-24.md`;
- `specs/396-fix-trf-fiscal-gaps/spec.md`;
- `specs/396-fix-trf-fiscal-gaps/contracts/`;
- `specs/395-trf-fiscal-coreografia/`;
- `docs/adr/396-fix-trf-fiscal-gaps.md`;
- relatórios Delphi versionados em
  `.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/`.

Não exigir os fontes Delphi originais. Não implementar código nesta etapa.
Produzir somente especificação corretiva, plano, tarefas, contratos, testes,
critérios de aceite e quickstart.

Preservar estas decisões já fechadas:

- somente Transferência de Requisição para Exposição;
- NF-e modelo 55 de saída;
- `pedidosfiliais.dadofiscal` é a evidência primária de vínculo;
- vínculo fiscal mais movimentos persistidos fecha a Transferência,
  independentemente de autorização SEFAZ;
- cancelamento e inutilização pertencem exclusivamente a
  Estoque → Notas Fiscais Avulsas e não devem ser implementados, orquestrados
  ou observados nesta origem;
- sem VendaTransferencia, DevolucaoTransferencia, NF-e de entrada,
  financeiro, NFS-e, etiquetas, DANFE simplificada, UniDANFE, impressoras ou
  novo pipeline fiscal.

## Lacunas confirmadas no commit b2492380

### 1. A emissão não deve procurar uma “NF Delphi órfã”

Uma nota encontrada genericamente em `notas`/`dadosfiscais` não permite
saber a qual `pedidosfiliais` ela pertence. Portanto, não criar controle para
procurar ou associar uma suposta NF Delphi órfã.

A especificação deve exigir esta sequência na confirmação F8:

- dentro da mesma transação, reler e bloquear as linhas atuais de
  `pedidosfiliais` com FOR UPDATE;
- classificar o conjunto atual de `dadofiscal`, ignorando os valores
  recebidos originalmente pela tela;
- nenhum `dadofiscal` positivo: seguir para uma nova preparação/alocação
  Laravel, sem consulta genérica de nota Delphi;
- todas as linhas relevantes com o mesmo `dadofiscal` positivo: considerar o
  documento já associado, sem nova alocação, transmissão ou movimento;
- valores distintos ou associação parcial: bloquear com pendência;
- com `dadofiscal` positivo, o relacionamento já está definido; carregar
  `dadosfiscais`/`notas` por esse número apenas para obter os dados da
  própria NF;
- sem `dadofiscal`, não consultar `dadosfiscais`/`notas` para tentar
  descobrir uma NF do pedido;
- não inferir `delphi_owns` por uma linha arbitrária de `notas`;
- não transformar falha de consulta em uma nova associação ou em uma emissão
  baseada em documento legado.

O fluxo não deve exigir série, chave, CNPJ ou qualquer outro identificador de
uma nota que não esteja vinculada aos pedidos. A decisão de emitir ou não deve
ser tomada pelo vínculo atual dos pedidos, no momento da operação.

### 2. Saneamento pode alocar sem provar efeito operacional prévio

O modo `sanear_fiscal` carrega linhas `F` sem `dadofiscal`, mas não prova
que o conjunto de movimentos operacionais da confirmação já existe antes de
selar/alocar o documento.

Definir que:

- saneamento só é permitido para grupo operacional já confirmado;
- o grupo e suas linhas devem ser identificados de forma idempotente;
- os movimentos esperados da confirmação devem existir antes do saneamento;
- movimentos ausentes, divergentes ou associados a outro `dadofiscal`
  geram pendência e bloqueiam;
- saneamento pode apenas vincular/corrigir o documento nos registros já
  existentes, sem INSERT de movimento, sem recalcular saldo e sem criar
  segunda confirmação;
- replay também deve somente devolver o estado persistido;
- teste deve provar que grupo `F` sem movimentos não recebe número/outbox
  por esse caminho.

### 3. Caminho `emitir` deve respeitar o vínculo atual dos pedidos

O caminho `emitir` não deve fazer uma busca genérica para decidir que um
documento pertence ao Delphi. Ele deve usar a mesma classificação autoritativa
de `pedidosfiliais.dadofiscal` ou operar somente sobre o grupo já persistido.

Corrigir para exigir:

- leitura atualizada das linhas quando o caminho for chamado, sem confiar
  apenas no payload da tela;
- se houver `dadofiscal` comum, persistência idempotente do grupo Cloud,
  documento e série/número/chave quando conhecidos;
- nenhum movimento, nova alocação ou nova transmissão para documento já
  vinculado aos pedidos;
- se não houver `dadofiscal`, o modo permitido deve ser explicitamente
  `sanear_fiscal` ou `replay`, conforme o estado operacional já persistido;
- reexecução não pode apagar fotografia, vínculo, pendência ou identidade
  Cloud já persistidos;
- resultado de replay deve apontar para o grupo e documento já persistidos.

### 4. Falhas de DANFE/storage podem ficar sem pendência durável

Em `GerarDanfeArtefatoService`, apenas o renderer está protegido pelo
tratamento que registra pendência. Falhas ao ler `nfeProc`, validar hash,
persistir o PDF, criar outbox ou custodiar no storage podem escapar sem
pendência durável.

Definir que:

- leitura, integridade, renderização, persistência e custódia tenham tratamento
  durável de falha;
- cada falha registre código, tentativa, próxima ação e correlação;
- o mesmo item de pendência seja atualizado de forma idempotente;
- falha de PDF nunca altere a situação fiscal ou reabra a Transferência;
- reimpressão continue reutilizando XML/hash/versão do renderer;
- não criar renderer, storage ou fila paralelos;
- se o grupo de Transferência não puder ser localizado, usar o mecanismo
  durável fiscal comum ou retornar erro persistível; nunca descartar a falha.

## Endurecimento de conformidade

Incluir na especificação corretiva, sem ampliar o domínio:

- mover a validação obrigatória de `modo` para o FormRequest e deixar o
  controller fino, preservando os contratos HTTP existentes;
- manter predicados de negócio no domínio, não em DTO/result object da camada
  Application;
- sanitizar valores derivados do legado antes de compor mensagens, logs ou
  JSON, inclusive situações fiscais e códigos de erro;
- não alterar o esquema legado agressivamente nem usar
  `Schema::has*` em runtime.

## Testes obrigatórios

Criar ou atualizar testes para provar:

1. valor de `dadofiscal` alterado depois do carregamento da tela é lido
   novamente no F8 sob FOR UPDATE;
2. grupo sem `dadofiscal` não consulta nota genérica para decidir associação;
3. grupo com `dadofiscal` comum não aloca, transmite ou movimenta novamente;
4. valores distintos ou associação parcial bloqueiam e persistem pendência;
5. `sanear_fiscal` em grupo `F` sem movimentos recusa e não cria
   número/outbox;
6. saneamento de grupo com movimentos apenas vincula/reutiliza e não insere
   movimento;
7. caminho `emitir` respeita o `dadofiscal` atual e persiste grupo Cloud;
8. replay preserva fotografia, identidade e pendências;
9. falha em leitura/hash/renderer/persistência/custódia do DANFE cria ou
   atualiza pendência durável;
10. falha de DANFE não altera autorização nem estado operacional;
11. cancelamento/inutilização continuam sem endpoint, callback ou efeito
    implementado na Transferência;
12. VendaTransferencia, DevolucaoTransferencia, entrada, financeiro,
    etiquetas, simplificada, UniDANFE e impressoras continuam fora do fluxo.

## Entregáveis

Produzir:

- spec corretiva;
- matriz achado → requisito → tarefa → teste;
- contratos de reconciliação, saneamento, persistência Cloud e DANFE;
- plano e tarefas sem implementar código nesta execução;
- quickstart de validação;
- critérios de aceite;
- lista explícita do que não deve ser alterado.

Não alterar código nesta etapa.
