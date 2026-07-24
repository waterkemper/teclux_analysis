# Definir o contrato de resize fluido e persistência por gesto

Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual seam compartilhado deve separar estado efêmero do resize e layout persistível para que cada movimento atualize a largura visual sem provocar trabalho global caro, e para que cada gesto concluído gere no máximo uma gravação, com deduplicação, serialização de gravações concorrentes e flush seguro ao desmontar/sair?

## Answer

### Seam escolhido

O módulo `DataGrid` passa a ser dono da **largura efêmera do gesto**. O módulo de preferências recebe apenas **commits semânticos de layout**.

- Manter TanStack em `columnResizeMode: onChange` para resposta visual contínua.
- Inicializar um estado local de `columnSizing` a partir do layout resolvido.
- Cada movimento atualiza somente esse estado local; não chama `setLayoutState` do shell, não agenda persistência e não recria `ErpGridResolvedLayout`.
- Ao terminar o gesto, o grid entrega uma única fotografia final das larguras por uma interface equivalente a `commitColumnSizing(finalSizing)`.
- `ErpPreferenceDataGrid` continua sendo a única adoção necessária pelos 34 consumidores; nenhum chamador implementa estado ou persistência.

O seam deve permanecer pequeno. O shell não precisa conhecer `pointermove`, coluna ativa ou progresso do gesto; o grid não precisa conhecer URL, debounce, fila ou banco.

### Sincronização local

- Ao começar, fotografar as larguras persistíveis como baseline.
- Durante o gesto, props externas não sobrescrevem o draft local.
- No fim, clamp por `minWidth`/`maxWidth`, comparar com o baseline e não emitir commit quando não houver mudança efetiva.
- Após picker, importação, restauração ou mudança de catálogo, sincronizar o estado local quando nenhum resize estiver ativo.
- `tableColumns` deve depender de `columnOrder`, não do objeto `erpLayout` inteiro; largura não recompõe a ordem.
- Colunas não redimensionáveis continuam fora do gesto.

### Persistência por gesto

- Um resize concluído gera no máximo um commit e, se houver diff, no máximo um PUT.
- Remover timer/debounce do caminho de movimento; o fim do gesto já é o limite natural.
- Deduplicar pela seção normalizada completa antes do envio.
- Reordenação por drag, autoajuste por duplo clique, picker, importação e restauração são commits discretos independentes.
- Corrigir o autoajuste existente: hoje o handle anuncia duplo clique, mas `autoFitColumn` ignora grids com `erpLayout`. O duplo clique deve calcular largura pelo conteúdo, respeitar limites e produzir um único commit.

### Concorrência

- Nunca executar dois PUTs de preferência simultâneos para a mesma instância.
- Se outro commit terminar enquanto há request em voo, manter somente a fotografia normalizada mais recente.
- Ao concluir o PUT atual, enviar a pendente apenas se diferir da seção confirmada.
- Estados intermediários são descartados; **latest wins**.
- Resposta de request antigo nunca reverte o layout local mais novo.

### Falha e retomada

- Falha de save não reverte a largura aplicada na sessão.
- Manter a fotografia mais recente como dirty/pending e exibir aviso discreto.
- Não criar loop de retry automático.
- A próxima alteração semântica ou a saída da tela tenta novamente a fotografia mais recente.
- Um sucesso posterior limpa o aviso e o dirty somente se confirmar exatamente a última seção; caso exista uma fotografia posterior, ela continua pendente.

### Saída e desmontagem

- Navegação interna/Inertia: cleanup/unmount solicita flush normal da fotografia pendente.
- Saída, reload ou fechamento: usar `pagehide` com request `keepalive` best-effort para o mesmo endpoint.
- Não bloquear navegação com diálogo.
- Não criar fallback em `localStorage`, IndexedDB ou outro mecanismo paralelo; `user_screen_preferences` permanece a única persistência.
- O handler de saída lê refs atuais, sem depender de closures obsoletas.

### Interface recomendada

Substituir a combinação ambígua `onErpLayoutChange` por pixel + `onErpLayoutCommit` sem payload por uma interface semântica que entrega a fotografia final. A implementação interna pode separar `commitColumnSizing` e `commitLayout`, mas consumidores externos continuam vendo apenas `ErpPreferenceDataGrid`.

### Testes derivados

- muitos movimentos produzem atualização visual contínua, zero PUT durante o gesto e um PUT ao fim;
- gesto sem diff produz zero PUT;
- rerender do shell/catálogo não ocorre por movimento;
- segundo gesto durante request mantém uma única request em voo e envia somente a fotografia mais recente depois;
- falha mantém layout e dirty; próxima ação retenta;
- resposta antiga não sobrescreve estado novo;
- unmount e `pagehide` fazem flush uma vez; sem `localStorage`;
- import/picker sincroniza largura local quando ocioso;
- min/max e coluna não redimensionável;
- duplo clique auto-fit funciona em grid ERP e gera um commit.

Não foi criado ADR: é uma correção interna, reversível, concentrada no seam compartilhado.
