# Definir aplicação administrativa para todos os usuários

Type: grilling
Status: resolved
Blocked by: 02

## Question

Qual contrato de autorização, confirmação, reautenticação sensível, auditoria, persistência em massa e feedback deve sustentar `Aplicar para todos os usuários`, visível somente ao administrador autenticado, copiando atomicamente a configuração saneada do grid atual para todos os usuários existentes — ativos e inativos — por merge exclusivo da seção desse `gridId`, exibindo previamente grid e quantidade afetada, exigindo usuário e senha válidos de qualquer Administrador, auditando separadamente quem iniciou e quem autorizou, sem alterar outras preferências, sem falhas parciais e sem criar um default para usuários futuros?

## Answer

### Autorização e reautenticação

- A ação só aparece para Usuário autenticado Administrador, mas o backend repete essa verificação na prévia e na confirmação.
- Reutilizar o módulo existente de autorização de operação sensível com uma operação dedicada.
- O Autorizador informa usuário e senha e deve ser Administrador ativo, desbloqueado, com autenticação ativa.
- Iniciador e Autorizador podem ser a mesma pessoa, mas as credenciais são sempre digitadas novamente.
- A prova é de uso único, vinculada à operação, tela, grid efetivo, fotografia da fonte e população da prévia. Não reutilizar autorização anterior.
- Falhas reutilizam rate limit e Auditoria de tentativas existentes e mostram: Não foi possível autorizar a operação. Verifique as credenciais e se o usuário informado é um Administrador ativo.

### Configuração fonte e identidade

- A fonte é exclusivamente a Preferência de Grid persistida do iniciador.
- Antes da prévia, qualquer resize ou gravação pendente deve terminar com sucesso.
- O backend saneia a seção usando o Catálogo de Grid correto e o gridId efetivo, inclusive preferencesGridId de variantes.
- A prévia guarda revisão ou hash da fotografia. Se a fonte mudar antes da confirmação, nada é aplicado e uma nova prévia é exigida.
- A ação copia somente a seção desse par tela mais grid efetivo. Todas as demais telas, grids e preferências de cada Usuário permanecem intactas.

### População e contagens

- A população contém todos os registros existentes de usuarios: ativos, inativos, com ou sem usuarios_auth, incluindo o iniciador.
- Usuários criados depois da execução usam defaults e não herdam essa aplicação.
- A prévia distingue usuários abrangidos, preferências que mudarão e preferências já idênticas.
- Se a população mudar entre prévia e confirmação, a operação é cancelada sem efeitos e exige nova prévia com contagem atualizada.

### Reconciliação por destinatário

- A configuração é saneada separadamente para cada destinatário conforme seu catálogo e suas autorizações.
- Copiar somente colunas também autorizadas para o destinatário.
- Descartar IDs desconhecidos, removidos, técnicos ou não autorizados.
- Colunas autorizadas para o destinatário, mas ausentes na fonte, recebem defaults do catálogo atual.
- Nunca persistir um ID não autorizado apenas porque era visível ao Administrador iniciador.

### Atomicidade e concorrência

- Executar sincronamente em uma única transação de banco; lotes internos podem limitar memória, mas não fragmentam o commit.
- Bloquear e mesclar cada payload de preferência de modo que somente a seção alvo seja substituída.
- Escritas concorrentes devem ser serializadas pelos locks. Qualquer falha em destinatário, saneamento, persistência ou Auditoria causa rollback integral.
- Não usar job assíncrono nem expor estado parcialmente aplicado.

### Seam do módulo

Criar um módulo profundo de Aplicação de Preferência de Grid em Massa com somente duas operações públicas:

1. preparar prévia a partir do Usuário, tela e grid atuais;
2. confirmar usando a identidade opaca da prévia e a prova de Autorização.

O módulo esconde fotografia e comparação da fonte e população, catálogo por destinatário, saneamento, locks, merge exclusivo da seção, transação, contagens e Auditoria. Controller e grid apenas usam essa interface; nenhum consumidor de ErpPreferenceDataGrid implementa lógica própria.

### Auditoria

Na mesma transação, gravar um único evento de negócio imutável com:

- iniciador e Autorizador em campos separados;
- tela, gridId efetivo e versão ou hash da fotografia aplicada;
- quantidade abrangida, alterada e já idêntica;
- lista dos códigos dos Usuários destinatários;
- data/hora e identificador da requisição.

Não registrar senha nem o JSON completo do layout ou dos títulos. Tentativas de Autorização, inclusive negadas, continuam na Auditoria própria do módulo de operações sensíveis. Se a Auditoria de sucesso falhar, toda a aplicação falha.

### Interface e confirmação

- Inserir Aplicar configuração para todos… em seção administrativa separada do menu de contexto, com aparência de alto impacto.
- Não colocar a ação dentro de Campos da Grade.
- O diálogo próprio mostra tela, grid ou variante, resumo da fonte, abrangidos, alterados, idênticos e aviso de sobrescrita e de não herança por usuários futuros.
- Solicitar usuário e senha do Autorizador e checkbox: Entendo que esta ação substituirá a configuração deste grid para todos os usuários existentes.
- Habilitar Aplicar para todos apenas com checkbox e credenciais preenchidas. Não exigir frase digitada adicional.
- Preservar foco acessível, limpar a senha e invalidar a prova após qualquer tentativa.

### Feedback

- Sucesso: Configuração aplicada para 240 usuários: 217 preferências alteradas e 23 já estavam idênticas.
- Fonte ou população mudou: A configuração ou a quantidade de usuários mudou. Revise e confirme novamente.
- Falha: Não foi possível aplicar a configuração. Nenhuma preferência foi alterada.
- Em conflito ou falha, manter o diálogo aberto e os dados não sensíveis, limpar senha e exigir nova Autorização.
- Em sucesso, fechar e devolver foco ao item que abriu a ação.

### Testes mínimos derivados

- item visível somente a Administrador e backend negando não administrador;
- Autorizador diferente ou igual ao iniciador, sempre com credenciais explícitas;
- login ou senha inválidos, bloqueado, inativo, autenticação inativa e perfil insuficiente;
- prova de uso único, sem reutilização e vinculada ao contexto completo;
- todos os usuarios, inclusive inativos e sem usuarios_auth;
- contagens abrangida, alterada e idêntica;
- mudança da fonte ou população invalida a prévia;
- variante usa preferencesGridId e catálogo correto;
- saneamento por destinatário e defaults para colunas ausentes;
- merge preserva outras seções e outras telas;
- concorrência serializada e rollback por falha em qualquer destinatário;
- falha de Auditoria causa rollback;
- evento separa iniciador e Autorizador e não contém senha ou layout completo;
- nenhum default global é criado para usuários futuros;
- feedback, limpeza de senha, foco e prevenção de submissão duplicada.

Não foi criado ADR: a operação segue conceitos já estabelecidos de Preferência de Grid, Autorização, Autorizador e Auditoria, e seus requisitos de atomicidade e escopo são explícitos.
