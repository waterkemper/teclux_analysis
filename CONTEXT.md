# ERP tecLUX

Vocabulário transversal do ERP tecLUX, compartilhado pelos contextos funcionais e usado para orientar a migração do Delphi para o Laravel.

## Language

**Estorno do Pagamento**:
Transição que desfaz integral e atomicamente a Quitação de uma Duplicata, preservando a obrigação e sua identidade para que volte à situação autorizada e não paga.
_Avoid_: exclusão da duplicata, cancelamento cadastral, refazer pagamento, edição do pagamento

**Filial**:
Estabelecimento fiscal representado no ERP.
_Avoid_: unidade operacional, depósito, tenant

**Usuário**:
Identidade de uma pessoa autorizada a acessar o ERP.
_Avoid_: operador, login, credencial

**Catálogo de Grid**:
Definição autorizada e estável das colunas que um grid ERP pode apresentar, identificando cada coluna independentemente do texto exibido.
_Avoid_: preferência do grid, layout do grid, lista inferida do resultado

**Preferência de Grid**:
Escolha de apresentação de um grid ERP pertencente a um Usuário, sem alterar a identidade nem a autorização das colunas do Catálogo de Grid.
_Avoid_: catálogo de grid, parâmetro do sistema, configuração global

**Arquivo de Configuração de Grid**:
Fotografia portátil da apresentação de um único grid ERP, sem identidade de Usuário, destinada ao intercâmbio explícito de configurações.
_Avoid_: preferência de grid, backup do usuário, configuração global

**Título Personalizado**:
Nome de apresentação escolhido pelo Usuário para uma coluna do Catálogo de Grid; é um override durável do título padrão e nunca a identidade da coluna.
_Avoid_: identificador da coluna, nome do campo, título global

**Operador**:
Papel exercido por um Usuário durante a realização de uma atividade operacional.
_Avoid_: usuário, identidade, credencial

**Parâmetro do Sistema**:
Configuração funcional administrável que determina ou condiciona o comportamento do ERP, com valor global e, quando aplicável, valor específico por Filial.
_Avoid_: parâmetro, argumento, filtro, parâmetro SQL

**Permissão**:
Capacidade previamente concedida a um Usuário ou perfil para acessar um recurso ou executar uma ação.
_Avoid_: autorização, aprovação

**Autorização**:
Aprovação contextual dada por um Usuário com a Permissão necessária para liberar uma operação específica.
_Avoid_: permissão, acesso permanente

**Autorizador**:
Papel exercido por um Usuário que concede uma Autorização por possuir a Permissão exigida no contexto da operação.
_Avoid_: operador, administrador, aprovador genérico

**Duplicata**:
Parcela de uma obrigação de Contas a Pagar, identificada dentro de um Documento a Pagar por vencimento e número.
_Avoid_: documento a pagar, pagamento, parcela sem contexto

**Autorização de Pagamento**:
Evidência contextual de que uma Duplicata pode ser submetida a uma tentativa de Quitação; não representa a Quitação nem seus efeitos financeiros.
_Avoid_: permissão de pagamento, pagamento autorizado como sinônimo de pago, quitação

**Quitação**:
Fato financeiro que confirma o pagamento de uma Duplicata após a conclusão atômica de seus efeitos e reconciliação.
_Avoid_: autorização de pagamento, tentativa de pagamento, baixa genérica

**Cadastro**:
Conjunto mantido de informações de referência sobre uma entidade do domínio, como Cliente ou Produto.
_Avoid_: inclusão, tela, formulário

**Inclusão**:
Criação de um novo registro em um Cadastro.
_Avoid_: cadastro, alteração

**Alteração**:
Modificação dos dados de um registro existente sem substituir sua identidade.
_Avoid_: inclusão, substituição

**Exclusão**:
Remoção definitiva de um registro de um Cadastro.
_Avoid_: inativação, cancelamento

**Inativação**:
Preservação de um registro e de sua identidade, impedindo ou restringindo seu uso futuro.
_Avoid_: exclusão, cancelamento

**Auditoria**:
Trilha imutável das Inclusões, Alterações e Exclusões realizadas no ERP, identificando a operação, o registro afetado, o Usuário responsável e o momento da mudança. No domínio, Log de Auditoria e Histórico de Alterações nomeiam o mesmo conceito.
_Avoid_: log técnico, log de diagnóstico

**Relatório**:
Apresentação estruturada de informações do ERP segundo critérios definidos, destinada à análise, conferência ou comunicação. Pode ser exibida em tela, impressa ou exportada sem que o formato altere o conceito.
_Avoid_: consulta, listagem, exportação

**Documento Lógico de Impressão**:
Representação autorizada e independente de dispositivo do conteúdo e da apresentação que devem ser impressos.
_Avoid_: comando de impressão, arquivo ESC/POS, job do agente, snapshot de impressão

**Snapshot de Impressão**:
Fotografia imutável de um Documento Lógico de Impressão e dos metadados autorizados que fundamentam uma impressão ou reimpressão.
_Avoid_: documento editável, tentativa de impressão, job do agente

**Tentativa de Impressão**:
Ocorrência individual de envio de um Snapshot de Impressão a um Dispositivo Local, com resultado próprio e sem presumir que o papel foi fisicamente impresso.
_Avoid_: documento lógico de impressão, reenvio, confirmação física

**Reimpressão**:
Nova Tentativa de Impressão explicitamente autorizada que reutiliza um Snapshot de Impressão anterior sem alterar nem substituir a evidência da tentativa original.
_Avoid_: retry automático, continuação da tentativa, correção do resultado anterior

**Dispositivo Local**:
Identidade lógica de um equipamento disponível na estação e autorizado a executar capacidades locais específicas.
_Avoid_: nome da fila, driver, porta, impressora escolhida no job

**Homologação de Dispositivo Local**:
Aprovação documentada de uma combinação específica de equipamento e ambiente para executar determinadas capacidades locais.
_Avoid_: compatibilidade presumida pelo modelo, binding, teste isolado de impressão

**Fila de Impressão**:
Destino de impressão mantido pelo sistema operacional e vinculado explicitamente a um Dispositivo Local.
_Avoid_: dispositivo local, impressora padrão, porta, job do agente

**Job do Agente**:
Entrega de uma operação autorizada ao agente local para executar uma Tentativa de Impressão ou outra capacidade local.
_Avoid_: tentativa de impressão, documento lógico de impressão, comando arbitrário

**Situação**:
Condição atual de uma entidade ou processo de negócio, que pode determinar as operações permitidas e suas transições seguintes. Deve ser qualificada pela entidade, pois seus códigos não possuem significado universal.
_Avoid_: status técnico, código sem contexto

**Orçamento**:
Proposta comercial que pode gerar diretamente um Contrato ou alimentar uma Venda no frente de caixa. Um Orçamento não constitui, por si só, compromisso do Cliente.
_Avoid_: venda, contrato

**Contrato**:
Registro comercial obrigatoriamente vinculado a um Cliente. Constitui compromisso do Cliente somente quando sua Situação é Faturado, Nota Parcial ou Nota Fiscal.
_Avoid_: orçamento, venda anônima

**Situação do Contrato**:
Estágio comercial de um Contrato: Orçado (`O`), Reservado (`R`), Faturado (`F`), Cancelado (`C`), Nota Parcial (`P`) ou Nota Fiscal (`N`).
_Avoid_: status do contrato, código sem significado

**Venda Perdida**:
Ocorrência que registra um item ou uma demanda comercial não atendida. Pode identificar um Produto cadastrado ou descrever livremente um item e seu grupo; uma mesma negociação pode originar várias Vendas Perdidas.
_Avoid_: orçamento perdido, contrato cancelado, venda cancelada

**Venda**:
Operação comercial concluída e identificada fiscalmente por CFOP de venda. Pode ocorrer no frente de caixa sem Cliente identificado e, quando vinculada a Cliente, pode também ser representada por um Contrato.
_Avoid_: orçamento, proposta

**Cliente**:
Pessoa ou organização cadastrada como Cliente, correspondente ao tipo legado `C`.
_Avoid_: parte contratante, fornecedor, filial

**Parte Contratante**:
Entidade vinculada a um Contrato no papel de adquirente. Pode ser um Cliente (`C`), Fornecedor (`F`) ou Filial (`L`), conforme permitido por Parâmetro do Sistema.
_Avoid_: cliente quando o tipo for desconhecido

**Fornecedor**:
Pessoa ou organização cadastrada como Fornecedor, correspondente ao tipo legado `F`.
_Avoid_: parte fornecedora, cliente, filial

**Parte Fornecedora**:
Entidade que ocupa o papel de origem ou fornecimento em uma operação de entrada. Pode ser um Cliente (`C`), Fornecedor (`F`) ou Filial (`L`) e não coincide necessariamente com o Emitente do Documento Fiscal.
_Avoid_: fornecedor quando o tipo for desconhecido

**Produto**:
Item comercial individualmente identificado por um registro próprio. Pode participar de estoque e operações comerciais, pertencer a uma Característica de Produto, possuir valores de grade e ser simples, composto ou conjunto.
_Avoid_: característica de produto, serviço

**Busca Assistida de Produtos**:
Consulta que interpreta uma necessidade comercial descrita em linguagem natural e recupera Produtos cadastrados com evidências do próprio cadastro, sem realizar diagnóstico ou prescrição.
_Avoid_: recomendação médica, diagnóstico por IA, busca inteligente (vago), assistente médico

**Documento Semântico do Produto**:
Representação textual normalizada e versionada dos atributos comerciais estáveis de um Produto, usada para gerar seu embedding. Exclui posição de estoque, preço e outros dados dinâmicos, e só precisa ser reconvertida quando seu conteúdo, sua versão de montagem ou o modelo de embedding mudar.
_Avoid_: cadastro do produto, estoque vetorizado, descrição gerada pela IA

**Evidência Comercial do Produto**:
Trecho literal e identificável do Cadastro que sustenta a relação apresentada entre uma necessidade comercial e um Produto. Não constitui diagnóstico, prescrição, promessa de resultado ou afirmação gerada pela IA.
_Avoid_: recomendação médica, justificativa inventada, diagnóstico, propaganda gerada

**Conferência de Produtos**:
Verificação quantitativa dos Produtos de um documento, comparando a quantidade esperada com a quantidade lida ou digitada. Está completa somente quando todos os Produtos atingem a quantidade esperada.
_Avoid_: conferência de cadastro, inventário, contagem de estoque

**Característica de Produto**:
Agrupamento que compartilha propriedades entre Produtos relacionados.
_Avoid_: produto, SKU

**Faixa de Preço**:
Opção de preço que um Produto seleciona dentro de sua Característica de Produto. Identifica qual conjunto compartilhado de Valores de Preço o Produto utiliza, sem representar por si só um valor monetário ou uma Filial.
_Avoid_: preço do produto, coluna de preço, valor de preço

**Coluna de Preço**:
Referência cadastrada que organiza Valores de Preço e pode ser configurada por uma ou mais Filiais para exercer o papel de preço normal ou promocional.
_Avoid_: faixa de preço, preço da filial, valor de preço

**Valor de Preço**:
Valor monetário, com validade opcional, compartilhado pela combinação de Característica de Produto, Faixa de Preço e Coluna de Preço. Ausência de configuração não equivale a preço zero.
_Avoid_: preço efetivo na filial, faixa de preço, custo

**Preço Efetivo na Filial**:
Preço calculado para um Produto em uma Filial a partir da Faixa de Preço escolhida pelo Produto e das Colunas de Preço normal e promocional configuradas na Filial. Usa o valor promocional vigente quando disponível e, caso contrário, o normal.
_Avoid_: valor de preço, preço armazenado na filial, custo

**Restrição de Preço**:
Operador e valor extraídos de uma consulta em linguagem natural da Busca Assistida de Produtos (ex.: "abaixo de 50,00") e usados para filtrar candidatos pelo Preço Efetivo na Filial. Não usa o mecanismo de filtros estruturados por aba/campo/operador já existente em outras telas.
_Avoid_: faixa de preço, filtro de preço

**Desconto por Cargo**:
Percentual persistido para a combinação de Produto e Cargo que ajusta o Preço Efetivo na Filial em contextos comerciais aplicáveis. O preço e a margem resultantes são calculados, não valores independentes persistidos.
_Avoid_: markup por cargo, preço por cargo armazenado, permissão do cargo

**Lançamento**:
Registro persistido de uma transação ou fato ocorrido no ERP, com data, origem e demais informações necessárias para identificar o evento registrado. Pode produzir um ou mais Movimentos.
_Avoid_: movimento, efeito, saldo

**Movimento**:
Efeito quantitativo ou financeiro produzido por um Lançamento em um contexto específico, como entrada, saída ou transferência de estoque ou valor. Embora partes do sistema usem Movimento e Lançamento como sinônimos, o vocabulário de domínio mantém os conceitos distintos.
_Avoid_: lançamento, registro da transação, saldo

**Saldo**:
Posição quantitativa ou financeira resultante dos Movimentos acumulados até um momento de referência. Deve ser qualificado pelo domínio e pela referência temporal, como Saldo de Estoque, Saldo Bancário, saldo inicial ou saldo final. Seu eventual armazenamento para consulta ou desempenho não altera esse significado conceitual.
_Avoid_: movimento, lançamento, valor sem domínio ou data de referência

**Documento Fiscal**:
Documento que formaliza fiscalmente uma operação, abrangendo modelos como nota fiscal, NF-e, NFC-e e cupom fiscal. Possui natureza fiscal identificada por CFOP e não se confunde com a representação técnica usada para armazená-lo no ERP.
_Avoid_: dado fiscal, venda, contrato

**DANFE NFC-e**:
Representação auxiliar, impressa ou eletrônica, de uma NFC-e autorizada, destinada à consulta e conferência sem substituir o Documento Fiscal eletrônico.
_Avoid_: NFC-e, documento fiscal, comprovante genérico, autorização fiscal

**Emissão Fiscal Eletrônica**:
Processo durável que reserva a numeração de uma Série Fiscal, forma, assina e transmite uma NF-e ou NFC-e, acompanha sua Situação perante a SEFAZ e preserva seus artefatos e eventos. Falha de comunicação não libera para reutilização o número reservado.
_Avoid_: arquivo XML, tentativa HTTP, nota pendente sem qualificação, emissão UniNFe

**Emissão Fiscal Pendente**:
Emissão Fiscal Eletrônica sem resultado fiscal final conhecido, que exige retransmissão segura ou reconciliação com a SEFAZ antes de qualquer inutilização.
_Avoid_: nota rejeitada, nota cancelada, número livre, erro de transmissão

**Gerenciamento de Certificado A1**:
Administração auditada do ciclo de vida dos Certificados A1 associados a uma Filial, incluindo validação, ativação, substituição e alerta de vencimento, sem expor o arquivo ou sua senha.
_Avoid_: cadastro de senha, certificado do usuário, configuração do UniNFe

**Tentativa Fiscal**:
Ocorrência imutável de uma ação de comunicação com a SEFAZ no contexto de uma Emissão Fiscal Eletrônica ou Evento Fiscal, preservando requisição, resposta, resultado técnico e momento próprios sem criar outro Documento Fiscal.
_Avoid_: emissão fiscal, reenvio sem identidade, tentativa HTTP descartável

**Evento Fiscal**:
Solicitação fiscal vinculada a uma Emissão Fiscal Eletrônica, como cancelamento, CC-e ou inutilização, com identidade, tentativas, XML, protocolo e resultado próprios. Somente sua autorização produz efeito fiscal sobre a emissão.
_Avoid_: alteração do documento autorizado, situação da emissão, operação técnica

**Situação Fiscal da Emissão**:
Resultado fiscal efetivo conhecido de uma Emissão Fiscal Eletrônica perante a SEFAZ, independente da etapa técnica de processamento. Pode ser Pendente, Rejeitada Corrigível, Autorizada, Uso Denegado quando aplicável, Cancelada ou Inutilizada.
_Avoid_: situação de processamento, cStat, situação genérica de dadosfiscais

**Situação do Processamento Fiscal**:
Condição operacional atual do processamento de uma Emissão Fiscal Eletrônica, como aguardando, processando, aguardando correção, operando em contingência ou aguardando reconciliação, sem afirmar por si só um resultado perante a SEFAZ.
_Avoid_: situação fiscal da emissão, cStat, situação do documento fiscal

**Episódio de Contingência**:
Período auditado em que uma Emissão Fiscal Eletrônica segue uma modalidade de contingência oficialmente aplicável, registrando tipo, justificativa, início, fim, responsável e revisões fiscais produzidas.
_Avoid_: autorização fiscal, falha genérica, forma de emissão sem contexto

**Dado Fiscal**:
Representação interna mantida em `dadosfiscais` que registra ou sustenta um Documento Fiscal e seus vínculos no ERP, como Produtos, Contrato, Orçamento e vencimentos.
_Avoid_: documento fiscal, nota fiscal como documento legal

**Nota Fiscal de Entrada**:
Documento Fiscal que formaliza uma operação de entrada na Filial, representado principalmente por `notaspag`. Pode ser recebido de um Fornecedor ou emitido pela própria Filial, como em uma devolução realizada por Cliente; portanto, entrada não identifica por si só o Emitente.
_Avoid_: nota de fornecedor, conta a pagar, nota necessariamente emitida por terceiro

**Nota Fiscal de Saída**:
Documento Fiscal emitido pela Filial em uma operação de saída, representado conjuntamente por `dadosfiscais` e `notas`. Sua identificação oficial usa a numeração controlada pela Série Fiscal aplicável.
_Avoid_: dado fiscal, venda, nota fiscal de entrada

**Série Fiscal**:
Faixa de numeração de Documentos Fiscais configurada por Filial em `seriesfiliais`, com série, modelo fiscal, próximo número e limite de numeração.
_Avoid_: série de produto, número da nota, série sugerida

**Série Sugerida**:
Série Fiscal escolhida como padrão no Cadastro da Filial para determinado modelo ou contexto de emissão, como mercadorias, serviços ou NFC-e. A sugestão seleciona a série; o controle da numeração permanece em `seriesfiliais`.
_Avoid_: série fiscal, próxima numeração, parâmetro global

**Aplicação de Questionário**:
Ocorrência em que um Questionário vigente é apresentado a um Cliente no contexto de um documento do ERP, preservando a fotografia das perguntas e opções utilizadas, as respostas, a situação da aplicação e o vínculo com o documento de origem.
_Avoid_: cadastro de questionário, enquete como modelo, formulário genérico
