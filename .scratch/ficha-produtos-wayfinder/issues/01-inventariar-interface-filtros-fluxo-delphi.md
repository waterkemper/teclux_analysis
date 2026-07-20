Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato completo da interface Delphi de **Estoques → Ficha de Produtos**: composição e herança do formulário, filtros e lookups, valores padrão, validações, atalhos, estados habilitado/visível, sequência de geração, abas, grids, navegação e interações entre produto, lote, movimentos e contratos?

## Answer

### Fontes e fronteira

O contrato foi reconstruído em `apps/estoque/fmconsultafichaproduto.pas/.dfm`, no ancestral `repositorio/fmcadastropadrao.pas/.dfm`, no frame `repositorio/frConsultaProduto.pas/.dfm` e nos trechos do data module necessários para explicar estados da tela. Chamadas em `fmconsultacompras.pas` confirmam a abertura contextual por produto. A semântica profunda das queries, cálculos e permissões permanece nos tickets próprios.

### Composição

- Janela MDI com título legado **Consulta Ficha do Produto**, redimensionável, minimizável e maximizável.
- Herda de `TfrmCadastroPadrao`. Procurar, Incluir e Excluir ficam invisíveis; acrescenta **Gerar F6**. **Gravar F5** começa desabilitado e só aparece para gerente de estoque.
- O topo contém o frame compartilhado de produto/lote, Filial, Tipo de Movimento, Período, **Somente Lançamentos avulsos** e o botão **Visualizar grade de Produtos por Contrato**.
- O resultado possui as abas **Movimentos** e **Lotes**, legenda dinâmica de atalhos e uma grade auxiliar retrátil por contrato.

### Filtros, defaults e validações

1. **Item de Produto:** lookup visual `produtovisual` convertido ao ID `produto`, pesquisa `pesITEMPRODUTOS`, sem inclusão. É obrigatório e recebe o foco inicial e após Esc.
2. **Lote:** lookup `nrlote` convertido ao ID `lote`, restrito ao produto. Trocar produto limpa o lote. Produto que gerencia lote/validade torna-o obrigatório e navegável por Tab; exibe fabricação e validade somente para leitura. Lote de outro produto preenche produto vazio ou pede confirmação para substituí-lo; recusa limpa lote e devolve foco. Risco: `VerificaCamposConsulta` não testa lote diretamente, então a efetividade depende do componente.
3. **Filial:** código até 5 caracteres, descrição somente leitura, pesquisa `pesFILIAIS`. Opcional para gerente; para não gerente recebe filial-base, fica desabilitada/somente leitura e perde pesquisa.
4. **Tipo de Movimento:** código até 3 caracteres, descrição somente leitura, pesquisa `pesTIPOSMOVIMENTOS`. Opcional; se informado deve existir e vira maiúsculo ao gerar.
5. **Período:** inicial padrão no primeiro dia do mês e final na data corrente. Ambas são validadas; inicial maior que final mostra `ctDTINICIALMAIORDTFINAL`. Enter/Return na final gera.
6. **Somente Lançamentos avulsos:** desmarcado por padrão. Tecnicamente seleciona movimentos com usuário de autorização preenchido; a adequação rótulo/regra será decidida depois.

### Fluxo de geração e invalidação

- Gerar ocorre pelo botão, F6 ou Enter/Return na data final.
- Após validar, envia filial, tipo, IDs de produto/lote, período e flag de avulsos ao data module, consulta, desabilita Gravar, força **Movimentos** e foca a grade.
- Alterar produto, filial, tipo ou data inicial fecha o dataset principal.
- Não há handler equivalente para data final, lote ou checkbox; o legado pode manter resultado antigo visível após esses filtros mudarem. É inconsistência, não requisito.
- A consulta insere uma linha sintética **SALDO ANTERIOR** no início; sua semântica pertence ao ticket de datasets.

### Abas e grades

**Movimentos:** aba inicial ligada a `qryFichaProduto`. Colunas: DATA, FILIAL, Nº.LOTE, MOVTO, REFERÊNCIA; visão alternativa de CLIENTE/FORNECEDOR ou indicadores; QTDE, ESTOQUE, coluna financeira alternável, CUSTO MÉDIO; RESERVADO, TRÂNSITO, DEMONSTRAÇÃO, CONSERTO, FUTURO, DANIFICADA, EST.FÍSICO, RES.PRÉVIA; COM/SEM ICMS, MOEDA, VLR MOEDA; campos de pedidos; LOGADO/NOME, AUTORIZADO/NOME e PROCESSAMENTO.

**Lotes:** ligada a `qryFichaProdutoLote`, com essencialmente as mesmas colunas por lote. Ao entrar, garante **SALDO ANTERIOR** específico de lotes.

**Produtos por contrato:** grade e splitter começam ocultos. Usa `dsrFichaProduto_Contrato` em Movimentos e `dsrFichaProdutoLote_Contrato` em Lotes. Colunas: DATA, FILIAL, MOVTO, REFERÊNCIA, QTDE, CONTRATO, SIT., DATA CONTRATO, RESERVADO EM, FATURADO EM, PRODUTO NO CONTRATO, QTDE CONTRATO, DEVOLVIDOS e TROCADOS. É detalhe contextual filtrado pelo contrato e filial da linha corrente.

### Atalhos e modos

- **F6:** gera, sobrepondo a exclusão herdada.
- **Esc:** cancela edição pelo ancestral; depois fecha a ficha, reabre auxiliares e foca produto. `LimpaControles` não limpa os textos.
- **Alt+F5**, só gerente: alterna coluna 22 entre FINANCEIRO (`financeiro`), CUSTO (`valor`) e ALÍQ. IPI (`aliquotaipi`).
- **Alt+F7:** alterna nas duas abas REFERÊNCIA; indicadores `EST/RES/TRÂ/DEM/CON/FUT/DAN/FÍS/PRV/U.ENT/U.COMP/FIN/TVEN`; ou CLIENTE/FORNECEDOR. `TCOM` existe, mas fica fora do intervalo exibido.
- **Alt+F8:** oculta/exibe as oito dimensões RESERVADO até RES.PRÉVIA; QTDE e ESTOQUE permanecem.
- Alt ou Shift + clique nos títulos de REFERÊNCIA ou financeiro faz as mesmas alternâncias quando a tabela está ativa.
- A legenda informa a próxima visão disponível, não necessariamente a atual.

### Perfis e edição

**Não gerente:** Gravar invisível; Movimentos somente leitura; filial fixa; FINANCEIRO, CUSTO MÉDIO, COM/SEM ICMS, MOEDA e VLR MOEDA ocultos nas duas abas; Alt+F5 sem efeito.

**Gerente:** Gravar visível e habilitado durante edição. Em Movimentos, preço com/sem ICMS, moeda, valor em moeda e pedidos só são editáveis quando o indicador financeiro é `+`. F5 chama `GravarMovimento`. Embora Lotes declare opção de edição, apenas Movimentos recebe `ReadOnly` por perfil e somente `qryFichaProduto` é salvo; não há evidência para edição funcional de lote.

### Abertura contextual

- `OperacaoPadrao(['Abrir', produto])` abre com produto, limpa filial e foca nela.
- Consulta de Compras usa isso para produtos de compras, similares e grade.
- Para não gerente, limpar filial conflita com a filial fixada/desabilitada no construtor; comportamento legado a revisar.

### Decisão para a futura especificação

- **Paridade obrigatória:** produto obrigatório, dependência produto–lote, período, filtros opcionais, filial por perfil, abas, saldo anterior, detalhe por contrato e conjuntos alternativos de informação.
- **Adaptação recomendada:** controles explícitos de visão/colunas no Laravel e invalidação uniforme de filtros.
- **Não copiar silenciosamente:** índices rígidos de coluna, resultado antigo após alguns filtros, `LimpaControles` que não limpa, possível falha de obrigatoriedade do lote, edição ambígua de Lotes e conflito de filial na abertura contextual.
- **Segurança a separar:** acesso ao módulo, abrangência de filiais, visualização financeira e alteração. `GerenteEstoque` acumula responsabilidades e não deve virar uma única permissão automaticamente.

### Síntese

A Ficha é consulta mestre-detalhe de Movimentos/Lotes, com saldo anterior, detalhe contextual de contratos, filtros produto–lote dependentes e correção financeira restrita. A migração deve preservar informação e regras observáveis, tornando explícitos modos de visão, invalidação e permissões hoje escondidos em atalhos, índices de coluna e em `GerenteEstoque`.
