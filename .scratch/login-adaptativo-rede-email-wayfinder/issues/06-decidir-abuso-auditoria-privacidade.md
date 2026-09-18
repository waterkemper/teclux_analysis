# Decidir controles de abuso, auditoria e privacidade

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04

## Question

Quais rate limits combinados, bloqueios, eventos de auditoria, retenção, mascaramento, alertas e respostas operacionais devem cobrir credenciais, geração, reenvio e validação do código, distinguindo tentativa, Usuário, IP e Empresa Cliente sem armazenar senha, código bruto ou dados excessivos?

## Comments

- Confirmado: falhas de senha e de código usam domínios separados. Cinco códigos incorretos somados entre gerações encerram o Login Pendente e aplicam ao Usuário um **Bloqueio de Verificação Externa** de 15 minutos, que sobrevive a novas tentativas externas sem afetar login pela Rede Confiável.
- Confirmado: controles em camadas combinam Login Pendente, Usuário, IP efetivo e instalação da Empresa Cliente. Limites por tentativa/Usuário são obrigatórios; sinais de IP/instalação não podem bloquear login legítimo pela Rede Confiável nem criar um bloqueio global fácil de provocar.
- Confirmado: defaults configuráveis mantêm senha em 10 requisições/minuto por identificador+IP e bloqueio após 5 erros/15 minutos; limitam desafios a 3/Usuário/15 minutos, 20/Usuário/24 horas e 30/IP/15 minutos; reenvio a 3 por Login Pendente, 5/Usuário/15 minutos, 20/24 horas e 30/IP/15 minutos; código incorreto a 5 por pendente e 30/IP/15 minutos. A instalação alerta em 100 envios ou 200 validações falhas/15 minutos, sem bloqueio global automático; retentativa SMTP conta no volume operacional, não como ação manual.
- Confirmado: Bloqueio de Verificação Externa e contador de erros ficam duráveis no banco; janelas agregadas usam Redis com operações atômicas. Indisponibilidade do Redis fecha criação, reenvio e validação externos sem fallback em memória; a Rede Confiável não é bloqueada pela verificação, embora a sessão continue dependendo da infraestrutura normal.
- Confirmado: uma tabela append-only de **Eventos de Segurança de Acesso** é a fonte autoritativa; logs estruturados e métricas são projeções. Transições críticas persistem evento na mesma transação, enquanto tentativas anônimas volumosas permanecem em telemetria e produzem resumos duráveis para não transformar o banco em vetor de negação de serviço.
- Confirmado: eventos duráveis guardam tipo/resultado/motivo/tempo, correlação, Usuário/Filial e ator quando conhecidos, revisões e contexto de política. IP completo só aparece em evento ligado a Usuário conhecido; identificador desconhecido vira HMAC rotativo; cliente é normalizado e e-mail vira revisão. Senha, código/verificador, tokens, cookies, sessão, headers e corpos são proibidos, e métricas não usam labels pessoais.
- Confirmado: eventos comuns ficam 180 dias; alteração de E-mail de Acesso, recuperação local, política/CIDRs e ações administrativas ficam 365 dias; logs, 30 dias; métricas, 90 dias. Uma função administrativa específica lê a trilha sem alterá-la e seu acesso é auditado; rotina agendada descarta em lotes e registra resumo, com períodos configuráveis mas não indefinidos por padrão.
- Confirmado: catálogo fechado cobre classificação/política, credencial primária, ciclo do Login Pendente, entrega, reenvio/validação, rate limit/bloqueio, criação de sessão, ciclo do E-mail de Acesso, recuperação local, política/CIDRs, readiness e acesso/descarte da auditoria. Resultado e motivo usam códigos fechados, não texto livre como dado principal.
- Confirmado: falha ao persistir Evento de Segurança aborta transições críticas na mesma transação — desafio, sessão, bloqueio, e-mail, recuperação e política. Falha anônima de senha mantém resposta genérica com telemetria best-effort; indisponibilidade da trilha alerta imediatamente e não pode ser engolida pelo logger legado.
- Confirmado: alerta crítico imediato cobre auditoria/configuração HMAC inválida, recuperação local e mudanças de política/CIDRs/proxies; indisponibilidade de Redis/worker/mailer torna-se crítica após 5 minutos. Avisos cobrem fila acima de 60 segundos, falha de entrega >20%/5 minutos, 10 cadeias inválidas/5 minutos e dois bloqueios do mesmo Usuário/24 horas; volumes da instalação seguem os limiares definidos. Alertas deduplicam por 15 minutos, usam canal operacional independente e nunca relaxam `enforce`, CIDRs ou bloqueios automaticamente.
- Confirmado: Bloqueio de Verificação Externa expira após 15 minutos e não é limpo por senha, login, reenvio ou IP. Liberação antecipada exige administrador autenticado pela Rede Confiável e motivo, cancela desafios e exige nova tentativa, gera evento/notificação e não pode ocorrer externamente nem por confirmação verbal.
- Confirmado: o início do Bloqueio de Verificação Externa e sua liberação antecipada enviam uma notificação deduplicada ao E-mail de Acesso, com horário, Filial e orientação de segurança, sem código, link de login ou IP completo.

## Answer

### Separação dos controles

Falhas de senha e falhas do Código de Acesso pertencem a domínios distintos. Código incorreto nunca incrementa `usuarios_auth.login_attempts`, e senha correta não limpa erro de código.

Os controles de senha existentes permanecem: dez requisições por minuto por identificador normalizado + IP efetivo e bloqueio persistente da credencial após cinco senhas incorretas por quinze minutos.

O Login Pendente aceita no máximo cinco códigos incorretos somados entre todas as gerações. O quinto erro encerra o pendente e cria um **Bloqueio de Verificação Externa** durável para o Usuário por quinze minutos. Novo login, nova Filial, outro navegador, reenvio ou troca de IP não reinicia esse contador nem contorna o bloqueio. A Rede Confiável continua podendo concluir login apenas com a credencial primária.

O bloqueio expira automaticamente. Liberação antecipada exige administrador autenticado pela Rede Confiável, permissão específica e motivo; cancela todos os desafios do Usuário, exige tentativa nova e gera Evento de Segurança. Não existe liberação externa, por confirmação verbal ou por suporte sem prova local.

### Rate limits combinados

Todos os valores são defaults seguros, configuráveis por deployment através de configuração Laravel validada e versionada. Reduzir proteções exige mudança explícita e auditada.

| Operação | Login Pendente | Usuário | IP efetivo | Instalação |
|---|---:|---:|---:|---:|
| Credencial primária | — | 5 erros / 15 min | 10 req/min por identificador+IP | métrica |
| Criar desafio externo | um ativo por tentativa | 3 / 15 min; 20 / 24 h | 30 / 15 min | alerta agregado |
| Reenvio manual | 3 durante os 10 min | 5 / 15 min; 20 / 24 h | 30 / 15 min | alerta agregado |
| Código incorreto | 5 entre gerações | bloqueio externo / 15 min | 30 / 15 min | alerta agregado |
| E-mails do código | gerações vigentes | incluídos nos limites do Usuário | incluídos nos limites de origem | alerta em 100 / 15 min |
| Validações incorretas | incluídas nas 5 | incluídas no bloqueio | incluídas nas 30 | alerta em 200 / 15 min |

Retentativas automáticas do SMTP contam no volume operacional da instalação, mas não como ação manual do Usuário. Os limites agregados de IP/instalação do fluxo adicional não bloqueiam logins pela Rede Confiável. O limiar da instalação alerta e aciona contenção seletiva por Usuário/IP, nunca um bloqueio global automático fácil de explorar como negação de serviço.

Verificação e incremento são atômicos. Ao limitar uma requisição, a resposta usa mensagem compatível com a fase e `Retry-After` sem revelar qual contador disparou. Novas chaves não podem ser criadas a partir de valores ilimitados fornecidos pelo cliente sem normalização e proteção contra cardinalidade.

### Persistência e indisponibilidade

O contador de cinco erros, o Bloqueio de Verificação Externa e os estados do Login Pendente ficam no banco. Janelas móveis por Usuário, IP e instalação ficam no Redis e usam operações atômicas, TTL e prefixos próprios.

Redis indisponível faz criação, reenvio e validação de desafios externos falharem fechados; não há fallback em memória que permita divergência entre processos. Isso não introduz um bloqueio da Verificação Adicional no caminho da Rede Confiável, embora a implantação continue dependendo do Redis para sua infraestrutura normal de sessão.

### Eventos de Segurança de Acesso

Uma tabela append-only é a fonte autoritativa da auditoria de segurança. Logs estruturados e métricas são projeções operacionais, não substitutos da evidência. A aplicação comum não altera nem exclui eventos individualmente; somente a rotina controlada de retenção remove lotes expirados e registra um resumo do descarte.

Transições críticas gravam estado e Evento de Segurança na mesma transação: criar/consumir/cancelar desafio, iniciar/liberar bloqueio, criar sessão, ativar/trocar/revogar E-mail de Acesso, executar recuperação local e mudar política/CIDRs/proxies. Se a evidência não puder ser persistida, a transição não conclui e o acesso externo permanece fechado.

Falhas anônimas de alto volume não criam uma linha por requisição na trilha durável. Elas permanecem em logs/métricas com cardinalidade controlada e geram resumos duráveis por janela, impedindo que a própria auditoria seja usada para esgotar o banco. A resposta ao cliente continua genérica mesmo quando a telemetria estiver degradada.

O catálogo fechado inclui:

- rede classificada e política decidida;
- credencial primária aceita/rejeitada;
- Login Pendente criado, cancelado, expirado, bloqueado e consumido;
- entrega enfileirada, aceita, retentada e falha;
- código reenviado, rejeitado e aceito;
- rate limit atingido e Bloqueio de Verificação Externa iniciado, expirado ou liberado;
- sessão criada após verificação;
- E-mail de Acesso solicitado, verificado, trocado e revogado;
- recuperação local solicitada e concluída;
- política, CIDRs ou proxies alterados;
- readiness degradado e restaurado;
- auditoria consultada e retenção executada.

Tipo, resultado e motivo são enums/códigos versionados. Texto livre é apenas complemento sanitizado e nunca a fonte principal de decisão.

### Minimização e privacidade

Cada evento durável pode conter identificador próprio, instante UTC, tipo/resultado/motivo, `trace_id`, Usuário e Filial quando conhecidos, ator administrativo, identificador opaco do Login Pendente, revisão de segurança/E-mail de Acesso, modo/versão da política e classe/motivo de rede.

O IP efetivo completo, derivado somente da cadeia confiável, é guardado apenas para evento associado a Usuário conhecido e com acesso restrito. Identificador digitado que não resolve um Usuário vira HMAC rotativo do valor normalizado; o texto não é persistido. Navegador e sistema são categorias normalizadas, sem `User-Agent` bruto. E-mail aparece apenas mascarado na interface e como revisão/identidade interna na auditoria, nunca como valor duplicado em payload livre.

São proibidos em eventos, logs, métricas, respostas e jobs falhos: senha, código bruto, HMAC/verificador do código, token de verificação, cookie, ID de sessão, segredo da aplicação, headers brutos e corpo completo de e-mail. Métricas não usam IP, Usuário, login ou e-mail como labels.

### Retenção e acesso

- eventos comuns de autenticação: 180 dias;
- alterações de E-mail de Acesso, recuperação local, mudanças de política/CIDRs/proxies e outras ações administrativas: 365 dias;
- logs estruturados: 30 dias;
- métricas agregadas: 90 dias.

Períodos são configuráveis por instalação, validados e nunca indefinidos por padrão. A rotina agendada remove em lotes, é idempotente, limita carga e grava contagem, intervalo e resultado, sem copiar os dados removidos.

Somente uma função administrativa específica de segurança consulta eventos duráveis, em modo somente leitura, com filtros e exportação minimizada. Toda consulta/exportação também é auditada. Permissão de administrar Usuários ou Filiais não concede automaticamente acesso à trilha.

### Alertas e resposta operacional

Alertas críticos imediatos:

- trilha durável indisponível;
- chave/verificador HMAC ou configuração inválida em `enforce`;
- recuperação local executada;
- alteração de modo, CIDRs ou proxies confiáveis.

Alertas críticos após cinco minutos contínuos:

- Redis indisponível;
- worker da fila de segurança indisponível;
- mailer de segurança indisponível.

Avisos:

- mensagem de código na fila por mais de 60 segundos;
- falha de entrega superior a 20% em cinco minutos;
- dez cadeias de proxy inválidas em cinco minutos;
- dois Bloqueios de Verificação Externa para o mesmo Usuário em 24 horas;
- 100 envios ou 200 códigos incorretos na instalação em quinze minutos.

Alertas são deduplicados por quinze minutos, carregam release, instalação, severidade, código do motivo e referência ao runbook, sem segredo ou dado pessoal excessivo. O canal operacional é independente do mailer de códigos; se integrações externas falharem, o estado continua visível em health/readiness, logs locais e console operacional.

A resposta nunca muda automaticamente `enforce`, amplia CIDRs/proxies, cria bypass, libera Usuário ou reclassifica origem. Mantém externo fail-closed, preserva o caminho definido da Rede Confiável e orienta diagnóstico de banco, Redis, fila, SMTP, proxy e configuração.

O início do Bloqueio de Verificação Externa e a liberação administrativa enviam uma notificação deduplicada ao E-mail de Acesso, com horário, Filial e orientação para trocar senha/procurar a administração se a atividade não for reconhecida. Não inclui código, link de login ou IP completo; falha dessa notificação não desfaz o bloqueio e vira evidência operacional.

### Cobertura exigida

A especificação deve testar limites isolados e combinados, concorrência atômica, reenvio entre gerações, evasão por IP/navegador/Filial, expiração e liberação do bloqueio, Redis indisponível, cardinalidade hostil, falha da auditoria em cada transição, resumo de eventos anônimos, catálogo e schema sem segredos, HMAC rotativo, retenção em lote, autorização de leitura, alertas/deduplicação, falha do canal operacional e garantia de que nenhuma resposta relaxa a política.

### Alternativas rejeitadas

- Reutilizar o contador de senha para código: mistura ameaças e permite efeitos colaterais indevidos.
- Limitar somente por IP: NAT prejudica legítimos e botnets distribuem tentativas.
- Limitar somente por Login Pendente: reiniciar o fluxo zera a proteção.
- Bloqueio global automático da instalação: oferece ao atacante uma forma barata de indisponibilizar o ERP.
- Contador em memória quando Redis falha: processos discordam e ampliam tentativas.
- Usar apenas logs best-effort: não sustenta investigação, recuperação ou prova de mudança.
- Persistir toda tentativa anônima: transforma auditoria em vetor de negação de serviço.
- Guardar payload bruto “para investigar depois”: viola minimização e aumenta impacto de vazamento.
- Relaxar automaticamente a política durante incidente: converte indisponibilidade em bypass.
