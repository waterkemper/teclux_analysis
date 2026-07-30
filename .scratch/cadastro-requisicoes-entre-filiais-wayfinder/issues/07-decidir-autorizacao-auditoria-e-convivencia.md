# Decidir autorização, auditoria e convivência Delphi–Laravel

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Quais permissões, confirmações, identificação de usuário, trilhas de auditoria e regras de convivência entre Delphi e Laravel são necessárias para incluir, alterar e cancelar Requisições sem criar dupla autoridade ou perder rastreabilidade?

## Answer

O acesso fica no menu **Interlojas → Requisição para Exposição**. Administradores acessam diretamente; os demais usuários precisam do módulo registrado em `acessosmodulos` e concedido em `usuariosacessosmodulos`. A Filial Requisitante deve pertencer a `usuariosfiliais` (administrador pode usar qualquer filial válida), enquanto a Filial Requisitada pode ser qualquer filial válida diferente da requisitante. Essas regras devem ser revalidadas pelo backend em inclusão, alteração e cancelamento. Não haverá permissão separada nem senha adicional por operação, preservando o comportamento Delphi; o cancelamento mantém confirmação e motivo obrigatório.

Criar `pedidosfiliais_log_new` segundo o padrão de `clientes_log_new`, sem alterar `pedidosfiliais_log`. O gatilho novo deve capturar INSERT, UPDATE e DELETE feitos por qualquer cliente do banco. Nas transações Laravel, aplicar `DatabaseAuditContext` antes da primeira escrita para registrar `app_user_id`, login, nome, origem e `request_id`; escritas Delphi permanecem identificáveis pelo usuário do banco, com campos de aplicação nulos. Movimentações de estoque também registram o usuário autenticado em `movimentos.usuariologado`. Não criar uma terceira trilha concorrente.

Delphi e Laravel são escritores equivalentes do mesmo agregado em `pedidosfiliais`: nenhum campo de origem concede propriedade exclusiva, e uma requisição criada em um sistema pode ser alterada ou cancelada no outro quando aberta e autorizada. A concorrência usa como revisão o último `trigger_id` aplicável ao conjunto da requisição em `pedidosfiliais_log_new`, pois o cadastro Delphi não atualiza sempre `datahoraalteracaousuario` e uma tabela de revisão incrementada apenas pelo Laravel não detectaria o outro escritor. Alteração e cancelamento bloqueiam as linhas, recalculam a revisão dentro da transação e rejeitam divergência com mensagem para recarregar. `datahoraalteracaousuario` continua preservada por compatibilidade, mas não é o token exclusivo. Requisição, movimentos, revisão e auditoria integram a mesma transação.
