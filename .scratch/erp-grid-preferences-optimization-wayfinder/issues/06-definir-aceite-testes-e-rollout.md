# Definir critérios de aceite, testes e rollout transversal

Type: grilling
Status: resolved
Blocked by: 03, 04, 05, 08, 09

## Question

Qual matriz mínima de testes unitários, componentes e Feature comprova compatibilidade de preferências antigas, fluidez e limite de uma gravação por resize, semântica do picker, isolamento por usuário/tela/grid, títulos no grid e em todas as modalidades de Excel, restauração, exportação/importação segura de configurações, autorização sensível e atomicidade da aplicação administrativa em massa e ausência de regressões numa amostra representativa dos consumidores atuais; e como documentar/entregar a mudança compartilhada sem editar tela por tela desnecessariamente?

## Answer

### Aceite mensurável do resize

- Durante o gesto, zero requisições de Preferência de Grid.
- Ao finalizar, no máximo uma gravação semântico-final; gesto sem diferença não grava.
- Nenhum rerender do shell de preferências por movimento.
- Perfil manual em build de produção com ao menos 1.000 linhas, arraste contínuo por 5 segundos e nenhuma long task acima de 50 ms causada pelo fluxo de preferências.
- Inspeção visual sem largura saltando ou atrasando em relação ao ponteiro.
- A medida de fluidez é evidência anexada ao PR, não teste temporal instável no CI.

### Gates obrigatórios

- npm test para Vitest.
- composer test para PHPUnit.
- npm run build para TypeScript e Vite.
- vendor/bin/pint --test nos arquivos PHP alterados.
- perfil manual de resize em build de produção.
- smoke manual na amostra representativa.
- Nenhuma parte é liberada somente com validação manual.

### Matriz frontend

Vitest deve cobrir:

- resolução, serialização, igualdade e compatibilidade de Preferência de Grid antiga;
- normalização de columnTitles, defaults, IDs técnicos, desconhecidos ou não autorizados e variantes;
- largura efêmera sem promover layout ao shell por movimento;
- um commit final, deduplicação, latest-wins, retry e pagehide;
- picker: rascunho, busca, títulos, restauração isolada e global, confirmação, cancelamento, foco e teclado;
- envelope e prévia do intercâmbio sem persistência;
- menu administrativo somente para Administrador e diálogo acessível;
- integração do ErpPreferenceDataGrid sem novos callbacks nos consumidores;
- contagem de renders e chamadas de persistência durante resize.

### Matriz backend

PHPUnit deve cobrir:

- unitários de saneamento, merge, Catálogo de Grid, títulos, Arquivo de Configuração de Grid e reconciliação por destinatário;
- isolamento por Usuário, tela, grid e variante;
- preferências legadas sem columnTitles;
- exportações local, síncrona e assíncrona com fotografia do título e células string;
- exportar configuração, preparar prévia e confirmar importação, incluindo limites, autorização e conflitos;
- operação sensível: Administrador iniciador, credenciais, atividade, bloqueio, prova única e rate limit;
- aplicação em massa para todos os Usuários, preservação de outras seções, contagens e Auditoria;
- concorrência e rollback integral por falha intermediária ou falha de Auditoria;
- fotografia técnica de recuperação e restauração atômica;
- casos negativos comprovando que payloads arbitrários nunca ampliam acesso.

Testes de contrato devem enumerar todos os Catálogos de Grid registrados e todas as modalidades ou datasets Excel registrados, comprovando IDs estáveis e passagem pelo resolvedor central. No frontend, build e contrato do wrapper compartilhado cobrem os consumidores atuais; não criar teste textual frágil fixado no número 34.

### Amostra de smoke

- ConsultaEstoquesDadosGrid: readonly, muitas linhas e exportação por token.
- Vendas/Orcamentos/components/ProdutosGrid: edição e célula não salva durante resize.
- Cadastros/Users/UsersTabs: múltiplos grids no mesmo host.
- ResultadosConsultaOrcamentos: múltiplas instâncias da mesma família.
- Curva ABC: variante com preferencesGridId.
- Um cadastro ou listagem com exportação local, escolhido na investigação final e documentado pelo caminho exato.

Em cada tela aplicável, validar resize, picker, persistência após reload e isolamento. Excel, intercâmbio e ação administrativa são exercitados onde existirem. As demais instâncias são cobertas pelo módulo compartilhado, build e contratos automatizados.

### Não regressão

A amostra deve preservar:

- filtros, paginação, seleção e edição;
- ordenação de dados independente da ordem visual;
- forceVisibleColumnIds sem persistência;
- colunas técnicas fixas e não renomeáveis;
- Excel com dataset, ordem autorizada e formatação anteriores;
- isolamento entre Usuários, telas, grids e variantes;
- preferências antigas sem migração em massa;
- restauração padrão e cancelamentos sem gravação indevida.

### Rollout progressivo

1. Entregar primeiro backend compatível: leitura antiga, saneamento, contratos, endpoints e Auditoria, sem expor ações novas.
2. Habilitar resize, títulos e intercâmbio para grupo interno de Administradores e executar a amostra.
3. Liberar para todos; manter Aplicar configuração para todos… em flag separada e habilitá-la por último.

As flags são temporárias e devem ser removidas após estabilização, sem manter dois fluxos permanentes.

Para avançar:

- gates e smoke aprovados;
- 2 dias úteis no grupo interno sem perda de preferência, falha de segurança ou regressão crítica;
- erro de gravação, importação e exportação abaixo de 1% e sem aumento relevante sobre a linha de base;
- nenhuma evidência de mais de uma gravação por resize;
- depois da liberação geral, 5 dias úteis estáveis antes da ação administrativa.

Violação crítica desabilita a flag correspondente. Dados novos permanecem compatíveis com código anterior, salvo funcionalidades ocultas.

### Recuperação operacional

Cada aplicação em massa cria uma fotografia técnica das seções anteriores por Usuário, separada da Auditoria, com acesso restrito e retenção de 30 dias. Ela permite restauração operacional manual e atômica em caso de defeito ou aplicação equivocada. Não cria default, herança ou sincronização permanente. O runbook deve explicar autorização, execução, verificação e Auditoria da recuperação.

### Observabilidade

Registrar métricas e logs estruturados de:

- gravações por ação e tipo de commit;
- falhas, retries e flush por pagehide;
- duração e erro de exportação e importação;
- arquivos recusados por motivo;
- prévias e aplicações administrativas, duração, contagens e rollbacks;
- conflitos de revisão;
- uso da recuperação operacional.

Não registrar Título Personalizado, senha ou JSON de layout. Alertar aumento de falhas e qualquer indício de parcialidade.

### Documentação e entrega

- Concentrar alterações nos módulos compartilhados.
- Editar consumidor somente com evidência de integração específica e justificar cada arquivo no PR.
- Documentar para o Usuário títulos, intercâmbio e mensagens.
- Documentar para Administrador confirmação em massa, Autorização e alcance.
- Publicar runbook de flags, observabilidade, rollback e recuperação.
- Documentar o contrato JSON versionado.
- Não migrar tela por tela nem alterar regras de negócio dos consumidores.

Não foi criado ADR: os gates e o rollout são reversíveis e operacionalizam contratos já decididos, sem introduzir nova linguagem de domínio.
