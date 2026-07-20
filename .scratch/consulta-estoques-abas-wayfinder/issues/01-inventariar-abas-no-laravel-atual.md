Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato efetivamente implementado hoje no Laravel para Estoques, Acumuladores, Financeiro, Preços/Preços por Cargo e Pedidos — endpoints, services, repositories/SQL, DTOs, campos renderizados, capabilities, parâmetros, escopo Produto+Filial, estados vazios e testes — e quais limitações já são visíveis sem comparação com o Delphi?

## Answer

### Arquitetura comum implementada

A Consulta de Estoques já possui uma rota lazy única por Produto + Filial + detalhe. O controller exige acesso ao módulo; o serviço valida que a Filial está entre as autorizadas e despacha `estoques`, `financeiro`, `acumuladores`, `precos` e `pedidos` para métodos próprios.

No frontend, a identidade ativa é `produto:filial`. O hook de detalhes:

- cancela a requisição anterior com `AbortController`;
- combina identidade + aba em uma chave de geração;
- descarta resposta atrasada;
- diferencia vazio, carregando, pronto e erro;
- traduz 403 e 404 em mensagens sem revelar outra Filial.

Financeiro e Acumuladores são classificados como gerenciais no backend e no React. Estoques, Preços e Pedidos aparecem para quem possui o módulo. A aba é carregada sob demanda ao selecionar Produto ou trocar aba. Mutações recarregam o detalhe ativo.

O estado atual possui capacidades separadas para acesso, gerencial, alterar mínimo/máximo/localização, alterar última compra, visualizar preços e visualizar comissões. Contudo, a capacidade `visualizar preços` não protege o endpoint/aba Preços; ela é usada em outras superfícies, como a lupa.

### Matriz resumida

| Aba | Escopo efetivo | Backend atual | React atual | Limitação visível |
|---|---|---|---|---|
| Estoques | linha `estoques` Produto+Filial; Pedidos global por Produto | saldos, fórmulas, Financeiro/custo, preços, localização e limites | mostra preços e quantidades | vários campos retornados não são exibidos; Pedidos perde Filial |
| Financeiro | `estoques` Produto+Filial + fiscal global do Produto | custos, última compra e datas | três painéis + edição última compra | Fornecedor ausente; CST/Simples não resolvidos; fiscal incompleto |
| Acumuladores | Movimentos Produto+Filial | agrega em PHP por mês | tabela Período/Compras/Vendas | usa operação atual do Tipo, sem totais e com scan completo |
| Preços | Produto+Filial para preço resolvido; parâmetro pela Filial ativa da sessão | convencional/promoção; flags Cargo/Cliente | só convencional/promoção | `cargos=[]` e `clientes=[]`; modo Cargo não implementado; sem AuthZ de preços |
| Pedidos | Pedido global por Produto; Nota Produto+Filial | pedidos A/P e tabela de notas pendentes | duas listas mínimas | Filial ignorada nos Pedidos; quantidade não é saldo calculado; colunas do payload omitidas |

### Aba Estoques

#### Fonte e payload

A leitura exige uma linha em `estoques` para Produto + Filial e seleciona:

- `emestoque`, `reservado`, `reservaprevia`, `danificada`, `futuro`, `demonstracao`, `conserto`, `transito`, `estoquefisico`;
- `financeiro`;
- `localizacao`, `sublocalizacao`, `minimo`, `maximo`;
- dados usados também pela aba Financeiro: última compra, preços ICMS, IPI e datas.

O serviço calcula:

- Estoque venda = Em estoque + Reservado + Reserva prévia;
- Estoque total = Estoque venda + Trânsito + Demonstração + Conserto + Danificada;
- Custo médio = Financeiro dividido pelo mesmo conjunto quantitativo do Estoque total, com zero para denominador zero.

Preço normal/promocional é resolvido pelo motor de preço usando Produto, Característica, código da tabela de preço e as colunas normal/promocional da Filial. Promoção vencida retorna preço promocional nulo.

`pedidos` é somado por uma consulta global do Produto, sem usar a Filial recebida.

#### Exibição

O React mostra:

- painel Preços: Normal e Promoção;
- Quantidades: Em estoque, Reservado, Reserva prévia, Demonstração, Conserto, Em trânsito, Danificada e Futuro;
- totais: Estoque físico, Estoque venda, Estoque total e Pedidos.

Embora estejam no JSON e no tipo TypeScript, **não são exibidos na aba**: Custo médio, Financeiro, Localização, Sublocalização, Mínimo e Máximo. Localização e limites aparecem/editam-se no grid mestre, não no painel Estoques. O componente recebe URL de mutação de mínimo/máximo, mas o painel Estoques não a usa.

#### Segurança e testes

O endpoint exige Filial autorizada e existência da linha de estoque. Há testes Feature para fórmulas, denominador zero, preço resolvido, persistência de localização e Filial não autorizada. Não há teste de renderização do painel garantindo todos os campos visíveis.

### Aba Financeiro

#### Fonte e payload

Exige a mesma linha Produto + Filial. Retorna:

- Custo médio e Financeiro;
- Alíquota de IPI;
- Margem final calculada sobre o preço de venda efetivo atual;
- Data e Quantidade da última compra;
- Valor da última compra;
- Preço com e sem ICMS;
- Última compra com ICMS;
- Datas de última entrada e venda;
- flags `simples`, `csosn`, `cst`.

Para CSOSN 101/102, “última compra com ICMS” = Valor última compra + (Preço com ICMS − Preço sem ICMS); demais códigos mantêm o Valor última compra.

O metadata fiscal lê Característica, código de preço, Promoção e `caracteristicas.csosn`. Porém `simples` é fixado em false e `cst` é sempre null. Não há busca de Fornecedor, apesar de o contrato anterior prever esse dado. Também não há descrição/origem do IPI ou tributação além do código parcial.

#### Exibição e mutação

O React mostra:

- Custos: Custo médio, Financeiro, Alíquota de IPI, Situação tributária e Margem final;
- Dados da última compra: preços sem/com ICMS, Valor última compra, compra com ICMS e Quantidade;
- últimos lançamentos: Compra, Entrada e Venda.

Com capability específica, apresenta formulário de alteração do Valor da última compra. A mutação é Produto+Filial, auditada e recarrega o detalhe.

Financeiro é protegido por `viewGerencial` no backend e omitido da navegação sem a capability. Há testes de 403, CSOSN 101 e outro código, fórmula de ICMS e mutação. Não há cobertura de CST, Simples, Fornecedor, IPI ou margem.

### Aba Acumuladores

O repository lê todos os `movimentos` do Produto + Filial, faz left join no Tipo atual, ordena por Data e agrega em PHP por `YYYY-MM`. Compras usam a posição 14 e Vendas a posição 13 da `tiposmovimentos.operacao`; `+` soma a Quantidade, `-` subtrai e outros símbolos zeram. O resultado é ordenado do período mais recente para o mais antigo.

O React apresenta somente Período, Compras e Vendas. Não mostra rodapé, totais gerais, valores financeiros, quantidade acumulada progressiva nem descrição do período. Estado vazio é “Sem acumuladores”.

Limitações visíveis antes da comparação Delphi:

- a consulta lê a **operação atual do cadastro de Tipo**, e não `movimentos.operacao` gravada na linha; alteração posterior do Tipo pode reclassificar o histórico;
- carrega todos os Movimentos e agrega em PHP, sem `GROUP BY`, paginação ou limite temporal;
- faz `Schema::hasTable` em runtime e retorna vazio silencioso quando a estrutura não existe;
- não há tratamento explícito de Quantidade absoluta versus sinal armazenado;
- não há totais nem manifesto tipado específico no frontend.

Acumuladores é gerencial e protegido no backend. O único teste funcional específico comprova ordem recente→antiga e um exemplo positivo de Compra/Venda; não cobre sinal negativo, alteração do Tipo, Filial cruzada, múltiplos Movimentos no mês ou vazio.

### Aba Preços e Preços por Cargo

O serviço resolve preço normal, promoção, validade e estado ativa/vencida pelo motor compartilhado. Ele também consulta parâmetros `precos_por_cargo` e `preco_por_cliente`, usando como contexto a Filial ativa da sessão, com fallback para a Filial selecionada.

O payload atual contém:

- `precos_por_cargo` e `preco_por_cliente`;
- preços convencionais normal/promocional;
- dados de Promoção;
- `cargos`;
- `clientes`;
- horário do servidor.

Porém `cargos` e `clientes` são **sempre arrays vazios**. O React ignora os flags e as listas e renderiza apenas dois painéis: Preços convencionais e Promoção. Portanto, o modo Preços por Cargo está somente declarado, não implementado. Não há tabela, colunas, prioridade, Cargo, fator, valor, validade ou estado vazio próprio.

Outras limitações:

- o parâmetro pode ser resolvido pela Filial ativa da sessão, não necessariamente pela Filial da linha selecionada;
- a aba Preços fica visível e o endpoint responde mesmo sem `can_visualizar_precos`; a capability de preços não protege esse detalhe;
- `preco_por_cliente` também não possui dados nem UI;
- `arredondamento_ecf` no manifesto está hardcoded null;
- o teste existente cobre apenas preço convencional por `colunasprecos` e promoção vencida; não existe teste de Cargo, Cliente, capability, parâmetro ou Filial divergente.

### Aba Pedidos

#### Pedidos

A consulta junta `pedidos` e `produtospedidos`, filtra Produto, situações literais `A` e `P`, `pp.quantidade > 0`, e devolve Número, Situação, Entrega e essa Quantidade como `quantidade_pendente`.

Problemas visíveis:

- o método não recebe/filtra Filial, embora a rota e resposta incluam Filial;
- não calcula saldo pendente; apenas renomeia a Quantidade total do item;
- não considera atendido/recebido/cancelado parcial ou outra coluna de saldo;
- depende de códigos literais A/P sem catálogo semântico;
- faz introspecção `Schema::hasTable` em runtime e silencia ausência estrutural.

No React, cada linha mostra somente link “Pedido N” e Quantidade. Situação e Previsão existem no payload, mas não são exibidas. Não há totalizador nem cabeçalho tabular. O link usa um template montado manualmente para `/cadastros/vendas/pedidos/{numero}`, sem evidência neste inventário de que seja a rota canônica nomeada.

O total `Pedidos` mostrado na aba Estoques reutiliza essa mesma consulta global e, portanto, também perde Filial e soma Quantidade total.

#### Notas pendentes

A consulta usa uma tabela denominada `notas_entrada_pendentes`, filtrada por Produto + Filial, `cancelada=false`, `recebida=false` e Quantidade positiva. Retorna ID, Número e Quantidade.

O React mostra NF e Quantidade e abre o histórico fiscal readonly usando o **ID** da Nota, preservando corretamente a identidade distinta do Número do Pedido. Não exibe Fornecedor, emissão, previsão, saldo, situação ou total.

A dependência de uma tabela simplificada `notas_entrada_pendentes` e o fallback silencioso por `Schema::hasTable` precisam ser confrontados com o schema/SQL real; podem representar scaffold de especificação, não integração com as tabelas legadas efetivas.

Os testes comprovam apenas que Pedido e Nota usam identidades distintas e que o histórico fiscal recebe o ID correto. Não cobrem Filial dos Pedidos, cálculo pendente, situações excluídas, notas canceladas/recebidas, colunas renderizadas, navegação canônica ou totais.

### Identidade, escopo e carregamento transversal

Pontos positivos já implementados:

- identidade estável `produto:filial`;
- Filial autorizada validada antes do detalhe;
- requisição anterior abortada e resposta atrasada descartada;
- abas gerenciais negadas no servidor;
- estado vazio/erro/loading/ready compartilhado;
- formatação de Quantidade pelo parâmetro e moeda/data por helpers comuns.

Inconsistência importante: `assertEscopo` valida apenas IDs positivos e Filial autorizada. Somente Estoques/Financeiro chamam `requireEstoqueRow`. Assim, Acumuladores, Preços e Pedidos podem responder para um Produto que não possui relação em `estoques` naquela Filial. Em Pedidos, os dados globais do Produto podem então aparecer dentro de qualquer Filial autorizada.

Também não há DTOs TypeScript específicos para Financeiro, Acumuladores, Preços e Pedidos; o componente trata `unknown`/`Record<string, unknown>`. Só Estoques possui tipo nominal detalhado. Isso permite divergência silenciosa entre JSON e renderização.

### Limitações de testes e seams existentes

O seam backend já é bom: Feature tests autenticados na rota lazy validam AuthZ, Filial e payload. Há também testes unitários do calculador de saldos. Deve ser preservado e ampliado.

Lacunas:

- nenhum teste do componente das abas garante rótulos/colunas/estado vazio;
- nenhum contrato tipado ou snapshot assegura que campos retornados sejam exibidos;
- Preços por Cargo e Cliente não têm qualquer cobertura;
- Pedidos não testa Filial nem saldo pendente;
- Acumuladores tem cobertura mínima;
- Financeiro não testa os campos atualmente hardcoded/ausentes;
- Estoques não testa paridade visual de localização, limites, custo e Financeiro.

### Conclusão do inventário Laravel

O esqueleto arquitetural da Consulta é reutilizável: rota lazy, identidade, cancelamento, AuthZ de Filial, capability gerencial, motor de preços, formatação e mutações auditadas. As divergências não exigem outro módulo.

Os pontos mais críticos a confrontar com o Delphi são:

1. conteúdo visual incompleto da aba Estoques apesar de dados já disponíveis;
2. metadata fiscal/Fornecedor incompletos no Financeiro;
3. Acumuladores reconstituídos com operação atual do Tipo e agregação simplificada;
4. Preços por Cargo inteiramente ausente apesar do flag;
5. Pedidos sem Filial nem saldo pendente e Notas apoiadas em tabela possivelmente provisória;
6. capability de visualizar preços não aplicada à aba/endpoint;
7. contrato Produto+Filial desigual entre os detalhes;
8. ausência de tipos e testes frontend para quatro das cinco abas.
