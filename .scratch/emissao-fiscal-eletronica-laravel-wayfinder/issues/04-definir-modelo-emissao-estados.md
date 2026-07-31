# Definir o modelo da Emissão Fiscal Eletrônica e seus estados

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Quais entidades, identidades, comandos, estados e transições representam NF-e e NFC-e da reserva até autorização, rejeição, contingência, reconciliação, CC-e, cancelamento e inutilização, sem confundir estado técnico e Situação fiscal?

## Answer

### Identidade e composição

Uma Emissão Fiscal Eletrônica é única pela identidade interna e pela combinação `Filial + modelo + Série Fiscal + número + ambiente`. Retransmitir, consultar, reconciliar ou entrar em contingência não cria outra emissão. A emissão possui:

- revisões imutáveis da fotografia fiscal e do XML;
- Tentativas Fiscais imutáveis para cada comunicação;
- Eventos Fiscais independentes para cancelamento, CC-e e inutilização;
- Episódios de Contingência auditados;
- projeção compatível nos campos de `dadosfiscais`.

A emissão nasce na mesma transação que grava `dadosfiscais`, `notas`, avança `seriesfiliais` e cria a outbox. Nasce fiscalmente `PENDENTE` e operacionalmente `AGUARDANDO`.

### Dois eixos de estado

Situação Fiscal da Emissão:

- `PENDENTE`;
- `REJEITADA_CORRIGIVEL`;
- `AUTORIZADA`;
- `USO_DENEGADO`, somente para NF-e quando a regra oficial vigente admitir e para histórico;
- `CANCELADA`;
- `INUTILIZADA`.

Situação do Processamento Fiscal:

- `AGUARDANDO`;
- `PROCESSANDO`;
- `AGUARDANDO_CORRECAO`;
- `OPERANDO_EM_CONTINGENCIA`;
- `AGUARDANDO_TRANSMISSAO_DA_CONTINGENCIA`;
- `AGUARDANDO_RECONCILIACAO`;
- `CONCLUIDO`;
- `FALHA_OPERACIONAL`.

`cStat` e respostas brutas permanecem evidência; não se transformam centenas de códigos oficiais em estados internos. Enums são fechados e evoluem por migração versionada.

### Rejeição, correção e imutabilidade

Rejeição explícita e corrigível não encerra a emissão. O Usuário pode corrigir os dados permitidos em `dadosfiscais`; o sistema preserva a revisão/resultado rejeitados, cria nova fotografia imutável e nova Tentativa Fiscal com o mesmo número. Documento autorizado não pode ser alterado.

Timeout, queda ou resposta ambígua nunca equivalem a rejeição. A emissão vai para `AGUARDANDO_RECONCILIACAO`, bloqueando alteração, retransmissão cega, cancelamento, inutilização e CC-e. Reconciliar consulta a chave e decide entre recuperar o protocolo, liberar retentativa segura ou continuar aguardando.

### Eventos Fiscais

Cancelamento, CC-e e inutilização têm registros, Tentativas, XMLs, protocolos e `cStat` próprios. Cada evento usa:

- `SOLICITADO`;
- `PROCESSANDO`;
- `AGUARDANDO_RECONCILIACAO`;
- `AUTORIZADO`;
- `REJEITADO`;
- `FALHA_OPERACIONAL`.

CC-e autorizada mantém a emissão `AUTORIZADA`. Cancelamento autorizado projeta `CANCELADA`. Inutilização autorizada projeta `INUTILIZADA` somente quando o número não foi autorizado. Evento rejeitado/falho não muda o resultado da emissão.

O Delphi pré-grava `dadosfiscais.situacao = 'C'` antes de cancelar/inutilizar e tenta restaurar na falha. O Laravel não repetirá essa janela: durante a tentativa, o bloqueio vive no Evento Fiscal; somente protocolo confirmado produz `C`.

### Contingência NFC-e e NF-e

Contingência não é resultado fiscal final. Cada revisão registra modalidade (`NORMAL`, `OFFLINE_NFCE`, `SVC`, `EPEC` ou outra oficialmente configurada) e participa da formação da chave/XML. O Episódio de Contingência registra justificativa, início, fim, responsável e regra vigente.

NFC-e offline permanece `PENDENTE` até transmissão/autorização; SVC pode terminar `AUTORIZADA`; EPEC autorizado não equivale à NF-e autorizada. Se a tentativa normal ficou ambígua antes da contingência, ela e sua chave candidata permanecem preservadas e exigem reconciliação.

### Concorrência e comandos

Há no máximo um comando fiscal mutável ativo por emissão. Cliques/jobs duplicados recuperam a operação existente. Consulta automática usa lock e não compete com transmissão, correção ou evento. Em resultado ambíguo, somente reconciliação é permitida, ressalvado o fluxo específico, auditado e oficialmente válido de contingência NFC-e.

### Projeção legada

- `PENDENTE`, `REJEITADA_CORRIGIVEL` e `AUTORIZADA` projetam `dadosfiscais.situacao = 'N'`;
- autorização também preenche `numprotocolonfe`, `statusnfe`, `chv_nfe` e `dhprocnfe`;
- cancelamento autorizado projeta `C` e `numcancelamentonfe`;
- inutilização autorizada projeta `C` e `numinutilizacaonfe`;
- uso denegado aplicável/histórico projeta `D`;
- processamento, timeout e contingência não criam códigos novos em `dadosfiscais.situacao`.

A nova estrutura é a fonte explícita do processo; `dadosfiscais` permanece projeção de compatibilidade para o Delphi.
