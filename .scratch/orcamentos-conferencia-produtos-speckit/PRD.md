# Conferência de Produtos no Cadastro de Orçamentos

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O ERP Laravel já possui uma tela de Conferência de Produtos vinculada às Listas Padrão, porém o Cadastro de Orçamentos ainda não oferece a conferência existente no Delphi nem aplica suas consequências sobre a disponibilidade do orçamento no Frente de Caixa.

A migração precisa preservar o conceito transversal de conferência sem copiar uma implementação específica de Listas Padrão. Para um orçamento, a conferência compara as quantidades esperadas dos produtos persistidos com as quantidades lidas ou digitadas. Ela só está completa quando não existe falta nem excesso. Produtos inesperados não podem ser incluídos no orçamento por meio da conferência.

Dois parâmetros atuam conjuntamente: `CONFERÊNCIA DE PRODUTOS NO ORÇAMENTO` e `Mensagem de produtos não conferidos ao emitir a NF`. Quando ambos estão ativos e um orçamento aberto possui divergência, ele não pode ficar disponível para o Frente de Caixa. A conferência concluída deve restaurar imediatamente a disponibilidade somente quando a própria conferência tiver causado o bloqueio e não existir outra causa de indisponibilidade.

## Solution

Estender o mecanismo compartilhado de conferência do Laravel por meio de um contexto/adaptador `ORC`, mantendo uma única tela e um único motor reutilizável. O contexto de origem deve fornecer identidade, itens esperados, capacidades, autorização, navegação e consequências da conferência, sem deixar regras de Listas Padrão vazarem para Orçamentos.

Adicionar ao Cadastro de Orçamentos uma ação `Conferir produtos`, disponível para orçamento persistido, em situação aberta e sem alterações locais pendentes. A ação abre a tela compartilhada com os produtos atuais do orçamento, permite leitura por código de barras ou código do produto, quantidade manual quando autorizada por parâmetro, salvamento parcial, reinício e relatório.

O servidor deve ser a autoridade sobre produtos e quantidades esperadas. Na gravação do orçamento e da conferência, deve recalcular a divergência e manter a disponibilidade de venda de forma transacional, registrando uma origem durável para o bloqueio causado pela conferência. Alterações posteriores nos produtos devem reconciliar a conferência e reaplicar o bloqueio quando necessário.

## User Stories

1. Como usuário com acesso de consulta ao orçamento, quero visualizar sua conferência para conhecer o estado das quantidades sem alterar dados.
2. Como usuário com permissão de alteração, quero iniciar a conferência de um orçamento persistido e aberto.
3. Como usuário, quero que a ação de conferência fique indisponível enquanto o orçamento possuir alterações não salvas, com orientação para salvar primeiro.
4. Como conferente, quero localizar produtos por código de barras ou código do produto.
5. Como conferente, quero informar entradas no formato `quantidade*código` quando a quantidade manual estiver habilitada.
6. Como administrador, quero que a permissão de quantidade manual seja validada também no servidor.
7. Como conferente, quero que cada leitura incremente a quantidade lida e atualize falta, excesso e totais imediatamente.
8. Como conferente, quero identificar visualmente qualquer item divergente, tanto por falta quanto por excesso.
9. Como conferente, quero que um item exatamente conferido seja distinguido de um item divergente.
10. Como conferente, quero consultar código visual, descrição, grades e fotos relevantes do produto.
11. Como conferente, quero que o foco retorne à entrada após cada leitura ou erro para continuar a operação.
12. Como conferente, quero salvar uma conferência parcial e retomá-la depois.
13. Como conferente, quero reiniciar todas as leituras antes de salvar.
14. Como conferente, quero reiniciar apenas os itens divergentes antes de salvar.
15. Como conferente, quero imprimir ou gerar o relatório da conferência do orçamento.
16. Como usuário, quero voltar da conferência ao orçamento correto.
17. Como usuário, quero receber uma mensagem clara quando o salvamento continuar com produtos pendentes.
18. Como usuário, quero que produtos que não pertencem ao orçamento sejam rejeitados sem alterar a conferência.
19. Como usuário, quero que a tela de orçamento nunca ofereça a exclusão de produtos não lidos, pois essa operação é exclusiva de Listas Padrão.
20. Como usuário, quero poder conferir voluntariamente mesmo quando os parâmetros de obrigatoriedade estiverem desligados.
21. Como gestor, quero que a obrigação de conferência somente seja aplicada quando os dois parâmetros definidos estiverem ativos.
22. Como operador de Frente de Caixa, quero que orçamento aberto e divergente fique indisponível quando os dois parâmetros estiverem ativos.
23. Como operador de Frente de Caixa, quero que a conclusão exata da conferência libere imediatamente o orçamento quando o bloqueio tiver sido causado pela conferência.
24. Como gestor, quero que indisponibilidades manuais ou causadas por outras validações não sejam removidas pela conclusão da conferência.
25. Como usuário, quero que o orçamento seja salvo mesmo quando a conferência estiver pendente, recebendo a advertência e a opção de abrir a conferência.
26. Como usuário, quero que alterações em produtos preservem leituras dos produtos inalterados.
27. Como usuário, quero que produtos novos iniciem com quantidade lida zero.
28. Como usuário, quero que produtos removidos deixem de participar da conferência.
29. Como usuário, quero que mudanças na quantidade esperada preservem a leitura e recalculem a divergência.
30. Como gestor, quero que uma alteração posterior que recrie divergência reaplique o bloqueio do Frente de Caixa quando os parâmetros estiverem ativos.
31. Como usuário, quero que produtos repetidos em linhas ou filiais sejam conferidos pela quantidade total autoritativa do produto.
32. Como usuário, quero que produtos compostos configurados para conferência por componentes sejam detalhados corretamente.
33. Como usuário, quero que o progresso de um composto seja derivado dos kits completos permitidos pelas leituras de seus componentes.
34. Como usuário, quero que produtos compostos não configurados para detalhamento sejam conferidos como o produto principal.
35. Como usuário, quero ser avisado se a composição do orçamento mudar enquanto eu estiver conferindo, sem sobrescrever dados atuais.
36. Como gestor, quero que duas gravações concorrentes da mesma conferência não produzam perda silenciosa de leituras.
37. Como responsável por segurança, quero que o cliente não consiga adicionar produtos, mudar quantidades esperadas ou reutilizar permissões de Listas Padrão no contexto do orçamento.
38. Como mantenedor, quero que a conferência de Listas Padrão continue funcionando, inclusive sua regra exclusiva de produtos inesperados.
39. Como mantenedor, quero que novos módulos possam reutilizar o motor e a tela informando apenas seu contexto e capacidades.
40. Como auditor, quero que usuário e data da conferência sejam registrados sem criar um segundo mecanismo de auditoria além dos logs já mantidos pelo banco.

## Implementation Decisions

- Usar o tipo de origem `ORC` para identificar conferências de orçamento.
- Implementar Orçamentos como novo contexto/adaptador do motor compartilhado, sem duplicar tela, parser, cálculos ou persistência genérica.
- Tornar autorização, URLs de navegação, relatório e capacidades dependentes do contexto; nenhuma operação de `ORC` pode depender da policy ou das rotas de Listas Padrão.
- Autorizar consulta pela permissão de visualização do orçamento. Leitura, digitação, reinício e salvamento exigem permissão de alteração do orçamento.
- Permitir a ação apenas para orçamento existente, em situação aberta e sem alterações locais pendentes. A disponibilidade da ação independe dos parâmetros de obrigatoriedade.
- Carregar os itens esperados da versão persistida e atual do orçamento. Agrupar ocorrências do mesmo produto e somar suas quantidades antes de comparar leituras.
- Tratar o servidor como autoridade sobre identidade, quantidade esperada e capacidade do contexto. Rejeitar produtos inesperados em `ORC` com resposta de validação e nenhuma mutação.
- Considerar uma conferência completa somente quando todos os itens possuírem quantidade lida exatamente igual à esperada. Falta e excesso são divergências.
- Preservar salvamento parcial. A conferência não é uma trava para salvar o orçamento; quando obrigatória e divergente, ela é uma trava para sua disponibilidade no Frente de Caixa.
- Aplicar a trava somente para orçamento aberto quando os dois parâmetros estiverem ativos simultaneamente.
- Persistir a origem do bloqueio de disponibilidade. A conclusão da conferência só pode reativar automaticamente o orçamento quando esse marcador comprovar que a conferência causou o bloqueio e nenhuma outra regra continuar impedindo a disponibilidade.
- Reavaliar os parâmetros e todas as demais causas de indisponibilidade dentro da operação que tenta reativar o orçamento.
- Reconciliar leituras ao alterar produtos: preservar itens inalterados, iniciar novos em zero, remover órfãos e manter a leitura ao mudar apenas a quantidade esperada.
- Reaplicar a indisponibilidade quando uma alteração de produtos recriar divergência sob os dois parâmetros ativos.
- Modelar componentes de produtos compostos com identidade estável que inclua o produto composto pai, o componente e o número da ocorrência. Não usar uma chave que possa colidir entre pais diferentes.
- Expandir componentes somente quando a característica do produto exigir conferência de composto. Nos demais casos, conferir o produto principal.
- Não oferecer no contexto `ORC` a inclusão de item inesperado nem a remoção de produtos não lidos da fonte.
- Evitar efeitos persistentes em uma simples consulta. Criar ou atualizar cabeçalho e linhas apenas em operação autorizada de mutação.
- Retornar um token opaco de versão da fotografia autoritativa e exigir esse token no salvamento. Em conflito, responder sem mutação parcial e orientar recarga.
- Serializar a atualização da conferência e a consequência sobre disponibilidade para impedir reativação incorreta em concorrência com alterações do orçamento.
- Retornar após o salvamento o estado autoritativo da conferência, sua completude e a disponibilidade resultante do orçamento.
- Manter o log de alterações provido pelos gatilhos existentes como fonte de auditoria, além do usuário/data próprios do cabeçalho da conferência. Não registrar payloads de depuração com dados operacionais.
- Corrigir no componente compartilhado a apresentação de excesso como divergência, preservando compatibilidade funcional da conferência de Listas Padrão.
- Avaliar os valores correntes dos parâmetros em cada operação relevante. Se um parâmetro for desligado, uma futura operação poderá remover apenas o bloqueio cuja origem comprovada seja a conferência e desde que não exista outro impedimento.

## Testing Decisions

- Concentrar a cobertura funcional nos contratos HTTP de mais alto nível para abertura, leitura, salvamento, reconciliação, autorização, parâmetros, disponibilidade e concorrência de `ORC`.
- Manter testes de regressão do fluxo `LPA`, em especial inclusão de inesperados e remoção de não lidos, demonstrando que as capacidades são específicas do contexto.
- Testar acesso de consulta separado de mutações: visualizar com permissão de consulta e rejeitar leitura, digitação, reinício e salvamento sem permissão de alteração.
- Testar que a ação e os endpoints recusam orçamento inexistente, não persistido ou fora da situação aberta quando aplicável.
- Testar agregação das quantidades esperadas de um produto repetido e comparação por igualdade exata.
- Testar falta, excesso, igualdade, entrada unitária, entrada `quantidade*código`, quantidade manual desabilitada e produto inesperado.
- Testar produtos compostos com e sem detalhamento, incluindo dois compostos que compartilhem o mesmo componente.
- Testar salvamento parcial e retomada sem perda de leituras.
- Testar as quatro combinações dos dois parâmetros e comprovar que apenas ambos ativos aplicam a trava.
- Testar que salvar orçamento divergente conclui o salvamento, marca indisponibilidade e retorna advertência/ação para conferência.
- Testar reativação imediata após conferência exata quando a conferência é a origem do bloqueio.
- Testar que indisponibilidade manual ou causada por outra validação permanece falsa após concluir a conferência.
- Testar reconciliação após incluir, remover e alterar quantidade de produto, inclusive reabertura de divergência após uma conferência completa.
- Testar conflito por token obsoleto e concorrência entre alteração de produtos e salvamento da conferência, assegurando ausência de mutação parcial e reativação indevida.
- Testar que a consulta não cria registros e que payload adulterado não modifica itens esperados nem adiciona produto ao orçamento.
- Reservar testes de componente frontend para comportamentos exclusivamente visuais: estado do botão, foco, cores de falta/excesso, URLs recebidas do servidor, mensagens e ausência da confirmação exclusiva de LPA.
- Usar testes unitários menores apenas para regras puras que não sejam observáveis adequadamente no contrato funcional, como parsing ou cálculo de kits compostos.

## Out of Scope

- Implementar ou migrar o módulo Frente de Caixa; o escopo termina na manutenção correta da disponibilidade consumida por ele.
- Migrar conferências de Contratos, notas fiscais, transferências ou outros tipos além de `ORC`.
- Alterar as regras funcionais próprias de Listas Padrão, salvo adaptações compatíveis necessárias para separar capacidades e corrigir a indicação compartilhada de excesso.
- Redesenhar o cadastro de produtos, a grade de itens ou todo o fluxo de gravação de Orçamentos.
- Criar ou alterar a tela administrativa dos parâmetros existentes.
- Fazer conferência de estoque, inventário ou cadastro físico de produtos.
- Executar preenchimento retroativo em massa para orçamentos antigos.
- Reproduzir limitações ou possíveis bugs legados, como aceitar excesso ou comparar linhas isoladas em vez do total do produto.
- Implementar código neste workspace de análise.

## Further Notes

- Evidência confirmada no Delphi: a ação de conferência existe na área de produtos do orçamento, usa a tela compartilhada e é habilitada para orçamento persistido em situação aberta.
- Evidência confirmada no Delphi: a busca do Frente de Caixa filtra a disponibilidade do orçamento; portanto, esse campo é um contrato operacional e não apenas visual.
- Evidência confirmada no Delphi: a verificação legada de pendência observa apenas falta. Isso foi classificado como possível bug legado e não constitui requisito.
- Evidência confirmada no Laravel: o motor e a tela já existem para `LPA`, mas autorização, rotas, navegação, relatório e algumas mensagens ainda estão acoplados a Listas Padrão.
- Evidência divergente no Laravel: excesso é calculado, porém a apresentação atual pode tratá-lo visualmente como concluído. A regra de destino exige igualdade exata.
- Decisão nova confirmada pelo responsável de domínio: finalizar a conferência deve marcar automaticamente o orçamento como disponível, exclusivamente quando a conferência tiver causado a indisponibilidade.
- Decisão nova técnica: usar controle explícito de versão e origem durável do bloqueio para evitar perda de atualização e reativação indevida.
