# Prompt simples — Visualizar grade de Produtos por Contrato

```text
Corrija e complete somente a funcionalidade **“Visualizar grade de produtos por contrato”** existente em Estoques → Ficha de Produtos no Laravel.

Não recrie o módulo, não altere a especificação geral da Ficha e não investigue Delphi. O contrato funcional necessário está integralmente descrito abaixo. Inspecione apenas o Laravel atual para localizar e reutilizar a página, painel, endpoint, service, repository, DTOs e testes já existentes.

## Objetivo

Ao selecionar um movimento ou movimento por lote associado a um contrato, o vendedor deve poder abrir uma grade inferior com o histórico completo dos produtos daquele contrato, contextualizada pela filial, pelo produto consultado e pela perspectiva ativa.

Essa grade é auxiliar, somente leitura e não substitui nem modifica a grade principal.

## Regra estrutural obrigatória — dois grids como no Delphi

A apresentação deve reproduzir a estrutura funcional do Delphi:

- o **grid de extrato** permanece na parte superior;
- o **grid de Produtos por Contrato** abre separadamente na parte inferior;
- os dois grids ficam visíveis simultaneamente;
- existe um divisor horizontal entre eles, preferencialmente redimensionável pelo usuário;
- o grid inferior ocupa toda a largura disponível da área de dados;
- fechar/recolher o grid inferior devolve o espaço ao grid superior;
- a linha corrente do grid superior atua como mestre do grid inferior;
- mudar a linha mestre atualiza o grid inferior automaticamente quando ele estiver aberto.

Não implementar essa funcionalidade como modal, drawer, lista textual, cards, accordion, expansão dentro da linha ou substituição do grid principal. O componente inferior deve ser uma **grade tabular real**, com cabeçalhos e linhas, separada abaixo do extrato.

## Estado atual conhecido no Laravel

O Laravel já possui:

- seleção de linha na grade principal;
- botão “Visualizar grade de produtos por contrato”, mostrado quando a linha possui contrato;
- envio de contrato, filial, produto e perspectiva para um endpoint sob demanda;
- painel inferior com Fechar, carregamento, vazio, erro e retry;
- autorização de filial no endpoint;
- leitura inicial de contratos e produtos do contrato;
- suporte inicial a produto direto e composto;
- cálculo inicial de devolvidos e trocados.

Não duplique essas peças. Complete-as.

As lacunas atuais são relevantes:

- o painel renderiza somente um resumo textual, em vez da grade detalhada;
- data/tipo/referência/quantidade do movimento, descrição da situação, reservado em e faturado em são retornados como nulos ou não aparecem;
- o parâmetro de perspectiva não produz efetivamente fontes distintas para Movimentos e Lotes;
- o painel aberto não acompanha automaticamente uma nova linha selecionada;
- a consulta atual tende a ler apenas o item do contrato, não o histórico completo de movimentos contextualizados;
- devoluções e trocas precisam seguir as fontes/regras vigentes do domínio, sem presumir que tabelas distintas representam necessariamente os dois conceitos.

## Exibição e acionamento

1. Manter um botão visível com o texto **“Visualizar grade de produtos por contrato”**.
2. O botão só fica habilitado/visível quando:
   - existe resultado válido na perspectiva ativa;
   - há uma linha selecionada;
   - a linha possui contrato não vazio;
   - a filial e o produto contextual estão disponíveis;
   - existe URL/capacidade para carregar o detalhe.
3. O texto pode incluir o número do contrato selecionado.
4. Clicar no botão fechado abre a grade inferior e carrega os dados sob demanda.
5. Clicar novamente no mesmo botão deve fechar a grade; o botão funciona como alternador explícito.
6. Manter também o botão **Fechar** dentro do painel.
7. A grade deve aparecer obrigatoriamente abaixo da grade principal, como segundo grid simultâneo, sem modal e sem navegação para outra tela.
8. Usar divisor horizontal redimensionável entre os grids; ao recolher o grid inferior, o grid do extrato recupera a área disponível.
9. O estado aberto não precisa persistir ao sair/reabrir a tela.

## Sincronização com a linha corrente

1. Com o painel aberto, selecionar outra linha com contrato deve atualizar automaticamente o painel para o novo contrato/filial, sem exigir novo clique.
2. Selecionar uma linha sem contrato fecha ou limpa o painel e explica que não existe contrato contextual.
3. Gerar novamente, limpar filtros, trocar produto ou invalidar o resultado fecha e limpa o painel.
4. Mudar de página fecha/limpa a seleção e não pode manter detalhe de uma linha que deixou de estar presente.
5. Trocar entre **Movimentos** e **Lotes** mantém a regra contextual, mas limpa a seleção anterior e usa a fonte correspondente à nova perspectiva.
6. Uma resposta HTTP atrasada do contrato anterior não pode sobrescrever o contrato atualmente selecionado; cancelar ou ignorar respostas obsoletas.

## Escopo da consulta auxiliar

Carregar o **histórico completo do contrato** para:

- número do contrato da linha selecionada;
- filial da linha selecionada;
- produto atualmente consultado na Ficha;
- perspectiva ativa: `movimentos` ou `lotes`.

Os filtros de período, tipo de movimento e “somente avulsos” da consulta principal **não são reaplicados**. Isso é intencional: a grade mostra o histórico completo do contrato, não somente o recorte temporal/categórico da ficha principal.

Exibir no título/ajuda uma mensagem inequívoca, por exemplo:

“Histórico completo do contrato. Os filtros de período, tipo de movimento e lançamentos avulsos da consulta principal não são aplicados.”

Produto, contrato e filial continuam obrigatórios. Não permitir que o cliente envie outra filial ou outro produto para ampliar o escopo.

## Perspectivas

### Movimentos

Usar o histórico de movimentos do produto relacionado ao contrato e à filial.

### Lotes

Usar o histórico correspondente aos movimentos por lote, preservando o número/identificação do lote quando aplicável. A perspectiva Lotes não pode simplesmente devolver a mesma projeção resumida de produtos do contrato nem ignorar o parâmetro recebido.

As duas perspectivas devem manter o mesmo conjunto conceitual de colunas sempre que o dado for aplicável.

## Relacionamento do produto com o contrato

Incluir:

- produto contratado diretamente; e
- produto composto cujo componente seja o produto consultado.

Não retornar produtos ou componentes sem relação com o produto da Ficha. Reutilizar a estrutura e a nomenclatura de composição efetivamente vigentes no Laravel/banco atual.

## Colunas da grade inferior

Exibir nesta ordem:

1. **Data** — data do movimento/evento contextual;
2. **Filial** — filial do movimento/contrato;
3. **Movto** — código do tipo de movimento;
4. **Referência** — referência do movimento;
5. **Qtde** — quantidade do movimento ou da projeção por lote;
6. **Lote** — somente quando aplicável à perspectiva Lotes;
7. **Contrato** — número do contrato;
8. **Sit.** — código da situação do contrato;
9. **Situação** — descrição atual da situação, se disponível;
10. **Data contrato** — data de emissão/criação do contrato;
11. **Reservado em** — data de reserva do contrato/item;
12. **Faturado em** — data de faturamento;
13. **Produto no contrato** — código visual e, preferencialmente, descrição do item efetivamente registrado no contrato;
14. **Qtde contrato** — quantidade contratada do item;
15. **Devolvidos** — total devolvido do item no contrato;
16. **Trocados** — total trocado do item no contrato.

Datas usam formato pt-BR; quantidades seguem a máscara vigente do domínio. Valores nulos devem aparecer como ausência (`—`), não como zero inventado. Devolvidos/Trocados podem usar zero somente quando a consulta confirmou ausência de registros.

## Regras de devolvidos e trocados

Calcular os totais por contrato e pelo produto efetivamente registrado no contrato:

- **Devolvidos**: somar somente registros classificados como devolução;
- **Trocados**: somar somente registros classificados como troca.

Verificar e reutilizar no Laravel atual a fonte canônica e os discriminadores vigentes. Não misturar devoluções e trocas, não somar pelo produto consultado quando o item contratual é um composto diferente e não executar uma consulta por célula/linha se a agregação puder ser feita em lote.

## Ordenação

A grade é histórica e não permite reordenação por cabeçalho. Usar ordem determinística:

1. filial;
2. data do movimento;
3. lancto;
4. número do movimento;
5. lote como desempate na perspectiva Lotes, quando necessário.

## Segurança e somente leitura

- Reutilizar a autorização de acesso à Ficha e o escopo de filiais.
- Revalidar server-side que a filial solicitada pertence ao usuário.
- Revalidar a relação entre contrato, filial e produto.
- Usar somente consultas `SELECT`, bindings e parâmetros validados.
- Não criar edição, inclusão, exclusão, navegação para manutenção ou ação sobre contrato/produto.
- A grade inferior não precisa de colunas financeiras e não deve ampliar acesso financeiro.

## Estados da interface

- **Fechado:** somente o grid principal e o botão contextual; a área inferior fica recolhida.
- **Carregando:** segundo grid aberto abaixo do extrato, com identificação do contrato e indicador local.
- **Com dados:** os dois grids permanecem simultaneamente visíveis; o inferior mostra a tabela detalhada e o aviso de histórico completo.
- **Vazio:** “Nenhum produto/movimento do contrato encontrado para este produto e filial.”
- **Erro:** mensagem localizada e botão “Tentar novamente”.
- **Fechar:** remove somente o painel; não limpa nem regenera a grade principal.

Falha no detalhe nunca deve apagar, bloquear ou marcar como inválido o resultado principal.

## Desempenho

- Carregamento sob demanda e síncrono por requisição HTTP.
- Não carregar o histórico de todos os contratos junto com a consulta principal.
- Evitar N+1 para situação, produto, devolvidos e trocados.
- Aplicar timeout e paginação caso o histórico possa ser extenso, preservando a ordem determinística.
- Cancelar/ignorar requisições obsoletas quando mudar a seleção.

## Critérios de aceite

1. Linha sem contrato não permite abrir a grade.
2. Linha com contrato abre um segundo grid tabular abaixo do extrato, mantendo ambos visíveis, com contrato e filial corretos.
3. O segundo grid é separado por divisor horizontal redimensionável; novo clique no botão ou Fechar o recolhe e devolve espaço ao grid principal.
4. Com o painel aberto, selecionar outra linha atualiza automaticamente o conteúdo.
5. Resposta atrasada não substitui o detalhe da seleção mais recente.
6. Movimentos e Lotes usam suas respectivas fontes e a perspectiva não é ignorada.
7. A grade apresenta todas as colunas definidas, com Lote somente quando aplicável.
8. Data/tipo/referência/quantidade e datas contratuais não são placeholders nulos quando existem na fonte.
9. Produto direto e produto composto relacionado são encontrados.
10. Produto sem relação com o item contratual não é retornado.
11. Devolvidos e Trocados são calculados separadamente pelo item do contrato.
12. O aviso informa que período, tipo e avulsos não são reaplicados.
13. Cabeçalhos não reordenam o histórico.
14. Filial não autorizada retorna 403 e não afeta a grade principal.
15. Estado vazio, erro e retry permanecem locais ao painel.
16. Trocar perspectiva, gerar novamente ou mudar de página não mantém detalhe obsoleto.
17. Não existe qualquer mutação de movimento, contrato ou produto.
18. A funcionalidade não usa modal, drawer, cards, lista textual, accordion, expansão de linha nem substitui o grid do extrato.

## Testes mínimos

- abertura/fechamento pelo botão e pelo Fechar;
- habilitação com linha com/sem contrato;
- atualização automática ao trocar a linha;
- proteção contra resposta assíncrona obsoleta;
- perspectiva Movimentos;
- perspectiva Lotes com lote visível;
- contrato com produto direto;
- contrato com produto composto contendo o produto consultado;
- produto não relacionado;
- datas e situação preenchidas;
- devolução e troca separadas;
- aviso de histórico completo;
- filial autorizada e tentativa de filial proibida;
- vazio, falha e retry sem destruir o mestre;
- regressão da seleção/paginação/geração da Ficha;
- confirmação de que todas as queries são somente leitura.

Implemente somente esta funcionalidade e seus testes. Não altere as demais colunas, botões de visão, busca, exportação, filtros ou regras gerais da Ficha de Produtos, exceto onde for estritamente necessário para integrar corretamente esta grade auxiliar.
```
