# Inventariar jornada e interface da Consulta Delphi

Type: task
Status: resolved
Blocked by:

## Question

Quais filtros, abas, campos, colunas, estados visuais, atalhos, ações e dependências de seleção compõem a experiência completa de `fmconsultarequisicaoexposicao.pas/.dfm`, incluindo Gerar F7, Cancelar F6, Imprimir F12, edição na grade e navegação entre Pedidos e Confirmados?

## Answer

### Estrutura e estado inicial

A janela MDI chama-se **Consulta de Requisições para Exposição** e herda o shell de cadastro padrão. Ao abrir:

- Filial Requisitante é fixa na `FilialBase`, exibida como código com três dígitos e nome; ambos são somente leitura;
- Data Inicial e Data Final recebem a data do servidor;
- situação inicial é **Aberto**;
- aba inicial é **Pedidos**;
- o foco inicial fica em Data Inicial;
- Procurar e Incluir herdados ficam ocultos;
- Gerar e Imprimir são ações específicas, enquanto Salvar/Cancelar/Voltar vêm do cadastro padrão.

### Filtros

O cabeçalho possui somente:

1. **Requisitante** — código e nome da Filial Base, não selecionável;
2. **Situação** — escolha exclusiva entre Aberto, Fechado, Confirmado e Cancelado, nessa ordem, com Aberto marcado por padrão;
3. **Período** — Data Inicial e Data Final, ambas validadas pelo `TtecEditionControlValidation`.

Ao entrar em Data Final, seu mínimo é ajustado em função de Data Inicial e da data do servidor. Pressionar Enter em Data Final válida executa Gerar e, havendo registros, leva o foco à grade de Pedidos.

### Barra de ações e atalhos

- **Gerar F7**: valida o período, força a aba Pedidos, aplica datas/situação e abre a consulta; se vazia, avisa “nenhum registro” e retorna o foco à Data Inicial.
- **Cancelar F6**: é o botão Excluir herdado, apenas renomeado; a ação efetiva é cancelamento lógico da requisição selecionada.
- **Imprimir F12**: abre o relatório das requisições carregadas; só fica habilitado quando a consulta possui registros.
- **Salvar F5**: herdado; confirma uma edição feita na requisição/grade.
- **Esc**: quando não há gravação pendente, fecha a tabela consultada e retorna o foco à Data Inicial; durante edição, o comportamento é delegado ao cadastro padrão.
- **Delete** é neutralizado.

O formulário trata `VK_F7` explicitamente. “Cancelar F6”, “Salvar F5” e “Imprimir F12” aparecem como contratos de interface herdado/rótulo; esta unidade não contém o código-base de teclado nem um caso local `VK_F12`, portanto a efetividade técnica do atalho F12 não pode ser atribuída a este formulário isoladamente.

Gerar fica desabilitado enquanto Salvar está habilitado, impedindo nova consulta durante edição.

### Aba Pedidos

A grade principal apresenta:

| Ordem | Campo | Título | Edição |
|---|---|---|---|
| 1 | `produto` | Produto | somente leitura |
| 2 | `descricao` | Descrição | somente leitura |
| 3 | `valorgrade1` | Linha | somente leitura; visibilidade parametrizada |
| 4 | `valorgrade2` | Coluna | somente leitura; visibilidade parametrizada |
| 5 | `data` | Data e Hora | somente leitura |
| 6 | `requisitada` | Filial | somente leitura |
| 7 | `estoquerequisitada` | Estoque | somente leitura |
| 8 | `reservaprevia` | Res. Prévia | somente leitura; visibilidade parametrizada |
| 9 | `estoquerequisitante` | Estoque | somente leitura |
| 10 | `qtdepedida` | Pedida | **editável** quando a grade não está em leitura |
| 11 | `qtderecebida` | Recebida | somente leitura |

Rótulos acima da grade agrupam visualmente as colunas de estoque/quantidade em **Requisitada** e **Requisitante**.

Abaixo há **Observações**, vinculada a `observacao`, somente leitura, limite 150 caracteres.

Linha e Coluna:

- aparecem somente quando `ParSistema.UsarGradesProdutos` está ativo;
- seus títulos são substituídos dinamicamente pelos nomes reais das grades do produto selecionado.

Reserva Prévia aparece somente quando `ParSistema.RequisicaoSubtraiEstoque` está ativo. Larguras das colunas quantitativas são ampliadas conforme `TamanhoMascaraQuantidade`.

### Edição na grade

A única coluna visualmente editável é Quantidade Pedida. Ao selecionar uma requisição:

- situação **Fechado** torna toda a grade somente leitura;
- qualquer outra situação deixa a grade não-read-only no formulário;
- as regras reais que impedem edição de situações não abertas estão no data module e serão detalhadas em **Mapear SQL, mutações, parâmetros e relatório Delphi**.

Salvar chama `GravarRequisicao` e retorna à aba/grade Pedidos. Cancelar edição fecha a tabela e volta à aba Pedidos. A grade não permite exclusão direta nem inserção de linhas; Delete é bloqueado e Incluir está oculto.

### Abas e dependência mestre–detalhe

Há duas abas:

- **Pedidos** — requisições filtradas;
- **Confirmados** — produtos confirmados ligados ao documento fiscal da requisição selecionada.

A aba Confirmados só fica visível quando a requisição selecionada está em situação **Fechado (`F`)**. Ao trocar de aba, o detalhe é recarregado para a requisição corrente. A situação **Confirmado (`D`)** colore a linha, mas não é a condição que revela essa aba.

Grade Confirmados:

| Campo | Título |
|---|---|
| `produto` | Produto |
| `descricao` | Descrição |
| `valorgrade1` | Linha |
| `valorgrade2` | Coluna |
| `grupo` | Setor |
| `descsituacao` | Situação |

Os títulos Linha/Coluna também mudam conforme o produto confirmado selecionado. O detalhe é integralmente de leitura.

### Estados visuais

Fora da célula focada, a linha de Pedidos recebe:

- Cancelado: fundo vermelho, texto preto;
- Fechado: fundo amarelo, texto preto;
- Confirmado: fundo teal, texto preto;
- Aberto: aparência normal/zebrada.

A grade usa linhas alternadas. Célula/linha focada preserva o desenho de foco em vez da cor de situação.

### Alternância escondida Data ↔ Nota/Série

`Alt+clique` no título da quinta coluna alterna:

- `data`, título “Data...”, centralizado;
- `nota_serie`, título “Nota/Serie...”, alinhado à esquerda.

É uma troca de projeção na mesma coluna, não uma coluna adicional.

### Limites observáveis da interface

- não há seleção de requisitante;
- não há criação nem pesquisa por código;
- não há ação de transferência/recebimento;
- `qtderecebida` é apenas informativa;
- cancelamento e alteração operam sobre a linha selecionada;
- impressão usa o conjunto atualmente carregado;
- a consulta precisa ser gerada antes de imprimir ou atuar sobre registros.
