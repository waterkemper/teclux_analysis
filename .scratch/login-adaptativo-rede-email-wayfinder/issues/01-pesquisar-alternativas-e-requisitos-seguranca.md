# Pesquisar alternativas e requisitos de segurança para autenticação adaptativa

Type: research
Status: resolved

## Question

À luz de fontes primárias atuais, quais requisitos e trade-offs devem orientar uma primeira versão baseada em código por e-mail, comparada a TOTP, passkeys/WebAuthn e provedor de identidade? Cobrir entropia e geração, validade, armazenamento, uso único, reenvio, tentativas, enumeração, recuperação, sessão pendente, auditoria e limites reais de e-mail como segundo fator.

## Answer

Pesquisa concluída em [Alternativas e requisitos de segurança para autenticação adaptativa](../research/01-alternativas-e-requisitos-seguranca.md).

O código por e-mail pode ser mantido na primeira versão como verificação adicional transitória e de menor garantia, mas não deve ser chamado de MFA compatível com NIST: o SP 800-63B-4 proíbe e-mail como autenticador out-of-band. As decisões de 6 dígitos, 10 minutos, uso único, 5 tentativas, reenvio após 60 segundos invalidando o anterior, fail-closed e sessão somente após validar o código formam um baseline coerente, com três qualificações: falhas devem sobreviver a reenvios e ter limites agregados; hash simples não protege o pequeno espaço de seis dígitos contra vazamento do banco; e Login Pendente precisa ser incapaz de acessar rotas autenticadas.

TOTP remove a dependência da caixa postal, mas segue suscetível a phishing e exige segredo recuperável e recuperação própria. Passkeys/WebAuthn são a direção preferencial resistente a phishing. IdP/OIDC é atraente para clientes com identidade corporativa, desde que o ERP valide a federação integralmente e preserve Filial e autorização local. A política de “prova adicional exigida” deve permanecer separada do mecanismo concreto para permitir essa evolução.
