Type: prototype
Status: resolved
Blocked by: 03, 08

## Question

Qual desenho de shell, filtros e grids permite consultar, comparar, editar e revisar todos os registros filtrados sem paginação, com boa legibilidade e desempenho, incluindo colunas fixas/agrupadas, valor atual versus proposto, seleção integral, atalhos F6/F5, estados de carregamento, validação e conflito?

Usar os componentes Laravel de Marketplace como referência visual/técnica, preservando a separação de domínio.

## Answer

### Artefato avaliado

- **CONFIRMADO:** foi criado o protótipo descartável [Shell e grid da Manutenção de Preços](../prototype-shell-grid/index.html?variant=A), acompanhado por [instruções de execução](../prototype-shell-grid/README.md). Ele usa somente dados em memória e não altera Delphi ou Laravel.
- **DECISÃO NOVA:** a alternativa escolhida é a A, aproximada do fluxo Delphi e ajustada aos padrões Laravel. As alternativas com filtros laterais permanentes e grid-first com painel de revisão foram rejeitadas porque retiram largura útil dos preços.

### Shell e comandos

- **DECISÃO NOVA:** a página terá duas abas: Filtros e Dados. Filtros reúne todos os critérios; Gerar F6 abre automaticamente Dados. Dados não repete filtros nem ocupa sua área com painéis laterais.
- **DECISÃO NOVA:** a barra de comandos permanece visível e contém Gerar F6, operações em lote, recalcular, desfazer, resumo de pendências e Revisar e gravar F8.
- **DECISÃO NOVA:** F8 segue o padrão Laravel e abre modal de revisão. Não haverá terceira aba de revisão. O modal resume alterações, linhas ignoradas, erros, conflitos e autorização necessária antes do commit.
- **CONFIRMADO:** o Laravel Marketplace oferece referências de shell, cabeçalho, barra de operações, abas, banners de geração e componentes de filtros, mas seu domínio e sua persistência não serão reutilizados. Evidência: laravel/backend/resources/js/Pages/Marketplaces/PriceMaintenance/Index.tsx:552-720.

### Três grids sincronizados

- **CONFIRMADO:** o Delphi apresenta três TtecDBGrid lado a lado, ligados ao mesmo dsrManutencaoPreco e encadeados por GridAssociado: dbgPrecosProdutos → dbgPrecos → dbgColunasPrecos → dbgPrecosProdutos. Evidências: delphi/apps/estoque/fmmanutencaopreco.dfm:1870-2246; dsr em delphi/apps/estoque/dmmanutencaopreco.dfm:96-100.
- **DECISÃO NOVA:** o Laravel preservará três grids separados, representando três visões da mesma coleção e da mesma linha lógica. Navegar em qualquer um atualiza a linha ativa nos outros dois; rolagem vertical é sincronizada e rolagem horizontal é própria de cada grid.
- **DECISÃO NOVA:** divisores redimensionáveis permitem ajustar as três larguras durante a sessão. O terceiro grid começa mais largo por crescer com colunas de preço e Cargos.

#### Grid Produtos e grades

- **CONFIRMADO:** é a visão de identificação, somente leitura: código visual da Característica/Produto, Item, descrição e valores das grades 1 e 2 quando o parâmetro de grades estiver ativo. Os títulos das grades mudam conforme Linha e Coluna da Característica. Evidências: delphi/apps/estoque/fmmanutencaopreco.pas:879-923,1643-1655; dbgPrecosProdutos em fmmanutencaopreco.dfm:2204-2246.
- **DECISÃO NOVA:** estoque resumido pode acompanhar a identificação, sem deslocar informações comerciais para este grid.

#### Grid Classificação, custo e formação

- **CONFIRMADO:** contém Referência, Grupo, Promoção vinculada, Classe, Marca, curva ABC, Faixa de preço, CST, CSOSN, última compra, data da última compra, custo médio geral, última compra com ICMS, preços com/sem ICMS e preço de venda antes dos impostos. Evidência: colunas de dbgPrecos em delphi/apps/estoque/fmmanutencaopreco.dfm:1982-2202 e configuração em fmmanutencaopreco.pas:1030-1190.
- **DECISÃO NOVA:** códigos e descrições relacionados serão agrupados visualmente, preservando os valores necessários e reduzindo repetição horizontal quando possível.

#### Grid Colunas de preço e Cargos

- **CONFIRMADO:** começa com Alterar, markup, markup calculado e preço; para cada Coluna de preço monta Valor, Margem e Validade; para cada Cargo monta Preço calculado, Margem e Desconto. Evidências: delphi/apps/estoque/fmmanutencaopreco.pas:1197-1272; montagem Cargo em delphi/apps/estoque/dmmanutencaopreco.pas:1200-1255.
- **DECISÃO NOVA:** este é o grid principal de edição e recebe a marcação Alterar, como no Delphi. Valor atual e proposto aparecem juntos na célula alterada; projeções de margem ficam visualmente distintas de entradas persistíveis.

### Navegação e seleção

- **DECISÃO NOVA:** setas para cima/baixo alteram a linha ativa nos três grids e garantem que ela permaneça visível. Tab e Shift+Tab percorrem somente células editáveis e continuam entre os grids. Espaço alterna Alterar na linha atual.
- **DECISÃO NOVA:** cabeçalhos ficam fixos; a linha ativa e estados de alteração/erro/conflito aparecem de forma consistente nos três grids. Selecionar todos considera toda a coleção do F6, não apenas a janela renderizada.

### Carregamento integral e desempenho

- **DECISÃO NOVA:** F6 muda imediatamente para Dados e ocupa a área dos grids com carregamento, etapa atual e quantidade recebida quando disponível. A consulta pode ser cancelada.
- **DECISÃO NOVA:** o resultado anterior permanece até a nova coleção ficar completa. Erro ou cancelamento preserva esse resultado; não haverá substituição parcial dos três grids.
- **DECISÃO NOVA:** não há paginação. Toda a coleção é carregada e participa de seleção, filtros locais, ordenação, operações e exportação. A renderização usa virtualização de linhas para não manter no DOM registros fora da janela visível.

### Validação e conflitos

- **DECISÃO NOVA:** erro aparece na célula e na linha correspondente dos três grids. Acima deles haverá contadores e filtros rápidos Somente alterações, Com erros e Com conflitos; clicar no contador navega à primeira ocorrência.
- **DECISÃO NOVA:** F8 fica desabilitado enquanto houver erro ou conflito não resolvido. O modal de revisão não substitui a indicação contextual nos grids.
- **INFERIDO:** a origem e resolução técnica dos conflitos serão concluídas em “Definir gravação atômica, concorrência e auditoria”; este ticket define somente a apresentação.

### Casos de aceitação visual

1. F6 na aba Filtros abre Dados e mostra carregamento dos três grids.
2. Conclusão troca simultaneamente os três grids; cancelamento preserva a coleção anterior.
3. Clique, setas ou rolagem em um grid mantêm linha e posição equivalentes nos demais.
4. Arrastar divisores redistribui largura sem quebrar cabeçalhos ou sincronização.
5. Editar preço exibe atual/proposto, recalcula projeções e sinaliza a linha nos três grids.
6. Selecionar todos e operações em lote alcançam registros virtualizados fora da tela.
7. Erro ou conflito oferece filtro, contador e navegação e impede F8.
8. F8 abre modal completo e não uma terceira aba.

Esta decisão deve compor o futuro to-spec do shell e da edição integral, usando o protótipo apenas como fonte visual; o HTML é descartável e não deve ser promovido diretamente a produção.
