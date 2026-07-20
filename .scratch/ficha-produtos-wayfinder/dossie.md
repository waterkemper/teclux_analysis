# Dossiê — Migração Estoques → Ficha de Produtos

## 1. Finalidade deste documento

Este documento é a fonte autocontida para especificar e implementar no Laravel a consulta **Estoques → Ficha de Produtos**. Todos os comportamentos necessários estão descritos aqui. O futuro executor não precisa e não deve consultar o Delphi.

O módulo é uma consulta histórica somente leitura de um produto. Ele apresenta eventos de estoque e os snapshots acumulados gravados em cada evento, com duas perspectivas — Movimentos e Lotes —, saldo anterior e detalhe contextual de contratos.

## 2. Escopo

### Incluído

- página, rota, autorização e navegação do módulo;
- filtros de produto, lote, filiais, tipo, período e lançamentos avulsos;
- geração de consulta e estados de carregamento, vazio, erro e resultado obsoleto;
- perspectivas Movimentos e Lotes;
- opening balance por escopo;
- deltas, snapshots, operação, custo médio, fiscal, moeda e auditoria;
- detalhe histórico contextual de produtos por contrato;
- paginação, ordenação estável e preferências da grade;
- autorização separada para dados financeiros;
- exportação como adaptação recomendada;
- testes funcionais, de consulta e segurança.

### Excluído

- criar, alterar ou excluir movimentos;
- correção financeira e edição inline;
- supressão de triggers;
- migrar internamente Cadastro de Produtos, lotes ou contratos;
- PDF/impressão;
- recalcular snapshots a partir de deltas;
- copiar layout, atalhos ou bugs do sistema anterior.

## 3. Fronteiras do módulo

A Ficha não é:

- Cadastro de Produtos;
- posição atual da Análise/Consulta de Estoques;
- relatório agregado de Movimentação Diária;
- tela de Contratos;
- mecanismo de manutenção de movimentos.

Ela integra esses contextos somente por lookup ou leitura. A Ficha possui serviço e read model próprios.

## 4. Vocabulário

- **Produto:** item canônico consultado, identificado internamente por ID e apresentado por código visual/descrição.
- **Movimento:** evento persistido em `movimentos`. `quantidade` é o delta do evento.
- **Movimento por lote:** projeção histórica persistida em `movimentoslotes` vinculada ao movimento mestre.
- **Snapshot:** saldo acumulado gravado no próprio evento para cada dimensão; não é obtido somando os deltas do período.
- **Opening balance / saldo anterior:** último snapshot anterior ao início do período; não é movimento persistido.
- **Lote:** unidade identificada por ID interno e número, pertencente a um produto.
- **Filial:** dimensão de segurança e de saldo; toda consulta deve limitar-se às filiais autorizadas.
- **Avulso:** movimento cujo tipo possui `coalesce(tiposmovimentos.interno,false)=false`.
- **Executor:** `usuariologado`, usuário que executou o evento.
- **Autorizador:** `usuarioautorizacao`, usuário que autorizou o evento; pode ser nulo e não define se o lançamento é avulso.
- **Operação:** string histórica de 14 posições indicando efeitos.
- **Contrato contextual:** contrato relacionado a um movimento da ficha, detalhado sem permitir alteração.
- **Dados financeiros:** financeiro, custo, custo médio, preços com/sem ICMS, moeda, valor em moeda, IPI e campos correlatos protegidos por capacidade própria.

## 5. Experiência da página

Usar a linguagem visual atual das consultas Laravel:

1. shell da página;
2. aba **Parâmetros**;
3. aba **Dados**, indisponível antes da primeira geração válida;
4. em Dados, subabas **Movimentos** e **Lotes**;
5. painel de **Histórico completo do contrato**, aberto sob demanda para a linha contextual;
6. grade configurável somente leitura.

Ações:

- **Gerar:** valida e executa a consulta; após sucesso ativa Dados → Movimentos.
- **Cancelar requisição:** pode abortar a requisição HTTP em andamento no cliente, sem criar job persistido de geração.
- **Exportar:** melhoria Laravel opcional, submetida às mesmas autorizações e filtros.
- **Alternar perspectiva:** Movimentos/Lotes, sem alterar filtros.
- **Alternar grupos de colunas:** Referência, Operação, Cliente/Fornecedor e grupos financeiros autorizados.
- **Mostrar/ocultar dimensões:** usar column picker/preferências existentes.

Atalhos podem complementar controles visíveis, mas não são o único meio de operar. Toda mudança de filtro depois de gerar marca o resultado como obsoleto até nova geração.

## 6. Filtros e validações

### Produto

- obrigatório;
- lookup retorna ID interno, código visual, descrição e indicador de controle de lote/validade;
- deep-link pode pré-selecionar produto, sem gerar automaticamente;
- payload e consulta usam o ID interno.

### Lote

- indisponível até existir produto válido;
- lookup obrigatoriamente restrito ao produto;
- retorna ID, número, fabricação, validade e produto proprietário;
- trocar produto limpa o lote;
- produto que controla lote/validade exige lote;
- backend sempre rejeita lote de outro produto.

### Filiais

- opções derivam de `UserBranchAccessService`;
- usuário pode selecionar uma ou mais autorizadas;
- seleção vazia significa explicitamente todas as filiais autorizadas;
- códigos autorizados devem ser materializados na cláusula SQL;
- nunca interpretar vazio como ausência de filtro;
- payload manipulado com filial não autorizada retorna 403/erro de autorização.

### Tipo de movimento

- opcional;
- lookup read-only de código de até três caracteres e descrição;
- normalização canônica em maiúsculas;
- se informado, deve existir e filtrar exatamente `movimentos.tipomovimento`.

### Período

- inicial padrão: primeiro dia do mês atual;
- final padrão: data atual;
- ambas obrigatórias e válidas;
- inicial ≤ final;
- consulta usa intervalo semiaberto: `data >= início 00:00:00` e `data < dia seguinte ao fim 00:00:00`;
- definir limite máximo de período conforme convenção/configuração atual de consultas pesadas.

### Somente lançamentos avulsos

- desmarcado por padrão;
- quando marcado, filtra tipos com `coalesce(tiposmovimentos.interno,false)=false`;
- não usar presença de autorizador como definição.

## 7. Resultado de Movimentos

Cada linha real representa um registro histórico de `movimentos` e deve oferecer, conforme autorização:

### Identidade e tempo

- número do movimento;
- lançamento/sequência;
- data do movimento;
- processamento;
- filial;
- tipo e descrição;
- lote interno/número quando houver;
- contrato quando houver;
- referência.

### Evento

- quantidade do evento;
- cliente/fornecedor;
- operação compactada e suas 14 posições.

### Snapshots acumulados

- em estoque;
- reservado;
- trânsito;
- demonstração;
- conserto;
- futuro;
- danificada;
- estoque físico;
- reserva prévia.

Não adicionar acabados/semiacabados na primeira entrega sem fonte histórica confirmada.

### Financeiro/fiscal

- financeiro acumulado;
- valor/custo do movimento;
- custo médio;
- preço com ICMS;
- preço sem ICMS;
- alíquota IPI;
- moeda e descrição;
- valor em moeda;
- pedido de cotação;
- pedido aberto.

### Auditoria

- ID/nome do executor;
- ID/nome do autorizador, anulável.

Movimentos sem lote permanecem na perspectiva Movimentos.

## 8. Resultado de Lotes

A perspectiva Lotes usa `movimentoslotes` vinculada ao movimento mestre e expõe os mesmos conceitos aplicáveis, usando quantidades, snapshots, operação e valores da projeção de lote.

Regras:

- mostra todos os lotes do produto no escopo;
- se um lote foi filtrado, mostra apenas esse lote;
- não depende da linha corrente da aba Movimentos;
- mudar seleção/navegação em Movimentos não modifica seu conjunto;
- ordenação e paginação são próprias e determinísticas.

## 9. Ordenação e paginação

Ordem canônica:

1. filial;
2. timestamp/data do evento;
3. número do movimento;
4. lançamento;
5. identificador de lote quando necessário como desempate.

A ordenação deve permanecer estável entre páginas, impedindo duplicação ou salto de linhas. Paginação é server-side e preserva o snapshot exato dos filtros utilizados para gerar.

## 10. Opening balance

Opening balance é uma projeção separada e tipada, por exemplo `openingBalance` ou linha com `isOpeningBalance=true`. Não criar ID fictício de movimento.

### Movimentos

Obter deterministicamente o último snapshot anterior à data inicial **para cada filial selecionada/autorizada**.

### Lotes

Obter deterministicamente o último snapshot anterior **para cada filial + lote** existente no escopo; se lote foi filtrado, somente ele.

### Filtros do opening balance

- sempre produto;
- sempre filiais;
- lote quando estrutural à perspectiva/filtro;
- não aplicar tipo de movimento nem “somente avulsos”, pois o saldo representa a posição real anterior, não apenas eventos da categoria filtrada.

Usar ordenação descendente por timestamp, número e lançamento; para múltiplos grupos, usar estratégia equivalente a `row_number() over (partition by ... order by ... desc)`.

Se não houver snapshot anterior, retornar ausência explícita. Não apresentar zeros como se fossem saldo confirmado e não fabricar movimento vazio.

## 11. Operação de 14 posições

| Posição | Código | Dimensão |
|---:|---|---|
| 1 | EST | Em estoque |
| 2 | RES | Reservado |
| 3 | TRÂ | Trânsito |
| 4 | DEM | Demonstração |
| 5 | CON | Conserto |
| 6 | FUT | Futuro |
| 7 | DAN | Danificado |
| 8 | FÍS | Estoque físico |
| 9 | PRV | Reserva prévia |
| 10 | U.ENT | Última entrada |
| 11 | U.COMP | Última compra |
| 12 | FIN | Financeiro |
| 13 | TVEN | Totalização de venda |
| 14 | TCOM | Totalização de compra |

Expor o caractere histórico com label/tooltip. `+` representa adição, `-` redução e `*` posição ignorada nos fluxos conhecidos. Preservar literalmente outros caracteres; não inventar significado para `C` ou `=`.

## 12. Custo médio

Por linha/snapshot:

`customedio = 0` quando o denominador for zero; caso contrário:

`round(financeiro / (emestoque + reservado + reservaprevia + transito + demonstracao + conserto + danificada), 2)`.

`futuro` e `estoquefisico` não entram no denominador. A API deve usar precisão numérica segura; formatação pt-BR pertence à apresentação.

## 13. Cliente/fornecedor e auditoria

Cliente/fornecedor:

- sem nota vinculada: resolver por `movimentos.cliente` + `tipocliente`;
- com nota: resolver o fornecedor da nota;
- usar joins/subqueries eficientes;
- não criar navegação ou manutenção da pessoa/nota.

Executor e autorizador são papéis distintos. Nomes vêm do cadastro atual, mas IDs históricos devem permanecer disponíveis. Autorizador nulo é válido.

## 14. Histórico completo do contrato

O painel é opcional e carregado sob demanda a partir do contrato e filial da linha corrente, respeitando a perspectiva Movimentos/Lotes.

Exibir:

- data, filial, tipo, referência e quantidade do evento;
- contrato;
- código e descrição da situação documental;
- data do contrato;
- reservado em;
- faturado em;
- produto no contrato;
- quantidade contratada;
- devolvidos;
- trocados.

O relacionamento aceita item direto ou produto composto que contenha o produto consultado. Devolvidos somam registros tipo `D`; trocados, tipo `T`.

O painel mostra **histórico completo do contrato** na filial/perspectiva contextual. Período, tipo e avulsos da consulta mestre não são reaplicados; isso deve estar declarado no título/ajuda, jamais ser diferença silenciosa. Falha ao carregar o detalhe não apaga nem corrompe a grade mestre e oferece retry localizado.

## 15. Segurança

Separar capacidades:

1. acesso ao módulo;
2. escopo de filiais;
3. visualização financeira;
4. exportação, se habilitada.

Criar chave de módulo, policy/middleware e autorização server-side para index, gerar, lookups e exportação. O modelo deve reconhecer concessões vigentes diretas, por grupo e administrador.

Usuário sem capacidade financeira:

- não vê colunas/grupos financeiros;
- não recebe campos financeiros no JSON/Inertia;
- não consegue obtê-los por parâmetros manipulados;
- não os recebe na exportação;
- não encontra valores sensíveis em logs.

Não existem rotas de escrita neste módulo.

## 16. Estados, erros e observabilidade

- validação retorna mensagens por campo;
- carregamento impede gerações concorrentes acidentais;
- empty state diferencia “sem movimentos” de “sem snapshot anterior”;
- erro preserva filtros e permite tentar novamente;
- timeout produz erro classificado, sem SQL bruto;
- cancelamento no cliente aborta somente a requisição HTTP em andamento;
- falha de detalhe não invalida mestre;
- logs incluem correlation ID, duração, contagem e filtros não sensíveis;
- não registrar valores financeiros ou payloads integrais sensíveis.

## 17. Estratégia de execução

A geração da consulta principal é **obrigatoriamente síncrona e paginada**. Cada chamada a Gerar ou mudança de página executa a leitura e devolve o resultado na mesma resposta HTTP. Não criar job de geração, polling, endpoint de status ou processamento em background para a Ficha.

Aplicar timeout limitado e otimizar SQL/índices sem alterar o contrato síncrono. Exportações grandes podem ser assíncronas porque constituem operação separada. Toda consulta deve usar timeout e bindings.

## 18. Reuso Laravel obrigatório

### Frontend

- shell e fluxo de `AnaliseEstoques/Index.tsx`;
- `ErpCadastroShell`;
- `ErpCadastroTabBar`;
- `ErpConsultaOperationBar`;
- `ConsultaFilterSection`;
- `SimpleDateRangeFieldset`;
- `AuthorizedFiliaisCheckList`;
- `ErpPreferenceDataGrid`;
- catálogo/preferências/exportação da grade;
- modais/lookups de entidade existentes.

### Backend

- `UserBranchAccessService`, com códigos autorizados sempre materializados;
- resolução existente de produto/característica;
- `LegacyTiposMovimentosRepository::listForLookupPaginated()`;
- metadados/leitura de `LegacyProdutoLoteRepository`;
- utilitários de paginação, bindings, sanitização, timeout, cancelamento e classificação de falhas;
- padrões de joins do stack de Movimentação Diária;
- fronteiras read-only de Consulta/Detalhe de Contratos.

## 19. Peças novas

- rotas e controller da Ficha;
- Form Request(s);
- policy/module access/capacidade financeira;
- `FichaProdutosConsultaService`;
- repositório legacy read-only dedicado;
- compilador/normalizador de filtros;
- consultas de movimentos, movimentos por lote, opening balances e contratos;
- DTOs/row mappers;
- catálogo e colunas das duas grades;
- lookup/wrapper de lote restrito ao produto;
- testes.

Não adicionar regras de Ficha ao `LegacyMovimentacaoDiariaRepository` e não reutilizar seu saldo financeiro inicial como opening balance.

## 20. Persistência e SQL

- somente `SELECT`;
- Query Builder, SQL parametrizado e allowlists;
- nunca concatenar filial, tipo, datas, lote, contratos ou ordenação vindos do usuário;
- ler snapshots persistidos em `movimentos`/`movimentoslotes`;
- não derivar snapshots somando `quantidade`;
- não consultar posição atual de `estoques` como substituto histórico;
- contratos são consultados por projeção específica, sem acoplar repositórios de escrita;
- evitar subqueries por linha quando joins resolvem usuário/parte;
- aplicar isolamento de filial dentro de toda query, não apenas após carregar.

## 21. Formatação e apresentação

- datas em padrão pt-BR; processamento inclui horário;
- quantidades usam precisão/máscara de domínio vigente;
- financeiro, custo e preços normalmente duas casas;
- IPI duas casas;
- valor em moeda seis casas quando o contrato do dado exigir;
- filial usa código/nome atuais;
- códigos de situação e operação têm descrição/tooltip;
- desconhecidos permanecem visíveis, não são descartados;
- preferências persistem apresentação, não filtros sensíveis nem dados.

## 22. Comportamentos que não devem ser reproduzidos

- SQL contraditório do saldo por lote;
- máximos independentes que formam snapshot inexistente;
- concatenação de SQL;
- uma única linha de saldo para várias filiais;
- aba Lotes seguindo a linha mestre por MasterSource;
- resultado antigo tratado como atual depois de mudar filtro;
- lote de outro produto;
- linha artificial vazia confundida com saldo zero;
- definição de avulso por autorizador;
- recorte contratual divergente sem aviso;
- índices rígidos de colunas/atalhos ocultos;
- permissão monolítica de gerente;
- edição financeira, save e `naoprocessartriggers`;
- abertura contextual que remove filial obrigatória;
- erro global do detalhe destruindo resultado mestre.

## 23. Critérios de aceite

1. Acesso autorizado abre a Ficha; acesso negado falha em todos os endpoints.
2. Concessão direta, por grupo e administrador seguem o modelo vigente.
3. Produto é obrigatório e deep-link apenas pré-seleciona.
4. Lote pertence ao produto e é obrigatório quando o produto assim exige.
5. Filiais consultadas são exatamente subconjunto das autorizadas; vazio usa todas autorizadas.
6. Período inclui integralmente os dias inicial/final pelo intervalo semiaberto.
7. Tipo filtra exatamente; avulso usa `tiposmovimentos.interno`.
8. Alterar qualquer filtro marca resultado obsoleto.
9. Movimentos sem lote aparecem em Movimentos.
10. Lotes não dependem da linha corrente e respeitam filtro de lote.
11. Quantidade é delta; dimensões coincidem com snapshots persistidos.
12. Opening balance é tipado, anterior ao período e calculado por filial ou filial+lote.
13. Ausência de opening balance não vira saldo zero confirmado.
14. Ordenação é determinística entre páginas.
15. As 14 posições da operação aparecem com legendas.
16. Custo médio usa exatamente sete dimensões e trata denominador zero.
17. Executor e autorizador permanecem distintos; autorizador pode ser nulo.
18. Financeiro não chega à UI/API/exportação sem capacidade.
19. Contrato simples e composto são encontrados; devolvidos/trocados são separados.
20. Painel contratual declara histórico completo e falha isoladamente.
21. Empty/error/retry preservam filtros e não fabricam movimentos.
22. SQL usa bindings e queries permanecem read-only.
23. Não existe endpoint de criação, edição ou exclusão.
24. Gerar responde sincronamente com página e metadados na mesma requisição, sem job/status, respeitando timeout.
25. Exportação, se entregue, replica filtros e segurança da geração.

## 24. Cenários mínimos de teste

- usuário sem acesso, com acesso direto, por grupo e admin;
- usuário com uma/múltiplas filiais e tentativa de filial proibida;
- produto inexistente, lote alheio e produto com lote obrigatório;
- limites do período e data final com horário;
- movimentos no mesmo timestamp/lançamento para desempate;
- movimento com e sem lote;
- duas filiais e dois lotes com snapshots anteriores diferentes;
- ausência de snapshot anterior;
- dimensões positivas/negativas e custo médio com denominador zero;
- avulso externo sem autorizador e interno com autorizador;
- executor sem autorizador;
- usuário com/sem capacidade financeira, inclusive exportação;
- contrato direto, produto composto, devolução e troca;
- falha/timeout no mestre e falha isolada no detalhe;
- mudança de cada filtro após geração;
- tentativa de injeção em campos e ordenação.

## 25. Rastreabilidade do levantamento

As decisões detalhadas que originaram este contrato estão nos tickets do Wayfinder:

- Inventariar interface, filtros e fluxo Delphi;
- Inventariar datasets, SQL, saldos e cálculos Delphi;
- Inventariar permissões, parâmetros e configurações Delphi;
- Inventariar resultados, operações e integrações Delphi;
- Mapear capacidades Laravel existentes;
- Construir matriz de paridade Delphi × Laravel.

Esses documentos servem para auditoria humana. A especificação e o prompt devem copiar para si todo conteúdo necessário deste dossiê e **não mandar o executor consultar o Delphi ou esses tickets**.

## 26. Instrução para o próximo passo

Executar:

`$to-spec .scratch/ficha-produtos-wayfinder/dossie.md`

O `$to-spec` deve gerar uma especificação e um prompt SpecKit integralmente autocontido em:

`modules/estoque/ficha-produtos/09-speckit-prompt.md`

O prompt deve orientar o executor a inspecionar apenas o Laravel atual para localizar os componentes/repositórios citados e validar nomes/caminhos que possam mudar. Não deve solicitar acesso ao Delphi.
