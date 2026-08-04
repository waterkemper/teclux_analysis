# Inventariar parâmetros, autorizações e acesso ao módulo

Type: task
Status: resolved
Blocked by:

## Question

Quais chamadas `parametros_valor('', '')`, permissões, autorizações contextuais, escopos de Filial e registros de menu controlam cada filtro, campo e operação Delphi, e como eles se relacionam aos padrões Laravel de `ParameterService`, manifests, policies, middleware, `acessosmodulos` e `usuariosacessosmodulos`?

## Answer

O inventário está em [pesquisa-parametros-autorizacoes-menu.md](../../../modules/entregas/cadastro-romaneios/pesquisa-parametros-autorizacoes-menu.md). Foram confirmados dois parâmetros por Filial, quatro desafios contextuais e o acesso Delphi `mitCadastroRomaneio`. No Cloud existe apenas o pai “Entrega e Montagem”; falta a folha “Cadastro de Romaneios”.

O documento mapeia cada caso para `ParameterService::getMany`, manifest próprio, `UserBranchAccessService`, acesso explícito em `usuariosacessosmodulos`, service/middleware/Policy e provas do `SensitiveOperationAuthService`. Também registra que somente cancelar pagamento exige `gerenteestoque` no código Delphi; as outras três operações aceitam qualquer credencial válida, portanto um endurecimento de perfil precisa ser decisão explícita.
