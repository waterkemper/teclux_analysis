# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, os **itens (produtos) do Pedido de Compra**, construído sobre o cabeçalho e as previsões já especificados (`modules/estoque/cadastro-pedidos/06-speckit-prompt.md`) e sobre o Motor de Custo/Impostos (`01-speckit-prompt.md` a `05-speckit-prompt.md`). Esta é a sétima de 8 fatias do Cadastro de Pedidos de Compra; a spec 08 cobre grade, cópia, formação de preço de venda, documentos a pagar e funcionalidades acessórias.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que as specs 01-06 já devem ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir o ciclo completo de item do pedido: incluir, gravar (com validação e disparo do Motor de Custo/Impostos), excluir (incluindo o modo "wipe total" ao trocar fornecedor); a auto-criação do vínculo produto-fornecedor; a trava de quantidade mínima; e o painel de Produtos Similares.

Não inclua nesta entrega: o fluxo de edição de item vindo da Grade (spec 08 — a grade tem sua própria ramificação de gravação, que grava numa tabela de staging, não diretamente no item); qualquer detalhe interno de fórmula do Motor de Custo/Impostos além de disparar/consumir esses serviços já especificados (specs 01-05).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmcadastropedidos.pas` e do satélite `apps/estoque/fmcadastroprodutospedidos_.pas` (edição de item/imposto por linha).
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que as specs 01-06 já devem ter entregado.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- os artefatos entregues pelas specs 01-05 (Motor de Custo/Impostos) — cada edição de campo fiscal do item dispara esses serviços;
- os artefatos entregues pela spec 06 (cabeçalho/previsões) — gravar/excluir um item recalcula as Previsões;
- a entidade/tabela de vínculo produto-fornecedor já existente no Laravel (para a auto-criação do vínculo);
- a consulta/tabela de Produtos Similares já confirmada e reaproveitada em Consulta de Compras (mesma entidade, painel informativo, sem lógica própria).

## Evidência Delphi confirmada

### Ciclo de vida do item (CONFIRMADO, `dmcadastropedidos.pas:2134-2304,1792-1841`)

- **Incluir**: dois modos — normal (novo item, quantidade começa em 0) e edição de linha existente. Em ambos, o cálculo de impostos fica suprimido durante a preparação para não disparar sobre um registro incompleto.
- **Gravar**: valida campos obrigatórios e a associação produto-fornecedor (ver abaixo). **Tem uma ramificação inteiramente distinta quando a edição vem do fluxo de grade** (grava em tabela de staging, não no item real — spec 08 cobre esse caminho; não implementar aqui). No modo normal, ao gravar o item recalcula as Previsões (spec 06) — mudar quantidade/preço de um item muda o valor total do pedido, que precisa redistribuir as parcelas.
- **Excluir**: dois modos — exclusão normal de uma linha (com confirmação), ou **wipe completo de todos os itens** quando o fornecedor do pedido é trocado no meio da edição (os itens ficam presos ao catálogo do fornecedor anterior; trocar de fornecedor exige recomeçar a lista do zero). Após excluir, recalcula impostos e previsões.

### Validação de fornecedor — auto-criação de vínculo (CONFIRMADO, `dmcadastropedidos.pas:2789-2807`)

Ao incluir um item, verifica se a característica do produto já está cadastrada para o fornecedor do pedido. Se **não** estiver, pergunta ao usuário se quer cadastrar essa associação produto↔fornecedor na hora; se confirmado, insere o vínculo automaticamente. **Decisão de UX**: o cadastro do vínculo produto-fornecedor não é uma tela separada obrigatória — nasce implicitamente ao comprar dele pela primeira vez, mediante confirmação.

### Troca de produto — porta de entrada do motor de impostos (CONFIRMADO, `dmcadastropedidos.pas:5249-5280`)

Ao selecionar/trocar o produto de uma linha, dispara duas rotinas globais/compartilhadas: preenchimento de dados descritivos do produto, e preenchimento da classificação fiscal padrão (NCM, CFOP, CSOSN/CST, alíquotas default) — e então o Motor de Impostos (specs 02-05). A edição manual de qualquer campo fiscal (preço, quantidade, e cerca de uma dúzia de campos de ICMS/ICMS-ST) marca a flag "digitado" correspondente, sinalizando ao motor para **não** recalcular por cima daquele valor — mecânica já especificada nas specs 02-05, aqui só o ponto de disparo.

**Trava de negócio notável**: **não é permitido reduzir a quantidade** de um item **abaixo do que já foi recebido** — reverte para o valor anterior com aviso, se violado.

### Produtos Similares (CONFIRMADO — mesmo conceito de Consulta de Compras)

Reconsulta o painel de produtos similares sempre que o produto ativo muda — é um painel informativo lateral, sem escrita, sem cálculo próprio, reaproveitando a mesma entidade já confirmada em Consulta de Compras. Nada de novo a especificar além de "reaproveitar o mesmo componente/consulta".

## Decisões obrigatórias

1. Trocar o fornecedor do pedido dispara wipe total dos itens existentes.
2. Comprar um produto ainda não vinculado ao fornecedor oferece criar o vínculo com confirmação — não exige cadastro prévio em tela separada.
3. Reduzir a quantidade de um item abaixo do que já foi recebido é bloqueado.
4. Gravar/excluir um item sempre recalcula Previsões (spec 06) e dispara o Motor de Impostos (specs 02-05).
5. O fluxo de edição de item vindo da grade (grava em staging) é tratado como fora de escopo desta spec — cobrir na spec 08.
6. Produtos Similares reaproveita a mesma entidade/consulta já usada em Consulta de Compras, sem lógica própria.

## Critérios de aceite

- [ ] Trocar o fornecedor do pedido dispara wipe total dos itens existentes.
- [ ] Comprar um produto ainda não vinculado ao fornecedor oferece criar o vínculo produto-fornecedor com confirmação.
- [ ] Reduzir a quantidade de um item abaixo do que já foi recebido é bloqueado, revertendo ao valor anterior.
- [ ] Alterar quantidade/preço de um item recalcula as Previsões automaticamente.
- [ ] Trocar o produto de uma linha preenche dados descritivos e classificação fiscal padrão, disparando o Motor de Impostos.
- [ ] Painel de Produtos Similares reconsulta ao trocar o produto ativo, sem lógica de cálculo própria.

## Matriz mínima de testes

- **Itens — troca de fornecedor**: pedido com 3 itens do Fornecedor A → trocar para Fornecedor B → os 3 itens são removidos, lista some do zero.
- **Itens — vínculo automático**: comprar pela primeira vez um produto nunca associado ao fornecedor atual → prompt de confirmação → vínculo criado.
- **Trava de quantidade mínima**: item já parcialmente recebido → tentar reduzir a quantidade abaixo do recebido → bloqueado, reverte ao valor anterior.
- **Troca de produto — disparo do motor**: trocar o produto de uma linha → classificação fiscal padrão preenchida, Motor de Impostos disparado, previsões recalculadas.
- **Exclusão normal recalcula previsões**: excluir um item → total do pedido muda → previsões são redistribuídas.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais do ciclo de vida do item;
- identifiquem os repositórios/serviços Laravel atuais a estender, após inspecioná-los (incluindo o que as specs 01-06 entregaram);
- detalhem o ciclo incluir/gravar/excluir, a auto-criação do vínculo e a trava de quantidade acima;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que o fluxo de edição via grade **não faz parte** desta entrega (fica para a spec 08);
- não mandem investigar Delphi, nem inventem lógica de grade ou de fórmulas fiscais além do já especificado.

## Fora de escopo

- implementar durante `/speckit.specify`;
- o fluxo de edição de item vindo da grade (spec 08);
- grade, cópia de produtos, formação de preço de venda, documentos a pagar e funcionalidades acessórias (spec 08);
- qualquer detalhe interno de fórmula do Motor de Custo/Impostos além de disparar/consumir os serviços já especificados (specs 01-05);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
