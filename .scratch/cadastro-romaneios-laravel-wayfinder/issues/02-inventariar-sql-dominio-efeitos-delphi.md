# Inventariar SQL, domínio e efeitos do Cadastro de Romaneios Delphi

Type: task
Status: resolved
Blocked by:

## Question

Quais consultas, escritas, funções, sequences, triggers presumidos, agregações, relatórios e efeitos colaterais sustentam cada fluxo do Cadastro de Romaneios, e quais tabelas, views e relações precisam ser confirmadas no schema autoritativo?

## Answer

O inventário está em [pesquisa-sql-dominio-efeitos-delphi.md](../../../modules/entregas/cadastro-romaneios/pesquisa-sql-dominio-efeitos-delphi.md). Ele relaciona as consultas e objetos alcançados, os efeitos transacionais sobre agenda, situação, financeiro e conferência, as funções PostgreSQL a preservar, os riscos legados que não devem ser copiados e a lista exata de objetos que o snapshot autoritativo precisa confirmar antes de escrever SQL Laravel.
