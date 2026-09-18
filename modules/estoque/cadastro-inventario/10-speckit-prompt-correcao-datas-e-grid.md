# Prompt corretivo 10 — datas do processamento e paridade visual do grid de produtos

## Contexto

Revise a implementação atual do Cadastro de Inventário no Laravel, atualmente no commit `127437dd4`, após a execução do prompt corretivo 09. Use o código vigente, a spec `laravel/specs/485-fix-inventario-previa-processamento/` e os artefatos já capturados em `modules/estoque/cadastro-inventario/`. Não solicitar inspeção direta dos fontes Delphi; usar os artefatos deste dossiê como evidência funcional.

Este prompt é um complemento corretivo do prompt 09. Corrigir somente as lacunas abaixo sem desfazer as correções já implementadas. O fluxo de usuário continua único: o comando `Processar` executa internamente as leituras/pré-validações e segue para autorização e gravação. Não criar botão separado de simulação.

## Achados da revisão atual

### P0 — as duas datas do Inventário não chegam ao plano

Na implementação atual:

- o tipo `Header` do React expõe `data`, mas não `processamento`;
- a tela mantém somente `dataInv` e envia somente `data`;
- `InventarioProcessingPlanBuilder::build()` lê apenas a data do cabeçalho;
- `LegacyInventarioProcessingReadRepository::loadSnapshot()` recebe somente a data do Inventário;
- o snapshot não usa o intervalo da data do Inventário até a data de processamento;
- a escrita atual usa `now()->toDateString()` para o movimento;
- o F8 valida o limite de dias com a data atual e a data de abertura, mas não valida a relação entre as duas datas do Inventário.

Isso não reproduz o comportamento legado.

## Regra temporal obrigatória

Implementar e transportar no mesmo contrato, do cabeçalho até a prévia e o F8:

- `inventario.data`: data de referência/corte do Inventário;
- `inventario.processamento`: data limite do processamento/projeção;
- novo Inventário: `processamento = data`;
- rejeitar `processamento < data`;
- permitir alteração das datas somente no Inventário A, conforme as permissões e validações existentes;
- alterar qualquer uma das datas deve atualizar os dados derivados e invalidar a prévia, o hash e qualquer autorização pendente.

### Semântica dos cortes

Para Produto sem lote:

1. saldo inicial: último movimento com `movimentos.data <= inventario.data`, ordenado por `data DESC, lancto DESC`;
2. movimentações posteriores da projeção: somente `movimentos.data > inventario.data AND movimentos.data <= inventario.processamento`;
3. saldo após processamento e colunas `*processamento`: fotografia até `inventario.processamento`;
4. movimento gerado pelo Inventário: `movimentos.data = inventario.data`, nunca `now()` e nunca automaticamente `inventario.processamento`.

Para Produto controlado por lote, aplicar exatamente os mesmos cortes em `movimentoslotes`, com Produto, Filial e Lote.

Não confundir:

- `inventario.processamento`, que é a data de negócio do cabeçalho;
- `movimentos.processamento`/ `movimentoslotes.processamento`, que é o registro técnico de processamento usado pelo legado para detectar movimentação posterior à inclusão/alteração do Item;
- `datahoraalteracao` do Item, que participa da regra de concorrência/alteração posterior.

Uma movimentação na própria `inventario.data` pertence ao saldo inicial; uma movimentação posterior entra somente se estiver até `inventario.processamento`. Quando as datas forem iguais, o intervalo posterior de datas é vazio.

O limite de dias do parâmetro `LimitedeDiasParaProcessamentoInventario` deve preservar a regra do Delphi baseada na idade da data do Inventário em relação à data corrente do servidor. Isso é uma validação distinta de `processamento >= data` e distinta do intervalo usado para a projeção.

## Implementação obrigatória das datas

- incluir `processamento` no DTO/header, tipos React, formulário, requests, contratos, identidade da prévia, hash e payload do F8;
- exibir os dois campos no cabeçalho com rótulos claros: `Data do Inventário` e `Data do Processamento`;
- no cadastro novo, sugerir a mesma data nos dois campos;
- ao carregar um Inventário existente, usar os valores persistidos, sem substituir processamento por data atual;
- persistir e recarregar as alterações usando o writer já existente, respeitando situação A/P/T;
- fazer o endpoint interno de prévia e o F8 reconstruírem o plano usando as duas datas do mesmo cabeçalho, não datas fornecidas livremente pelo navegador;
- incluir as duas datas na identidade/fotografia e revalidá-las dentro da transação do F8;
- remover qualquer uso de `now()` como substituto da data do movimento do Inventário;
- manter o mesmo plano determinístico entre a etapa interna de prévia e o processamento efetivo;
- adicionar testes para igualdade, intervalo válido, intervalo invertido, movimento no limite inferior, movimento no limite superior e mudança de data entre prévia e F8.

## P0 — paridade do grid de produtos com o Delphi

O grid de Produtos do Delphi é consulta/read-only; a edição ocorre pelo modal de inclusão/alteração. O duplo clique abre a edição somente quando o Inventário está A. O grid não deve permitir edição direta de células, exclusão ou inclusão inline.

Preservar no padrão Laravel:

- catálogo de colunas, ordenação, exportação, personalização, redimensionamento e preferências;
- seleção de linha e duplo clique para abrir o modal existente;
- ações da barra ao lado do grid, conforme o padrão já usado no módulo;
- situação P/T somente leitura;
- os valores usados para estilo devem vir da mesma consulta do grid, sem consulta por linha.

### Regras visuais confirmadas

Implementar estilo por célula/linha, sem substituir as regras por uma cor genérica da linha:

- coluna `diferenca`: texto vermelho;
- `selecionadosistema = true`: texto azul nas células não selecionadas;
- `possuisaldonegativoposteriormente = true`: texto em negrito;
- quando `possuisaldonegativoposteriormente = true` e `selecionadosistema = true`: texto azul e negrito;
- quando o Inventário está A e `alterado = true`: fundo da linha/célula com o destaque legado de item alterado;
- a regra de alteração não deve ser aplicada indiscriminadamente a Inventários P/T;
- seleção ativa do grid deve preservar a aparência de seleção do componente e não ser sobrescrita indevidamente pelo azul de `selecionadosistema`;
- não pintar toda a linha de vermelho por saldo negativo: no legado, a coluna de diferença é vermelha e o saldo negativo posterior é indicado por negrito;
- a legenda da tela deve refletir essas regras reais, sem dizer que azul/amarelo/vermelho significam estados diferentes dos implementados.

Não depender de índice numérico de coluna, como `column.Index = 11`; usar o identificador/catálogo da coluna `diferenca`, para que personalização e reordenação não quebrem a regra.

### Painel de conferência dos itens em negrito

O Delphi possui uma área complementar que deve ser preservada no Laravel:

- quando houver Produto com `possuisaldonegativoposteriormente = true`, exibir um painel inferior contextual de Produtos com Estoque Negativo;
- o painel contém um grid read-only dos movimentos/saldos negativos posteriores, com pelo menos Data, Estoque, Reservado e Reserva Prévia;
- disponibilizar a opção `Filtrar itens` para mostrar no grid principal somente os Produtos marcados como negativos posteriores;
- o filtro deve usar o mesmo conjunto já carregado, sem nova consulta por linha, e deve poder ser desfeito;
- disponibilizar, com as mesmas permissões e confirmações do Delphi, as ações de excluir itens negativos e copiar itens negativos para um novo Inventário; essas ações não podem ser confundidas com o processamento F8;
- quando não houver negativos posteriores, o painel fica oculto;
- o retorno à visão completa deve restaurar todos os itens, mantendo a ordenação e a seleção;
- a mensagem de divergência do processamento deve orientar o operador a verificar os itens em negrito e permitir abrir esse painel/detalhe.

O grid de posteriores da prévia pode reutilizar o catálogo padrão de detalhes, mas deve manter a affordance do painel legado no grid principal. Não substituir esse recurso apenas por uma legenda textual.

Se o `ErpPreferenceDataGrid` ainda não oferecer estilo por célula, criar a extensão mínima no componente compartilhado para receber classes/renderizadores de célula sem perder ordenação, exportação, preferências, virtualização ou acessibilidade. Não duplicar outro grid apenas para esta tela.

### Campos e estados necessários no grid

Garantir que o catálogo/consulta forneça, sem N+1:

- Produto, código visual e descrição;
- sequência;
- localização/sublocalização;
- quantidade inventariada;
- estoque, reserva, reserva prévia e trânsito;
- diferença;
- movimentado;
- saldo após processamento;
- `selecionadosistema`;
- `possuisaldonegativoposteriormente`;
- `alterado`;
- situação do Inventário;
- dados de lote quando aplicável.

O usuário pode ordenar e personalizar colunas, mas a personalização não pode remover silenciosamente campos necessários para explicar uma divergência; quando ocultos, eles continuam disponíveis no detalhe, tooltip ou painel de causa conforme o padrão do grid.

## Filtros e reconsulta

Alteração de Filial, Data do Inventário, Data do Processamento ou filtros de produtos deve invalidar os dados derivados e executar uma nova consulta pelo fluxo F6 padrão. O botão Cancelar deve aparecer antes da primeira operação assíncrona e cancelar a consulta/job conforme a infraestrutura existente.

Não usar consultas por Produto/Lote para calcular estilos, posteriores ou saldos. O snapshot deve continuar set-based, usando `IN`, `ANY(array)` ou `unnest` quando necessário.

## Testes obrigatórios

Adicionar ou ajustar testes para provar:

1. header, request, plano, prévia e F8 transportam `data` e `processamento`;
2. Inventário novo inicia com as duas datas iguais;
3. `processamento < data` é rejeitado;
4. último saldo usa `movimento.data <= data`;
5. posterior usa `data < movimento.data <= processamento`;
6. movimento efetivo recebe `data = inventario.data`;
7. mudança de qualquer data invalida a prévia e impede autorização com plano antigo;
8. o grid aplica vermelho somente à coluna `diferenca`;
9. seleção do sistema aplica azul conforme a regra, sem sobrescrever a seleção ativa;
10. saldo negativo posterior aplica negrito;
11. item alterado aplica o fundo legado somente em A;
12. não existe fundo vermelho genérico para saldo negativo;
13. duplo clique abre modal somente em A e o grid continua read-only;
14. quando existirem negativos posteriores, o painel inferior aparece com o grid de movimentos e o filtro de itens;
15. o filtro de itens negativos altera somente a visualização e pode ser desfeito sem perder seleção/ordenação;
16. exclusão/cópia de itens negativos respeita situação, permissão e confirmação;
17. ordenação/personalização/exportação não removem a coerência dos estilos nem geram N+1;
18. testes não usam `getDriverName()`, `hasTable` ou `Schema::has*`.

## Entrega

Produzir a especificação corretiva e tasks implementáveis para os ajustes acima. Não alterar código de produção nesta etapa, não executar `/speckit.specify` dentro deste prompt e não criar um botão separado de simulação.
