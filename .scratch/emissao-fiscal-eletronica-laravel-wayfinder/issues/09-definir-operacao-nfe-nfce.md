# Definir a operação de NF-e, NFC-e e contingência

Type: prototype
Status: resolved
Blocked by: 04, 08

## Question

Como Operador e Autorizador emitem, acompanham, reconciliam, retransmitem, operam contingência, inutilizam, cancelam, emitem CC-e, imprimem e reimprimem, distinguindo NF-e assíncrona e NFC-e no caixa?

## Answer

### Superfície operacional

Adota-se a variação A do [protótipo de Operação Fiscal](../../../laravel/backend/resources/js/Pages/Prototype/EmissaoFiscalOperacao.tsx): uma Central de Emissões orientada por fila e prioridade. O fluxo normal é automatizado; a atenção humana se concentra nas exceções e nos documentos que precisam de ação.

A lista combina NF-e e NFC-e e mostra, sem fundi-las, a Situação Fiscal da Emissão e a Situação do Processamento Fiscal. Filtros cobrem Filial, ambiente, modelo, período, origem, situação, processamento e itens que precisam de ação. A prioridade é: caixa bloqueado, contingência a transmitir, ambiguidade, rejeição corrigível e falha operacional.

Ao selecionar uma emissão, o painel lateral apresenta identidade fiscal, origem, chave, protocolo, último executor, resumo da última Tentativa Fiscal, orientação do próximo passo e somente as ações permitidas. O histórico completo abre uma visão de detalhe auditável; não ocupa a superfície principal.

### Papéis e autoridade

O Operador acompanha, imprime ou reimprime DANFE, baixa artefatos permitidos, solicita transmissão, corrige rejeição quando autorizado no documento de origem e acompanha a operação idempotente existente. O Autorizador possui, além disso, as ações sensíveis: iniciar contingência manual quando aplicável, reconciliação manual, retransmissão já liberada pela Reconciliação Fiscal, cancelamento, CC-e e inutilização.

Permissão não substitui elegibilidade fiscal. Cada ação exibe o motivo quando indisponível, exige justificativa quando aplicável e cria Comando Fiscal auditável. Confirmação reforçada é obrigatória para cancelamento, inutilização, contingência manual e transferência de controle de emissão originada no Delphi.

### NF-e assíncrona

Emitir NF-e confirma a intenção fiscal e devolve imediatamente a emissão à Central. Formação, assinatura, transmissão, consulta, artefatos e distribuição prosseguem em fila durável. O usuário não precisa manter a página aberta e acompanha progresso pelo mesmo registro.

Rejeição explícita e corrigível oferece correção e nova revisão da Fotografia Fiscal. Falha comprovadamente anterior ao envio pode ser retomada. Resultado ambíguo oferece Reconciliação Fiscal, nunca retransmissão direta. Retransmitir só aparece após a reconciliação concluir que os mesmos bytes podem ser enviados com segurança.

### NFC-e no caixa

O caixa usa a mesma Emissão Fiscal Eletrônica, mas espera por uma janela curta na fila prioritária. Se autorizada, libera DANFE NFC-e e encerra a interação. Se a resposta demorar, mantém a venda vinculada ao mesmo Comando Fiscal e mostra processamento ou reconciliação sem duplicar envio.

Quando a regra da UF permitir contingência offline, o caixa apresenta decisão explícita e auditada, registra o Episódio de Contingência, assina e entrega o DANFE NFC-e de contingência e libera a venda. A transmissão posterior é automática e visível na Central. Duplicidade ou autorização incompatível vira exceção crítica; cancelamento por substituição segue Evento Fiscal próprio.

### Eventos, inutilização e documentos

Cancelamento e CC-e partem apenas de emissão autorizada e elegível. Cada solicitação mostra prazo e regra aplicável, exige justificativa ou texto estruturado, cria Evento Fiscal próprio e só altera o resultado após protocolo confirmado. CC-e não altera a situação autorizada.

Inutilização opera sobre número não autorizado, exige Reconciliação Fiscal anterior, justificativa, autorização reforçada e confirmação do intervalo. Número alocado nunca é reutilizado.

Imprimir e reimprimir sempre usam o Artefato Fiscal correspondente ao estado e à revisão corretos. Documento autorizado usa XML protocolado; contingência usa o XML e a marcação do Episódio de Contingência. Reimpressões são auditadas e não criam nova emissão nem nova tentativa.

### Evidência do protótipo

- Rota local: /prototype/emissao-fiscal?variant=A
- Escolha validada pelo usuário: variação A, Central operacional.
- As variações B e C permanecem apenas como comparação; a linha do tempo pode informar a futura tela de detalhe, sem substituir a Central como entrada principal.
