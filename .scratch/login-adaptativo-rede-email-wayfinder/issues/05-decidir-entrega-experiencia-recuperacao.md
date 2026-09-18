# Decidir entrega, experiência e recuperação do código

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual deve ser a fonte autoritativa e verificável do e-mail individual — considerando que `usuarios_auth.email` participa do login mas não é mantido pelo cadastro, enquanto `usuarios.email` é uma conta de mensagens distinta — e qual deve ser o contrato ponta a ponta de cadastro/migração, envio, tela, e-mail mascarado, mensagens não enumeráveis, reenvio, expiração, indisponibilidade do mailer, troca do endereço e recuperação local auditada, sem criar bypass ou e-mail compartilhado?

## Comments

- Confirmado: o Cadastro de Usuários terá um campo separado chamado **E-mail de Acesso**, persistido em `usuarios_auth.email`, sem reutilizar nem sincronizar automaticamente `usuarios.email`/`email_conta`.
- Confirmado: cadastrar ou alterar o E-mail de Acesso cria um endereço pendente e envia um link de verificação de uso único; somente a abertura válida pelo destinatário o promove a endereço verificado, sem ação administrativa para “forçar verificado”.
- Confirmado: na troca normal, o E-mail de Acesso atual permanece válido até o novo ser verificado; uma revogação emergencial separada, restrita a administrador autenticado pela Rede Confiável e auditada, invalida o atual imediatamente e bloqueia acesso externo até a regularização.
- Confirmado: o link de verificação expira em 24 horas, é de uso único, tem somente seu hash persistido e é invalidado por nova emissão; seu consumo apenas verifica o E-mail de Acesso, sem autenticar o Usuário nem criar sessão.
- Confirmado: a migração não copia `usuarios.email`; valores existentes em `usuarios_auth.email` continuam como identificador de login, mas não servem para entrega enquanto não forem verificados. O modo `observe` evidencia ausências e pendências, e `enforce` só deve ser habilitado após regularização planejada; pendentes entram somente pela Rede Confiável.
- Confirmado: o código é enviado de forma assíncrona e durável por fila exclusiva de segurança. O Login Pendente distingue envio em andamento, código aguardado e falha de entrega; a interface só declara envio após aceitação pelo SMTP, e falha permanente mantém o acesso externo fechado.
- Confirmado: um mailer lógico exclusivo de segurança pode reutilizar o SMTP da instalação, mas proíbe drivers `log`/`array`, exige TLS com certificado validado, não expõe segredos em logs ou `failed_jobs` e requer readiness de SMTP, Redis e worker antes de `enforce`; indisponibilidade não aciona fallback ou código mestre.
- Confirmado: antes da validação de Usuário, senha, estado e Filial, mensagens são genéricas. Depois dela, a tela mostra somente o E-mail de Acesso mascarado, não permite alterá-lo, orienta quem não está regularizado a procurar a administração pela Rede Confiável e apresenta falhas operacionais apenas com referência, sem detalhes de SMTP.
- Confirmado: a recuperação local usa comando Artisan executado no servidor on-premises por operador autorizado, exige alvo, identidade do operador e motivo, revoga endereço/desafios/sessões conforme solicitado, cadastra o novo endereço como pendente e envia o link normal, com auditoria durável. Não verifica endereço, cria sessão, gera código mestre nem contorna SMTP indisponível.
- Confirmado: ativação, troca confirmada ou revogação do E-mail de Acesso incrementa a revisão de segurança, cancela todos os Logins Pendentes/códigos e encerra as sessões do Usuário, exigindo novo login. Endereços anterior e novo recebem aviso quando possível, sem código nem link sensível enviado ao anterior.
- Confirmado: o job recebe apenas o identificador do Login Pendente, gera o código em memória no momento do envio e persiste somente HMAC. Cada retentativa de transporte cria geração nova e invalida a anterior, o e-mail avisa que só o código mais recente funciona e nenhuma retentativa prorroga os 10 minutos totais.
- Confirmado: cada solicitação admite até três tentativas automáticas de entrega, com backoff de 5, 15 e 30 segundos e sem executar após a expiração. Depois disso o estado é falha; o reenvio manual só fica disponível após 60 segundos, cria nova geração e não reinicia os 10 minutos nem as cinco tentativas de validação.
- Confirmado: o e-mail identifica ERP e Empresa Cliente, destaca o código de seis dígitos, informa validade de 10 minutos e prevalência do código mais recente, Filial e horário, e orienta a avisar a administração se não solicitado. Não inclui senha, link de login, IP completo nem dados sensíveis.

## Answer

### Fonte autoritativa

O **E-mail de Acesso** é o único endereço autorizado a receber Código de Acesso por E-mail. Seu valor ativo e verificado reside em `usuarios_auth.email`, continua podendo identificar o Usuário no login e não se confunde com `usuarios.email`/`email_conta`, que permanece uma conta operacional de mensagens.

O Cadastro de Usuários deve apresentar campos e estados separados para E-mail da conta e E-mail de Acesso. O endereço de acesso é individual, normalizado sem diferenciar maiúsculas e minúsculas e único na instalação; endereços compartilhados não são aceitos. O estado mínimo distingue ausência, pendente de verificação, verificado e revogado, com instante de verificação e revisão de segurança explícita.

### Cadastro, verificação e migração

Cadastrar ou alterar o E-mail de Acesso cria um candidato pendente separado do endereço ativo. A aplicação envia ao candidato um link aleatório, de uso único, válido por 24 horas e persistido somente como hash. Nova emissão invalida a anterior. Consumir o link apenas comprova posse do endereço: não autentica o Usuário, não cria sessão e não concede acesso ao ERP. A resposta pública do link não enumera Usuário nem revela dados cadastrais.

Na troca normal, o endereço anterior continua ativo até a confirmação atômica do novo, evitando bloqueio por erro de digitação ou falha de entrega. Uma revogação emergencial separada, restrita a administrador autenticado pela Rede Confiável e auditada, invalida o endereço imediatamente; o Usuário continua podendo entrar pela Rede Confiável, mas fica bloqueado externamente até verificar outro endereço.

A migração:

- nunca copia automaticamente `usuarios.email`;
- mantém `usuarios_auth.email` existente como identificador de login, mas o considera não verificado para entrega;
- exige revisão administrativa e prova de posse antes de torná-lo E-mail de Acesso verificado;
- usa `observe` para inventariar ausentes, duplicados, inválidos e pendentes;
- só permite promover a instalação para `enforce` após uma decisão operacional explícita sobre os Usuários ainda não regularizados.

Usuário sem E-mail de Acesso verificado não recebe código, não tem fallback externo e continua elegível ao login somente pela Rede Confiável.

### Entrega assíncrona

O envio usa fila durável e mailer lógico exclusivos de segurança, embora a instalação possa apontá-lo para o mesmo servidor SMTP. O job contém apenas identificadores não secretos. O worker gera o código de seis dígitos em memória no instante de cada tentativa e persiste somente HMAC contextual; código, link e payload sensível não podem aparecer no banco, payload serializado, `failed_jobs`, logs ou telemetria.

O mailer de segurança:

- proíbe drivers `log` e `array`;
- exige TLS e validação de certificado/hostname;
- não herda relaxamentos de TLS usados por e-mails operacionais legados;
- possui readiness de configuração, conectividade, Redis e worker;
- precisa estar pronto antes de `enforce`;
- falha fechado, sem recorrer ao e-mail operacional, código mestre ou envio manual de segredo.

O Login Pendente passa por envio em andamento, código aguardado ou falha de entrega. A interface só declara “código enviado” depois da aceitação pelo SMTP, reconhecendo que aceitação não prova chegada à caixa postal.

Cada solicitação admite até três tentativas automáticas de transporte, com backoff de 5, 15 e 30 segundos, interrompidas quando o Login Pendente expira. Como o código não é armazenado reversivelmente, cada tentativa automática cria geração nova e invalida a anterior. Timeout ambíguo pode produzir mais de um e-mail; a mensagem e a tela esclarecem que somente o código da geração mais recente funciona.

### Código, reenvio e expiração

Permanecem os contratos já decididos:

- seis dígitos;
- Login Pendente válido por dez minutos totais;
- no máximo cinco erros de validação somados entre todas as gerações;
- reenvio manual somente após sessenta segundos;
- reenvio cria geração nova e invalida todas as anteriores;
- envio, retentativa e reenvio nunca reiniciam os dez minutos nem as cinco tentativas;
- job atrasado não envia depois da expiração;
- código só pode ser consumido uma vez e apenas pelo Login Pendente, Usuário, Filial, revisão de segurança e geração correspondentes.

Os limites agregados contra abuso e sua cardinalidade pertencem a [Decidir controles de abuso, auditoria e privacidade](06-decidir-abuso-auditoria-privacidade.md).

### Experiência e mensagens

Antes de validar identificador, senha, estado da conta e acesso à Filial, as respostas permanecem genéricas e com comportamento equivalente. A transição para a tela do código só ocorre após validação primária; então é aceitável informar o destino de forma mascarada, por exemplo `j***@e***.com`.

A tela:

- começa em “Enviando código…” e acompanha o estado durável sem fingir entrega;
- oferece entrada do código, contagem de validade, reenvio quando permitido e cancelamento/retorno ao login;
- nunca permite alterar o E-mail de Acesso;
- orienta Usuário sem endereço verificado a procurar a administração pela Rede Confiável;
- em falha operacional, apresenta ação segura e código de referência, sem host, credencial ou diagnóstico SMTP;
- quando expirado, exige nova tentativa completa de login.

O e-mail identifica o ERP e a Empresa Cliente, destaca o código, informa validade, prevalência do código mais recente, Filial e horário da tentativa e orienta a avisar a administração se não solicitado. Não contém senha, link automático de login, IP completo ou outros dados sensíveis.

### Alteração, revogação e recuperação

Ativar, substituir ou revogar o E-mail de Acesso incrementa a revisão de segurança do Usuário, cancela todos os Logins Pendentes/códigos e encerra suas sessões autenticadas. O próximo acesso começa do zero sob a política atual. O endereço anterior e o novo recebem notificações quando disponíveis; a mensagem ao anterior não contém código nem link sensível.

Além da administração normal pelo Cadastro de Usuários, existe recuperação local por comando Artisan executado no servidor on-premises por operador de infraestrutura autorizado. O comando exige Usuário-alvo, identidade do operador e motivo, mantém trilha durável, pode revogar endereço/desafios/sessões, cadastrar um candidato e solicitar o envio do link normal.

Essa recuperação nunca marca endereço como verificado, autentica o Usuário, cria sessão, imprime token, gera código mestre ou desativa silenciosamente a política. Se SMTP/fila estiverem indisponíveis, devem ser reparados; acesso físico ao servidor não transforma falha do canal em bypass externo.

### Cobertura exigida

A especificação deve cobrir cadastro inicial, troca normal, concorrência entre verificações, reemissão do link, link expirado/reutilizado, revogação emergencial, migração de endereço existente, Usuário sem endereço, duplicidade normalizada, entrega aceita/falha/ambígua, worker atrasado, retentativas, reenvio concorrente, expiração, cinco erros entre gerações, mascaramento, não enumeração, invalidação de sessões/desafios, recuperação local e ausência de segredos em persistência e observabilidade.

### Alternativas rejeitadas

- Usar `usuarios.email`: mistura identidade de segurança com conta operacional de mensagens.
- Copiar dados legados ou marcá-los verificados automaticamente: inventa prova de posse inexistente.
- Permitir que administrador force verificação: cria bypass administrativo.
- Enviar de forma síncrona: acopla a requisição à latência SMTP e perde estado operacional durável.
- Serializar o código no job ou criptografá-lo para reenvio: contradiz o requisito de persistir somente prova não reversível.
- Manter sessões/desafios após troca do endereço: preserva provas vinculadas a uma revisão de segurança obsoleta.
- Recuperação por código mestre, link impresso ou desativação automática: transforma o caminho de emergência no controle mais fraco.
