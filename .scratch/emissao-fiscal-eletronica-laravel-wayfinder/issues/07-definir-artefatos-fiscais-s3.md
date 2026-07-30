# Definir artefatos fiscais, S3 e compatibilidade legada

Type: grilling
Status: resolved
Blocked by: 01, 02, 04

## Question

Quais XMLs, protocolos, DANFEs, hashes e metadados preservar; como nomear, versionar, criptografar e recuperar no S3; e quando manter a cópia em `dadosfiscais.xmlnfe` sem duas fontes canônicas?

## Answer

### Custódia canônica e catálogo

O S3 é a custódia canônica dos Artefatos Fiscais. Cada artefato possui registro imutável no PostgreSQL com Emissão ou Evento Fiscal, tipo, ambiente, Filial, modelo, chave de acesso quando existente, Série Fiscal, número, revisão/tentativa, MIME type, tamanho, SHA-256 dos bytes originais, chave e versão do objeto, schema, Versão de Certificado Fiscal/fingerprint quando aplicável, versão do renderizador e timestamps.

Devem ser preservados separadamente:

- XML pré-assinado de cada revisão, apenas para diagnóstico;
- XML assinado transmitido;
- pedidos e respostas brutos da SEFAZ;
- XML processado autorizado `nfeProc`;
- XMLs e protocolos processados de cancelamento, CC-e e inutilização;
- XMLs e respostas de contingência;
- DANFE e DANFE NFC-e efetivamente gerados, impressos, baixados ou distribuídos.

O XML pré-assinado nunca pode ser transmitido ou entregue ao destinatário. Objetos conservam exatamente os bytes produzidos ou recebidos, sem reformatar, normalizar encoding ou compactar. ZIPs são pacotes transitórios gerados sob demanda e não substituem os objetos individuais.

### Identidade e imutabilidade no S3

A chave técnica segue:

`fiscal/{ambiente}/{filial}/{modelo}/{AAAA}/{MM}/{emissao_uuid}/{artefato_uuid}.{ext}`

Chave de acesso, série, número e tipo permanecem nos metadados; nomes amigáveis são montados no download. Nenhum objeto é sobrescrito: nova resposta, revisão ou renderização recebe novo `artefato_uuid`.

O bucket usa bloqueio de acesso público, TLS, SSE-S3/AES-256, versionamento e Object Lock em modo Governance. A aplicação não pode ignorar a retenção; essa capacidade fica restrita a uma identidade de infraestrutura de emergência e é auditada.

Produção retém os artefatos por seis anos contados da autorização ou do evento, admitindo configuração jurídica maior. Homologação retém por 180 dias, salvo evidências marcadas para teste, auditoria ou incidente. Não haverá replicação para segundo bucket nesta etapa.

### Persistência antes do upload

Resultado fiscal confirmado não depende da disponibilidade do S3. Na transação que registra autorização ou evento, o Laravel:

1. grava o Artefato Fiscal como `AGUARDANDO_UPLOAD`;
2. conserva temporariamente os bytes no PostgreSQL;
3. registra SHA-256, tamanho e outbox;
4. persiste o resultado/protocolo fiscal.

O worker faz upload idempotente, confirma objeto, versão, tamanho e hash, marca `DISPONIVEL` e então remove o conteúdo temporário. Falha mantém bytes e outbox no banco, com retentativa e alerta; nunca apaga protocolo nem desfaz autorização.

Para NFC-e, S3 fica totalmente fora do caminho crítico do frente de caixa. O caixa espera apenas a persistência transacional local, a Projeção Legada Fiscal e o DANFE NFC-e necessário à entrega. Upload, verificação e limpeza são assíncronos; indisponibilidade do S3 cria pendência técnica, mas não atrasa nem impede a conclusão da venda.

### Projeções e convivência

O S3 nunca é sobrescrito a partir do legado. Enquanto Delphi ou integrações atuais dependerem do banco:

- o `nfeProc` autorizado completo permanece em `dadosfiscais.xmlnfe`, sem limpeza automática;
- cancelamento autorizado grava XML processado em `dadosfiscais.xmlnfe_canc_inut` e protocolo em `numcancelamentonfe`;
- inutilização autorizada usa o mesmo campo de XML e `numinutilizacaonfe`;
- rejeições, falhas, respostas ambíguas e Tentativas Fiscais não são projetadas nesses campos;
- CC-e permanece apenas como Evento/Artefato Fiscal na nova estrutura.

“Temporária” descreve a duração da migração, não um TTL. Remover `dadosfiscais.xmlnfe` exige cutover explícito e inventário prévio dos consumidores. O Laravel não escreve nos diretórios compartilhados do Delphi; o legado continua regenerando o que consegue a partir do banco. Aceita-se que CC-e criada no Laravel não apareça no Delphi durante a convivência.

### DANFE

DANFE é representação derivada, não prova fiscal principal. Cada PDF distribuído registra o hash do XML de origem, versão do renderizador, layout e instante. Reimpressão byte a byte idêntica pode reutilizar o PDF; mudança de renderizador, contingência ou situação exibida cria outro Artefato Fiscal. Cancelamento não altera o PDF histórico; uma representação posterior pode indicar a situação cancelada.

### Acesso, integridade e recuperação

Usuários não acessam o bucket diretamente. O Laravel autoriza por Filial/nota e audita download; XML pequeno pode ser transmitido pela aplicação e arquivo maior pode usar URL pré-assinada por cinco minutos, nunca pública ou permanente.

Hash e tamanho são validados após todo upload. Uma reconciliação diária verifica artefatos recentes, pendentes e falhos; inventário mensal confronta banco, objeto, versão, tamanho e SHA-256. Divergência coloca o artefato em `QUARENTENA`, bloqueia distribuição e alerta a operação. Versionamento e Object Lock permitem recuperar exclusão/sobrescrita acidental; conteúdo temporário do banco é usado quando ainda disponível e sempre validado pelo hash.

### Acervo anterior

Não haverá migração histórica em massa na primeira etapa. O S3 recebe novas emissões/eventos do Laravel e documentos do Delphi alcançados pelo espelhamento da convivência. Backfill histórico, réplica regional e retirada das Projeções Legadas ficam para iniciativas futuras explícitas.
