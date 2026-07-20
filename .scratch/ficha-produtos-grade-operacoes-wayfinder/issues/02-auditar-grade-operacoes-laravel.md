Type: task
Status: resolved
Blocked by:

## Question

Qual é o estado implementado no Laravel para a grade de Movimentos: catálogo completo, defaults, ordem, grupos, formatos, colunas financeiras removidas por AuthZ, preferências, busca/ordenação, exportação, atalhos, ações de linha, legenda, perspectivas e comportamento responsivo; e onde ele diverge do contrato Delphi?

## Answer

### Catálogos e defaults atuais

O catálogo de **Movimentos** contém 27 colunas, das quais 16 abrem visíveis, nesta ordem: Movimento, Lançamento, Data, Processamento, Filial, Nome da filial, Tipo, Descrição do tipo, Lote, Contrato, Quantidade, Operação, Em estoque, Reservado, Trânsito e Executor. Ficam disponíveis no seletor: Referência, Demonstração, Conserto, Futuro, Danificada, Estoque físico, Reserva prévia, Financeiro, Valor, Custo médio e Autorizador.

O catálogo de **Lotes** contém somente 13 colunas: Lote, Movimento, Lançamento, Data, Filial, Nome da filial, Tipo, Quantidade, Operação, Em estoque e Reservado visíveis; Financeiro e Custo médio opcionais. É uma divergência grande do Delphi, no qual Movimentos e Lotes têm as mesmas 43 colunas físicas.

Apesar de o DTO já transportar `cliente_fornecedor`, `operacao_posicoes` e, quando autorizado, preço com/sem ICMS, IPI, moeda, valor em moeda, pedido de cotação e pedido aberto, esses dados não fazem parte dos catálogos. As 14 posições EST/RES/TRÂ/DEM/CON/FUT/DAN/FÍS/PRV/U.ENT/U.COMP/FIN/TVEN/TCOM também não são colunas. O Laravel acrescenta identificadores e descrições úteis, mas não preserva o catálogo/default legado: Referência e vários saldos antes visíveis agora começam ocultos.

Datas usam DD/MM/AAAA, quantidades/saldos até quatro casas, e Financeiro/Valor/Custo médio formato monetário. Não há grupos ou presets nomeados.

### Ordem do extrato

A grade está com `enableSorting`, portanto cada cabeçalho permite reordenar localmente a página carregada. Isso é incorreto para este domínio. A Ficha é um **extrato cronológico do produto na filial** e sua ordem é parte do significado: **filial, produto, data, lancto**, preservada em todas as páginas e perspectivas, com desempate técnico estável apenas se esses campos não forem suficientes. Não deve existir reordenação por cabeçalho nem preferência de ordenação. Busca/filtro pode reduzir as linhas, mas deve preservar a ordem relativa original.

### Preferências, paginação e exportação

Cada perspectiva persiste por usuário visibilidade, ordem visual das colunas e largura. O seletor “Campos da Grade”, drag-and-drop de colunas, resize, auto-fit, restaurar padrão e `Alt+G` são melhorias sobre os ciclos opacos do Delphi. A proibição acima refere-se à **ordenação das linhas**; a ordem visual das colunas pode continuar configurável. Movimentos e Lotes têm preferências independentes. O schema está na versão 1; novos defaults/colunas exigem reconciliação e provavelmente incremento de versão para não serem anulados por preferências antigas.

A consulta é paginada no servidor em blocos de 50, mas busca global e ordenação atuais são locais à página. A interface exibe o total sem avisar esse alcance. Não há exportação própria da Ficha: a exportação genérica recebe somente as rows carregadas, logo `Ctrl+X`/menu exporta apenas a página atual, não o extrato completo. Busca e exportação devem futuramente operar sobre o resultado completo ou declarar inequivocamente “página atual”; a ordenação interativa deve ser removida, não ampliada ao servidor.

### Autorização financeira

O backend omite o objeto e os saldos financeiros das linhas para usuário sem capability, impedindo a exposição de valores que o Alt+F8 Delphi permitia reabrir. Porém o controller ainda envia o catálogo financeiro completo e o React remove Financeiro/Valor/Custo médio no cliente. O registro server-side de preferências também conhece o catálogo integral. Portanto a regra desejada ainda não está completa: coluna não autorizada deve ser removida **no servidor** de catálogo, payload, validação de preferências e exportação. Os testes existentes cobrem capability e ausência dos valores nas rows, mas não catálogo/preferências autorizados.

### Atalhos, operações e legenda

“Gerar (F6)” é apenas um rótulo: a barra não registra teclado e `Index.tsx` não possui handler, portanto F6 não funciona. Enter na data final, Alt+F5, Alt+F7 e Alt+F8 também não existem. O grid possui apenas `Alt+G` para campos e `Ctrl+X` para exportação.

A tela é corretamente somente leitura e não oferece salvar/editar movimento; os testes asseguram ausência de rotas store/update/destroy. Assim, não deve ser restaurada a edição ambígua do Alt+F5/F5 legado. A ação de linha existente abre o histórico/grade por contrato quando a linha selecionada possui contrato.

O backend produz legenda e apresentação das 14 posições de Operação, inclusive TCOM, mas `operacao_legend` não é renderizado e `operacao_posicoes` não chega à grade. A informação está no transporte e permanece invisível.

### Perspectivas, responsividade e lacunas para decisão

Movimentos e Lotes são perspectivas separadas; saldo anterior e histórico por contrato aparecem em painéis próprios. A grade somente leitura tem seleção, cabeçalho fixo, área padrão de 420 px e scroll horizontal/vertical. Em telas estreitas, controles quebram linha, mas a grade apenas usa scroll horizontal, sem apresentação móvel alternativa.

A próxima decisão deve: reconstruir catálogos completos por IDs semânticos; aproximar defaults do trabalho diário; tornar as 14 posições e legenda consultáveis; substituir Alt+F5/F7/F8 por presets nomeados e decidir aliases; filtrar catálogo financeiro no servidor; tornar F6 real; remover ordenação de linhas e garantir a ordem canônica do extrato; definir alcance correto de busca/exportação; e migrar preferências existentes. Não foram encontrados testes específicos desses catálogos/defaults, atalhos, legenda renderizada, ordem imutável, alcance de busca/exportação ou AuthZ de catálogo/preferências.
