# Prompt para `/speckit.specify` — Cadastro de Inventário

```text
/speckit.specify

Crie uma especificação funcional, técnica e testável para migrar o Cadastro de Inventário do ERP Delphi para o Laravel, no contexto Estoque/Cadastros. Gere somente a especificação e seus artefatos previstos pelo Spec Kit; não implemente código, migration, endpoint, Policy, componente React, job ou SQL de produção nesta etapa.

## Regra fundamental sobre fontes

O levantamento Delphi já foi concluído externamente. Não investigue, procure, solicite, cite ou dependa dos fontes Delphi. Não crie tarefas como “analisar o legado”, “validar no Delphi” ou “comparar com o Delphi”. Use exclusivamente os artefatos abaixo como evidência funcional:

- `modules/estoque/cadastro-inventario/README.md`
- `modules/estoque/cadastro-inventario/pesquisa-interface-fluxo-delphi.md`
- `modules/estoque/cadastro-inventario/pesquisa-sqls-parametros-delphi.md`
- `modules/estoque/cadastro-inventario/pesquisa-autorizacoes-menu.md`
- `modules/estoque/cadastro-inventario/pesquisa-padroes-laravel-prompts.md`
- `modules/estoque/cadastro-inventario/schema/README.md`
- `modules/estoque/cadastro-inventario/schema/cadastro-inventario-schema-manifest.json`
- `modules/estoque/cadastro-inventario/schema/postgresql-authoritative-2026-09-09.json`
- `CONTEXT.md`

Investigue o checkout Laravel vigente somente para localizar nomes e contratos concretos de componentes, rotas, serviços, policies, parâmetros, menu, `acessosmodulos`, grids, modal F9, cancelamento e testes a reutilizar. Se o Laravel divergir do dossiê, registre a divergência e proponha a menor adaptação necessária. Não faça nova entrevista.

## Bloqueio de schema

O snapshot disponível é parcial: várias relações usadas pelos SQLs Delphi não foram encontradas na conexão capturada. Esta é uma dependência explícita. Não invente tabela, coluna, FK, índice, função, sequência ou tipo. Não finalize SQL, migration ou contrato de persistência baseado em nomes não comprovados.

Especifique uma etapa de captura contra a base legada autoritativa e faça a implementação depender dela. A captura deve ser uma ferramenta explícita e versionada, executada fora do runtime de negócio, em transação somente leitura. Não substitua essa etapa por testes `driver`, `hasTable`, `Schema::has*` ou introspecção de schema em runtime.

## Objetivo funcional

Permitir que um Usuário autorizado inclua, pesquise, altere, gere itens, edite lotes, processe e consulte o Cadastro de Inventário com comportamento equivalente ao Delphi, usando os padrões Laravel de cadastro, filtros, grid, exportação, relatório e cancelamento.

O Inventário é um agregado com cabeçalho e Itens de Inventário. A solução deve preservar a identidade do inventário, seus filtros persistidos, sua Filial, datas, Situação, Produtos e lotes. O domínio de estoque continua dono dos saldos e movimentos.

## Sessão de Coleta Mobile

Inclua uma Sessão de Coleta Mobile separada, vinculada a um Inventário em situação A. Ela deve funcionar em celular e tablet, com layout mobile-first e a mesma validade de domínio do Cadastro, sem mudar o Inventário para P e sem editar Movimentos de Estoque.

### Canais de entrada

1. A câmera para bipagem e a Importação de Coleta são canais equivalentes da mesma sessão e devem gerar eventos idempotentes com Usuário, dispositivo, horário, código recebido, quantidade e contexto da sessão.
2. Compatibilizar o formato legado de arquivo `código,quantidade`, separado por vírgula, sem lote. Linhas repetidas do mesmo código somam quantidade antes da aplicação.
3. Resolver o Produto segundo os parâmetros: `PesquisaPadraoProdutoCodigoBarras` define o campo prioritário e `PermitirProdutoAlfanumerico` controla a validade. Aplicar exatamente a mesma regra à câmera, entrada manual e arquivo; não usar fallback silencioso.
4. Produto não encontrado, código inválido ou quantidade inválida gera erro explícito, não cria Item e mantém as demais entradas válidas sob estado visível de pendência/erro.
5. Depois de processado, arquivar o arquivo no servidor com referência à sessão. Reprocessamento deve ser idempotente e nunca somar novamente um evento já aceito.
6. O arquivo não possui lote. Para Produto controlado por Lote, permitir distribuição posterior na edição do Item, exigindo fechamento da soma dos lotes.

### Conectividade e ciclo de vida

1. Ser offline-tolerante: registrar evento local com identificador idempotente, sincronizar automaticamente ao retornar a conexão e mostrar pendências, conflitos e falhas de sincronização.
2. Não finalizar a sessão enquanto houver eventos pendentes ou conflitos e nunca processar o Inventário offline.
3. Iniciar somente para Inventário A; permitir pausar e retomar por Usuário autorizado.
4. Permitir vários Usuários e dispositivos na mesma sessão. Consolidar no servidor com proteção contra duplicidade e mostrar conflitos de concorrência.
5. Finalizar sem pendências bloqueia novas bipagens daquela sessão, mas mantém o Inventário A para conferência. Apenas F8 muda o Inventário para P.

### Leiaute e fallback

1. Priorizar câmera, com entrada manual alternativa; usar controles grandes, feedback de sucesso/erro, cartão do último Produto, quantidade coletada, itens, pendências, conflitos e sincronização.
2. Em tablet, adaptar para duas colunas de câmera/lista quando houver espaço; em celular, usar fluxo vertical sem grid denso, hover ou duplo clique.
3. Se a câmera não existir ou a permissão for negada, informar o motivo, permitir nova tentativa, entrada manual e importação de arquivo. Nunca aceitar evento sem identificação válida.

### Correções e permissões

1. Consulta e Filial seguem o acesso ao Inventário. Iniciar, pausar, retomar, bipar e importar exigem permissão de alteração; finalizar sessão exige permissão própria.
2. Permitir retomada por outro Usuário autorizado, sempre auditando operador e dispositivo.
3. Permitir correção manual de quantidade somente em Inventário A. Exigir motivo para redução/correção e auditar valor anterior, valor novo, Usuário, dispositivo e horário.
4. Para lotes, preservar a regra de soma igual à quantidade do Item.

## Junção administrativa de Inventários

Preservar a operação Delphi “Copiar produtos de outro inventário” como Junção de Inventários, separada da Sessão de Coleta e do F8:

1. Selecionar somente Inventários abertos da mesma Filial.
2. Somar no destino as quantidades de Produtos repetidos e incluir Produtos ausentes.
3. Marcar cada origem como `T` e preencher `transferidopara` com o Inventário destino.
4. Exigir permissão própria, confirmação explícita, concorrência segura e auditoria.
5. Disponibilizar a operação responsivamente em desktop e tablet, mas não no fluxo rápido de bipagem.

## Contrato confirmado

### Identidade e situação

1. Na inclusão, gerar o número do Inventário atomicamente usando o mecanismo autorizado pelo schema. Não reproduzir `MAX(numero)+1`.
2. Permitir pesquisa direta por Enter e pelo modal padrão F9. Depois de carregar um registro, a chave primária fica protegida, conforme o padrão de cadastro.
3. Usar as situações evidenciadas: `A` aberto/editável, `P` processado e `T` transferido.
4. Em A, Filial, datas, filtros, itens e lotes permanecem editáveis conforme validações. Em P/T, cabeçalho e itens ficam somente leitura.
5. A situação deve usar o componente de cadastro existente; preferir radio buttons quando a escolha for mutuamente exclusiva.

### Itens, produtos e lotes

1. Geração por filtros acrescenta somente Produtos ainda ausentes, preserva itens já existentes e evita duplicidade.
2. O grid principal é de consulta/seleção e não permite edição direta de células.
3. Abrir modal para alterar quantidade do item e, quando aplicável, incluir/remover lotes.
4. Para Produto controlado por Lote, a soma das quantidades dos lotes deve fechar com a quantidade do item antes de salvar.
5. Manter filtros, defaults e parâmetros descritos nos dossiês, validando-os no servidor.
6. Os valores de saldo, reserva, lote e movimento devem vir das regras/serviços compartilhados de estoque, sem duplicação no Cadastro de Inventário.

### Processamento F8

1. F8 é uma operação distinta de F6 e do relatório.
2. Exibir o comando somente quando a permissão do cadastro e a situação permitirem, mas validar novamente no servidor.
3. Exigir autorização contextual de Gerente de Estoque. Não introduzir senha ou reautenticação que não esteja demonstrada no contrato legado.
4. Validar data limite, movimentos posteriores, diferenças, consistência de itens/lotes e concorrência.
5. Criar os efeitos `IE+`, `IE-`, `IR-` e `IP-` em uma transação atômica através das regras do domínio de estoque.
6. Em qualquer falha, rollback completo e permanência em A. Só após commit integral mudar para P.
7. Não permitir edição direta dos movimentos resultantes.

### Permissões e auditoria

Separe:

1. visibilidade do menu;
2. acesso ao módulo Cadastro de Inventário;
3. permissões de consultar, incluir, alterar, excluir e gerar itens;
4. autorização contextual de Gerente de Estoque para F8.

Use o catálogo e os padrões reais de `acessosmodulos` do Laravel para o menu de Estoque/Cadastros. Não criar acesso em Caixa → Controle de Recebimentos.

Audite inclusão, alteração, exclusão, geração, edição de lote, tentativa de processamento, autorização, sucesso, falha e cancelamento quando houver infraestrutura correspondente. Registre Usuário, Inventário, Filial, operação, situação anterior/posterior, versão e instante do servidor.

### Concorrência

Salvar e processar devem validar Situação e versão dentro da transação. Se outro Usuário alterou o Inventário, rejeitar como conflito e não sobrescrever silenciosamente os dados. A experiência normal da tela permanece igual quando não há conflito.

## Filtros, parâmetros e SQL

Extraia do dossiê os filtros reais da aba de parâmetros e os defaults. Os parâmetros do sistema identificados incluem, conforme aplicabilidade comprovada: `MascaraQuantidadeGrade`, `UsarGradesProdutos`, `LimitedeDiasParaProcessamentoInventario`, `Inventariar_Produtos_Compostos`, `PesquisaPadraoProdutoCodigoBarras`, `PermitirProdutoAlfanumerico`, `ValordaQuantidade` e `QtCasasDecimaisQuantidade`.

No Laravel, resolver parâmetros pelo serviço tipado/padrão do projeto, compatível com `parametros_valor('', '')` quando esse for o contrato vigente. Não duplicar acesso direto ao banco em controllers ou React. Registrar nome, tipo, default, escopo, fallback e efeito de cada parâmetro.

Use os SQLs catalogados no dossiê como evidência do comportamento, mas reescreva a implementação com bindings e projeções explícitas. A especificação deve:

- exigir consultas mestre set-based para inventário, itens e lotes;
- buscar enriquecimentos em lote com `IN`, `= ANY(array)` ou `unnest`, conforme o tipo da chave;
- proibir N+1, subconsulta por linha e lazy loading imprevisível;
- usar `INNER JOIN` quando a relação e os campos obrigatórios forem comprovadamente `NOT NULL`;
- usar `LEFT JOIN` somente quando a relação opcional estiver comprovada no schema e na semântica;
- agrupar blocos `OR`, validar whitelist de campos/ordenação e usar bindings;
- nunca aceitar SQL, tabela, coluna ou filtro compilado diretamente do navegador;
- não reproduzir concatenação SQL, `MAX()+1`, teste de driver ou `hasTable`/`Schema::has*`.

Inclua testes/telemetria que demonstrem que uma página de itens e seus lotes não executa uma query por linha.

## Consulta F6 e cancelamento

Toda consulta pesada iniciada por F6 deve:

1. validar filtros e Filiais autorizadas;
2. tornar o botão Cancelar visível antes do primeiro `await`;
3. usar o pipeline existente de heavy reports/consultas, `AbortController`, `cancel_url`, `poll_url`, trace/idempotência e estados do Laravel;
4. cancelar também no servidor e interromper a consulta/job no banco quando suportado;
5. descartar respostas obsoletas e não publicar resultado parcial;
6. informar vazio, erro, timeout, cancelado e concluído sem perder o contexto dos filtros.

Esc, Limpar ou uma nova geração devem invalidar resultado e detalhes pendentes conforme o contrato atual, sem fechar a página.

## Relatórios

Todo relatório do Cadastro de Inventário deve ser gerado pelo F6 no Laravel. Preserve conteúdo, filtros, ordenação, agrupamentos, totais e leiaute comprovados no Delphi, mas apresente a saída no mesmo catálogo e leiaute do grid. PDF/Excel/exportação não podem introduzir colunas que não existam no catálogo autorizado. A geração deve ter Cancelar e seguir a mesma infraestrutura de consulta pesada.

## Grid e edição

Use o shell, catálogo de colunas, preferências e exportação padrão do Laravel. Para o grid principal e grids de relatório, especificar:

- colunas, tipos, máscara/formatação, alinhamento, visibilidade e comportamento de cada coluna;
- ordenação estável com whitelist e desempates;
- filtros, paginação, redimensionamento, reordenação, ocultação e restauração de padrão;
- personalização e preferências persistidas por usuário/tela/grid;
- exportação do dataset autorizado, síncrona ou assíncrona conforme volume;
- acessibilidade, estado vazio, carregamento, erro e cancelamento;
- seleção de linha e abertura do modal de item/lote;
- nenhuma edição direta no grid principal.

Os botões devem seguir o padrão de ícones, tooltips, atalhos, habilitação por situação/permissão e confirmação do Laravel. O breadcrumb deve seguir o catálogo vigente de Estoque/Cadastros.

## F9 e campos de cadastro

F9 deve abrir o modal padrão de pesquisa com busca, ordenação, paginação, direção e indicação de coluna ordenada. Para o número do Inventário, manter Enter para busca direta, erro explícito quando inexistente e chave bloqueada após carregamento.

O campo Situação deve seguir o estilo de cadastro existente e não permitir alteração indevida por select livre. Preferir radio buttons para Situação e opções mutuamente exclusivas.

## Schema, limites e dependências

Liste no plano os objetos confirmados e ausentes no snapshot, apontando o manifesto e o hash. Crie uma tarefa bloqueante para a nova captura autoritativa antes de SQL final. Não trate a conexão parcial como prova de que a tabela não existe no sistema legado.

Quando o schema, o menu, uma permissão ou um serviço concreto não estiver comprovado, marcar como dependência/decisão aberta na especificação, sem inventar uma implementação.

## Testes e critérios de aceite

Especifique testes Feature autenticados nos contratos HTTP/Inertia e testes unitários somente para regras puras. Cobrir no mínimo:

- acesso ao menu, permissão do módulo e permissão por operação;
- F9, Enter, chave bloqueada, registro inexistente e estado somente leitura;
- situações A/P/T e matriz de campos editáveis;
- filtros, defaults, parâmetros e geração sem duplicidade;
- edição modal de item/lotes e soma de lotes;
- F8 com autorização, data limite, movimentos posteriores, rollback, efeitos e mudança atômica para P;
- concorrência com conflito de versão;
- auditoria de operações autorizadas, negadas, canceladas e falhas;
- F6 com Cancelar imediato, cancelamento server-side, timeout, erro, polling, resultado vazio e respostas obsoletas;
- relatório F6 e igualdade de catálogo/leiaute com o grid;
- ordenação, filtros, paginação, preferências, personalização e exportação;
- ausência de N+1 e uso set-based com contagem de queries;
- escolha correta de `INNER JOIN`/`LEFT JOIN` conforme schema;
- escopo de Filial autorizado em toda leitura, geração, exportação e processamento;
- bloqueio quando o schema autoritativo ainda estiver incompleto.

## Fora do escopo

- implementar o módulo;
- alterar o Delphi;
- executar `/speckit.specify` nesta etapa;
- inventar ou remover tabelas para compensar o snapshot parcial;
- criar infraestrutura paralela de filas, grids, F9, exportação ou cancelamento;
- editar diretamente Movimentos de Estoque;
- colocar o Cadastro de Inventário no menu Caixa → Controle de Recebimentos;
- pedir ao agente de implementação para reabrir fontes Delphi.

## Saída esperada

Produza uma spec completa e implementável, com requisitos numerados, fluxos, estados, contratos de payload/resposta sem SQL exposto, matriz de permissões, catálogo de colunas, parâmetros, dependências de schema, testes de aceite, riscos e plano de implementação. Mantenha referências para os artefatos deste diretório. Não escreva código nesta etapa.
```
