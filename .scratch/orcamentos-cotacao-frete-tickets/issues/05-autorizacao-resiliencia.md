# 05 — Completar autorização e resiliência da Cotação de Frete

**What to build:** tornar a Cotação de Frete segura e previsível em modo de consulta, alteração, falhas externas e operações concorrentes, preservando a cotação anterior até uma nova seleção válida.

**Blocked by:** 01 — Consultar opções de frete no Orçamento; 02 — Validar a configuração local e aplicar uma cotação.

**Status:** ready-for-agent

- [ ] Usuário com acesso de consulta pode abrir e comparar cotações.
- [ ] Aplicar uma opção exige Permissão de Alteração e Situação editável do Orçamento.
- [ ] Em modo somente leitura, os controles de aplicação ficam indisponíveis com explicação clara.
- [ ] Timeout, indisponibilidade, resposta inválida e erro de autenticação exibem mensagens seguras e oferecem tentativa manual.
- [ ] Não existe retry automático invisível.
- [ ] Uma falha não apaga, substitui nem renova a cotação anteriormente selecionada.
- [ ] Chamadas duplicadas são bloqueadas e respostas atrasadas não substituem uma requisição mais recente.
- [ ] URL e credencial são validadas e protegidas contra exposição, logs sensíveis e destinos não autorizados.
- [ ] Serviços individuais com erro não impedem o uso das demais opções válidas.

