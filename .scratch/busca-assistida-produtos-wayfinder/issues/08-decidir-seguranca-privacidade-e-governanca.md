Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual é o contrato verificável de permissão, parâmetro, isolamento por empresa, sanitização de dados pessoais, retenção, auditoria, limites, conteúdo sensível, falhas e degradação segura que mantém a lupa tradicional sempre disponível?

## Answer

### Isolamento da implantação

Cada cliente possui sua própria base de dados e implantação separada. A própria implantação é a fronteira de isolamento; não será criado `tenant_id`, `installation_id` nem particionamento por Filial.

- Filial permanece filtro e escopo de autorização operacional.
- Embeddings, cache, Auditoria e armazenamento auxiliar pertencem exclusivamente à implantação.
- Se a topologia usar armazenamento vetorial separado, ele também deve ser exclusivo por cliente/implantação, sem catálogo compartilhado.

### Habilitação e acesso

Um único Parâmetro do Sistema global habilita ou desabilita a Busca Assistida. Não haverá Permissão específica.

- Todo Usuário que já pode acessar a Consulta de Estoques pode usar a Busca Assistida quando o Parâmetro estiver ligado.
- Busca digitada e ditado seguem o mesmo acesso.
- Preço e comissão continuam sujeitos às Permissões existentes.
- Chave/token, provider, modelo, dimensão, timeouts e cotas são configuração técnica do Laravel, não valores do Parâmetro do Sistema.
- Segredos nunca são persistidos ou exibidos pela funcionalidade.
- Parâmetro ligado com configuração técnica ausente/inválida produz indisponibilidade somente da Busca Assistida.

### Minimização e retenção de consultas

A política é geral para dados pessoais, comerciais ou confidenciais de clientes de qualquer ramo:

- áudio nunca é persistido;
- transcrição e texto original existem somente durante a requisição;
- consulta não se vincula a Cliente, Orçamento, Contrato ou Usuário;
- cache guarda apenas HMAC da consulta normalizada, embedding, provider/modelo/dimensão e validade;
- o texto da consulta não é persistido;
- feedback guarda hash da consulta, Produtos exibidos/selecionados e útil/não ajudou, sem identidade do Usuário;
- métricas administrativas são agregadas;
- cache de consulta expira em 90 dias e pode ser limpo administrativamente;
- a interface orienta a não informar dados pessoais ou confidenciais.

O HMAC permite reaproveitar consulta idêntica sem tornar seu conteúdo recuperável. Logs de aplicação e exceções também não podem incluir texto, transcrição, áudio ou vetor.

### Conteúdo e afirmações

A Busca Assistida é comercial e multissetorial. Não deve criar afirmações técnicas, profissionais, regulatórias, de segurança, saúde, desempenho ou adequação que a Evidência Comercial do Produto não sustente.

Associação semântica indireta continua permitida com linguagem neutra e trecho literal. A aplicação se abstém quando a relação é fraca, contraditória ou insuficiente. Não há chamada de chat no resultado comum.

### Cotas e economia

Limites são definidos tecnicamente por implantação, sem novos Parâmetros do Sistema:

- orçamento separado para indexação, consultas e transcrição;
- limites diário e mensal configuráveis;
- backfill pausa antes de consumir a reserva das consultas;
- cache hit não consome provider;
- nenhum fallback automático usa provider/modelo mais caro;
- ao atingir limite, somente a Busca Assistida é suspensa;
- medir quantidade, cache hit, falhas e consumo reportado, sem conteúdo pesquisado.

Alertas internos, visíveis somente a administradores, são deduplicados por período, orçamento e marco:

- 80%: atenção;
- 95%: crítico;
- 100%: limite atingido.

O painel identifica se o consumo veio de indexação, consulta ou transcrição e mostra saldo estimado.

### Falhas e degradação segura

- Uma tentativa curta de retry somente para falha transitória.
- Timeout configurável.
- Circuit breaker após falhas consecutivas, com cooldown.
- Credencial, modelo incompatível, quota, provider ou índice indisponível geram mensagem segura e alerta administrativo.
- Índice parcial informa cobertura incompleta.
- Não existe failover silencioso para modelo/provider diferente ou mais caro.
- A UI oferece **Abrir lupa tradicional**.
- A lupa tradicional não chama services, storage, cache, provider, circuit breaker ou configuração da IA.
- Falha de IA nunca altera o endpoint nem o resultado da lupa.

### Administração transversal de IA

A administração de IA pertence ao ERP, não ao módulo de Busca Assistida. Ela deve ser extensível para outras capacidades, como comandos de voz em Orçamentos, Contratos e Cadastros. Cada uso declara uma identificação funcional estável, por exemplo `estoque.busca_assistida`, `estoque.indexacao_produtos` ou `orcamentos.comando_voz`, permitindo separar consumo, saúde, cota e Auditoria sem misturar regras de negócio.

A área administrativa transversal mostra:

- providers/modelos configurados e estado das credenciais, nunca o token;
- consumo diário/mensal, custo e cache hit por identificação funcional;
- transcrição, embeddings, consultas e agentes operacionais separadamente;
- saúde, timeouts, circuit breakers, filas, falhas e reprocessamentos;
- alertas, Auditoria e parâmetros de habilitação das funcionalidades.

Permite:

- testar conectividade sem executar operação de negócio;
- inspecionar e administrar cada capacidade por seção própria.

No MVP, a seção de Busca Assistida de Produtos acrescenta elegíveis, indexados, pendentes, falhos e bloqueados; cobertura e última indexação; pausar/retomar; reprocessar somente ausentes, alterados ou falhos; limpar cache; e bloquear/desbloquear Produto. Regras de Produto continuam no módulo de Estoque; a infraestrutura de medição, alerta e saúde é compartilhada.

### Auditoria

Registrar, sem conteúdo pesquisado:

- alteração do Parâmetro do Sistema;
- início, pausa, conclusão e falha de backfill;
- mudança da identidade técnica do modelo;
- bloqueio/desbloqueio de Produto;
- limpeza de cache;
- alertas e atingimento de cota;
- ações administrativas com Usuário e momento.

Não registrar áudio, consulta, transcrição, embedding legível, chave/token ou payload integral do provider.

### Critérios verificáveis

Testes devem comprovar acesso herdado do módulo, Parâmetro ligado/desligado, ausência de segredos, HMAC e expiração, inexistência de vínculo pessoal, redaction de logs, budgets separados por identificação funcional, marcos/deduplicação de alertas, circuit breaker, índice parcial, administração transversal/auditoria e independência da lupa em todas as falhas.
