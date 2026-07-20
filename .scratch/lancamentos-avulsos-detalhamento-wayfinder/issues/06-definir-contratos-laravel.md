Type: grilling
Status: resolved
Blocked by: 02, 03, 04, 05

## Question

Qual deve ser o contrato final no Laravel para cada lookup, grade e operação SQL, conciliando paridade informacional, segurança por Filial, usabilidade, desempenho, paginação, resolve exato, atualização pós-gravação e autoridade das triggers?

## Answer

Entendimento compartilhado confirmado com o usuário.

### Lookups e elegibilidade

Os lookups Laravel serão mais restritivos que o Delphi:

- Filiais sempre limitadas às autorizadas por `UserBranchAccessService`;
- destino diferente da origem e elegível para o Produto;
- Tipo existente, não interno, não inativo e com `operacao` diferente da sentinela;
- Produto permitido pelo parâmetro de compostos e elegível na Filial;
- Lote pertencente ao Produto, coerente com Filial e situação exibida;
- digitação direta e lupa usam exatamente os mesmos predicados;
- opção conhecida, mas inelegível, retorna motivo explícito em vez de parecer inexistente.

Produto e destino sem linha em `estoques` são aceitos somente quando **Incluir Estoque Automático** estiver ativo. Devem aparecer marcados como “Estoque será criado”; preparação destaca o efeito, aplicação não cria a projeção e mudança do parâmetro invalida a preparação.

### Lookup de Produto

Reutiliza as mesmas colunas do lookup da Ficha de Produtos:

- Código;
- Descrição/Item;
- Código de Barras;
- Linha;
- Coluna;
- situação/inatividade;
- comissão do Grupo;
- comissão do Produto;
- busca avançada.

Acrescenta metadados técnicos não necessariamente visíveis: ID canônico, composição, controle de Lote/validade, referência/unidade necessárias e elegibilidade na Filial.

Paginação padrão 25, máximo 100. Pesquisa por todos os campos já disponíveis na Ficha. Resolve exato aceita código visual e código de barras e retorna o ID bigint canônico.

### Demais lookups

- **Filiais:** todas as autorizadas, sem paginação; Código e Nome.
- **Tipos:** 25 por página, máximo 100, Código/Descrição, com efeitos/transferência no payload técnico.
- **Lotes:** 25 por página, máximo 100, pesquisa por Nº Lote; ordenação Validade + ID; retorna ID, Nº Lote, fabricação, validade, inatividade, fora de linha e contexto de saldo.
- pesquisa vazia pode abrir primeira página; curinga isolado não dispara varredura ampla.

Lote sem saldo positivo continua elegível para entrada ou substituição. Inativo, fora de linha ou vencido aparece identificado, mas bloqueado. Para saída, preparação compara Quantidade às dimensões afetadas; trigger valida novamente sob lock.

### Grades e painéis

Preservar cinco visões informacionais:

1. Movimentos;
2. Quantidades históricas;
3. Valores históricos;
4. Quantidades atuais do Produto;
5. Quantidades atuais do Lote.

Valores atuais ficam em cards: Custo Médio, Financeiro, Preço com ICMS, Preço sem ICMS e Última Compra.

Histórico:

- últimos dez Movimentos por Produto + Filial;
- `numero desc`;
- sem paginação e sem reordenação pelo usuário;
- somente leitura;
- raiz recém-gravada destacada;
- derivados reais permanecem no histórico quando pertencem ao mesmo Produto+Filial.

### Segurança financeira

Usar permissão financeira explícita do contexto Estoque:

- autorizado recebe Valores, Financeiro, Custo Médio, Preços e Última Compra;
- não autorizado não recebe esses campos do backend;
- permissão de registrar não concede acesso financeiro;
- se o Tipo exigir entrada financeira, usuário sem permissão não conclui e recebe orientação para solicitar usuário autorizado.

### Endpoint contextual

Um endpoint recebe Filial, Produto, Lote opcional e Tipo opcional e coordena consultas separadas parametrizadas. Retorna:

- identidades resolvidas;
- snapshot do Produto;
- Valores atuais quando autorizados;
- snapshot/dados do Lote;
- dez Movimentos com todos os campos das três abas;
- Tipo e efeitos;
- versão/fingerprint do contexto.

Não usar SQL monolítico. Sem contexto válido, distinguir “não selecionado”, “Produto sem Estoque”, “Lote sem projeção” e “linha zerada”.

### Invalidação

- mudar Filial limpa Produto, Lote, destino, contexto e preparação;
- mudar Produto limpa Lote, contexto e preparação;
- mudar Tipo limpa preparação, campos incompatíveis e destino se não transferencial;
- mudar Lote limpa contexto do Lote e preparação;
- mudar Data, Quantidade, Referência ou valores invalida preparação, preservando lookups;
- respostas antigas são descartadas por versão da seleção;
- Registrar fica desabilitado até preparação válida.

### Preparação, concorrência e idempotência

`preparar` não escreve nem abre transação persistente. Emite token curto ligado a usuário, Filiais, Produto, Lote, Tipo, payload financeiro e fingerprint.

POST:

- relê tudo dentro de transação curta;
- se contexto/saldos mudaram, responde `409 contexto_alterado` e novo contexto, sem gravar;
- mudança de Tipo, autorização, parâmetros ou identidade invalida preparação;
- nova confirmação gera nova preparação/chave;
- chave de idempotência só pode repetir o mesmo payload;
- replay devolve o mesmo resultado sem segundo INSERT.

### Escrita e resultado

Laravel insere exatamente um Movimento-raiz por allowlist. Não envia `operacao`, `lancto`, saldos, Financeiro calculado, relações derivadas, Grupo, flags de bypass ou timestamps.

Triggers:

- atribuem número/ordem;
- aplicam Operação;
- bloqueiam projeções;
- validam negativos;
- atualizam Estoques/Lotes;
- geram transferência, componentes e compensação.

Após commit, resposta identifica raiz e lista derivados por espécie. Derivado em outra Filial aparece no resumo, não no histórico da origem. Só então o cliente recarrega integralmente histórico, snapshots e Valores; não há atualização otimista.

### SQL normativo

São normativos:

- parâmetros e tipos;
- filtros de autorização/elegibilidade;
- cardinalidade;
- campos/shape;
- ordenação;
- allowlist do INSERT;
- fronteira transacional.

SQL/Query Builder apresentado no adendo é referência parametrizada, não texto literal obrigatório. Testes comprovam contrato. Permanecem proibidos concatenação de valores, `MAX()+1`, UPDATE direto em projeções, cópia das triggers em PHP e locks aplicativos em ordem concorrente.
