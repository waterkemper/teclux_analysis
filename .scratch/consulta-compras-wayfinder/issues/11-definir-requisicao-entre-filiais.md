# Definir a Requisição entre Filiais

Type: grilling
Status: resolved
Blocked by: 03, 07

## Question

Como replicar a Requisição entre Filiais (botão "Requisição F11", `GerarDadosRequisicoes`, `MontarGradeDadosRequisicoes`, `IncluirPedidosFiliais`, `PreencherRequisicaoFilialSolicitada`/`RetirarRequisicaoFilialSolicitada`, `VerificarEstoqueFilialRequisitada`, persistidos via `qryPedidosFiliais`/`qryAtualizarPedidosFiliais`) — esta ação é autocontida nos arquivos fornecidos (não abre nenhuma tela externa). Qual é o contrato completo: de onde vêm os itens/quantidades requisitados (a sugestão calculada no ticket 07), como a filial requisitada é escolhida, e o que valida `VerificarEstoqueFilialRequisitada` antes de confirmar?

## Answer

### As 4 fases confirmadas (`dmconsultacompras.pas:2653-3129`)

1. **`GerarDadosRequisicoes(SomenteRegistroAtual)`**: monta a lista de produtos+quantidades a requisitar — do produto ativo (com sua `sugestao`, ticket 07) se `SomenteRegistroAtual`, ou de todos os produtos marcados/selecionados (`qryProdutosSelecionados`) caso contrário. Produtos "compostos" (kits) são **excluídos** da requisição a menos que `ParSistema.Transferir_Produtos_Compostos` permita — se algum for excluído, mostra um aviso em grade listando-os. A filial requisitante é sempre `FilialRequisitante` (a filial base do usuário logado, definida em `MontarFiltroFiliais`/ticket 03) — **não é escolhida pelo usuário**, é sempre "eu preciso". A lista resultante popula `qryPedidosFiliais` reaproveitando os mesmos parâmetros/macros de `qryComprasFiliaisGrupo` (a sugestão agrupada por filial, ticket 07), restrita aos produtos requisitados — ou seja, a Requisição consulta **quais outras filiais têm estoque** desses produtos como candidatas a atender.
2. **`MontarGradeDadosRequisicoes`** (UI): renderiza a grade resultante para revisão/ajuste manual do usuário antes de confirmar.
3. **`VerificarEstoqueFilialRequisitada`**: revalida o estoque atual de cada par produto+filial candidato contra o snapshot carregado (proteção contra condição de corrida — estoque pode ter mudado entre a consulta e a confirmação); bloqueia com aviso se um produto não está mais presente na filial esperada; acumula `vTotalAtendido` (quantidade total que será de fato atendida por outras filiais, excluindo a própria filial requisitante); se houver diferença de saldo detectada, exige confirmação explícita do usuário antes de prosseguir.
4. **`IncluirPedidosFiliais`**: persiste as requisições reais — só para linhas com `qtdepedida > 0` e `requisitante <> filial` (nunca requisita de si mesma):
   - Se já existe uma requisição aberta para o mesmo produto+filial requisitada e `ParSistema.Permitir_Requisicoes_de_Produtos_Duplicadas` **não** permite duplicatas: **soma** a nova quantidade à requisição existente (com confirmação do usuário se as quantidades batem exatamente — aviso de "quantidade dobrada").
   - Senão: cria um novo registro em `pedidosfiliais` (`pedidosfiliais_proximocodigo()`, `situacao := 'A'` — Aberto), com requisitante/requisitada/quantidade/data/hora/observação.
   - **Se `ParSistema.RequisicaoSubtraiEstoque`**: também cria imediatamente um registro em `movimentos` (tipo `'TEP'`) debitando a quantidade requisitada do estoque da filial **requisitada** (resolvendo `filiais.filial_estoque` quando a filial é do tipo virtual `'V'` sem estoque próprio), sob bloqueio pessimista via `qryEstoqueBloqueio` (`FOR UPDATE`, ticket 05).
   - Tudo persistido atomicamente via `Perpetrar([qryAtualizarPedidosFiliais, qryMovimentos])`.

### Três Parâmetros do Sistema adicionais confirmados (complementam o ticket 02)

- `Transferir_Produtos_Compostos` — permite ou não incluir produtos compostos/kits na requisição.
- `Permitir_Requisicoes_de_Produtos_Duplicadas` — permite ou não duas requisições abertas para o mesmo produto+filial (senão, soma na existente).
- `RequisicaoSubtraiEstoque` — se a requisição já debita o estoque da filial requisitada imediatamente, ou só registra a intenção (`pedidosfiliais`) sem mexer em `movimentos` até uma transferência física posterior (fora de escopo, pertence a uma tela de expedição/recebimento não fornecida).

### Decisão

Toda a lógica é replicada como está — não há ambiguidade adicional; os três parâmetros acima entram no manifesto de Parâmetros do Sistema desta fatia junto com os já confirmados no ticket 02.
