# Especificação da Plataforma de Emissão Fiscal Eletrônica no Laravel

Status: pronta para decomposição em tickets de implementação  
Baseline regulatório: 25 de julho de 2026  
Escopo: NF-e modelo 55 e NFC-e modelo 65 de saída

## 1. Objetivo

Implementar no Laravel o ciclo fiscal completo de NF-e e NFC-e de saída sem UniNFe ou UniDANFE: formar a Fotografia Fiscal, gerar e assinar XML, comunicar diretamente com a SEFAZ, reconciliar ambiguidades, operar contingências e eventos, gerar DANFE, custodiar Artefatos Fiscais no S3, distribuí-los e conviver com o Delphi.

Esta especificação define o comportamento a implementar. As decisões detalhadas e suas justificativas permanecem nos tickets do mapa, relacionados na matriz de rastreabilidade.

## 2. Escopo

### 2.1 Incluído

- NF-e e NFC-e de saída originadas por frente de caixa, contratos e Nota Fiscal de Saída avulsa;
- ambientes de homologação e produção;
- Certificado A1 custodiado por Contribuinte Fiscal, com Vínculos de Certificado Fiscal explícitos por Estabelecimento Fiscal;
- observação contínua de leiautes, schemas, regras, endpoints, tabelas, QR Code, contingências e prazos oficiais;
- autorização, consulta, rejeição corrigível e Reconciliação Fiscal;
- cancelamento, CC-e e inutilização;
- contingências permitidas por UF e modelo;
- DANFE e DANFE NFC-e;
- custódia S3, Projeção Legada Fiscal e espelhamento Delphi;
- distribuição por e-mail, impressão e download autenticado;
- Central de Emissões, alertas, Auditoria, testes e rollout.

### 2.2 Fora do escopo

- Nota Fiscal de Entrada e notaspag.xmlnfe;
- manifestação do destinatário e distribuição de DF-e recebida;
- Certificados A3 e agentes locais de assinatura;
- NFS-e;
- migração histórica em massa;
- réplica regional do bucket;
- retirada das Projeções Legadas Fiscais na primeira implantação;
- WhatsApp, SMS, portal público e outros canais de distribuição.

## 3. Restrições regulatórias e stack

REQ-REG-001 — O sistema deve usar leiaute 4.00 e MOC 7.0 acrescidos cumulativamente das Notas Técnicas, schemas e tabelas oficiais vigentes.

REQ-REG-002 — Schemas, regras, endpoints, autorizadores, credenciamento, CSC, QR Code, prazos, eventos e contingências devem ser versionados por UF, modelo, ambiente e vigência; não podem ser constantes globais.

REQ-REG-003 — NF-e e NFC-e devem possuir políticas distintas. NF-e admite somente SVC, EPEC e FS-DA habilitados; NFC-e admite offline e EPEC apenas quando autorizado pela UF.

REQ-STACK-001 — A implementação candidata deve usar nfephp-org/sped-nfe, sped-common e sped-da atrás de portas próprias e de um NfePhpFiscalGateway.

REQ-STACK-002 — Nenhum contrato de domínio pode expor tipos da NFePHP. Versão, extensões PHP, schemas e DANFE devem ser validados por matriz oficial e homologação por UF antes de produção.

## 4. Modelo de domínio e dados

### 4.1 Agregados e registros

REQ-DOM-001 — Emissão Fiscal Eletrônica representa um documento por toda a vida fiscal. Sua unicidade deve incluir identidade interna e Filial, ambiente, modelo, Série Fiscal e número.

REQ-DOM-002 — Retransmissão, consulta, reconciliação, contingência ou evento não criam outra Emissão.

REQ-DOM-003 — A Emissão possui revisões imutáveis de Fotografia Fiscal, Tentativas Fiscais, Eventos Fiscais, Episódios de Contingência, Comandos Fiscais, Artefatos Fiscais e Distribuições Fiscais.

REQ-DOM-004 — Cancelamento, CC-e e inutilização são Eventos Fiscais independentes com identidade, estado, Tentativas, XML e protocolo próprios.

REQ-DOM-005 — cStat e respostas brutas são evidências, não estados do domínio.

REQ-DOM-006 — A Emissão Fiscal mantém como emitente o Estabelecimento Fiscal/Filial que consta na nota. Contribuinte Fiscal agrupa estabelecimentos para fins de vínculo cadastral e custódia, mas não substitui a identidade, o credenciamento, a numeração ou o rollout da Filial.

REQ-DOM-007 — Igualdade da raiz de CNPJ não é, isoladamente, autorização operacional. Toda relação entre estabelecimento emitente e certificado deve ser comprovada pelo Contribuinte Fiscal cadastrado, por Vínculo de Certificado Fiscal vigente e pela elegibilidade oficial do contexto.

### 4.2 Estados

REQ-STATE-001 — A Situação Fiscal deve ser uma entre PENDENTE, REJEITADA_CORRIGIVEL, AUTORIZADA, USO_DENEGADO quando oficialmente aplicável, CANCELADA e INUTILIZADA.

REQ-STATE-002 — A Situação do Processamento deve ser uma entre AGUARDANDO, PROCESSANDO, AGUARDANDO_CORRECAO, OPERANDO_EM_CONTINGENCIA, AGUARDANDO_TRANSMISSAO_DA_CONTINGENCIA, AGUARDANDO_RECONCILIACAO, CONCLUIDO e FALHA_OPERACIONAL.

REQ-STATE-003 — Estado fiscal e estado de processamento nunca podem ser fundidos.

REQ-STATE-004 — Eventos usam SOLICITADO, PROCESSANDO, AGUARDANDO_RECONCILIACAO, AUTORIZADO, REJEITADO e FALHA_OPERACIONAL.

REQ-STATE-005 — Somente cancelamento ou inutilização com protocolo confirmado alteram a projeção legada para C. CC-e autorizada mantém a Emissão AUTORIZADA.

### 4.3 Fotografia Fiscal

REQ-SNAP-001 — A Fotografia Fiscal deve ser JSON autocontido, versionado, serializado canonicamente, hashado com SHA-256 e imutável.

REQ-SNAP-002 — Ela deve conter todos os valores já resolvidos de identificação, participantes, itens, tributos, totais, transporte, cobrança, pagamentos, referências, configurações e versões necessárias para XML e DANFE.

REQ-SNAP-003 — Senha do A1 e CSC não entram na fotografia. Somente identificadores de configuração e resultados derivados são permitidos.

REQ-SNAP-004 — Todos os cálculos fiscais e rateios ocorrem antes da selagem. Depois dela, o gateway apenas serializa, calcula elementos técnicos, valida XSD e assina.

REQ-SNAP-005 — Correção cria nova revisão ligada à anterior. Retentativa técnica reutiliza revisão e bytes assinados. Autorização bloqueia alteração de conteúdo.

REQ-SNAP-006 — Contingência que altera chave, tpEmis ou horário cria revisão derivada, preservando a revisão normal.

## 5. Numeração e criação

REQ-NUM-001 — Laravel e Delphi devem usar a mesma linha de seriesfiliais por Filial e Série Fiscal. Não haverá contador paralelo, cache, sequência própria nem reserva de blocos.

REQ-NUM-002 — Antes da numeração, o Laravel valida tudo que não depende do número e prepara a candidata à Fotografia Fiscal.

REQ-NUM-003 — Em transação curta, o Laravel deve verificar a Chave de Idempotência, bloquear seriesfiliais com FOR UPDATE, reler o contador, validar ocupação, gravar dadosfiscais, notas, Emissão, revisão selada e outbox, avançar numeroinicial e confirmar.

REQ-NUM-004 — Rollback integral desfaz criação e avanço. Após commit, número alocado nunca é reutilizado.

REQ-NUM-005 — A Emissão registra valor anterior e novo do contador, usuário, origem e instante como evidência da Alocação de Número Fiscal.

REQ-NUM-006 — Geração, assinatura, SEFAZ, S3 e DANFE somente ocorrem após o commit da numeração.

## 6. Certificado A1

REQ-CERT-001 — Versões de Certificado Fiscal são custodiadas por Contribuinte Fiscal, com histórico, validade, fingerprint, titular e estado de ativação, e podem ser reutilizadas por várias Filiais por meio de vínculos explícitos.

REQ-CERT-002 — PFX e senha devem permanecer cifrados no PostgreSQL com chaves externas, separadas e rotacionáveis. Logs, filas e Artefatos não podem conter material privado.

REQ-CERT-003 — Upload deve validar PKCS#12, cadeia, titular, CNPJ, validade, uso e correspondência da senha; o CNPJ titular deve corresponder a um estabelecimento do mesmo Contribuinte Fiscal e não precisa ser exatamente o CNPJ da Filial emitente quando a regra oficial permitir.

REQ-CERT-004 — Workers devem descriptografar somente em memória, pelo menor tempo possível, e limpar buffers quando praticável.

REQ-CERT-005 — Deve haver alerta de expiração, rotação sem interrupção, teste de recuperação e Auditoria de upload, validação, ativação, uso e expurgo; uma versão compartilhada alerta todas as Filiais afetadas.

REQ-CERT-006 — Cada Vínculo de Certificado Fiscal deve registrar Contribuinte Fiscal, Filial, versão, vigência, UF, ambiente, modelo, operação/capacidade, prioridade e evidência de credenciamento/elegibilidade. Vínculo não é inferido apenas da raiz de CNPJ.

REQ-CERT-007 — A seleção da credencial deve ser determinística por Filial, UF, ambiente, modelo e operação. Se não houver vínculo elegível, a assinatura/transmissão é bloqueada com Pendência Fiscal Acionável; não há fallback implícito para outra Filial do mesmo grupo.

REQ-CERT-008 — Certificado para assinatura XML e certificado para autenticação da transmissão são capacidades distintas. Podem usar a mesma Versão de Certificado Fiscal ou vínculos/credenciais diferentes quando o serviço, a UF ou a política oficial exigir.

REQ-CERT-009 — Cada Tentativa Fiscal deve persistir a versão e o vínculo efetivamente selecionados, o estabelecimento titular do certificado, o contexto de UF/ambiente/modelo e o motivo da seleção. Rotação posterior não reassina XML já persistido.

## 7. Comandos, filas e idempotência

REQ-ORCH-001 — PostgreSQL é a fonte durável de Comandos, Tentativas, estados, leases e outbox. Redis é apenas transporte.

REQ-ORCH-002 — Filas mínimas: fiscal-nfce-prioritaria, fiscal-nfe, fiscal-eventos, fiscal-reconciliacao, fiscal-artefatos e fiscal-espelhamento-delphi. NFC-e possui capacidade reservada.

REQ-ORCH-003 — Há no máximo um Comando Fiscal mutável ativo por Emissão. Repetir a mesma Chave de Idempotência retorna o comando existente.

REQ-ORCH-004 — Worker deve adquirir lease sob FOR UPDATE, criar Tentativa, liberar a transação antes da rede e aplicar resultado somente se token e estado ainda forem válidos.

REQ-ORCH-005 — Antes da rede, XML assinado, hash, versão e vínculo do certificado e checkpoint PRONTO_PARA_ENVIO devem estar persistidos.

REQ-ORCH-006 — Falha comprovada antes do primeiro byte pode retentar com backoff. Falha depois de iniciado o envio entra em AGUARDANDO_RECONCILIACAO.

REQ-ORCH-007 — Não existe retentativa cega de autorização ou Evento Fiscal.

REQ-ORCH-008 — Limites, backoff e circuit breaker são isolados por UF, autorizador, ambiente e serviço. Circuito aberto permite consultas e reconciliação.

REQ-ORCH-009 — Sweeper recupera outbox, lease e comando parados. Desvio excessivo de relógio bloqueia novas assinaturas e transmissões, mas não consultas.

## 8. Reconciliação

REQ-REC-001 — Reconciliação de autorização consulta a chave e compara chave, emitente, modelo, série, número, digest e assinatura antes de importar protocolo.

REQ-REC-002 — Resposta de duplicidade é indício para consulta, não sucesso.

REQ-REC-003 — Não localizada deve ser repetida durante janela configurável. Retransmissão dos mesmos bytes só é liberada após evidência conclusiva de inexistência.

REQ-REC-004 — Autorização incompatível é incidente crítico e bloqueia ações mutáveis.

REQ-REC-005 — Eventos ambíguos preservam identidade, sequência e XML. Novo evento equivalente ou próxima CC-e não nasce até resolução.

## 9. Operação de NF-e, NFC-e e contingência

REQ-OPS-001 — A Central de Emissões é a superfície principal, orientada a filas e Pendências Fiscais Acionáveis.

REQ-OPS-002 — O Operador acompanha, corrige rejeição elegível, imprime, baixa e distribui. O Autorizador também inicia contingência manual, reconcilia, retransmite quando liberado, cancela, emite CC-e e inutiliza.

REQ-OPS-003 — NF-e é assíncrona: a interface retorna após registrar a intenção e acompanha o mesmo comando sem exigir página aberta.

REQ-OPS-004 — NFC-e usa fila prioritária e espera janela curta. Expirada a janela, acompanha o mesmo comando sem retransmitir.

REQ-OPS-005 — NFC-e offline, quando permitida, registra Episódio de Contingência, assina e entrega DANFE NFC-e, libera a venda e transmite posteriormente.

REQ-OPS-006 — Inutilização exige número não autorizado, Reconciliação prévia, justificativa, autorização reforçada e confirmação do intervalo.

## 10. Artefatos, S3 e DANFE

REQ-ART-001 — S3 privado, versionado e com Object Lock Governance é a custódia canônica. Cada Artefato possui catálogo PostgreSQL, SHA-256, tamanho, MIME, versão do objeto, origem e metadados fiscais.

REQ-ART-002 — Devem ser preservados separadamente XML pré-assinado, XML assinado, pedidos/respostas, nfeProc, XMLs/protocolos de eventos, contingência e DANFEs efetivamente usados.

REQ-ART-003 — Objetos nunca são sobrescritos nem normalizados. A chave segue fiscal/ambiente/filial/modelo/AAAA/MM/emissao_uuid/artefato_uuid.ext.

REQ-ART-004 — Resultado fiscal não depende do S3. Bytes ficam temporariamente no PostgreSQL até upload, validação de hash e confirmação do objeto.

REQ-ART-005 — Produção retém Artefatos e Fotografias por seis anos ou prazo jurídico maior; homologação por 180 dias salvo evidência preservada.

REQ-ART-006 — DANFE é derivado do XML arquivado. Reimpressão nunca consulta cadastros atuais. Versão do renderizador e hash do XML devem ser registrados.

REQ-ART-007 — Acesso é autorizado pelo Laravel. URL pré-assinada dura cinco minutos. Divergência de hash coloca o Artefato em QUARENTENA e bloqueia distribuição.

## 11. Compatibilidade e espelhamento Delphi

REQ-LEG-001 — Projeção Legada mantém nfeProc em dadosfiscais.xmlnfe, eventos em xmlnfe_canc_inut e protocolos nos campos existentes. Processamento e ambiguidade não criam códigos legados novos.

REQ-LEG-002 — Laravel não escreve nos diretórios compartilhados do Delphi.

REQ-MIR-001 — Sincronizador somente leitura usa cursor updated_at mais dadosfiscais.numero, polling de cinco segundos, sobreposição curta e varredura diária.

REQ-MIR-002 — Carga inicial inclui pendentes/inconsistentes, autorizadas dentro de janelas de eventos e últimos trinta dias; não há backfill massivo.

REQ-MIR-003 — Registro Delphi sem vínculo cria Espelho Fiscal somente leitura. Chave divergente ou colisão bloqueia e alerta.

REQ-MIR-004 — Estado importado usa protocolos e evidências, não apenas dadosfiscais.situacao. O sincronizador nunca corrige o Delphi.

REQ-MIR-005 — Transferência Administrativa exige Administrador reautenticado, motivo, sincronização, Vínculo de Certificado Fiscal ativo e elegível para a Filial/UF/ambiente/modelo, consulta SEFAZ, evidências validadas, fotografia para pendente e confirmação de inatividade no Delphi.

REQ-MIR-006 — Mudança Delphi após transferência suspende comandos Laravel e força Reconciliação.

## 12. Distribuição

REQ-DIST-001 — Perfil SMTP completo da Filial tem precedência; perfil completo do Usuário é fallback transitório. Campos nunca são misturados.

REQ-DIST-002 — Destinatários reproduzem o Delphi: dadosfiscais.email, Contatos com enviar_nfe e Transportadora aplicável. Devem ser validados, deduplicados e preservados por distribuição.

REQ-DIST-003 — Autorização envia nfeProc e DANFE. Cancelamento e CC-e enviam seus Artefatos. Inutilização não é distribuída.

REQ-DIST-004 — Distribuição é assíncrona, independente do resultado fiscal e fora do caminho crítico da NFC-e.

REQ-DIST-005 — Falhas temporárias retentam após 1, 5, 15 e 60 minutos. Falhas permanentes ou ausência de SMTP criam Pendência de Distribuição.

REQ-DIST-006 — Distribuição Fiscal e Tentativa de Distribuição são idempotentes e imutáveis. Reenvio humano cria nova Distribuição.

REQ-DIST-007 — Templates versionados não são editados livremente por envio e preservam o rodapé configurado.

REQ-DIST-008 — Canais iniciais são e-mail, impressão/reimpressão e download autenticado.

## 13. Observabilidade, segurança e Auditoria

REQ-OBS-001 — Usuário com permissão fiscal recebe aviso no login quando houver Pendência Fiscal Acionável e pode abrir a Central. Pendências não expiram por idade.

REQ-OBS-002 — A Central mostra estados, idade, latência, reconciliações, contingências, eventos, divergências, filas, outbox, leases, Artefatos, certificados, vínculos compartilhados e relógio por Contribuinte Fiscal/Filial/modelo/Série/origem.

REQ-OBS-003 — Pulse agrega métricas, Sentry recebe exceções e Telescope não roda em produção.

REQ-OBS-004 — Incidente crítico cria alerta persistente, e-mail aos administradores e Suspensão Fiscal da combinação afetada, sem failover automático para Delphi.

REQ-AUD-001 — Auditoria imutável cobre modos, testes, suspensão, contingência, reconciliação manual, eventos, certificado, transferência, acesso a Artefatos, distribuição e incidentes.

REQ-AUD-002 — Auditoria guarda usuário, Contribuinte Fiscal, Filial, vínculo, alvo, ação, justificativa, instante, sessão/IP, correlação e antes/depois. Não guarda XML completo, senha, PFX ou segredos.

REQ-NORM-001 — O Laravel deve manter um Catálogo Normativo Fiscal versionado para fontes nacionais e estaduais, relacionando cada artefato a autoridade, UF/autorizador, modelo, ambiente, publicação, vigência e evidência oficial.

REQ-NORM-002 — O Observador Regulatório deve consultar por HTTP o Portal Nacional, CONFAZ e portais SEFAZ/autorizadores; RSS/Atom não pode ser dependência obrigatória. A periodicidade padrão é 15 minutos para disponibilidade/contingência/manutenção/TLS crítico, horária para serviços e portais usados, diária para documentos/tabelas e semanal para varredura estadual ampla.

REQ-NORM-003 — Cada página e artefato observado deve preservar bytes originais, URL, cabeçalhos disponíveis, MIME, tamanho, data de coleta, SHA-256 bruto e hash normalizado. ZIP, XSD, PDF, tabela, WSDL e cadeia TLS devem manter metadados e inventário interno quando aplicável.

REQ-NORM-004 — O sistema deve detectar e resumir diffs de publicação, versão, vigência, links, XSDs, regras, tabelas, endpoints, WSDLs, QR Code/CSC, TLS, contingência e prazos, sem substituir a evidência original.

REQ-NORM-005 — Cada mudança deve registrar escopo por UF/autorizador, modelo, ambiente e capacidade, datas de publicação/homologação/produção/vigência/efeitos, classificação de impacto, revisão humana requerida e evidência vinculada.

REQ-NORM-006 — A governança normativa deve usar `OBSERVADA`, `ANALISADA`, `HOMOLOGACAO`, `APROVADA`, `ATIVA` e `RETIRADA`. Produção só consome configuração `APROVADA` e nenhuma coleta ou diff ativa produção automaticamente.

REQ-NORM-007 — Mudanças em MOC, NT, schema, tabela fiscal, endpoint, WSDL, QR Code/CSC, cadeia TLS, contingência, eventos, regras de rejeição ou prazos exigem revisão humana, homologação por UF/modelo/ambiente, aprovação auditada, rollout e rollback.

REQ-NORM-008 — Sinais críticos abrem Pendência Fiscal Acionável e podem suspender promoção, mas não alteram sozinhos `tpEmis`, endpoint ou Modo de Operação Fiscal. Disponibilidade e sondagem TLS são evidências operacionais, não autorização normativa.

## 14. Rollout

REQ-ROLL-001 — Modo de Operação Fiscal é configurado por Filial, ambiente, modelo e Série como DELPHI, LARAVEL_CANARIO ou LARAVEL.

REQ-ROLL-002 — Mudança vale somente para novas emissões, exige Administrador fiscal, justificativa e Auditoria.

REQ-ROLL-003 — Promoção é manual após testes executados e aprovados pelo usuário; não há gate automático de volume ou duração.

REQ-ROLL-004 — Ordem: homologação, uma Filial canário, NF-e, NFC-e, demais Filiais, uma Série por vez.

## 15. Matriz mínima de aceite

Cada cenário deve registrar aprovado/reprovado, evidência, data e responsável por UF, modelo e ambiente.

- autorização normal e projeção legada;
- rejeição corrigível com nova revisão;
- timeout após envio e Reconciliação;
- duplicidade compatível e incompatível;
- concorrência de número entre Laravel e Delphi;
- cancelamento, CC-e e inutilização;
- contingências NF-e habilitadas;
- NFC-e rápida, offline, transmissão posterior e cancelamento por substituição;
- certificado vencido, inválido e rotacionado, incluindo certificado compartilhado entre Filiais e certificado exclusivo;
- rejeição de vínculo entre contribuintes distintos, ausência de credenciamento por UF e seleção determinística entre certificado compartilhado e próprio;
- falhas e recuperação de Redis, worker, PostgreSQL, S3 e relógio;
- reimpressão, integridade e recuperação de Artefatos;
- espelhamento e Transferência Administrativa;
- distribuição, retentativas, destinatários e fallback SMTP;
- suspensão, reativação e retorno de novas emissões ao Delphi.

## 16. Runbooks obrigatórios

1. Suspender e reativar emissões Laravel.
2. Reconciliar autorização ou Evento Fiscal ambíguo.
3. Tratar divergência de numeração Laravel/Delphi.
4. Operar e encerrar contingência.
5. Recuperar certificado, fila, worker, S3 ou relógio.
6. Voltar novas emissões para DELPHI preservando as iniciadas.

Cada runbook deve declarar sinais, permissões, passos seguros, ações proibidas, evidências e condição de encerramento.

## 17. Sequência recomendada de implementação

1. Fundações regulatórias, configuração versionada e gateway NFePHP.
2. Schema do domínio, estados, comandos, outbox e Auditoria.
3. Certificado A1, vínculos por Contribuinte Fiscal e seleção por Filial.
4. Fotografia Fiscal, cálculo de fronteira e numeração.
5. Geração, assinatura, autorização e Reconciliação de NF-e.
6. Artefatos S3, Projeção Legada e DANFE.
7. Central de Emissões e operação de NF-e.
8. Eventos Fiscais e contingências NF-e.
9. NFC-e prioritária e contingência offline.
10. Espelhamento e Transferência Administrativa Delphi.
11. Distribuição Fiscal.
12. Observabilidade, runbooks, homologação e rollout.

Cada etapa deve ser uma fatia vertical verificável; a decomposição em tickets deve declarar dependências e critérios derivados dos IDs REQ correspondentes.

## 18. Rastreabilidade

- Fluxo legado e limites: [Inventariar o fluxo fiscal de saída no Delphi e no Laravel](issues/01-inventariar-fluxo-fiscal-legado.md)
- Regras oficiais: [Levantar os requisitos oficiais vigentes de NF-e e NFC-e](issues/02-pesquisar-requisitos-oficiais-nfe-nfce.md)
- Stack: [Avaliar a stack PHP para comunicação fiscal direta](issues/03-avaliar-stack-php-emissao-fiscal.md)
- Domínio e estados: [Definir o modelo da Emissão Fiscal Eletrônica e seus estados](issues/04-definir-modelo-emissao-estados.md)
- Numeração: [Definir numeração e convivência entre Delphi e Laravel](issues/05-definir-numeracao-convivencia.md)
- Certificado: [Definir a custódia e a operação dos Certificados A1](issues/06-definir-seguranca-certificados-a1.md)
- Associação de certificados: [Definir a associação de Certificados A1 a grupos de CNPJ e Filiais](issues/15-definir-associacao-certificado-grupo-cnpj.md)
- Artefatos: [Definir artefatos fiscais, S3 e compatibilidade legada](issues/07-definir-artefatos-fiscais-s3.md)
- Orquestração: [Definir a orquestração idempotente e a reconciliação com a SEFAZ](issues/08-definir-orquestracao-idempotente.md)
- Operação: [Definir a operação de NF-e, NFC-e e contingência](issues/09-definir-operacao-nfe-nfce.md)
- Rollout: [Definir observabilidade, aceite e rollout paralelo](issues/10-definir-observabilidade-aceite-rollout.md)
- Normas: [Definir o monitoramento de atualizações de leiaute e regras da SEFAZ](issues/16-definir-monitoramento-atualizacoes-layout-sefaz.md)
- Fotografia: [Definir a fotografia imutável do payload fiscal](issues/12-definir-fotografia-payload-fiscal.md)
- Distribuição: [Definir a distribuição do Documento Fiscal ao destinatário](issues/13-definir-distribuicao-destinatario.md)
- Espelhamento: [Definir o espelhamento e a transferência de emissões do Delphi](issues/14-definir-espelhamento-transferencia-delphi.md)
