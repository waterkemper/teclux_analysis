# Consolidar prompts coordenados para speckit.specify

Type: task
Status: resolved
Blocked by: 06, 07, 08, 09, 10

## Question

Como decompor todas as decisões e evidências em prompts coordenados, ordenados e autocontidos em `modules/entregas/cadastro-romaneios/`, cada um com fronteira, dependências, schema verificado, requisitos, critérios de aceite e instruções claras para `/speckit.specify`?

## Answer

O pacote foi consolidado em [README.md](../../../modules/entregas/cadastro-romaneios/README.md) e seis prompts ordenados: fundação/domínio/segurança; consulta F6/seleção múltipla; cadastro/itens/financeiro; operações de entrega/conferência; relatórios/integração da interface; e aceite/desempenho/observabilidade. Cada prompt contém comando `/speckit.specify`, dependências, autoridades verificáveis, fronteira, requisitos, critérios de aceite e fora de escopo. A sequência preserva PostgreSQL 9.5.25, coexistência Delphi–Laravel, schema autoritativo, SQL set-based, cancelamento real, padrões Laravel e integração com o núcleo Contas a Pagar.
