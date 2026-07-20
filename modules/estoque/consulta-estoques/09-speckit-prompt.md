# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional completa para uma nova funcionalidade chamada **Consulta de Estoques**, localizada no contexto de Estoques do ERP tecLUX.

## Regra fundamental sobre as fontes

Você não possui acesso ao código Delphi e **não deve investigar, procurar, solicitar, citar ou depender de arquivos Delphi**. Não inclua tarefas de “analisar o legado”, “validar no Delphi” ou “comparar com o Delphi”. O levantamento legado já foi concluído externamente e os requisitos abaixo são sua fonte autoritativa e autocontida.

Investigue somente o estado atual do repositório Laravel para identificar nomes e contratos concretos de componentes, serviços, rotas, Policies, repositories, Parâmetros do Sistema, lookups, grids e testes que serão reutilizados. Se o código Laravel divergir dos requisitos funcionais abaixo, registre a divergência e proponha a adaptação no Laravel; não procure confirmação em outro repositório.

Não faça nova entrevista. Produza a spec a partir deste briefing.

## Objetivo

Criar uma Consulta de Estoques operacional no Laravel para que o Usuário localize Produtos por múltiplos critérios e consulte, em uma única atividade, Saldos de Estoque, preços, situação comercial, Lotes, Produtos Similares, Grade, Modelos, Componentes, Atributos, Movimentos acumulados, Pedidos, Fornecedores e Licitações por Produto e Filial.

A funcionalidade deve ser uma página nova e independente. A página existente **Análise de Estoques** é um Relatório temporal diferente e deve permanecer intacta. Reutilize sua infraestrutura de consulta, filtros, geração, Filiais autorizadas, grids, preferências, cancelamento e exportação, sem transformar seu dataset analítico no dataset desta nova Consulta.

## Vocabulário obrigatório

Use os termos do domínio do projeto: Filial, Usuário, Operador, Parâmetro do Sistema, Permissão, Autorização, Cadastro, Alteração, Auditoria, Produto, Característica de Produto, Movimento, Saldo de Estoque, Fornecedor, Pedido e Nota Fiscal de Entrada. Não trate Permissão e Autorização como sinônimos.

## Fluxo principal

1. O Usuário autorizado abre **Estoques → Consulta de Estoques**.
2. A página inicia no filtro Item de Produto, perspectiva **Itens do Produto** e detalhe **Estoques**.
3. O Usuário informa ao menos uma regra qualificadora de Produto/entidade, escolhe Filiais quando aplicável e configura flags de situação.
4. `Gerar` ou `F6` valida o payload e inicia a consulta mestre.
5. A geração apresenta progresso, pode ser cancelada e mostra erros/validações de forma clara.
6. Resultado vazio apresenta estado vazio e devolve foco aos filtros.
7. Resultado existente é paginado e seleciona um Produto ativo.
8. Perspectivas externas e detalhes internos são carregados sob demanda para o Produto ativo.
9. Alterar filtros marca o resultado anterior como desatualizado até novo Gerar.
10. `Esc` ou Limpar cancela trabalho em andamento, invalida resultados e detalhes e devolve foco ao primeiro filtro; não fecha a página web.
11. Respostas atrasadas de um Produto anteriormente selecionado devem ser canceladas ou descartadas.

## Filtros por cadastro

Ofereça regras estruturadas para:

- Item de Produto;
- Produto/Característica de Produto;
- Grupo;
- Classe;
- Marca;
- Promoção;
- Modelo;
- Especificação de Modelo;
- Localização de Estoque;
- Lote;
- Atributos.

Reutilize o painel de filtros de Produto, registries de campos/operadores, normalizers, lookups e compiladores já existentes no Laravel. As abas de Modelo, Especificação e Localização de Estoque provavelmente precisarão ser acrescentadas ao vocabulário compartilhado.

As regras podem usar E/OU dentro do bloco e “exceto” por aba. O navegador envia somente um payload versionado de regras. É proibido aceitar fragments SQL do cliente. O servidor valida aba, campo, operador, valor e conectores e compila SQL com binds.

Exija pelo menos uma regra qualificadora de Produto/entidade antes de Gerar. Filial ou flags isoladas não autorizam uma varredura global.

## Lupa enriquecida de Produto da Consulta de Estoques

O campo Produto desta Consulta possui uma lupa especial. Ela não é a lupa genérica nem a pesquisa de Produto de Vendas. Implemente-a **somente dentro da Consulta de Estoques**.

Reutilize `ErpTwoColumnCatalogLookupModal` por meio de um wrapper local, sugerido como `ConsultaEstoquesProdutoLookupModal`. Crie endpoint, FormRequest, action/controller, service e repository/query dedicados, por exemplo:

`GET /cadastros/estoque/consulta-estoques/lookups/produtos`

Não altere globalmente o resolvedor `lookup-product-entity`, não mude outras lupas e não reutilize o endpoint/service de Vendas, pois ele possui regras de Cliente/Cargo, exclusão de itens e preço comercial incompatíveis.

### Unidade de linha e seleção

- A unidade visual normal é Produto+Filial efetiva.
- A seleção devolve somente `{ produto, codigovisual, descricao }`.
- Filial, estoques, Pedidos, preços e comissões são contexto visual e nunca alteram implicitamente o filtro separado de Filiais.
- Linhas do mesmo Produto em Filiais diferentes selecionam a mesma identidade de Produto.

### Entrada e paginação

Aceite `q`, `search_field`, `page`, `per_page`, `sort`, `direction`, `filiais[]` e `situacao=ativos|inativos|ambos`. Contexto de Cliente/tipo somente pode ser aceito quando necessário e explicitamente validado. Use busca inicial `deferred`, página padrão 25 e máximo 100. Retorne `data`, `meta` e capabilities/manifesto das colunas permitidas.

### Colunas obrigatórias e condicionais

- `codigo`: ID interno obrigatório e oculto;
- Descrição: obrigatória, primeira coluna, pesquisável e ordenável;
- Linha e Coluna de Grade: somente com `UsarGradesProdutos`, pesquisáveis;
- Filial: código e nome, visível somente quando Filiais não forem independentes;
- Modelos e Especificações agregados: somente quando a visualização de Modelos estiver liberada, pesquisáveis;
- Mnemônico: exibição somente;
- Em estoque, Reservado, Futuro e Pedidos: obrigatórios, com precisão de quantidade configurada;
- Preço Normal e Preço Promoção: duas casas, somente com capacidade server-side de preços;
- Referência: obrigatória e pesquisável;
- código visual: obrigatório e pesquisável;
- código de barras: obrigatório; pesquise na relação sem multiplicar linhas;
- Peso: quatro casas, somente quando liberado pelo Parâmetro;
- Inativo: data/situação, com filtro aplicado no SQL;
- comissão de Grupo e Produto: somente com capacidade própria; formate como valor `V` ou percentual `P`;
- tipos de comissão: internos/ocultos;
- Pesquisa avançada: opção de campo full-text em `produtos.busca`, nunca coluna vazia serializada.

Não inclua Grupo, Marca, Unidade, preço genérico de Vendas, custo médio ou última compra apenas porque existem em outras consultas. Eles não são colunas comprovadas desta lupa; Grupo/Marca continuam no resultado mestre já especificado.

### Busca e ordenação da lupa

- Descrição pesquisa por prefixo normalizado em Descrição, Grades e Referência.
- Código pesquisa por prefixo no código visual e códigos de barras; ID interno admite igualdade numérica validada.
- Código do Produto no Cliente somente participa com `PesquisarProdutonoCliente` e Cliente/tipo explicitamente informados.
- Grade e Referência usam prefixo normalizado.
- Filial usa igualdade/prefixo validado.
- estoques, Pedidos, preços e comissões usam comparação numérica validada.
- Modelos/Especificações usam relação `exists` ou agregação server-side.
- Avançado usa full-text e relevância.
- Ativos/Inativos/Ambos é aplicado antes da contagem e paginação; default Ativos.

A ordenação padrão é Descrição normalizada, Linha, Coluna, Produto e Filial, com FilialBase primeiro dentro do Produto. Somente chaves em whitelist são pesquisáveis/ordenáveis. Use bindings, agrupe todo bloco `OR` e forneça desempates estáveis.

### Filiais e consolidação da lupa

- Em Filiais não independentes, seleção vazia significa todas as Filiais autorizadas; seleção explícita é validada/intersectada no servidor.
- Filial não autorizada retorna erro e não executa consulta ampla.
- Com Filiais independentes, oculte Filial e use somente FilialBase efetiva autorizada, incluindo a regra de Filial virtual existente.
- Sem consolidação, todos os valores pertencem à Filial da linha.
- Com `Pesquisa_do_produto_por_filial_base_e_com_soma_total_do_estoque`, retorne uma linha da FilialBase autorizada por Produto e some **somente `emestoque`**, apenas nas Filiais autorizadas. Retorne `estoque_scope=consolidated_authorized` e rotule a coluna como “Est. autorizado (total)”. Reservado, Futuro, Pedidos e preços continuam da FilialBase.
- Se a FilialBase exigida não estiver autorizada, rejeite a requisição; não escolha outra Filial silenciosamente.

### Parâmetros e capacidades da lupa

Medeie no backend: `FiliaisIndependentes`, `UsarGradesProdutos`, `LiberarVisualizacaodeModelosProdutos`, `LiberarVisualizacaoPesoProdutonasPesquisas`, `Pesquisa_do_produto_por_filial_base_e_com_soma_total_do_estoque` e `PesquisarProdutonoCliente`.

Parâmetro desativado remove coluna e campo da whitelist. Exija autenticação, módulo e capacidade de consulta. Crie capacidades distintas para visualizar preços e visualizar comissões. Sem capacidade, omita as propriedades do JSON e rejeite seu uso em busca/ordenação; ocultação React não é autorização.

Se o modal comum precisar evoluir, permita somente uma extensão declarativa opcional e retrocompatível do descriptor, como `sortKey`, formatação numérica/moeda ou visibilidade. Não adicione conhecimento de Estoques ao componente comum e não faça fork.

## Filiais

- Reutilize a seleção de Filiais autorizadas e o serviço de acesso a Filiais existente.
- Toda leitura, lookup, exportação e Alteração aplica o escopo de Filial no servidor.
- Filiais explicitamente não autorizadas retornam erro de validação.
- Quando Filiais forem independentes, o seletor fica oculto e a consulta usa somente a FilialBase autorizada.
- Quando não forem independentes, nenhuma Filial marcada significa **todas as Filiais autorizadas do Usuário**, nunca ausência de filtro SQL.
- Não copie o comportamento existente da Análise de Estoques em que lista vazia pode remover a restrição de Filial.

## Flags de Produto

Disponibilize os pares:

- Em linha / Fora de linha;
- Ativo / Inativo;
- Com montagem / Sem montagem;
- Brinde / Não brinde;
- Disponível no site / Não disponível no site.

Em cada par, somente um lado marcado aplica o filtro. Ambos marcados ou ambos desmarcados não restringem a dimensão.

Inclua **Sem estoque zero**, que exclui Produtos cujo Saldo de Estoque total seja zero. Na perspectiva de Lotes, aplique a regra ao saldo do Lote.

## Modelo master-detail

Implemente uma consulta mestre paginada por Produto/Filial. A identidade da linha deve ser estável para preservar seleção durante paginação e atualização.

A linha mestre deve disponibilizar, conforme Parâmetros do Sistema e Permissões:

- Item e código do Produto;
- descrição;
- Filial;
- valores de Grade;
- Grupo e Marca;
- peso quando habilitado;
- situação ativo/inativo e em linha/fora de linha;
- promoção e preço atual;
- comissão de Produto e Grupo;
- principais Saldos de Estoque.

Ordene por descrição normalizada, com FilialBase primeiro entre as Filiais do mesmo Produto quando aplicável.

## Perspectivas externas

### Itens do Produto

É a perspectiva inicial e usa o resultado mestre por Produto/Filial.

### Lotes dos Itens

Para o Produto ativo, apresente Lote, validade e dados comerciais, fiscais e de estoque equivalentes. Sempre preserve o escopo das Filiais efetivas.

### Produtos Similares

Inclua relações de similaridade por Característica de Produto nas duas direções e vínculos explícitos entre Produtos. Exclua o Produto original. Quando configurado, exija compatibilidade dos valores de Grade.

### Grade de Produtos

Monte matriz linha × coluna. Cada célula mostra Produto, `Em estoque/Estoque total` e preço atual. Selecionar uma célula torna aquele Produto ativo e carrega seus detalhes. Reutilize os serviços Laravel de estrutura e agrupamento de Grade.

### Modelos

Liste Modelos e observações da Característica de Produto ativa. A perspectiva só aparece quando liberada por Parâmetro do Sistema.

### Componentes

Aparece somente para Produto composto. Mostre Produto componente, quantidade, unidade, valores de Grade, preço unitário, total, situação e estoque. Reutilize a leitura do Cadastro de composição e enriqueça-a para a Consulta.

### Atributos

Mostre nome, descrição e valor tipado. Formate booleanos como Sim/Não e números no locale do ERP.

## Detalhes internos do Produto ativo

Carregue cada detalhe somente quando a aba for aberta.

### Estoques

Apresente:

- Estoque total;
- Em estoque;
- Danificada;
- Reservado;
- Futuro;
- Demonstração;
- Pedidos;
- Conserto;
- Estoque venda;
- Em trânsito;
- Reserva prévia;
- Estoque físico;
- preço normal;
- preço promocional;
- validade, data de alteração e descrição do preço;
- localização;
- quantidade mínima e máxima.

Fórmulas obrigatórias:

- Estoque venda = Em estoque + Reservado + Reserva prévia.
- Estoque total = Estoque venda + Em trânsito + Demonstração + Conserto + Danificada.
- Custo médio = Financeiro dividido pela soma de Em estoque, Reservado, Reserva prévia, Em trânsito, Demonstração, Conserto e Danificada; quando o denominador for zero, o resultado é zero.

### Financeiro

Disponível somente para capacidade gerencial. Inclua custo médio, Financeiro, IPI, margem final, datas das últimas compra/entrada/venda, quantidade da última compra, valor da última compra, valores com e sem ICMS, Fornecedor, indicador de simples e CST/CSOSN.

Para CSOSN 101 ou 102:

`última compra com ICMS = valor da última compra + (preço com ICMS - preço sem ICMS)`.

Nos demais casos, use o valor da última compra.

### Acumuladores

Disponível somente para capacidade gerencial. Mostre Compras e Vendas mensais por Produto/Filial, respeitando o sinal do Movimento e ordenando períodos do mais recente para o mais antigo.

### Preços

- Alterne entre Preços convencionais e Preços por Cargo conforme Parâmetro do Sistema.
- Mostre Preço por Cliente em aba adicional quando habilitado.
- Considere promoção vencida como inexistente usando data do servidor.
- Respeite fatores da Filial e configuração de arredondamento do ECF.

### Pedidos

Mostre Pedidos em situação aberta ou pendente cuja quantidade pendente seja positiva. Mostre também Notas Fiscais de Entrada pendentes, excluindo documentos cancelados ou já recebidos. Permita abrir o Cadastro existente do Pedido pelo número correto.

### Fornecedores

Disponível somente para capacidade gerencial. Mostre vínculo Produto–Fornecedor, preço, IPI e data da última entrada.

### Licitações

Mostre somente itens com saldo pendente positivo. Inclua Licitação, Cliente, situação, quantidade, saldo pendente, preço, custo/ICMS e total do saldo pendente calculado como `saldo × preço`. Some quantidade, saldo e total no rodapé.

## Estado visual e acessibilidade

Distinga semanticamente:

- Produto inativo ou fora de linha;
- Produto em promoção;
- comissão de Produto ou Grupo;
- célula promocional da Grade.

Use tokens do design system ERP e legenda acessível. Não dependa somente de cor e não tente copiar cores de um sistema externo.

## Permissões e segurança

Implemente três camadas independentes:

1. visibilidade do menu;
2. Permissão de acesso ao módulo;
3. capacidades nomeadas por dados/operação.

Crie capacidades server-side para:

- visualizar dados gerenciais: Financeiro, Acumuladores e Fornecedores;
- visualizar Preço Normal e Preço Promoção na lupa enriquecida;
- visualizar comissões de Produto e Grupo na lupa enriquecida;
- alterar mínimo, máximo e localização;
- alterar valor da última compra.

As props da UI devem derivar dos mesmos serviços usados pelas Policies. O backend deve omitir ou negar dados gerenciais quando a capacidade estiver ausente. Ocultar uma aba não é autorização.

Não inclua reautenticação ou prova de Autorização contextual: isso não faz parte deste escopo.

## Parâmetros do Sistema e ambiente

Medeie no backend e exponha apenas as capabilities/configurações necessárias para:

- preços por Cargo;
- preço por Cliente;
- Filiais independentes;
- uso de Grades;
- visualização de Modelos e Especificações;
- visualização de peso;
- pesquisa consolidada do Produto pela FilialBase com soma autorizada de `emestoque`;
- pesquisa de código do Produto no Cliente, sempre com Cliente/tipo explícitos;
- somente estoque de Filiais do tipo depósito no detalhe da Grade;
- máscara/formatação de quantidade;
- existência de CRT simples e normal para CST/CSOSN;
- arredondamento do ECF;
- data/hora do servidor.

A restrição “somente depósito” se aplica ao detalhe de estoque da Grade, usando Filiais do tipo depósito.

## Alterações

### Mínimo, máximo e localização

Permita Alteração por Produto e Filial efetiva, com capacidade específica, validação, resposta atualizada e Auditoria com valores anteriores e posteriores. A localização deve realmente persistir.

### Valor da última compra

Permita somente com capacidade específica. A Alteração afeta exclusivamente o Produto e a Filial efetiva, nunca todas as Filiais. Registre Auditoria completa.

## Estatística da consulta

Após Gerar com sucesso, registre os Produtos distintos consultados na estatística de estoque existente, com Usuário, FilialBase e data/hora do servidor. Não registre consultas rejeitadas por validação nem gerações canceladas.

## Integrações

- Reutilize a galeria e o endpoint de Fotos do Produto para a linha ou célula ativa.
- Reutilize Venda Perdida em modo Inclusão, sem preencher automaticamente o Produto neste escopo.
- Navegue para o Cadastro existente de Pedido por sua rota canônica e número correto.
- Disponibilize uma integração readonly de histórico fiscal usando Produto e identidade da Nota. Reutilize rota existente se houver; caso contrário, implemente apenas o limite necessário para abrir/consultar esse histórico.
- Não recrie internamente os Cadastros chamados.

## Grid ERP

Siga o padrão ERP de grid com catálogos frontend/backend e identificadores próprios da nova Consulta. Inclua:

- ordenação;
- redimensionamento e reordenação de colunas;
- seletor Campos da Grade por Alt+G;
- busca global por Ctrl+F;
- persistência de layout;
- exportação Excel do dataset completo por Ctrl+X;
- exportação server-side/assíncrona para resultados grandes.

Exportação e persistência entram por conformidade com o padrão atual do Laravel, não como cópia de outro sistema.

## Correções obrigatórias de consistência

A nova solução deve garantir por testes que:

- Lotes nunca perdem o escopo de Filial;
- a situação de inatividade de Produto Similar usa o campo correto;
- localização realmente persiste;
- alteração da última compra não afeta outra Filial;
- abrir uma Nota Pendente não reutiliza por engano o número de outro dataset;
- comparações com NULL usam semântica SQL correta;
- limpar/trocar Produto invalida todos os detalhes dependentes;
- Filial vazia nunca remove o escopo autorizado.

## Reuso esperado no Laravel

Antes de propor novos componentes, procure no próprio Laravel e reutilize:

- shell e barra de operações de consultas;
- Análise de Estoques como referência arquitetural de Gerar, cancelamento, paginação, exportação e testes;
- filtros de Produto e Fornecedor, registries, normalizers e compiladores;
- checklist de Filiais autorizadas e serviço de acesso a Filiais;
- `ErpTwoColumnCatalogLookupModal` como base da lupa enriquecida, por wrapper exclusivo da Consulta;
- grid ERP, catálogos, preferências e exportação;
- serviços readonly do Cadastro de Produto para Estoques, Lotes, Similares, Composição, Preços, preços por Cargo, preços por Cliente, Fornecedores, Grade e Atributos;
- galeria de Fotos do Produto;
- fluxo de Venda Perdida;
- convenções existentes de menu, módulo, Policy e capacidades por ação.

Crie endpoints readonly específicos da Consulta quando o serviço existente for orientado ao formulário de Cadastro. Não acople a Consulta a endpoints de Alteração de outro módulo.

## Testes e critérios de aceite

Use como seam principal testes Feature nos contratos HTTP/Inertia autenticados. Use testes unitários apenas para compiladores de filtro e cálculos puros. Cubra no mínimo:

- acesso de administrador, Usuário com grant e Usuário sem Permissão;
- capacidade gerencial e capacidades de Alteração;
- capacidades independentes de preços e comissões na lupa, inclusive ausência dos campos no JSON;
- Filiais autorizadas, não autorizadas, vazias e independentes;
- lupa enriquecida com linha Produto+Filial e retorno de seleção somente do Produto;
- catálogo e parâmetros de Grade, Modelos/Especificações, peso, situação, códigos, estoques, Pedidos, preços e comissões;
- busca por campo, full-text avançado, whitelist, bindings, paginação e ordenação estável da lupa;
- modo consolidado somando somente `emestoque` das Filiais autorizadas, com escopo identificado e demais valores da FilialBase;
- regressão garantindo que lupas globais, `lookup-product-entity` e pesquisa de Vendas não mudaram;
- regra de seleção obrigatória;
- todas as tabs de filtro e combinações campo/operador;
- E/OU, “exceto” e pares de flags;
- Sem estoque zero para Produto e Lote;
- ordenação, paginação, identidade e snapshot de filtros;
- geração, cancelamento, timeout e estatística;
- todas as perspectivas externas;
- todos os detalhes internos sob demanda;
- proteção contra respostas obsoletas;
- fórmulas de Saldos de Estoque, custo e última compra com ICMS;
- promoção vencida e arredondamento;
- Pedidos, Notas Pendentes, Fornecedores e Licitações;
- Alterações com Produto+Filial e Auditoria;
- Fotos, Venda Perdida, Pedido e histórico fiscal por seus contratos públicos;
- grid, preferências e exportação do dataset completo;
- regressões de todas as correções de consistência listadas acima.

## Fora do escopo

- alterar ou renomear Análise de Estoques;
- recriar internamente os Cadastros de Produto, Pedido, Venda Perdida, Fornecedor ou Fotos;
- migrar relatórios não relacionados ou criar layout específico de impressão;
- investigar ou modificar código Delphi;
- reproduzir layout, cores ou ciclo de componentes de outro sistema;
- exigir reautenticação contextual;
- preencher automaticamente Produto em Venda Perdida;
- persistir valores dos filtros entre sessões;
- expandir o módulo de histórico fiscal além do limite necessário para esta Consulta.

## Saída esperada do Spec Kit

Gere uma spec completa, implementável e testável. Converta as regras acima em requisitos funcionais numerados e critérios de sucesso mensuráveis. Registre as entidades e contratos de negócio necessários sem incluir detalhes prematuros de implementação. Marque como dependências reutilizáveis os Cadastros e componentes Laravel já existentes.

Novamente: **não investigue o Delphi e não crie tarefas que dependam de acesso ao Delphi**. Tudo o que precisa ser preservado já está descrito neste prompt.
```
