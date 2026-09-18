# Prompt 07 — Corrigir read model e efeitos financeiros em lote

Execute `/speckit.specify` para corrigir somente as lacunas ainda abertas na
implementação existente de `/caixa/controle-recebimentos`. Leia os prompts
01–06, `auditoria-implementacao-laravel-vs-delphi.md`,
`pesquisa-sqls-parametros-delphi.md`, `contrato-dominio-laravel-delphi.md`, o
snapshot/manifesto de schema e o checkout Laravel atual. Não peça reabertura,
inspeção ou conferência direta dos fontes Delphi; use os artefatos já
versionados. Não implemente nesta execução do `/speckit.specify`.

## Estado já confirmado — não reabrir sem evidência nova

- Defaults das operações 0/1/2 usam `data_civil` e têm testes.
- O catálogo PHP/TypeScript está na versão 5, com os títulos canônicos, `OK`
  no fim e exportação baseada no mesmo catálogo.
- Ordenação aceita `transacao` e `tipo`, com desempates determinísticos.
- A seleção usa o índice completo da fotografia, inclusive quando o grupo
  atravessa páginas; seleção de página é apenas um atalho visual.
- A matriz de editabilidade é: tipo somente no modo 0 e sem confirmações;
  data, valor e deságio somente no modo 1; demais dados somente leitura; `OK`
  é seleção.

Não substituir esses contratos por consultas por página, edição livre,
`window.confirm`, nova permissão ou nova operação.

## 1. Read model com paridade de dados

Corrigir a projeção/hidratação sem `select *`, sem N+1 e sem introspecção de
schema em runtime:

1. Preservar `recebimentos.valor_confirmacao IS NULL` como ausência no DTO e
   na fotografia. Não converter `NULL` para `'0.00'`. O valor monetário zero
   confirmado continua sendo `'0.00'` e não pode cair para `valorvencto`.
2. Reproduzir a precedência capturada na consulta: cliente e tipo do contrato
   (`contratos` ligado pela parcela/transação) têm prioridade; se não houver,
   usar o cliente de `autenticacoes`; na ausência de ambos, manter ausência.
   O nome deve usar a regra documentada do view `vfornecedores` (razão social
   quando existente, senão nome), com sanitização de saída.
3. Buscar parcelas, contratos, autenticações e view de pessoas em consultas
   set-based por conjunto de transações e indexar os resultados em memória.
   Não introduzir uma consulta para cada linha, `Locate`, `select *` ou
   concatenação de filtros.
4. Manter `INNER JOIN` apenas para relações obrigatórias da consulta principal
   e `LEFT JOIN` somente nas relações opcionais comprovadas pelo snapshot.
   Não transformar a correção de precedência em duplicação de linhas.
5. Garantir que a mesma projeção abasteça grid, fotografia, exportação e
   relatório; títulos/layout não devem ser duplicados nesse ajuste.

## 2. Confirmação e documentos em lote

1. Aplicar exatamente os critérios documentados para criação de Documento a
   Pagar: documento inexistente, fornecedor e evento válidos, valor líquido
   não nulo/não zero e data de confirmação válida. Se o critério não for
   satisfeito, não criar documento ou duplicata.
2. Na atualização ou criação, preencher todos os campos operacionais
   comprovados no manifesto e no dossiê, incluindo vínculo do recebimento,
   fornecedor, evento, valor líquido, referência/observação, filial, usuário e
   datas aplicáveis. A duplicata criada deve usar a data de confirmação como
   vencimento e pagamento, nunca emissão/lançamento por conveniência.
3. Carregar e bloquear documentos/duplicatas por conjuntos de chaves antes da
   mutação. Validar `rowCount` de cada UPDATE/DELETE/INSERT e abortar a
   transação inteira em divergência.
4. Detectar chaves repetidas no lote. Um mesmo documento/duplicata ou evento
   não pode ser atualizado/apagado duas vezes por loops de linhas. Se a
   cardinalidade repetida não tiver regra inequívoca no contrato, recusar com
   conflito antes da primeira mutação, em vez de escolher silenciosamente a
   primeira linha.

## 3. Movimento e evento bancário

1. Agrupar por identidade composta de movimento
   `(conta, data, sequencia)` e de evento
   `(conta, data, sequencia, evento, sequenciaevento)`.
2. Para eventos distintos no mesmo movimento, atualizar/remover cada evento
   uma vez e aplicar ao cabeçalho o delta agregado de cada evento. Nunca
   substituir o total do movimento pelo valor isolado de uma linha.
3. No estorno, remover/desfazer cada evento uma vez, recalcular o cabeçalho a
   partir dos eventos restantes e remover o movimento somente quando a origem
   e a ausência de eventos restantes autorizarem. Limpar os vínculos do
   recebimento no mesmo change set.
4. Se faltar movimento/evento ou alocador autoritativo para criação, recusar
   antes de qualquer mutação. Não copiar `MAX()+1`, não testar driver, não
   testar `hasTable`/`Schema::has*`, `information_schema` ou `pg_catalog` no
   caminho de negócio.
5. A confirmação, os documentos, duplicatas, eventos, movimentos, carimbos de
   operação, idempotência e auditoria devem continuar na mesma transação,
   com rollback comprovado na conexão PostgreSQL autoritativa.

## Testes obrigatórios

Adicionar ou ajustar testes para:

- confirmação nula distinta de confirmação zero;
- cliente de contrato prevalecendo sobre autenticação e fallback correto;
- razão social/nome e sanitização da saída;
- criação bloqueada quando valor líquido, fornecedor, evento ou data não
  atenderem ao critério;
- preenchimento dos campos de documento/duplicata e data de confirmação;
- duas linhas no mesmo movimento com eventos distintos, confirmando e
  estornando por delta;
- identidade de evento repetida recusada sem mutação;
- `rowCount`, rollback por efeito, replay/idempotência, autorização, filial e
  orçamento de consultas sem N+1.

## Guardrails

Preserve a rota, o menu, o breadcrumb, F9 pelo modal padrão, F5/F6/F7,
Cancelar de F6, radio buttons, catálogo/preferências/exportação e os três
modos. Não criar CRUD, filtro de situação, nova permissão ou nova tabela sem
evidência e decisão formal. Use apenas o schema versionado; se ele não
comprovar um campo, cardinalidade ou alocador, registre bloqueio explícito no
spec.
