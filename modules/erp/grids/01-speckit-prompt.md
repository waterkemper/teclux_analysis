# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para evoluir, no Laravel (tecLUX Cloud), a infraestrutura compartilhada dos grids ERP baseados em ErpPreferenceDataGrid: tornar o redimensionamento de colunas fluido, permitir Títulos Personalizados por Usuário no grid e no Excel, compartilhar configurações por arquivo e oferecer aplicação administrativa atômica da configuração de um grid para todos os Usuários existentes.

Não implemente nesta etapa. Este esforço é 100% Laravel-nativo e não envolve investigação Delphi. Inspecione o checkout Laravel antes de especificar arquivos, confirme nomes e comportamentos atuais e cite evidências concretas. Quando o código contrariar uma hipótese deste prompt, classifique a descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE, mas preserve as decisões obrigatórias abaixo. Não invente um segundo framework de grids, uma persistência paralela ou lógica específica em cada tela.

Use rigorosamente a linguagem do CONTEXT.md: Catálogo de Grid é a definição autorizada das colunas; Preferência de Grid é apresentação durável por Usuário; Título Personalizado é override de apresentação por columnId; Arquivo de Configuração de Grid é fotografia portátil sem identidade de Usuário; Autorização e Autorizador não são sinônimos de Permissão ou iniciador.

## Limite desta entrega

A especificação cobre exclusivamente ErpPreferenceDataGrid e seus consumidores atuais. A entrega termina quando estiverem especificados:

- estado de largura efêmero e local durante resize, sem promover cada movimento ao shell de preferências;
- um único commit semântico final e, quando houver diferença, no máximo um PUT por gesto;
- autoajuste por duplo clique funcionando nos grids ERP;
- columnTitles opcional e esparso por columnId, persistido por Usuário + tela + grid efetivo;
- Campos da Grade em tabela compacta, com visibilidade, Título Personalizado, referência ao padrão, restauração isolada e rascunho Confirmar/Cancelar;
- Título Personalizado no cabeçalho visual e em todas as modalidades atuais de Excel;
- Exportar configurações e Importar configurações no menu de contexto;
- Aplicar configuração para todos… somente para Administrador, com prévia, reautenticação, atomicidade, Auditoria e recuperação operacional;
- compatibilidade com preferências antigas e com os consumidores atuais sem adoção tela por tela;
- testes, observabilidade, documentação e rollout progressivo.

Não migre tabelas manuais, grids bespoke ou componentes que não consumam ErpPreferenceDataGrid.

## Investigação Laravel obrigatória

Antes de desenhar a solução, inspecione e produza uma matriz estado atual × lacuna × mudança proposta para:

- resources/js/Components/erp/data-grid/DataGrid.tsx, ErpPreferenceDataGrid.tsx, ErpGridShell.tsx, ErpGridColumnPicker.tsx, useErpGridPreferences.ts, useErpGridLayout.ts, erpGridTableLayout.ts e hooks de resize/exportação;
- tipos e catálogos em resources/js/Components/erp/data-grid/catalog/ e catalogs/;
- GridPreferencesController, SaveGridPreferencesRequest, GridPreferencesService, GridPreferencesMerge, GridColumnCatalog, registro de catálogos e UserScreenPreferencesRepository;
- tabela user_screen_preferences, seu contrato de concorrência/revisão e merge por seção;
- GridClientExportService, GridExportOrchestrator, ErpGridExportDatasetService, ExportGridDatasetJob, SimpleXlsxStreamWriter e todos os serviços/datasets registrados de Excel;
- SensitiveOperationAuthController, SensitiveOperationAuthService, SensitiveOperationCredentialValidator, SensitiveOperationProofService, catálogo/configuração de operações sensíveis e Auditoria correspondente;
- Usuario, UsuarioAuth, flag administrador, atividade/bloqueio e todos os registros de usuarios, inclusive sem usuarios_auth;
- padrões atuais de DB::transaction, locks, Auditoria imutável, feature flags, logs/métricas e retenção;
- testes Vitest/PHPUnit existentes e configuração real de npm test, composer test, npm run build e Pint;
- todos os consumidores atuais encontrados no checkout, registrando contagem e divergências em relação ao inventário de 34 instâncias em 30 arquivos.

Não assuma que a trava é causada por PUT por pixel. Prove novamente o caminho do evento ao render e à persistência no checkout alvo.

## Evidências Laravel já confirmadas

- DataGrid usa TanStack com columnResizeMode onChange.
- Hoje cada movimento cria novo ErpGridResolvedLayout, chama o caminho do shell e invalida GridWithLayout/DataGrid; tableColumns depende do objeto erpLayout inteiro, embora ordem dependa apenas de columnOrder.
- useErpGridPreferences já possui debounce de 1 segundo, deduplicação e serialização. Em condições normais não há PUT por pixel; o gargalo confirmado é promover largura efêmera ao nível global e recompor React/TanStack por movimento.
- O fim do resize força flush. O comentário atual sobre debounce e o comportamento real estão desalinhados.
- O autoajuste anunciado por duplo clique ignora atualmente grids com erpLayout.
- O inventário encontrou 34 instâncias em 30 TSX: readonly, editáveis, múltiplos grids, exportação local/token e quatro usos de forceVisibleColumnIds.
- GridPreferencesService saneia e faz read/merge/write do payload por Usuário + screen_key; preferencesGridId isola variantes como Curva ABC.
- SimpleXlsxStreamWriter já escreve cabeçalhos como células string no XLSX nativo e no fallback XML.
- O Laravel já possui módulo de operação sensível com validação de hash, atividade, bloqueio, perfil, rate limit, prova e Auditoria.

## Decisões obrigatórias

### 1. Seam do resize

- DataGrid é dono da largura efêmera. Manter onChange para resposta visual.
- Movimento atualiza apenas estado local de columnSizing: não chama setLayoutState do shell, não agenda persistência e não recria o layout global.
- Ao iniciar, fotografar larguras persistíveis. Ao terminar, aplicar minWidth/maxWidth, comparar e emitir uma fotografia final apenas se houver mudança.
- Props externas não sobrescrevem o draft enquanto há gesto; sincronizar após picker, importação, restauração ou catálogo quando nenhum resize estiver ativo.
- tableColumns depende de columnOrder, não do erpLayout inteiro.
- Um gesto produz no máximo um commit e um PUT. Gesto sem diff produz zero PUT.
- Nunca manter dois PUTs simultâneos por instância. Coalescer fotografia pendente por latest wins; resposta antiga nunca reverte layout novo.
- Falha mantém layout local e dirty/pending, mostra aviso discreto e tenta novamente apenas na próxima ação semântica ou saída.
- Inertia/unmount usa flush normal; pagehide usa keepalive best-effort. Não usar localStorage ou IndexedDB.
- Reordenação, picker, importação, restauração e autoajuste são commits discretos. Duplo clique calcula conteúdo, respeita limites e gera um commit.
- forceVisibleColumnIds permanece temporário e nunca é persistido.

### 2. Títulos e schema

GridPreferenceSection aceita:

    columnTitles?: Record<string, string>

- O mapa é opcional, esparso e contém apenas overrides diferentes do título padrão atual.
- Backend é autoritativo; frontend espelha: aceitar string, trim, quebra de linha para espaço, remover controles, máximo 120 caracteres Unicode, texto simples.
- Vazio, espaços ou valor igual ao padrão removem o override. Duplicados são permitidos.
- Colunas técnicas/fixas não aceitam título e nem aparecem no picker.
- Máximo de 80 IDs; IDs devem seguir o formato aceito e existir no catálogo autorizado.
- Preferência antiga sem columnTitles continua válida; não incrementar em massa schemaVersion.
- Coluna nova recebe defaults; removida/desautorizada é descartada; columnId é imutável.
- Mudança futura do título padrão afeta quem não possui override; override existente sobrevive.
- save, importação e aplicação em massa exigem catálogo backend específico da variante; proibir fallback permissivo sem catálogo.
- Igualdade e deduplicação incluem columnTitles.

### 3. Campos da Grade

- Um modal em tabela compacta; por linha: Visível, identificação, Título exibido e Restaurar.
- Mostrar título efetivo e Padrão: título do catálogo. Coluna oculta continua renomeável.
- Busca por padrão, personalizado e columnId, sem caixa/acentos, preservando linhas filtradas. Vazio: Nenhuma coluna encontrada.
- Abrir cria rascunho isolado. Nenhuma alteração persiste antes de Confirmar.
- Restaurar por linha remove somente aquele título. Restaurar padrão redefine visibilidade, ordem, larguras e títulos no rascunho.
- Cancelar, backdrop e Escape descartam tudo. Confirmar normaliza e grava uma vez; fecha só no sucesso.
- Mostrar diff, desabilitar Confirmar sem diferença válida, maxlength 120 e contador próximo ao limite.
- Focus trap, foco inicial na busca, labels/aria-live e retorno de foco ao acionador.

### 4. Excel

- Títulos alteram somente o texto dos cabeçalhos. Não alteram colunas exportáveis, autorização, ordem do catálogo/serviço, dataset, filtros ou formatação. Visibilidade/ordem visual não controlam a planilha.
- Cliente nunca envia títulos. Backend resolve Usuário autenticado, tela, grid efetivo/variante, catálogo, autorização e Preferência persistida.
- Criar módulo profundo compartilhado para resolver cabeçalhos; não repetir merge em cada exportador.
- Datasets expõem columnIds estáveis alinhados às linhas; composição final ocorre centralmente.
- Local/síncrona fotografa títulos no início da requisição. Job/token captura fotografia backend saneada no início e ela não muda durante o job.
- Preferência ausente/corrompida/indisponível usa padrão e gera warning, sem falhar exportação.
- Writer mantém célula texto literal. Cobrir =, +, -, @ e controles; se outro writer não garantir string, prefixar apóstrofo somente no XLSX.

### 5. Arquivo de Configuração de Grid

Adicionar Exportar configurações e Importar configurações ao menu. Envelope versão 1:

    {
      format: teclux.erp-grid-preferences,
      formatVersion: 1,
      gridId: grid-id-efetivo,
      gridSchemaVersion: 1,
      layout: {
        columnVisibility: {},
        columnOrder: [],
        columnSizing: {},
        columnTitles: {}
      }
    }

- gridId é preferencesGridId efetivo nas variantes.
- Nome teclux-grid-{gridId-saneado}.json; UTF-8 sem BOM, dois espaços, newline final. Importar UTF-8 com/sem BOM.
- Máximo 256 KB antes do parse; seletor .json, sem confiar em extensão/MIME.
- Não incluir screen_key, Usuário, filtros, dados, instante ou informação sensível.
- Exportar fotografia persistida completa das colunas configuráveis/autorizadas: ordem, visibilidade, largura efetiva e títulos esparsos. Aguardar save pendente; abortar se falhar.
- Aceitar apenas format conhecido e formatVersion 1; recusar versão desconhecida, grid diferente, JSON/envelope/tipos inválidos. Ignorar campos extras na v1.
- Backend prepara prévia sem persistência, resolve catálogo/autorização, descarta IDs desconhecidos/técnicos/desautorizados e devolve avisos/revisão.
- Ordem duplicada preserva primeira ocorrência. Rascunho começa nos defaults, sobrepõe válidos e anexa colunas ausentes na ordem do catálogo.
- Picker edita visibilidade/título; ordem/largura aparecem na prévia/resumo. Cancelar restaura tudo.
- Banner mostra arquivo, grid e contagens, sem ecoar conteúdo malicioso. Nada aproveitável desabilita Confirmar.
- Confirmar substitui apenas a seção atual usando revisão otimista; conflito exige nova prévia.
- Use estas mensagens:
  - O arquivo excede o limite de 256 KB.
  - Selecione um arquivo JSON de configurações.
  - Não foi possível ler o arquivo de configurações.
  - O arquivo selecionado não é uma configuração de grid válida.
  - Esta versão do arquivo de configurações não é compatível com o sistema.
  - Esta configuração pertence a outro grid e não pode ser importada aqui.
  - O arquivo contém uma estrutura de configurações inválida.
  - Configuração carregada com ajustes. Revise antes de confirmar.
  - As configurações deste grid foram alteradas em outra sessão. Reabra a importação para revisar a versão atual.
  - Configurações do grid importadas com sucesso.
  - Não foi possível exportar as configurações deste grid. Tente novamente.
  - Não foi possível salvar as alterações antes da exportação. Tente novamente.
- Motivos técnicos e correlation id ficam em log. Download bem-sucedido inicia sem toast; desabilitar operações duplicadas.

### 6. Aplicação administrativa

- Item Aplicar configuração para todos… em seção administrativa separada do menu; renderizar só para Administrador e repetir autorização no backend.
- Diálogo próprio mostra tela, grid/variante, fonte, abrangidos, alterados e idênticos, sobrescrita e ausência de herança futura.
- Fonte é preferência persistida do iniciador; aguardar save e vincular prévia à revisão/hash.
- População: todos os registros de usuarios existentes, ativos/inativos, com/sem usuarios_auth, incluindo iniciador.
- Mudança da fonte ou população invalida prévia sem efeitos.
- Solicitar usuário e senha de qualquer Administrador ativo/desbloqueado/autenticável; iniciador e Autorizador podem coincidir, mas sempre redigitar.
- Reutilizar operação sensível dedicada; prova única vinculada a todo contexto, sem reutilização.
- Exigir checkbox de ciência; não exigir frase adicional. Limpar senha e prova após tentativa.
- Sanear por destinatário: apenas colunas autorizadas; ausentes recebem defaults.
- Módulo profundo com duas operações públicas: preparar prévia e confirmar com identidade opaca + prova.
- Execução síncrona em única transação; batches apenas para memória. Locks serializam concorrência. Falha de destinatário ou Auditoria faz rollback total.
- Merge substitui somente a seção tela + grid efetivo, preservando todas as outras.
- Auditoria de sucesso na transação separa iniciador/Autorizador, tela/grid, hash/versão, contagens, destinatários, data e request id; nunca senha ou JSON completo.
- Criar fotografia técnica recuperável das seções anteriores, separada da Auditoria, acesso restrito, retenção de 30 dias e restauração manual atômica/auditada.
- Usuários futuros usam defaults, sem default global.
- Falha de credencial: Não foi possível autorizar a operação. Verifique as credenciais e se o usuário informado é um Administrador ativo.
- Sucesso: Configuração aplicada para {abrangidos} usuários: {alterados} preferências alteradas e {identicos} já estavam idênticas.
- Fonte/população mudou: A configuração ou a quantidade de usuários mudou. Revise e confirme novamente.
- Falha transacional: Não foi possível aplicar a configuração. Nenhuma preferência foi alterada.
- Em conflito/falha, manter diálogo e dados não sensíveis, limpar senha e invalidar prova; em sucesso, fechar e devolver foco.

## Critérios de aceite

- [ ] Muitos movimentos causam zero request durante o gesto, zero rerender do shell por movimento e no máximo um PUT final.
- [ ] Perfil de produção com 1.000 linhas e arraste de 5 segundos não mostra long task acima de 50 ms causada pelas preferências nem atraso visual.
- [ ] Concorrência latest wins, falha/dirty, retry sem loop, pagehide e autoajuste funcionam.
- [ ] Preferências legadas carregam sem migração em massa e isolamento Usuário+tela+grid+variante permanece.
- [ ] Títulos válidos, vazios, longos, duplicados, técnicos e desautorizados seguem o contrato no grid e no Excel.
- [ ] Picker confirma uma vez e Cancelar/Restaurar não persistem prematuramente.
- [ ] Excel local, síncrono e assíncrono usa fotografia backend e texto literal sem alterar dataset.
- [ ] Arquivo realiza round trip seguro, recusa estrutura/versão/grid inválidos, saneia evolução e nunca contém identidade/dados.
- [ ] Importação só persiste após confirmação revisionada.
- [ ] Aplicação administrativa exige Administrador + Autorizador, afeta todos os Usuários existentes, preserva outras seções e é tudo-ou-nada.
- [ ] Auditoria e fotografia de recuperação são atômicas; recuperação funciona dentro de 30 dias.
- [ ] Filtros, paginação, seleção, edição, ordenação de dados, forceVisibleColumnIds e colunas técnicas não regridem.
- [ ] Consumidores não recebem lógica/callbacks novos desnecessários.

## Matriz mínima de testes

Obrigatórios: npm test, composer test, npm run build, vendor/bin/pint --test nos PHP alterados, perfil manual de produção e smoke.

Vitest:

- layout/schema legado, títulos, defaults, variantes, igualdade e deduplicação;
- resize local, contagem de renders/requests, diff, autoajuste, latest wins, falha/retry/pagehide;
- picker completo, teclado/foco e nenhuma persistência de rascunho;
- envelope/prévia de intercâmbio;
- menu/diálogo administrativo e integração do wrapper sem novos callbacks.

PHPUnit:

- saneamento/merge/catálogos/intercâmbio/reconciliação;
- isolamento por Usuário/tela/grid/variante;
- Excel nas três modalidades, fotografia imutável e célula string;
- endpoints de exportar, prévia/importar, limites, conflitos e autorização negativa;
- operação sensível, credenciais/atividade/bloqueio, prova única e rate limit;
- massa: todos os Usuários, contagens, merge restrito, locks, concorrência, rollback e Auditoria;
- fotografia de recuperação, expiração de 30 dias e restauração atômica.

Testes de contrato enumeram todos os Catálogos e datasets Excel registrados; não fixe teste textual no número 34.

Smoke:

- ConsultaEstoquesDadosGrid;
- Vendas/Orcamentos/components/ProdutosGrid;
- Cadastros/Users/UsersTabs;
- ResultadosConsultaOrcamentos;
- Curva ABC com preferencesGridId;
- um consumidor real de exportação local identificado pelo caminho na investigação.

## Rollout, observabilidade e documentação

1. Backend compatível sem ações expostas.
2. Resize/títulos/intercâmbio para grupo interno de Administradores por flag temporária.
3. Liberação geral; flag administrativa separada e habilitada por último.

Avançar após gates/smoke, 2 dias úteis internos estáveis, erros abaixo de 1% sem piora da linha de base e nenhuma gravação extra por resize; esperar mais 5 dias úteis estáveis antes da ação em massa. Remover flags após estabilização.

Instrumentar gravações por tipo de commit, falhas/retries/pagehide, export/import, rejeições, conflitos, massa/rollback e recuperação, sem títulos, senhas ou layout JSON. Documentar contrato JSON, guia do Usuário, guia administrativo e runbook de flags, rollback e recuperação.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- tragam matriz de evidência atual × lacuna × mudança com arquivos reais;
- definam interfaces dos módulos profundos e contratos frontend/backend sem impor nomes antes da inspeção;
- detalhem payloads, endpoints, revisão, transações, locks, Auditoria, recuperação e flags;
- listem migrations apenas para estruturas Laravel realmente novas; nunca recriem tabelas legadas existentes;
- identifiquem cada consumidor que realmente precise alteração e justifiquem; prefiram mudança compartilhada;
- incluam critérios de aceite, testes, smoke, observabilidade, rollout e rollback;
- registrem DÚVIDA/BLOQUEIO quando o checkout não sustentar uma decisão de implementação;
- não implementem código durante /speckit.specify e não investiguem Delphi.

## Fora de escopo

- implementar durante /speckit.specify;
- grids bespoke, tabelas manuais e qualquer consumidor fora de ErpPreferenceDataGrid;
- alterar datasets, filtros, paginação, seleção, edição ou regras de negócio das telas;
- fazer ordem/visibilidade visual controlar a seleção/ordem do Excel;
- permitir HTML/Markdown em títulos ou confiar em identidade enviada pelo cliente;
- sincronização automática entre Usuários;
- default global ou herança para Usuários futuros;
- importar múltiplos grids no mesmo arquivo;
- job assíncrono para aplicação em massa;
- persistência paralela em localStorage/IndexedDB;
- manter flags ou dois fluxos de preferência permanentemente;
- investigar ou alterar Delphi.
```
