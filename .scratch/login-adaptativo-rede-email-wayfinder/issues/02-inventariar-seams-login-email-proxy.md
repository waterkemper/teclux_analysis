# Inventariar seams atuais de login, e-mail, sessão e proxy

Type: task
Status: resolved

## Question

Quais componentes, tabelas, configurações, rotas, testes e contratos já existentes no Laravel devem ser reutilizados ou alterados para inserir o desafio entre a validação da senha e a criação da sessão, incluindo senha expirada, mailers, filas, auditoria, rate limiting, Redis/sessão, Nginx e trusted proxies? Registrar lacunas e conflitos sem implementar.

## Answer

Inventário concluído em [Inventário dos seams de login, e-mail, sessão e proxy](../research/02-inventario-seams-login-email-proxy.md).

O seam central é separar validação primária de conclusão da sessão nos dois caminhos atuais, normal e senha expirada. Redis, rate limiting, mail manager, Horizon, trace e testes existentes são bases reutilizáveis, mas faltam estado de login pendente, desafio próprio, mailer de autenticação, auditoria durável e política de rede. `trustProxies('*')` precisa ser substituído antes de IP dispensar o segundo fator. O cadastro também expõe uma decisão bloqueante: `usuarios_auth.email` é identidade nullable e não é mantido, enquanto `usuarios.email` é uma conta de mensagens distinta.
