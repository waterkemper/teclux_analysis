# Definir o adaptador de Aplicar seleção para linhas do Orçamento

Type: grilling
Status: resolved
Blocked by: 01, 04, 07

## Question

Como `onApply(selections: BuscaAssistidaSelection[])` se traduz em linhas do Orçamento via `produto_lookup` + `handleConfirmProdutoModal`: cada produto selecionado vira sempre uma linha nova, ou um produto já existente no Orçamento (mesma Produto+Filial, regra de identidade já estabelecida pelo PRD do modal tradicional) soma quantidade em vez de duplicar? O que acontece quando `produto_lookup` falha para um item do lote (os demais seguem, o painel permanece aberto para retentativa)? O painel fecha ao Aplicar neste hospedeiro, e que feedback visual a grade de Orçamento mostra após a inclusão?

## Answer

- **Duplicidade vs. incremento**: para cada produto selecionado, o adaptador checa se já existe uma linha com o mesmo Produto+Filial no Orçamento (mesma regra de identidade do PRD do modal tradicional — "Use Product+Filial as the equality key for automatic summation"). Se existir, incrementa a quantidade em 1; se não, inclui uma linha nova com quantidade 1. Como o painel não tem campo de quantidade (só seleção), cada item aplicado sempre vale 1 unidade, igual a um bipe físico. Nenhuma regra de identidade nova é inventada — reaproveita a já estabelecida.
- **Falha parcial no lote**: cada produto selecionado é processado independentemente via `produto_lookup`; sucessos são incluídos/incrementados normalmente, falhas (ex. produto ficou inativo ou sem estoque na Filial Base entre a busca e o Aplicar) são reportadas individualmente sem derrubar os demais. O painel permanece aberto para o vendedor ver a falha e decidir se tenta de novo ou ajusta a seleção — mesmo padrão de falha parcial localizada já estabelecido no painel.
- **Fechamento ao Aplicar**: mesmo comportamento já decidido para o painel em geral — nunca fecha sozinho ao Aplicar. Os produtos aplicados somem da faixa de seleção, o vendedor pode buscar e aplicar mais, fechando só por ação explícita (X/Esc/backdrop). Nenhuma exceção para este hospedeiro.
- **Feedback visual**: reaproveita o padrão leve de mensagem flash local já existente no Orçamento (ex. `documentEmailFlash` em `Cadastro.tsx`) — uma mensagem perto da grade ("N produtos incluídos", com detalhe de eventuais falhas), sem inventar um sistema de toast novo. As linhas novas/incrementadas aparecem na grade normalmente, sem destaque especial, igual ao modal tradicional (que só mantém a linha salva visível, sem highlight).
