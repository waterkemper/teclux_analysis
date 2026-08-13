# Especificação Complementar — Emissão Fiscal da Transferência de Requisição

Status: pronta para decomposição em implementação

Versão: 1.1

Data: 11 de agosto de 2026

## 1. Objetivo

Definir como a Transferência de Requisição para Exposição prepara, numera, transmite, reconcilia e projeta uma NF-e de saída usando a Plataforma de Emissão Fiscal Eletrônica já especificada no Laravel, preservando a convivência com o Delphi.

Esta especificação fecha a lacuna que foi deliberadamente excluída do mapa operacional. Ela não reespecifica a plataforma fiscal nem modifica a semântica operacional já aprovada.

A implementação 332 foi auditada em [05-auditoria-implementacao-transferencias.md](../../../.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/05-auditoria-implementacao-transferencias.md). O código atual é um MVP de contrato com Fake; a fatia de produção deve cumprir os requisitos 025 a 038 abaixo antes de ser considerada integração fiscal concluída.

## 2. Decisões fechadas

### DECISÃO-TRF-FISCAL-001 — Documento e papéis

A operação produz NF-e modelo 55 de saída. O emitente é a FilialBase, representada como Estabelecimento Fiscal elegível. A Filial Requisitante é o destinatário e cliente fiscal da saída. Não é criada NF-e de entrada automaticamente na Filial Requisitante.

Uma projeção de recebimento pode registrar que a saída autorizada satisfaz a transferência, mas não é documento fiscal de entrada, não cria notaspag e não consulta a SEFAZ como destinatário.

### DECISÃO-TRF-FISCAL-002 — Unidade fiscal

Cada grupo fiscal é definido por Transferência, Filial Requisitante, operação fiscal escolhida e conjunto imutável de linhas elegíveis. A regra observada no Delphi é uma NF-e por Filial Requisitante; a implementação não pode depender apenas da ordenação da consulta.

Produtos podem ser agregados dentro do grupo somente quando produto, FilialEstoque, unidade, lote/rastreabilidade e classificação fiscal forem compatíveis. Conflito separa o grupo ou bloqueia a emissão; nunca é resolvido silenciosamente.

### DECISÃO-TRF-FISCAL-003 — Transferência, venda e devolução

O tipo legado é preservado como dado de origem. Esta ponte fiscal aceita somente a operação Transferencia. Raiz de CNPJ igual ou diferente não autoriza, por si só, uso de certificado ou qualquer classificação de venda/devolução; certificado e vínculos continuam sendo resolvidos pela plataforma.

O Laravel não inferirá venda, devolução, contribuinte, certificado ou estabelecimento apenas por igualdade de raiz de CNPJ. A seleção deve passar pelas regras e vínculos da Plataforma Fiscal.

### DECISÃO-TRF-FISCAL-004 — Fronteira transacional

Cada grupo é confirmado em uma transação curta que valida, fotografa, verifica idempotência, bloqueia a linha de seriesfiliais, cria a Emissão Fiscal Pendente, grava a revisão selada e a outbox e avança a numeração.

Geração de XML, assinatura, rede, SEFAZ, S3, DANFE e e-mail acontecem depois do commit. Falha de um grupo não desfaz grupos anteriores, mas também não confirma silenciosamente o grupo atual: o grupo atual fica PENDENTE ou FALHA_OPERACIONAL com retry/reconciliação explícitos.

### DECISÃO-TRF-FISCAL-005 — Efeitos posteriores

Confirmação operacional e autorização fiscal são estados distintos. A confirmação pode registrar reserva, movimento e situação operacional conforme o contrato do mapa original, mas deve manter o vínculo fiscal PENDENTE.

Somente a autorização da NF-e libera a projeção fiscal de recebimento na Filial Requisitante. Essa projeção é idempotente e vinculada à Emissão Fiscal; não cria uma NF-e de entrada, notaspag, duplicata ou efeitos financeiros de venda/devolução.

### DECISÃO-TRF-FISCAL-006 — Fotografia

A Fotografia Fiscal é autocontida, versionada, hashada e imutável conforme REQ-SNAP-001 a REQ-SNAP-006 da plataforma fiscal. Nenhum retry, DANFE, reconciliação ou espelhamento consulta cadastros atuais para completar uma revisão selada.

### DECISÃO-TRF-FISCAL-007 — Dono da emissão e coexistência

Para cada grupo, somente um emissor pode possuir a Chave de Idempotência. Laravel e Delphi usam a mesma linha de seriesfiliais e consultam a mesma identidade de origem. Se o Delphi já tiver criado ou numerado o grupo, o Laravel reconcilia e espelha; não cria uma segunda NF-e.

## 3. Escopo

Incluído:

- seleção determinística das linhas elegíveis e formação dos grupos fiscais;
- resolução de FilialBase, Filial Requisitante, Contribuinte Fiscal, certificado, série, modelo e ambiente;
- Fotografia Fiscal e validação de produtos, lotes, estoque, preços, tributos, transporte, contrato e referências;
- criação idempotente da Emissão Fiscal, numeração compartilhada e outbox;
- uso dos comandos, filas, gateway, SEFAZ, contingência, Artefatos, DANFE e reconciliação da plataforma comum;
- projeção idempotente de autorização no fluxo de transferência;
- espelhamento e reconciliação com documentos criados no Delphi;
- auditoria, métricas, pendências e rollout gradual.

Fora do escopo:

- NF-e de entrada automática;
- manifestação do destinatário ou distribuição de DF-e recebido;
- novo contador, gateway, certificado, fila ou agregado fiscal;
- alteração dos prompts fiscais da plataforma comum;
- alteração dos fontes Delphi ou aplicação de migrations durante o /speckit.specify;
- correção silenciosa dos possíveis bugs legados;
- contrato, crédito, pagamento, baixa ou referência financeira de operação fora do tipo Transferencia;
- implementação de Romaneio ou da tela operacional.

## 4. Evidências e limites

### CONFIRMADO

- ConfirmaRequisicao processa linhas com quantidade recebida positiva, situação A e lote marcado, agrupando na prática por Filial Requisitante.
- O Delphi prepara dadosfiscais, produtosdadosfiscais, volumesdadosfiscais, venctosdadosfiscais, notas, movimentos, pedidos e seriesfiliais antes do commit principal.
- A numeração é avançada antes do commit e a transmissão ocorre depois.
- somente Transferencia possui código de operação e efeitos fiscais ativos nesta ponte; valores históricos de outros tipos são rejeitados.
- A FilialBase é emitente e a Filial Requisitante é destinatário.
- Existe leitura de notaspag e produtosnotaspag na devolução, mas não foi confirmada criação de NF-e de entrada ou persistência nova de notaspag nesse fluxo.

### INFERIDO

- Uma chave de grupo persistida é necessária para substituir a dependência legada da ordenação da consulta.
- A projeção de recebimento após autorização é o limite seguro para representar o efeito no destino sem inventar uma NF-e de entrada.

### DÚVIDA/DECISÃO NOVA

- Políticas financeiras de venda/devolução não fazem parte desta spec.
- A implementação deve decidir, com snapshot de schema, os nomes finais dos registros Laravel; os conceitos e invariantes desta spec não podem ser removidos.

### NÃO LOCALIZADO

- Corpo de Perpetrar, CancelarAtualizacoes, CalcularImpostos, AtribuirDadosProdutos, gerarcontratopordadofiscal e funções de saldo.
- Outbox, retenção, checksum e reconciliação durável do módulo Delphi.
- Estrutura completa de precos, contratos, pagamentos e lote fiscal no snapshot do módulo operacional.

### POSSÍVEL BUG LEGADO

- Ausência de rollback global e commits por grupo.
- Estoque ausente persistido antes da numeração.
- Produto sem saldo removido e possível emissão parcial.
- Retorno de ImprimirNotaFiscal não atribuído em pontos da jornada.
- Devolução edita campo que aparece como alias calculado e não teve persistência confirmada.

## 5. Modelo e ciclo de vida

### 5.1 Origem

Criar uma Origem Fiscal de Transferência com:

- transferência;
- FilialBase e Filial Requisitante;
- tipo Transferencia;
- IDs de todas as linhas incluídas;
- hash do conjunto de linhas e quantidades;
- usuário, instante, motivo e referência da confirmação;
- versão do contrato operacional e da spec fiscal.

### 5.2 Grupo

O grupo deve possuir identidade estável antes da numeração. A Chave de Idempotência mínima é:

Transferência + Filial Requisitante + tipo de operação + hash das linhas elegíveis + versão da fotografia.

Reprocessar a mesma chave retorna a Emissão existente. Alteração de conteúdo cria nova revisão ou novo grupo conforme a política da plataforma fiscal; não sobrescreve fotografia selada.

### 5.3 Estados

Manter separados:

- estado operacional da Requisição/Transferência;
- Situação Fiscal da Emissão;
- Situação do Processamento Fiscal;
- estado da projeção de autorização no destino.

O caminho nominal é:

1. ELEGÍVEL;
2. FOTOGRAFIA_EM_PREPARAÇÃO;
3. PENDENTE_DE_NUMERAÇÃO;
4. PENDENTE_DE_TRANSMISSÃO;
5. TRANSMITINDO;
6. AUTORIZADA ou REJEITADA_CORRIGIVEL;
7. PROJEÇÃO_APLICADA.

Estados de exceção usam FALHA_OPERACIONAL ou AGUARDANDO_RECONCILIACAO conforme a plataforma fiscal.

## 6. Requisitos funcionais

REQ-TRF-FISCAL-001 — O sistema deve selecionar apenas linhas elegíveis conforme o contrato operacional e registrar explicitamente linhas excluídas, quantidade parcial e motivo.

REQ-TRF-FISCAL-002 — O sistema deve formar grupos fiscais por identidade persistida, não apenas pela ordenação de uma consulta.

REQ-TRF-FISCAL-003 — O sistema deve impedir mistura de Filiais Requisitantes, operações fiscais, FiliaisEstoque ou classificações incompatíveis no mesmo grupo.

REQ-TRF-FISCAL-004 — O sistema deve carregar e validar emitente, destinatário, Contribuinte Fiscal, vínculo de certificado, UF, ambiente, modelo e série antes de selar a fotografia.

REQ-TRF-FISCAL-005 — Igualdade de raiz de CNPJ não pode selecionar certificado, estabelecimento ou autorização sem vínculo fiscal explícito.

REQ-TRF-FISCAL-006 — O sistema deve preservar no snapshot todos os IDs de pedidosfiliais, produtos, FilialEstoque, lotes, conferências, notas de origem, contrato e movimentos usados.

REQ-TRF-FISCAL-007 — O sistema deve resolver antes da selagem produto, unidade, conversão, quantidade, preço, tributos, transporte, volumes, contrato, crédito, vencimentos e referências.

REQ-TRF-FISCAL-008 — Ausência, conflito ou divergência em dado obrigatório deve bloquear a selagem com Pendência Fiscal Acionável; não usar cadastro atual como fallback depois da selagem.

REQ-TRF-FISCAL-009 — A fotografia deve guardar a operação Transferencia e o código de operação fiscal efetivamente escolhido; tipos históricos de venda/devolução devem ser rejeitados.

REQ-TRF-FISCAL-010 — O sistema deve calcular impostos, totais, rateios, quantidades tributáveis, volumes e parcelas antes da selagem.

REQ-TRF-FISCAL-011 — A transação de confirmação deve verificar a chave de idempotência, bloquear seriesfiliais com FOR UPDATE, reler o contador, validar ocupação, criar a Emissão, revisão, outbox e avanço do contador e então confirmar.

REQ-TRF-FISCAL-012 — Falha antes do commit deve desfazer a criação do grupo e o avanço da série; número alocado após commit nunca deve ser reutilizado.

REQ-TRF-FISCAL-013 — Falha após commit não deve criar nova emissão automaticamente. Deve registrar pendência, manter a fotografia e encaminhar para retry técnico ou reconciliação.

REQ-TRF-FISCAL-014 — A geração, assinatura, transmissão, custódia, DANFE, e-mail e distribuição devem usar os comandos, filas e gateway da plataforma fiscal.

REQ-TRF-FISCAL-015 — A emissão deve registrar a origem Transferência como contexto de auditoria e manter o vínculo com o grupo operacional.

REQ-TRF-FISCAL-016 — A confirmação operacional não pode ser interpretada como autorização fiscal. A UI e APIs devem expor os dois estados separadamente.

REQ-TRF-FISCAL-017 — Após autorização, o sistema deve aplicar uma projeção de recebimento no destino usando chave idempotente por Emissão e grupo; repetição não pode duplicar estoque, movimento, contrato, crédito ou vencimento.

REQ-TRF-FISCAL-018 — A projeção de recebimento não deve criar NF-e de entrada, manifestação, notaspag ou duplicata automaticamente.

REQ-TRF-FISCAL-019 — A ponte não cria nem atualiza contrato, crédito, vencimentos ou qualquer efeito financeiro de venda/devolução.

REQ-TRF-FISCAL-020 — A ponte não processa devoluções, referências de origem, saldo de devolução ou baixa de notaspag/produtosnotaspag; tipos fora de Transferencia devem ser rejeitados.

REQ-TRF-FISCAL-021 — Se o Delphi já tiver criado o documento para a mesma origem, Laravel deve reconciliar por origem, chave, emitente, modelo, série e número antes de qualquer nova tentativa.

REQ-TRF-FISCAL-022 — Se Laravel criar a Emissão, o espelhamento Delphi deve ser projeção idempotente e nunca disputar numeração ou retransmitir o mesmo documento.

REQ-TRF-FISCAL-023 — O sistema deve auditar linha de origem, grupo, fotografia, versão, hash, certificado, série, número, comando, tentativa, resposta, artefato, projeção e operador.

REQ-TRF-FISCAL-024 — Os contratos de domínio não podem expor tipos da biblioteca fiscal ou detalhes da SEFAZ.

REQ-TRF-FISCAL-025 — Em homologação e produção, todas as portas fiscais da transferência devem resolver para a plataforma fiscal real; FakeFiscalPlatformAdapter só pode ser selecionado explicitamente em teste ou dry-run.

REQ-TRF-FISCAL-026 — Fotografia, emissão, revisão, numeração, outbox, tentativa, estado, artefatos e reconciliação devem usar persistência durável da plataforma; Cache não pode ser contador, outbox, estado fiscal ou fonte de reconciliação.

REQ-TRF-FISCAL-027 — O adapter real deve implementar as portas usando os serviços, repositórios, comandos, filas e eventos da plataforma fiscal; um adapter que apenas lança RuntimeException não satisfaz a integração.

REQ-TRF-FISCAL-028 — A origem da emissão deve ser carregada no servidor por identificador de transferência/grupo autorizado. Linhas, Filial Requisitante, produto, quantidade, totais e fotografia enviados pelo cliente são intenção/filtro, nunca autoridade.

REQ-TRF-FISCAL-029 — Antes da formação do grupo, validar transferência confirmada, situação elegível, quantidade, lote marcado, reserva/estoque, filial de estoque, revisão concorrente, escopo de filial e autorização do usuário.

REQ-TRF-FISCAL-030 — A fotografia deve carregar identidade fiscal completa de emitente e destinatário, incluindo endereço, UF/IBGE, regime e credenciamento, além de produto, unidade, conversão, preço, classificação fiscal, tributos, transporte, volumes, contratos, pagamentos, vencimentos e referências.

REQ-TRF-FISCAL-031 — Totais, unidade, transporte e demais valores não podem usar defaults silenciosos como 0.00, UN ou frete padrão quando o dado autoritativo estiver ausente; ausência ou conflito deve gerar pendência.

REQ-TRF-FISCAL-032 — A projeção de destino só pode ser acionada por evento ou consulta conclusiva da plataforma que comprove AUTORIZADA; o handler não pode alterar a situação fiscal nem chamar Fake para simulá-la.

REQ-TRF-FISCAL-033 — A rota manual de reprojeção, se existir, deve ser administrativa, idempotente, protegida e subordinada à verificação AUTORIZADA; a rota canônica de pendências deve ser somente leitura e seguir o contrato HTTP.

REQ-TRF-FISCAL-034 — O sistema deve registrar listener/subscription para EmissaoAutorizada, rejeição corrigível, falha operacional e aguardando reconciliação, atualizando a ponte sem exigir POST manual.

REQ-TRF-FISCAL-035 — Efeitos desta ponte limitam-se à projeção idempotente da Transferencia; o hash deve representar somente resultado aplicado e não pode declarar efeitos financeiros fora do escopo.

REQ-TRF-FISCAL-036 — A reconciliação Delphi deve consultar dados autoritativos de notas, dadosfiscais, séries, chave e artefatos; seed de Cache é permitido somente em testes.

REQ-TRF-FISCAL-037 — Replay, show e pendências devem consultar o grupo persistido e o estado real da plataforma; não reconstruir grupos a partir de payload arbitrário nem retornar estados fixos.

REQ-TRF-FISCAL-038 — O schema gate deve validar também o snapshot fiscal e os objetos seriesfiliais, notas, dadosfiscais, produtosdadosfiscais, volumes e vencimentos; validar somente tabelas Cloud e snapshot operacional é insuficiente.

## 7. Contratos de integração

### Com o módulo operacional

Entrada: linhas elegíveis, FilialBase, Filial Requisitante, FilialEstoque, lotes, conferências, quantidades, operação e referências.

Saída: grupo fiscal, vínculo da Emissão, estado fiscal e eventos/projeções idempotentes. O contrato deve permitir consultar pendências sem repetir confirmação.

### Com a plataforma fiscal

Entrada: Origem Fiscal de Transferência e Fotografia Fiscal selada.

Saída: Emissão Fiscal, numeração compartilhada, Comando Fiscal, Tentativas, Artefatos, eventos, reconciliação e estado.

Reutilizar os requisitos REQ-DOM-001 a REQ-DOM-007, REQ-SNAP-001 a REQ-SNAP-006, REQ-NUM-001 a REQ-NUM-006, REQ-CERT-001 a REQ-CERT-009, REQ-ORCH-001 a REQ-ORCH-009 e REQ-REC-001 a REQ-REC-005 da plataforma fiscal.

### Com o Delphi

Registrar origem e identificadores legados. A integração deve ter modo de leitura/reconciliação para documentos já iniciados no Delphi e modo de espelhamento para documentos iniciados no Laravel. Qualquer divergência de chave, emitente, série, número, resumo da fotografia, situação ou artefato vira Pendência Fiscal Acionável.

## 8. Testes e aceite

### Testes de domínio

- mesmo conjunto de linhas retorna a mesma chave de grupo;
- duas Filiais Requisitantes produzem duas emissões;
- produto incompatível não é agregado;
- raiz de CNPJ igual sem vínculo de certificado bloqueia;
- retry não duplica Emissão, número ou projeção;
- documento de entrada não é criado;
- tipos históricos de venda/devolução são rejeitados sem criar efeitos ou referências;
- falha antes do commit não consome número;
- falha depois do commit mantém pendência reconciliável;
- grupo posterior falho não duplica grupo anterior;
- autorização repetida não duplica efeitos no destino;
- Delphi existente é reconciliado sem segunda emissão.

### Testes de integração

- snapshot oficial do schema é validado antes de SQL;
- série é bloqueada na mesma transação curta;
- outbox e comando são persistidos antes da rede;
- worker usa a revisão selada sem buscar cadastro atual;
- resposta ambígua entra em reconciliação;
- artefatos e espelhamento usam o pipeline fiscal comum.

### Critérios de aceite

1. Um caso normal gera NF-e modelo 55 de saída por grupo, com fotografia imutável, número compartilhado, comando e rastreabilidade completa.
2. Filiais do mesmo Contribuinte Fiscal podem reutilizar certificado somente por vínculo explícito; raiz igual não cria fallback.
3. Nenhuma execução gera NF-e de entrada automática ou notaspag nova.
4. Nenhum retry técnico gera nova emissão ou altera fotografia.
5. Toda falha de transmissão, artefato ou espelhamento fica visível e reconciliável.
6. Os cenários de Transferencia, grupo parcial, tipo fora do escopo e documento existente no Delphi são cobertos.

## 9. Rollout

1. Implementar leitura e validação sem emissão para conferir agrupamento e fotografia.
2. Habilitar homologação por Filial e ambiente, com série e certificado explicitamente vinculados.
3. Comparar Laravel e Delphi por origem, grupo, chave, série, número, itens, totais e situação.
4. Habilitar produção por allowlist de Filiais e manter reconciliação manual.
5. Expandir gradualmente; qualquer divergência fiscal bloqueia a expansão, não é corrigida por fallback automático.

## 10. Rastreabilidade

| Decisão/requisito | Evidência ou autoridade |
|---|---|
| Documento, emitente e agrupamento | research/01-fluxo-fiscal-transferencia-delphi.md; dmtransferenciarequisicaoexposicao.pas:924-970, 1352-1445 |
| Numeração e efeitos parciais | research/01-fluxo-fiscal-transferencia-delphi.md; dmtransferenciarequisicaoexposicao.pas:1816-1977, 2464-2482 |
| Fotografia e dados imutáveis | research/04-mapeamento-fotografia-fiscal-transferencia.md; emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md; issue 12 |
| Certificado e raiz de CNPJ | emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md, REQ-DOM-006/007 e REQ-CERT-001/006/007 |
| Exclusão de NF-e de entrada | emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md, seção 2.2 |
| Operação e paridade operacional | transferencia-requisicao-exposicao-wayfinder/map.md e seus tickets resolvidos |

## 11. Exclusões explícitas

Esta spec não autoriza alterar a regra operacional já aprovada, não corrige automaticamente bugs legados, não cria documento fiscal de entrada e não autoriza um segundo pipeline fiscal. Mudanças nesses pontos exigem nova decisão registrada e revisão desta spec.
