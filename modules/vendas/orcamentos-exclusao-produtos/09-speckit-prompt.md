# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica de correção para o fluxo de exclusão de Produtos pelo botão localizado acima do grid de Produtos no Cadastro de Orçamentos Laravel.

Não implemente nesta etapa. Produza uma especificação pronta para planejamento e implementação, baseada na evidência Delphi e no comportamento Laravel atual. Inspecione o código antes de concluir e corrija qualquer hipótese deste prompt que seja contrariada por evidência concreta.

## Problema observado

Um Orçamento possuía diversos Produtos, totalizando aproximadamente R$ 5.000,00, e desconto geral fixo de R$ 50,00. Após excluir sucessivamente os Produtos pelo botão acima do grid, restou um Produto de R$ 49,00.

O Laravel passou a apresentar total líquido de R$ -1,00, mas os valores dos planos e parcelas permaneceram com os valores anteriores. Além disso, a exclusão realizada por esse botão não reproduz a gravação automática executada pelo Delphi.

O fluxo precisa manter Produto, totais, desconto geral, percentual, planos e parcelas coerentes e persistidos atomicamente após cada exclusão confirmada.

## Vocabulário

- `Produto`: linha de Produto vinculada ao Orçamento.
- `Total dos Produtos`: soma líquida das linhas após desconto por item, antes de cupom, cashback e desconto geral.
- `Desconto geral`: desconto global do Orçamento, informado em valor ou derivado de percentual.
- `Total financiável`: base usada para recalcular planos, considerando Produtos, Serviços, descontos, Frete, Seguro e Crédito de troca conforme as regras já existentes.
- `Plano`: condição de pagamento vinculada ao Orçamento.
- `Parcela`: desdobramento financeiro de um Plano.
- `Exclusão automática`: operação iniciada pelo botão acima do grid que exclui e grava imediatamente, sem exigir clique posterior em Salvar.

## Regras de evidência

Analise PAS e DFM conjuntamente, incluindo eventos do botão e dataset, data module, queries, callbacks, serviços de totais, descontos, financiamento, gravação, permissões e testes.

Classifique cada descoberta relevante como:

- CONFIRMADO;
- INFERIDO;
- DÚVIDA;
- NÃO LOCALIZADO;
- DIVERGENTE;
- POSSÍVEL BUG LEGADO;
- DECISÃO NOVA.

Toda conclusão deve apontar evidência concreta. Não transforme automaticamente limitações ou bugs do Delphi em requisitos.

## Evidência Delphi confirmada

- [CONFIRMADO] O botão `sbnExcluirProduto`, definido no form de Orçamentos, chama `sbnExcluirProdutoClick`.
- [CONFIRMADO] O handler verifica se os campos podem ser alterados e chama, nesta ordem funcional, `ExcluirProdutoOrcamento`, `GravarLinhas` e `GravarOrcamento` com origem da tela de Orçamentos.
- [CONFIRMADO] Portanto, a exclusão pelo botão acima do grid é gravada automaticamente no Delphi.
- [CONFIRMADO] `ExcluirProdutoOrcamento` solicita confirmação antes de remover a linha.
- [CONFIRMADO] A exclusão do dataset dispara `qryProdutosOrcamentosAfterDelete`, que chama `CalcularValorTotalProdutos`.
- [CONFIRMADO] `CalcularValorTotalProdutos` percorre os Produtos, recalcula total e quantidade, reavalia cupom e marca que os Planos precisam ser alterados quando o total mudou.
- [CONFIRMADO] Após a exclusão, `ExcluirProdutoOrcamento` chama explicitamente `ReCalcularPlanosPagamento`.
- [CONFIRMADO] Quando `percentualdescontogeral` é diferente de zero, a alteração de `totalprodutos` recalcula `descontogeral` como percentual do novo total.
- [CONFIRMADO] Quando o desconto geral foi informado somente em reais, com percentual zero, o Delphi preserva o valor fixo após reduzir os Produtos.
- [CONFIRMADO] O total do Orçamento Delphi subtrai cupom, cashback e desconto geral dos Produtos e adiciona Serviços, Frete e Seguro.
- [POSSÍVEL BUG LEGADO] Com Produto de R$ 49,00 e desconto geral fixo de R$ 50,00, o legado pode manter total líquido negativo. Esse comportamento não deve ser reproduzido.

Antes de finalizar a spec, documente também o que ocorre no motor Delphi de financiamento quando a base fica zero ou negativa. Trate isso como evidência histórica, não como requisito automático.

## Estado Laravel confirmado

- [CONFIRMADO] O botão acima do grid e outros pontos de exclusão convergem para `handleExcluirProduto`.
- [CONFIRMADO] O handler pede confirmação, remove a linha do estado local, chama `applyProdutosTotais`, limpa a seleção, marca o modal como alterado e agenda a cascata de valores.
- [CONFIRMADO] `applyProdutosTotais` atualiza Produtos, `totalprodutos`, quantidade, cashback gerado e, quando há percentual de desconto geral, sincroniza o valor do desconto.
- [CONFIRMADO] Quando o percentual é zero, o desconto fixo em reais é mantido.
- [CONFIRMADO] A cascata usa uma espera de 350 ms, chama o endpoint de validação de valores e, após sucesso, chama o recálculo dos Planos.
- [CONFIRMADO] O frontend calcula a base do financiamento com `Math.max(0, ...)`; no cenário R$ 49,00 menos R$ 50,00, envia `valor_mercadoria = 0`.
- [CONFIRMADO] O request do endpoint de recálculo de financiamento exige `valor_mercadoria > 0` para esse fluxo.
- [CONFIRMADO] A requisição de recálculo é rejeitada quando recebe zero.
- [CONFIRMADO] O `.catch` do recálculo mantém os Planos atuais e não apresenta erro ao Usuário.
- [CONFIRMADO] Essa combinação explica os Planos antigos observados: a exclusão atualiza o cabeçalho, mas o recálculo falha silenciosamente.
- [DIVERGENTE] A exclusão Laravel atual permanece no estado do formulário e não executa automaticamente a mesma gravação imediata do Delphi.
- [NÃO LOCALIZADO] Não foi localizado teste frontend de regressão cobrindo exclusão de Produto, ajuste do desconto e atualização dos Planos.
- [NÃO LOCALIZADO] Não foi localizado teste de financiamento cobrindo base zerada causada por desconto superior ao saldo dos Produtos.

## Solução funcional

Ao confirmar a exclusão pelo botão acima do grid, o Laravel deve executar uma única operação funcional:

1. validar permissão e editabilidade do Orçamento;
2. excluir o Produto selecionado;
3. recalcular totais e quantidade dos Produtos;
4. reaplicar/validar cupom e cashback conforme regras existentes;
5. ajustar o desconto geral e seu percentual quando ultrapassarem o teto permitido;
6. recalcular o Total Líquido;
7. recalcular Planos e Parcelas uma única vez com o estado final;
8. gravar automaticamente toda a alteração;
9. retornar o estado autoritativo completo;
10. atualizar a interface somente após sucesso.

A operação deve ser atômica. Não pode persistir apenas parte da exclusão ou deixar o formulário divergente do banco.

## Regra do desconto geral após exclusão

Quando a exclusão reduzir a base disponível dos Produtos, limite automaticamente o desconto geral.

O teto confirmado é:

`desconto geral máximo = total dos Produtos − cupom − cashback − R$ 0,01`

Regras:

1. O Total dos Produtos já considera os descontos por item.
2. Frete, Seguro e Serviços não aumentam o teto do desconto geral.
3. O teto nunca pode ser negativo; nesse caso, usar zero.
4. O desconto geral nunca pode consumir 100% do saldo dos Produtos: deve restar ao menos R$ 0,01 quando houver saldo positivo.
5. Se o desconto atual for menor ou igual ao teto, preservá-lo.
6. Se for maior, substituí-lo pelo teto.
7. Atualizar de forma coerente `descontogeral` e `percentualdescontogeral`.
8. Se o desconto era percentual, recalcular o valor sobre a nova base e aplicar também o teto.
9. Se o desconto era fixo em reais, preservar o valor enquanto couber; caso contrário, reduzi-lo ao teto.
10. Não reutilizar uma autorização antiga para um percentual efetivo diferente sem respeitar as regras atuais de autorização de desconto.

No exemplo:

- Total dos Produtos: R$ 49,00;
- cupom: R$ 0,00;
- cashback: R$ 0,00;
- desconto geral anterior: R$ 50,00;
- novo desconto geral máximo: R$ 48,99;
- saldo líquido mínimo dos Produtos: R$ 0,01.

O cálculo deve usar centavos/decimal de forma determinística, sem depender de ponto flutuante binário para decisões monetárias.

## Exclusão de todos os Produtos

Se a exclusão deixar o Orçamento sem Produtos:

- zerar `descontogeral`;
- zerar `percentualdescontogeral`;
- zerar/reavaliar cupom e rateios que dependam de Produtos conforme as regras existentes;
- validar cashback e Crédito de troca conforme as regras existentes;
- recalcular o documento com eventuais Serviços, Frete e Seguro;
- recalcular Planos e Parcelas usando o total financiável restante;
- se o total financiável final for zero, remover ou zerar Planos e Parcelas de forma coerente;
- nunca conservar valores financeiros antigos.

A especificação deve decidir, com base nos invariantes existentes do módulo, se Planos de valor zero são removidos ou mantidos zerados. Prefira uma única representação canônica e não envie base zero para um endpoint que exige valor positivo.

## Gravação automática

A exclusão pelo botão acima do grid deve gravar automaticamente, como no Delphi.

Não depender de clique posterior no botão Salvar.

A gravação deve abranger, na mesma unidade atômica:

- remoção do Produto;
- resequenciamento de linhas, se aplicável;
- cabeçalho e totais;
- desconto geral e percentual;
- cupom/cashback/rateios afetados;
- Planos;
- Parcelas;
- campos derivados afetados pela existência de montagem/entrega;
- Auditoria já fornecida pelos gatilhos do banco.

O backend deve reconstruir e validar os cálculos autoritativamente. Não confiar em totais, descontos ou Planos arbitrários enviados pelo navegador.

Se a arquitetura atual grava o Orçamento completo, a spec pode reutilizar essa costura, desde que a exclusão seja identificada, autorizada, atômica e não sobrescreva alterações concorrentes.

## Concorrência e consistência

- Desabilitar novas exclusões e ações conflitantes enquanto a operação estiver processando.
- Impedir duplo clique e submissões duplicadas.
- Proteger contra versão antiga do Orçamento ou Produto já removido em outra sessão.
- Detectar conflito de concorrência e não sobrescrever silenciosamente estado mais novo.
- Recalcular Planos apenas uma vez, depois de estabilizar Produtos, cupom, cashback e desconto geral.
- Evitar timers concorrentes e respostas tardias sobrescrevendo resultados mais recentes.
- Cancelar ou invalidar cascatas pendentes relativas ao estado anterior.
- Retornar o snapshot final autoritativo de cabeçalho, Produtos, Planos e Parcelas.

## Tratamento de sucesso e falha

### Sucesso

- Atualizar o grid e remover a linha.
- Atualizar totais e quantidade.
- Atualizar desconto geral e percentual.
- Atualizar Planos e Parcelas.
- Reestabelecer seleção/foco de forma previsível.
- Marcar o formulário com o novo baseline persistido, sem indicar alterações não salvas causadas por essa exclusão.
- Se houve ajuste automático de desconto, exibir aviso contendo o valor anterior e o novo valor.

Exemplo de aviso:

`O desconto geral foi ajustado de R$ 50,00 para R$ 48,99 porque os Produtos restantes não comportam o desconto anterior.`

### Falha

- Não manter exclusão apenas na interface.
- Restaurar ou preservar o Produto, totais, desconto, percentual, Planos e Parcelas anteriores.
- Reabilitar os controles.
- Exibir mensagem útil ao Usuário.
- Não engolir falhas de validação, autorização, financiamento, persistência ou concorrência.
- Registrar detalhes técnicos seguros para diagnóstico, sem expor informações sensíveis na interface.

Prefira atualizar a interface somente após o backend confirmar a transação. Se for adotada atualização otimista, a reversão deve ser integral e comprovada por teste.

## Contrato de API

Especifique uma costura de backend única para a exclusão automática, evitando a sequência frágil de alterações locais mais duas requisições independentes.

O contrato deve incluir:

- identidade do Orçamento;
- identidade estável da linha do Produto;
- versão/revisão esperada do Orçamento;
- prova de autorização sensível quando aplicável;
- token idempotente da ação, se necessário;
- resposta com cabeçalho, Produtos, Planos, Parcelas, avisos e nova revisão.

Defina códigos e respostas para:

- sucesso;
- Produto não localizado;
- Orçamento não editável;
- permissão negada;
- conflito de versão;
- desconto ajustado;
- falha de validação financeira;
- impossibilidade de recalcular Planos;
- falha de persistência.

Não exponha detalhes internos do banco. Não use resposta de sucesso se os Planos não puderem ser tornados coerentes.

## Permissões e precondições

- Exigir permissão de alteração do Orçamento.
- Exigir Situação editável, seguindo as regras atuais.
- Confirmar que o Produto pertence ao Orçamento informado.
- Repetir toda validação no backend.
- Manter a confirmação funcional antes da exclusão.
- Respeitar autorização de desconto geral quando o percentual efetivo exigir autorização, sem criar prompts repetidos desnecessários pela mesma operação.

## User stories obrigatórias

A spec deve conter uma lista extensa e numerada, cobrindo pelo menos:

1. Como Usuário autorizado, quero excluir um Produto pelo botão acima do grid e ter a alteração gravada automaticamente.
2. Como Usuário, quero confirmar a exclusão para evitar remoção acidental.
3. Como Usuário, quero ver totais recalculados depois da exclusão.
4. Como Usuário, quero que o desconto percentual acompanhe o novo total.
5. Como Usuário, quero preservar o desconto fixo enquanto ele couber no saldo dos Produtos.
6. Como Usuário, quero que desconto excessivo seja reduzido automaticamente.
7. Como Usuário, quero ser avisado do valor anterior e do novo desconto.
8. Como Usuário, quero que Planos e Parcelas reflitam imediatamente o estado gravado.
9. Como Usuário, quero que o recálculo ocorra uma única vez.
10. Como Usuário, quero remover todos os Produtos sem deixar descontos ou Planos antigos.
11. Como Usuário, quero que Serviços, Frete e Seguro continuem sendo considerados no financiamento, sem ampliarem o teto do desconto dos Produtos.
12. Como Usuário, quero que uma falha preserve integralmente o estado anterior.
13. Como Usuário, quero receber uma mensagem quando o recálculo não puder ser concluído.
14. Como Usuário sem permissão, não quero conseguir excluir por chamada direta ao endpoint.
15. Como Usuário em outra sessão, quero que conflitos sejam detectados em vez de sobrescritos.
16. Como operador, quero evitar exclusões duplicadas por duplo clique.
17. Como responsável financeiro, quero impedir total líquido negativo causado pelo desconto geral.
18. Como mantenedor, quero uma única regra autoritativa de recálculo usada pela exclusão e pela gravação normal.

Amplie a lista para cobrir fluxos felizes, limites monetários, falhas, concorrência e acessibilidade.

## Costura principal de teste

Use como principal costura funcional, no nível mais alto possível:

`abrir Orçamento persistido com Produtos, desconto geral, Plano e Parcelas → acionar Excluir no botão acima do grid → confirmar → observar resposta autoritativa persistida com Produto removido, desconto ajustado, totais atualizados e Plano/Parcelas recalculados`.

Essa costura deve exercitar o comportamento real da tela e do backend, não funções auxiliares isoladas.

## Testing Decisions

Prefira testes de comportamento externo. Cubra no mínimo:

### Regressão exata

- Orçamento com aproximadamente R$ 5.000,00 em Produtos, desconto geral fixo de R$ 50,00 e Planos existentes.
- Excluir até restar Produto de R$ 49,00.
- Verificar desconto ajustado para R$ 48,99.
- Verificar percentual coerente.
- Verificar total dos Produtos e total líquido sem valor negativo.
- Verificar Planos e Parcelas recalculados, sem valores antigos.
- Verificar persistência automática no banco.
- Reabrir o Orçamento e comprovar o mesmo estado.

### Variações de desconto

- desconto fixo que ainda cabe: preservar;
- desconto fixo que excede por R$ 0,01;
- desconto fixo muito maior que a base;
- desconto percentual: recalcular valor e percentual coerentes;
- cupom e cashback presentes;
- descontos por item presentes;
- arredondamento em centavos;
- Produto restante de R$ 0,01;
- nenhum Produto restante.

### Planos

- um Plano selecionado;
- múltiplos Planos, preservando seleção válida;
- Parcelas existentes;
- Serviços/Frete/Seguro restantes;
- total financiável mínimo positivo;
- total financiável zero;
- falha de cálculo sem manter estado antigo;
- comprovar uma única chamada/reexecução lógica de recálculo.

### Atomicidade e falhas

- falha ao recalcular Plano;
- falha ao persistir Produto;
- falha ao persistir cabeçalho;
- falha ao persistir Planos/Parcelas;
- em cada falha, nenhuma alteração parcial no banco;
- interface mantém/restaura snapshot anterior;
- erro é visível ao Usuário.

### Segurança e concorrência

- sem permissão;
- Situação não editável;
- Produto de outro Orçamento;
- duplo clique;
- repetição HTTP;
- Produto já excluído;
- revisão concorrente do Orçamento;
- resposta tardia não sobrescreve estado mais novo.

Reutilize os testes Feature existentes de Cadastro/Gravação de Orçamentos e Financiamento. Adicione teste de componente/página para o botão real do grid, pois o defeito nasce na orquestração frontend e não é coberto apenas pelo endpoint de financiamento.

## Critérios de aceite

1. A exclusão confirmada pelo botão acima do grid é gravada automaticamente.
2. Produto, cabeçalho, descontos, Planos e Parcelas são persistidos atomicamente.
3. O desconto geral nunca deixa menos de R$ 0,01 de saldo dos Produtos quando há saldo positivo.
4. O teto considera Total dos Produtos após desconto por item, menos cupom e cashback.
5. Frete, Seguro e Serviços não ampliam esse teto.
6. Desconto excessivo é ajustado automaticamente e o Usuário é avisado.
7. Valor e percentual do desconto permanecem coerentes.
8. Sem Produtos, desconto geral e percentual ficam zerados.
9. Planos e Parcelas sempre refletem o total final ou adotam a representação canônica definida para total zero.
10. Nenhuma requisição inválida com base zero é silenciosamente ignorada.
11. Falhas não deixam Produto removido apenas na tela nem estado parcial no banco.
12. Cliques repetidos não duplicam a operação.
13. Conflitos de concorrência são detectados.
14. Reabrir o Orçamento apresenta exatamente o estado exibido após o sucesso.
15. O teste de regressão do cenário R$ 49,00/R$ 50,00 passa no nível da tela e do backend.

## Implementation Decisions a registrar

A spec deve explicitar, sem fixar nomes de arquivos:

- a costura única de exclusão automática;
- a fronteira transacional;
- a representação monetária;
- a função autoritativa do teto de desconto;
- a ordem da cascata;
- a estratégia para total financiável zero;
- o contrato de resposta autoritativa;
- concorrência/revisão e idempotência;
- atualização ou rollback da interface;
- autorização de desconto e de alteração;
- seams e fixtures de teste.

## Out of Scope

- Alterar o Delphi.
- Reproduzir o total negativo do legado.
- Redesenhar integralmente o Cadastro de Orçamentos.
- Alterar regras gerais de financiamento não afetadas pela exclusão.
- Modificar a exclusão de Serviços, salvo se a investigação comprovar que ela precisa compartilhar a mesma correção para manter invariantes.
- Criar novos tipos de desconto.
- Executar migrations sem necessidade comprovada pela especificação.

## Formato esperado

Produza obrigatoriamente:

1. Problem Statement;
2. Solution;
3. User Stories extensas e numeradas;
4. Implementation Decisions;
5. Testing Decisions;
6. Out of Scope;
7. Further Notes;
8. matriz de evidências Delphi × Laravel;
9. sequência da operação e fronteira transacional;
10. contrato de API;
11. regras monetárias com exemplos;
12. critérios de aceite verificáveis;
13. dúvidas remanescentes separadas dos requisitos.
```
