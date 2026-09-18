# Auditoria da implementação Laravel — Controle de Recebimentos

Data da auditoria: 2026-09-02  
URL auditada: `/caixa/controle-recebimentos`  
Implementação: `laravel/backend`  
Fontes de comportamento: artefatos capturados em `modules/caixa/controle-recebimentos/`.

## Resultado executivo

A rota e a implementação Laravel existem. A consulta F6, a fotografia, a
exportação, o cancelamento PostgreSQL, o lookup F9 do cliente e o pipeline de
autorização estão presentes. Porém, a implementação atual não é equivalente ao
comportamento Delphi em pontos importantes de interface e gravação.

Os prompts 01–03 continuam úteis como histórico, mas não devem ser usados
sozinhos para alterar esta implementação. Os prompts 04–06 abaixo são os
corretivos e devem ser lidos depois dos anteriores.

## Achados rastreáveis

Os achados UI-01–UI-07, DB-01–DB-05 e RPT-01 abaixo registram o baseline que motivou os prompts 04–06. O estado atualizado após essas correções está na seção **Reauditoria da implementação atual** ao final deste documento.



| ID | Severidade | Tema | Evidência Laravel | Comportamento Delphi capturado | Resultado |
|---|---:|---|---|---|---|
| UI-01 | Alta | Defaults por operação | `resources/js/Pages/Caixa/ControleRecebimentos/Index.tsx:81-103` | Operação 0: emissão hoje se vazia; operação 1: emissão limpa e vencimento ontem se vazio; operação 2: emissão/vencimento limpos e recebimento hoje se vazio | A troca para operação 1 hoje preenche emissão; operação 2 força ontem–hoje e usa relógio do navegador |
| UI-02 | Média | Aba e títulos | `Index.tsx:47-50`; catálogo PHP/TS | Aba `Registros Selecionados`; colunas `FILIAL`, `LANÇTO`, `VENCIMENTO`, `RECEBIMENTO`, `% DESÁG`, `VLR DESÁGIO`, `NOME DO CLIENTE`, `ORÇAMENTOS` etc. | Laravel usa `Resultados`, `FILI` e títulos em caixa mista/abreviados |
| UI-03 | Média | Ordenação | `controleRecebimentosGridCatalog.ts:6-12`; `ControleRecebimentosOrdenacao.php:68-77` | Ordenação inicial completa e estável: filial, lançamento, transação, valor vencimento, código, tipo, vencimento | O catálogo TS não oferece `transacao`/`tipo` como ordenáveis e ordenação não-default não acrescenta desempates determinísticos |
| UI-04 | Alta | Seleção de sessão | `controleRecebimentosSelecao.ts:14-30,41-71`; teste `controleRecebimentosSelecao.test.ts` | “Confirmar todos” percorre o dataset inteiro; modo 0 propaga o grupo `controlerecebimento`; modos 1/2 limpam/restauram data e valor ao marcar/desmarcar | Laravel opera apenas sobre `displayRows` da página. Ao desmarcar, mantém rascunhos; no modo 2 não limpa visualmente confirmação/valor |
| UI-05 | Média | Valores nulos/zero | `Index.tsx:215-218,258-261` | Ao marcar confirmação, o valor parte do valor de vencimento; zero válido deve continuar zero | Uso de `row.valor_confirmacao || row.valorvencto` trata zero como ausência |
| UI-06 | Média | Comandos/ícones | `Index.tsx:442-481` | Command bar padrão com ações da tela, ícones e atalhos evidenciados | `Gerar` reutiliza ícone de Relatório de Entregas; Confirma, Imprimir e Confirmar todos não declaram ícones próprios |
| UI-07 | Alta | Alterar tipo | `LegacyControleRecebimentosWriteRepository.php:322-385` | `RecalcularRecebimentos` aloca novo código via `recebimentos_proximocodigo()` para cada uma das N linhas, define `controle = 1..N`, conta/evento, rateio e limpa vencimento/deságio | Laravel reaproveita os primeiros códigos, não grava `controle`, não atualiza conta/evento e conserva datavencto/desagio |
| DB-01 | Alta | Documento/duplicata na confirmação | `ControleRecebimentosGravarCommand.php:303-337`; `LegacyControleRecebimentosWriteRepository.php:253-267` | Atualiza documento/duplicata existentes; novo documento usa valor líquido, data de confirmação na duplicata e campos operacionais; cria vínculos no recebimento | Laravel apenas valida documentos existentes, não os atualiza; a duplicata nova usa emissão/lançamento como vencimento e não reproduz os campos de pagamento |
| DB-02 | Crítica | Estorno de efeitos | `ControleRecebimentosGravarCommand.php:352-392` | Estorno apaga/desfaz documento e duplicata, remove evento bancário, ajusta movimento e limpa vínculos; registra operador/data da operação | Laravel só limpa confirmação e zera movimento; não desfaz documento/duplicata/evento nem limpa todos os vínculos |
| DB-03 | Crítica | Movimento/evento bancário | `ControleRecebimentosGravarCommand.php:289-345`; não há escrita em `movtosbancoseventos` no módulo | Confirmação atualiza evento e total do movimento, ou cria movimento/evento quando permitido; estorno subtrai o evento e ajusta o cabeçalho | Laravel exige movimento pré-existente, grava apenas `movtosbancos.valor = valor da linha` e não trata a chave/evento composto |
| DB-04 | Alta | Auditoria da operação | `LegacyControleRecebimentosWriteRepository.php:197-251`; `ControleRecebimentosGravarCommand.php:388-390` | Atualiza `data_operacao` e `usuario_confirmacao` ao concluir cada recebimento | Laravel não grava esses campos e ignora o `rowCount` retornado pelos updates |
| DB-05 | Alta | Atomicidade real | `ControleRecebimentosGravarCommand.php:59-60` e repositórios que usam `DB` implícito | Datasets de efeitos e recebimentos usam a mesma transação | A implementação declara uma transação, mas não há teste de integração que prove rollback conjunto de recebimento, documento, duplicata, movimento/evento, idempotência e auditoria |
| RPT-01 | Média | F6 do relatório | `Index.tsx:463-468`; `useControleRecebimentosShortcuts.ts:76-91` | Requisito do produto: todo relatório deve nascer de F6 e usar o mesmo leiaute/conjunto do grid | O relatório é aberto por Imprimir/F7. O F6 materializa a fotografia, mas não há ação explícita que comunique “gerar relatório” por F6; o contrato deve tornar essa semântica inequívoca |

## O que já está conforme

- A rota canônica existe e usa o prefixo `caixa/controle-recebimentos`.
- A consulta usa projeção explícita e pré-carregamentos set-based para os
  enriquecimentos; não foi encontrado `select *`, `Locate` ou N+1 no read
  model do módulo.
- O parâmetro de integração bancária passa pelo manifesto Laravel; não deve ser
  substituído por leitura direta de `parametros` no componente.
- O grid não oferece inclusão/exclusão livre e mantém `valorlancto` somente
  leitura.
- O F9 do cliente usa `CatalogCodeLookup`, portanto a correção deve preservar o
  modal padrão e não criar janela exclusiva.
- O cancelamento da consulta já usa o protocolo de consulta cancelável. A
  correção deve estender a mesma semântica ao F6 que inicia a fotografia/
  relatório, sem usar somente abort do navegador.
- O snapshot de schema está versionado em `schema/` e não deve ser substituído
  silenciosamente.

## Decisão para os novos prompts

Os prompts corretivos devem priorizar paridade observável do Delphi sobre os
atalhos que os specs 460–462 introduziram para a primeira implementação. A
proteção Laravel continua obrigatória: nada de SQL concatenado, N+1, teste de
driver, `hasTable`/`Schema::has*`, `information_schema`, `pg_catalog` ou
`MAX()+1` novo no caminho de negócio. Quando a rotina Delphi usa uma alocação
insegura de sequência bancária, o Laravel deve usar um alocador autoritativo e
transacional comprovado; se ele não existir no schema/reuso do projeto, deve
bloquear a mutação inteira com erro explícito, nunca fazer metade da operação.


## Reauditoria da implementação atual — 2026-09-02

Após a criação dos prompts 04–06, o checkout atual já incorporou as seguintes
correções: defaults por operação com `data_civil`; aba e títulos canônicos do
catálogo versão 5; ordenação de `transacao`/`tipo` com desempates; seleção pelo
índice completo da fotografia; editabilidade por modo; valor zero tratado como
válido; geração F6 com fotografia/cancelamento; recálculo com novos códigos,
`controle`, conta/evento e limpeza de vencimento/deságio; carimbos de operação;
row count; atualização/remoção de efeitos financeiros e delta de movimento.

Esses pontos têm cobertura nos testes TypeScript e/ou Feature existentes e não
devem gerar novo prompt corretivo sem evidência de regressão.

As lacunas que permanecem e motivam o Prompt 07 são:

| ID | Evidência atual | Correção necessária |
|---|---|---|
| RM-01 | `LegacyControleRecebimentosReadRepository::hydrateRows` transforma `valor_confirmacao` nulo em `'0.00'` | Preservar ausência; zero confirmado continua zero |
| RM-02 | O read model carrega cliente apenas de `autenticacoes` e usa somente `vf.nome` | Reproduzir `coalesce(cliente do contrato, cliente da autenticação)` e `coalesce(vf.razao, vf.nome)` em lote |
| WR-01 | `ControleRecebimentosGravarCommand::confirmar` ainda cria documentos sem explicitar todos os critérios do Delphi e usa um conjunto mínimo de campos | Fixar critérios de criação e o change set completo de documento/duplicata |
| WR-02 | Confirmação/estorno percorrem linhas e podem atingir a mesma identidade composta de evento/movimento mais de uma vez | Agrupar chaves, rejeitar repetição ambígua e aplicar eventos/deltas uma única vez |

O Prompt 07 é complementar aos prompts 04–06: não reabre os itens já
conformes e não autoriza alteração de UI, permissões, rota ou modelo de schema.
## Reauditoria financeira — Contas a Pagar e Movimentos Bancários — 2026-09-02

A revisão específica do write model encontrou as divergências abaixo:

| ID | Evidência atual | Comportamento capturado | Resultado |
|---|---|---|---|
| FIN-01 | `ControleRecebimentosGravarCommand::confirmar` passa `valor_confirmacao` para `inserirDocumentoPag` e `atualizarDocumentos` | Documento/duplicata usam `VlrDesagio` (valor líquido), não o valor bruto confirmado | Divergente |
| FIN-02 | Criação usa confirmação em `documentospag.datalancto`; atualização também grava a data de confirmação | `emissao` e `datalancto` usam `recebimentos.datalancto`; vencimento/pagamento da duplicata usam confirmação | Divergente |
| FIN-03 | Criação/atualização preenche apenas parte dos campos operacionais de documento/duplicata | Delphi preenche complemento, referência, defaults financeiros, filial, usuário e demais campos comprovados | Parcial |
| FIN-04 | `estornar` preserva documento/duplicata quando há mais de um recebimento e não limpa fornecedor/evento do recebimento | Rotina capturada localiza a duplicata pela data anterior, apaga o efeito e limpa também fornecedor/evento | Divergente |
| FIN-05 | Confirmação só atualiza evento existente; mudança de data procura o movimento já na data nova | Delphi remove o efeito anterior e cria/localiza movimento/evento novo, atualizando os vínculos do recebimento | Divergente |
| FIN-06 | `eventoPertenceALinhaEstorno` pode casar evento por valor quando não há identidade persistida | Estorno usa conta/data/sequência/evento/sequênciaevento; não deve escolher evento por valor | Risco financeiro |
| FIN-07 | `confirmarRecebimentos` executa um UPDATE por linha | A gravação deve preparar o lote e persistir em conjunto; requisito do projeto proíbe N+1 | Divergente/performance |
| FIN-08 | `chavesEventoEstorno` chama `loadEventosDoMovimento` dentro do loop de movimentos | Eventos devem ser carregados por todas as chaves em uma consulta set-based | Divergente/performance |

O Prompt 08 foi criado para corrigir exclusivamente esse conjunto, mantendo as
proteções Laravel de alocador autoritativo, binds, `rowCount`, lock,
idempotência, auditoria e rollback.
## Reauditoria após a aplicação parcial do Prompt 08 — 2026-09-02

A implementação atual incorporou o cálculo de `VlrDesagio`, a atualização
set-based de `recebimentos`, a preservação de `NULL` em `valor_confirmacao`, a
precedência de cliente do contrato e as leituras de eventos em lote. O catálogo
do grid continua com os títulos Delphi (`FILIAL`, `LANÇTO`, `VENCIMENTO`,
`RECEBIMENTO`, `TIPO RECEBIMENTO`, `% DESÁG`, `VLR DESÁGIO`, `CLIENTE`, `NOME DO
CLIENTE`, `CONTRATOS`, `ORÇAMENTOS`, `OK`) e a matriz de editabilidade permanece
restrita aos modos já aceitos.

Ainda não há paridade financeira completa:

| ID | Evidência atual | Impacto |
|---|---|---|
| FIN-09 | A criação/atualização de `documentospag` envia `complemento` nulo, usa a observação de contrato como `referencia`, grava `administrador = false` e não atualiza todos os campos operacionais comprovados da rotina Delphi. | Documento a Pagar fica com conteúdo, auditoria e defaults diferentes. |
| FIN-10 | A projeção Laravel não expõe o código textual `tr.tiporecebimento` (`tiporec`), portanto não consegue preencher `complemento`, `referencia` e `duplicatas.observacao` com o valor Delphi. | Títulos e duplicatas têm descrição incorreta ou ausente. |
| FIN-11 | Na mudança de data, o comando remove o efeito anterior, mas exige que o movimento da nova data já exista; não cria/reutiliza movimento/evento nem atualiza a nova identidade no recebimento. | Confirmações válidas no Delphi falham ou ficam sem o novo efeito bancário. |
| FIN-12 | A validação da nova identidade ocorre depois de mutações de recebimento/Contas a Pagar; o rollback protege a transação, mas a falha não é pré-validada como exige o contrato. | Ordem de gravação inadequada e diagnóstico tardio. |
| FIN-13 | O estorno e a confirmação ainda executam mutações físicas de eventos, documentos e duplicatas em loops; as leituras foram agrupadas, mas não existe comprovação de um change set set-based para vínculos repetidos. | O orçamento de consultas e a proteção contra repetição não estão fechados para lotes grandes. |
| FIN-14 | Não há teste PostgreSQL de mudança de data que prove remoção antiga, criação/reutilização nova, atualização das quatro partes da identidade e rollback antes de qualquer efeito. | A divergência mais sensível permanece sem aceite executável. |

### Decisão

É necessário um novo prompt de fechamento, mas não uma nova especificação ampla.
O Prompt 09 (`09-speckit-prompt-fechamento-paridade-financeira.md`) cobre apenas
FIN-09–FIN-14 e preserva as partes já conformes dos prompts anteriores. Depois
dele, a implementação deve ser reauditada; não criar outro prompt sem uma
regressão observável ou uma nova evidência de contrato.
## Reauditoria após o Prompt 09 — 2026-09-03

A implementação atual incorporou os campos financeiros pendentes do Prompt 09:
`tiporec`, `complemento`, `referencia`, `observacao`, defaults da duplicata,
filial e `administrador` do operador. Também passou a pré-validar a existência
única do movimento destino e recusar a transição sem destino, preservando os
efeitos por rollback.

Foi encontrada, porém, uma divergência crítica no caso em que o movimento
existente no destino já possui eventos:

| ID | Evidência atual | Comportamento esperado | Resultado |
|---|---|---|---|
| FIN-15 | `ControleRecebimentosGravarCommand` monta a chave destino com o mesmo `sequenciaevento` do recebimento antigo e chama `atualizarEventoValor`. | A rotina Delphi insere um novo evento com nova sequência; eventos destino existentes permanecem intactos e o total soma todos os eventos. | Divergente/crítico |
| FIN-16 | `ControleRecebimentosTransicaoDataPostgresTest` semeia um evento destino e espera que ele seja sobrescrito com o valor confirmado. | O teste deve verificar novo evento, soma do movimento e quatro vínculos, ou recusa atômica sem alocador seguro. | Teste de aceite incorreto |

Não há evidência de um alocador seguro específico para as sequências de
`movtosbancos`/`movtosbancoseventos` no snapshot. O código não deve copiar
`MAX()+1`: pode implementar a transição somente se reutilizar uma autoridade
transacional comprovada; caso contrário deve recusar antes da primeira escrita.

### Decisão atual

É necessário o Prompt 10, restrito à correção FIN-15–FIN-16. Não é necessário
reabrir os prompts de UI, consulta, grid, relatório, autorização ou Contas a
Pagar. Depois do Prompt 10, uma nova rodada só deve ser criada se surgir uma
regressão observável ou nova evidência de contrato.
## Reauditoria após a implementação do Prompt 10 — 2026-09-03

O Prompt 10 foi aplicado no commit `9adadbfc` (integrado no checkout atual). A
transição de data agora valida/bloqueia o movimento e o evento antigos, bloqueia
o conjunto de movimentos destino e recusa com `movimento_sem_alocador` antes da
primeira escrita. A montagem da chave destino com a sequência antiga e a
sobrescrita via `atualizarEventoValor` foram removidas. Isso está correto para o
SHA do schema atual, que não comprova alocador bancário; não há justificativa
para criar `MAX()+1` ou uma sequência inventada.

O aceite do Prompt 10 ainda tem pendências de qualidade e rastreabilidade:

| ID | Evidência atual | Resultado |
|---|---|---|
| FIN-17 | Testes do fluxo de transição/alocação usam `DB::connection()->getDriverName()` e asserts/skip explícitos de `pgsql`. | Contraria o guardrail do módulo: não testar driver. |
| FIN-18 | `ControleRecebimentosTransicaoQueryBudgetPostgresTest` usa `assertLessThan(80, count($log))`, embora a spec preveja `DatabaseQueryCountAsserter`. | Orçamento arbitrário e menos rastreável; não prova custo independente do tamanho do lote. |
| FIN-19 | Os cenários de recusa conferem principalmente recebimento e eventos; não fazem snapshot determinístico completo de títulos/duplicatas, cabeçalhos e valores dos dois movimentos. | A recusa “antes da primeira escrita” ainda não está comprovada em todo o estado financeiro. |

Esses achados não demonstram regressão funcional do comando nem autorizam
implementar o ramo de sucesso bancário. Eles motivam somente o Prompt 11, que é
um fechamento de testes/documentação. O Prompt 11 não deve reabrir a superfície
da tela, Contas a Pagar, o read model, o lote ou o alocador.

### Decisão após o Prompt 10

É necessário um novo prompt pequeno: `11-speckit-prompt-fechamento-aceite-prompt10.md`.
Ele deve remover as verificações explícitas de driver dos testes tocados,
substituir o orçamento arbitrário pelo asserter padrão e comparar o estado
financeiro integral antes/depois da recusa. Depois dele, não criar outro prompt
sem regressão observável ou nova evidência de contrato.
## Reauditoria após a implementação do Prompt 11 — 2026-09-03

A implementação `be37027f` fechou parte do aceite do Prompt 10: os quatro testes de
transição/alocação não verificam mais o driver, o orçamento usa
`DatabaseQueryCountAsserter` e os cenários de recusa passaram a comparar fotografias
pré/pós. A sintaxe PHP dos arquivos centrais verificados está válida.

A implementação, porém, não está pronta para ser considerada a implementação do
Prompt 11:

| ID | Severidade | Evidência | Resultado |
|---|---:|---|---|
| P11-01 | Crítica | A spec 470, `spec.md:6,160-165,229-235`, define fatia somente de aceite/documentação e proíbe UI, grid, relatório, request e read model. O commit `be37027f` alterou 23 arquivos de produção/UI, incluindo `ControleRecebimentosConsultarRequest.php`, `LegacyControleRecebimentosReadRepository.php`, `Index.tsx`, os componentes da grade e o relatório. | Escopo contaminado; não é possível atribuir o comportamento atual apenas ao aceite do Prompt 11 nem garantir SC-006. |
| P11-02 | Alta | `backend/tests/Support/Caixa/ControleRecebimentosTestHelpers.php:20,200-221,449-471` ainda contém `Schema::hasTable`/`Schema::hasColumn`, embora o arquivo tenha sido tocado para receber a fotografia e a spec 470 exija ausência nos helpers tocados. O novo `ControleRecebimentosListaOrcamentosTest.php:18,76-83` também usa introspecção. | FR-008/SC-004 não estão satisfeitos. O fotógrafo deve ser isolado em helper dedicado sem chamadas proibidas; o teste de orçamentos não pertence a esta fatia sem spec anterior que o autorize. |
| P11-03 | Alta | O estado global `dataConfirmacaoLote` é alterado em `Index.tsx:335-343`, mas ao marcar a linha a data é copiada ao draft em `Index.tsx:245-255`; F5 serializa esses drafts em `Index.tsx:391-400`. Alterar o rodapé depois da marcação não atualiza o draft nem o payload. | A confirmação pode gravar a data antiga, divergindo da semântica documentada do controle inferior global lido no F5. |
| P11-04 | Média | A fotografia em `ControleRecebimentosTestHelpers.php:542-661` faz uma consulta por recebimento, por par `(conta,data)` e por documento, além de uma consulta por documento para duplicatas. | O helper de aceite tem N+1 de leitura. Mesmo fora do request medido, contraria o guardrail geral de consultas set-based e deixa a prova cara e frágil para lotes. |
| P11-05 | Média | O request alterado fixa `DEFAULT_PER_PAGE` e `MAX_PER_PAGE` em `10_000` (`ControleRecebimentosConsultarRequest.php:20-22`), enquanto o Prompt 11 não autorizava mudança da superfície de consulta. | Mudança observável de volume/paginação e memória, sem aceite funcional nesta fatia. Deve ser revertida ou rastreada a prompt anterior independente. |

A matriz de recusa e a decisão `movimento_sem_alocador` continuam sendo a referência
correta: não há evidência para reabrir o sucesso bancário, criar sequência ou alterar
o comando. O próximo trabalho deve ser o Prompt 12, limitado à reconciliação do
escopo, à fotografia set-based e ao contrato/teste da data global.

Verificação de ambiente: `php -l` passou nos três arquivos PHP centrais auditados.
Os testes Vitest direcionados não iniciaram porque o Vite/esbuild falhou com
`spawn EPERM`; isso é bloqueio de ambiente, não motivo para inserir skip ou reduzir
asserts.
## Retificação de escopo — orientação do usuário — 2026-09-03

As alterações de UI, request, read model, relatório e demais testes da
implementação do Prompt 11 são intencionais e pertencem ao usuário; não são
achados corretivos desta rodada. O Prompt 12 fica restrito aos dois achados
funcionais abaixo:

| ID | Tema | Evidência | Correção |
|---|---|---|---|
| P11-03 | Data global do rodapé | `Index.tsx:335-343` altera o estado global, mas a seleção cria drafts em `Index.tsx:245-255` e F5 serializa os drafts em `Index.tsx:391-400`. | O F5 deve usar a data vigente do rodapé para todo o lote aplicável, sem data obsoleta por linha. |
| P11-04 | N+1 na fotografia | `ControleRecebimentosTestHelpers.php:542-661` consulta individualmente recebimentos, pares de movimento, documentos e duplicatas. | Carregar as coleções por conjuntos de chaves, mantendo fotografia determinística e orçamento independente de N. |

O Prompt 12 anterior foi ajustado para não tratar os demais itens como falhas.