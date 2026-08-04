# Decidir o fatiamento e os contratos dos prompts SpecKit

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 05, 08

## Question

À luz dos inventários Delphi e Laravel, qual é o menor conjunto de prompts `/speckit.specify` com fronteiras coesas para fundação/acesso, componente compartilhado de chave NF-e, leitura/grids/batching e confirmação transacional, com critérios de aceite, testes e dependências explícitas?

## Comments

## Answer

Serão produzidos quatro prompts `/speckit.specify`, nesta ordem:

1. **Componente compartilhado de chave NF-e**: value object/regra backend, normalização para 44 dígitos, DV módulo 11, utilitários TypeScript e `NfeAccessKeyInput` acessível e reutilizável.
2. **Fundação, acesso e autorização**: migration/menu `Interlojas → Confirmação por Notas`, capability da folha, filial ativa fixa, cinco parâmetros e autorização separando Solicitante da Confirmação e Autorizador da Confirmação.
3. **Consulta, grids, batching e Conferir Produtos**: filtros, busca, grids de notas/produtos sem paginação, exportação/personalização, duas consultas constantes, anti-N+1 e integração `NST` com o `ConferenceEngine`.
4. **Confirmação transacional**: comando em lote com uma transação atômica por nota, idempotência, locks, Nota Fiscal de Entrada em `notaspag`, itens, impostos, movimentos, estoque, pedidos, financeiro, conferência documental e romaneio.

Decisões confirmadas:

- a Filial Requisitante/destino é fixa pela filial ativa da sessão; as notas elegíveis são Notas de Saída da Filial Requisitada, com `dadosfiscais.cliente = filial ativa` e `tipocliente = ''L''`;
- datas começam hoje/hoje pelo servidor; a página abre sem consultar; Gerar/F6 ou Enter na data final executa; datas inválidas, invertidas ou fora de `DATA CONTABIL`/`DIASNOTARETROATIVA` retornam 422;
- a busca secundária comprovada é Série + Número, apesar do rótulo Delphi “Filial”; há fallback por Número;
- não haverá paginação: notas e produtos usam `ErpPreferenceDataGrid` com ordenação client-side, preferências, personalização e exportação de todo o conjunto carregado/autorizado;
- gerar executa uma consulta para notas e uma consulta para todos os produtos, agrupados em memória; trocar a nota selecionada não consulta o banco;
- zero queries em loops: listas simples usam `whereIn` ou `ANY(array)`; pares produto–filial usam tuplas para conjuntos pequenos ou `unnest(... WITH ORDINALITY)` para conjuntos maiores; nunca combinar dois `ANY` independentes e produzir cartesiano;
- testes afirmam teto constante de queries para 1 e N notas, ordem/correspondência, vazio, duplicados e pares não cruzados;
- chave NF-e tem valor canônico de 44 dígitos, máscara visual em grupos de quatro, colagem formatada ou crua e DV módulo 11 validado no backend;
- a capability do menu é distinta da autorização operacional;
- usuário com autoridade pode reautenticar a própria senha; sem autoridade, o Solicitante precisa de outro Autorizador por login/senha; ambos são auditados e nenhuma senha é persistida ou aceita como identidade indicada pelo browser;
- múltiplas notas são processadas individualmente: falha numa nota não reverte as anteriores nem impede as seguintes, mas cada nota é internamente atômica e devolve `confirmada`, `já confirmada`, `rejeitada` ou `falhou`;
- cada nota confirmada cria na filial destino a Nota Fiscal de Entrada em `notaspag`, cabeçalho, produtos, natureza/impostos e, quando aplicável, documento a pagar/duplicatas, junto com movimentos, estoque e pedidos na mesma transação;
- chave de idempotência + hash do payload e unicidade de domínio impedem duplicação concorrente; repetição equivalente devolve o resultado anterior e mesma chave com payload diferente conflita;
- para romaneio, preservar exatamente as funções compartilhadas `incluirconferenciadocumentos` (ROS/ROE por nota) e `Atualizar_situacao_romaneio`; caracterizar seus contratos no banco e não concluir o romaneio prematuramente;
- o botão Conferir usa o tipo `NST`, persiste conferência separada por dado fiscal via novo `NstConferenceAdapter` do `ConferenceEngine`, é opcional e não bloqueia F5;
- efeitos realmente externos usam outbox pós-commit; gravações no mesmo PostgreSQL não são artificialmente separadas por outbox;
- os prompts tratam as pesquisas em `modules/interlojas/confirmacao-por-notas/` como pacote Delphi autoritativo, mandam inspecionar o Laravel atual e não implementam durante `/speckit.specify`.
