# Auditar padrões Laravel reutilizáveis para Romaneios

Type: task
Status: resolved
Blocked by:

## Question

Quais implementações atuais do Laravel devem ser reutilizadas para shell de cadastro/consulta, grids, exportação e preferências, lookups, barra de operações, atalhos, chave NF-e, parâmetros, autorização, menu, relatórios e cancelamento real de queries, e quais lacunas impedem aplicação direta ao Cadastro de Romaneios?

## Answer

A auditoria está em [pesquisa-padroes-laravel-reutilizaveis.md](../../../modules/entregas/cadastro-romaneios/pesquisa-padroes-laravel-reutilizaveis.md). Ela confirma aplicação direta das fundações de shell/command bar, grid e exportação, chave NF-e, parâmetros, acesso/Filiais, autorização sensível, relatórios institucionais e cancelamento PostgreSQL.

O Romaneio deve compor esses padrões, não copiá-los. As lacunas específicas são agregado/repositories transacionais, catálogos das grades, lookups fiscais, capabilities/estados, ações sensíveis, manifest/menu/Policy, datasets/templates dos dois relatórios e a escolha mensurada entre F6 síncrono cancelável e job pesado.
