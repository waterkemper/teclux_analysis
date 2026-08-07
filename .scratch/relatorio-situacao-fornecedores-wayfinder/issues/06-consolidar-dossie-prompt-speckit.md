# Consolidar o dossiê e o prompt Speck/Specify do Relatório de Situação dos Fornecedores

Type: task
Status: resolved
Blocked by: 05

## Question

Como consolidar decisões e evidências em um dossiê rastreável e num prompt `/speckit.specify` autocontido, pronto para especificar somente as mudanças necessárias no Laravel sem investigação funcional em aberto?

## Answer

A consolidação foi concluída em:

- [Dossiê — Relatório de Situação dos Fornecedores](../../../modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/dossie.md): fontes, evidências, temporalidade, identidade composta, filtros, cálculos, hierarquia, pipeline compartilhado, segurança, UX, matriz mínima de mudanças, testes e gates.
- [Prompt Spec Kit — Relatório de Situação dos Fornecedores](../../../modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/speckit-prompt.md): entrada autocontida para `/speckit.specify`, com ordens explícitas para revalidar o checkout, reutilizar a implementação vigente e criar somente a estratégia `SUPPLIER_SITUATION`.

O prompt fixa `vfornecedores.codigo + tipo`, Documento/vencimentos, corte histórico, todas as medidas distintas, saldo não apurável, filtros corrigidos, `report_type`, fotografia imutável, autorização por todas as Filiais, PostgreSQL real, limite de 100.000 registros, acessibilidade, fases e feature flag. Não restou investigação funcional aberta.

`git diff --check` e a verificação de termos obrigatórios passaram; nenhum TODO/TBD foi encontrado.
