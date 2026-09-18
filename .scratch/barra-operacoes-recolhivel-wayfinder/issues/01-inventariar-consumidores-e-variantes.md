# Inventariar consumidores e variantes da barra de operações

Type: task
Status: open

## Question

Quais telas Laravel usam `ErpCadastroShell`, `ErpCadastroCommandBar`, `ErpConsultaOperationBar` ou uma variante própria de barra/rail, e quais diferenças precisam ser preservadas para que uma mudança compartilhada cubra todos os casos sem deixar ações, atalhos ou estados de autorização fora do contrato?

O inventário deve identificar, por arquivo, a barra usada, se o rail é habilitado, ações padrão, `trailingActions`, barras customizadas, scroll container, modais/overlays, testes existentes e qualquer CSS `fixed`/`z-index` relevante. Recalcular as contagens e separar consumidores reais de definições e testes.
