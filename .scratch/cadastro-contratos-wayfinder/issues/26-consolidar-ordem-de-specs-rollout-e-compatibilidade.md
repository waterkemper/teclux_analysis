Type: grilling
Status: resolved

## Question

Qual é a ordem final de `$to-spec`, implementação e ativação incremental do Cadastro de Contratos, considerando dependências entre núcleo, Cliente, comercial, financeiro, estoque, logística, faturamento, operações transversais e saídas?

Definir quais specs podem avançar em paralelo, contratos de compatibilidade com Delphi/Consulta/Orçamento, estratégia de feature flags e coexistência, preparação/migração de dados, casos dourados e critérios de aceite por etapa, observabilidade, piloto por Filial/Usuário, rollback e condição objetiva para retirar o fluxo legado, sem produzir um spec monolítico.

## Answer

## Estratégia de coexistência

- `DECISÃO NOVA` — todos os Contratos, independentemente de terem sido criados no Delphi ou Laravel, permanecem visíveis e editáveis nos dois sistemas. Não haverá propriedade exclusiva por interface, marca permanente de origem nem bloqueio que obrigue um Contrato a continuar no sistema em que nasceu.
- `CONFIRMADO` — o desenho já fixou `revision`, carregamento progressivo e gravação autoritativa no núcleo: [Delimitar núcleo, abertura, localização e gravação](03-delimitar-nucleo-abertura-localizacao-e-gravacao.md). A auditoria física existente usa triggers no banco compartilhado: [Confirmar cobertura física das triggers de auditoria do Contrato](25-confirmar-cobertura-fisica-das-triggers-de-auditoria-do-contrato.md).
- `DECISÃO NOVA` — coexistência usa concorrência otimista. Ao carregar, o Laravel captura revision/assinaturas das partes relevantes. Se Delphi, integração ou outro Usuário modificar o Contrato antes do save, a gravação Laravel falha com conflito e informa quais áreas divergiram.
- `DECISÃO NOVA` — o Laravel nunca sobrescreve mudança externa, não faz merge silencioso e não confia apenas no estado recebido pelo navegador. O Usuário deve recarregar e reaplicar conscientemente suas alterações.
- `DECISÃO NOVA` — locks de banco continuam curtos e restritos ao comando. Não haverá lock persistente entre telas Delphi/Laravel nem dual-write aplicativo; os dois operam sobre o mesmo banco legado.
- `DECISÃO NOVA` — comandos multiagregado, como reserva, faturamento, cancelamento e desmembramento, usam revision, locks transacionais e idempotency key. Alterações Delphi incompatíveis durante a preparação abortam todo o comando Laravel.

## Liberação e controle de acesso

- `DECISÃO NOVA` — o novo Cadastro será liberado para **Usuários específicos**, sem filtro por Filial, origem ou conjunto de Contratos. A permissão controla acesso ao Cadastro; capabilities internas continuam calculadas por operação, situação, parâmetros e prova sensível.
- `DECISÃO NOVA` — todos os Contratos continuam disponíveis nos dois sistemas inclusive para Usuários autorizados no Laravel. A permissão não cria uma partição de dados.
- `DECISÃO NOVA` — não haverá feature flag por Filial, chave global de emergência ou mecanismo especial de rollback de interface. Se necessário, retira-se a permissão do Usuário; Consulta e dados persistidos continuam disponíveis.
- `DECISÃO NOVA` — não haverá rollback destrutivo de dados. Correções de efeitos confirmados usam comandos compensatórios definidos no domínio; falhas antes do commit deixam a transação intacta.
- `DECISÃO NOVA` — desativar o Cadastro Delphi está fora deste esforço. Não serão definidos prazo, métrica de retirada ou condição de desligamento.

## Limite funcional da primeira liberação

- `DECISÃO NOVA` — a primeira liberação aos Usuários autorizados exige o fluxo completo `O → R → F`; não será liberada uma versão operacional limitada a `O`.
- `DECISÃO NOVA` — a entrega inclui criação/localização/edição/gravação, Cliente, produtos, serviços, proposta/parcelas, reserva, lotes/séries, conferência, logística necessária, faturamento e guardas/autorizações desse percurso.
- `DECISÃO NOVA` — Contratos `P/N` ficam disponíveis no Cadastro Laravel em modo somente leitura, com consulta, impressão, e-mail e operações transversais que suas policies permitirem.
- `DECISÃO NOVA` — emissão fiscal e transições que produzem/recalculam `P/N` permanecem no Delphi e constituem esforço Laravel posterior, conforme [Delimitar faturamento e documentos fiscais](11-delimitar-faturamento-e-documentos-fiscais.md).
- `DECISÃO NOVA` — `C` é leitura histórica e alvo das operações guardadas já definidas; nunca volta a ser editável por simples save.

## Preparação de dados e schema

- `DECISÃO NOVA` — não haverá migração em massa, cópia dos Contratos para outro banco ou conversão destrutiva. O Laravel lê e altera os registros legados existentes.
- `DECISÃO NOVA` — mudanças de schema serão aditivas e compatíveis com Delphi: tabelas auxiliares para idempotência/correlação/outbox, Contatos documentais, aplicações genéricas e metadados que não existam no legado.
- `DECISÃO NOVA` — metadados novos serão materializados sob demanda quando a entidade for lida/alterada ou por backfill seguro e repetível apenas quando necessário. Ausência do metadado não pode tornar invisível um Contrato legado.
- `DECISÃO NOVA` — migrations aditivas devem preservar triggers, PKs, sequences, funções e suposições do Delphi. Qualquer mudança em tabela compartilhada exige teste de compatibilidade de leitura e escrita pelos dois sistemas.
- `DECISÃO NOVA` — nenhuma tabela global legada será reutilizada com semântica errada por conveniência: Contatos documentais não gravam `contatosvfornecedores`, e outbox de Contrato não grava `email_orcamento` sem suporte do consumidor.

## Ordem final dos specs

Cada item abaixo recebe seu próprio `$to-spec` vertical, com backend, UI e testes. Um spec pode citar decisões de vários tickets, mas não absorver domínios posteriores.

### Etapa 1 — Fundação

1. **Núcleo, ciclo de vida e shell do Cadastro de Contratos**
   - estados `O/R/F/C`, comandos e capabilities;
   - novo/F8/F9, revision, conflito externo, carregamento progressivo;
   - geração a partir de Orçamento pelo mesmo seam;
   - envelope de auditoria/correlação;
   - acesso por Usuário autorizado e leitura `P/N`.

Esta etapa é bloqueio global. Nenhum editor mutável deve criar um segundo caminho de gravação antes de o seam autoritativo estar estável.

### Etapa 2 — Edição comercial

2. **Cliente e fotografia cadastral do Contrato**.
3. **Produtos, Serviços e motor comercial do Contrato**.
4. **Proposta financeira, planos e parcelas**.

- `DECISÃO NOVA` — Cliente e shell podem avançar em paralelo depois de definidos os DTOs da Fundação.
- `DECISÃO NOVA` — Produtos/Serviços dependem do contrato de seção e Cliente; pagamentos dependem da assinatura/totais comerciais.
- `CONFIRMADO` — casos dourados comerciais e financeiros já estão fixados em [Confirmar casos dourados do motor comercial](14-confirmar-casos-dourados-do-motor-comercial.md) e [Confirmar casos dourados do financiamento](15-confirmar-casos-dourados-do-financiamento.md).

### Etapa 3 — Estoque e reserva

5. **Reserva e movimentos do Contrato**.
6. **Lotes, séries e conferência `CTR`**.

- Reserva depende dos itens e quantidades comerciais estabilizados.
- Lotes/séries/conferência podem compartilhar contratos, mas cada engine mantém estado próprio.
- Os casos dourados obrigatórios estão em [Confirmar casos dourados de reserva, movimentos, lotes, séries e conferência](16-confirmar-casos-dourados-de-reserva-movimentos-lotes-series-e-conferencia.md).

### Etapa 4 — Logística

7. **Promessa de entrega, retirada, frete, transportadora e montagem**.
8. **Agenda e execução logística reutilizável**.

- Cotação e UI de promessa podem avançar em paralelo com parte da Etapa 3 após Produtos.
- Agenda/execução quantitativa depende de reserva e identidade estáveis.
- Os casos dourados estão em [Confirmar casos dourados de modalidades e capacidade logística](19-confirmar-casos-dourados-de-modalidades-e-capacidade-logistica.md).

### Etapa 5 — Faturamento até `F`

9. **Faturar Contrato `R → F`**.
10. **Integração com razão/Ficha Financeira e projeções documentais somente leitura**.

- Faturamento depende de comercial, parcelas, reserva, séries/conferência e guardas logísticas necessárias.
- Não inclui emissão fiscal nem transições `P/N`.

### Etapa 6 — Operações sensíveis

11. **Cancelar, reverter e integrar devolução do Contrato**.
12. **Desmembrar Contrato**.

- Cancelamento/reversão depende dos comandos compensatórios de estoque, financeiro e logística.
- Desmembramento usa os mesmos motores de rateio, parcelas e reserva; deve entrar depois deles.

### Etapa 7 — Capacidades transversais

13. **Relacionamento: Atendimentos, Contatos e Questionários**.
14. **Fotos e Anexos**.
15. **Impressão e saídas documentais**.
16. **Adapter de e-mail do Contrato**.

- Hosts/adapters somente leitura podem ser construídos em paralelo após a Fundação.
- Sua ativação final deve respeitar Cliente/revision/policies e, no e-mail iTecLUX, o outbox compatível.

### Etapa 8 — Conveniências

17. **Importar produtos de outro Contrato**.
18. **Venda perdida e demais integrações simples do shell**.

- Importação depende do editor/motor comercial.
- Venda perdida reutiliza engine existente e pode avançar antes, mas não bloqueia a primeira entrega.

### Etapa 9 — Esforço fiscal posterior

19. **Preparação e seleção fiscal**.
20. **Submissão/autorização fiscal**.
21. **Confirmação, cobertura `P/N` e compensações fiscais**.

- Esta etapa não bloqueia a primeira liberação até `F`.
- Segue [Confirmar casos dourados de seleção, cobertura e planejamento fiscal](17-confirmar-casos-dourados-de-selecao-cobertura-e-planejamento-fiscal.md) e deve permanecer dividida.

## Paralelização permitida

- `DECISÃO NOVA` — após contratos/DTOs da Fundação: Cliente, shell visual e adapters transversais somente leitura podem avançar em paralelo.
- `DECISÃO NOVA` — após Produtos: logística de promessa/cotação, Fotos e importação podem avançar; pagamentos aguardam assinatura comercial estável.
- `DECISÃO NOVA` — reserva e proposta financeira podem ser implementadas em trilhas paralelas, mas a integração `O → R` só fecha com ambas.
- `DECISÃO NOVA` — impressão, e-mail e Relacionamento não bloqueiam motores quantitativos, salvo dependências explícitas de policy/contexto.
- `DECISÃO NOVA` — faturamento, cancelamento/reversão e desmembramento não avançam para homologação isoladamente sem os motores compensatórios anteriores.
- `DECISÃO NOVA` — não manter duas implementações concorrentes da mesma regra. Orçamento e Contrato compartilham motores comercial, financiamento, conferência, frete, fotos, questionários e e-mail por adapters.

## Contratos de compatibilidade

| Superfície | Compatibilidade obrigatória |
|---|---|
| Delphi | mesmas tabelas/identidades; revision detecta alterações externas; schema aditivo |
| Orçamento | geração entra pelo seam do Cadastro; motores comerciais/financeiros compartilhados |
| Consulta de Contratos | F9 e projeções reutilizados; sem repository paralelo |
| Ficha Financeira | mesmo razão/projeções; Cadastro não duplica financeiro |
| Auditoria | triggers `_log_new` preservadas + correlation/eventos Laravel |
| Integrações | outbox/idempotência; nenhuma chamada externa dentro da transação curta |

- `DECISÃO NOVA` — cada spec declara explicitamente tabelas compartilhadas, novas tabelas, eventos, revision afetada, consumidores Delphi/Laravel e estratégia de retry.
- `DECISÃO NOVA` — fixtures/casos dourados devem ser reutilizados entre Orçamento e Contrato quando a regra é comum; divergências documentadas recebem cenário próprio.

## Gate de liberação por Usuário

O acesso só será concedido quando:

1. todos os casos dourados automatizados de `O → R → F` estiverem aprovados;
2. houver homologação manual com contratos representativos: novo, originado de Orçamento, `O`, `R`, `F`, Cliente `C/F/L`, produtos/serviços, descontos, parcelas, lotes/séries, entrega/frete e conflito Delphi–Laravel;
3. não houver defeito crítico aberto de cálculo, financeiro, estoque, concorrência ou autorização;
4. auditoria, correlation id e autoria efetiva estiverem comprovados;
5. métricas/logs cobrirem gravação, conflito de revision, reserva, faturamento, filas/outbox, retries e falhas;
6. remover a permissão de um Usuário estiver testado e não afetar Consulta/dados;
7. backup/recuperação do banco e comandos compensatórios aplicáveis estiverem operacionalmente conhecidos.

- `DECISÃO NOVA` — aprovação isolada de tela não libera acesso. O gate é ponta a ponta até `F`.
- `DECISÃO NOVA` — após liberação, novos defeitos são tratados por retirada individual de permissão, correção e compensação quando necessária; não por apagar ou restaurar contratos silenciosamente.

## Observabilidade mínima

- contadores de comandos iniciados/concluídos/falhos por tipo e situação;
- conflitos de revision por seção e origem detectada;
- duração/lock/retry de save, reserva, faturamento, cancelamento e desmembramento;
- invariantes rejeitadas de totais, parcelas, disponibilidade, lote/série e conferência;
- filas/outbox por estado, tentativa e idade;
- correlation id pesquisável entre comando, auditoria, Atendimento e efeitos;
- logs seguros, sem senha, credencial, conteúdo fiscal excessivo ou dados pessoais desnecessários.

## Resultado do mapa

- `DECISÃO NOVA` — o caminho até a implementação incremental está completamente delimitado. Não resta névoa funcional nem ticket de decisão aberto neste Wayfinder.
- `DECISÃO NOVA` — o próximo passo não é criar outro mapa nem um spec abrangente: é executar `$to-spec` na ordem acima, começando por **Núcleo, ciclo de vida e shell do Cadastro de Contratos**.
