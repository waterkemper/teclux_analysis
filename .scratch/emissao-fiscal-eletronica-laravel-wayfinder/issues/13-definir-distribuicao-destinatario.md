# Definir a distribuição do Documento Fiscal ao destinatário

Type: grilling
Status: resolved
Blocked by: 07, 09

## Question

Como entregar XML autorizado e DANFE ao destinatário por e-mail ou outros canais, com destinatários, templates, retentativas, Auditoria e links S3 seguros, sem usar credenciais SMTP pessoais nem confundir falha de distribuição com falha fiscal?

## Answer

### Transporte de e-mail na convivência

Na primeira implantação, o Laravel preserva a precedência do Delphi:

1. usa o perfil SMTP completo e válido da Filial;
2. se ele não estiver disponível, usa integralmente o perfil SMTP do Usuário;
3. se nenhum perfil estiver completo, cria Pendência de Distribuição.

Campos de perfis diferentes nunca são misturados. O fallback pessoal é uma compatibilidade transitória aceita; a arquitetura mantém uma porta de transporte para substituí-lo depois por conta institucional sem alterar o domínio.

Credenciais não são copiadas para a Distribuição Fiscal, Artefatos, logs ou Auditoria.

### Destinatários

A composição inicial reproduz o Delphi:

- endereço gravado em dadosfiscais.email;
- Contatos atuais do Cliente marcados com enviar_nfe;
- e-mail da Transportadora em fornecedores.emailrecebxmlnfe quando o fluxo aplicável solicitar sua distribuição.

Endereços são normalizados, validados e deduplicados. Cada Distribuição Fiscal preserva a lista efetivamente utilizada; mudança posterior no cadastro não altera seu histórico.

### Artefatos entregues

Na autorização:

- NF-e: XML processado autorizado nfeProc e DANFE PDF;
- NFC-e: DANFE NFC-e entregue no ato da venda; quando houver destinatário de e-mail, XML processado autorizado e PDF.

Nos eventos:

- cancelamento autorizado: XML processado do Evento Fiscal e representação PDF pertinente;
- CC-e autorizada: XML processado da CC-e e representação legível;
- inutilização: não é enviada ao Cliente ou Transportadora.

Nunca são distribuídos XML pré-assinado, pedido, resposta bruta ou evidência técnica.

Os anexos são lidos dos Artefatos Fiscais canônicos no S3 e têm tamanho e hash validados antes do envio. Se o pacote exceder o limite configurado do e-mail, usa-se URL pré-assinada com validade de cinco minutos e autorização da aplicação; nunca link público ou permanente.

### Momento e independência fiscal

Após autorização e disponibilidade dos Artefatos Fiscais, nasce automaticamente uma Distribuição Fiscal em fila separada. E-mail não atrasa, reverte nem modifica a autorização. NFC-e no caixa nunca espera envio de e-mail.

Cancelamento e CC-e autorizados criam distribuições próprias. Falha de entrega cria Pendência de Distribuição, sem alterar a Situação Fiscal da Emissão ou o Evento Fiscal.

A Central de Emissões permite reenvio manual. Reenvio solicitado pelo Operador cria nova Distribuição Fiscal auditada; retentativa técnica permanece dentro da distribuição existente.

### Identidade e idempotência

Uma Distribuição Fiscal é identificada pela Emissão ou Evento Fiscal, finalidade, conjunto de destinatários e versão dos Artefatos. Ela representa a entrega pretendida.

Cada execução é uma Tentativa de Distribuição imutável. Repetição do mesmo job recupera a tentativa ou distribuição correspondente e não envia mensagem duplicada. Um novo pedido humano de reenvio possui identidade própria, mesmo quando destinatários e anexos são iguais.

### Retentativas

Falha técnica temporária retenta após 1, 5, 15 e 60 minutos. Endereço inválido, rejeição permanente do servidor ou ausência de perfil SMTP válido cria Pendência de Distribuição imediatamente.

Após esgotar tentativas automáticas, a pendência permanece visível na Central. Retomada ou reenvio manual não apaga tentativas anteriores.

### Templates

Templates versionados cobrem:

- autorização de NF-e;
- autorização de NFC-e;
- cancelamento;
- CC-e.

O conteúdo inclui Filial emitente, modelo, número, Série Fiscal, data, valor quando aplicável e orientação sobre anexos. O texto final já configurado para notas, cartas e boletos é preservado como rodapé.

O Operador não edita livremente o corpo por envio. Assunto, template e versão efetivamente usados ficam associados à Distribuição Fiscal.

### Eventos posteriores

Cancelamento autorizado é enviado automaticamente aos destinatários da distribuição original, incluindo a Transportadora quando ela recebeu a nota. CC-e autorizada é enviada automaticamente aos destinatários da nota. Inutilização não é distribuída.

Falha desses envios é Pendência de Distribuição, não falha fiscal.

### Canais da primeira implantação

Entram no primeiro escopo:

- e-mail;
- impressão e reimpressão;
- download autenticado pela Central de Emissões.

WhatsApp, SMS, portal público e integrações externas ficam fora. Uma porta permite canais futuros sem expor o bucket S3.

### Auditoria e retenção

A Auditoria de Distribuição registra:

- Emissão ou Evento Fiscal;
- destinatários efetivamente usados;
- origem do perfil SMTP, Filial ou Usuário, sem credenciais;
- template e versão;
- Artefatos Fiscais e hashes;
- solicitante e motivo de reenvio;
- horários, número da tentativa e resultado;
- identificador retornado pelo servidor;
- erro sanitizado.

Não registra senha, corpo completo, XML ou material privado. A retenção é de seis anos, alinhada aos Artefatos Fiscais.
