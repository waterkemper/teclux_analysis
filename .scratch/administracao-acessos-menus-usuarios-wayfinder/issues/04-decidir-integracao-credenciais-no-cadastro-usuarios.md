# Decidir a integracao de credenciais no Cadastro de Usuarios

Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual deve ser o contrato final para criar e manter o acesso de autenticacao diretamente no Cadastro de Usuarios? O Laravel ja possui campos de login e senha no formulario e sincronizacao de usuarios_auth, mas o comando auth:create-user continua publicado.

## Answer

Decisoes confirmadas pelo usuario:

- O Cadastro de Usuarios sera o unico fluxo oficial para criar e alterar credenciais. O comando auth:create-user sera removido de routes/console.php.
- Usuarios legados sem usuarios_auth poderao ser regularizados pelo Cadastro. A inclusao da credencial exigira login, senha e confirmacao, e criara usuarios_auth na mesma transacao.
- Nao havera geracao automatica de senha, exposicao de senha existente ou reaproveitamento de segredo legado.
- O campo usuarios.email e o e-mail operacional legado usado pelo Delphi, inclusive para a conta usada no envio de XML. Ele pode ser compartilhado por varios Usuarios e nao deve receber a regra de unicidade do e-mail de autenticacao.
- O campo usuarios_auth.email pertence a outra tabela e permanece fora deste ajuste. Valores existentes devem ser preservados, mas email_conta nao sera copiado automaticamente para ele.
- login e obrigatorio e unico em usuarios_auth. O login e a identidade principal da autenticacao.
- Senha, confirmacao, complexidade, validade e aviso continuarao seguindo as regras ja usadas pelo Cadastro, com diasvalidadesenha, diasavisosenha e expiracaosenha.
- A senha informada pelo administrador fica ativa imediatamente e must_change_password permanece false por padrao.
- Na alteracao, senha vazia preserva a credencial existente; uma nova senha substitui o hash sem retornar segredo no payload.
- Inativar o Usuario bloqueia a autenticacao, mas preserva usuarios_auth, grants, historico e auditoria. A reativacao e possivel. A criacao ou alteracao de credencial de Usuario inativo nao e permitida no fluxo normal.
- Inclusao e alteracao devem ser uma unica transacao envolvendo usuarios, usuarios_auth, dados relacionados alterados no mesmo cadastro e auditoria. Erro em qualquer etapa desfaz tudo.
- A auditoria registra operador, Usuario afetado, tipo de operacao, login anterior e novo quando aplicavel, estado e resultado. Nunca registra senha, hash, token ou confirmacao de senha.
- O prompt deve distinguir claramente email_conta/usuarios.email de usuarios_auth.email. A listagem ou contrato que projeta apenas um campo email deve ser corrigido ou renomeado para nao misturar as duas responsabilidades.

