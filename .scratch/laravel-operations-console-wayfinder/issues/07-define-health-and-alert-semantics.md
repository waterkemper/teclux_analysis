# Define health and alert semantics

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Which signals and thresholds define healthy, degraded, and critical queues, workers, and scheduled tasks, and how should email and signed-webhook alerts be deduplicated, rate-limited, acknowledged, tested, and resolved?

## Comments

## Answer

Saúde é projeção calculada por recurso, com estados **Saudável**, **Degradada**, **Crítica**, **Desconhecida**, **Pausada** e **Em manutenção**. Ausência ou atraso de telemetria nunca aparece como saudável.

- Filas usam idade do job pendente mais antigo como sinal primário; profundidade, crescimento, throughput, saturação e taxa de falhas dão contexto. Cada fila possui orçamento próprio, nunca um limite global.
- Defaults iniciais: default/marketplace-sync degradam em 2 min e criticam em 10 min; heavy-reports degrada em 15 min e critica em 45 min. Calibrar após 14 dias de telemetria antes de ativar alertas externos de backlog.
- Grupo de Processadores degrada após 2 heartbeats ausentes e fica crítico após 2 minutos sem consumidor esperado, ou por crash loop. Saturação isolada não é incidente enquanto o orçamento de espera estiver atendido.
- Tick do agendador degrada após 2 minutos e fica crítico após 5. Tarefa alerta após sua tolerância declarada; repetição perdida ou tarefa de alto risco pode escalar imediatamente.
- Falhas usam janela, volume mínimo e percentual por família; falha isolada só alerta quando a família declara alto risco. **Verificação necessária** alerta imediatamente: Atenção por padrão, Crítica em efeitos externos sensíveis.
- Regras exigem amostras consecutivas e recuperação abaixo de limite inferior por 5 minutos. Histerese evita flapping; pior severidade dos recursos compõe a saúde geral.
- Código fornece regras, defaults e limites seguros. Administrador pode ajustar thresholds dentro desses limites por ambiente, com preview, revisão otimista e Ação Administrativa; não cria expressões arbitrárias.
- Pausa planejada não mascara backlog. Manutenção com início/fim, máximo 24 h e motivo continua criando alertas na Console, mas suspende entregas externas até expirar.
- Deduplicação usa ambiente + regra/version + tipo/recurso. Enquanto aberto, atualiza primeira/última ocorrência, contagem e pior severidade. Após resolução, recorrência cria novo alerta ligado ao anterior.
- Ciclo: **Aberto**, **Reconhecido**, **Resolvido**. Reconhecer registra ator/nota e interrompe lembretes comuns, mas não resolve, não silencia escalada e não impede notificação de recuperação.
- Abertura, aumento para Crítica e resolução notificam imediatamente. Sem reconhecimento, lembrete padrão é 2 h para Atenção e 30 min para Crítica; rajadas do mesmo recurso são agrupadas.
- Resolução exige recuperação sustentada e é automática. Mensagem de normalização inclui duração, pico e link autenticado; reconhecimento manual jamais fabrica recuperação.
- E-mail e webhook são canais independentes por ambiente, enviados via outbox com retry exponencial e Entrega de Alerta por tentativa. Falha de canal não bloqueia o outro nem cria recursão infinita.
- Webhook usa HTTPS, segredo criptografado, HMAC-SHA256 sobre timestamp+ID+corpo e janela anti-replay. Payload é sanitizado; links exigem login. Configurar canal é ação reautenticada e auditada.
- **Enviar teste** gera entrega sintética claramente marcada, sem abrir Alerta Operacional, e registra latência/resposta sanitizada. Canal só fica Ativo após teste bem-sucedido.
- O próprio avaliador de saúde e a outbox têm heartbeat. Falha de entrega abre um único alerta interno exibido na Console e usa o outro canal disponível, sem alertar por si mesmo recursivamente.
