# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica para implementar no Laravel a Aplicação de Questionários após a gravação do Orçamento, usando o Cadastro de Questionários já existente e construindo um aplicador reutilizável futuramente por Contratos e frente de caixa.

Não implemente nesta etapa. Produza uma especificação pronta para planejamento e implementação. Inspecione o Delphi e o Laravel antes de concluir e corrija qualquer hipótese deste prompt que seja contrariada por evidência concreta.

## Vocabulário

- `Questionário`: modelo cadastrado que define descrição, vigência, disponibilidade, repetição, perguntas, tipos e opções.
- `Aplicação de Questionário`: ocorrência em que um Questionário vigente é apresentado a um Cliente no contexto de um documento, preservando a fotografia do modelo, respostas, situação e vínculo documental.
- `Aplicador de Questionários`: interface e serviço reutilizáveis que criam/retomam uma Aplicação, apresentam perguntas, validam e persistem respostas.
- `Documento de origem`: Orçamento nesta entrega; futuramente Contrato ou documento do frente de caixa.
- `Identidade documental canônica`: identidade usada para evitar duplicidade entre documentos equivalentes, especialmente Orçamento e Contrato derivado.

Não confunda o Cadastro do modelo com a aplicação respondida.

## Regras de evidência

Analise PAS e DFM conjuntamente, incluindo formulário, data module, queries, SQL, parâmetros, eventos, validação, navegação, persistência, botão manual, geração de Contrato e chamadas do frente de caixa.

Compare com o Laravel existente: Cadastro de Questionários, repositories, services, policies, requests, tipos TypeScript, testes, gravação do Orçamento e infraestrutura de Parâmetros do Sistema.

Classifique toda descoberta relevante como:

- CONFIRMADO;
- INFERIDO;
- DÚVIDA;
- NÃO LOCALIZADO;
- DIVERGENTE;
- POSSÍVEL BUG LEGADO;
- DECISÃO NOVA.

Toda conclusão deve indicar evidência concreta. Não transforme automaticamente limitações ou bugs do Delphi em requisitos.

## Evidência Delphi confirmada

### Gatilho no Orçamento

- [CONFIRMADO] Após a persistência bem-sucedida do Orçamento, quando a origem da gravação é a tela de Orçamentos, o Delphi chama `AcionarTelaEnquete` com Cliente, tipo, código do Orçamento e Contrato vinculado.
- [CONFIRMADO] O Orçamento já está gravado quando a janela é aberta.
- [CONFIRMADO] Falha ou interrupção da Enquete não reverte a gravação anterior do Orçamento.
- [CONFIRMADO] O fluxo de geração de Contrato a partir do Orçamento também chama o aplicador depois de persistir e vincular o Contrato.
- [CONFIRMADO] Existe botão manual no Orçamento para visualizar respostas anteriores e permitir alteração conforme a Situação do Orçamento/Contrato.

### Seleção automática do Questionário

- [CONFIRMADO] Na forma de abertura automática, o Delphi resolve um único modelo por `Parametros_Valor('QUESTIONARIO ATUAL', filialbase)`.
- [CONFIRMADO] O Questionário precisa estar marcado como disponível.
- [CONFIRMADO] `data_inicio <= agora <= data_fim`.
- [CONFIRMADO] `data_inativo` nula ou futura mantém elegibilidade.
- [CONFIRMADO] A Filial base é enviada à consulta do Questionário.
- [DÚVIDA] Confirme no Laravel a precedência global/Filial do Parâmetro e como tratar valor inexistente, inválido ou apontando para modelo inelegível.

### Elegibilidade do Cliente

- [CONFIRMADO] O Delphi resolve Cliente/tipo por uma visão que abrange os tipos aceitos pelo sistema.
- [CONFIRMADO] Quando o tipo é `C`, respeita `clientes.naoresponderquestionarios`; se verdadeiro, não abre.
- [CONFIRMADO] Sem Cliente resolvido, a tela não é apresentada.
- [CONFIRMADO] O Delphi não grava uma justificativa para a não aplicação.
- [DECISÃO NOVA] No Laravel, sem Cliente identificado ou com “Não responder questionários”, não abrir e não registrar motivo; isso não é erro de gravação.

### Repetição

- [CONFIRMADO] Quando `respondermaisdeumavez` está desativado, a existência de qualquer resposta daquele Questionário para o Cliente/tipo impede nova aplicação, independentemente do documento.
- [CONFIRMADO] Quando está ativado, o Cliente pode responder em outro documento, mas não no mesmo Orçamento ou Contrato.
- [CONFIRMADO] A consulta também reconhece como duplicada uma resposta do Orçamento que originou o Contrato consultado.
- [DECISÃO NOVA] Preservar essa semântica com uma identidade documental canônica explícita, evitando regras SQL espalhadas.

### Tipos e respostas

- [CONFIRMADO] O Delphi suporta perguntas `múltipla`, `única` e `texto`.
- [CONFIRMADO] Pergunta múltipla grava uma linha por opção selecionada e remove opções desmarcadas.
- [CONFIRMADO] Pergunta única conserva uma opção e remove as demais.
- [CONFIRMADO] Pergunta de texto usa a opção técnica associada e grava conteúdo livre.
- [CONFIRMADO] Perguntas de escolha podem exibir texto de justificativa conforme `justificativa`.
- [CONFIRMADO] `respostas_clientes` relaciona opção, Cliente, tipo, texto, Orçamento e Contrato.
- [CONFIRMADO] O Delphi salva respostas durante a navegação entre perguntas e perpetra ao concluir.

### Validação e fechamento

- [CONFIRMADO] Todas as perguntas precisam estar respondidas para concluir.
- [CONFIRMADO] Texto exige conteúdo não vazio.
- [CONFIRMADO] Escolha única exige alguma opção e múltipla exige ao menos uma.
- [POSSÍVEL BUG LEGADO] A validação Delphi não exige o texto de justificativa mesmo quando `justificativa` está marcada.
- [DECISÃO NOVA] No Laravel, justificativa configurada será obrigatória.
- [CONFIRMADO] O Delphi impede o fechamento normal da janela enquanto a validação não tiver sucesso.
- [DECISÃO NOVA] O Laravel também não oferecerá “Responder depois”. Interrupção forçada deve deixar aplicação pendente e recuperável.

### Histórico

- [CONFIRMADO] O botão manual usa forma de abertura de visualização e pode habilitar edição quando Orçamento está aberto ou Contrato está em Situação permitida.
- [CONFIRMADO] O histórico legado depende das referências atuais a perguntas/opções do Cadastro.
- [DECISÃO NOVA] Cada aplicação Laravel preservará fotografia completa do modelo para impedir que edições futuras alterem o significado histórico.

## Estado Laravel confirmado

- [CONFIRMADO] O Cadastro de Questionários Laravel já está implementado.
- [CONFIRMADO] O agregado cadastral contém descrição, tipo, disponibilidade, início, fim, inativação, texto descritivo, `respondermaisdeumavez`, perguntas e opções.
- [CONFIRMADO] Os tipos TypeScript são `única`, `múltipla` e `texto`.
- [CONFIRMADO] Perguntas possuem descrição, tipo, justificativa, sequência e opções sequenciadas.
- [CONFIRMADO] O Cadastro possui validações, transações, Permissões, lookup, status temporal, detecção de concorrência e testes Feature.
- [CONFIRMADO] O repository calcula uma revisão do agregado cadastral e preserva códigos de perguntas/opções mantidas durante edição.
- [NÃO LOCALIZADO] Agregado Laravel de Aplicação de Questionário.
- [NÃO LOCALIZADO] Repository/service para `respostas_clientes` no fluxo de Vendas.
- [NÃO LOCALIZADO] Rotas de criar/retomar/concluir aplicação.
- [NÃO LOCALIZADO] Modal aplicador reutilizável.
- [NÃO LOCALIZADO] Integração com a resposta autoritativa da gravação do Orçamento.
- [NÃO LOCALIZADO] Recuperação de aplicação pendente no acesso ao Orçamento.
- [NÃO LOCALIZADO] Histórico/edição de respostas no Cadastro de Orçamentos.

## Solução funcional obrigatória

### 1. Separação de responsabilidades

Mantenha três fronteiras:

1. Cadastro de Questionários: cria e altera modelos futuros.
2. Aplicação de Questionário: ocorrência durável vinculada a Cliente/documento, com fotografia e situação.
3. Aplicador: UI/serviço reutilizável para responder, concluir, visualizar e editar quando autorizado.

O Aplicador não deve importar regras internas do Cadastro de Orçamentos. O consumidor fornece contexto por uma interface/adaptador.

### 2. Elegibilidade após gravação

Depois de o Orçamento ser gravado com sucesso, resolver autoritativamente:

1. existe Cliente identificado e tipo válido?
2. sendo tipo `C`, “Não responder questionários” está desativado?
3. `QUESTIONARIO ATUAL` resolve um código para a Filial efetiva?
4. o modelo existe, está disponível, vigente e não inativo?
5. a regra de repetição permite aplicação neste Cliente/documento?
6. já existe aplicação pendente ou concluída equivalente?

Resultados:

- inelegível: retornar gravação normal, sem modal, sem aviso e sem registro de motivo;
- aplicação pendente existente: retomá-la;
- concluída que impede repetição: não abrir nova;
- elegível sem aplicação: criar uma única aplicação pendente com fotografia do modelo.

Não permita que requests concorrentes criem duas aplicações para a mesma chave de repetição.

### 3. Semântica de repetição

Defina chaves únicas/invariantes:

- `respondermaisdeumavez = false`: Questionário + Cliente + tipo do Cliente.
- `respondermaisdeumavez = true`: Questionário + Cliente + tipo + identidade documental canônica.

A identidade documental canônica deve tratar o Orçamento e o Contrato dele derivado como a mesma ocorrência. Se a aplicação começou no Orçamento, a criação do Contrato não cria outra. Se o Contrato for o primeiro contexto elegível, deve ser possível relacionar sua aplicação ao Orçamento de origem quando existir.

Para futuro frente de caixa, venda sem Cliente não é elegível. Venda com Cliente terá identidade própria, salvo vínculo comprovado com Orçamento/Contrato que determine equivalência.

### 4. Fotografia histórica

Ao criar a aplicação, persistir uma fotografia independente das linhas mutáveis do Cadastro:

- código do modelo de origem;
- descrição e texto/instruções;
- configuração de repetição no momento da criação;
- Filial e timestamps;
- sequência de perguntas;
- código de origem, enunciado, tipo e flag de justificativa de cada pergunta;
- sequência, código de origem e texto das opções;
- versão/hash da fotografia.

Respostas devem referenciar itens da fotografia, não depender exclusivamente dos códigos atuais do Cadastro.

Uma alteração, inativação ou exclusão posterior do modelo não modifica nem impede a leitura da aplicação histórica. Uma aplicação já pendente continua usando a fotografia criada. A nova versão do modelo só vale para aplicações futuras.

### 5. Situação e ciclo de vida

Modele pelo menos:

- pendente;
- concluída.

Se necessário, proponha situação invalidada/cancelada somente com caso de negócio comprovado; não a invente para registrar não aplicação.

A aplicação pendente deve conter:

- identidade estável;
- source context/documento;
- Cliente/tipo;
- Filial;
- Usuário que iniciou;
- timestamps de criação/última alteração;
- fotografia;
- respostas parciais;
- revisão para concorrência.

Conclusão só ocorre após validação integral no backend e registra Usuário/data/hora de conclusão.

### 6. Aplicador reutilizável

Implemente conceitualmente uma modal/frame reutilizável, sem layout Delphi obrigatório.

Requisitos:

- título, descrição e instruções do Questionário;
- identificação resumida do Cliente e documento;
- uma pergunta por etapa ou agrupamento responsivo que preserve clareza;
- indicador de progresso;
- anterior/próximo/concluir;
- escolha única acessível;
- escolha múltipla acessível;
- texto com limites e contador quando aplicável;
- justificativa vinculada à pergunta de escolha;
- erros ao lado da pergunta;
- foco previsível;
- navegação por teclado e leitores de tela;
- proteção contra duplo clique/resposta tardia;
- estado de salvamento visível;
- falha recuperável sem perder o Orçamento.

Não incluir botão “Responder depois” nem fechamento comum. Escape, botão X, clique fora e navegação da aplicação não podem ignorar a pendência.

### 7. Validação das respostas

Revalidar no backend contra a fotografia:

- texto: trim não vazio;
- única: exatamente uma opção pertencente à pergunta;
- múltipla: uma ou mais opções distintas pertencentes à pergunta;
- justificativa: trim não vazio quando configurada;
- nenhuma opção de outra aplicação/pergunta;
- todas as perguntas da fotografia presentes;
- nenhuma pergunta desconhecida adicionada pelo navegador.

Defina limites de texto com base no schema existente ou em decisão explícita. Não truncar silenciosamente.

### 8. Persistência parcial e conclusão

Como interrupção forçada deve ser recuperável, prefira persistência durável durante a navegação:

- salvar a pergunta atual ao avançar/voltar; ou
- autosave serializado com indicador e confirmação antes de avançar.

Não marcar como concluída até validar tudo. Comandos precisam ser idempotentes e revisionados.

Se salvar uma resposta falhar:

- manter a modal;
- mostrar erro útil;
- não exibir conclusão falsa;
- permitir tentar novamente;
- não alterar o Orçamento gravado.

### 9. Integração com gravação do Orçamento

Não acople a transação do Questionário à transação do Orçamento.

Fluxo esperado:

1. validar e gravar o Orçamento atomicamente;
2. consolidar seu código/revisão e vínculos;
3. resolver/criar/retomar a Aplicação de Questionário;
4. retornar snapshot autoritativo do Orçamento e metadados da aplicação pendente;
5. estabelecer o Orçamento como salvo na interface;
6. abrir imediatamente o Aplicador obrigatório;
7. concluir respostas em comandos próprios;
8. após conclusão, liberar navegação e atualizar o indicador/histórico.

Se a preparação do Questionário falhar tecnicamente depois da gravação:

- não reverter o Orçamento;
- não afirmar que não há Questionário;
- mostrar erro e permitir retry obrigatório da resolução;
- persistir/recuperar estado suficiente para que o próximo acesso reavalie a pendência.

### 10. Bloqueio e recuperação

Não existe adiamento voluntário.

- bloquear fechamento comum da modal;
- bloquear navegação interna e ações conflitantes;
- alertar antes de unload/fechamento de aba quando possível;
- reconhecer que o navegador pode ser encerrado à força;
- no próximo acesso ao mesmo Orçamento, consultar pendências antes de liberar trabalho normal;
- reabrir a mesma aplicação e respostas parciais;
- não criar duplicata;
- não bloquear o acesso indefinidamente por erro irrecuperável: oferecer retry e diagnóstico seguro, mantendo a obrigação.

Especifique como rotas diretas e refresh detectam a pendência no backend, não apenas por estado React.

### 11. Histórico, botão manual e edição

O Orçamento deve expor ação manual de Questionários.

Modo histórico:

- listar aplicações vinculadas ao Orçamento/identidade canônica e Cliente conforme escopo definido;
- mostrar modelo, situação, datas e responsável;
- renderizar pela fotografia;
- abrir concluída como somente leitura por padrão.

Edição:

- exige Permissão específica;
- exige que o documento contextual esteja em Situação editável;
- usa revisão otimista/lock;
- valida as mesmas regras;
- mantém Auditoria de antes/depois, Usuário e data;
- não altera a fotografia para acompanhar o Cadastro atual;
- não cria nova aplicação apenas para corrigir respostas, salvo decisão comprovada.

### 12. Permissões e Auditoria

Separe ao menos:

- responder/concluir aplicação obrigatória dentro do fluxo autorizado do documento;
- visualizar histórico;
- editar respostas concluídas.

Reutilize a autorização do documento para iniciar/responder quando apropriado, mas não use apenas controles visuais. Toda escrita deve validar no backend.

O sistema novo possui triggers `_log_new` para Auditoria. Preserve essa trilha e não duplique o mesmo evento em outra Auditoria de aplicação. Se uma tabela nova exigir trigger seguindo o padrão, registre isso como requisito de implementação/migration, sem executar aqui.

### 13. Contrato contextual reutilizável

Defina uma interface de contexto mínima, sem caminhos de arquivos, contendo conceitualmente:

- tipo do documento (`orcamento`, futuro `contrato`, futuro `frente_caixa`);
- identidade do documento e revisão;
- identidade documental canônica;
- Cliente e tipo;
- Filial;
- Situação/editabilidade;
- Usuário/Permissões;
- rota/ação de retorno após conclusão;
- metadados de exibição.

O núcleo de elegibilidade, fotografia, validação, persistência, histórico e UI não deve conhecer campos específicos de Orçamento.

Implemente nesta entrega somente o adaptador do Orçamento. Contrato e frente de caixa devem ficar com contract tests/interfaces documentadas, sem integração de tela.

## Contratos de API

Especifique APIs/comandos para:

1. resolver ou criar/retomar aplicação após a gravação;
2. obter aplicação e fotografia;
3. salvar respostas parciais;
4. concluir aplicação;
5. listar histórico por contexto;
6. obter aplicação concluída;
7. editar respostas quando autorizado;
8. consultar pendência ao abrir o Orçamento.

Inclua:

- ids estáveis;
- revisão esperada;
- idempotency key quando necessária;
- códigos de erro estáveis;
- resposta autoritativa com situação, respostas e nova revisão.

Defina respostas para:

- sem aplicação elegível;
- aplicação pendente criada;
- aplicação pendente retomada;
- já concluída/não repetível;
- Cliente opt-out;
- parâmetro/modelo inválido;
- resposta incompleta/inválida;
- opção fora da fotografia;
- conflito de revisão;
- Permissão negada;
- documento não editável para edição histórica;
- falha de persistência;
- comando repetido.

Não precisa retornar nem persistir motivo de não aplicação para o domínio; os códigos técnicos da resposta podem apenas orientar o fluxo interno sem gerar histórico de negócio.

## Costura principal de teste

Use como costura de comportamento no nível mais alto possível:

`abrir/incluir Orçamento com Cliente elegível → gravar pelo fluxo real → backend persistir Orçamento e criar/retomar aplicação → modal obrigatória abrir → responder todos os tipos → concluir → liberar navegação → reabrir Orçamento → visualizar histórico idêntico à fotografia e respostas persistidas`.

Use uma costura complementar de recuperação:

`gravar Orçamento → responder parcialmente → simular encerramento forçado → abrir novamente o Orçamento → mesma aplicação pendente reabrir com respostas salvas → concluir sem duplicidade`.

Essas costuras devem atravessar interface, endpoint, parâmetros e persistência real. Testes unitários de helpers não substituem o comportamento completo.

## Testing Decisions

### Elegibilidade

- `QUESTIONARIO ATUAL` global e por Filial conforme precedência existente;
- parâmetro ausente, zero, inválido ou modelo inexistente;
- disponível/indisponível;
- antes de `data_inicio`, nos limites e após `data_fim`;
- `data_inativo` nula, futura e efetiva;
- Orçamento com Cliente `C` elegível;
- Cliente com `naoresponderquestionarios`;
- Orçamento sem Cliente;
- tipos `F`/`L` conforme evidência e regras de Cliente do Orçamento;
- nenhuma gravação de motivo de não aplicação.

### Repetição

- não repetível sem resposta anterior;
- não repetível já respondido em outro documento do Cliente;
- repetível em novo Orçamento;
- repetível no mesmo Orçamento não duplica;
- resposta do Orçamento impede duplicata no Contrato derivado;
- requests concorrentes criam uma única aplicação;
- pendente é retomada em vez de recriada.

### Perguntas

- texto válido, vazio e somente espaços;
- única com zero, uma e múltiplas opções adulteradas;
- múltipla com zero, uma e várias opções;
- opção repetida;
- opção de outra pergunta/aplicação;
- justificativa obrigatória presente/ausente;
- sequência preservada;
- questionário sem perguntas não elegível/erro de modelo conforme decisão.

### Fotografia

- alterar enunciado após criar aplicação;
- reordenar perguntas/opções;
- excluir opção;
- inativar/excluir modelo;
- aplicação pendente e concluída continuam renderizando a fotografia original;
- nova aplicação usa o novo modelo.

### Integração e obrigatoriedade

- Orçamento salva antes do Questionário;
- falha do Questionário não reverte Orçamento;
- modal abre após sucesso;
- não existe “Responder depois”;
- X, Escape, backdrop e navegação bloqueados;
- falha técnica mantém obrigação e oferece retry;
- conclusão libera navegação;
- atalho/botões conflitantes não operam durante modal.

### Recuperação e concorrência

- interrupção antes da primeira resposta;
- interrupção após resposta parcial;
- refresh e rota direta;
- duas abas na mesma aplicação;
- revisão desatualizada;
- duplo clique em concluir;
- retry HTTP/idempotency;
- nenhuma resposta ou aplicação duplicada.

### Histórico e edição

- botão manual sem aplicações;
- pendente e concluída;
- visualização pela fotografia;
- sem Permissão de visualização;
- com/sem Permissão de edição;
- documento editável/não editável;
- alteração concorrente;
- Auditoria criada uma vez pelos mecanismos padrão.

### Reuso

- contract test do contexto de Orçamento;
- contract test conceitual/fixture para futuro Contrato;
- contract test conceitual/fixture para frente de caixa com Cliente;
- frente de caixa sem Cliente não elegível;
- núcleo compartilhado não depende de campos específicos do Orçamento.

Reutilize os testes Feature existentes do Cadastro de Questionários e da gravação de Orçamentos como prior art. Adicione testes de componente/página para a modal e testes Feature para o novo agregado de aplicação.

## User stories obrigatórias

Inclua uma lista extensa e numerada cobrindo, no mínimo:

1. aplicar Questionário após gravar Orçamento;
2. manter Orçamento salvo diante de falha;
3. resolver modelo por Filial;
4. respeitar vigência/disponibilidade/inativação;
5. respeitar Cliente sem questionário;
6. não aplicar sem Cliente;
7. não registrar motivo de não aplicação;
8. respeitar repetição por Cliente/documento;
9. evitar duplicidade Orçamento–Contrato;
10. preservar fotografia histórica;
11. responder texto, única e múltipla;
12. exigir justificativa configurada;
13. navegar com progresso e acessibilidade;
14. impedir adiamento e fechamento comum;
15. recuperar interrupção forçada;
16. salvar parcialmente sem concluir;
17. concluir somente respostas válidas;
18. visualizar histórico;
19. editar com Permissão e documento editável;
20. auditar alterações;
21. tratar concorrência/idempotência;
22. reutilizar o aplicador por contexto;
23. preparar Contrato/frente de caixa sem integrá-los agora;
24. manter Cadastro e aplicação desacoplados.

Amplie para todos os fluxos felizes, limites, falhas, parâmetros, permissões, concorrência e acessibilidade.

## Critérios de aceite

1. Gravar Orçamento elegível cria ou retoma exatamente uma Aplicação de Questionário.
2. O Orçamento permanece salvo independentemente da conclusão do Questionário.
3. O Questionário é resolvido por `QUESTIONARIO ATUAL` e Filial, respeitando vigência e disponibilidade.
4. Sem Cliente ou com opt-out não há modal nem registro de motivo.
5. Repetição desativada aplica uma vez por Cliente; ativada, uma vez por identidade documental.
6. Orçamento e Contrato derivado não geram aplicação duplicada.
7. A aplicação preserva fotografia completa e estável do modelo.
8. Todos os tipos de pergunta são validados no backend.
9. Justificativa configurada é obrigatória.
10. Não existe ação “Responder depois” ou fechamento comum da pendência.
11. Interrupção forçada reabre a mesma aplicação com respostas parciais.
12. Conclusão é atômica, revisionada e idempotente.
13. Falha de resposta não produz conclusão falsa nem reverte o Orçamento.
14. O histórico renderiza pela fotografia, não pelo Cadastro atual.
15. Edição concluída exige Permissão e documento editável.
16. Concorrência não sobrescreve respostas silenciosamente.
17. Auditoria segue os triggers/padrões existentes sem duplicidade.
18. Aplicador e serviços são reutilizáveis via contexto, sem dependência direta de Orçamento.
19. Somente o adaptador do Orçamento é integrado nesta entrega.
20. Testes de tela+backend e recuperação passam no nível mais alto.

## Implementation Decisions a registrar

Sem fixar caminhos de arquivos, explicite:

- agregado e schema da Aplicação de Questionário;
- estados e invariantes;
- chave de repetição e identidade documental canônica;
- resolução do Parâmetro por Filial;
- estrutura/versionamento da fotografia;
- representação das respostas e justificativas;
- persistência parcial e conclusão;
- contrato de bloqueio/recuperação;
- integração pós-gravação do Orçamento;
- APIs e erros;
- Permissões e Auditoria;
- concorrência e idempotência;
- interface contextual reutilizável;
- costuras e fixtures de teste;
- migrations mínimas necessárias, sem executá-las na especificação.

## Out of Scope

- Alterar o Delphi.
- Implementar durante `/speckit.specify`.
- Integrar agora o Aplicador em Contratos ou frente de caixa.
- Migrar Checklists de Equipamentos/Ordem de Serviço.
- Redesenhar integralmente o Cadastro de Questionários.
- Registrar motivo de não aplicação.
- Reverter Orçamento gravado por falha no Questionário.
- Permitir “Responder depois”.
- Copiar a interface visual limitada do Delphi.
- Executar migrations nesta etapa.

## Formato esperado

Produza obrigatoriamente:

1. Problem Statement;
2. Solution;
3. User Stories extensas e numeradas;
4. Implementation Decisions;
5. Testing Decisions;
6. Out of Scope;
7. Further Notes;
8. matriz de evidências Delphi × Laravel;
9. modelo de domínio e estados da Aplicação;
10. matriz de elegibilidade e repetição;
11. estrutura da fotografia histórica;
12. sequência pós-gravação e recuperação;
13. contratos de API e erros;
14. matriz de Permissões e Auditoria;
15. contrato de reuso por contexto;
16. critérios de aceite verificáveis;
17. dúvidas remanescentes separadas dos requisitos.
```
