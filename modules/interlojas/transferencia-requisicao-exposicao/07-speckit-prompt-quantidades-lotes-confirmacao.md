# Prompt para `/speckit.specify` — paridade de quantidade, lotes e confirmação

````text
/speckit.specify

Crie uma especificação de correção para o Laravel de Interlojas →
Transferência de Requisição para Exposição, focada na paridade comportamental
do Delphi em quantidade recebida, marcação/desmarcação de lote, conferência e
confirmação. Não implemente código nesta etapa e não altere Delphi, schema,
migrations, triggers ou funções PostgreSQL.

Leia os prompts 01–06, as pesquisas deste diretório, o snapshot
`schema/postgresql-authoritative-2026-08-06.json` e o checkout Laravel atual.
Use como evidência primária `dmtransferenciarequisicaoexposicao.pas` e
`fmtransferenciarequisicaoexposicao.pas`, conforme transcrito nas pesquisas.
Para cada divergência cite arquivo/linha Laravel e a evidência Delphi.

## Comportamento obrigatório

1. **Marcar produto para lote**: ao marcar `marcarlotetransferencia=true`,
   preencher `pedidosfiliais.qtderecebida` com a mesma `qtdepedida`, sem exceder
   o saldo permitido e respeitando situação, revisão e estoque/reserva.
2. **Desmarcar produto sem lote**: limpar `qtderecebida` e o lote.
3. **Desmarcar produto já loteado**: perguntar explicitamente “Confirma a
   retirada do produto do lote?”. Se confirmar, apagar somente a conferência
   `produtosconferencia` do tipo `TRF` para aquele lote/produto, limpar lote e
   quantidade e manter auditoria. Se recusar, restaurar a quantidade anterior
   e manter a marcação; nunca apagar silenciosamente.
4. **Quantidade manual**: zero deve desmarcar e seguir a regra acima; valores
   positivos não podem superar o limite de `reservapreviarequisitada` quando o
   parâmetro `RequisicaoSubtraiEstoque` estiver ativo, ou `estoquerequisitada`
   quando estiver inativo. Validar novamente sob lock no servidor.
5. **Conferência**: `Conferir` deve garantir lote válido (criando-o quando a
   regra Delphi exigir), operar no conjunto de linhas marcadas e persistir
   leituras `TRF` idempotentes. Divergências `qtderecebida != lido` e
   `qtderecebida > saldo` devem ser exibidas antes do F8.
6. **Confirmação F8**: processar somente linhas elegíveis (situação `A`, lote
   marcado e quantidade positiva), agrupar por requisitante como no Delphi,
   aplicar movimentos/estoque/reserva e reinclusão de saldo pendente conforme
   parâmetro. Não confirmar silenciosamente linha sem lote ou com conferência
   divergente.

## Contrato técnico

- Diferenciar estado editável local de estado persistido; salvar quantidade,
  lote e observação com revisão/identity check.
- Locks de `pedidosfiliais`, estoques, lotes e conferências em ordem
  determinística; operações idempotentes e rollback conforme a unidade definida
  pelos prompts anteriores.
- SQL parametrizado e set-based para apagar/consultar conferências e atualizar
  múltiplas linhas; nenhum N+1, `Locate` server-side ou concatenação SQL.
- Reutilizar os componentes de conferência, grid, parâmetros e autorização já
  existentes. Não criar regra fiscal nem fluxo de venda entre filiais.

## Aceite e testes

Especifique testes PostgreSQL (não apenas SQLite) para: marcar copia a
quantidade pedida; desmarcar sem lote; desmarcar com lote confirmando e
recusando a retirada; remoção restrita à conferência `TRF`; quantidade zero,
limite de saldo e revisão obsoleta; múltiplas linhas/lotes; lote criado ao
conferir; leitura duplicada; faltante/excedente; confirmação agrupada por
requisitante; reinclusão de saldo; concorrência, retry e rollback. Verifique
explicitamente que a UI não confirma linha apenas porque a quantidade foi
preenchida automaticamente.

Entregue diagnóstico (correto/divergente/incompleto), contratos de endpoint e
resposta, transições de estado, SQL/locks, matriz requisito→teste→evidência,
ordem de implementação e riscos. Mantenha fora do escopo NF-e, impostos,
duplicatas, migrations, Delphi e testes de driver/`hashtablefs`.
````
