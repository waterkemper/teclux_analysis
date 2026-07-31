# 11 — Estabelecer a Console segura e sua fachada operacional

**What to build:** uma primeira fatia navegável da Console de Operações em português brasileiro. Um Administrador do Sistema acessa uma landing que identifica claramente o ambiente e a atualização dos dados; outros usuários são recusados no servidor. A tela usa uma única fachada de aplicação para leitura e comandos, começa com Saúde Operacional Desconhecida e permite evoluir os adaptadores sem acoplar UI a Horizon ou Redis.

**Blocked by:** None — can start immediately.

**Status:** ready-for-agent

- [ ] Administradores do Sistema acessam a rota e usuários comuns ou não autenticados recebem recusa server-side em todas as variantes HTTP/Inertia.
- [ ] A landing exibe ambiente, instante da última atualização e estado Desconhecido com microcópia integralmente em pt-BR.
- [ ] A aplicação possui uma única fronteira pública para consultas e Comandos Administrativos Operacionais, substituível por fakes nos testes Feature.
- [ ] Nenhum controller ou componente acessa Redis, Horizon, payload ou model serializado diretamente.
- [ ] Flags server-side locais ao ambiente controlam separadamente observação e futuras mutações, sem conceder autoridade quando desligadas.
- [ ] Identificadores forjados de outro ambiente são recusados, sem revelar existência ou conteúdo.
- [ ] Testes Feature cobrem acesso, recusa, ambiente, estados vazio/carregando/desatualizado/erro e contrato inicial da fachada.

