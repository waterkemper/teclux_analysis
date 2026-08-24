# Prompt /speckit.specify — correções pós-implementação do prompt 24

## Instrução

Revise a implementação atual do Laravel no commit 78bdd110, comparando-a com:

- modules/interlojas/transferencia-requisicao-emissao-fiscal/24-speckit-prompt-specify-consolidacao-coreografia-danfe.md;
- specs/395-trf-fiscal-coreografia/spec.md;
- specs/395-trf-fiscal-coreografia/contracts/;
- docs/adr/395-trf-fiscal-coreografia-atomica.md;
- relatórios Delphi já versionados em .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/;
- decisões dos tickets 19, 20, 22 e 23 do mapa Wayfinder.

Não implemente código nesta etapa. Gere somente uma especificação corretiva, plano, tarefas, contratos, testes e critérios de aceite. O fonte Delphi original pode não estar disponível; use os relatórios versionados e classifique fatos ausentes como NÃO LOCALIZADO.

O objetivo é corrigir somente as lacunas abaixo, preservando o escopo do prompt 24:

- somente Transferência;
- NF-e modelo 55 de saída;
- DANFE padrão em PDF pelo pipeline comum;
- sem VendaTransferencia, DevolucaoTransferencia, NF-e de entrada, financeiro, NFSe, etiquetas, DANFE simplificada, UniDANFE ou impressão automática.

## Achados confirmados na implementação atual

### Regra canônica: pedidosfiliais.dadofiscal

Para cada linha de pedido incluída no grupo de Transferência, um valor positivo em
pedidosfiliais.dadofiscal significa que aquela linha já está associada a um
documento fiscal. Essa é a evidência primária para impedir uma nova emissão e
uma nova movimentação; não se deve começar por uma busca genérica em notas.

A especificação corretiva deve carregar as linhas do grupo com proteção
adequada à concorrência e classificar o vínculo assim:

- todas as linhas sem dadofiscal positivo: não existe vínculo fiscal prévio no
  grupo; a preparação pode prosseguir, observadas as demais regras;
- todas as linhas relevantes com o mesmo dadofiscal positivo: o grupo já está
  associado a esse documento; reconciliar o documento existente e não alocar,
  transmitir ou movimentar novamente;
- linhas com dadofiscais positivos diferentes: conflito entre documentos;
  bloquear e criar pendência explícita;
- parte das linhas com dadofiscal positivo e parte sem vínculo: associação
  parcial; bloquear a nova emissão até reconciliar o grupo, sem preencher ou
  substituir vínculos silenciosamente.

O campo pedidosfiliais.dadofiscal prova o vínculo com um documento, mas não
precisa provar a autorização SEFAZ para fechar a Transferência. Para este
domínio, uma vez gravado o vínculo fiscal e concluídos os movimentos, a
Transferência está fechada. A autorização, rejeição e demais estados fiscais
pertencem ao ciclo de vida fiscal e não devem reabrir, bloquear ou alterar a
situação da Transferência por consulta indireta.

Cancelamento e inutilização de nota fiscal estão fora desta especificação.
Esses processos pertencem ao módulo Estoque → Notas Fiscais Avulsas, que
possui seu próprio fluxo para limpar dadofiscal, remover movimentos e retornar
pedidos à situação A quando aplicável. A Transferência não deve implementar,
orquestrar ou reagir a esse processo.

notas/dadosfiscais continuam sendo fontes de validação e enriquecimento da
identidade. Uma linha arbitrária de notas para a mesma filial não pode ser
interpretada como documento da Transferência nem como documento pertencente ao
Delphi. A origem Delphi/Laravel é uma informação de proveniência posterior à
identificação do vínculo. Raiz de CNPJ não é critério de associação.

### 1. Documento já associado à Transferência, inclusive Delphi, pode duplicar estoque

Em TransferenciaFiscalConfirmarGrupoNaTxService.php, quando a reconciliação
retorna delphi_owns=true, o fluxo chama afterNotaInsert. O callback do handler
confirma novamente os movimentos SPT/SET. Além disso, a reconciliação atual
não parte do vínculo já persistido em pedidosfiliais.dadofiscal.

Corrigir a especificação para exigir:

- usar primeiro o conjunto de pedidosfiliais.dadofiscal das linhas do grupo;
- tratar um dadofiscal positivo comum como documento já associado,
  independentemente de a origem ser Delphi ou Laravel;
- considerar a Transferência fechada após o vínculo fiscal e os movimentos
  terem sido persistidos, sem aguardar autorização SEFAZ;
- não implementar cancelamento ou inutilização nesta especificação;
- nenhum novo movimento quando o Delphi já possui o documento;
- nenhuma nova alocação ou transmissão;
- persistência/reconciliação da identidade do grupo Cloud, da origem e do documento legado;
- vínculo idempotente dos pedidos ao dadofiscal existente, somente se ainda não houver vínculo conflitante;
- pendência explícita quando o documento Delphi não puder ser associado com segurança;
- confirmação operacional não deve usar o documento Delphi como motivo para repetir estoque.

### 2. Replay de emissão Laravel pode executar afterNotaInsert novamente

Em TransferenciaFiscalPlatformAdapter.php, os caminhos de emissão já existente chamam afterNotaInsert novamente. Isso pode criar SPT/SET duplicado em retry interno, mesmo quando o replay HTTP já é idempotente.

Exigir que:

- callbacks de efeitos operacionais só sejam executados na primeira preparação efetiva;
- emissão, documento, grupo e movimentos sejam protegidos por chave de idempotência;
- um resultado reusado nunca reinsira ou reescreva movimentos;
- o retry retorne o estado persistido e apenas reencaminhe a autorização quando permitido;
- qualquer movimento já existente com outro dadofiscal gere conflito/pêndencia, nunca sobrescrita silenciosa.

### 3. TPE/TFR/TEP não recebem vínculo fiscal completo

O SPT/SET recebe dadofiscal, mas o caminho de liberação de requisição chama insertLiberacaoRequisicao/insertTep sem transportar o documento fiscal.

Definir contratos para que todo movimento produzido pela confirmação desta Transferência, incluindo SPT, SET, TPE, TFR e TEP quando aplicável:

- seja gravado dentro da mesma transação curta;
- receba o dadofiscal e a referência fiscal quando o schema permitir;
- seja retornado na evidência do grupo;
- seja protegido contra duplicidade;
- seja validado contra o snapshot de schema e triggers antes de escolher a coluna final;
- não seja criado novamente após autorização.

Se algum tipo legado não suportar vínculo fiscal, a especificação deve definir uma estratégia de rastreabilidade segura ou bloquear a preparação; não aceitar perda silenciosa de rastreabilidade.

### 4. Reconciliação Delphi no F8 pode ser bloqueada por série ausente e cair em nova alocação

No F8, TransferenciaFiscalConfirmarGrupoNaTxService.php chama a reconciliação antes de existir série. O adapter pode retornar serie_omitida e o fluxo continua para nova numeração.

Corrigir para:

- usar primeiro a identidade persistida da origem/grupo e os dados legados disponíveis;
- consultar o documento Delphi por origem, FilialBase, Filial Requisitante, modelo, operação, dadofiscal, chave e demais identificadores comprovados;
- não exigir uma série ainda inexistente como condição para procurar documento legado;
- se a identidade for insuficiente, retornar RECONCILIACAO_IDENTIDADE_INSUFICIENTE ou equivalente;
- impedir alocação Laravel até a reconciliação ser concluída ou explicitamente descartada por decisão administrativa auditada;
- nunca interpretar “não consegui procurar” como “não existe documento Delphi”.

### 5. DANFE pode ser renderizada sem verificar AUTORIZADA e falha não cria pendência de artefato

GerarDanfeArtefatoService.php localiza nfeProc e renderiza, mas não exige situação fiscal AUTORIZADA antes de gerar. Em falha, audita e lança exceção, sem registrar uma pendência durável de artefato.

Definir:

- pré-condição AUTORIZADA no mesmo estado autoritativo da plataforma fiscal;
- rejeitada, pendente, transmitindo e aguardando reconciliação não podem gerar DANFE autorizada;
- reimpressão deve reutilizar o PDF por hash do nfeProc e versão do renderer;
- falha de renderer/storage deve criar ou atualizar pendência durável, com código, tentativa, próxima ação e correlação;
- falha do PDF não altera a autorização da NF-e;
- nenhuma integração com UniDANFE, impressora ou etiquetas.

### 6. Endpoint emitir não pode ser segundo fluxo canônico

O endpoint normal de emissão chama TransferenciaFiscalEmitirGrupoCommand e pode alocar documento/outbox sem executar a confirmação operacional atômica, especialmente quando sanear_fiscal=false.

A nova especificação deve escolher e documentar uma única política:

1. o endpoint emitir passa a delegar ao mesmo serviço canônico da confirmação F8, com a mesma transação, movimentos, fechamento, vínculo de pedidos e outbox; ou
2. o endpoint emitir deixa de ser uma emissão normal e fica restrito a saneamento/replay administrativo de grupo já confirmado, sem inserir novo estoque.

Em ambos os casos:

- não pode existir caminho que numere/transmita sem confirmação operacional válida;
- sanear_fiscal não pode ser um bypass silencioso da coreografia;
- o endpoint deve declarar no contrato se é confirmação, saneamento ou replay;
- testes devem provar que uma chamada normal não cria emissão sem grupo operacional confirmado.

## Requisitos corretivos

Inclua requisitos testáveis para:

- ownership Delphi sem segundo movimento;
- replay Laravel sem segundo movimento;
- conflito de movimento já vinculado;
- vínculo fiscal de todos os tipos de movimento aplicáveis;
- reconciliação sem série previamente conhecida;
- bloqueio fail-closed quando a identidade for insuficiente;
- persistência do grupo Cloud mesmo quando Delphi é o proprietário;
- uma única porta canônica de confirmação/preparação;
- pré-condição AUTORIZADA para DANFE;
- pendência durável de geração/custódia do PDF;
- sem UniDANFE, impressoras, etiquetas ou DANFE simplificada;
- ausência de NF-e de entrada e efeitos financeiros.

## Testes obrigatórios

Atualize ou crie testes para:

1. Delphi proprietário não inserir SPT/SET/TPE/TFR/TEP;
2. replay de emissão já alocada não inserir nenhum movimento;
3. movimento já associado a outro dadofiscal gerar conflito e não ser sobrescrito;
4. TPE/TFR/TEP receberem ou rejeitarem explicitamente o vínculo fiscal conforme o schema;
5. reconciliação F8 encontrar Delphi sem série informada usando a identidade disponível;
6. identidade insuficiente bloquear nova alocação;
7. grupo Cloud ser persistido no caminho delphi_owns;
8. endpoint emitir normal não contornar confirmação operacional;
9. modo saneamento/replay não criar novo movimento;
10. DANFE antes de AUTORIZADA ser rejeitada;
11. falha do renderer gerar pendência durável e preservar autorização;
12. reimpressão retornar o mesmo artefato por XML/hash/versão;
13. retry, concorrência e autorização repetida permanecerem idempotentes;
14. fora de escopo continuar bloqueado.

## Entregáveis

Produza:

- spec corretiva;
- matriz achado → requisito → tarefa → teste;
- contratos revisados de confirmação, reconciliação, movimentos e DANFE;
- plano de migração/refatoração, sem executar alterações;
- quickstart de validação;
- critérios de aceite;
- lista explícita do que não deve ser alterado.

Não alterar código nesta etapa e não exigir acesso aos fontes Delphi originais.
