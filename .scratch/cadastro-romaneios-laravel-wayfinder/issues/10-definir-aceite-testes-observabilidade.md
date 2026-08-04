# Definir critérios de aceite, testes e observabilidade

Type: grilling
Status: resolved
Blocked by: 06, 07, 08, 09

## Question

Quais cenários de paridade, autorização, concorrência Delphi–Laravel, transação, SQL/schema, N+1, cancelamento PostgreSQL, grid, atalhos, chave NF-e, relatórios, falhas e observabilidade devem compor a matriz de aceite dos prompts?

## Answer

A matriz foi consolidada em [aceite-testes-observabilidade.md](../../../modules/entregas/cadastro-romaneios/aceite-testes-observabilidade.md). Ela torna obrigatória a suíte PostgreSQL real, cobre paridade funcional, segurança, schema/SQL, ausência mensurável de N+1, cancelamento efetivo, concorrência Delphi–Laravel, idempotência, falhas injetadas e atomicidade com Contas a Pagar. Define ainda logs, métricas, alertas, redação de dados sensíveis e evidências de aceite. Por decisão do usuário, estratégia de implantação gradual, feature flag e plano de retorno ficaram fora do escopo.
