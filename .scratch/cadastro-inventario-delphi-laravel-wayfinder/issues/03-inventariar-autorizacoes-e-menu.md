# Inventariar autorizações, senha e menu do Cadastro de Inventário

Type: research
Status: resolved
Blocked by:

## Question

Como o Delphi decide quem pode abrir, consultar, incluir, alterar, excluir, gerar Produtos, importar, imprimir ou executar cada operação do Cadastro de Inventário? Identificar senha, reautenticação, grupos/papéis, mensagens, Filial/escopo e diferenças entre acesso ao menu e autorização contextual.

Mapear o local funcional esperado do menu de Estoque, a capability correspondente, os registros de `acessosmodulos`/vínculos de usuários e o padrão equivalente já existente no Laravel. Separar fatos confirmados de propostas novas, não armazenar credenciais e produzir `modules/estoque/cadastro-inventario/pesquisa-autorizacoes-menu.md`; não criar migration nem policy.
## Answer

Pesquisa concluída e registrada em modules/estoque/cadastro-inventario/pesquisa-autorizacoes-menu.md.

O Delphi não registra explicitamente menu ou acessosmodulos nos fontes do cadastro. A autorização confirmada é a operação sensível de processamento: GerarMovimentos exige GerenteEstoque, usando senha do gerente da sessão ou login e senha de outro usuário autorizado com esse perfil. As demais operações são habilitadas pelo estado da tela, sem autorização explícita localizada, e precisam de revalidação no backend.

O Laravel deve usar MenuService/acessosmodulos/usuariosacessosmodulos, middleware fail-closed, escopo por filial autorizada e SensitiveOperationAuthService para processamento. Estoque -> Cadastro de Inventário é proposta pendente de confirmação do catálogo; Caixa -> Controle de Recebimentos não pertence a este módulo.
