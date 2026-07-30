# Inventariar a Quitação em Lote já existente no Laravel

Type: task
Status: resolved
Blocked by:

## Question

O que o Laravel atualizado já implementa para Quitação individual e em lote na UI, `specs/196-contas-pagar-quitacao`, `PayDuplicatasBatchAdapter`, commands, services, repositories, writer bancário, Policies, proof sensível, Filiais, parâmetros, idempotência, concorrência, reconciliação e testes; quais capacidades devem ser preservadas, estendidas ou corrigidas para alcançar a paridade sem duplicar componentes?

## Answer

### Escopo e baseline inspecionada

Inventário do Laravel atual em `backend/app`, `backend/resources/js`, `backend/routes`, `backend/tests`, `specs/196-contas-pagar-quitacao` e nos artefatos canônicos de `modules/financeiro/contas-pagar/quitacao-duplicata/`.

`CONFIRMADO`: já existe um núcleo individual relevante e reutilizável:

- `PayDuplicataCommand` e `PayDuplicataRequest`;
- `DocumentosPagarController` e rota `.../duplicatas/pagar`;
- `ContasPagarFinancialRevision`, `ContasPagarIdempotencyGuard` e locks nos repositories;
- `ContasPagarMovimentoBancarioWriter` e `LegacyContasPagarMovtosBancosRepository`;
- `ContasPagarAccountingAdapter`, sincronização de impostos e reconciliador;
- Policies/serviços de autorização, Sensitive Operation, acesso a Filiais e manifest de Parâmetros do Sistema;
- `DuplicataDialog`, grid, lookups e cálculo de valor a pagar;
- testes de validação e placeholders PostgreSQL.

O lote não deve substituir esse núcleo, mas o estado atual também não pode ser usado sem aprofundamento.

### Estado real da Quitação em Lote

- `CONFIRMADO`: `PayDuplicatasBatchAdapter` existe, porém apenas percorre `items`, mescla os dados comuns e chama `PayDuplicataCommand::execute` uma vez por item.
- `CONFIRMADO`: não há controller, FormRequest, rota, página React, item de hub/menu, query de pesquisa ou Policy/ability específica de Quitação em Lote.
- `CONFIRMADO`: não há consumidor de produção do adapter; somente `PayDuplicatasBatchAdapterTest` o referencia.
- `CONFIRMADO`: o único teste do adapter verifica se ele pode ser resolvido pelo container. Não testa execução, rollback, ordem, payload, segurança nem efeitos.
- `DIVERGENTE`: o adapter abre uma transação por Duplicata por meio do command individual. Se um item falha, os anteriores já foram commitados; portanto não oferece a atomicidade prometida por `specs/196` nem exigida pelo mapa.
- `DIVERGENTE`: o retorno é uma lista de resultados unitários e não um manifesto de lote com estado, itens, chaves bancárias, revisão final e Auditoria.

### Fragilidades do adapter atual

- `CONFIRMADO`: a chave default é `lote-{índice}-{documentopag}-{numero}`. Sem um identificador único da intenção do lote, execuções legítimas posteriores podem reutilizar a mesma chave; reordenar itens muda as chaves.
- `CONFIRMADO`: o hash idempotente do command inclui pagamento e identidade, mas a reserva continua sendo por item; não existe replay atômico do lote.
- `DIVERGENTE`: quando duas Duplicatas pertencem ao mesmo Documento, o primeiro pagamento altera a revisão do agregado; se ambas carregarem a mesma `expected_revision` do preview, a segunda tende a falhar por revisão obsoleta depois do primeiro commit.
- `OPORTUNIDADE`: substituir o loop público por um command batch que usa o mesmo motor interno de pagamento dentro de uma única transação, com uma chave/idempotência e uma revisão/manifesto coerentes para toda a intenção.

### Núcleo individual que deve ser preservado

- `CONFIRMADO`: valida capacidade de pagamento, acesso à Filial de emissão e Filial de Pagamento.
- `CONFIRMADO`: bloqueia Documento e Duplicata, rejeita já paga e compara `expected_revision` do agregado.
- `CONFIRMADO`: executa em `DB::transaction` e usa reserva/commit/fail/replay idempotente.
- `CONFIRMADO`: exige Tipo de Pagamento, Conta, Filial e, com integração bancária, Evento.
- `CONFIRMADO`: sincroniza impostos retidos, chama writer bancário, adapter contábil e reconciliador antes do retorno.
- `CONFIRMADO`: retorna Documento, Duplicata, revisão e indicadores de efeitos.
- `CONFIRMADO`: FormRequest proíbe payload financeiro estranho por allowlist e valida os modos `residual`/`desconto`.

### Autorização de Pagamento e proof

- `CONFIRMADO`: `ContasPagarDocumentosPagarAuthorizationService::canExecutePayment` exige acesso ao módulo e perfil legado `pagamento`; a Policy/FormRequest aplica essa ability antes do command.
- `CONFIRMADO`: existe configuração Sensitive Operation `ContasPagar/quitar_duplicata`, com perfil `pagamento`, proof não reutilizável e modo senha do próprio Operador quando ele já possui perfil.
- `DIVERGENTE`: `PayDuplicataCommand` possui uma ramificação para aceitar proof quando a Duplicata não está autorizada, mas um Operador sem capacidade de pagamento é barrado pelo FormRequest e pelo início do command antes de o proof ser consumido.
- `DIVERGENTE`: o command ainda permite pagar Duplicata não autorizada quando o Operador pode autorizar ou apresenta proof. O destino deste mapa exige exclusivamente Autorização de Pagamento vigente; proof da Quitação confirma a operação sensível, não substitui o estado autorizado da Duplicata.
- `DIVERGENTE`: `persistir_autorizador_no_registro=false` e a Auditoria atual não separa claramente Operador e Autorizador.
- `OPORTUNIDADE`: criar ability/ação sensível específica do lote, reaproveitando infraestrutura, e consumir uma prova vinculada ao manifesto/contexto do lote após confirmar que todos os itens já estão autorizados.

### Pagamento parcial no backend e UI

- `CONFIRMADO`: o command aceita `parcial.modo = residual|desconto` e rejeita valor divergente do esperado sem modo explícito.
- `CONFIRMADO`: modo desconto incrementa `valordesconto` para fechar o valor devido; é mais explícito e reversível que o comportamento implícito do Delphi.
- `CONFIRMADO`: modo residual reduz a Duplicata quitada e cria outra aberta com o saldo, mesmo vencimento, `complemento=Residual`, observação própria e `autorizado=false`.
- `DIVERGENTE`: a residual sempre nasce não autorizada; o Parâmetro `AUTORIZACAO PAGTO AUTOMATICA`, já disponível no manifest, não é consultado.
- `DIVERGENTE`: a residual zera juros/multa e seus percentuais, enquanto o Delphi carrega multa/juros; o cálculo também mistura o valor devido com juros/multa ao reduzir `valorvencto`, exigindo caracterização antes de reuso em lote.
- `POSSÍVEL BUG`: `nextNumero` faz `MAX+1` em memória sem lock/alocador explícito, sujeito a colisão concorrente.
- `CONFIRMADO`: a UI individual não apresenta as três escolhas. Se `valorpagto < valor devido`, envia automaticamente `{modo: 'residual'}`; o Operador não pode escolher **Desconto Obtido** nem cancelar um diálogo específico.
- `DIVERGENTE`: o lote precisa reutilizar o cálculo/formato, mas coletar explicitamente **Gerar outra parcela**, **Desconto Obtido** ou **Cancelar** para cada diferença antes do write.

### Movimentos bancários

- `CONFIRMADO`: o writer lê `Início Integração Bancos`, exige Evento quando aplicável, grava saída origem `P` e delega insert/agregação ao repository.
- `CONFIRMADO`: o repository cria um `movtosbancoseventos` por chamada quando há Evento e retorna Conta, data, `sequencia` e valor do cabeçalho.
- `DIVERGENTE`: `PayDuplicataCommand` envia `documento = documentopag`, observação `Pagto doc {documento} parc {numero}` e não persiste na Duplicata as chaves retornadas.
- `DIVERGENTE`: o retorno não expõe `sequenciaevento`; `LegacyDuplicataRepository::mapRowToForm` também não mapeia `sequenciaevento`.
- `DIVERGENTE`: agregação acontece implicitamente por Conta+data+origem `P`+Documento. Assim, pagamentos do mesmo Documento podem se agrupar sem solicitação, e Duplicatas de Documentos diferentes com o mesmo cheque não se agrupam.
- `DIVERGENTE`: não há `aggregate_id`/intenção explícita nem opção segura de “sem agrupamento”. O lote não consegue garantir um cabeçalho único por cheque.
- `DIVERGENTE`: ao agregar, o cabeçalho concatena observações individuais, em vez de usar `PAGTO DIVERSAS DUPLICATAS` e Evento nulo.
- `DIVERGENTE`: `movtosbancos.documento` deve vir de `chequepagto`, vazio sem cheque; histórico individual deve ser `[NF|DOC] ... DUP ...`, conforme o dossiê canônico já existente.
- `POSSÍVEL BUG`: `proximaSequencia`, `proximaSequenciaEvento` e `proximaSeqCompensacao` usam `MAX+1` sem lock/advisory allocator demonstrado.
- `POSSÍVEL BUG`: o repository procura o “primeiro” agregado compatível, sem identidade fornecida pelo caller; em concorrência ou dados ambíguos pode anexar ao cabeçalho errado.

### Contabilidade, impostos e parâmetros

- `CONFIRMADO`: `ContasPagarParameterManifest` já contém os textos canônicos relevantes: `GERARCONTABILIDADE`, `DATA CONTABIL`, `AUTORIZACAO PAGTO AUTOMATICA`, `Início Integração Bancos`, `Geração automática do imposto retido` e `Histórico padrão pagto duplicata`.
- `CONFIRMADO`: o manifest usa `ParameterReadBundle` e semântica legacy truthy, alinhado a ADR-0005; deve ser reutilizado, não repetir strings no lote.
- `CONFIRMADO`: a sincronização tributária já recebe `OrigemImpostosRetidos::PagamentoDuplicatas`.
- `DIVERGENTE`: `ContasPagarAccountingAdapter` ainda é um stub fail-closed: com `GERARCONTABILIDADE` desligado, ignora; ligado, bloqueia toda Quitação porque não há adapter do schema legado.
- `OPORTUNIDADE`: o lote deve chamar o mesmo adapter uma vez por intenção/manifesto apropriado, mas a implementação contábil real continua requisito para ambientes com o parâmetro ativo.

### Reconciliação, Auditoria e estado pós-pagamento

- `CONFIRMADO`: o reconciliador chamado pelo Pay valida consistência do agregado Documento/Duplicatas, útil para residual e totais.
- `DIVERGENTE`: não reconcilia cabeçalho/eventos bancários nem prova que `sequencia`/`sequenciaevento` da Duplicata correspondem ao evento criado.
- `CONFIRMADO`: a Auditoria de pagamento atual é apenas `Log::info`, com Documento, Duplicata, Operador, valor, request id e idempotência.
- `DIVERGENTE`: não há Auditoria persistente de negócio com before/after, Autorizador, Filiais, decisões parciais, grupo/cheque e chaves dos efeitos.
- `CONFIRMADO`: os artefatos canônicos mais recentes determinam que uma Duplicata paga é imutável e só admite Estorno do Pagamento.
- `DIVERGENTE`: código atual ainda possui Request, rota, controller, command, configuração sensível e UI relacionados a “refazer pagamento”; o lote não deve consumir nem perpetuar essa superfície.

### UI e pesquisa

- `CONFIRMADO`: `DuplicataDialog` individual já oferece Data, valor pago, Tipo, Conta, cheque, Filial, lookups, loading `Processando…`, validação de data mínima e proof via página hospedeira.
- `CONFIRMADO`: Filial de Pagamento é fixada à Filial de emissão na UI individual; a tela Delphi permite escolher outra Filial autorizada.
- `NÃO LOCALIZADO`: página `QuitacaoDuplicatas/Index.tsx`, filtros, grid multi-seleção, visão agrupada, edição de previsão, totais, cheque único, recibos e alternância detalhada/agrupada.
- `NÃO LOCALIZADO`: query/read model para listar exclusivamente Duplicatas autorizadas e não pagas por Filiais, Parte Fornecedora, vencimento, Carteira/Banco, DDA e ordenação.
- `OPORTUNIDADE`: reutilizar componentes ERP, lookups, calculadora, `useSensitiveOperationAuth`, layout responsivo e padrões de grid, mas criar uma página própria e um read model server-side dedicado.

### Qualidade dos testes

- `CONFIRMADO`: há testes de validação HTTP para campos obrigatórios e parcial sem modo.
- `CONFIRMADO`: existem arquivos para pagamento integral, parcial, rollback e concorrência PostgreSQL.
- `DIVERGENTE`: todos esses testes PostgreSQL terminam em `markTestSkipped` por fixture pendente, inclusive quando o driver é PostgreSQL; não comprovam efeitos reais.
- `NÃO LOCALIZADO`: testes do lote, agrupamento por cheque, atomicidade multi-Documento, preflight, proof do lote, residual/desconto em sequência, replay do lote, chaves bancárias por item e UI React da página.

### `specs/196-contas-pagar-quitacao`

- `CONFIRMADO`: a spec já descreve tela independente, grid, mesma informação de pagamento e rollback total, portanto é contexto útil.
- `DIVERGENTE`: sua descrição de tabelas/campos, autorização, movimentos, cancelamento e parâmetros contém nomenclatura antiga ou decisões superadas pelos ADRs/dossiês recentes.
- `DIVERGENTE`: a spec reduz `AgruparPagamentosnoLote` a `nrlotecontabil`, sem estabelecer o agregado bancário e evento por Duplicata exigidos agora.
- `DECISÃO`: tratar `specs/196` como histórico, não como autoridade. O novo `/speckit.specify` deve aprofundar o Laravel atual e as decisões canônicas sem copiar arquitetura sugerida ou regras obsoletas.

### Matriz de reuso

| Capacidade | Direção |
|---|---|
| Locks de Documento/Duplicata e revisão financeira | preservar e adaptar para locks determinísticos do conjunto |
| Validação de Filiais e campos financeiros | preservar e aplicar a todos no preflight |
| Cálculo e modos parcial | preservar conceito; corrigir residual e expor escolha explícita |
| Idempotência unitária | aprofundar para uma intenção batch única |
| `PayDuplicataCommand` | extrair/reutilizar motor interno sem transação/idempotência por item |
| `PayDuplicatasBatchAdapter` | substituir como seam público; não manter loop de commits |
| Writer/repository bancário | aprofundar para intent/resultado tipado, agrupamento explícito e chaves completas |
| Manifest de parâmetros | preservar |
| Impostos retidos | preservar, coordenando efeitos no lote |
| Adapter contábil | preservar seam fail-closed e implementar backend real quando ativo |
| Reconciliador | ampliar para bancos, parcial, Contabilidade e lote |
| Sensitive Operation/Policies/Filiais | preservar infraestrutura, criar contrato coerente do lote |
| UI individual/lookups/calculadora/grid | reutilizar componentes; criar página/read model do lote |
| Logs técnicos | manter para observabilidade, adicionar Auditoria persistente |
| Testes placeholders | substituir por fixtures e assertions reais |

### Consequências para o contrato

- O command batch deve possuir `preview` somente leitura e `confirm` atômico, ambos com identidade/revisão do conjunto.
- Toda escolha parcial e agrupamento devem integrar o hash idempotente e a Auditoria.
- O command deve validar todos os itens e consumir proof antes da primeira mutação, depois executar um único `DB::transaction`.
- O motor individual precisa aceitar contexto transacional compartilhado e retornar manifesto de efeitos; não pode iniciar idempotência/commit por item quando chamado pelo lote.
- A confirmação deve retornar uma revisão/resultado por Documento, vínculo bancário completo por Duplicata e identidade do agregado/cheque quando houver.
