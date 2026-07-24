# Inventariar o fluxo compartilhado e localizar o gargalo do resize

Type: task
Status: resolved
Blocked by:

## Question

Qual é o fluxo completo, medido e evidenciado, desde o gesto de redimensionar uma coluna até rerenderização e persistência em `user_screen_preferences`, quais consumidores atuais de `ErpPreferenceDataGrid` exercitam variantes relevantes (readonly/editável, export local/token, múltiplos grids), e onde exatamente nasce a sensação de travamento — frequência de eventos, atualização React/TanStack, recriação de catálogo/layout, chamadas HTTP ou combinação desses fatores?

## Answer

### Inventário confirmado

- Há **34 instâncias consumidoras** de `ErpPreferenceDataGrid` em **30 arquivos TSX**. Destas, 27 declaram `as=readonly`, uma declara `as=editable` e seis usam a variante editável default. Há arquivos com múltiplas instâncias: Resultados da Consulta de Orçamentos (2) e abas de Usuários (4).
- Cinco consumidores passam `exportContext` diretamente; há tanto exportação por token/dataset grande (por exemplo Análise de Estoques, Consulta de Estoques, Ficha de Produtos, DRE Gerencial e Manutenção de Preços) quanto exportação local quando não há token.
- Quatro instâncias usam `forceVisibleColumnIds`, portanto o seam novo não pode persistir visibilidade temporariamente forçada.
- Amostra mínima representativa para decisões/testes posteriores:
  - readonly + muitas linhas + export token: `AnaliseEstoquesDadosGrid` ou `ConsultaEstoquesDadosGrid`;
  - editável com estado de célula não salvo: `Vendas/Orcamentos/components/ProdutosGrid`;
  - múltiplos grids no mesmo host: `Cadastros/Users/UsersTabs`;
  - múltiplas instâncias da mesma família: `ResultadosConsultaOrcamentos`;
  - exportação local: um cadastro/listagem sem `exportContext`.

### Fluxo atual do resize

1. `DataGrid` configura TanStack com `columnResizeMode: 'onChange'`.
2. Cada evento de movimento do handle chama `onColumnSizingChange`.
3. O callback cria um novo `ErpGridResolvedLayout` com `{ ...erpLayout, columnSizing: nextSizing }`.
4. `ErpPreferenceDataGrid` encaminha isso a `schedulePersist`.
5. `useErpGridPreferences.schedulePersist` faz três trabalhos por movimento: `setLayoutState(next)`, substitui `pendingLayoutRef` e cancela/reagenda o timer de 1.000 ms.
6. A mudança de estado rerenderiza `ErpGridShell`, seu render-prop, `GridWithLayout` e `DataGrid`. Como `tableColumns` depende do objeto `erpLayout` inteiro, `orderColumnsByLayout` também roda novamente em cada movimento; o estado controlado do TanStack recalcula cabeçalhos, linhas e células visíveis.
7. Ao TanStack mudar `isResizingColumn` de uma coluna para falso, o efeito de `DataGrid` chama `onErpLayoutCommit`, ligado a `flushPersist`.
8. `flushPersist` cancela o timer e inicia um PUT da última fotografia pendente. O backend saneia e faz read/merge/write do payload completo de `user_screen_preferences` para o par usuário + `screen_key`.

### Diagnóstico

- **CONFIRMADO: não existe PUT por pixel.** Movimento contínuo reinicia o debounce; o fim do gesto força o último estado. Em condições normais há um PUT por gesto. A deduplicação evita gravar uma seção igual à última persistida, e `persistInFlightRef` serializa uma fotografia posterior.
- **CONFIRMADO: existe atualização React/TanStack por pixel no nível alto demais.** A largura efêmera atravessa o estado persistível do shell e invalida o grid completo. O custo cresce com quantidade/complexidade de linhas, células editáveis, formatters e componentes filhos, correspondendo à trava relatada.
- **RISCO CONFIRMADO:** `tableColumns` depende de `erpLayout`, embora reordenação só precise de `columnOrder`; logo uma simples mudança de largura recompõe a lista ordenada de colunas.
- **RISCO CONFIRMADO:** o comentário de `onErpLayoutCommit` diz “debounce curto”, mas o callback executa flush imediato; documentação e contrato estão desalinhados.
- **NÃO EVIDENCIADO:** latência do banco/rede como causa do arraste. Ela só ocorre após a pausa/fim, embora possa afetar feedback de salvamento.

### Consequência para o mapa

O próximo contrato deve separar **largura efêmera do gesto** do **layout persistível**: o movimento não pode chamar `setLayoutState` no shell nem recriar o layout/colunas globais; apenas o grid local atualiza a largura visual. No fim, uma única fotografia saneada sobe para o hook e gera no máximo um PUT. Reordenação, picker, importação e restauração continuam commits discretos.

### Verificação executada

- `useErpGridLayout.test.ts`: 3 testes passaram.
- `erpGridTableLayout.test.ts`: 3 testes passaram.
- `ErpGridShell.test.tsx` não iniciou por configuração externa incorreta: o Vitest resolveu `setupFiles` para `C:/teclux_cloud/backend/resources/js/test/setup.ts`, fora deste checkout. Isso revela uma lacuna da suíte, não uma falha funcional do grid.
- Não existe teste atual que conte rerenders ou PUTs durante resize; essa lacuna deve entrar em “Definir critérios de aceite, testes e rollout transversal”.
