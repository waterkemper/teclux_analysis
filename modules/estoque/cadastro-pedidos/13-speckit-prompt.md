# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para fechar 3 gaps de paridade visual/funcional na grade "Produtos" do Cadastro de Pedidos de Compra (já implementada em `PedidoCompraItensPanel.tsx`): (1) colorização de linha por situação do item, (2) reordenação de itens (deslocar cima/baixo), (3) checkbox "Marcar/Desmarcar Todos" para atualização de preço de venda em lote. Esta é a décima terceira fatia do Cadastro de Pedidos de Compra, construída sobre os itens já especificados (spec 07) e já implementados.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` como requisito legado autoritativo. Inspecione o checkout Laravel (`PedidoCompraItensPanel.tsx` e o serviço que já expõe `abrirFormacao`/`excluirItem`/`startIncluir`) para confirmar o estado atual antes de alterar qualquer coisa — pode ter mudado desde esta análise. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta entrega

A entrega termina quando existir:

1. **Colorização de linha por situação**: branco (Aberto), aqua (Parcial), verde (Concluído), verde+texto vermelho (Concluído Excedido — quando quantidade recebida excede a pedida), cinza (Parcial Liquidado/Cancelado com recebimento parcial), amarelo (Cancelado) — mesma paleta do legado — mais destaque de fonte vermelha na célula de preço quando editado manualmente e divergente do calculado.
2. **Reordenação de itens**: mover um item selecionado para cima/para baixo na lista.
3. **Checkbox "Marcar/Desmarcar Todos"**: alterna em lote a flag de "atualizar preço de venda a partir deste pedido" (mesma flag já usada no item individual, spec 15) para todos os itens do pedido.

Não inclua nesta entrega: o botão de cópia de produtos (confirmado fora de escopo — aciona um satélite excluído do mapa, não a grade); qualquer alteração de fórmula de cálculo (specs 01-05); os campos fiscais completos do modal de item (spec 15).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/fmcadastropedidos.pas`/`.dfm`.
- Inspecione o checkout Laravel para confirmar o estado atual de `PedidoCompraItensPanel.tsx` — pode ter mudado desde esta análise.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- `resources/js/Pages/Cadastros/Estoque/PedidosCompra/components/PedidoCompraItensPanel.tsx` — estado atual (ações já wireadas: `startIncluir`, `excluirItem`, `abrirFormacao`, `startEdit`, `abrirGrade`) — confirmar que nenhuma colorização por situação, reordenação, ou checkbox de marcação em lote existe hoje;
- o campo de situação do item já retornado pelo backend (`situacao_item` em `PedidoCompraItem`, `types.ts`) — confirmar os valores possíveis batem com os 5 códigos do legado (A/P/L/Q/C);
- a flag `permitiratualizardigitado`/equivalente já usada no item individual — confirmar nome exato no backend Laravel para reaproveitar no toggle em lote;
- se existe endpoint de reordenação de itens ou se precisa ser criado (provavelmente um campo `numero`/`ordem` já usado para persistir a sequência, ver spec 07).

## Evidência Delphi confirmada

### Colorização por situação (CONFIRMADO, `fmcadastropedidos.pas:849-897`)

```pascal
if situacao = 'A' then (branco, texto preto)
else if situacao = 'P' then (aqua, texto preto)
else if situacao = 'L' then
  if quantidade < totalrecebido then (verde $007FAA55, texto VERMELHO)  // Concluído Excedido
  else (verde $007FAA55, texto preto)                                   // Concluído
else if situacao = 'C' then (amarelo, texto preto)                      // Cancelado
else if situacao = 'Q' then (cinza, texto preto);                       // Parcial Liquidado

// adicional: coluna de preço com precodigitadoalterado=true → fonte vermelha
```

### Reordenação (CONFIRMADO, `fmcadastropedidos.dfm:4265-4452`)

`sbnDeslocarParaCima`/`sbnDeslocarRegistroParaBaixo` (hints "Alt+Up Deslocar registro para cima"/"Alt+Down Deslocar registro para baixo") — move o item selecionado uma posição na lista, na sequência persistida (`dbgProdutosPedidos.CampoSequencial := 'numero'`, `RefazerOrdenacaoSequencial`).

### Checkbox "Marcar/Desmarcar Todos" (CONFIRMADO, `fmcadastropedidos.pas:1324-1327`)

```pascal
procedure ckbMarcarTodosClick;
begin
  dtmCadastroPedidos.MarcarDesmarcarAtualizarPrecodeVenda(ckbMarcarTodos.Checked);
end;
```

Alterna em lote a mesma flag por item já usada individualmente (checkbox "Atualizar o preço de venda deste produto a partir deste pedido" no modal de item, spec 15).

## Decisões obrigatórias

1. Colorização de linha usa exatamente a paleta e as regras acima (incluindo a variante "Concluído Excedido" com texto vermelho sobre o mesmo fundo verde).
2. Reordenação persiste a nova sequência (mesmo campo/mecanismo já usado para ordenar itens na spec 07).
3. Checkbox de marcação em lote reaproveita a mesma flag já usada no item individual — não criar um campo novo e paralelo.

## Critérios de aceite

- [ ] Linha de item colore corretamente conforme a situação (branco/aqua/verde/verde+vermelho/cinza/amarelo), reativa a mudanças de situação.
- [ ] Célula de preço com edição manual divergente do calculado é destacada em vermelho.
- [ ] Botões de deslocar cima/baixo reordenam o item selecionado e persistem a nova ordem.
- [ ] Checkbox "Marcar/Desmarcar Todos" alterna a flag de atualização de preço em todos os itens do pedido de uma vez.

## Matriz mínima de testes

- **Cores por situação**: um item de cada situação (A/P/L/Q/C) → cor de linha corresponde à tabela acima.
- **Concluído Excedido**: item com quantidade recebida maior que a pedida, situação Concluído → fundo verde, texto vermelho.
- **Preço editado manualmente**: editar preço de um item divergente do calculado → célula de preço em vermelho.
- **Reordenação**: selecionar um item do meio da lista, mover para cima → nova posição persiste após recarregar.
- **Marcar/Desmarcar Todos**: marcar o checkbox → todos os itens ficam com a flag de atualização de preço ativa; desmarcar → todos desativam.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais dos 3 gaps;
- identifiquem os arquivos exatos a editar (`PedidoCompraItensPanel.tsx` e o backend correspondente), após inspecioná-los;
- detalhem a paleta de cores, a regra de reordenação e o toggle em lote acima;
- incluam os critérios de aceite e a matriz de testes acima.

## Fora de escopo

- implementar durante `/speckit.specify` além do que os critérios acima descrevem;
- o botão de cópia de produtos (fora de escopo, satélite excluído);
- qualquer alteração de fórmula de cálculo (specs 01-05);
- os campos fiscais completos do modal de item (spec 15);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
