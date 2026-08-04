# Mapear padrões Laravel para acesso, menu, parâmetros, grid e operações

Type: research
Status: resolved
Blocked by:

## Question

Quais arquivos e contratos concretos do Laravel atual devem ser reutilizados para criar `acessosmodulos` e o menu **Interlojas → Consulta de Transferências**, aplicar capability/filial ativa, resolver parâmetros por filial, construir filtros e endpoints Inertia, e entregar grids com exportação, ordenação, personalização, paginação, ícones, ações e atalhos no padrão do projeto?

## Comments

## Answer

Pesquisa concluída em modules/interlojas/consulta-transferencias/pesquisa-padroes-laravel.md.

O padrão comprovado mais próximo é Interlojas - Consulta de Requisições: migration idempotente de acessosmodulos sem replicar grants; autorização por administrador ou usuariosacessosmodulos; middleware aplicado ao grupo inteiro; filial ativa obtida da sessão e conferida em usuariosfiliais; parâmetros agrupados em manifest e resolvidos por filial via ParameterService::getMany; GET Inertia com endpoints JSON separados; ErpPreferenceDataGrid com catálogo versionado, preferências, exportação e atalhos; e ErpConsultaOperationBar para ações, ícones, estados e teclas.

A pesquisa separa padrões existentes de recomendações. A decisão de paginação deve ser explícita: o módulo vizinho vigente carrega todas as linhas sob limite e usa grid client-side, enquanto sua antiga paginação server-side está depreciada. Para Consulta de Transferências, volume alto deve levar a paginação/ordenação server-side com colunas allowlisted e desempate determinístico.
