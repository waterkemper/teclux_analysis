Type: task
Status: resolved
Blocked by: 01, 02, 03, 04, 05

## Question

Qual matriz item a item confronta o contrato Delphi com o Laravel atual e classifica cada achado como paridade obrigatória, adaptação recomendada, reuso Laravel, lacuna Laravel, dúvida ou comportamento legado a não reproduzir, incluindo decisões propostas e critérios verificáveis de aceite?
## Answer

### Regra de classificação

A matriz usa:

- **PO — Paridade obrigatória:** comportamento de negócio que a primeira entrega deve preservar.
- **AR — Adaptação recomendada:** mesma finalidade, redesenhada segundo convenções Laravel e correções explícitas.
- **RL — Reuso Laravel:** capacidade existente a integrar, sem duplicação.
- **LL — Lacuna Laravel:** peça específica ainda inexistente.
- **DV — Dúvida resolvida nesta matriz:** ambiguidade legado/Laravel que recebe decisão.
- **NR — Não reproduzir:** defeito, risco ou comportamento fora do escopo somente leitura.

Uma linha pode ter mais de uma classe porque, por exemplo, um requisito obrigatório pode depender simultaneamente de reuso e de uma lacuna.

### Matriz funcional

| Área/item | Contrato Delphi | Laravel atual | Classe | Decisão para migração | Critério verificável de aceite |
|---|---|---|---|---|---|
| Identidade do módulo | Estoques → Ficha de Produtos | Não existe | PO, LL | Criar tela própria, sem confundir com Cadastro/Análise/Movimentação | Menu/rota abrem página identificada como Ficha de Produtos |
| Natureza | Linha do tempo de um produto, delta + snapshot | Relatórios próximos não têm este contrato | PO, LL | Read model próprio e somente leitura | Cada linha separa `quantidade` de saldos acumulados |
| Produto | Obrigatório; visual convertido para ID interno | Lookup/resolução existentes | PO, RL | Reusar lookup, guardar ID canônico | Gerar sem produto falha por campo; produto válido chega como ID |
| Deep-link | Abre com produto vindo de outras consultas | Padrões de navegação/lookup existem | PO, AR | Aceitar produto pré-selecionado por parâmetro seguro | URL/ação autorizada abre com produto resolvido sem executar automaticamente |
| Lote dependente | Restrito ao produto; obrigatório quando produto controla lote/validade | Repositório por produto existe; lookup genérico não restringe | PO, RL, LL | Lookup recebe produto; troca de produto limpa lote; obrigatoriedade deriva do cadastro | API rejeita lote alheio; UI não conserva lote após trocar produto |
| Selecionar lote primeiro | Delphi pode trocar/preencher produto com confirmação | Não necessário à convenção atual | AR | Produto primeiro; lote fica indisponível até produto válido | Lote não pode ser consultado sem produto |
| Filiais | Gerente opcional/todas; não gerente filial-base fixa | Filiais autorizadas já existem | PO, RL, DV | Multi-seleção autorizada; padrão/vazio = todas as autorizadas, materializadas na query | Usuário nunca recebe filial fora de seu escopo, inclusive payload manipulado |
| Tipo de movimento | Opcional, código exato de três caracteres | Lookup existente | PO, RL | Reusar lookup read-only e comparação canônica | Tipo inexistente é rejeitado; informado filtra exatamente |
| Período/default | Primeiro dia do mês até hoje; inclusivo até 23:59:59 | Campo de período reutilizável | PO, RL, AR | Defaults iguais; backend usa `data >= início` e `data < dia seguinte ao fim` | Eventos no primeiro/último dia entram; após meia-noite seguinte não |
| Período inválido | Datas válidas e inicial ≤ final | Requests Laravel suportam validação | PO, RL | Validar no servidor e refletir por campo | Inicial posterior retorna 422 sem consultar banco |
| Avulsos | Rótulo diz avulsos, SQL usa autorizador não nulo | Movimentação usa `tiposmovimentos.interno` | DV, RL, NR | “Somente lançamentos avulsos” = `coalesce(interno,false)=false`; autorizador continua auditoria | Movimento externo sem autorizador entra; interno autorizado não entra |
| Gerar | F6/botão/Enter; volta a Movimentos | Barra/hook existentes | PO, RL, AR | Botão Gerar e atalho acessível; aba Dados após sucesso | Gerar válido substitui resultado e ativa Movimentos |
| Invalidação | Alguns filtros fecham dataset; outros deixam resultado velho | Análise tem assinatura/stale state | AR, RL, NR | Toda mudança após geração marca resultado obsoleto | Alterar qualquer filtro exibe estado obsoleto e impede confusão com filtros atuais |
| Estado vazio | Delphi fabrica SALDO ANTERIOR vazio | Grid possui empty state | AR, RL, NR | Distinguir ausência de snapshot de saldo zero e ausência de movimentos | Resposta/UI mostram empty state sem movimento falso |
| Abas | Movimentos e Lotes | Tab shell existe | PO, RL | Duas perspectivas sincronizadas nos mesmos filtros | Ambas consultam o mesmo produto/escopo e mantêm seleção de filtros |
| Aba Lotes ligada à linha mestre | MasterSource segue lote da linha corrente | Não existe | DV, NR | Aba mostra todos os lotes do produto no escopo; se filtro de lote existir, somente ele | Navegar em Movimentos não altera conjunto da aba Lotes |
| Ordenação | Filial, data convertida, lancto; empates possíveis | Paginação/grid disponíveis | AR, LL, NR | Ordem determinística por filial, timestamp, número e lançamento | Mesmos dados retornam na mesma ordem, sem duplicar/saltar entre páginas |
| Paginação | Ausente | Infraestrutura existente | AR, RL | Paginação server-side preservando ordem cronológica | Metadados e transição de página mantêm filtros/ordem |
| Movimentos sem lote | Preservados por left join | SQL próximo já suporta | PO | Manter na aba Movimentos | Movimento sem lote aparece com lote nulo |
| Linha de opening balance | Linha sintética copiada do último snapshot | Inexistente | PO, LL, AR | Retornar estrutura tipada, nunca fingir movimento persistido | `isOpeningBalance`/objeto equivalente não possui ID de movimento |
| Escopo do opening balance | Delphi escolhe um registro global e respeita tipo/lote, não avulsos | Inexistente | DV, LL, NR | Último snapshot anterior **por filial autorizada selecionada**; na aba Lotes, por filial+lote. Independente de tipo/avulsos, pois representa posição real; lote permanece dimensão estrutural | Fixture com duas filiais/lotes retorna aberturas independentes e determinísticas |
| Sem snapshot anterior | Linha vazia artificial | Inexistente | AR, LL | Ausência explícita; UI pode exibir “sem saldo anterior registrado” | Não converte ausência em zeros confirmados |
| Snapshots | Nove dimensões persistidas em cada movimento | Esquema conhecido, endpoint ausente | PO, LL | Ler fonte histórica autoritativa, sem reconstruir por soma de delta | Valores retornados coincidem campo a campo com o registro histórico |
| Dimensões adicionais | Acabados/semiacabados existem no estoque atual, não na Ficha legada | Esquema existe | DV | Não adicionar à primeira ficha sem fonte histórica/necessidade confirmada | Catálogo inicial contém somente dimensões contratuais da Ficha |
| Operação 14 posições | Marcadores históricos EST…TCOM | Tipo lookup existe, projeção não | PO, LL | Expor marcador e legenda; não inferir efeitos desconhecidos | Todas as 14 posições são mapeadas; símbolos desconhecidos permanecem literais |
| Custo médio | Financeiro / sete dimensões; zero se denominador zero | Inexistente na Ficha | PO, LL | Calcular por snapshot com precisão definida; futuro/físico fora | Testes cobrem denominador zero e exclusão de futuro/físico |
| Financeiro/fiscal/moeda | Visível só a gerente; vários campos históricos | Sem permissão específica confirmada | PO, LL, AR | Capacidade separada de visualizar dados financeiros; backend omite/mascara sem ela | Usuário sem capacidade não recebe os campos nem em exportação |
| Executor/autorizador | IDs e nomes atuais; autorizador anulável | Joins existentes em Movimentação | PO, RL | Reusar convenções e manter papéis separados | Linha pode ter executor com autorizador nulo; nomes correspondem aos IDs |
| Cliente/fornecedor | Resolvido do movimento ou nota | Join próximo existe | PO, RL | Reusar leitura eficiente, sem navegação cadastral | Fixtures com/sem nota resolvem a parte prevista |
| Modos Referência/Operação/Parte | Alt+F7 e índices físicos | Grade configurável existe | PO, AR, RL, NR | Seletor explícito/grupos de colunas; preferências permitidas | Usuário alterna os três conjuntos sem perder dados |
| Modos Financeiro/Custo/IPI | Alt+F5 para gerente | Grade/permission building blocks | PO, AR, LL | Grupos explícitos condicionados à capacidade financeira | Grupo não aparece nem é exportável sem permissão |
| Ocultar dimensões | Alt+F8 | Column picker existente | AR, RL | Usar configuração de colunas, com defaults coerentes | Visibilidade persiste conforme convenção da grade |
| Formatação | Datas pt-BR; precisões distintas e inconsistentes | Formatadores de grid existem | AR, RL, NR | Centralizar formatos por tipo/precisão do contrato | Datas, quantidades e moedas formatam igual nas duas abas |
| Contratos | Painel contextual por contrato+filial, produto simples/composto | Repositórios existem; projeção não | PO, RL, LL | Projeção própria read-only, acionada sob demanda | Linha contextual inclui situação documental, datas, item, quantidades, devolvidos/trocados |
| Recorte contratual | Delphi carrega histórico completo dos contratos encontrados, ignorando filtros silenciosamente | Inexistente | DV, LL, NR | Preservar histórico completo do contrato selecionado **por filial e perspectiva**, com rótulo explícito “Histórico completo do contrato” | UI/API declaram o escopo; período/tipo/avulsos não parecem aplicados silenciosamente |
| Situação do contrato | Código documental cru | Domínio de contratos existente | PO, AR, RL | Retornar código e descrição documental, não status financeiro | Código conhecido possui label; desconhecido permanece identificável |
| Falha do detalhe | Pode propagar erro global | Serviços têm classificação de erro | AR, RL | Falha de lote/contrato não invalida resultado mestre; retry localizado | Forçar erro no detalhe mantém movimentos visíveis |
| Acesso ao módulo | Acesso legado direto/grupo + perfil | Padrão policy/module access existe, grupo requer confirmação | PO, RL, LL | Chave/policy próprias; acesso direto e por grupo conforme modelo vigente | Testes cobrem permitido, negado, admin e concessão por grupo |
| Autorização em endpoints | Delphi concentra na tela | Laravel pode proteger por rota/controller | PO, AR | Autorizar index, gerar, lookups, exportação e status no servidor | Chamada direta sem acesso retorna 403 |
| Consulta somente leitura | Delphi permite correção financeira | Usuário confirmou “só pela consulta” | AR, NR | Nenhum endpoint/save/edit; nenhuma supressão de trigger | Rotas não expõem mutação e transação permanece read-only |
| SQL concatenado | Macros com literais | Query Builder/bindings disponíveis | NR, RL | Somente parâmetros/bindings e allowlists | Testes com entradas especiais não alteram SQL |
| Cancelamento/timeout | Não funcional no legado | Infraestrutura existente | AR, RL | Reusar se consulta/job for cancelável; timeout obrigatório | Timeout gera erro classificado; cancelamento encerra trabalho quando aplicável |
| Execução async | Ausente | Jobs existentes | AR, RL, DV | Começar síncrono paginado se benchmark cumprir orçamento; promover a job sem mudar contrato se exceder | Teste de volume documenta decisão e orçamento |
| Exportação | Ausente | Grid/export server-side existe | AR, RL | Permitida como melhoria; mesmos filtros, colunas autorizadas e escopo | Exportação não vaza financeiro/filial e representa o filtro gerado |
| PDF/impressão | Ausente na Ficha | PDF da Movimentação existe | NR | Fora da primeira entrega | Nenhuma dependência do relatório de Movimentação |
| Preferências | Não persistem | Grid possui preferências | AR, RL | Persistir somente apresentação, nunca filtros sensíveis/resultado | Reabrir restaura colunas, não dados consultados |
| Erros | Handler global, sem retry/timeout claro | Padrões melhores existem | AR, RL | Mensagem acionável, filtros preservados, retry; logs com contexto mínimo | Erro não limpa filtros nem exibe SQL/dados sensíveis |
| Observabilidade | Quase ausente | Snapshot/progresso/failure patterns existem | AR, RL | Correlation ID, duração, filtros não sensíveis e contagem | Log permite diagnosticar sem armazenar valores financeiros |
| Acessibilidade/atalhos | F6/Enter/Alt; dependência de índice | Componentes web atuais | AR | Botões rotulados e teclado como complemento, não único acesso | Todas as ações são operáveis por teclado e controles visíveis |
| Testes | Não há equivalente Laravel da Ficha | Suítes/padrões próximos existem | LL | Cobrir contrato de query, segurança e UI crítica | Cenários abaixo automatizados |

### Critérios transversais mínimos

A implementação só satisfaz a matriz quando houver testes automatizados para:

1. produto obrigatório, lote pertencente e datas;
2. acesso direto/grupo/admin e isolamento de filiais;
3. período nos limites de dia e ordenação estável paginada;
4. movimento sem lote e perspectivas Movimentos/Lotes;
5. opening balance por filial e por filial+lote, inclusive ausência;
6. delta versus snapshots e custo médio;
7. avulso por `tiposmovimentos.interno`;
8. executor versus autorizador;
9. produto simples e componente em contrato, devolução e troca;
10. ocultação server-side de financeiro na tela e exportação;
11. resultado obsoleto, vazio, erro e falha isolada do detalhe;
12. inexistência de endpoints de escrita.

### Arquitetura e reuso fechados

Peças novas: rota/controller/request/policy, `FichaProdutosConsultaService`, repositório read-only dedicado, compilador de filtros, DTO/row mapper, projeções de opening balance/lote/contrato, catálogo de grade e testes.

Reuso obrigatório: shell de Análise de Estoques; `ErpPreferenceDataGrid` e preferências/exportação; componentes de consulta/período; lookup de produto; `UserBranchAccessService`; lookup de tipo; metadados de lote; utilitários de timeout, cancelamento, paginação, sanitização e erros; padrões de joins de Movimentação Diária e fronteiras de Contratos.

Não reutilizar como contrato: `LegacyMovimentacaoDiariaRepository`, saldo financeiro inicial da Movimentação, posição atual de `estoques`, rule builder completo da Análise, lookup de lote sem produto, PDF da Movimentação ou repositórios de escrita/impressão de contratos.

### Decisões que removem a névoa

- UI Laravel segue shell atual, com filtros em Parâmetros, resultado em Dados, subabas Movimentos/Lotes e detalhe contratual sob demanda.
- Filial é escopo autorizado multi-selecionável; vazio equivale explicitamente a todas autorizadas.
- Lote depende do produto; a aba Lotes não depende da linha corrente.
- Opening balance é tipado e calculado por filial ou filial+lote, independente dos filtros evento-específicos tipo/avulsos.
- Contratos mostram histórico completo contextual com escopo declarado.
- Primeira entrega é estritamente somente leitura.
- Execução síncrona versus job é decisão técnica por orçamento de desempenho, sem mudar o contrato funcional.
