# 20 — Entregar Alertas Operacionais externos

**What to build:** criar Alertas Operacionais duráveis a partir da Saúde Operacional e entregá-los por e-mail e webhook assinado. O Administrador reconhece, acompanha escalada e recuperação, testa canais e programa manutenção sem ocultar condições ou causar tempestade recursiva.

**Blocked by:** 14 — Controlar pausa e retomada com auditoria e reconciliação; 19 — Calcular Saúde Operacional e apresentar Pendências Acionáveis.

**Status:** done

- [ ] Deduplicação usa ambiente, regra/versão, tipo e recurso; alerta aberto acumula ocorrências e pior severidade.
- [ ] Ciclo Aberto, Reconhecido e Resolvido registra atores/notas; reconhecimento não encerra condição nem impede recuperação.
- [ ] Abertura, escalada Crítica e resolução notificam imediatamente; lembretes seguem 2 horas para Atenção e 30 minutos para Crítica enquanto não reconhecido.
- [ ] Recuperação exige condição sustentada e mensagem de normalização informa duração, pico e link autenticado.
- [ ] E-mail e webhook usam outbox e Entrega de Alerta independente; falha de um canal não bloqueia o outro.
- [ ] Webhook exige HTTPS, segredo criptografado, HMAC-SHA256, timestamp, identidade e janela anti-replay; payload é sanitizado.
- [ ] Enviar teste cria entrega sintética marcada, registra resultado sanitizado e só ativa o canal após sucesso.
- [ ] Janela de Manutenção Operacional tem motivo, início/fim e máximo de 24 horas; mantém alerta interno e suspende somente entrega externa esperada.
- [ ] Falha do avaliador/outbox abre um alerta interno único e usa o outro canal sem recursão infinita.
- [ ] Configurar canal, reconhecer e criar manutenção respeitam autorização, concorrência e auditoria aplicáveis.
- [ ] Testes com relógio e receiver controlados cobrem deduplicação, lembretes, escalada, recuperação, assinatura, replay, retry e falha independente.
