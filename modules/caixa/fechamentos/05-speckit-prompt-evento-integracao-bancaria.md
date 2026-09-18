# Prompt para `/speckit.specify` — Fechamento de Caixa: alteração de evento e integração bancária

## Objetivo

Crie uma especificação funcional e técnica complementar para o Fechamento de Caixa Laravel, cobrindo a alteração em lote do código de evento da aba `Eventos` e seus efeitos no legado Delphi/PostgreSQL. A especificação deve corrigir a lacuna deixada pelos prompts 01–04: alterar `autenticacoes.evento` não é uma mudança apenas visual.

Use como evidência primária:

- `delphi/apps/caixa/dmfechamentocaixa.dfm`, especialmente `qryUpdateAutenticacoesEventos`;
- `delphi/apps/caixa/dmfechamentocaixa.pas`, especialmente `SalvarEventos`, `qryEventosBeforePost`, `qryEventosAfterOpen` e `qryEventosAfterInsert`;
- `modules/caixa/controle-recebimentos/schema/postgresql-authoritative-2026-09-01.json`, incluindo a FK, os triggers de `autenticacoes` e a função `autenticacoes_antesinseriratualizar`;
- `laravel/backend/app/Infrastructure/Persistence/Legacy/Caixa/LegacyFechamentoCaixaEventosRepository.php` e os comandos/controller/tests do fechamento;
- os módulos Delphi que consomem `movtosbancos`, `movtosbancoseventos`, `autenticacoes` e `eventos`.

Não invente uma regra de negócio. Quando a evidência não for suficiente, registre a dúvida como decisão bloqueante e proponha a consulta/aceite necessário.

## Contrato legado que deve ser preservado

1. `autenticacoes.evento` é uma referência a `eventos.codigo`. O novo código deve existir e ser compatível com os eventos permitidos na aba (`tipomovimentacao` de entrada/saída). Não altere a linha mestre de `eventos.codigo` como efeito colateral da edição do fechamento.
2. O Delphi executa, para cada linha alterada, um `UPDATE autenticacoes` com `numero`, `evento`, `parametros` e `alterandoevento = true`. O prompt deve explicar por que esse campo é necessário para o trigger e como garantir que ele termine com o valor esperado após o trigger.
3. O trigger `autenticacoes_antesinseriratualizar` deve continuar habilitado. A solução não pode desabilitar trigger, gravar diretamente em tabelas bancárias para “imitar” o efeito sem uma decisão de atomicidade, nem recalcular manualmente `saldo`/`valor` sem reproduzir o legado.
4. Se a autenticação for do tipo `D` e a filial possuir integração bancária, a mudança de evento reclassifica o lançamento: subtrai o valor do evento antigo em `movtosbancos`/`movtosbancoseventos` e acrescenta o valor ao novo evento, removendo o movimento antigo quando zerado conforme a função legada. Essa alteração pode mudar extrato, saldo bancário, agrupamentos e relatórios.
5. Para os demais tipos de autenticação, documente a regra efetiva do trigger: em vários casos o evento bancário é fixo por tipo (`501`, `503`, `504`, etc.), enquanto em `B` e `D` deriva de `NEW.Evento`. Não generalize a regra de `D` para todos os tipos.
6. A reclassificação não pode alterar `tipo`, `valor`, `saldo`, cancelamento, data, filial, caixa, autenticação, sequência ou criar uma nova autenticação. Deve ser transacional e reversível em caso de erro.

## Requisitos para o Laravel

Especifique a implementação necessária, sem assumir que os stubs SQLite representam produção:

- validar o evento novo contra `eventos` e contra a regra de `tipomovimentacao` da aba;
- localizar e atualizar a linha usando a identidade completa do fechamento (`numero` e o contexto `filial`, `caixa`, `data`, ou outra chave canônica comprovada), evitando atualizar uma linha fora do fechamento validado;
- executar a alteração sob transação PostgreSQL real, usando o contrato esperado pelo trigger (`alterandoevento = true`) e deixando o banco legado aplicar sua própria integração;
- tratar lote parcial, erro de FK, linha cancelada/desaparecida, concorrência e rollback sem deixar `autenticacoes`, `movtosbancos` e `movtosbancoseventos` divergentes;
- não repetir `listEventosFechamento` para cada linha apenas para validar o lote; validar e carregar o conjunto uma vez, com consultas agrupadas e sem N+1;
- após salvar, recarregar a aba a partir do banco para refletir descrição, parâmetros, evento e qualquer linha que deixe de atender ao filtro `E/S`;
- manter autorização única para o lote e auditoria suficiente para identificar operador, contexto, linhas antigas/novas e resultado, sem armazenar senha/prova;
- explicar se a escrita deve usar SQL legado com `alterandoevento` ou uma porta/repositório dedicado, e quais colunas do trigger precisam ser observadas.

## Consumidores e limites de impacto

Separe explicitamente os efeitos:

- a aba Eventos e relatórios que fazem `join eventos` passam a exibir a nova descrição/classificação;
- `movtosbancos` e `movtosbancoseventos` podem mudar para tipo `D` integrado, afetando módulos de extrato/controle bancário;
- a totalização do fechamento, que agrupa principalmente por `autenticacoes.tipo` e por valores de recebimentos, não deve mudar apenas por trocar o código de evento; se mudar por efeito de trigger, isso deve ser medido e explicado;
- não há evidência de que a edição da aba altere diretamente contratos/parcelas, `recebimentos` ou o cadastro mestre de eventos; confirmar por consulta dos módulos e registrar como “não afetado” somente com evidência.

## Testes obrigatórios

Além dos testes atuais em SQLite, crie uma matriz de integração PostgreSQL com schema legado real ou fixture equivalente aos triggers:

1. tipo `D`, filial integrada, evento antigo e novo: verificar valor, evento, saldo e parâmetros de `autenticacoes`, retirada no evento antigo e inclusão no novo em ambas as tabelas bancárias;
2. tipo `D` cujo movimento antigo zera: verificar remoção correta e atualização do evento principal;
3. tipo `D` sem integração bancária e tipos `B`, `E`, `F`, `P`, `H`, `T` e `G`: verificar a regra efetiva sem criar reclassificação indevida;
4. código inexistente, código fora de `E/S`, linha cancelada, linha fora do contexto e linha concorrencial: rejeitar sem alteração parcial;
5. falha no trigger ou na segunda linha do lote: rollback de todas as linhas e dos lançamentos bancários;
6. repetição idempotente do mesmo lote: não duplicar valor em `movtosbancos`/`movtosbancoseventos`;
7. consulta pós-gravação: descrição, filtro da aba, totalização, saldo final e relatórios bancários devem apresentar o estado efetivamente persistido.

Os testes SQLite podem continuar cobrindo autorização, contrato HTTP e mapeamento, mas não podem ser apresentados como prova da paridade bancária. O aceite da integração exige PostgreSQL com os triggers habilitados.

## Entregáveis e critérios de aceite

Entregue a especificação formal em `specs/456-caixa-fechamento-evento-bancario/spec.md` ou atualize a especificação equivalente já adotada pelo repositório. Inclua contrato de dados, sequência transacional, matriz de tipos, consultas esperadas, tratamento de erros, autorização, auditoria, observabilidade e testes.

Considere os prompts `02-speckit-prompt.md`, `03-speckit-prompt-correcao-saldo-consultas.md` e `04-speckit-prompt-enter-foco.md` como complementares. Eles cobrem a tela, saldo/consultas e teclado, mas não comprovam o contrato do trigger nem a reclassificação bancária exigida aqui.

Não implemente a correção enquanto a especificação não resolver:

- se a aplicação deve confiar integralmente no trigger existente ou criar uma porta explícita para essa operação;
- quais tipos podem ter evento alterado e quais eventos podem ser escolhidos;
- como testar o efeito bancário em PostgreSQL e como detectar divergência entre o lançamento e o fechamento;
- qual identidade/lock garante que o lote não atualize outra linha ou seja aplicado duas vezes.
