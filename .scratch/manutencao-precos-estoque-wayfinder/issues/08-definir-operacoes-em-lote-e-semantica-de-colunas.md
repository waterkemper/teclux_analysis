Type: grilling
Status: resolved
Blocked by: 02, 05, 06, 07

## Question

Qual deve ser a semântica canônica das operações em lote — marcar todos, aplicar percentual/validade, copiar coluna origem para destino, excluir/limpar coluna, alterar selecionados e recalcular — incluindo registros elegíveis, valores propostos, confirmação, conflitos entre operações e resultado da prévia?

Comparar cada comando Delphi com o comportamento desejado no Laravel e impedir que limitações da grade legada se tornem regras.

## Answer

### Modelo canônico da sessão de edição

- **DECISÃO NOVA:** F6 cria uma coleção integral, sem paginação, e uma sessão local de edição. Nenhum comando desta fatia grava no banco; F5 é a única fronteira de persistência.
- **DECISÃO NOVA:** comandos em lote atingem exclusivamente as linhas selecionadas. “Selecionar todos” seleciona todo o resultado corrente do F6, inclusive linhas fora da área visível por rolagem.
- **CONFIRMADO:** o Delphi usa o campo transitório `alterar` para marcar/desmarcar todos ou alternar uma linha e todos os comandos internos percorrem o dataset consultando essa marca. Evidências: `delphi/apps/estoque/dmmanutencaopreco.pas:601-689,834-860,2149-2156`; `delphi/apps/estoque/fmmanutencaopreco.pas:1594-1609`.
- **DECISÃO NOVA:** seleção controla apenas operações futuras. Desmarcar uma linha não descarta propostas já aplicadas; estas são removidas por “Desfazer” na operação ou na linha.
- **DECISÃO NOVA:** operações são cumulativas. Cada nova operação lê o valor proposto atual, não necessariamente o valor original. Quando várias operações atingirem a mesma célula, a última vence; a prévia conserva original, final e histórico intermediário. Desfazer a última restaura o resultado anterior.
- **DECISÃO NOVA:** executar novo F6, regenerar o grid por filtros, trocar Filial ou sair com alterações pendentes exige escolha explícita entre continuar na sessão atual ou descartar tudo. Propostas não migram automaticamente para outra consulta.

### Matriz de comandos

#### Selecionar todos / desmarcar todos

- **CONFIRMADO:** no Delphi, a caixa geral percorre todo o dataset carregado; `Ctrl+Espaço` alterna a linha corrente. Evidências: `fmmanutencaopreco.pas:1594-1609`; `dmmanutencaopreco.pas:2149-2156`.
- **DECISÃO NOVA:** no Laravel, o cabeçalho terá estado marcado, desmarcado ou parcial e exibirá a contagem `selecionadas / total`. A seleção não é limitada à janela renderizada do grid.

#### Aplicar percentual e/ou validade à própria coluna

- **CONFIRMADO:** o Delphi exige uma coluna de origem, percorre apenas marcados, soma `valor × percentual / 100`, aplica arredondamento/múltiplo por Produto e substitui a validade somente quando informada. Percentual vazio/zero e validade vazia preservam seus respectivos valores. Evidências: `AplicarPercentualEValidade`, `dmmanutencaopreco.pas:601-652`; confirmação em `fmmanutencaopreco.pas:1326-1340`.
- **DECISÃO NOVA:** percentual positivo aumenta; negativo reduz; vazio ou zero mantém preço. Validade informada substitui; vazia mantém. É válido alterar somente a validade. O preço proposto passa pelo motor de arredondamento e múltiplo já delimitado.

#### Copiar coluna origem para destino

- **CONFIRMADO:** para linhas marcadas com origem maior que zero, o Delphi copia a origem ao destino, aplica percentual opcional e arredondamento; validade informada substitui, caso contrário herda a origem. A origem não muda. Evidência: `CopiarColunaPreco`, `dmmanutencaopreco.pas:654-713`; comando F7 em `fmmanutencaopreco.pas:1358-1369` e `fmmanutencaopreco.dfm:162-204`.
- **DECISÃO NOVA:** origem e destino devem ser diferentes. Percentual positivo/negativo incide sobre a origem proposta. Origem zero ou vazia não altera o destino e aparece na prévia como `ignorada — origem sem preço`, em vez de ser omitida silenciosamente como no Delphi.

#### Limpar coluna

- **CONFIRMADO:** o Delphi zera o valor e limpa validade e margem nas linhas marcadas. Durante F5, valor zero elimina fisicamente o registro de `colunasprecos`; a confirmação ocorre no fluxo de gravação. Evidências: `ExcluirColunaPreco`, `dmmanutencaopreco.pas:834-860`; `fmmanutencaopreco.pas:1286-1324`; persistência em `dmmanutencaopreco.pas:1616-1725`.
- **DECISÃO NOVA:** o comando se chamará “Limpar coluna”, pois seu efeito comercial é remover o valor daquela identidade. Ele permanece disponível para a coluna Normal, como no Delphi, e também para colunas adicionais/promocionais.
- **DECISÃO NOVA:** preparar a limpeza exige confirmação específica com coluna, total selecionado, total que efetivamente perderá valor e aviso reforçado para a coluna Normal. Confirmar apenas prepara a proposta; F5 continua sendo a gravação.

#### Edição manual e “alterar selecionados”

- **CONFIRMADO:** no Delphi, edições no grid disparam a manutenção dos buffers por identidade e recalculam projeções; o campo de seleção não é requisito para editar uma célula. Evidências: `dmmanutencaopreco.pas:1450-1525,1997-2115,2270-2436`.
- **DECISÃO NOVA:** uma célula pode ser editada sem selecionar a linha. Valores compartilhados por `Característica + Faixa + Coluna` refletem-se nas demais linhas da mesma identidade; descontos por Cargo seguem a propagação definida em “Delimitar preços e descontos por Cargo”. A seleção continua exclusiva dos comandos em lote.

#### Recalcular

- **CONFIRMADO:** o Delphi recalcula preço normal, margens e preços por Cargo ao mudar valores estruturais, usando funções do banco e fórmulas locais. Evidência: `AlterarValoresPrecosMarkup`, `dmmanutencaopreco.pas:1997-2115`.
- **DECISÃO NOVA:** “Recalcular” é somente projeção. Usa valores propostos, custos, markups, múltiplos, Promoções e Cargos; atualiza preços calculados e margens; não cria alteração persistível quando nenhuma entrada mudou; não grava; e identifica linhas que falharam.

### Elegibilidade e prévia

- **DECISÃO NOVA:** cada comando produz um resultado por linha: `alterada`, `sem mudança`, `ignorada` ou `erro`. A prévia mostra identidade, coluna, valor/validade original e proposto, motivo e operação de origem.
- **DECISÃO NOVA:** “sem mudança” não gera mutação no F5. “Ignorada” não impede as demais linhas. “Erro” impede considerar a preparação concluída e deverá ser resolvido ou removido antes do F5; a atomicidade final pertence a “Definir gravação atômica, concorrência e auditoria”.
- **DECISÃO NOVA:** preços e margens derivados nunca aparecem como persistência autônoma. A prévia separa entradas persistíveis (`colunasprecos`, Faixa/Produto e `produtoscargos`) de projeções recalculadas.
- **DECISÃO NOVA:** conflitos externos e revalidação contra o banco serão definidos no ticket de gravação; dentro da sessão local, a ordenação do histórico resolve conflitos determinísticos entre comandos do próprio usuário.

### Diferenças deliberadas em relação ao Delphi

- **DIVERGENTE:** o Delphi ignora silenciosamente origem zero na cópia; o Laravel explicará cada linha ignorada.
- **DIVERGENTE:** o Delphi não oferece histórico operacional/desfazer granular; o Laravel manterá pilha de operações até F5 ou descarte.
- **DIVERGENTE:** a confirmação de limpeza ocorre junto ao F5 no legado; o Laravel confirma ao preparar e volta a resumir todas as intenções no F5.
- **DIVERGENTE:** a grade Delphi mistura seleção, buffers invisíveis e projeções; o Laravel exporá seleção, intenções persistíveis e projeções como estados distintos.
- **NÃO LOCALIZADO:** não há operação interna independente no Laravel equivalente a esse conjunto. Os componentes de filtro da manutenção Marketplace podem inspirar a interface, mas seus comandos, cálculos e persistência continuam fora deste contexto.

### Casos dourados mínimos

1. Selecionar todos inclui os registros completos do F6, não apenas os renderizados.
2. Copiar Normal para Promoção com `-10%` e validade definida; depois aplicar `+5%` à Promoção usa o valor já proposto.
3. Copiar linha com origem zero preserva o destino e registra motivo de ignorada.
4. Aplicar somente validade não altera preço; aplicar somente percentual não altera validade.
5. Limpar Normal mostra aviso reforçado e prepara exclusão física sem gravar antes do F5.
6. Desmarcar uma linha alterada preserva sua proposta; desfazer a operação a restaura.
7. Editar manualmente linha não selecionada propaga conforme a identidade compartilhada.
8. Recalcular altera apenas projeções quando as entradas persistíveis permanecem iguais.
9. Novo F6 ou troca de Filial não descarta propostas silenciosamente.

Esta fatia deve integrar o `$to-spec` do shell/grade e o da gravação atômica, em vez de gerar uma spec isolada sem essas duas fronteiras.
