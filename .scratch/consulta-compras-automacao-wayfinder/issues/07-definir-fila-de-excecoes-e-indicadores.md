# Definir fila de exceções, notificações e indicadores

Type: grilling
Status: resolved
Blocked by: 06

## Question

## Comments

## Answer

- A fila de excecoes sera uma tela de negocio persistente, separada da Consulta de Compras manual.
- A tela operacional ficara em uma area propria de Reposicao ECC dentro de Estoques > Compras e reunira rotinas, lotes, revisao, aprovacao, excecoes, indicadores e historico.
- A Consulta manual permanece preservada e podera apenas apontar para a nova tela.
- Excecoes terao motivo, estado, idade, responsavel, resolucao e justificativa; itens nunca serao apagados.
- Alertas internos resumirao backlog, falha de job e atraso. E-mail ou webhook serao opcionais e configuraveis por base, sem padrao global.
- Indicadores iniciais incluirao execucoes, propostas, pedidosfiliais, quantidades atendidas e nao atendidas, excecoes por motivo/idade, intervencoes humanas, aprovacoes, cancelamentos, cobertura, rupturas, excesso e transferencias.
- Nao serao criadas metas padrao. O sistema registrara um baseline do processo manual, incluindo volume de consultas/requisicoes, excecoes e esforco das duas pessoas, para comparar a reducao de trabalho apos a automacao.

- A fila de excecoes deve ser persistente e ligada a lote, item, produto, Filial Requisitante, fonte candidata, motivo, fatos observados, responsavel, timestamps e resolucao.
- Motivos iniciais: configuracao ausente/invalida, sem fonte elegivel, estoque da fonte alterado, protecao de fonte concentradora, conflito de concentracao, saldo insuficiente, duplicidade, aprovacao de gerente, lote pendente e falha de infraestrutura.
- Estados recomendados: aberta, em analise, resolvida, cancelada ou dispensada com justificativa; nunca apagar o item original.
- A fila de negocio deve ser distinta do alerta operacional. O alerta pode resumir backlog, falha de job ou atraso, enquanto a tela permite tratar cada item.
- Indicadores candidatos: lotes executados, propostas geradas, pedidosfiliais confirmados, quantidade atendida, quantidade nao atendida, excecoes por motivo/idade, intervencoes/edicoes humanas, aprovacoes de gerente, cancelamentos, cobertura, rupturas, excesso acima do maximo e transferencias por filial/fonte.
- A automacao tera uma tela operacional propria, separada de Estoques > Compras > Consultas. A Consulta manual permanece preservada; a nova tela concentrara rotinas, lotes, revisao, aprovacao, excecoes, indicadores e historico.
- A Consulta manual podera oferecer apenas atalhos para a tela operacional, sem misturar o fluxo de calculo manual com a fila automatizada.

Como apresentar às pessoas as exceções que exigem ação, quais notificações e prazos usar e quais indicadores comprovarão redução do trabalho manual, nível de atendimento, rupturas, excesso, transferências e intervenções humanas?
