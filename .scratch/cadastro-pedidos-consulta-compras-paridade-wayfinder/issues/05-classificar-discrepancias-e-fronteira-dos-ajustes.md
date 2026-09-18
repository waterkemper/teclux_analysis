# Classificar discrepâncias e decidir a fronteira dos ajustes corretivos

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04

## Question

Com base nas quatro auditorias, quais achados são discrepâncias reais que devem ser corrigidas, quais são decisões deliberadas, bugs legados a não replicar, dúvidas que exigem decisão do usuário e oportunidades de desempenho? Definir prioridade, invariantes do contrato, dependências entre correções e a fronteira entre Consulta de Compras e Cadastro de Pedidos. Decidir também se o fluxo deve receber um prompt transversal ou prompts separados por módulo.
## Answer

A decisao esta registrada em [Classificacao das discrepancias e fronteira dos ajustes](../docs/05-classificacao-fronteira.md).

### Achados que devem ser corrigidos

- DIVERGENTE/POSSIVEL BUG: a Parte Fornecedora Delphi e do tipo F e e copiada para o cabecalho; a UI Laravel envia null e o contrato nao carrega o tipo. Corrigir na Consulta e preservar no Cadastro.
- DIVERGENTE/POSSIVEL BUG: o Delphi usa apenas qryComprasTotal, enquanto o Laravel agrega abas e usa Produto como chave. Corrigir o escopo e impedir descarte silencioso de linhas conflitantes por Produto/Filial.
- DIVERGENTE confirmada: AsInteger no Delphi trunca fracoes. A decisao e preservar quantidade decimal no Laravel, tratando a conversao inteira como comportamento legado a nao replicar.
- CONFIRMADO: os N+1 do enriquecimento de Produto, do handoff e da descricao historica devem ser corrigidos com projecoes batch/set-based.

### Decisoes deliberadas ou fora da prioridade

Nao introduzir vendedor de vendas por item: ele nao participa do F10 Delphi. Nao reabrir valor, impostos ou motores ja decididos. Manter loadDetalhes batch, a chamada unica de impostos e as consultas condicionais das abas. Releituras de cabecalho sao oportunidade de segunda prioridade, preservando a leitura final apos mutacao quando necessaria.

### Invariantes e dependencias

O contrato tem uma unica transferencia, filial e Parte Fornecedora explicitas, itens e valores nao sao recalculados pelo Cadastro, quantidade decimal e sugestao base zero inelegivel. Linhas conflitantes devem ser rejeitadas ou resolvidas explicitamente. O prompt da Consulta estabiliza o contrato; o prompt do Cadastro o consome, enriquece em lote e mede queries.

Foi decidido publicar dois prompts separados: Consulta de Compras e Cadastro de Pedidos. O ticket 06 esta liberado. Nenhum codigo de producao foi alterado.
