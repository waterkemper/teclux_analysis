# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, a Requisição entre Filiais e o contrato de integração de Gerar Pedido de Compra (Estoque → Compras → Consultas), construído sobre a Fundação/Parâmetros (`modules/estoque/consulta-compras/01-speckit-prompt.md`) e o Motor de Sugestão de Compras (`modules/estoque/consulta-compras/02-speckit-prompt.md`).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que as specs 01 e 02 já devem ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- a Requisição entre Filiais completa: gerar dados (da sugestão calculada na spec 02, excluindo produtos compostos conforme parâmetro), grade de revisão, revalidação de estoque com proteção contra condição de corrida, e persistência transacional em `pedidosfiliais` (mais `movimentos`, quando `RequisicaoSubtraiEstoque` estiver ativo);
- o contrato de integração de Gerar Pedido de Compra: quais campos são enviados (produto, quantidade conforme escolha do usuário — sugestão/mínimo/máximo —, valor pela precedência já confirmada, filial de fatura, fornecedor opcional) para iniciar um novo Pedido de Compra — **sem** especificar o Cadastro de Pedidos de Compra em si.

Não inclua nesta entrega: nenhuma parte da Fundação/Parâmetros ou do Motor de Sugestão (já especificadas, só consuma); o Cadastro de Pedidos de Compra completo (`dmcadastropedidos.pas`/`fmcadastropedidos.pas`/`fmcadastropedidosgrade.pas`, ~20 mil linhas, fora de escopo — mapa/esforço futuro próprio).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmconsultacompras.pas` e `apps/estoque/fmconsultacompras.pas`.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que as specs 01 e 02 já devem ter entregado.
- Se uma decisão depender de informação Delphi ausente (incluindo qualquer detalhe do Cadastro de Pedidos de Compra em si), registre a pergunta exata para o workspace de análise — não infira o funcionamento desse Cadastro.

## Investigação Laravel obrigatória

- os artefatos entregues pelas specs 01 e 02: parâmetros de Filial, filtro de produtos, e a fórmula/resultado da sugestão de compras;
- repositórios já existentes que leem/escrevem `estoques`, `movimentos`, `filiais` — reaproveitar padrões de bloqueio pessimista e transação já estabelecidos no checkout;
- `specs/054-configuration-center` — para os 3 Parâmetros do Sistema confirmados nesta fatia (`Transferir_Produtos_Compostos`, `Permitir_Requisicoes_de_Produtos_Duplicadas`, `RequisicaoSubtraiEstoque`).

## Evidência Delphi confirmada

### Requisição entre Filiais — 4 fases (CONFIRMADO, `dmconsultacompras.pas:2653-3129`)

1. **Gerar dados**: lista de produtos+quantidades a requisitar — do produto ativo (com sua `sugestao`) ou de todos os marcados. Produtos "compostos" (kits) são **excluídos**, a menos que `ParSistema.Transferir_Produtos_Compostos` permita (aviso listando os excluídos). A filial requisitante é sempre a filial base do usuário logado — **nunca escolhida pelo usuário**. A lista popula uma consulta reaproveitando os parâmetros da sugestão agrupada por Filial (spec 02), restrita aos produtos requisitados — mostrando quais outras filiais têm estoque candidato.
2. **Grade de revisão**: exibição para ajuste manual antes de confirmar.
3. **Revalidação de estoque**: recompara o estoque atual de cada par produto+filial candidato contra o snapshot carregado (proteção contra condição de corrida); bloqueia com aviso se o produto não está mais presente na filial esperada; acumula o total que será de fato atendido por outras filiais (excluindo a própria); exige confirmação explícita se houver diferença de saldo detectada.
4. **Persistência**: só para linhas com quantidade pedida > 0 e requisitante ≠ filial (nunca de si mesma). Se já existe requisição aberta para o mesmo produto+filial e `ParSistema.Permitir_Requisicoes_de_Produtos_Duplicadas` não permite duplicatas, **soma** a nova quantidade à existente (confirmação do usuário se as quantidades batem exatamente). Senão, cria novo registro em `pedidosfiliais` (situação `'A'` — Aberto). **Se `ParSistema.RequisicaoSubtraiEstoque`**: cria também um registro em `movimentos` (tipo `'TEP'`) debitando a quantidade da filial requisitada, sob bloqueio pessimista (`FOR UPDATE`). Tudo persistido atomicamente na mesma transação.

### Contrato de integração de Gerar Pedido de Compra (CONFIRMADO, `fmconsultacompras.pas:1164-1290`)

1. Exige ao menos um produto selecionado.
2. Fornecedor é **opcional** — se informado, restringe; se não, o Cadastro de Pedidos abre com fornecedor em aberto por item.
3. Usuário escolhe qual campo de quantidade enviar: `sugestao`, `sugestaominimo` ou `sugestaomaximo`, via um modal de seleção. **POSSÍVEL BUG LEGADO/DÚVIDA**: o Delphi não trata explicitamente o cancelamento desse modal (a variável de campo escolhido não é reinicializada) — o Laravel deve **cancelar a geração do pedido** se o usuário cancelar essa escolha, não prosseguir com estado indefinido.
4. Filial de fatura: a única Filial marcada nos parâmetros, se houver só uma; senão a filial base do usuário.
5. **Filtro de linhas incluídas**: só produtos selecionados **com `sugestao ≠ 0`** (o campo bruto de sugestão) entram no pedido — **DIVERGENTE confirmado e mantido por decisão do usuário**: mesmo que o usuário escolha enviar `sugestaominimo`/`sugestaomaximo` como quantidade, um produto com `sugestao = 0` mas outro campo positivo fica de fora.
6. Valor unitário: a precedência já confirmada na spec 02 (`precocomicms` → `valorultimacompra` → `customedio`, de `qryDetalhesCompra`).
7. Quantidade enviada: o valor do campo escolhido no passo 3, por produto.

O contrato de saída para iniciar o Pedido de Compra é: `{ filial de fatura, fornecedor (opcional), itens: [{ produto, quantidade, valor unitário }] }` — sem especificar como o Cadastro de Pedidos de Compra em si processa essa entrada.

## Decisões obrigatórias

1. Requisição entre Filiais replica as 4 fases fielmente, incluindo os 3 Parâmetros do Sistema que controlam produtos compostos, duplicatas e débito imediato de estoque.
2. Filial requisitante nunca é escolhida pelo usuário — é sempre a do usuário logado.
3. O contrato de integração com Pedido de Compra é implementado como definido acima, sem tentar especificar ou simular o Cadastro de Pedidos de Compra em si.
4. Cancelamento do modal de escolha de quantidade cancela a geração do pedido (corrigindo o comportamento indefinido do Delphi, não replicando o bug).
5. O filtro de inclusão de linhas no pedido sempre usa `sugestao`, mesmo quando outro campo de quantidade foi escolhido — divergência mantida por decisão do usuário.

## Critérios de aceite

- [ ] Requisição sempre parte da filial do usuário logado como requisitante; nunca requisita da própria filial.
- [ ] Produtos compostos são excluídos da requisição, a menos que o parâmetro correspondente permita.
- [ ] Revalidação de estoque detecta e avisa sobre diferenças de saldo antes de confirmar.
- [ ] Requisições duplicadas somam quantidade (ou criam novo registro), conforme o parâmetro de duplicidade.
- [ ] Quando `RequisicaoSubtraiEstoque` está ativo, um movimento de débito é criado na filial requisitada, sob bloqueio pessimista.
- [ ] Contrato de integração com Pedido de Compra envia produto/quantidade/valor/filial de fatura/fornecedor corretamente; linhas com `sugestao = 0` ficam de fora mesmo que outro campo de quantidade tenha sido escolhido.
- [ ] Cancelamento do modal de escolha de quantidade cancela a geração do pedido.

## Matriz mínima de testes

- Requisição de produto disponível em duas outras filiais → grade de candidatas mostra as duas; confirmar gera registros corretos em `pedidosfiliais` e, se aplicável, em `movimentos`.
- Produto composto incluído na seleção sem o parâmetro permitir → excluído com aviso.
- Requisição duplicada para o mesmo produto+filial → soma (ou cria novo registro), conforme o parâmetro.
- Estoque muda entre a consulta e a confirmação → aviso de diferença de saldo, exigindo confirmação.
- Gerar Pedido com as três escolhas de quantidade (sugestão/mínimo/máximo) → quantidade enviada bate; filtro de linhas incluídas continua baseado em `sugestao`.
- Cancelar o modal de escolha de quantidade → nenhum pedido é gerado.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais desta fatia (Requisição entre Filiais + contrato de integração), consumindo as specs 01 e 02 sem reespecificá-las;
- identifiquem os repositórios/serviços Laravel atuais a estender, após inspecioná-los;
- detalhem as 4 fases da Requisição e o contrato exato de saída para o Pedido de Compra;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que o Cadastro de Pedidos de Compra em si **não faz parte** desta entrega;
- não mandem investigar Delphi, nem inventem o funcionamento do Cadastro de Pedidos de Compra.

## Fora de escopo

- implementar durante `/speckit.specify`;
- qualquer parte da Fundação/Parâmetros ou do Motor de Sugestão — já especificadas nas specs 01 e 02;
- o Cadastro de Pedidos de Compra completo (`dmcadastropedidos`/`fmcadastropedidos`/`fmcadastropedidosgrade`) — mapa/esforço futuro próprio;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
