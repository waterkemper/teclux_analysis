# Verificar coordenação com o PRD de reforma do modal tradicional de produto

Type: task
Status: resolved
Blocked by:

## Question

O PRD `orcamentos-modal-produtos-speckit` (ready-for-agent, ainda não implementado) vai reescrever a máquina de estados de quantidade/comandos do modal tradicional de inclusão de produto. O contrato `handleConfirmProdutoModal`/upsert-por-`numero` em `Cadastro.tsx`, que este mapa pretende usar diretamente (contornando a UI do modal), permanece estável depois dessa reforma, ou há conflito real a resolver antes de fechar o design do adaptador?

## Answer

**Sem conflito — contrato confirmado estável.** O PRD escopa a reforma explicitamente para dentro do modal tradicional (`CadastroItemVendaProdutoModal`): sua própria máquina de estados de comando/quantidade, o F5/trava síncrona, o buffer de bipe, e a semântica de `onConfirm`'s `meta?.intent` (`replace`/`insert`/`increment`). As Implementation Decisions do PRD dizem explicitamente: "Preserve the existing lookup and page contracts where possible" e "Keep common lookup, quantity, keyboard and presentation logic in the shared Sales Product modal; inject Orçamento-specific consequences... through context" — ou seja, o limite de página (`handleConfirmProdutoModal`, upsert por `numero`, `applyProdutosTotais`, `agendarCascataValores`) é tratado como um contrato de página estável a preservar, não algo que a reforma vai redesenhar. Como o adaptador da Busca Assistida chama esse limite de página diretamente (nunca passa pela UI/máquina de estados do modal), não há sobreposição real.

**Achado relevante para o ticket do adaptador (não uma decisão deste ticket):** o PRD fixa "Use Product+Filial as the equality key for automatic summation" como a regra de identidade já estabelecida no domínio — um novo bipe do mesmo Produto+Filial incrementa, em vez de criar linha duplicada. Como `handleConfirmProdutoModal` em si não decide isso (é o modal/bipe que decide antes de chamar o callback), o adaptador da Busca Assistida precisa decidir essa mesma questão de forma independente ao montar linhas a partir da seleção — e por consistência de domínio, deveria seguir a mesma regra de identidade Produto+Filial, não inventar uma diferente. Levar isso para [Definir o adaptador de Aplicar seleção](05-definir-adaptador-aplicar-selecao.md).