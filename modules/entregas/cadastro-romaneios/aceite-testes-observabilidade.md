# Cadastro de Romaneios — aceite, testes e observabilidade

## Propósito

Esta matriz é uma entrada obrigatória dos prompts `/speckit.specify`. Ela comprova paridade funcional e segurança da coexistência Delphi–Laravel sem transformar detalhes acidentais ou bugs do Delphi em requisitos.

## Regra de aprovação

- A suíte PostgreSQL real é obrigatória e bloqueia merge e release. Execuções ignoradas por indisponibilidade do banco não contam como aprovação.
- SQLite pode apoiar testes unitários e de interface, mas não comprova functions, triggers, sequences, locks, concorrência, transações, SQL_ASCII ou cancelamento PostgreSQL.
- Toda divergência crítica de autorização, estado, efeito financeiro, atomicidade, idempotência ou resultado entre Delphi e Laravel bloqueia o aceite.
- Estratégia de implantação gradual, feature flag e plano de retorno não fazem parte desta especificação.

## Matriz funcional

Os prompts devem transformar cada linha aplicável em cenários automatizados e indicar a evidência Delphi/schema que determina o resultado esperado.

| Área | Cenários mínimos | Resultado obrigatório |
|---|---|---|
| Cadastro | criar, consultar, alterar e excluir quando permitido; tipos Normal e Transferência; Romaneio sem e com múltiplos itens | mesmas regras, defaults, estados e efeitos canônicos |
| Itens | incluir, remover, repetir tentativa e operar volumes mínimo, típico e elevado | cardinalidade correta, sem duplicação e sem consultas por linha |
| Agenda e conferência | vínculos, RPS/ROS, recebimento, liberação e retenção em todos os estados permitidos e proibidos | functions/triggers e guards respeitados |
| Situação | todas as transições confirmadas e tentativas inválidas | transição atômica; rejeição não deixa efeito parcial |
| Contas a Pagar | parâmetro desligado/ligado, evento válido/inválido, repetição, parcela autorizada ou paga | reuso do núcleo Laravel, exatamente uma Duplicata quando aplicável e proteções financeiras preservadas |
| Relatórios | cada relatório, filtros, inclusão/exclusão de cancelados e conjuntos vazios | conteúdo e totais coerentes com a consulta canônica |
| F6 | todos os filtros isolados e combinados, paginação, ordenação, filtro vazio, resultado vazio e exportação | resultado determinístico; exportação usa o mesmo snapshot de filtros |
| Grid | ordenação, paginação/virtualização, preferências, personalização, exportação e acessibilidade | comportamento do grid ERP compartilhado |
| Operações | botões, ícones, habilitação por estado, modais, foco, dirty state e atalhos; F8 grava | padrão Laravel e nenhuma persistência inline acidental |
| Chave NF-e | colagem, digitação, scanner, máscara, dígito verificador, caracteres inválidos e valor vazio | uso exclusivo da autoridade compartilhada `NfeAccessKey`/`NfeAccessKeyInput` |

## Segurança e isolamento

- Testar usuário administrador e usuário comum com e sem grant do módulo, capability da operação e Filial autorizada.
- Proteger e testar diretamente todas as rotas, inclusive exportação, relatórios, consulta, cancelamento e endpoints de modais; ocultar botão não é autorização.
- Testar a migration idempotente da árvore **Entregas e Montagens → Entregas → Romaneios**, sem concessão automática em massa.
- Para recebimento, liberação e retenção, cobrir prova ausente, inválida, expirada, inativa, reutilizada e pertencente a outro usuário.
- Comprovar que parâmetros são carregados em lote por Filial e falham de modo fechado quando ausentes ou inválidos.

## PostgreSQL, schema e SQL

- Executar a integração contra versão compatível com o PostgreSQL 9.5.25 confirmado, incluindo SQL_ASCII quando necessário para reproduzir a origem.
- Conferir previamente o snapshot versionado de schema e falhar com diagnóstico explícito se tabela, coluna, tipo, nulabilidade, constraint, índice, sequence, trigger ou função divergir.
- Não aceitar introspecção de schema no caminho de negócio nem SQL construído sobre estrutura apenas inferida.
- Testar cada function, trigger e sequence alcançada, inclusive efeitos colaterais e erros.
- Verificar que `INNER JOIN` é usado quando a relação obrigatória e a nulabilidade comprovadas assim determinarem; toda exceção com `LEFT JOIN` deve ter cenário que demonstre a semântica de ausência.
- Cobrir arrays vazios, lotes grandes e parâmetros vinculados em `IN` ou `ANY(array)`.

## Ausência de N+1 e desempenho

- Instrumentar o contador de queries e executar o mesmo cenário com cardinalidades diferentes. O número de queries deve permanecer limitado e independente do número de linhas.
- Proibir carregamento de relação, parâmetro, autorização ou enriquecimento dentro de laço. O enriquecimento da F6 deve permanecer set-based e em lote.
- Registrar `EXPLAIN (ANALYZE, BUFFERS)` com volume representativo e comparar plano, linhas estimadas/reais, buffers e tempo com uma linha de base versionada.
- Não inventar limite fixo de milissegundos antes de medir no ambiente-alvo. O prompt deve estabelecer orçamento a partir da linha de base e falhar diante de regressão relevante de plano, volume lido, duração ou quantidade de queries.
- Validar que paginação, totalização e exportação não materializam todo o conjunto na aplicação.

## Cancelamento real da consulta F6

- O botão **Cancelar** fica disponível assim que a geração começa.
- Testar cancelamento imediato e durante contagem, consulta-base e enriquecimento; repetir o comando de cancelamento deve ser seguro.
- Confirmar no PostgreSQL que o backend correto recebeu `pg_cancel_backend` e que a query deixou de executar; abortar apenas a requisição HTTP ou ignorar a resposta não atende ao requisito.
- Um usuário ou trace não pode cancelar a consulta de outro.
- Uma nova geração invalida respostas tardias da anterior, preserva o último resultado válido e restaura os controles da tela.
- Cobrir corrida entre conclusão e cancelamento, timeout, falha do endpoint de cancelamento e encerramento inesperado da conexão.

## Concorrência, idempotência e atomicidade

- Executar escritas concorrentes Laravel–Laravel e Delphi–Laravel sobre o mesmo Romaneio, comprovando revisão otimista, locks determinísticos e rejeição da revisão desatualizada.
- Repetir cada comando mutável com a mesma chave e payload: o resultado deve ser reproduzido sem novo efeito. A mesma chave com payload diferente deve ser rejeitada.
- Injetar falha, uma etapa por vez, após mestre, itens, agenda/conferência, mudança de situação, auditoria e efeito no Contas a Pagar.
- Em qualquer falha, reverter a transação inteira: nenhum registro parcial, Duplicata órfã, situação intermediária, auditoria falsa ou chave de idempotência presa.
- Testar deadlock/lock timeout e confirmar erro recuperável, correlação e ausência de commit parcial.

## Contas a Pagar

- Exercitar Romaneio pelo mesmo serviço de domínio/repositório financeiro usado pelas operações Laravel existentes, dentro da mesma transação e sem chamada HTTP entre módulos.
- Comprovar exatamente uma Duplicata por efeito financeiro aplicável, inclusive após retry e concorrência.
- Validar que documentos/parcelas autorizados ou pagos preservam as regras mais restritivas já adotadas pelo Laravel.
- Testar rollback nos dois sentidos: falha financeira desfaz o Romaneio e falha posterior ao financeiro desfaz o documento e a Duplicata.
- Detectar divergência entre Romaneio e financeiro como falha crítica, nunca corrigi-la silenciosamente por um segundo escritor.

## Observabilidade

Emitir eventos estruturados para início, sucesso, rejeição, cancelamento e falha de comandos e consultas, além de conflitos, rollback, incompatibilidade de schema e efeito financeiro. Cada evento deve carregar, quando aplicável:

- `request_id`, `trace_id`, chave de idempotência, identificador do Romaneio, usuário e Filial;
- operação, estado anterior/novo, duração, contagem de linhas/queries e resultado;
- fase da F6, solicitação e eficácia do cancelamento;
- tipo de conflito/rollback e referência não sensível ao efeito financeiro.

Credenciais, provas de autorização, chave NF-e completa, SQL com valores vinculados e payload financeiro sensível nunca devem ser registrados. Aplicar o redator compartilhado do Laravel.

Métricas mínimas:

- duração e taxa de sucesso/erro/cancelamento da F6 por fase;
- quantidade de queries e linhas processadas;
- conflitos otimistas, deadlocks, lock timeouts e retries idempotentes;
- rollbacks e falhas do efeito financeiro;
- incompatibilidades de schema e cancelamentos que não interromperam a query.

Alertar para incompatibilidade de schema, falhas repetidas de cancelamento, timeouts anormais, aumento relevante de conflitos, rollback financeiro e divergência Romaneio–Contas a Pagar. Limiares quantitativos devem nascer de linha de base observada, não de números arbitrários.

## Evidências obrigatórias

- resultados das suítes unitária, feature, frontend/E2E e PostgreSQL;
- matriz de cenários com vínculo para teste automatizado e evidência de origem;
- contagens de queries por cardinalidade e planos `EXPLAIN (ANALYZE, BUFFERS)`;
- evidência de cancelamento no PostgreSQL;
- testes de falha injetada e concorrência sem efeitos parciais;
- inventário/schema conferido e checksum/origem do snapshot utilizado;
- relatório de acessibilidade dos fluxos de teclado e modais;
- amostras redigidas dos eventos e métricas.

