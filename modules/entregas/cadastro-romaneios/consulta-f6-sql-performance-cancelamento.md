# Contrato da consulta F6 — documentos candidatos ao Romaneio

## Decisão executiva

**DECISÃO NOVA, confirmada em 2026-08-01** — a F6 de inclusão múltipla nasce como consulta síncrona, server-side e realmente cancelável. Ela reutiliza o protocolo Laravel de `useErpGerarRequest` e `PgsqlGerarQueryRunner`; fila `heavy-reports` só será adotada se medições no banco-alvo demonstrarem que a duração excede com frequência o orçamento do gateway.

Esta decisão trata a **Consulta de Documentos Candidatos ao Romaneio**. A localização do Cadastro por número de Romaneio e os lookups unitários possuem endpoints próprios e não compartilham o estado F6.

## Filtros

### Obrigatórios

- emissão inicial e final, inclusivas, com padrão do servidor de hoje menos 15 dias até hoje;
- ao menos uma Filial autorizada efetiva, resolvida no backend;
- tipo pretendido do Romaneio, Normal ou Transferência, quando já conhecido.

Datas inválidas, invertidas ou acima do intervalo máximo configurado são rejeitadas antes de abrir a query. A Filial não é aceita apenas porque veio no request: cruzar com `UserBranchAccessService`.

### Opcionais

- uma ou mais Filiais dentro do escopo autorizado;
- um ou mais Clientes;
- entrega inicial e final, ambas ausentes ou intervalo inclusivo válido;
- “somente NF com itens para entrega”;
- texto/chave NF-e normalizada para localização na grade.

Filtros vazios significam “sem restringir” somente dentro das Filiais autorizadas. Array vazio nunca vira `IN ()`: ou é omitido por contrato opcional, ou produz conjunto vazio quando representa seleção explícita. Usar bindings em todos os casos.

### Elegibilidade

O resultado contém apenas Documentos Fiscais que podem ser vinculados conforme o tipo, Filiais, situação fiscal, duplicidade e invariantes confirmadas do Romaneio. Preservar as regras Delphi de `not exists romaneiosnotas`, itens para entrega e compatibilidade de origem/destino em transferências, mas reler e revalidar os IDs selecionados dentro da transação de gravação; resultado de consulta não é reserva.

A busca por chave NF-e reutiliza `NfeAccessKey`/`NfeAccessKeyInput`. Se a chave válida identificar documento elegível fora da página corrente, o backend pode localizá-lo no mesmo conjunto filtrado; não contorna Filial, período, tipo ou elegibilidade.

## Resultado e grid

Cada linha representa um Documento Fiscal candidato, identificado por `dadosfiscais.numero`, nunca por posição no grid. Expor os campos comprovados: emissão, Cliente, endereço, frete, Filial, série/número/chave, ECF/intervenção/cupom, entrega, volumes, valores e observação, além de seleção e indicadores textuais acessíveis.

- Paginação, ordenação e filtros são server-side; proibir carga integral e limite silencioso.
- `per_page` usa a faixa permitida pelo componente compartilhado.
- Toda ordenação vem de catálogo allow-list e termina em `dadosfiscais.numero` como desempate estável.
- Ordenação desconhecida ou coluna não autorizada é rejeitada, nunca interpolada no SQL.
- Resposta inclui linhas, página, tamanho, total e filtros/sort canônicos necessários ao grid e à exportação.
- Alterar filtros invalida resultado e seleção anterior; seleção em lote envia IDs canônicos e o backend relê todos de forma set-based.

## Desenho SQL set-based

Usar desenho em duas fases para impedir multiplicação de linhas pelas relações 1:N:

1. **Base paginada** — seleciona os IDs elegíveis e o total a partir de `dadosfiscais`, aplicando filtros, `EXISTS`/`NOT EXISTS` e ordenação autorizada.
2. **Enriquecimento da página** — busca todos os IDs da página em uma única operação com `= ANY(?::integer[])` ou bindings equivalentes e agrega volumes/produtos antes do join.

O repository pode combinar as fases dentro do runner, mas não executar query por linha. Totais e agregados usam CTE/subquery pré-agregada ou joins laterais apenas quando comprovadamente melhores por `EXPLAIN (ANALYZE, BUFFERS)` no banco-alvo. PostgreSQL 9.5.25 é o piso de compatibilidade.

Para lotes de IDs, definir limite e chunking set-based quando ultrapassado; chunk não autoriza N+1. O relatório/exportação deve consultar o conjunto diretamente, não percorrer páginas HTTP.

## Política de joins

Conferir `schema/README.md` e o snapshot versionado antes de finalizar qualquer SQL:

- `romaneiosnotas → dadosfiscais`, `dadosfiscais → filiais`, `notas/cupons → dadosfiscais`, produtos e volumes com suas FKs obrigatórias usam `INNER JOIN` quando ausência não integra o contrato;
- endereço, contrato, motivo, autorizador, tabela de frete, transportador e financeiro permanecem `LEFT JOIN` quando anuláveis e apenas enriquecem a linha;
- especializações Nota/Cupom são opcionais entre si: não usar dois `INNER JOIN` simultâneos;
- dados órfãos só permanecem se houver caso funcional explícito e teste; nulabilidade isolada não prova cardinalidade.

Proibir `Schema::has*` e consultas a catálogos no caminho de negócio. Divergência entre snapshot, checkout e ambiente falha explicitamente.

## Cancelamento real

1. A UI define `busy=true` antes do primeiro `await`; o botão **Cancelar** fica disponível imediatamente.
2. Cada geração cria UUID de trace ligado ao Usuário, tela e request.
3. Contagem, base e enriquecimento executam dentro de `PgsqlGerarQueryRunner::run`, na conexão PostgreSQL registrada.
4. Cancelar chama primeiro o endpoint protegido que executa `pg_cancel_backend()`; o abort local não é considerado cancelamento suficiente.
5. O endpoint valida Usuário, screen key e trace, é idempotente e não cancela query de outro usuário/tela.
6. Cancelamento é resultado neutro: mantém o último resultado completo, não exibe erro de negócio e descarta qualquer resposta tardia da geração cancelada.
7. Nova geração cancela ou invalida a anterior antes de assumir o estado da tela; somente o trace corrente pode publicar resultado.
8. `statement_timeout` é configurável e menor que o timeout do gateway. O valor final vem de medição, não é codificado arbitrariamente no prompt.

Testes de aceite devem observar no PostgreSQL que a query deixou de executar, não apenas `Axios ERR_CANCELED`.

## Exportação

Reusar `ErpPreferenceDataGrid`, `GridExportOrchestrator` e `ExportContextStore`. O contexto congela filtros, sort, Filiais, catálogo/colunas e usuário, sendo reautorizado no download/job.

- Até o limite compartilhado atual de 5.000 registros, exportação pode ser síncrona.
- Acima dele, usar o modo assíncrono já fornecido pelo orquestrador, sem mudar a F6 interativa para fila.
- Exportar o conjunto completo filtrado, não apenas a página visível.
- Colunas ocultas por autorização nunca reaparecem por preferência salva.

## Medição e critérios

Antes da implementação, repetir/validar o snapshot no ambiente-alvo e capturar `EXPLAIN (ANALYZE, BUFFERS)` para filtros seletivos, padrão de 15 dias e pior intervalo permitido. Registrar cardinalidade, duração, buffers, plano, timeout e índice utilizado.

Aceite:

- nenhuma consulta por linha;
- uma linha por Documento Fiscal;
- paginação e total consistentes sob ordenação determinística;
- mesma semântica entre grid e exportação;
- Cancelar visível imediatamente e query PostgreSQL encerrada;
- resposta tardia não substitui resultado novo;
- SQL compatível com PostgreSQL 9.5.25;
- ausência de introspecção runtime e joins coerentes com nulabilidade/cardinalidade.

## Gatilho para fila pesada

Migrar a F6 para `useErpHeavyGerarRequest` somente com evidência de que, após SQL/indexação compatíveis e intervalo limitado, a consulta ainda excede frequentemente o orçamento HTTP. Nesse caso, preservar o mesmo contrato de filtros/resultados e cancelar tanto o job quanto a query PostgreSQL do worker. A decisão exige nova medição; não é fallback automático por quantidade de linhas.

