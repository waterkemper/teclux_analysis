# Otimizar preferências e títulos dos grids ERP no Laravel

## Destination

Produzir um prompt `/speckit.specify` autocontido para o Cursor, publicado em `modules/erp/grids/01-speckit-prompt.md`, para otimizar o redimensionamento de colunas e permitir títulos personalizados por usuário em todo consumidor atual de `ErpPreferenceDataGrid`.

## Notes

- Domínio: infraestrutura compartilhada de grids ERP no Laravel (`laravel/backend/resources/js/Components/erp/data-grid/`, preferências `user_screen_preferences` e exportação Excel).
- Consultar `/codebase-design` quando forem decididos os seams do componente compartilhado; usar `/domain-modeling` para manter os termos `Catálogo de grid`, `Layout do grid`, `Preferência de grid` e `Título personalizado` sem misturar identidade técnica com apresentação.
- Saída final: `modules/erp/grids/01-speckit-prompt.md`, seguindo o formato dos prompts existentes: `/speckit.specify`, limite, investigação Laravel obrigatória, evidências confirmadas, decisões obrigatórias, critérios de aceite, matriz de testes, saída esperada e fora de escopo.
- Decisões já confirmadas pelo usuário durante o charting:
  - a fronteira cobre somente `ErpPreferenceDataGrid` e seus consumidores atuais; não migra grids bespoke/artesanais;
  - títulos personalizados aparecem no cabeçalho do grid e no Excel;
  - durante o resize a largura muda apenas localmente e ocorre no máximo uma gravação ao concluir o gesto, com contingência de flush ao sair;
  - visibilidade, ordem, largura e título são preferências exclusivamente por usuário + tela + grid;
  - o seletor `Campos da Grade` edita título inline, mostra o título original, restaura um título isoladamente, confirma visibilidade+títulos em conjunto, cancela o rascunho inteiro e `Restaurar padrão` redefine o layout completo.
  - o menu de contexto do grid oferece `Exportar configurações` e `Importar configurações` para compartilhar layouts entre usuários;
  - cada arquivo representa somente um grid, em JSON versionado, contendo visibilidade, ordem, larguras e títulos personalizados — sem identificação do usuário, `screen_key`, dados do grid ou informação sensível; a importação exige o mesmo `gridId` e ignora colunas inexistentes/não autorizadas;
  - importar substitui integralmente a preferência do grid atual, mas primeiro abre uma pré-visualização editável em `Campos da Grade`; somente `Confirmar` persiste, `Cancelar` mantém o layout anterior e colunas novas ausentes no arquivo recebem defaults do catálogo atual.
  - quando o usuário autenticado for administrador, o grid oferece `Aplicar para todos os usuários`; a ação copia a configuração atual somente deste grid para todos os usuários existentes, ativos e inativos, sobrescrevendo a seção correspondente de cada perfil;
  - a aplicação em massa exige confirmação explícita com identificação do grid e quantidade de usuários afetados, além de usuário e senha válidos de qualquer Administrador; quem iniciou e quem autorizou são identidades separadas e auditadas;
  - a aplicação é atômica: todos recebem ou ninguém é alterado; usuários criados futuramente continuam usando defaults e não herdam essa aplicação.
- Evidência inicial: `useErpGridPreferences` já possui debounce de 1 segundo e deduplicação, enquanto `DataGrid` emite alterações de `columnSizing` durante o gesto e chama commit ao detectar o fim; a investigação deve provar a origem da trava, não assumir que seja apenas volume de PUTs.
- Nenhuma implementação será feita neste workspace; o destino é somente o prompt SpecKit.

## Decisions so far

<!-- preenchido conforme os tickets forem resolvidos -->

- [Inventariar o fluxo compartilhado e localizar o gargalo do resize](issues/01-inventariar-fluxo-e-gargalo.md) — 34 instâncias em 30 arquivos; não há PUT por pixel, mas cada movimento promove largura efêmera ao shell, recompõe o layout controlado/TanStack e rerenderiza toda a grade, identificando o seam que precisa ser separado.
- [Definir o contrato persistido de títulos personalizados](issues/02-definir-schema-titulos-personalizados.md) — `columnTitles` é mapa esparso, normalizado e autorizado por `columnId`; overrides sobrevivem a mudanças do título padrão, preferências antigas seguem válidas e variantes exigem catálogo backend específico, nunca sanitização permissiva.
- [Definir a UX de títulos em Campos da Grade](issues/03-definir-ux-campos-da-grade.md) — escolhida tabela compacta inline: visibilidade, referência ao padrão, título editável e restauração por linha; tudo permanece rascunho até Confirmar, colunas técnicas ficam fora do seletor e teclado/foco preservam o contrato acessível.
- [Definir o contrato de resize fluido e persistência por gesto](issues/04-definir-contrato-resize-fluido.md) — largura efêmera fica local no DataGrid e só a fotografia final cruza o seam; commits são deduplicados, serializados e coalescidos por latest-wins, falhas permanecem pendentes e saída usa flush keepalive sem persistência paralela.
- [Definir o contrato de títulos personalizados na exportação Excel](issues/05-definir-titulos-na-exportacao.md) — o backend compõe cabeçalhos em um seam compartilhado a partir de catálogo, autorização e preferência persistida; jobs capturam uma fotografia interna no início e o writer preserva todo título como texto literal.
- [Definir exportação e importação de configurações do grid](issues/08-definir-intercambio-configuracoes.md) — arquivo JSON versionado e sem identidade de Usuário carrega uma fotografia canônica do grid efetivo; o backend reconcilia e saneia uma prévia sem persistir, e somente a confirmação revisionada substitui a preferência atual.
- [Definir aplicação administrativa para todos os usuários](issues/09-definir-aplicacao-preferencias-todos-usuarios.md) — Administrador prepara uma prévia revisionada e reautoriza a operação com credenciais explícitas; um módulo compartilhado saneia por destinatário e substitui somente a seção do grid para todos os Usuários existentes em transação única e auditada.
- [Definir critérios de aceite, testes e rollout transversal](issues/06-definir-aceite-testes-e-rollout.md) — gates Vitest/PHPUnit/build, contratos enumeráveis, smoke representativo e perfil mensurável protegem a mudança compartilhada; rollout em três etapas separa a ação administrativa e inclui observabilidade e recuperação atômica por 30 dias.
- [Consolidar o prompt SpecKit dos grids ERP](issues/07-consolidar-prompt-speckit.md) — o prompt autocontido foi publicado no padrão modules/erp/grids, reunindo investigação, contratos, aceite, testes, rollout e fora de escopo para somente ErpPreferenceDataGrid e consumidores atuais.

## Not yet specified

- Nenhum.

## Out of scope

- Migrar grids bespoke, tabelas manuais ou componentes que não consumam `ErpPreferenceDataGrid`.
- Alterar regras de negócio, datasets, filtros, paginação ou seleção próprios de cada tela consumidora.
- Definir um catálogo padrão global ou fazer usuários futuros herdarem uma configuração aplicada em massa.
- Sincronização automática de preferências entre usuários; o compartilhamento é exclusivamente por exportação/importação explícita de arquivo.
- Implementar a mudança neste workspace de análise.
