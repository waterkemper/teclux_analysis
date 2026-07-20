# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional e técnica para substituir o envio simplificado de Orçamentos no Laravel por uma capacidade genérica de envio de documentos por e-mail, baseada no comportamento comprovado do ERP Delphi e preparada para reutilização posterior em Contratos e outros módulos.

Não implemente código nesta etapa. Produza uma especificação completa, verificável e pronta para planejamento/implementação. Antes de concluir, inspecione o código atual indicado abaixo e corrija qualquer hipótese deste prompt que seja contrariada por evidência concreta.

## Problema

O Cadastro de Orçamentos Laravel atualmente solicita um único destinatário por `window.prompt` e faz o envio imediatamente pelo controller. Essa solução não representa a composição disponível no Delphi, não contempla os dois modos operacionais de entrega, não suporta múltiplos destinatários, não apresenta prévia adequada, não protege contra duplicidade e não registra corretamente o ciclo do envio em Atendimentos.

A nova solução deve atender Orçamentos agora e estabelecer um núcleo genérico, sem dependência direta desse módulo, para adoção futura por Contratos e outros documentos.

## Escopo desta entrega

- Implementar e integrar a capacidade apenas no Cadastro de Orçamentos Laravel.
- Criar modal, contrato de contexto, composição e entrega reutilizáveis.
- Preparar extensão para Contratos e outros módulos, mas não integrar esses consumidores agora.
- Suportar dois modos automáticos de entrega:
  1. site/e-commerce por inserção em `email_orcamento` quando `UsaitecLUX` estiver ativo;
  2. envio pelo Laravel em fila quando `UsaitecLUX` estiver inativo.
- Enviar o Orçamento no corpo HTML do e-mail, sem PDF ou outros anexos.
- Registrar o resultado operacional em Atendimento.

## Regras de análise e evidência

Analise PAS e DFM conjuntamente, incluindo forms ancestrais, data modules, queries, eventos, actions, units compartilhadas, parâmetros, permissões e geração HTML.

Classifique toda conclusão relevante como:

- CONFIRMADO;
- INFERIDO;
- DÚVIDA;
- NÃO LOCALIZADO;
- DIVERGENTE;
- POSSÍVEL BUG LEGADO;
- DECISÃO NOVA.

Cada conclusão deve apontar evidência concreta. Não converta limitações, comportamentos inócuos ou possíveis bugs do Delphi em requisitos sem justificativa.

## Evidências Delphi já localizadas

- [CONFIRMADO] `fmenviaremail.pas/.dfm` implementa uma janela compartilhada de envio usada por diferentes contextos.
- [CONFIRMADO] A janela contém Host, Assunto, Introdução, Referência, Conclusão, Contato, E-Mail e ação Enviar.
- [CONFIRMADO] O Host é somente leitura; credenciais SMTP não são editadas nessa tela.
- [CONFIRMADO] O construtor recebe host, destinatários, contato, referência/texto, assunto e origem do e-mail.
- [CONFIRMADO] Destinatários separados por ponto e vírgula são transformados em linhas e validados como lista antes do envio.
- [CONFIRMADO] Assunto, introdução e conclusão recebem defaults do contexto do Usuário/Parâmetros carregados pelo sistema.
- [CONFIRMADO] A composição substitui placeholders de referência, introdução, conclusão e contato no HTML gerado.
- [CONFIRMADO] O envio direto usa a configuração SMTP resolvida para o Usuário/Filial, não valores fornecidos livremente no modal.
- [CONFIRMADO] Orçamentos abre a janela por `sbnEnviarOrcamentoClick` em `fmorcamentos.pas` e gera o corpo por `MontarOrcamento` usando cabeçalho, Produtos e Serviços.
- [CONFIRMADO] O botão de Orçamentos fica disponível para documento salvo e Situação Aberto (`A`), além da autorização de analista de crédito aplicada pelo fluxo.
- [CONFIRMADO] Após a ação, Orçamentos cria um Atendimento descrevendo envio ou agendamento e atualiza a listagem de Atendimentos.
- [CONFIRMADO] Contratos também abre `TfrmEnviarEmail` e usa a mesma função de composição, demonstrando que a capacidade é compartilhada no legado.
- [CONFIRMADO] Quando `UsaitecLUX` está inativo, a janela envia diretamente via SMTP.
- [CONFIRMADO] Quando `UsaitecLUX` está ativo e a origem é Orçamento, a janela não envia por SMTP; o chamador grava uma solicitação em `email_orcamento`.
- [CONFIRMADO] `GravarEmailOrcamento` obtém o próximo valor da sequence `email_orcamento_codigo_seq` e grava `codigo`, `orcamento`, `introducao`, `conclusao` e `emaildestinatario`.
- [CONFIRMADO] A query Delphi de `email_orcamento` seleciona registros por `orcamento`.
- [DIVERGENTE] No modo iTecLUX, o Delphi apresenta Assunto e Referência editáveis, mas esses valores não são gravados em `email_orcamento`; portanto, não influenciam o consumidor externo por esse caminho.
- [POSSÍVEL BUG LEGADO] A propriedade `Enviou` é marcada antes de todas as confirmações/validações no handler Delphi. Não reproduzir essa ordem; sucesso deve refletir efeito persistido ou entrega real.

Inspecione especialmente:

- a janela compartilhada `fmenviaremail.pas/.dfm`;
- os chamadores em `fmorcamentos.pas/.dfm` e `fmcadastrocontratos.pas/.dfm`;
- o data module de Orçamentos e as queries `qryEmail_Orcamento` e `qryEmail_Orcamento_Proximo`;
- `MontarOrcamento` e os parâmetros de textos finais/iniciais;
- a definição e resolução de `UsaitecLUX`;
- autorização de analista de crédito, permissões e criação de Atendimento.

## Estado atual confirmado no Laravel

- [CONFIRMADO] O Cadastro de Orçamentos possui comando “Enviar por e-mail”.
- [CONFIRMADO] O frontend usa `window.prompt` para obter um único e-mail e envia `POST` imediatamente.
- [CONFIRMADO] A rota atual delega ao controller de impressão/envio de Orçamentos.
- [CONFIRMADO] O controller valida apenas um campo `email`, monta os dados do Orçamento e usa `Mail::to(...)->send(...)` de forma síncrona.
- [CONFIRMADO] O `Mailable` atual usa assunto `Orçamento <código>` e a view de impressão como corpo HTML.
- [CONFIRMADO] O Laravel já possui infraestrutura e exemplos de e-mails enfileirados, inclusive `ShouldQueue`, `Mail::queue` e testes com `Mail::fake`.
- [NÃO LOCALIZADO] No fluxo atual de Orçamentos, não foi localizada seleção por `UsaitecLUX` nem inserção em `email_orcamento`.
- [NÃO LOCALIZADO] Não foi localizada idempotência da solicitação.
- [NÃO LOCALIZADO] Não foi localizado registro de Atendimento após o envio atual.
- [DIVERGENTE] O endpoint atual exige apenas a permissão genérica usada para visualização, enquanto o destino requer permissão específica de envio e as precondições do documento.

Inspecione a implementação Laravel atual do Cadastro de Orçamentos, command bar, page service, controller de impressão, `Mailable`, view HTML, rotas, policies, serviços de Atendimento, resolução de parâmetros/Filial e testes relacionados. Reutilize padrões existentes de modal, requests, queue, autorização e Atendimento.

## Experiência do Usuário

Substitua o `window.prompt` por um modal genérico de envio de documento.

O modal deve apresentar:

1. identificação do documento: `Orçamento <código>`;
2. modo de envio resolvido pelo backend: `Envio pelo site/e-commerce` ou `Envio pelo sistema`;
3. campo `Para` com múltiplos destinatários;
4. Assunto;
5. Introdução;
6. Referência;
7. Conclusão;
8. pré-visualização do corpo HTML completo;
9. ação Enviar e ação Cancelar;
10. feedback inequívoco de validação, solicitação aceita, envio enfileirado ou falha imediata.

### Destinatários

- Preencher inicialmente com o e-mail registrado no próprio Orçamento.
- Se o Orçamento não tiver e-mail, deixar o campo vazio.
- Não usar automaticamente o e-mail do Usuário logado como destinatário.
- Aceitar múltiplos endereços, um por linha ou separados por ponto e vírgula.
- Normalizar espaços e separadores de forma determinística.
- Validar todos os endereços no frontend para feedback e novamente no backend por segurança.
- Rejeitar a solicitação inteira quando qualquer destinatário for inválido; não enviar parcialmente.
- Não implementar CC nem CCO nesta etapa.
- Definir limites explícitos de quantidade e tamanho total compatíveis com o banco, mailer e segurança da aplicação.

### Defaults e edição

- Assunto padrão: `Orçamento <código>`.
- Referência padrão: `Orçamento`.
- Introdução e Conclusão: carregar os textos configurados para envio de Orçamentos, quando existirem.
- Na ausência de configuração, usar defaults neutros e não bloquear o envio.
- O corpo estruturado do Orçamento é gerado pelo sistema e não pode ser editado livremente.
- A prévia deve refletir os campos editáveis sem permitir injeção de HTML/script.

No modo Laravel:

- Assunto, Introdução, Referência e Conclusão são editáveis.

No modo site/e-commerce:

- Introdução e Conclusão permanecem editáveis porque são persistidas em `email_orcamento`.
- Assunto e Referência são somente leitura, com indicação de que o modelo final é produzido pelo site/e-commerce.
- Não prometa que a prévia local é uma reprodução pixel a pixel do e-mail externo; informe a limitação quando aplicável.

### Comportamento do modal

- Resolver defaults e modo no backend a partir do Orçamento e do contexto autorizado.
- Não expor host SMTP, usuário SMTP, senha, token ou remetente técnico.
- Desabilitar Enviar enquanto a requisição estiver em andamento.
- Manter os valores informados quando houver erro de validação ou falha imediata.
- Fechar o modal somente após a solicitação ser aceita/persistida.
- Exibir mensagem compatível com o modo: `envio solicitado ao site` ou `envio enfileirado`.
- Não afirmar “e-mail enviado” quando houve apenas gravação em outbox ou entrada em fila.

## Elegibilidade e autorização

A ação de Orçamentos deve estar disponível somente quando:

- o Orçamento já estiver persistido;
- a Situação for Aberto (`A`);
- não houver alterações locais ainda não salvas que tornem a prévia divergente do estado autoritativo, salvo se a arquitetura definir snapshot validado e seguro;
- o Usuário possuir permissão específica para enviar Orçamento;
- a autorização de analista de crédito tiver sido satisfeita quando exigida pelo mesmo fluxo do Delphi.

O backend deve repetir todas as verificações. Ocultar ou desabilitar o botão não substitui autorização server-side.

Defina claramente a permissão/capability sem acoplá-la à permissão de Contratos ou de futuros consumidores.

## Arquitetura genérica

Modele uma capacidade de `Envio de Documento` com poucas costuras e responsabilidades claras.

O contexto/adaptador de cada documento deve fornecer, no mínimo:

- tipo e identidade do documento;
- título/assunto/defaults;
- destinatários sugeridos;
- textos configurados;
- capacidades de edição por modo;
- elegibilidade e autorização;
- Filial/estabelecimento responsável;
- dados autoritativos para composição;
- compositor/renderizador do corpo;
- dados necessários ao registro de Atendimento;
- rota de retorno e correlação da solicitação.

O núcleo genérico deve cuidar de:

- contrato do modal;
- parsing e validação da lista de destinatários;
- resolução da estratégia de entrega;
- idempotência e correlação;
- representação de estados/resultados;
- dispatch para o adaptador de entrega;
- observabilidade segura.

O adaptador de Orçamentos deve cuidar de:

- regras de situação e autorização próprias;
- consulta autoritativa do Orçamento;
- defaults e textos de Orçamento;
- composição dos Produtos, Serviços, planos e demais dados confirmados;
- integração com `email_orcamento`;
- registro de Atendimento vinculado ao Orçamento.

Não espalhe condicionais como `if tipo == orçamento/contrato` pelo núcleo. Prove a extensibilidade do contrato com um segundo contexto falso ou fixture de contrato, sem alterar a tela real de Contratos.

## Resolução automática do modo

O Usuário não escolhe a estratégia.

- Resolver `UsaitecLUX` no backend usando a fonte autoritativa já adotada pelo sistema e o contexto correto de Filial/estabelecimento.
- Retornar ao modal apenas o modo funcional e as capacidades de edição; não expor detalhes de configuração.
- Revalidar o modo no envio para impedir uso de estado antigo ou manipulado pelo navegador.
- Definir comportamento seguro se o parâmetro mudar entre abertura e submissão.

### Modo site/e-commerce

Quando `UsaitecLUX` estiver ativo:

1. validar elegibilidade, autorização, destinatários e idempotência;
2. obter o próximo código pela estratégia compatível com `email_orcamento_codigo_seq`;
3. inserir atomicamente em `email_orcamento` os campos esperados pelo consumidor legado: `codigo`, `orcamento`, `introducao`, `conclusao` e `emaildestinatario`;
4. preservar o formato de múltiplos destinatários que o consumidor externo espera, comprovando-o por evidência;
5. não enfileirar e-mail no Laravel;
6. registrar Atendimento como `envio solicitado/agendado` somente depois da inserção bem-sucedida;
7. retornar sucesso de solicitação, não sucesso de entrega.

Não alterar o schema nem o consumidor do site/e-commerce nesta entrega. Caso a tabela possua constraints, colunas ou gatilhos adicionais, documente-os e respeite-os.

Não invente confirmação de entrega externa se não existir canal comprovado de retorno. A inserção bem-sucedida significa apenas que o consumidor externo recebeu uma solicitação persistida.

### Modo Laravel

Quando `UsaitecLUX` estiver inativo:

1. validar elegibilidade, autorização, destinatários e idempotência;
2. persistir/correlacionar a solicitação antes do dispatch, conforme padrão confiável do projeto;
3. enfileirar o envio depois do commit da transação relevante;
4. gerar o corpo a partir de dados autoritativos e de um snapshot coerente dos campos de composição;
5. usar configuração de mail/remetente resolvida no servidor para a Filial/ambiente;
6. enviar a mesma mensagem a todos os destinatários sem expor endereços indevidamente entre si; especifique se serão mensagens individuais ou recipients ocultos conforme padrões e privacidade do ERP;
7. registrar Atendimento `enviado` apenas após aceitação bem-sucedida pelo transporte de e-mail;
8. em falha definitiva, registrar Atendimento/estado `falha no envio` com mensagem segura;
9. aplicar política explícita e limitada de tentativas/backoff;
10. nunca gravar credenciais ou corpo sensível integral em logs.

Defina com precisão que sucesso do mail transport não comprova leitura nem entrega final na caixa postal.

## Composição HTML

Documente a equivalência entre `MontarOrcamento` e o template Laravel atual.

A composição deve considerar, conforme evidência do legado e regras atuais:

- identidade e dados do Orçamento;
- Cliente/parte contratante;
- Filial/estabelecimento e dados de contato;
- Produtos;
- Serviços;
- plano/parcelas selecionados quando aplicáveis;
- totais e condições comerciais;
- Introdução, Referência, Conclusão e Contato;
- textos finais parametrizados;
- escaping, links e formatação para clientes de e-mail.

Crie uma matriz Delphi × Laravel para cada bloco do documento. Classifique ausências e divergências; não copie HTML antigo literalmente quando a regra pode ser preservada com template acessível e responsivo.

A prévia e o envio Laravel devem usar o mesmo compositor/contrato para evitar divergência. Não mantenha duas implementações independentes do corpo.

## Idempotência e concorrência

- Cada abertura válida do modal deve receber um identificador único de solicitação.
- Repetir a mesma submissão por duplo clique, retry HTTP, refresh ou timeout não pode criar outra linha em `email_orcamento`, outro job ou outro Atendimento.
- Um reenvio intencional continua permitido ao reabrir o modal e obter nova identificação.
- A chave deve vincular Usuário, tipo/identidade do documento e solicitação, sem depender somente do conteúdo do e-mail.
- O backend é a autoridade sobre consumo da chave.
- Defina prazo de validade e comportamento de chaves abandonadas.
- Proteja a criação da solicitação e o dispatch contra concorrência.
- Jobs devem ser seguros para retry e não duplicar envio/Atendimento após sucesso já confirmado.

Se o schema legado não comportar uma chave idempotente em `email_orcamento`, proponha mecanismo auxiliar no Laravel sem exigir alteração do consumidor externo.

## Atendimento, Auditoria e observabilidade

Não confunda os gatilhos `_log_new` de Auditoria de tabelas com o Atendimento funcional. Ambos podem coexistir.

Para cada solicitação, correlacione:

- identificador da solicitação;
- Orçamento;
- Usuário solicitante;
- Filial;
- modo de entrega;
- destinatários normalizados;
- assunto efetivo quando aplicável;
- datas de criação, enfileiramento, sucesso e falha;
- tentativa atual e erro técnico sanitizado.

Regras de Atendimento:

- modo site/e-commerce: criar `envio solicitado/agendado` após o insert em `email_orcamento`;
- modo Laravel: criar `enviado` somente após sucesso do job;
- modo Laravel com falha definitiva: registrar `falha no envio` de forma visível e segura;
- idempotência deve impedir Atendimento duplicado;
- não duplicar todo o HTML no texto do Atendimento;
- registrar destinatários, assunto/contexto e estado em linguagem útil ao Usuário;
- atualizar a aba/listagem de Atendimentos após o resultado que já estiver disponível e permitir que resultados assíncronos apareçam ao recarregar/consultar.

Defina métricas e logs para solicitações, filas, duração, tentativas e falhas, sempre redigindo credenciais e dados excessivamente sensíveis.

## Contratos de API

Especifique endpoints separados ou um contrato coeso para:

1. obter contexto/defaults/prévia autorizada do modal;
2. atualizar a prévia quando campos editáveis mudarem, se necessário;
3. submeter uma solicitação idempotente;
4. consultar o estado da solicitação quando o modo for assíncrono.

Para cada endpoint, defina:

- autorização;
- request e response;
- normalização;
- códigos HTTP;
- erros de validação, inelegibilidade, conflito, configuração e infraestrutura;
- tratamento de parâmetro ou documento alterado;
- proteção CSRF/rate limiting aplicável;
- comportamento idempotente.

Não confiar em HTML, modo, Filial, permissões ou identidade de documento enviados livremente pelo navegador.

## User stories obrigatórias

A spec deve conter uma lista extensa e numerada, cobrindo no mínimo:

1. abrir o modal a partir de Orçamento salvo e aberto;
2. não disponibilizar envio para Orçamento novo, não salvo ou não aberto;
3. respeitar permissão específica e autorização de analista de crédito;
4. sugerir o e-mail do Orçamento;
5. abrir sem destinatário quando não houver e-mail;
6. informar múltiplos destinatários;
7. receber validação precisa para endereço inválido;
8. visualizar e editar os campos permitidos;
9. visualizar o corpo completo antes de enviar;
10. compreender qual modo será usado;
11. solicitar envio pelo site/e-commerce;
12. enfileirar envio pelo Laravel;
13. não duplicar solicitação por interação repetida;
14. realizar reenvio intencional;
15. receber feedback correto sem falso sucesso;
16. consultar o Atendimento correspondente;
17. identificar falha definitiva de envio Laravel;
18. preservar segurança das configurações SMTP;
19. manter equivalência funcional do documento Delphi;
20. reutilizar a capacidade futuramente em Contratos sem recriar o modal.

Amplie essa lista para cobrir todos os fluxos felizes, alternativos, falhas, segurança, concorrência e acessibilidade.

## Testes e costura principal

Use como costura funcional principal, no nível mais alto possível:

`abrir modal de um Orçamento autorizado → conferir contexto/defaults → submeter uma solicitação única → observar a estratégia automática → verificar efeito externo persistido/enfileirado → verificar feedback e Atendimento correlacionado`.

Prefira testes de comportamento externo a testes de detalhes internos.

Cubra pelo menos:

### Modal e validação

- abertura com defaults e e-mail do Orçamento;
- ausência de destinatário sugerido;
- múltiplos e-mails por linha e ponto e vírgula;
- normalização e rejeição atômica de lista inválida;
- capacidades editáveis diferentes por modo;
- prévia sem execução de script/HTML inseguro;
- preservação de dados após erro;
- acessibilidade de foco, rótulos, teclado, loading e mensagens.

### Elegibilidade e segurança

- Orçamento não salvo ou Situação diferente de `A`;
- permissão ausente;
- autorização de crédito não satisfeita;
- chamadas diretas ao endpoint sem autorização;
- modo/Filial/documento adulterados no request;
- segredos ausentes das respostas e logs.

### Site/e-commerce

- `UsaitecLUX` ativo seleciona somente a estratégia `email_orcamento`;
- insert com sequence e campos corretos;
- nenhuma mensagem Laravel enfileirada;
- Atendimento `solicitado/agendado` após commit;
- falha de banco não produz falso sucesso nem Atendimento de sucesso;
- repetição da mesma chave não duplica linha nem Atendimento.

### Laravel/queue

- `UsaitecLUX` inativo enfileira e não envia sincronamente;
- composição e assunto corretos;
- destinatários tratados conforme decisão de privacidade;
- job após commit;
- sucesso registra Atendimento `enviado` uma única vez;
- retry não duplica envio já concluído;
- falha transitória respeita backoff/tentativas;
- falha definitiva registra estado seguro;
- testes usam fake do mail/queue e não enviam e-mail real.

### Reuso

- contrato genérico funciona com contexto de Orçamento;
- segundo contexto falso prova que modal e orquestração não dependem de classes/campos de Orçamentos;
- nenhum teste exige integração real de Contratos nesta entrega.

Reutilize os padrões de testes Feature do Cadastro de Orçamentos, testes de `Mailable`/fila e testes dos serviços de Atendimento já existentes no Laravel.

## Critérios de aceite

1. O `window.prompt` deixa de ser o fluxo de envio do Orçamento.
2. O modal exibe contexto, modo, destinatários, campos de composição e prévia.
3. O backend sugere o e-mail do Orçamento e valida múltiplos destinatários.
4. O Usuário não escolhe nem adultera o modo de entrega.
5. `UsaitecLUX` ativo gera exatamente uma solicitação compatível em `email_orcamento` e nenhum e-mail Laravel.
6. `UsaitecLUX` inativo gera exatamente um envio enfileirado e nenhuma linha no outbox do site.
7. Assunto/Referência são somente leitura no modo externo e editáveis no modo Laravel.
8. O corpo é HTML, sem PDF/anexos, e a prévia usa a mesma composição do envio Laravel.
9. Nenhum segredo SMTP é exposto ao navegador.
10. Permissão, Situação, persistência do documento e autorização de crédito são verificadas no backend.
11. Repetição acidental não duplica outbox, job, envio nem Atendimento.
12. Reenvio intencional é possível com nova solicitação.
13. O sistema diferencia solicitado, enfileirado, enviado e falhou.
14. Atendimento representa o resultado real de cada estratégia e não duplica o HTML.
15. Testes não dependem de SMTP, queue worker ou site/e-commerce reais.
16. O núcleo genérico não depende diretamente de Orçamentos e é comprovado por um segundo contexto de teste.
17. Contratos e outros módulos não são alterados nesta entrega.

## Decisões de implementação a registrar na spec

A spec deve explicitar, sem fixar nomes de arquivos:

- módulos e responsabilidades;
- contrato do contexto genérico;
- contrato dos adaptadores de entrega;
- fonte autoritativa de `UsaitecLUX` e resolução por Filial;
- fonte dos textos parametrizados;
- endpoints e payloads;
- armazenamento da idempotência e dos estados;
- estratégia de fila, tentativas e after-commit;
- integração com `email_orcamento` e sequence;
- compositor único de prévia/envio;
- criação de Atendimento;
- política de privacidade para múltiplos destinatários;
- tratamento de concorrência e falhas;
- seams e fixtures de teste.

Quando uma dessas decisões não puder ser comprovada no código, marque-a como DÚVIDA e proponha uma decisão segura, sem inventar comportamento legado.

## Fora de escopo

- Integrar a tela Laravel de Contratos ou outros módulos.
- Alterar Delphi.
- Alterar o site/e-commerce ou seu consumidor de `email_orcamento`.
- Implementar confirmação de leitura/entrega na caixa postal.
- Anexar PDF, XML, imagens ou outros arquivos.
- Implementar CC ou CCO.
- Permitir edição de host SMTP, usuário, senha, token ou remetente técnico.
- Reproduzir bugs ou limitações inócuas do Delphi.
- Fazer redesign geral do documento de impressão fora do necessário para equivalência e segurança do e-mail.

## Formato esperado da especificação

Produza obrigatoriamente:

1. Problem Statement;
2. Solution;
3. User Stories extensas e numeradas;
4. Implementation Decisions;
5. Testing Decisions;
6. Out of Scope;
7. Further Notes;
8. matriz de evidências Delphi × Laravel;
9. estados da solicitação e transições por estratégia;
10. contratos de API;
11. critérios de aceite verificáveis;
12. dúvidas remanescentes claramente separadas de requisitos.
```
