# Definir observabilidade, aceite e rollout paralelo

Type: grilling
Status: resolved
Blocked by: 08, 09

## Question

Quais métricas, alertas, Auditoria, painéis, runbooks, testes, critérios de aceite e controles permitem operar Laravel e Delphi em paralelo por Filial sem perder numeração, eventos ou documentos?

## Answer

### Unidade e modos do rollout

O rollout é controlado por Filial, ambiente, modelo e Série Fiscal. O Modo de Operação Fiscal possui:

- DELPHI: novas emissões nascem no legado;
- LARAVEL_CANARIO: somente origens ou usuários explicitamente liberados criam emissões no Laravel;
- LARAVEL: novas emissões da combinação nascem no Laravel.

A mudança vale somente para novas emissões. Emissão já iniciada permanece sob o controle do sistema que a iniciou, salvo Transferência Administrativa explícita. Somente Administrador com permissão fiscal específica altera o modo; toda alteração exige justificativa e registra usuário, instante, valor anterior e novo.

Não existem quantidade, duração ou taxa automáticas para promoção. O responsável definido pelo usuário executa os testes, avalia evidências e aprova ou reprova manualmente. A aprovação fica auditada.

### Ordem de implantação

O rollout segue:

1. homologação completa;
2. uma Filial em LARAVEL_CANARIO;
3. NF-e primeiro, por não bloquear o caixa;
4. NFC-e depois na mesma Filial;
5. expansão para outras Filiais somente após aprovação;
6. uma Série Fiscal por vez, mantendo as demais em DELPHI.

### Suspensão segura

Incidente crítico não muda automaticamente o modo para DELPHI. Ele cria Suspensão Fiscal na combinação afetada:

- bloqueia novas emissões Laravel;
- preserva emissões já iniciadas;
- mantém consultas e Reconciliação Fiscal;
- alerta imediatamente;
- deixa retorno para DELPHI ou reativação sob decisão exclusiva do Administrador fiscal.

São incidentes críticos: possível duplicidade, autorização incompatível, perda ou salto inexplicado de numeração, ambiguidade além do prazo configurado, contingência não transmitida, Evento Fiscal sem conclusão, divergência Laravel/Delphi/SEFAZ e Artefato Fiscal ausente ou com hash inválido.

### Central de Emissões e abertura proativa

A Central de Emissões é o painel operacional principal. Consolida todas as origens de Nota Fiscal de Saída: frente de caixa, contratos, emissão avulsa e consultas existentes.

O comportamento proativo do Delphi é preservado e ampliado. Ao entrar, usuário com permissão fiscal recebe aviso quando houver Pendência Fiscal Acionável; ao confirmar, abre a Central. São acionáveis rejeição corrigível, falha operacional, Reconciliação Fiscal, contingência aguardando transmissão, Evento Fiscal pendente e divergência. Processamento normal e breve não força abertura. Pendência não desaparece após trinta dias.

A Central permanece acessível pelos equivalentes de Estoque → Controle de Notas Eletrônicas e Estoque → Consulta de Notas de Saída.

### Painel e métricas

A Central permite recorte por Filial, origem, modelo, Série Fiscal, ambiente e sistema e mostra:

- Pendências Fiscais Acionáveis e idade da mais antiga;
- emissões por Situação Fiscal da Emissão e Situação do Processamento Fiscal;
- volume, latência e resultados de autorização;
- Reconciliações Fiscais abertas;
- contingências ativas e aguardando transmissão;
- Eventos Fiscais pendentes;
- divergências Laravel, Delphi e SEFAZ;
- atraso de outbox, filas, leases, workers e sweepers;
- Artefatos Fiscais aguardando S3 ou com falha de integridade;
- validade da Versão de Certificado Fiscal, seus Vínculos de Certificado Fiscal e desvio de relógio. Uma versão compartilhada deve exibir o impacto em todas as Filiais associadas.

Pulse agrega tendências técnicas. Sentry recebe exceções e incidentes técnicos quando configurado. Telescope serve somente para diagnóstico fora de produção.

### Alertas

Incidente crítico cria alerta persistente na Central, envia e-mail aos administradores fiscais e produz evento técnico no Sentry quando houver falha ou exceção. Alertas usam identificadores, estados, códigos, latências e hashes; nunca XML completo, senha ou material privado do certificado.

### Matriz de testes e aceite

Os testes são executados e aprovados pelo usuário. A matriz mínima por UF, modelo e ambiente cobre:

- autorização normal;
- rejeição corrigível e nova Fotografia Fiscal;
- timeout após envio e Reconciliação Fiscal;
- duplicidade com protocolo compatível e incompatível;
- cancelamento, CC-e e inutilização;
- certificado vencido, inválido e rotacionado, tanto exclusivo quanto compartilhado entre Filiais;
- vínculo compartilhado elegível, vínculo entre Contribuintes Fiscais distintos recusado e credenciamento ausente por UF;
- falhas de Redis, worker, PostgreSQL, S3 e recuperação posterior;
- concorrência Laravel e Delphi na Série Fiscal;
- reimpressão e recuperação de Artefatos Fiscais;
- contingências NF-e habilitadas na UF;
- para NFC-e, resposta rápida, offline, transmissão posterior e cancelamento por substituição.

O aceite registra aprovado ou reprovado, evidências anexadas, data e responsável, sem impor volume ou duração.

### Runbooks

Antes da ativação existem runbooks para:

1. suspender e reativar emissões Laravel;
2. reconciliar transmissão ou Evento Fiscal ambíguo;
3. tratar divergência de numeração entre Laravel e Delphi;
4. operar e encerrar contingência;
5. recuperar certificado, fila, worker, S3 ou relógio;
6. voltar novas emissões para DELPHI preservando as já iniciadas.

Cada runbook lista sinais, permissões, passos seguros, ações proibidas, evidências esperadas e condição de encerramento.

### Auditoria

A Auditoria imutável registra:

- mudanças do Modo de Operação Fiscal;
- aprovação dos testes e evidências;
- Suspensão Fiscal, reativação e retorno ao Delphi;
- abertura e encerramento de contingência;
- reconciliação ou retransmissão manual;
- cancelamento, CC-e e inutilização;
- troca ou ativação de certificado e alteração de Vínculo de Certificado Fiscal;
- Transferência Administrativa;
- impressão, reimpressão, download e distribuição de Artefato Fiscal;
- reconhecimento e encerramento de incidente crítico.

Cada registro guarda usuário, Contribuinte Fiscal, Filial, vínculo, emissão ou evento, ação, justificativa, instante, IP ou sessão, correlação e valores anterior e novo, sem segredos ou XML completo. A retenção mínima é cinco anos, ou prazo legal maior configurado.
