# Definir o espelhamento e a transferência de emissões do Delphi

Type: grilling
Status: resolved
Blocked by: 04, 05, 07

## Question

Como o Laravel descobre, importa, atualiza, armazena e reconcilia emissões e eventos originados no Delphi, e quais contratos e controles implementam a transferência administrativa sem pressupor qualquer alteração no sistema legado?

## Answer

### Descoberta incremental

O Delphi e seus registros não serão alterados. Um sincronizador Laravel somente leitura acompanha NF-e/NFC-e de saída, modelos 55 e 65, usando os campos `inserted_at` e `updated_at` mantidos por trigger no legado.

O cursor durável é composto por `(updated_at, dadosfiscais.numero)`, evitando perder linhas com o mesmo timestamp. O job lê pequenos lotes ordenados, usa curta janela de sobreposição e processa tudo de forma idempotente. Uma varredura diária paginada serve apenas como rede de segurança para inconsistência de trigger.

A meta operacional é disponibilizar o espelho em até 15 segundos: polling incremental a cada cinco segundos, sem bloquear o frente de caixa. O registro aparece no Laravel depois da persistência local, sem esperar S3. A tela mostra a última sincronização e pendências de artefato; Transferência Administrativa força sincronização imediata.

Na entrada em operação, a carga inicial fica limitada a:

- todas as notas pendentes ou inconsistentes;
- autorizadas ainda dentro de janelas operacionais de eventos;
- notas emitidas nos últimos 30 dias.

Depois, o cursor assume. Não há backfill histórico em massa.

### Classificação e identidade

Se o `dadosfiscais.numero` já estiver ligado a uma Emissão criada pelo Laravel, a alteração é reconciliada nessa mesma emissão. Sem vínculo, cria-se um Espelho Fiscal com `Sistema de Origem = DELPHI`. O sincronizador nunca cria `dadosfiscais`/`notas`, aloca número ou modifica `seriesfiliais`.

A identidade principal é `chv_nfe` quando presente; antes dela vale Filial, ambiente, modelo, Série Fiscal e número. Colisão ou chave divergente bloqueia o espelho e gera alerta, sem sobrescrita.

Reprocessar cursor ou conteúdo igual atualiza o mesmo espelho. Se a origem desaparecer, o Laravel não apaga nada: marca `ORIGEM_LEGADA_AUSENTE`, bloqueia ações e solicita análise.

### Estado importado

O sincronizador não confia isoladamente em `dadosfiscais.situacao`, pois o Delphi pode usar `C` durante tentativa de evento. O espelho considera:

- `numprotocolonfe` para autorização;
- `numcancelamentonfe` para cancelamento;
- `numinutilizacaonfe` para inutilização;
- ausência de protocolo conclusivo para pendência;
- combinações contraditórias como inconsistência.

Inconsistência gera alerta e reconciliação, sem correção automática dos dados do Delphi.

### Proveniência e Artefatos

O Laravel não atribui ao Delphi uma Fotografia Fiscal nativa que nunca existiu:

- com `nfeProc`, extrai uma fotografia de consulta `IMPORTADA_DO_XML`;
- sem XML, reconstrói dos dados atuais uma `RECONSTRUIDA_DO_LEGADO`;
- ambas registram origem, cursor, fingerprint, campos ausentes e limitações.

Somente evidências existentes são importadas: `dadosfiscais.xmlnfe` como `nfeProc`, `xmlnfe_canc_inut` como evento processado e outros XMLs apenas quando houver fonte confiável. SHA-256 impede objetos repetidos. O Laravel não inventa Tentativas, pedidos ou respostas ausentes. DANFE do espelho é gerado sob demanda a partir do XML, fora do sincronizador.

### Operação passiva e reconciliação

Por padrão, o Espelho Fiscal é somente leitura: sincroniza, cataloga e envia Artefatos ao S3, mas não transmite nem cria Eventos Fiscais. Consulta à SEFAZ ocorre somente quando:

- campos, chave, XML e protocolos forem contraditórios;
- o Delphi alterar emissão originalmente criada pelo Laravel;
- houver duplicidade;
- um Administrador solicitar;
- iniciar Transferência Administrativa.

### Transferência Administrativa

A transferência preserva `Sistema de Origem = DELPHI` e muda apenas o controle operacional de `ESPELHO` para `ATIVO_NO_LARAVEL`. É admitida para pendente/rejeitada, permitindo transmissão, e autorizada, permitindo consulta/eventos. Cancelada e inutilizada são terminais e não são transferidas.

Antes de confirmar, exige:

- Administrador reautenticado e motivo;
- sincronização imediata e ausência de cursor pendente para a linha;
- Certificado A1 ativo da Filial;
- consulta recente à SEFAZ;
- importação e validação de XMLs/protocolos disponíveis;
- para pendente, nova Fotografia Fiscal selada dos dados legados atuais;
- confirmação manual de que ninguém está operando a nota no Delphi.

Falha mantém o espelho somente leitura. A interface alerta que o Delphi continua tecnicamente capaz de agir, pois não haverá mudança no legado.

Se `updated_at` mudar por ação Delphi depois da transferência enquanto houver comando Laravel pendente/em execução, o Laravel suspende comandos, entra em `AGUARDANDO_RECONCILIACAO`, importa as evidências, consulta a SEFAZ e converge sem retentativa cega. Quando comprovado, registra `Último Executor Fiscal = DELPHI`.
