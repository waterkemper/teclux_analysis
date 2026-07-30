# Console de Operações Laravel

Label: ready-for-agent
Status: ready-for-agent

## Problem Statement

Administradores do Sistema precisam acompanhar e intervir em filas Redis, Processadores, jobs, relatórios pesados e tarefas agendadas sem recorrer a terminal, banco de dados, Redis ou conhecimento informal da implantação. Hoje os workers Docker e o scheduler executam o trabalho, mas não oferecem uma visão administrativa unificada de saúde, pendências, histórico, alertas, retenção ou resultado das intervenções.

As primitivas nativas do Laravel e do Horizon não bastam como produto administrativo seguro. Jobs legados não possuem identidade durável ou cancelamento genérico; excluir metadados não interrompe trabalho; banco e Redis não compartilham transação; payloads podem conter dados sensíveis; e uma ação concorrente pode já ter mudado de estado quando o Administrador confirma. Expor diretamente Horizon, comandos Artisan ou payloads criaria risco de vazamento, duplicidade, perda de evidência e controle além das garantias reais.

O sistema também possui filas com envelopes diferentes: `marketplace-sync/default` usa prioridade, três tentativas e timeout de 120 segundos, enquanto `heavy-reports` usa uma tentativa, timeout de 600 segundos e maior memória. A migração precisa preservar esse comportamento, permitir rollback e manter ambientes isolados. A solução deve ainda registrar tarefas em código, limitar alterações a presets seguros, entregar alertas externos e aplicar retenção sem apagar auditoria.

## Solution

Construir uma Console de Operações isolada por ambiente e disponível somente para Administradores do Sistema. A experiência será integralmente em português brasileiro, começará por um resumo de Saúde Operacional e uma caixa de Pendências Acionáveis, e oferecerá visões secundárias de Filas, Grupos de Processadores, Tarefas Operacionais, Programações Operacionais, Execuções, Alertas e Auditoria.

Usar Horizon como fundação para supervisão Redis, observação atual, métricas e primitivas de falha, sempre encapsulado por uma camada de aplicação própria. Essa camada manterá Execuções Operacionais e Tentativas de Execução duráveis, Resumos Operacionais sanitizados, níveis explícitos de gestão, comandos idempotentes, reconciliação entre banco e Redis, auditoria imutável, alertas e retenção. O dashboard nativo do Horizon não será a interface de produção.

Todos os jobs serão observáveis quando tecnicamente possível, mas somente capacidades comprovadas serão oferecidas. A primeira versão tornará `heavy-reports` Gerenciado, Controlável e Reconciliável; os demais jobs legados permanecerão como Jobs Observados. Todas as tarefas atuais serão migradas para um Registro de Tarefas Operacionais em código, com presets predefinidos e um único tick durável.

Toda mutação exigirá autorização no servidor. Ações destrutivas também exigirão senha recente, frase digitada vinculada ao alvo, motivo obrigatório, desafio de uso único, idempotência, controle de concorrência e Ação Administrativa append-only. Alertas usarão e-mail e webhook genérico assinado. Retenção separará payload transitório, histórico sanitizado, métricas agregadas, alertas e auditoria.

## User Stories

1. Como Administrador do Sistema, quero abrir a Console de Operações, para entender a condição atual da plataforma sem usar terminal.
2. Como usuário que não é Administrador do Sistema, quero ter todas as rotas e operações recusadas pelo servidor, para que ocultar o menu não seja tratado como autorização.
3. Como Administrador do Sistema, quero ver o ambiente em todas as páginas e confirmações, para não confundir produção, homologação e desenvolvimento.
4. Como Administrador do Sistema, quero que uma Console controle somente seu próprio ambiente, para impedir ações cruzadas.
5. Como Administrador do Sistema, quero usar toda a Console em português brasileiro, para operar com terminologia consistente.
6. Como Administrador do Sistema, quero ver quando os dados foram atualizados, para reconhecer informação atrasada.
7. Como Administrador do Sistema, quero ver Saúde Operacional geral ao entrar, para priorizar diagnóstico.
8. Como Administrador do Sistema, quero distinguir Saudável, Atenção, Crítica e Desconhecida, para não interpretar ausência de telemetria como saúde.
9. Como Administrador do Sistema, quero ver Pendências Acionáveis antes de métricas decorativas, para agir sobre o que exige decisão.
10. Como Administrador do Sistema, quero abrir uma Pendência Acionável e chegar ao recurso afetado, para investigar rapidamente.
11. Como Administrador do Sistema, quero ver uma linha do tempo sanitizada, para compreender tentativas, mudanças e intervenções.
12. Como Administrador do Sistema, quero navegar por Filas, Grupos de Processadores, Tarefas, Programações, Histórico e Auditoria, para aprofundar o diagnóstico.
13. Como Administrador do Sistema, quero usar a Console por teclado e leitor de tela, para que o fluxo administrativo seja acessível.
14. Como Administrador do Sistema, quero que estados não dependam somente de cor, para compreender severidade com segurança.
15. Como Administrador do Sistema, quero ver todas as filas cadastradas, para conhecer backlog, idade e consumo.
16. Como Administrador do Sistema, quero ver a idade do job pendente mais antigo por Fila, para avaliar violação do orçamento operacional.
17. Como Administrador do Sistema, quero ver profundidade, crescimento, throughput, saturação e falhas como contexto, para interpretar o sinal principal.
18. Como Administrador do Sistema, quero ver Grupos de Processadores e heartbeats esperados, para identificar ausência ou crash loop.
19. Como Administrador do Sistema, quero pausar uma Fila ou Grupo permitido, para impedir novas reservas sem interromper Tentativas em execução.
20. Como Administrador do Sistema, quero retomar uma Fila ou Grupo pausado, para restaurar o consumo de forma idempotente.
21. Como Administrador do Sistema, quero distinguir estado pretendido e observado, para não presumir que uma ação no Horizon já convergiu.
22. Como Administrador do Sistema, quero ver jobs legados como Jobs Observados, para obter diagnóstico sem falsas garantias.
23. Como Administrador do Sistema, quero que ações individuais ausentes sejam explicadas pelo Nível de Gestão Operacional, para saber por que um Job Observado é somente leitura.
24. Como Administrador do Sistema, quero acompanhar uma Execução Operacional por identidade estável, para não confundi-la com jobs transitórios ou retentativas.
25. Como Administrador do Sistema, quero ver cada Tentativa de Execução separadamente, para diagnosticar falha e retentativa sem duplicar a intenção.
26. Como Administrador do Sistema, quero ver progresso sanitizado de relatórios pesados, para acompanhar etapa, percentual ou estado Indeterminado.
27. Como Administrador do Sistema, quero tentar novamente somente resultados elegíveis, para não repetir efeitos não idempotentes.
28. Como Administrador do Sistema, quero excluir um trabalho pendente gerenciado antes da reserva, para impedir processamento que ainda não começou.
29. Como Administrador do Sistema, quero que a exclusão seja recusada se o job já foi reservado, para não receber sucesso falso.
30. Como Administrador do Sistema, quero solicitar cancelamento cooperativo de relatório pesado, para interrompê-lo no próximo Checkpoint Operacional seguro.
31. Como Administrador do Sistema, quero solicitar suspensão cooperativa de relatório pesado, para retomá-lo depois a partir de cursor persistido.
32. Como Administrador do Sistema, quero ver quanto tempo uma família pode levar para observar o pedido, para entender que cancelamento não é kill imediato.
33. Como Administrador do Sistema, quero bloquear nova tentativa quando o resultado estiver indeterminado, para reconciliar antes de produzir efeito duplicado.
34. Como Administrador do Sistema, quero ver todas as Tarefas Operacionais registradas, para administrar somente executores aprovados em código.
35. Como Administrador do Sistema, quero ver a Programação Operacional padrão e efetiva, para distinguir código de override.
36. Como Administrador do Sistema, quero habilitar ou desabilitar uma tarefa, para controlar somente ocorrências futuras.
37. Como Administrador do Sistema, quero escolher apenas presets permitidos pela tarefa, para alterar frequência sem escrever cron.
38. Como Administrador do Sistema, quero alterar somente fusos permitidos, para preservar limites definidos em código.
39. Como Administrador do Sistema, quero pré-visualizar próximas ocorrências e impacto, para conferir uma alteração antes de salvar.
40. Como Administrador do Sistema, quero restaurar a programação padrão, para remover o override administrativo.
41. Como Administrador do Sistema, quero iniciar manualmente apenas tarefas que declaram essa capacidade, para não executar comandos arbitrários.
42. Como Administrador do Sistema, quero que execução manual respeite os mesmos locks e políticas de sobreposição, para não duplicar trabalho.
43. Como Administrador do Sistema, quero ver ocorrências perdidas sem backfill automático, para decidir conscientemente a ação permitida.
44. Como Administrador do Sistema, quero que alterações futuras não mudem ocorrências já criadas, para preservar a história.
45. Como Administrador do Sistema, quero que uma tarefa removida do código gere alerta de configuração órfã, para corrigir o override sem executá-lo.
46. Como Administrador do Sistema, quero ver Alertas Operacionais deduplicados, para não receber uma ocorrência nova a cada avaliação.
47. Como Administrador do Sistema, quero reconhecer um Alerta Operacional com nota, para registrar que alguém assumiu o acompanhamento.
48. Como Administrador do Sistema, quero que reconhecimento não fabrique resolução, para manter a condição aberta até recuperação real.
49. Como Administrador do Sistema, quero receber aviso de abertura, escalada crítica e normalização, para acompanhar todo o incidente.
50. Como Administrador do Sistema, quero criar Janela de Manutenção Operacional limitada, para suspender entregas externas sem esconder o alerta.
51. Como Administrador do Sistema, quero testar e-mail e webhook separadamente, para ativar somente canais funcionais.
52. Como integrador autorizado, quero validar assinatura HMAC, timestamp e identidade do webhook, para rejeitar adulteração e replay.
53. Como Administrador do Sistema, quero que falha de um canal não bloqueie o outro, para manter entrega disponível.
54. Como Administrador do Sistema, quero ajustar thresholds apenas dentro de limites seguros, para calibrar o ambiente sem criar regras arbitrárias.
55. Como Administrador do Sistema, quero reautenticar com minha senha antes de ação destrutiva, para comprovar intenção recente.
56. Como Administrador do Sistema, quero digitar uma frase que contenha verbo e alvo, para confirmar exatamente o impacto.
57. Como Administrador do Sistema, quero informar motivo obrigatório, para deixar contexto útil na auditoria.
58. Como Administrador do Sistema, quero que uma confirmação expire e não seja reutilizada em outro alvo, para limitar sua autoridade.
59. Como Administrador do Sistema, quero que duplo clique ou retry HTTP devolva o resultado anterior, para não repetir o efeito.
60. Como Administrador do Sistema, quero que revisão obsoleta seja recusada, para não sobrescrever mudança concorrente.
61. Como Administrador do Sistema, quero acompanhar comandos em Reconciliação necessária, para não interpretar falha parcial como sucesso.
62. Como auditor, quero consultar Ações Administrativas imutáveis, para conhecer ator, ambiente, alvo, motivo, confirmação e resultado.
63. Como auditor, quero que senha, payload, token e segredo nunca sejam persistidos na auditoria, para minimizar dados sensíveis.
64. Como Administrador do Sistema, quero consultar histórico de sucessos por 30 dias, para analisar operação recente.
65. Como Administrador do Sistema, quero consultar falhas, cancelamentos, suspensões definitivas e exclusões por 90 dias, para investigar exceções.
66. Como Administrador do Sistema, quero consultar Alertas Operacionais e versões de programação por 13 meses, para comparar ciclos anuais.
67. Como auditor, quero preservar a trilha administrativa mínima por cinco anos, para manter evidência independente do detalhe operacional.
68. Como Administrador do Sistema, quero executar Exclusão Imediata Operacional sobre dados terminais elegíveis, para reduzir exposição antes do prazo automático.
69. Como responsável por conformidade, quero aplicar Preservação Operacional com escopo e prazo, para impedir expurgo enquanto existir obrigação ativa.
70. Como Administrador do Sistema, quero que exclusão imediata seja recusada sob preservação ativa, para não destruir evidência protegida.
71. Como Administrador do Sistema, quero exportações criptografadas que expirem em 24 horas, para compartilhar diagnóstico sem criar arquivo permanente.
72. Como operador de implantação, quero migrar `heavy-reports` antes das filas normais, para validar Horizon em um envelope isolado.
73. Como operador de implantação, quero impedir workers legados e Horizon de consumir o mesmo envelope, para evitar comportamento ambíguo.
74. Como operador de implantação, quero encerrar Horizon graciosamente em deploy, para concluir trabalho ativo antes do novo processo.
75. Como operador de implantação, quero validar a versão do worker por heartbeat, para saber que o código novo está consumindo.
76. Como operador de implantação, quero reativar o worker legado por envelope, para executar rollback sem reescrever jobs pendentes.
77. Como operador de implantação, quero compatibilidade de payload com a versão anterior, para que rollback continue possível.
78. Como responsável pelo produto, quero rollout por flags independentes, para desativar mutações sem perder observação.
79. Como responsável pelo produto, quero gates mensuráveis de staging, canário e produção, para não liberar somente por impressão subjetiva.
80. Como responsável pelo produto, quero que qualquer defeito crítico de segurança, duplicidade, perda, auditoria ou rollback bloqueie a release, para proteger a operação.

## Implementation Decisions

- A Console será um módulo administrativo próprio, isolado por ambiente, com uma única fachada de aplicação para consultas e Comandos Administrativos Operacionais. Controllers e componentes não acessarão Redis, Horizon ou payloads diretamente.
- Horizon será instalado na versão oficial compatível com Laravel 13 e encapsulado por adaptadores documentados. Ele será fonte transitória de supervisão, estado atual, falhas e métricas, não fonte canônica de histórico.
- O dashboard nativo do Horizon ficará desabilitado em produção. A Console não dependerá de endpoints HTTP internos ou não documentados do Horizon.
- A autorização será aplicada no servidor a cada consulta, exportação e comando. Somente Administradores do Sistema terão acesso; nenhum bypass de suporte ou break-glass será criado.
- A identidade da aplicação e do ambiente participará de prefixes Redis, nomes de masters/supervisores, métricas, cache, links e escopo dos comandos. Uma implantação não descobrirá nem controlará outra.
- Execução Operacional será a intenção durável de trabalho; Tentativa de Execução representará cada processamento técnico. A retentativa reutilizará a Execução e criará nova Tentativa.
- Jobs adotarão níveis cumulativos Observado, Gerenciado, Controlável e Reconciliável. A API calculará ações a partir do nível declarado e do estado atual.
- A primeira família integralmente gerenciada será `heavy-reports`. Marketplace será apenas observado nesta release, embora sua evolução posterior passe primeiro por Gerenciado; Busca Assistida também ficará fora da gestão individual inicial.
- O contrato gerenciado será composto por dispatcher oficial, middleware de fila e interfaces de capacidade, sem classe-base obrigatória. Despacho fora do serviço oficial falhará em desenvolvimento e testes.
- Toda Execução Gerenciada nascerá no banco com chave de idempotência antes do despacho after-commit. Falha de publicação manterá Aguardando despacho para reconciliação.
- Resumos Operacionais serão projeções versionadas e allowlisted no momento da escrita. Nunca serão reconstruídos de payload, modelos serializados ou stack trace.
- Progresso aceitará etapa em pt-BR, percentual opcional monotônico por Tentativa, contagens, heartbeat e nota limitada. Quando não houver cálculo honesto, o estado será Indeterminado.
- Cancelamento e suspensão serão cooperativos. Cada família Controlável declarará Checkpoints Operacionais, cursor quando retomável e tempo máximo de resposta. Cancelamento será terminal; suspensão encerrará a Tentativa e retomada criará outra.
- Exclusão pendente exigirá identidade durável e remoção atômica por identidade, estado e revisão antes da reserva. Depois da reserva, somente controles cooperativos declarados serão aceitos.
- Elegibilidade de retentativa será declarada pela família e pelo resultado tipado, nunca inferida da mensagem da exceção. Resultado indeterminado bloqueará retry até reconciliação.
- Um Registro de Tarefas Operacionais versionado em código conterá chave estável, nome e descrição pt-BR, executor imutável, programação padrão, presets, fusos permitidos, política de sobreposição, timeout, risco e disponibilidade por ambiente.
- O Administrador poderá alterar somente ativação, preset permitido, parâmetros tipados do preset e fuso permitido. Comando, argumentos e cron livre nunca serão editáveis.
- Os presets globais serão a cada 5, 15 ou 30 minutos, horário, diário, semanal e mensal; cada tarefa exporá somente seu subconjunto e limites seguros.
- Um único tick durável calculará Ocorrências Programadas, adquirirá lease atômico e criará Execuções Agendadas por chave única de tarefa, janela e fuso. Após a migração, definições legadas equivalentes não poderão continuar ativas.
- Execução Manual usará o mesmo dispatcher, autorização, locks e histórico. O padrão durante sobreposição será recusar; enfileirar ou paralelizar exigirá declaração explícita da tarefa.
- Toda mutação será representada por Comando Administrativo Operacional durável, com chave de idempotência e hash do conteúdo. Repetição idêntica devolverá o resultado anterior; reutilização da chave com outro conteúdo será conflito.
- Ações destrutivas exigirão validação de senha no servidor, Desafio de Confirmação Operacional de uso único por cinco minutos, frase com verbo e alvo em pt-BR e motivo de 10 a 500 caracteres.
- O desafio será vinculado a ator, ambiente, ação, alvo, revisão e hash do conteúdo. Alterar qualquer elemento invalidará a confirmação.
- Estado e revisão serão revalidados sob lock ou compare-and-swap. Divergência encerrará como Recusada ou Sem efeito, sem forçar a transição.
- Como banco e Redis não compartilham transação, o comando será persistido como Pendente antes do efeito. Falha intermediária produzirá Reconciliação necessária, retomada pela mesma identidade.
- A auditoria inicial será fail-closed e append-only. Guardará ator, IP, agente, sessão, ambiente, correlação, motivo, frase, instante da reautenticação, transições sanitizadas e resultado por alvo, nunca senha ou payload.
- Operações em lote usarão snapshot imutável de filtro, identidades, revisões, contagem e impacto. O resultado poderá ser parcial e será registrado por item.
- Saúde de Fila usará idade do pendente mais antigo como sinal primário e orçamento por Fila. `default/marketplace-sync` degradará inicialmente em 2 minutos e ficará crítica em 10; `heavy-reports` em 15 e 45 minutos.
- Grupo de Processadores degradará após dois heartbeats ausentes e ficará crítico após dois minutos sem consumidor esperado ou em crash loop. O scheduler degradará após dois minutos e ficará crítico após cinco.
- Saúde desconhecida será distinta de saudável. Histerese exigirá amostras consecutivas e recuperação sustentada abaixo do limite inferior por cinco minutos.
- Alertas serão duráveis e deduplicados por ambiente, versão da regra, tipo e recurso. O ciclo será Aberto, Reconhecido e Resolvido; reconhecimento não produzirá recuperação.
- E-mail e webhook serão canais independentes por ambiente, entregues por outbox. Webhook exigirá HTTPS, segredo criptografado, HMAC-SHA256 de timestamp, identidade e corpo, além de janela anti-replay.
- Janela de Manutenção Operacional terá motivo, início/fim e duração máxima de 24 horas. Ela suspenderá entrega externa esperada sem ocultar condição ou apagar alerta.
- Dois serviços Horizon preservarão os envelopes: `horizon-default` para `marketplace-sync,default`, três tentativas, timeout de 120 segundos e prioridade estrita sem balanceamento automático; `horizon-heavy-reports` para `heavy-reports`, uma tentativa, timeout de 600 segundos e envelope de 1 GiB.
- Duas conexões Laravel Redis de fila permitirão `retry_after` de 150 segundos para trabalho normal e 660 para pesado. Preflight recusará timeout maior ou igual ao `retry_after`.
- O scheduler continuará em serviço separado com `schedule:work`, contendo o tick operacional e o snapshot de métricas Horizon a cada cinco minutos.
- Deploy normal usará `horizon:terminate`, stop grace de pelo menos 180 segundos no envelope normal e 660 no pesado, e readiness que confirme supervisor, Filas, Redis, heartbeat, telemetria e versão da imagem.
- A migração ocorrerá por envelope, primeiro em staging e depois em produção. `heavy-reports` será migrado antes; workers legados e Horizon nunca consumirão o mesmo envelope durante o gate.
- Workers legados permanecerão desabilitados por uma release para rollback. O código anterior deverá desserializar payloads pendentes da release atual durante a janela expand/contract.
- Redis de filas usará política sem eviction e capacidade monitorada. Metadata Horizon terá conexão ou namespace próprio com prefixo de aplicação e ambiente.
- Retenção começará no estado terminal. Payload Redis existirá somente até consumo/remoção; payload técnico de falha e metadata Horizon falha permanecerão sete dias.
- Execuções bem-sucedidas permanecerão 30 dias; falhas, cancelamentos, suspensões definitivas, exclusões, skips e ocorrências perdidas permanecerão 90 dias.
- Versões substituídas de programação e Alertas Operacionais permanecerão 13 meses. Auditoria administrativa mínima permanecerá cinco anos.
- Métricas terão resolução de cinco minutos por 30 dias, horária por 90 dias e diária por 13 meses, sem identificadores de jobs ou dados de negócio.
- Exclusão Imediata Operacional removerá detalhe elegível, preservando tombstone e auditoria. Preservação Operacional bloqueará expurgo, terá escopo, autoridade, motivo, revisão e expiração; após liberação haverá sete dias de graça.
- Exports serão criptografados, autorizados, auditados e destruídos em até 24 horas. Backups operacionais terão ciclo máximo documentado de 35 dias e restauração reaplicará o ledger de purga antes de disponibilizar dados.
- A interface seguirá o protótipo aprovado: landing health-first, caixa de decisão proeminente, topologia secundária, detalhes sanitizados e fluxo destrutivo separado.
- A release usará flags server-side locais ao ambiente para observação, controles de Fila, controles gerenciados, mutações de programação, alertas externos e exclusão imediata. Flags poderão remover autoridade, nunca contornar segurança ou auditoria.

## Testing Decisions

- Testes verificarão comportamento observável e contratos públicos; não fixarão estrutura interna de controllers, repositories, componentes ou chamadas privadas.
- O seam principal será a fronteira HTTP/Inertia da Console, atravessando uma única fachada de aplicação. Testes Feature cobrirão autorização, ambiente, projeções pt-BR, comandos, auditoria, erros e estados apresentados ao Administrador.
- Adaptadores de Horizon, Redis, relógio, filas, scheduler, outbox e persistência terão testes de contrato menores com Redis e banco reais. Fakes serão usados na suíte principal apenas quando preservarem o mesmo contrato.
- Poucos testes de navegador cobrirão a jornada crítica: identificar incidente, inspecionar detalhe sanitizado, confirmar ação destrutiva, acompanhar reconciliação e localizar auditoria.
- Os testes existentes de autorização sensível são prior art para escopo de confirmação, recusa de reutilização e falha fechada de auditoria. A nova confirmação, porém, será do próprio ator e vinculada ao comando operacional.
- Os testes existentes de `heavy-reports` são prior art para fila, timeout de job, timeout de worker e `retry_after`; serão ampliados para as duas conexões e supervisores Horizon.
- Testes Feature administrativos existentes são prior art para permitir Administrador e recusar usuário comum no servidor.
- O contrato gerenciado testará identidade, after-commit, publicação duplicada, retry, timeout, heartbeat, progresso monotônico, sanitização, checkpoints, suspensão, retomada, cancelamento, corrida de exclusão e resultado ambíguo.
- O comando administrativo será testado sob duplo clique, retry HTTP, chave repetida com conteúdo distinto, revisão obsoleta, corrida de alvo, indisponibilidade do banco/Redis, crash entre fases e reconciliação repetida.
- Testes de segurança semearão payloads com senha, token, dados pessoais, headers, models, paths e traces, provando ausência em HTML, JSON, busca, logs da Console, métricas, alertas, webhook, export e auditoria.
- O Registro de Tarefas terá teste de inventário/paridade com todas as definições atuais. Relógio controlado cobrirá próximas ocorrências, múltiplos ticks, reinício, leases, sobreposição, alteração futura, tarefa órfã, ocorrência perdida e transições de horário de verão.
- Saúde e alertas usarão relógio determinístico para thresholds, desconhecido, histerese, deduplicação, reconhecimento, escalada, recuperação, manutenção, lembretes, outbox, assinatura, replay e falha independente de canal.
- Retenção testará cada fronteira temporal, rollup antes da exclusão, preservação, liberação e graça, purge-now, reconciliação parcial, export expirado e replay do ledger após restore.
- Compose/configuração terá testes que garantam nomes, queues, prioridade, capacidade fixa, memória, tentativas, timeouts, stop grace, prefixes por ambiente, conexão correta e desigualdade `timeout < retry_after`.
- Um ensaio production-like provará migração e rollback por envelope sem consumidor duplicado nem reescrita de payload. Compatibilidade de serialização será testada entre imagem atual e anterior.
- Testes de navegador validarão teclado, foco, semântica, contraste, indicadores não dependentes de cor, diálogos destrutivos, estados vazio/carregando/desatualizado/erro e layouts responsivos em WCAG 2.1 AA.
- Em volume representativo, landing e listas primárias deverão atingir p95 de até dois segundos; aceitação do comando, p95 de até um segundo, mantendo a execução assíncrona.
- A release será bloqueada por defeito crítico de segurança, perda de dados, efeito duplicado, retry ilimitado, auditoria ausente, bloqueador de acessibilidade, rollback falho ou divergência não explicada entre Console e infraestrutura.
- Rollout exigirá sete dias de soak em staging, 48 horas de observação read-only em produção, gates de 72 horas para controles gerenciados, programação e Filas, 14 dias de baseline antes de alertas externos de backlog e sete dias finais sem condição bloqueante.

## Out of Scope

- Execução de comandos Artisan ou argumentos arbitrários.
- Visualização de payload serializado ou dados brutos do job no navegador.
- Expressões cron personalizadas.
- Autoscaling, alteração de capacidade ou número de workers pela Console.
- Uma Console controlando mais de um ambiente de implantação.
- Encerramento individual de processo worker ou kill genérico de job em execução.
- Garantias individuais de gestão para Marketplace, Busca Assistida e demais jobs legados nesta release.
- Dashboard nativo do Horizon como interface de produção.
- Execução de tarefas não registradas ou alteração do executor de uma Tarefa Operacional.
- Backfill automático de ocorrências perdidas.
- SMS e integrações de alerta específicas de fornecedores na primeira versão.
- Bypass de suporte, modo break-glass ou endpoint alternativo sem as mesmas garantias.
- Implementação de MFA, nova política corporativa de senha ou invalidação de sessões concorrentes; o ADR existente sobre esses temas continua sem decisão.
- Implementação dentro desta PRD; o trabalho será decomposto em tickets tracer-bullet separados.

## Further Notes

- Esta PRD sintetiza o mapa Wayfinder concluído e suas dez decisões. O detalhe e a motivação permanecem nos tickets vinculados pelo mapa.
- O protótipo aprovado é deliberadamente descartável e serve como referência de fluxo, hierarquia visual e microcópia pt-BR, não como código de produção obrigatório.
- A pesquisa de capacidades do Laravel 13/Horizon é a fonte para os limites entre primitivas do framework e responsabilidades da aplicação.
- O glossário da Plataforma Laravel é normativo para Execução Operacional, Tentativa de Execução, Job Observado, Fila, Grupo de Processadores, Tarefa Operacional, Programação Operacional, Alertas, Auditoria, Retenção e demais termos.
- O ADR de evolução de autenticação permanece apenas proposto e não autoriza MFA ou mudança de senha nesta entrega. A reautenticação destrutiva usa a autenticação atual sem ampliar esse ADR.
- Próximo passo recomendado: executar `$to-tickets .scratch/laravel-operations-console-wayfinder/PRD.md` para decompor esta especificação em tickets de implementação com dependências explícitas.
