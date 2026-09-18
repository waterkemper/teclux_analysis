# Cadastro de Inventário — dossiê de migração Delphi para Laravel

Status: implementação revisada; há correções residuais descritas em [05-speckit-prompt-correcao-residual-pos-481.md](05-speckit-prompt-correcao-residual-pos-481.md).

## Objetivo

Este diretório reúne a evidência capturada do Cadastro de Inventário Delphi, o contrato funcional confirmado em conversa e o prompt principal para `/speckit.specify`. O destino é uma especificação implementável no Laravel, preservando o comportamento funcional confirmado e corrigindo riscos técnicos do legado sem reabrir os fontes Delphi.

## Fontes autoritativas deste handoff

- [pesquisa de interface e fluxo Delphi](pesquisa-interface-fluxo-delphi.md): telas, abas, filtros, estados, ações, colunas, atalhos e regras de edição.
- [pesquisa de SQLs e parâmetros](pesquisa-sqls-parametros-delphi.md): datasets, SQLs, macros, funções, parâmetros e riscos de tradução.
- [pesquisa de autorizações e menu](pesquisa-autorizacoes-menu.md): processamento, grants, acessos e lacunas de menu.
- [pesquisa de padrões Laravel](pesquisa-padroes-laravel-prompts.md): shell, F6 cancelável, F9, grids, exportação, relatórios e guardrails.
- [schema](schema/README.md): método de captura, manifesto, snapshot e limitações da conexão disponível.
- [contrato de domínio](../../../CONTEXT.md): vocabulário transversal e decisões confirmadas do inventário.
- [prompt principal](01-speckit-prompt-cadastro-inventario.md): briefing autocontido para posterior execução de `/speckit.specify`.
- [prompt corretivo](02-speckit-prompt-correcao-implementacao.md): revisão da implementação atual e requisitos de correção/aceite.
- [prompt residual](03-speckit-prompt-correcao-residual-pos-479.md): pendências encontradas após a implementação da spec 479.
- [prompt residual pós-480](04-speckit-prompt-correcao-residual-pos-480.md): pendências comprovadas na revisão do commit `c6a1bea66`.
- [prompt residual pós-481](05-speckit-prompt-correcao-residual-pos-481.md): pendências comprovadas na revisão do commit `3179d6c81`.

O prompt é a fonte de requisitos para a próxima etapa. Os arquivos de pesquisa são a trilha de evidências, não instruções para reabrir o Delphi.

## Contrato funcional confirmado

### Agregado e situações

O Inventário é um cadastro agregado com cabeçalho e Itens de Inventário. O número é gerado na inclusão, pesquisável por Enter/F9 e bloqueado depois que o registro é carregado. A estratégia Laravel deve ser atômica e compatível com o schema autoritativo; não reproduzir `MAX(numero)+1`.

As situações são:

| Situação | Regra |
| --- | --- |
| A — aberto | Filial, datas, filtros, itens e lotes editáveis conforme validações; permite geração e processamento autorizado. |
| P — processado | Cadastro e itens somente leitura; efeitos de estoque já materializados. |
| T — transferido | Cadastro e itens somente leitura, conforme evidência Delphi. |

A geração acrescenta Produtos ainda ausentes conforme os filtros, preserva itens existentes e não duplica linhas. A edição de item/lote ocorre em modal; o grid principal é consulta/seleção, não editor de células. Para Produto controlado por Lote, a soma dos lotes deve fechar com a quantidade do item.

### Operações e atalhos

| Operação | Atalho/padrão | Contrato |
| --- | --- | --- |
| Consulta do cadastro | Enter/F9 | Modal padrão de pesquisa; a chave carregada fica protegida. |
| Consulta/geração de dados | F6 | Consulta cancelável desde o início; botão Cancelar interrompe cliente, servidor e consulta/job quando suportado. |
| Processamento | F8 | Operação separada de consulta e relatório; autorização contextual de Gerente de Estoque; transação atômica. |
| Relatório | F6 | Preserva conteúdo e leiaute Delphi, mas usa F6 no Laravel e apresenta o mesmo catálogo/leiaute do grid. |
| Edição de item/lote | modal | Quantidade e lotes editáveis somente em A, com validações de domínio. |

F7 não é o gatilho de relatório no Laravel. Os botões devem usar ícones, tooltips e atalhos do padrão ERP existente.

### Processamento e estoque

O F8 valida situação aberta, data limite, movimentos posteriores, diferenças e autorização contextual. Em uma unidade atômica, materializa os efeitos Delphi `IE+`, `IE-`, `IR-` e `IP-`. Falha ou inconsistência mantém A; sucesso completo altera para P. Não editar movimentos diretamente e não publicar P antes do commit.

O Inventário guarda a conferência e a intenção de processamento. Saldos, reservas, lotes e Movimentos de Estoque pertencem às regras/serviços compartilhados do domínio de estoque. A solução não deve duplicar essas regras nem transformar o cadastro em dono do saldo.

## Sessão de Coleta Mobile

O handoff também cobre uma Sessão de Coleta Mobile separada, vinculada a um Inventário aberto. Ela é uma nova experiência operacional para celular e tablet, não uma alteração da situação do Inventário e não um substituto do F8.

### Canais e identificação

- câmera e Importação de Coleta alimentam a mesma sessão e os mesmos eventos idempotentes;
- o arquivo mantém compatibilidade com o formato legado `código,quantidade`, sem lote;
- linhas repetidas são somadas antes da aplicação nos itens;
- `PesquisaPadraoProdutoCodigoBarras` define o campo prioritário e `PermitirProdutoAlfanumerico` valida o código;
- produto não encontrado gera erro explícito e não cria item silenciosamente;
- arquivo processado é arquivado no servidor; reprocessamento exige idempotência;
- produtos controlados por lote são distribuídos depois na edição do item, com fechamento da soma dos lotes.

### Conectividade, ciclo e concorrência

A sessão é offline-tolerante: eventos locais possuem identificador idempotente, sincronizam quando a conexão retorna e exibem pendências/conflitos. Não se pode finalizar com pendência/conflito nem processar offline. Vários operadores/dispositivos podem contribuir na mesma sessão; o servidor consolida eventos e expõe conflitos.

A sessão inicia apenas em Inventário A, pode ser pausada e retomada por usuário autorizado e, ao finalizar sem pendências, bloqueia novas bipagens sem mudar o Inventário para P. Somente F8 processa o Inventário.

### Layout e permissões

O layout é mobile-first, com câmera como ação principal, entrada manual alternativa, controles grandes, último Produto, progresso, pendências e conflitos. No tablet, câmera e lista podem ocupar duas colunas. Câmera negada ou indisponível não bloqueia a sessão: entrada manual e arquivo continuam disponíveis.

Consulta e Filial seguem o acesso ao Inventário. Iniciar, pausar, retomar, bipar e importar exigem alteração; finalizar exige permissão própria; F8 continua exigindo Gerente de Estoque. Correções manuais exigem Inventário A, motivo quando reduzem/corrigem, e auditoria completa.

### Junção de inventários

Foi confirmada no Delphi a operação “Copiar produtos de outro inventário”, que funciona como junção administrativa: seleciona Inventários A da mesma Filial, soma produtos repetidos, inclui produtos ausentes e marca as origens como T apontando para o destino. Ela fica disponível de forma responsiva em desktop/tablet, com permissão própria e confirmação, mas fora do fluxo rápido de bipagem.

### Autorizações, auditoria e concorrência

Permissões do cadastro controlam consulta, inclusão, alteração, exclusão e geração de itens. O processamento exige autorização contextual de Gerente de Estoque. Não foi autorizado introduzir senha ou reautenticação nova onde o Delphi não demonstra essa exigência. A decisão de processamento e as alterações devem ser auditáveis.

Salvar e processar devem revalidar situação e versão dentro da transação. Se outro usuário alterou o registro, rejeitar como conflito e não sobrescrever silenciosamente.

## Regras Laravel obrigatórias

- Usar `AppLayout`, breadcrumb do catálogo vigente, `ErpCadastroShell`, barra de operações e componentes ERP existentes.
- Usar o modal padrão F9 e o contrato de chave primária do cadastro, não uma pesquisa ad hoc.
- Preferir radio buttons para estados e opções mutuamente exclusivas; usar select apenas quando a lista for extensa ou não exclusiva.
- Usar o `ErpGridShell` e seus catálogos de colunas, preferências, ordenação, personalização e exportação. O resultado do relatório deve ter o mesmo catálogo e leiaute do grid.
- F6 deve mostrar Cancelar antes da primeira operação assíncrona. O cancelamento deve alcançar o servidor e interromper a consulta/job no banco quando a infraestrutura suportar; abortar somente o navegador é insuficiente. Não publicar resultado parcial.
- Consultas devem ser set-based, com binds e whitelist. Enriquecimentos relacionados devem usar `IN`, `= ANY(array)` ou `unnest` conforme o tipo, nunca uma query por linha.
- Comprovar nulabilidade, FK, cardinalidade e semântica antes de escolher join. Relação obrigatória com campos `NOT NULL` deve ser `INNER JOIN`; `LEFT JOIN` somente para relação opcional comprovada.
- Não concatenar SQL, aceitar fragments SQL do navegador, testar driver, testar `hasTable`/`Schema::has*` ou introspectar schema em runtime.
- Não inventar tabelas, colunas, FKs ou funções ausentes do snapshot. O nome e o SQL final ficam bloqueados até nova captura da base legada autoritativa.
- Não pedir ao agente futuro para abrir ou verificar diretamente os fontes Delphi; usar apenas os artefatos deste diretório.

## Schema e limitações conhecidas

O snapshot `postgresql-authoritative-2026-09-09.json` foi capturado em transação somente leitura e possui hash registrado no manifesto. A conexão disponível encontrou apenas parte das relações candidatas. As relações ausentes estão listadas em [schema/README.md](schema/README.md) e são um gate de especificação SQL, não autorização para remover ou inventar objetos.

O prompt deve exigir uma nova captura contra a base legada autoritativa antes de fechar SQL, migrations ou contratos concretos de persistência. Enquanto isso, pode especificar comportamento, interfaces e critérios de aceite usando os nomes já evidenciados, marcando dependências como bloqueadas.

## Menu e acessos

O menu deve ser resolvido pelo catálogo Laravel e pelos padrões de `acessosmodulos` existentes para o Cadastro de Inventário, sob o contexto Estoque/Cadastros. Não usar o menu Caixa → Controle de Recebimentos: ele não pertence a este escopo. O prompt deve exigir matriz separada para visibilidade do menu, permissão do módulo, operações do cadastro e autorização contextual de processamento.

## Prompt de especificação

Use [01-speckit-prompt-cadastro-inventario.md](01-speckit-prompt-cadastro-inventario.md) como entrada única de `/speckit.specify`. Ele manda consultar apenas o Laravel atual e os artefatos deste diretório, não faz nova entrevista e não inclui implementação nesta etapa.

## Prompt corretivo mais recente

- [revisao pos-inventario 11](12-speckit-prompt-correcao-pos-inventario-11.md): correcoes residuais de movimentacao por posicao, concorrencia de lotes, filial/datas, saldo composto, exclusao negativa e testes proibidos.
- [paridade final de lote e testes da operacao persistida](13-speckit-prompt-correcao-pos-inventario-12.md): revisao do commit 9ee3eb625, com persistencia por lote no F8, DTO completo, trigger e testes sem introspeccao de fonte.
- [revisao pos-inventario 13](14-speckit-prompt-correcao-pos-inventario-13.md): correcao de financeiro por lote, fotografia compartilhada do F6, teste de operacao do detalhe e tipagem.
- [residuais e foco na coleta mobile](15-speckit-prompt-correcao-residuais-e-foco-mobile.md): flags e identidade por lote, concorrencia de sessoes, camera, bipagem repetida, offline, TXT e layout celular/tablet.
- [revisao pos-datas, grid e painel de negativos](11-speckit-prompt-correcao-pos-datas-grid.md): revisao do commit 1c53c7150, com correcoes residuais de formulas F6, separacao entre projecao/concorrencia/negativo, painel e acoes assincronas.

- [revisão pós-implementação da prévia e SQL](09-speckit-prompt-correcao-pos-revisao-previa-sql.md): falhas encontradas no commit `051fb5e36` em UI, cálculo por posição/lote, persistência, invariantes F8, identidade da prévia e teste proibido de driver.
- [datas do processamento e paridade visual do grid](10-speckit-prompt-correcao-datas-e-grid.md): revisão do commit `127437dd4`, com correções para `data`, `processamento`, cortes temporais, data dos movimentos e cores/negrito do grid Delphi.

- [simulação e paridade SQL do processamento](08-speckit-prompt-correcao-simulacao-e-paridade-sql-processamento.md): prévia sem escrita, plano comum ao F8, movimentos posteriores, saldos, lotes, custos, financeiro e orçamento de queries.

- [paridade do grid, importação TXT, impressão e modal de itens](06-speckit-prompt-correcao-paridade-grid-importacao-impressao.md): revisão do commit `b8d466ea7`, com as lacunas de UI e fluxo ainda comprovadas.
- [inclusão rápida de produtos e coleta mobile](07-speckit-prompt-correcao-inclusao-rapida-e-coleta-mobile.md): sequência sugerida, Enter com gravação/soma e revisão operacional da câmera, bipagem, sessão e fila offline.

## Fora deste handoff

Não implementar migration, endpoint, Policy, componente React, job, SQL de produção ou alteração Delphi. Não executar `/speckit.specify`.
