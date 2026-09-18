# Prompt corretivo — simulação do processamento e paridade dos SQLs de estoque

## Contexto

Revise a implementação atual do Cadastro de Inventário no Laravel usando o código vigente, as specs 478–482 e os artefatos deste diretório. Não solicite inspeção direta dos fontes Delphi. Este prompt corrige uma lacuna funcional e de SQL identificada após a comparação com as consultas reais de processamento: o Delphi permite visualizar a projeção do processamento antes de confirmar, pois um inventário aberto pode ficar desatualizado enquanto movimentos continuam sendo lançados.

O objetivo não é criar um cálculo financeiro novo. É reproduzir, no Laravel, a prévia operacional que responde: “se eu processar agora, quais diferenças, movimentos, saldos e valores serão gerados considerando os movimentos ocorridos depois da inclusão/alteração do item?”.

## Diagnóstico comprovado

### O que foi coberto anteriormente

- O F8 foi especificado como operação efetiva, atômica e autorizada.
- Foram registrados `IE+`, `IE-`, `IR-` e `IP-`, a ordem de abatimento, rollback, situação `P`, bloqueio por movimentos posteriores e o painel de saldo negativo posterior.
- Foram mencionados os campos legados `movimentado`, `saldoaposprocessamento`, `financeiroprocessamento` e a atualização antes/depois do processamento.

### O que faltou especificar

- Não existe no contrato uma operação explícita de **Simular processamento/Prévia do F8**, separada da gravação efetiva.
- O usuário não recebe uma lista dos movimentos que seriam criados nem a causa de cada divergência antes de autorizar o F8.
- Não está garantido que a simulação e o F8 usem o mesmo plano de efeitos; fórmulas duplicadas podem produzir uma prévia diferente do processamento.
- A implementação Laravel atual de `LegacyInventarioReadRepository::listItens` lê `inventarioprodutos`, `produtos`, `caracteristicas` e `estoques`, mas não reproduz a fotografia histórica do último movimento em `movimentos`/`movimentoslotes`, os movimentos posteriores, o custo/financeiro de processamento nem o cálculo completo de `movimentado`.
- `ProcessarInventarioCommand`/`LegacyInventarioMovimentoWriteRepository` deve revalidar e reconstruir o plano dentro da transação; não pode confiar apenas nos saldos previamente persistidos no item do inventário.

## Contrato da simulação

Criar uma operação de leitura, chamada no código e na UI de `simular processamento` ou `prévia do processamento`, com contrato próprio. Ela deve:

1. receber Inventário, Filial, revisão/fotografia de consulta e filtros de colunas;
2. confirmar escopo da Filial e situação `A`, sem mudar situação e sem exigir a senha de gravação apenas para consultar;
3. ler o saldo vigente na data do inventário e todos os movimentos posteriores relevantes até a data/hora de processamento projetada;
4. calcular a diferença usando a quantidade inventariada e o saldo recalculado, incluindo estoque, reserva, reserva prévia e os demais saldos que participam do domínio;
5. projetar exatamente os efeitos que o F8 criaria:
   - diferença positiva: `IE+`;
   - diferença negativa: `IE-` no estoque, depois `IR-` na reserva, depois `IP-` na reserva prévia;
   - Produto controlado por lote: a mesma projeção por lote;
   - trânsito não é abatido, preservando a regra observada;
6. calcular quantidade, custo unitário, `valor = custo unitário × quantidade`, financeiro e total por efeito com a mesma regra usada na gravação;
7. informar a projeção de saldo após processamento, inclusive saldos negativos posteriores;
8. indicar bloqueios e avisos antes do F8: item alterado/movimentado depois da inclusão, quantidade não inventariada a zerar, limite de dias, inconsistência de lotes, coleta pendente, saldo negativo e qualquer conflito de revisão;
9. retornar um identificador/versão da prévia que o F8 possa comparar. Se a fotografia mudou, o F8 deve invalidar a prévia e recalcular, nunca gravar silenciosamente um plano velho.

### Não gravação

A simulação não pode:

- inserir, atualizar ou excluir `movimentos`/`movimentoslotes`;
- alterar `inventarioprodutos`, `inventarioprodutoslotes`, `estoques` ou `situacao`;
- executar triggers de escrita como efeito colateral;
- publicar `P`, consumir número de movimento ou criar auditoria de sucesso de processamento.

Pode registrar telemetria técnica da consulta se o padrão do sistema exigir, mas isso não pode alterar o domínio legado nem ser usado como prova de que o processamento foi realizado.

## UI e fluxo

- Disponibilizar a prévia na tela do cadastro aberto, próxima ao botão `Processar`, com o padrão de botões, ícones, tooltip e atalhos do ERP.
- Para consulta pesada, usar o pipeline cancelável de F6/geração pesada: Cancelar deve aparecer antes da primeira operação assíncrona e interromper job/consulta no backend quando suportado.
- Mostrar um grid de movimentos projetados com Produto, lote, tipo, origem do abatimento, quantidade, custo unitário, valor, saldo antes e saldo depois.
- Mostrar um resumo por produto/lote: quantidade inventariada, saldo recalculado, diferença, movimentado posterior, saldo após processamento, financeiro/custo e status de bloqueio.
- Destacar divergência causada por movimentação posterior à inclusão/alteração; não tratar isso somente como uma mensagem genérica de erro.
- Permitir abrir o detalhe dos movimentos posteriores que compõem o cálculo, com exportação e personalização conforme o grid padrão.
- O F8 continua sendo a única operação que grava. Antes da confirmação, apresentar a prévia atual; ao confirmar, o servidor deve recalcular o plano dentro da transação e comparar a revisão/fotografia.
- Não transformar a prévia em processamento automático, nem permitir processamento offline pela coleta mobile.

## Paridade SQL obrigatória

Use como referência funcional as consultas registradas em `pesquisa-sqls-parametros-delphi.md`, incluindo:

- detecção de movimento posterior por Produto/Filial e `processamento > datahoraalteracao`;
- contagem de itens `selecionadosistema` que serão zerados;
- último movimento até a data do inventário, ordenado por data e lançamento;
- somas de movimentos posteriores por posição da operação para o cálculo de `movimentado`;
- cálculo de `SaldoAposProcessamento`, diferença, custo médio, financeiro e `financeiroprocessamento`;
- consultas equivalentes por lote em `movimentoslotes`;
- atualização lógica “antes do processamento” para reconstruir o saldo da data do inventário;
- atualização lógica “após o processamento” para persistir os saldos de processamento somente depois dos movimentos efetivos;
- consulta de estoque negativo acima da data de processamento.

No Laravel:

- separar explicitamente a consulta da prévia, a montagem do plano de efeitos e a persistência;
- reutilizar o mesmo `ProcessingPlan`/serviço de domínio para simulação e F8; o modo simulação somente materializa DTOs e o modo efetivo grava;
- fazer leitura set-based por Inventário, Filial, Produto e Lote, usando CTE, `DISTINCT ON`, window function, agregações ou joins equivalentes conforme o schema autoritativo;
- substituir cada subconsulta correlacionada por linha por consultas em lote, `IN`, `= ANY(array)` ou `unnest` quando aplicável;
- não buscar “último movimento” em um loop PHP;
- não gerar uma query por produto, lote ou efeito;
- manter binds e whitelist; nunca interpolar listas, expressões ou fragments enviados pelo navegador;
- validar nulabilidade, FK e cardinalidade no snapshot de schema. Relações obrigatórias com colunas `NOT NULL` devem usar `INNER JOIN`; `LEFT JOIN` somente quando a ausência for funcionalmente permitida;
- não testar driver, não testar `hasTable`/`Schema::has*` e não introspectar schema em runtime;
- não inventar colunas, tabelas, funções ou triggers. Se o snapshot não confirmar um objeto legado, manter o gate de schema e registrar a dependência.

## Regras de custo e financeiro

- A prévia deve exibir o mesmo valor que será enviado em `movimentos.valor` no F8.
- O valor de cada efeito é custo unitário aplicável ao Produto/Lote multiplicado pela quantidade absoluta do efeito; tipo/operação determina a direção.
- Não preencher `financeiro` ou outros campos por suposição: preservar a regra do writer/triggers compartilhados, documentar a origem efetivamente comprovada e bloquear o SQL se o schema não confirmar defaults/triggers.
- O custo unitário deve respeitar a mesma ordem de fallback documentada: custo do item/processamento, financeiro e quantidade do saldo, último preço de compra e último movimento elegível, sempre com precisão decimal do sistema.
- Testar diferenças positivas, negativas que atravessem estoque/reserva/reserva prévia, lote, custo zero, estoque vazio, movimentos posteriores e saldos negativos.

## Concorrência e cancelamento

- A prévia é uma fotografia informativa; informar revisão/instante e validade.
- F8 bloqueia o Inventário, revalida revisão, situação, Filial, movimentos posteriores, lotes e sessões de coleta dentro da mesma transação.
- Se qualquer cálculo mudar, descartar a prévia antiga e devolver conflito/recalculo; nunca aplicar parcialmente.
- Cancelar a prévia deve cancelar o job/consulta PostgreSQL quando a operação ainda estiver em execução; não basta abortar o Axios ou esconder o resultado.

## Critérios de aceite

- Para o mesmo estado do banco, a simulação e o F8 produzem a mesma lista ordenada de efeitos, tipos, lotes, quantidades, custos e valores.
- Um movimento lançado depois da inclusão aparece na simulação, altera a diferença/saldo projetado e impede ou exige revisão no F8 conforme a regra do módulo.
- A simulação não cria movimento, não altera estoque, não muda situação e não consome número.
- Produto sem lote e Produto com lote têm prévia equivalente à regra do legado.
- Diferença negativa é sempre decomposta em `IE-`, `IR-`, `IP-` nessa ordem, sem abater trânsito.
- A prévia informa itens não inventariados, saldos negativos posteriores, lotes divergentes e demais bloqueios antes do F8.
- Mudança concorrente entre prévia e F8 gera conflito/recalculo, sem escrita parcial.
- O F6/relatório e o grid exibem os campos calculados pelo mesmo catálogo, sem N+1, com exportação, ordenação, personalização e Cancelar.
- Testes de integração medem orçamento de queries: a quantidade de produtos/lotes não pode multiplicar o número de consultas por linha.

## Entrega

Produzir a especificação corretiva, contratos HTTP/DTO, serviço comum de plano de processamento, consultas SQL set-based, matriz de estados/bloqueios, testes de paridade e tasks implementáveis. Não executar `/speckit.specify` neste prompt e não alterar o código nesta etapa.
