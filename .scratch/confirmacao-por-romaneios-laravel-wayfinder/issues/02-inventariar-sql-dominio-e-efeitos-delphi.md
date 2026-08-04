# Inventariar SQL, domínio e efeitos da Confirmação por Romaneios Delphi

Type: research
Status: resolved
Blocked by:

## Question

Quais datasets, SQLs, macros, parâmetros, joins, subconsultas, ordenações, filtros, consultas por linha, escritas, funções PostgreSQL, sequences, triggers, commits e efeitos em romaneios, notas, conferência, estoque, pedidos e financeiro sustentam cada operação da tela? Produzir uma matriz fluxo → SQL/objeto → tabelas/campos → efeito → transação, classificando consultas que precisam ser redesenhadas como set-based no Laravel.

Fontes mínimas: `dmconfirmarromaneiostransferencia.pas/.dfm` e dependências diretamente alcançadas. Registrar evidência arquivo/linha e apontar riscos de N+1, SQL concatenado, commit parcial e qualquer regra de elegibilidade ou idempotência ainda não comprovada.

## Answer

Pesquisa concluída em [pesquisa-sql-dominio-efeitos-delphi.md](../../../modules/interlojas/confirmacao-por-romaneios/pesquisa-sql-dominio-efeitos-delphi.md). Foram mapeadas a consulta F6, o detalhe de Produtos, a busca de Romaneio de Passagem, o fluxo de confirmação, os efeitos em Nota Fiscal de Entrada, produtos, financeiro, estoque, pedidos e situação do Romaneio.

O inventário confirmou riscos que o Laravel não deve reproduzir: macros e cláusulas concatenadas, produtos carregados em `AfterScroll`, consultas e loops por Item/Produto/Pedido, bloqueio de estoque por SQL textual e persistência por Item com atomicidade de `Perpetrar) ainda não comprovada. O snapshot deve confirmar as funções, triggers, constraints, índices e cardinalidades antes do SQL Laravel.
