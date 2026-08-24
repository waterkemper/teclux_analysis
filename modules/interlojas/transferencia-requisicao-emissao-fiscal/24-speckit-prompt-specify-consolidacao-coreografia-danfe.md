# Prompt /speckit.specify — consolidação da emissão fiscal da Transferência

## Instrução principal

Gere uma especificação incremental de implementação para o estado atual do Laravel, corrigindo as lacunas de coordenação entre a confirmação operacional da Transferência de Requisição para Exposição e a Emissão Fiscal Eletrônica.

Não implemente código, migrations, alterações no Delphi ou chamadas reais à SEFAZ nesta etapa. Entregue somente a especificação, contratos, plano, tarefas, testes, critérios de aceite, quickstart e matriz de rastreabilidade.

Preserve os prompts/specs anteriores deste diretório e use a especificação da Plataforma de Emissão Fiscal Eletrônica como autoridade para fotografia fiscal, numeração, certificado, gateway, SEFAZ, outbox, filas, reconciliação e Artefatos Fiscais. Esta é uma complementação da origem Transferência; não crie uma segunda plataforma fiscal.

## Escopo obrigatório

Inclua somente:

- Transferência de Requisição para Exposição;
- NF-e modelo 55 de saída;
- confirmação operacional por grupo de Filial Requisitante;
- movimentos de estoque já previstos no domínio operacional;
- preparação, numeração, transmissão, reconciliação e projeção fiscal idempotente;
- convivência entre Laravel e o fluxo legado Delphi;
- geração e custódia da DANFE padrão em PDF.

Mantenha fora do escopo:

- VendaTransferencia;
- DevolucaoTransferencia;
- NF-e de entrada automática;
- financeiro, contrato, crédito, duplicatas, notaspag e vencimentos novos;
- NFSe;
- etiquetas de mercadoria ou volume;
- DANFE simplificada;
- UniDANFE;
- impressão automática ou integração física com impressoras;
- novo gateway, contador, certificado, fila, agregado ou renderer fiscal paralelo.

## Autoridades e evidências

Classifique cada afirmação como CONFIRMADO, INFERIDO, NÃO LOCALIZADO, DIVERGENTE ou DECISÃO NOVA. Consulte, no mínimo:

- modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md;
- prompts 01 a 23 deste diretório;
- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/issues/19-definir-coreografia-estoque-emissao-e-projecao-legada.md;
- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/20-danfe-simplificada-e-etiquetas.md;
- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/issues/22-decidir-danfe-simplificada-transferencia.md;
- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/issues/23-decidir-etiquetas-transferencia.md;
- modules/interlojas/transferencia-requisicao-exposicao/pesquisa-sql-dominio-efeitos-delphi.md;
- modules/interlojas/transferencia-requisicao-exposicao/pesquisa-parametros-autorizacoes-menu.md;
- relatórios Delphi já versionados em .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/, especialmente os levantamentos de fluxo, fotografia, efeitos e documentos auxiliares;
- contratos e serviços da plataforma fiscal comum no Laravel.

O agente executor pode não ter acesso ao repositório ou aos fontes originais Delphi. Não exigir, procurar ou bloquear a especificação por arquivos como dmtransferenciarequisicaoexposicao.pas/.dfm. Os relatórios Delphi versionados e as pesquisas locais são a fonte disponível nesta etapa; quando eles não comprovarem um comportamento, classificar como NÃO LOCALIZADO e registrar a decisão ou pendência, sem inventar regra por analogia.

Não transforme uma lacuna do Delphi em comportamento obrigatório. Quando o código Laravel atual divergir das decisões registradas, gere tarefa de correção na especificação. Quando a evidência Delphi disponível for insuficiente, preserve a decisão explícita desta consolidação e registre a necessidade de validação futura no Delphi como risco, não como bloqueio do /speckit.specify.

## Decisões fechadas que a nova spec deve respeitar

### 1. Uma transação curta de preparação operacional e fiscal

Para cada grupo elegível:

1. reler e bloquear requisições, estoque, dependências fiscais e série;
2. validar elegibilidade, quantidades, lotes, saldos, FilialBase, Filial Requisitante, emitente, destinatário e fotografia fiscal;
3. consultar idempotência e detectar documento já criado pelo Laravel ou Delphi;
4. selar a fotografia fiscal imutável;
5. alocar dadofiscal e número usando FOR UPDATE na combinação aplicável de filial/estabelecimento, modelo, série e ambiente;
6. persistir dadosfiscais, notas, itens, volumes e o vínculo de pedidosfiliais.dadofiscal;
7. gravar uma única vez os movimentos operacionais SPT/SET e, quando a regra operacional já exigir, TPE/TFR;
8. vincular os movimentos ao documento fiscal por dadofiscal e, quando aplicável, número/série;
9. fechar a requisição operacionalmente e criar a outbox fiscal;
10. fazer commit;
11. transmitir de forma assíncrona pelo pipeline fiscal comum.

A comunicação de rede, assinatura, SEFAZ, geração de artefato e PDF não pode ocorrer enquanto a transação mantém os bloqueios de estoque e numeração.

### 2. Um único efeito de estoque

Os movimentos gravados na confirmação atômica são o único efeito de estoque desta Transferência. Após autorização não inserir uma segunda entrada, baixa ou movimento equivalente.

Não duplicar em PHP os efeitos que as funções/triggers legadas já produzem. A especificação deve exigir validação contra o snapshot de schema e as funções de saldo antes de definir SQL final.

### 3. Numeração pessimista e idempotente

- Bloquear a linha de série/contador com FOR UPDATE.
- Reler o contador dentro da transação.
- Garantir unicidade por filial/estabelecimento, modelo, série, ambiente e número.
- Se a preparação falhar antes do commit, desfazer a preparação e o avanço do contador.
- Depois do commit, nunca reutilizar o número.
- Retry da mesma origem reutiliza a Emissão e o número já alocado; não cria nova emissão automaticamente.

### 4. Estados separados

Separar explicitamente:

- estado operacional da Transferência/Requisição;
- situação fiscal da Emissão;
- processamento/transmissão fiscal;
- projeção fiscal de autorização.

O commit pode concluir operacionalmente a requisição enquanto a NF-e permanece preparada ou pendente_transmissao. Estados fiscais mínimos:

preparada, pendente_transmissao, transmitindo, autorizada, rejeitada, aguardando_reconciliacao e requer_inutilizacao_manual.

Rejeição ou indisponibilidade depois do commit não desfaz estoque nem reabre automaticamente a requisição. Permitir retransmissão idempotente da mesma NF-e; depois das tentativas previstas, deixar a inutilização para o módulo Delphi de notas fiscais avulsas.

### 5. Projeção após autorização

Somente uma conclusão fiscal AUTORIZADA pode aplicar a projeção idempotente da Transferência. Essa projeção:

- atualiza status, protocolo, XML, chave e Artefatos Fiscais;
- mantém vínculos legados e auditoria;
- pode registrar que a saída autorizada satisfaz a Transferência;
- não cria NF-e de entrada;
- não cria notaspag, duplicata, contrato, crédito ou fluxo financeiro;
- não grava um novo movimento de estoque.

### 6. Convivência Laravel/Delphi

Antes da numeração, procurar documento já vinculado à Transferência, à origem ou ao dadofiscal. Se existir, reconciliar o mesmo documento por origem, emitente, destinatário, modelo, série, número, chave e resumo da fotografia.

Para novas Transferências, Laravel é o emissor. Delphi pode consultar, imprimir o PDF disponível no sistema legado quando aplicável e executar inutilização manual posterior, mas não pode emitir novamente a mesma origem.

Igualdade de raiz de CNPJ nunca seleciona certificado, estabelecimento, emitente ou autorização sem vínculo fiscal explícito.

## DANFE e documentos auxiliares

### DANFE padrão em PDF

Especificar somente o DANFE padrão:

- derivado do nfeProc íntegro e autorizado;
- gerado pelo renderer comum da plataforma fiscal, via adapter baseado em nfephp-org/sped-da;
- nunca usar UniDANFE;
- arquivado como Artefato Fiscal com versão/hash ligado à NF-e;
- orientação retrato como preferência visual compatível com formatodanfe = 1 do Delphi;
- sem alterar tpImp ou qualquer campo fiscal por causa da orientação;
- uma única cópia do artefato;
- visualização, download e reimpressão pelo serviço comum de Artefatos Fiscais;
- falha na geração do PDF registrada como pendência do artefato, sem desfazer a autorização.

Não transportar NFeNVias para a identidade do documento nem criar versões distintas por quantidade de cópias.

Nesta fase não integrar impressoras, Device Gateway, impressão automática ou NomeImpressoraNotaMercadorias. Essa configuração legada pode ser documentada como não utilizada pelo novo fluxo.

### Fora do escopo de documentos auxiliares

Não especificar renderer, endpoint, artefato ou fluxo para:

- DANFE simplificada;
- etiquetas de produto;
- etiquetas de volume;
- emiteetiqueta;
- impressoras de etiquetas;
- impressão automática.

Esses temas exigirão nova decisão/spec posterior com regra operacional, conteúdo, cardinalidade, layout, código de barras, versionamento e dispositivo.

## Requisitos funcionais mínimos

Crie requisitos testáveis, incluindo pelo menos:

1. seleção determinística das linhas e identidade persistida do grupo;
2. bloqueio de mistura de Filiais Requisitantes ou dados fiscais incompatíveis;
3. validação server-side de toda a fotografia antes da selagem;
4. vínculo atômico entre grupo, dadofiscal, número, pedidos e movimentos;
5. FOR UPDATE, unicidade e não reutilização de número;
6. rollback completo antes do commit;
7. outbox persistida antes da rede;
8. nenhum movimento adicional depois da autorização;
9. retry sem nova emissão/número;
10. estados operacional e fiscal independentes;
11. projeção somente mediante AUTORIZADA;
12. reconciliação de documento criado pelo Delphi;
13. nenhuma NF-e de entrada, financeiro, venda ou devolução;
14. DANFE PDF somente após autorização e a partir do artefato comum;
15. reimpressão sem regenerar ou retransmitir;
16. ausência de etiquetas e DANFE simplificada no contrato atual;
17. nenhum segredo, certificado ou material sensível em logs, JSON ou artefatos indevidos.

## Contratos a entregar

Detalhe contratos de:

- comando de confirmação/preparação por grupo;
- resultado operacional e fiscal separado;
- identidade da origem e chave de idempotência;
- fotografia fiscal selada;
- alocação de série/número;
- vínculo de pedidosfiliais e movimentos;
- outbox e worker de autorização;
- estados e transições;
- reconciliação Laravel/Delphi;
- consulta de pendências;
- consulta/download do Artefato DANFE PDF;
- auditoria e métricas.

Os contratos de domínio não podem expor tipos da biblioteca NFePHP, SOAP ou SEFAZ.

## Tarefas esperadas na especificação

Organize tarefas por fatias verticais, sem implementar:

1. auditoria do código atual e dos contratos de movimento;
2. definição do grupo fiscal persistente e idempotência;
3. preparação atômica operacional/fiscal;
4. numeração com bloqueio pessimista;
5. vínculo fiscal dos movimentos e pedidos;
6. integração com outbox/pipeline fiscal comum;
7. estados, retries e reconciliação;
8. projeção pós-autorização sem entrada/financeiro;
9. artefato DANFE PDF e reimpressão;
10. observabilidade, auditoria e rollout;
11. remoção de qualquer comportamento de etiqueta/DANFE simplificada indevidamente implementado.

Cada tarefa deve apontar arquivos/camadas prováveis, dependências, testes e critério de conclusão. Não presuma nomes de tabelas ou colunas sem snapshot de schema.

## Testes obrigatórios

Inclua testes de domínio, integração, contrato e homologação para:

- uma Transferência com um grupo;
- uma Transferência com vários grupos;
- retry concorrente do mesmo grupo;
- duas confirmações concorrentes disputando a série;
- rollback antes do commit;
- falha após commit;
- rejeição SEFAZ e retransmissão;
- transação com estoque/movimento já existente;
- documento previamente criado pelo Delphi;
- raiz de CNPJ igual sem vínculo fiscal;
- tentativa de VendaTransferencia/DevolucaoTransferencia;
- tentativa de NF-e de entrada;
- autorização repetida sem duplicar projeção ou estoque;
- geração do DANFE PDF a partir do nfeProc;
- reimpressão usando o mesmo hash/versão;
- falha do renderer sem alterar situação autorizada;
- ausência de UniDANFE, impressão automática, etiquetas e DANFE simplificada;
- sanitização de segredos e respostas SEFAZ.

## Homologação e rollout

O quickstart deve orientar:

1. validar schema e configuração fiscal publicada;
2. validar certificado e gateway real conforme a plataforma comum;
3. executar dry-run/leitura sem efeitos;
4. selecionar uma Filial e um grupo de teste;
5. confirmar operacionalmente e conferir movimentos, dadofiscal, série e outbox;
6. acompanhar transmissão e status fiscal;
7. conferir XML, protocolo, nfeProc e DANFE PDF;
8. conferir que não houve segundo movimento, NF-e de entrada ou financeiro;
9. exercitar retry/reconciliação;
10. registrar evidências redigidas e critérios de rollback operacional.

Não instruir o operador a usar transmissão para descobrir erro de configuração. Não habilitar produção nesta spec.

## Critérios de aceite da nova spec

A especificação estará pronta quando:

- refletir todas as decisões dos tickets 19, 20, 22 e 23;
- corrigir a divergência entre confirmação operacional e ponte fiscal;
- definir uma única coreografia idempotente por grupo;
- definir numeração com FOR UPDATE e não reutilização;
- vincular fiscalmente pedidos e movimentos sem duplicar estoque;
- definir estados, retries, rejeição e inutilização manual;
- usar exclusivamente o pipeline fiscal comum;
- definir DANFE padrão PDF e reimpressão por artefato;
- excluir explicitamente DANFE simplificada, etiquetas, UniDANFE, impressão automática, entrada fiscal e financeiro;
- entregar matriz Laravel x Delphi, contratos, tarefas, testes, quickstart e rastreabilidade;
- não conter implementação de código.
