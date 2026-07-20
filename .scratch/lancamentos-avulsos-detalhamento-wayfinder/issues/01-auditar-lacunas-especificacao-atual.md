Type: task
Status: resolved
Blocked by:

## Question

Quais lookups, grades e SQLs são citados ou pressupostos pelo dossiê/prompt atual de Lançamentos Avulsos, quais contratos já estão suficientemente definidos e quais lacunas concretas impedem implementação e testes sem novas suposições?

## Answer

### Conclusão

O dossiê e o prompt atuais definem adequadamente a **fronteira de comando e segurança da escrita**, mas não são autocontidos para implementar as leituras da tela. Produto, Filial, Tipo e Lote aparecem como conceitos; “valores atuais”, “quantidades”, “quantidade do lote” e “últimos dez movimentos” aparecem como resultados; porém faltam contratos observáveis de lookup, grade e SQL.

Um agente conseguiria criar o esqueleto do módulo e o INSERT trigger-aware, mas teria de inventar campos de pesquisa, colunas, joins, filtros, chaves retornadas, ordenações e formatos. Essa margem de invenção é incompatível com o destino desta revisão.

### O que já está suficientemente definido

#### Fronteira funcional

- módulo síncrono, inclusion-only e sem pesquisa para manutenção;
- Produto, Filial origem, Tipo e Data obrigatórios;
- Lote e Filial destino condicionais;
- forma dinâmica guiada pelo vetor `operacao` de 20 posições;
- preparação sem escrita, confirmação, autorização sensível e gravação síncrona;
- limpeza/invalidação de dependências quando Filial, Produto ou intenção mudam;
- recarga do contexto depois do commit.

#### Segurança e escrita

- `UserBranchAccessService` limita origem e destino;
- o servidor relê Tipo, Produto, Filiais, Lote e parâmetros no POST;
- o cliente nunca fornece operação, saldos, Financeiro calculado, relações derivadas ou bypasses;
- Laravel insere exatamente um Movimento-raiz;
- triggers são autoridade para número, `lancto`, saldos, Financeiro, transferências, compostos, negativos, `movimentoslotes` e projeções;
- uma transação curta engloba idempotência, auditoria, prova, revalidações, INSERT e triggers;
- proibição clara de writes diretos em `estoques`, `estoqueslotes`, `movimentoslotes` e derivados;
- idempotência durável, classificação de erros e necessidade de testes PostgreSQL real.

#### Endpoints em alto nível

Já existe uma decomposição útil: página, lookup/resolve de Produto, Tipo e Lote, contexto, preparar e registrar. Código digitado e lupa devem passar pelo mesmo resolver. Essa arquitetura pode ser preservada.

### Lacunas dos lookups

#### Filial origem

A especificação informa que a página abre com Filiais autorizadas, mas não define:

- se usa checklist, select, lookup por código ou combinação;
- código e nome exibidos;
- campos pesquisáveis e ordenação;
- valor canônico retornado;
- tratamento de uma única Filial autorizada;
- se Filial sem linha em `estoques` aparece desabilitada ou é omitida depois da escolha do Produto;
- contrato de resolve exato e erro para código digitado;
- paginação/limite quando houver muitas Filiais.

#### Filial destino

Está definida apenas como Filial autorizada, diferente da origem e com Estoque existente. Faltam:

- dependências exatas de Produto, origem e Tipo de transferência;
- filtro que exclui a origem;
- colunas da lupa e mensagem quando não há destino elegível;
- momento em que aparece/desaparece;
- limpeza ao mudar Tipo, Produto ou origem;
- query/resolve que prova Estoque existente no destino.

#### Produto

“Produto existente/utilizável e coerente com a Filial” é insuficiente. Faltam:

- campos pesquisáveis: código interno, código visual, descrição, referência, código de barras ou outros;
- colunas e ordem da lupa;
- chave canônica devolvida e distinção entre código interno/visual;
- paginação, ordenação e busca parcial/exata;
- situação/ativo/inativo e demais filtros de elegibilidade;
- join que exige `estoques` na Filial selecionada;
- dados contextuais necessários ao formulário: descrição, característica, composto, gestão de Lote/validade, unidade/máscara;
- comportamento de Produto composto diante do parâmetro do sistema;
- resolve exato idêntico à lupa e proteção contra Produto de outra Filial;
- mensagem para produto existente, mas sem Estoque ou proibido para lançamento.

#### Tipo de Movimento

A elegibilidade geral está definida — ativo, não interno, operação válida e diferente da sentinela —, mas faltam:

- campos pesquisáveis e colunas exibidas;
- código, descrição e tamanho/formato do código;
- ordenação padrão;
- indicação visual dos principais efeitos do vetor;
- campos necessários para decidir transferência, negativos e forma dinâmica;
- filtros exatos de ativo/interno/sentinela no SQL;
- resolve exato e tratamento de Tipo alterado entre lookup, preparação e POST;
- se Tipos incompatíveis com Produto/Lote/composto são ocultados ou rejeitados após seleção.

#### Lote

O contrato “Produto + Filial” e a obrigatoriedade condicional já existem, mas faltam:

- chave canônica (`lote`, número visível ou ambos);
- campos pesquisáveis;
- colunas: número, fabricação, validade, saldo por dimensão e situação;
- fonte correta entre `lotes`, `estoqueslotes` e relacionamentos;
- filtro exato por Produto + Filial;
- tratamento de vencido, inativo, sem saldo ou saldo insuficiente;
- ordenação, paginação e resolve exato;
- regra para criação de lote — que não deve ser presumida neste módulo;
- payload contextual retornado e distinção entre saldo agregado e saldo do Lote;
- limpeza/invalidação ao mudar Produto ou Filial.

#### O que não é lookup deste módulo

Autorizador não deve virar lookup de usuário: continua sendo resolvido pelo framework de autorização sensível. Operação não é escolhida pelo usuário: vem do Tipo relido pelo servidor. Movimento confirmado não possui lookup para edição.

### Lacunas das grades e painéis

A frase atual “Exibir Valores atuais, Quantidades do Produto, eventual Quantidade do Lote e últimos dez Movimentos” não define sequer se são grades, cards ou painéis.

#### Contexto atual do Produto + Filial

Faltam:

- fonte e cardinalidade;
- lista exata das dimensões: Em estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Estoque físico, Reserva prévia, Acabados, Semiacabados e outras aplicáveis;
- Financeiro/custo/preços e sua apresentação;
- colunas versus cards, títulos, ordem, precisão e zeros/nulos;
- atualização ao trocar Produto/Filial e após gravar;
- indicação de snapshot corrente e horário de leitura.

#### Contexto do Lote

Faltam:

- se há grade própria ou linha/painel;
- colunas e dimensões de `estoqueslotes`;
- fabricação, validade e identificação do Lote;
- relação com saldo agregado do Produto;
- comportamento sem Lote selecionado e após gravação.

#### Últimos dez Movimentos

Faltam integralmente:

- tabela/projeção e escopo Produto + Filial ou também Lote;
- colunas, rótulos, formatos e defaults;
- inclusão de número, `lancto`, data, processamento, Tipo/descrição, referência, quantidade, operação e snapshots;
- dados financeiros e regra de autorização;
- executor/autorizador;
- ordem descendente determinística e critérios de desempate;
- se movimentos derivados aparecem e como são identificados;
- atualização pós-commit e destaque do Movimento recém-gravado;
- seleção, paginação ou limite fixo real;
- comportamento somente leitura e ausência de sorting arbitrário.

#### Resumo de preparação e resultado

O texto define um resumo humano, mas não fixa campos/linhas exibidos, valores antes/declarados, efeitos por posição, alertas, relacionados esperados ou diferenças entre “previsão” e resultado confirmado. A resposta final também cita raiz e relacionados, sem definir uma grade ou lista e suas colunas.

### Lacunas dos SQLs

Não existe SQL parametrizado normativo ou pseudocontrato suficientemente detalhado para nenhuma leitura. Precisam ser inventariados e classificados:

1. Filiais autorizadas e destino elegível;
2. lookup e resolve de Produto por Filial/Estoque;
3. lookup e resolve de Tipos elegíveis;
4. lookup e resolve de Lote por Produto + Filial;
5. leitura do contexto atual em `estoques`;
6. leitura do contexto por Lote em `estoqueslotes`;
7. leitura dos últimos dez Movimentos;
8. leitura de característica/composto e parâmetro habilitador;
9. limites de Data Contábil/Dias retroativos;
10. preparação e revalidação do mesmo contexto;
11. INSERT whitelist do Movimento-raiz;
12. leitura pós-trigger da raiz e relacionados;
13. recarga das projeções depois do commit;
14. reserva, replay e conclusão da idempotência.

Para cada um faltam, conforme aplicável: SELECT/INSERT, tabelas, joins, aliases, parâmetros, tipos, filtros, cardinalidade, ordenação, limite, isolamento de Filial, tratamento de nulos, locks, momento transacional e shape retornado.

O INSERT está definido apenas por whitelist conceitual. Ainda faltam o mapeamento exato de campos do comando para `movimentos`, defaults obrigatórios não fornecidos pelo cliente, uso de `RETURNING` ou leitura posterior, e a separação entre valores explicitamente enviados e valores que devem permanecer sob responsabilidade das triggers.

### Ambiguidades que os próximos tickets devem eliminar

- “Estoque existente” precisa significar exatamente qual linha/tabela e em que momento é validada.
- “Produto utilizável” precisa de predicado verificável.
- “Tipo ativo” precisa ser confrontado com o schema real e seus campos.
- “Lote elegível” precisa decidir vencimento/saldo sem inventar política.
- “Últimos dez” precisa de ordem determinística e regra para derivados.
- “Valores atuais” precisa distinguir projeção atual, valores declarados e resultado pós-trigger.
- SQL de consulta pode ser detalhado; SQL interno das triggers não deve ser duplicado no Laravel.

Nenhuma dessas lacunas exige reabrir a arquitetura de escrita já decidida. Elas justificam integralmente os tickets de inventário Delphi, SQL e auditoria do Laravel atual antes da decisão final.
