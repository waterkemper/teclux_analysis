# Remediação da primeira release da Console de Operações

Status: ready-for-agent

## Problem Statement

A primeira release da Console de Operações reúne os recursos necessários para observar e administrar Filas, Grupos de Processadores, Execuções Operacionais, Tarefas Operacionais, alertas e retenção. Entretanto, a revisão completa identificou falhas que impedem uma liberação segura: operações de retenção podem alcançar dados de outro ambiente; a Exclusão Imediata Operacional não consome um Desafio de Confirmação Operacional de uso único; a desativação de entregas externas também interrompe indevidamente a criação e atualização de Alertas Operacionais internos; agregações e versões históricas não cumprem os prazos definidos; e a consulta/exportação do histórico não escala nem exporta o conjunto completo.

Além dos riscos funcionais, a implementação concentrou validação, autorização, acesso a dados e projeção em um controlador extenso, usa resolução de dependências pelo contêiner em tempo de execução e repete contratos de autorização. Isso contraria as convenções do projeto, aumenta a divergência entre ações administrativas e torna as correções de segurança difíceis de verificar.

Administradores precisam confiar que cada ação afeta somente o ambiente selecionado, que operações destrutivas exigem confirmação forte e irrepetível, que alertas internos continuam sendo calculados independentemente dos canais externos e que o histórico apresentado ou exportado é completo, previsível e sanitizado. A release deve permanecer bloqueada até que essas garantias estejam cobertas por testes nos contratos públicos existentes.

## Solution

Endurecer o módulo existente sem redesenhar a experiência da Console. Todas as leituras e mutações operacionais passarão a carregar o ambiente como fronteira obrigatória; a Exclusão Imediata Operacional consumirá atomicamente um Desafio de Confirmação Operacional; a avaliação de saúde e a manutenção de Alertas Operacionais serão separadas das Entregas de Alerta externas; agregações serão produzidas antes do expurgo e versões de Programações Operacionais serão preservadas pelo prazo definido.

Os endpoints HTTP/Inertia, nomes de rotas e textos em português brasileiro serão preservados sempre que possível. Internamente, controladores serão divididos por recurso, validações serão movidas para Form Requests, autorização operacional será centralizada e os serviços de retenção serão decompostos atrás de uma fachada coesa. Histórico e exportação compartilharão uma consulta paginável no banco, sem carregar todos os registros em memória e sem truncamento silencioso.

## User Stories

1. Como Administrador, quero que toda operação seja limitada ao ambiente selecionado, para que dados de produção e homologação nunca sejam misturados.
2. Como Administrador, quero receber uma resposta sem revelar a existência de um alvo pertencente a outro ambiente, para que a separação ambiental também proteja metadados.
3. Como operador, quero visualizar apenas Execuções Operacionais do ambiente atual, para tomar decisões com base em uma fotografia coerente.
4. Como operador, quero que Tentativas de Execução herdem e respeitem o ambiente da Execução Operacional, para que uma tentativa não seja associada fora de sua fronteira.
5. Como Administrador, quero que a prévia de expurgo considere somente o ambiente selecionado, para que a estimativa corresponda exatamente à ação posterior.
6. Como Administrador, quero que o expurgo automático processe um ambiente explicitamente, para que uma execução agendada não apague registros de outro ambiente.
7. Como Administrador, quero que a limpeza de metadados técnicos de falha seja limitada ao ambiente informado, para evitar anonimização cruzada.
8. Como Administrador, quero que o expurgo imediato seja limitado ao ambiente, classe e alvo confirmados, para impedir exclusões mais amplas que minha intenção.
9. Como auditor, quero que restaurações, preservações e liberações de preservação respeitem a mesma fronteira ambiental, para que toda a política seja consistente.
10. Como Administrador, quero gerar um Desafio de Confirmação Operacional antes de uma Exclusão Imediata Operacional, para revisar exatamente o efeito destrutivo pretendido.
11. Como Administrador, quero que o desafio seja vinculado ao meu usuário, ambiente, ação, alvo, revisão e conteúdo confirmado, para que não possa autorizar outra intenção.
12. Como Administrador, quero que o desafio tenha prazo curto e uso único, para reduzir o risco de repetição ou reaproveitamento.
13. Como Administrador, quero que o consumo do desafio e o registro do comando destrutivo sejam atômicos, para que concorrência não permita dois usos.
14. Como auditor, quero que tentativas com desafio expirado, já usado, pertencente a outro ator ou divergente sejam registradas de forma sanitizada, para investigar ações negadas.
15. Como Administrador, quero manter a reautenticação recente, a frase de confirmação, a revisão otimista, o motivo e a idempotência, para que o desafio complemente as proteções existentes.
16. Como Administrador, quero repetir com segurança uma requisição cuja resposta foi perdida, para receber o mesmo resultado sem executar novamente a exclusão.
17. Como operador, quero que Alertas Operacionais internos continuem sendo avaliados quando entregas externas estiverem desativadas, para não perder visibilidade dentro da Console.
18. Como operador, quero que condições novas criem alertas e condições normalizadas resolvam alertas mesmo sem e-mail ou webhook, para manter o histórico interno correto.
19. Como Administrador, quero que a configuração de alertas externos controle somente a criação e o envio de Entregas de Alerta, para que não altere a semântica da saúde interna.
20. Como Administrador, quero que uma Janela de Manutenção Operacional suspenda somente entregas externas esperadas, para que condições e alertas continuem visíveis.
21. Como auditor, quero consultar Alertas Operacionais ocorridos durante uma janela de manutenção, para preservar a cronologia real da plataforma.
22. Como responsável por operações, quero que resumos agregados sejam produzidos antes que os registros detalhados sejam elegíveis ao expurgo, para não criar lacunas históricas.
23. Como responsável por operações, quero agregações de cinco minutos por trinta dias, horárias por noventa dias e diárias por treze meses, para analisar tendências no horizonte adequado.
24. Como responsável por privacidade, quero agregações sem identificadores pessoais, payloads ou dados de negócio, para que o histórico de longo prazo permaneça sanitizado.
25. Como operador, quero que a geração de agregações seja idempotente, para que retentativas e execuções concorrentes não dupliquem contagens.
26. Como auditor, quero evidência de que cada faixa detalhada foi agregada antes do expurgo, para demonstrar que a retenção não destruiu informação necessária.
27. Como Administrador, quero que cada alteração ou restauração de uma Programação Operacional preserve uma versão imutável anterior e posterior, para reconstruir a configuração efetiva no tempo.
28. Como auditor, quero consultar versões de Programações Operacionais por treze meses, para explicar quando e por que uma Tarefa Operacional mudou.
29. Como Administrador, quero que Preservações Operacionais impeçam o expurgo de versões e evidências abrangidas, para cumprir obrigações de auditoria.
30. Como Administrador, quero pesquisar o histórico com filtros combináveis de ambiente, período, ator, tipo, alvo e resultado, para localizar eventos relevantes.
31. Como Administrador, quero paginação estável e ordenação determinística executadas no banco, para navegar por grandes volumes sem registros repetidos ou ausentes.
32. Como Administrador, quero que a contagem e os resultados representem o mesmo filtro, para que a paginação seja confiável.
33. Como auditor, quero exportar todo o conjunto filtrado, inclusive quando houver mais de cem registros, para receber evidência completa.
34. Como auditor, quero que qualquer limite operacional de exportação seja explícito antes da solicitação, para que nunca haja truncamento silencioso.
35. Como Administrador, quero que exportações sejam geradas em lotes ou fluxo limitado de memória, para não degradar a Console em históricos grandes.
36. Como auditor, quero que exportações continuem criptografadas, sanitizadas, auditadas e disponíveis por vinte e quatro horas, para preservar as garantias já definidas.
37. Como usuário da Console, quero manter os mesmos endereços, nomes de rota e respostas Inertia compatíveis, para que a remediação não quebre meus fluxos existentes.
38. Como usuário brasileiro, quero que novos estados, erros, confirmações e avisos sejam apresentados em português brasileiro, para manter a interface consistente.
39. Como mantenedor, quero validação de entrada dedicada por operação, para enxergar claramente regras, autorização e mensagens de erro.
40. Como mantenedor, quero controladores pequenos organizados por recurso operacional, para que mudanças em retenção, alertas ou histórico evoluam sem conflito desnecessário.
41. Como mantenedor, quero dependências injetadas e acesso a dados encapsulado em serviços, para testar e compreender cada fluxo sem resolução implícita pelo contêiner.
42. Como mantenedor, quero um contrato central de autorização operacional, para que ambiente, revisão, motivo, idempotência e confirmação tenham semântica uniforme.
43. Como mantenedor, quero que retenção exponha uma fachada coesa apoiada por módulos internos especializados, para reduzir sua superfície conceitual sem quebrar consumidores.
44. Como responsável pela release, quero uma suíte de regressão que reproduza cada achado da revisão, para impedir que a release avance com uma correção apenas aparente.
45. Como responsável pela release, quero que a remediação altere somente a Console de Operações e seus contratos diretamente relacionados, para não misturar mudanças de Compras, Fiscal, grids, Telescope ou outros esforços.

## Implementation Decisions

- O ambiente é uma fronteira obrigatória de domínio. Consultas de Execuções Operacionais, Tentativas de Execução, Ocorrências Programadas, alertas, preservações, agregações, tombstones e exportações devem receber o ambiente explicitamente e aplicá-lo no banco.
- Identidades e restrições de unicidade que hoje possam colidir entre ambientes devem incorporar o ambiente. Registros filhos devem validar sua coerência ambiental com o agregado pai.
- A ausência ou divergência de ambiente deve falhar de forma fechada. Endpoints não devem revelar se um identificador existe em outro ambiente.
- A Exclusão Imediata Operacional reutilizará o agregado existente de Desafio de Confirmação Operacional. O desafio será persistido com hash/identidade do conteúdo confirmado, ator, ambiente, ação, alvo, revisão, expiração e instante de consumo.
- O consumo do desafio, a aquisição da chave de idempotência, a criação do Comando Administrativo Operacional e a transição destrutiva ocorrerão sob uma transação e bloqueio adequados. Uma repetição idempotente retorna o resultado persistido; um segundo uso com outra intenção é rejeitado.
- Reautenticação recente, frase de confirmação predefinida, motivo obrigatório e controle otimista de revisão continuam obrigatórios para ações destrutivas.
- A avaliação de Saúde Operacional e a sincronização de Alertas Operacionais formam o fluxo interno e sempre são executadas quando a observação operacional está habilitada. A flag de alertas externos governa somente a criação e o processamento de Entregas de Alerta.
- Janelas de Manutenção Operacional e indisponibilidade de canais externos não impedem criação, atualização, reconhecimento ou resolução de Alertas Operacionais internos.
- Agregações serão construídas continuamente por janelas fechadas, antes da elegibilidade ao expurgo, e não como efeito tardio do próprio expurgo. Uma identidade composta por ambiente, classe, granularidade, janela e versão da política impedirá duplicidade.
- A política inicial preservará agregações de cinco minutos por trinta dias, horárias por noventa dias e diárias por treze meses. A promoção entre granularidades ocorrerá antes da remoção da granularidade anterior.
- O dado agregado será allowlistado e conterá somente dimensões operacionais sanitizadas, contagens, durações e estados necessários. Não conterá payload, exceção bruta, identificadores pessoais ou dados de negócio.
- Alterações e restaurações de Programações Operacionais criarão versões imutáveis com vigência, ator, motivo, revisão e configuração anterior/posterior. A projeção atual continuará sendo a fonte da programação efetiva; o histórico de versões será preservado por treze meses ou enquanto houver Preservação Operacional aplicável.
- A pesquisa de histórico será uma projeção SQL com `UNION ALL` dos registros existentes normalizados para um contrato comum. Filtros, ordenação, contagem e paginação serão aplicados pelo banco sobre essa projeção; não será criada uma segunda cópia durável divergente somente para busca.
- A exportação reutilizará exatamente a mesma consulta e os mesmos filtros da tela. O processamento será em cursor/lotes, produzirá o conjunto completo aceito e recusará antecipadamente solicitações acima de eventual limite documentado; nunca retornará arquivo parcial como se fosse completo.
- Os contratos públicos HTTP/Inertia, nomes de rotas e formato geral das páginas serão preservados. Mudanças incompatíveis só serão aceitas quando indispensáveis para fechar uma falha de segurança e deverão produzir erro explícito em português brasileiro.
- Controladores serão separados por recurso: visão/topologia, ciclo de vida de Execuções Operacionais, Tarefas e Programações Operacionais, saúde e alertas, retenção e histórico/exportação. Eles coordenarão requests e respostas, sem consultas diretas a modelos ou construção extensa de projeções.
- Cada operação ou conjunto coeso de operações terá Form Request dedicado para validação e autorização. Não permanecerão validações inline nos controladores da Console.
- Dependências serão declaradas por injeção. A resolução dinâmica pelo contêiner não será usada para buscar serviços operacionais dentro de ações de controlador.
- Um componente central de autorização operacional normalizará ator, ambiente, alvo, revisão, motivo, reautenticação, confirmação e idempotência. As policies continuarão responsáveis pela permissão do ator; o componente aplicará as garantias adicionais da ação.
- O serviço público de retenção poderá permanecer como fachada compatível, mas delegará cálculo de elegibilidade, agregação, preservações, expurgo, restauração, projeção e auditoria a módulos internos com responsabilidades distintas.
- A Ação Administrativa e o Comando Administrativo Operacional permanecem imutáveis e sanitizados. Falhas e recusas relevantes também geram evidência sem credenciais, payloads ou segredos.
- O fixed point para a remediação será o encerramento da implementação revisada, commit `90511c54`. A revisão posterior considerará somente os commits da remediação, evitando atribuir ao esforço mudanças preexistentes e não relacionadas.

## Testing Decisions

- O seam principal será o contrato HTTP/Inertia já existente da Console. Testes Feature autenticarão um Administrador, enviarão requisições reais aos endpoints e observarão status, redirects, props, registros públicos de auditoria e efeitos operacionais. Comandos Artisan serão usados somente para gates de rollout/rollback que já sejam públicos.
- Bons testes verificarão comportamento externamente observável, não a divisão interna entre classes. Exceções são testes arquiteturais pequenos que protejam convenções objetivas: ausência de validação inline, consultas diretas a modelos e resolução dinâmica de serviços nos controladores da Console.
- Cada cenário de isolamento criará dados equivalentes em pelo menos dois ambientes, incluindo identificadores ou chaves de idempotência capazes de colidir. Listagem, prévia, expurgo automático, limpeza de metadados, Exclusão Imediata Operacional, preservação e restauração devem alterar somente o ambiente requisitado.
- Testes de confirmação cobrirão desafio válido, expirado, consumido, de outro ator, de outro ambiente, para outro alvo, revisão divergente e conteúdo divergente. Duas requisições concorrentes não poderão consumir o mesmo desafio; repetição com a mesma chave idempotente devolverá o resultado original.
- Testes de alertas executarão a sincronização com entregas externas desligadas e confirmarão criação, atualização e resolução de Alertas Operacionais internos sem Entregas de Alerta. Também cobrirão janela de manutenção e falha do canal externo.
- Testes de retenção usarão relógio determinístico e janelas de fronteira para demonstrar a sequência agregar antes de expurgar, as três granularidades, a promoção entre elas, a idempotência e a ausência de campos proibidos.
- Testes de Programações Operacionais cobrirão criação de versão em edição e restauração, ordenação temporal, retenção de treze meses e bloqueio por Preservação Operacional.
- Testes de histórico criarão volume superior a cem registros e fontes distintas. Eles verificarão filtros combinados, ordenação determinística com desempate, paginação sem repetição/lacuna, contagem exata e isolamento ambiental.
- Testes de exportação solicitarão mais de cem registros e compararão o total e os filtros com a pesquisa correspondente. Também cobrirão expiração em vinte e quatro horas, autorização, criptografia no armazenamento e recusa explícita caso exista limite máximo.
- Testes de interface serão adicionados somente onde o contrato visual mudar, especialmente no diálogo de Exclusão Imediata Operacional. Eles verificarão textos em português brasileiro, estados de carregamento/erro, foco, teclado e associação acessível das confirmações.
- A suíte relevante da Console, análise estática, formatador e build do frontend devem passar. Falhas preexistentes fora do escopo serão registradas separadamente e não poderão ser mascaradas pela remediação.
- A revisão final repetirá os dois eixos usados no diagnóstico: conformidade com as convenções do repositório e aderência integral a esta especificação.

## Out of Scope

- Adicionar novas capacidades administrativas, novos tipos de Tarefa Operacional ou novos canais externos além dos já previstos.
- Substituir Horizon, Redis, Inertia, o mecanismo geral de autenticação ou a infraestrutura de filas.
- Redesenhar visualmente toda a Console ou alterar sua navegação principal.
- Alterar payloads de jobs de negócio além do necessário para manter a sanitização e a identidade operacional já definidas.
- Corrigir módulos de Compras, Fiscal, grids, Telescope, repositórios legados, especificações 290/291 ou qualquer mudança que apenas compartilhe o intervalo histórico do review original.
- Executar o rollout real em produção ou escolher sua janela; a remediação apenas deve manter os gates técnicos existentes válidos.
- Reescrever o sistema geral de policies da aplicação fora da autorização operacional desta Console.

## Further Notes

- A release permanece bloqueada até que os achados crítico, altos e médios estejam corrigidos e cobertos nos seams públicos definidos acima.
- Toda UI nova ou alterada deve usar português brasileiro. O termo preferido é **suspensa** para uma Execução Operacional ou ação no estado correspondente.
- Dados exibidos, exportados, auditados ou enviados externamente continuam sanitizados por allowlist. Nenhuma correção autoriza leitura do payload bruto da fila.
- O trabalho deve começar a partir de `90511c54` e manter commits de remediação focados, permitindo um novo code review com fixed point inequívoco.
- Este PRD consolida os achados da revisão da release; ele não reabre decisões de produto já resolvidas no mapa original da Console de Operações.
