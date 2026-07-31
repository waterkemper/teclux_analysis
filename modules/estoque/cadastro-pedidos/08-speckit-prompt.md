# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, as fatias finais do Cadastro de Pedidos de Compra: a **Grade (matriz linha/coluna de variantes)** com sua Cópia de Produtos ligada, a **Formação de Preço de Venda** (visualização), os **Documentos a Pagar** gerados a partir do pedido, e as **Funcionalidades Acessórias** (Envio de Pedido, Importação Daico, Relatório/Excel) — construído sobre todas as 7 fatias anteriores (`modules/estoque/cadastro-pedidos/01-speckit-prompt.md` a `07-speckit-prompt.md`). Esta é a oitava e última fatia do Cadastro de Pedidos de Compra.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que as specs 01-07 já devem ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- **Grade**: estrutura dinâmica linha/coluna (dimensões descobertas em runtime), quantidade editável por célula, preço/desconto/ICMS%/IPI% editáveis só no nível da linha, bloqueio real de edição quando a linha tem valores divergentes entre células, troca de orientação linha↔coluna, e o par carregar/sincronizar com os itens reais do pedido (a "cópia ligada à grade");
- **Formação de Preço de Venda**: visualização somente leitura do cálculo já produzido pelas specs 01-05;
- **Documentos a Pagar**: geração/reconstrução automática a partir do pedido gravado, parcelas espelhando 1:1 as Previsões (spec 06);
- **Funcionalidades acessórias**: Envio de Pedido por e-mail (replicar funcionalmente); Relatório/Exportação (citado, sem detalhamento profundo de layout).

Não inclua nesta entrega: a Importação Daico — permanece como dúvida de relevância de negócio não confirmada, não especificar agora; a Cópia de Produtos **autônoma** (satélite `fmcopiarprodutospedidos`, mecanismo totalmente distinto — "repetir um pedido anterior" — fora de escopo deste mapa, esforço futuro próprio); qualquer detalhe interno de fórmula do Motor de Custo/Impostos além de consumi-los (specs 01-05); cabeçalho/previsões/itens (já especificados, specs 06-07).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmcadastropedidos.pas`, `apps/estoque/fmcadastropedidos.pas` e do satélite `apps/estoque/fmcadastropedidosgrade.pas` (matriz linha/coluna), mais `repositorio/fmFormacaoPrecoVenda.pas`/`dmFormacaoPrecoVenda.pas` (visualizador compartilhado).
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que as specs 01-07 já devem ter entregado.
- Se uma decisão depender de informação Delphi ausente (incluindo se o módulo Manutenção de Preços já migrado expõe uma visualização equivalente à Formação de Preço de Venda, ou se já existe módulo de Contas a Pagar para reaproveitar), registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- os artefatos entregues pelas specs 01-07 — a grade grava nos mesmos itens especificados na spec 07, através de uma ramificação distinta;
- se o módulo Manutenção de Preços (`modules/estoque/manutencao-precos`, já migrado) expõe uma visualização equivalente à Formação de Preço de Venda — não duplicar se já existir;
- se já existe um módulo de Contas a Pagar no checkout Laravel, para reaproveitar o lado de escrita (criação de título + parcelas) dos Documentos a Pagar;
- infraestrutura de e-mail transacional já existente no Laravel (mailable + preview), para o Envio de Pedido.

## Evidência Delphi confirmada

### Grade — estrutura dinâmica (CONFIRMADO, `dmcadastropedidos.pas:3512-3685`)

Não tem schema fixo — é uma tabela em memória com: 1 coluna de rótulo (o valor da linha, ex.: cor), N colunas dinâmicas (uma por valor distinto de coluna, ex.: cada tamanho encontrado), e colunas fixas ao final: quantidade (total da linha, somatório das células, read-only), preço, desconto, ICMS%, IPI%, total (read-only). **Nomenclatura importante**: na grade, os campos de ICMS/IPI são exibidos e tratados como **percentuais**, diferente do restante do sistema (specs 02-05), onde são sempre valores monetários — não confundir os dois contextos.

### Grade — preenchimento e divergência (CONFIRMADO)

Para cada linha, ao preencher as células: acumula a quantidade total; para preço/desconto/ICMS/IPI, guarda o **último valor não-zero encontrado** como representativo da linha, e marca a flag "diferente" assim que encontra uma célula com valor não-zero **diferente** do já guardado.

### Grade — edição de célula e da linha (CONFIRMADO, `dmcadastropedidos.pas:3732-3855`)

- Editar uma **célula de quantidade**: localiza a combinação linha×coluna na tabela de staging; se existe, atualiza; se não existe e o valor é diferente de zero, cria uma nova linha de staging, herdando preço/desconto/ICMS%/IPI% já uniformes da linha (não zerados).
- Editar **preço/desconto/ICMS%/IPI% no nível da linha**: propaga esse valor para **todas** as linhas de staging daquela linha da grade (bulk-update).

### Grade — trava de edição quando divergente (CONFIRMADO)

Quando uma linha tem valores divergentes entre suas células, o campo correspondente no nível da linha fica **fisicamente bloqueado** para edição em lote (não é só um aviso de UI) — até que a divergência seja resolvida item a item, fora da grade.

### Grade — bug legado no total de IPI (POSSÍVEL BUG LEGADO, não replicar)

A fórmula de total de IPI da linha, no Delphi, soma o preço **sem multiplicar por quantidade**, enquanto a parte subtraída já usa quantidade×preço — para quantidade > 1, produz um valor de IPI total incorreto (confirmável algebricamente). **Decisão**: usar a versão corrigida, simétrica à fórmula (correta) de total de desconto: `vipi += (preco − truncar(preco×(100−valoripi%)/100)) × quantidade`.

### Cópia ligada à grade — carregar/sincronizar (CONFIRMADO, `dmcadastropedidos.pas:3976-4085`)

Dois "bookends" do fluxo de grade, não um subsistema à parte:

- **Carregar** (ao abrir a grade para uma característica): copia os próprios itens já existentes do pedido atual (filtrados pela mesma característica) para a tabela de staging.
- **Confirmar** (ao fechar/salvar a grade): percorre a tabela de staging e sincroniza de volta nos itens reais — atualiza se os valores mudaram, exclui se a quantidade zerou, inclui se o produto não existia como item real e a quantidade é diferente de zero. A grade funciona como uma "área de rascunho" — **nada é gravado no pedido real até o usuário fechar a grade com sucesso**.

**Nota de escopo**: `SelecionarProdutosPedidoCopiar`/`AlterarPrecoProdutosPedidoCopiar`/`HaProdutoContratoCopiarSelecionado` **não** pertencem a este fluxo — são exclusivos do satélite autônomo de "repetir um pedido anterior", fora de escopo deste mapa.

### Formação de Preço de Venda — visualizador read-only (CONFIRMADO, `repositorio/fmFormacaoPrecoVenda.pas`/`dmFormacaoPrecoVenda.pas`)

O Pedido delega inteiramente ao Motor de Custo (spec 01) para calcular custo/preço de venda — não há lógica própria aqui. A tela é confirmada **100% somente leitura** (~20 campos: preço unitário, frete, despesas acessórias, II, seguro, acréscimo, desconto, ICMS base/alíquota/valor, IPI base/%/valor, MVA/ICMS-ST, PIS %/valor, COFINS %/valor, custo total), parametrizável por origem (não exclusiva de Pedidos — mesmo "raio-X do cálculo" reaproveitável por outros módulos).

### Documentos a Pagar (CONFIRMADO, `dmcadastropedidos.pas:1311-1345,1693-1951`)

Disparado **dentro do próprio `GravarPedido`** (spec 06) — não é um passo separado: insert → gera; edit → apaga todas as parcelas existentes e recria do zero a partir das Previsões atuais (spec 06) — sem tentativa de diff incremental. Cria 1 Documento a Pagar por Pedido (fornecedor sempre como credor, `previsao=true` — pagável baseado em previsão, ainda não vinculado a Nota Fiscal de Entrada real), com **uma parcela (duplicata) por Previsão de Pedido**, dados copiados diretamente. `ExcluirDocumentosPag` apaga tudo — chamado tanto pela exclusão física quanto pelo cancelamento lógico do pedido: **mesmo um pedido só cancelado (não excluído) tem seu Documento a Pagar completamente removido**, nunca fica "fatura fantasma".

**Achado a não replicar**: a cascata de desconto/acréscimo percentual (`CalcularAcrescimoDesconto`) está inteiramente comentada no Delphi — código morto, não é lógica ativa.

### Envio de Pedido (CONFIRMADO, `fmcadastropedidos.pas:640-673`)

É **e-mail manual**, não EDI e não muda situação — abre um diálogo de envio pré-preenchido com destinatário (contato de e-mail do fornecedor), assunto "Pedido de Compra", corpo com o resumo do pedido em HTML. O usuário confirma manualmente o envio; nada é enviado automaticamente ao gravar. **Decisão**: reaproveitar infraestrutura de e-mail transacional já existente no Laravel (mailable + preview) em vez de replicar o diálogo genérico do Delphi — só o resultado funcional (assunto + corpo com resumo do pedido, disparado por um botão explícito).

### Relatório e Exportação (CONFIRMADO por localização, não aprofundado)

Geração de documento (relatório impresso, exportação Excel), não regra de negócio — mesmo tratamento já usado em Consulta de Compras: citado nos critérios de aceite, sem especificação linha a linha de layout.

### Importação Daico — fora desta entrega (DÚVIDA de relevância de negócio, não especificar)

O parser do arquivo-fonte não foi localizado nos arquivos-núcleo analisados, e não foi possível confirmar se algum fornecedor ainda usa esse formato ativamente. **Decisão**: não especificar agora. Se confirmada a necessidade futuramente junto ao negócio, vira uma spec própria — preservando só a mecânica genérica observada ("soma se já existe, cria com defaults fiscais senão") como referência para uma eventual importação mais genérica.

## Decisões obrigatórias

1. Grade: quantidade editável por célula; preço/desconto/ICMS%/IPI% editáveis só no nível da linha (bulk-update); trava real de edição em lote (não só aviso) quando a linha tem valores divergentes.
2. Fórmula de total de IPI da grade usa a versão corrigida, simétrica à do desconto — não replicar o bug legado.
3. Grade funciona como área de rascunho: nada grava no pedido real até o fechamento bem-sucedido da grade.
4. Formação de Preço de Venda é somente leitura, sem lógica de cálculo própria — verificar antes se Manutenção de Preços já cobre essa visualização, para não duplicar.
5. Documentos a Pagar são gerados/reconstruídos automaticamente dentro da gravação do pedido, nunca editados diretamente nesta tela; removidos por completo ao cancelar/excluir.
6. `CalcularAcrescimoDesconto` (cascata de desconto/acréscimo, código morto) não é replicado.
7. Envio de Pedido replicado funcionalmente via infraestrutura de e-mail existente, disparado por ação explícita do usuário.
8. Importação Daico não é especificada nesta entrega — registrada como dúvida de negócio em aberto.

## Critérios de aceite

- [ ] Quantidade é editável por célula; preço/desconto/ICMS%/IPI% são editáveis só no nível da linha (bulk-update para todas as células).
- [ ] Linha com valores divergentes entre células trava a edição em lote do campo correspondente (bloqueio real, não só aviso de UI) até a divergência ser resolvida item a item.
- [ ] Total de IPI da linha usa a fórmula corrigida (multiplicada por quantidade, simétrica ao desconto).
- [ ] Trocar orientação linha↔coluna preserva os dados já editados.
- [ ] Fechar a grade sincroniza staging→itens reais (atualiza/exclui/inclui conforme a quantidade mudou/zerou/apareceu); nada é gravado no pedido antes desse fechamento.
- [ ] Visualização de Formação de Preço de Venda é somente leitura, reaproveitando os valores já calculados pelas specs 01-05.
- [ ] Gravar o pedido sempre gera ou reconstrói do zero exatamente 1 Documento a Pagar, com parcelas espelhando 1:1 as Previsões vigentes.
- [ ] Cancelar ou excluir o pedido remove por completo o Documento a Pagar e suas parcelas.
- [ ] Envio de Pedido dispara e-mail com resumo do pedido mediante ação explícita do usuário; nunca automático ao gravar.
- [ ] Importação Daico não é implementada nesta entrega.

## Matriz mínima de testes

- **Grade — bloqueio por divergência**: duas células da mesma linha com preços diferentes → campo de preço da linha fica bloqueado para edição em lote; igualar os dois valores item a item libera a edição novamente.
- **Grade — produto composto**: grade de um produto composto → total de IPI da linha bate com a fórmula corrigida (não a fórmula com bug do Delphi).
- **Grade — carregar/sincronizar**: abrir a grade de uma característica com itens já existentes → staging carrega esses itens; editar e fechar → itens reais refletem exatamente o staging (update/delete/insert conforme o caso).
- **Documentos a Pagar — espelho e remoção**: gravar pedido com 3 previsões → 3 parcelas idênticas geradas; editar previsões (de 3 para 2 parcelas) → parcelas antigas somem, 2 novas aparecem; cancelar o pedido → Documento a Pagar inteiro desaparece.
- **Envio de Pedido**: acionar o envio → e-mail montado com assunto e resumo do pedido, aguardando confirmação explícita do usuário antes de disparar.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais de Grade, Formação de Preço de Venda, Documentos a Pagar e funcionalidades acessórias;
- identifiquem os repositórios/serviços Laravel atuais a estender ou criar, após inspecioná-los (incluindo o que as specs 01-07 entregaram, e verificando sobreposição com Manutenção de Preços e um eventual módulo de Contas a Pagar);
- detalhem a mecânica de grade/staging, a fórmula corrigida de IPI, e o ciclo de vida dos Documentos a Pagar acima;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que a Cópia de Produtos autônoma e a Importação Daico **não fazem parte** desta entrega;
- não mandem investigar Delphi, nem inventem lógica de cabeçalho/itens/motor de custo-impostos além do já especificado.

## Fora de escopo

- implementar durante `/speckit.specify`;
- Importação Daico — dúvida de relevância de negócio não confirmada;
- Cópia de Produtos autônoma (satélite `fmcopiarprodutospedidos`) — mecanismo distinto, mapa/esforço futuro próprio;
- cabeçalho, previsões e itens (já especificados, specs 06-07);
- qualquer detalhe interno de fórmula do Motor de Custo/Impostos além de consumi-los (specs 01-05);
- emissão de NF-e em si — o motor de impostos especificado nas specs 02-05 serve de base, mas a emissão é esforço futuro à parte;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
