Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato funcional completo de Estoques → Lançamentos Avulsos no Delphi: menu e Permissões, campos e defaults, Produto/Filial/Lote/lookups, abas e grids de contexto, Tipos de Movimento aceitos, habilitação dinâmica pela string `operacao`, validações de quantidade/financeiro/data/estoque negativo, inclusão/alteração/exclusão/transferência, Produtos compostos, Auditoria/Usuários e SQL/datasets efetivamente gravados?

## Answer

### Identidade e natureza do módulo

O menu principal exibe **Estoque → Lançamentos Avulsos** e instancia `TfrmLancamentosManuais`, implementado por `fmlancamentosmanuais` e `dmlancamentosmanuais`. A caption interna ainda é “Lançamentos Manuais em Estoque”; os dois nomes designam o mesmo módulo.

Apesar de herdar `TfrmCadastroPadrao`, o fluxo efetivo é de **inclusão de um novo Movimento**, não manutenção livre de Movimentos existentes:

- o botão Procurar fica oculto;
- o botão Excluir fica oculto;
- ao tentar gravar um dataset em `dsEdit`, se não estiver no estado técnico de reentrada após rollback, o código simplesmente cancela a edição;
- `Incluir` abre `qryMovimentos` vazio (`numero=0`), insere uma linha e preserva Filial, Tipo, Data e Referência usados no lançamento anterior;
- `Salvar` valida, autoriza e posta um novo registro em `movimentos`;
- Escape fecha/reinicializa os datasets de contexto.

Portanto, alteração e exclusão não são operações funcionais expostas nesta tela, embora o dataset herdado possua handlers genéricos e `RequestLive`. O Laravel não deve transformar essa herança técnica em requisito de editar/excluir.

### Campos de entrada e defaults

| Campo | Origem/destino | Regra Delphi |
|---|---|---|
| Produto | `movimentos.produto`, visual por `produtos.codigovisual` | Obrigatório; frame compartilhado de Produto; Produto deve possuir linha em `estoques` na Filial. |
| Lote | `movimentos.loteproduto`, visual `lotes.nrlote` | Obrigatório somente se o Produto gerencia Lote/validade; datas de fabricação/validade aparecem pelo lookup. |
| Filial | `movimentos.filial` | Obrigatória; default FilialBase e depois preserva a última Filial digitada. A consulta Delphi lista todas as Filiais sem escopo explícito de Usuário. |
| Tipo de Movimento | `movimentos.tipomovimento` | Obrigatório; preserva o último tipo; aceita somente `tiposmovimentos` não internos e cuja `operacao` não seja vinte `*`. |
| Data | `movimentos.data` | Obrigatória; novo registro recebe `DataHoraLocal`, depois preserva a última data digitada. O controle limita retroatividade pela Data Contábil/Dias de Nota Retroativa. |
| Referência | `movimentos.referencia` | Opcional, até 60 caracteres; preserva o último valor. |
| Filial para Transferência | gravada como `movimentos.trffilial` | Habilitada somente quando o Tipo possui `transferencia`; obrigatória nesse caso; deve ser diferente da Filial de origem e o Produto deve existir no Estoque de destino. |
| Quantidade | `movimentos.quantidade` | Campo não negativo; habilitação depende da string `operacao`; não pode ser zero quando alguma posição de quantidade usa `+`/`-`. |
| Valor | `movimentos.valor` | Duas casas; habilitação depende do Financeiro; pré-preenchido com Custo Médio ou Última Compra. |
| Preço com ICMS | `movimentos.precocomicms` | Duas casas; pré-preenchido do Estoque; habilitado junto das regras financeiras observadas. |
| Preço sem ICMS | `movimentos.precosemicms` | Duas casas; mesma regra. |
| Última compra | `movimentos.valorultimacompra` e UPDATE direto em `estoques` | Editável somente quando a posição 11 de `operacao` é `=` e o Produto não é composto. |
| Usuário logado | `movimentos.usuariologado` | Recebe o Usuário que operou a tela. |
| Usuário de autorização | `movimentos.usuarioautorizacao` | Recebe o Gerente de Estoque autenticado quando houve autorização separada. |

O `numero` é obtido antes do post por `movimentos_proximonumero()`.

### Produto, Lote e Produtos compostos

O frame `TfraConsultaProduto` fornece lookup de Produto e Lote. O Produto visual é convertido para a identidade interna. Quando a Característica possui `gerenciarloteevalidade=true`, `nrlote` e `loteproduto` tornam-se obrigatórios; a tela mostra fabricação e validade do Lote e consulta `estoqueslotes` para Produto+Lote+Filial.

O Parâmetro `lançamentos avulsos de produtos compostos` decide se a pesquisa aceita Características compostas. Quando desativado, a macro adiciona `not coalesce(c.composto,false)`. Quando ativado, a restrição é removida. A tela não decompõe o Produto por conta própria; eventuais Movimentos de componentes pertencem à cadeia do banco e devem ser confirmados pelas triggers.

Se a posição de Última Compra da operação for `=`, Produto composto torna esse campo readonly mesmo quando compostos estão liberados.

### Tipos de Movimento e string `operacao`

O lookup aceita:

```sql
select codigo, descricao, transferencia, operacao
from tiposmovimentos
where not interno
  and operacao <> '********************'
```

A string possui 20 posições, alinhadas ao enum `TtecOperacaoEstoque`; a posição zero do enum é vazia e os caracteres usados pelo módulo começam em 1:

| Posição | Semântica |
|---:|---|
| 1 | Em estoque |
| 2 | Reservado |
| 3 | Trânsito |
| 4 | Demonstração |
| 5 | Conserto |
| 6 | Futuro |
| 7 | Danificada |
| 8 | Estoque físico |
| 9 | Reserva prévia |
| 10 | Última entrada |
| 11 | Última compra |
| 12 | Financeiro |
| 13 | Totaliza venda |
| 14 | Totaliza compra |
| 15–20 | Reservadas/sem nome funcional no enum atual |

Os caracteres observados incluem `+`, `-`, `=`, `*`, `C` e vazio/espaço. A interpretação integral pertence às triggers; na tela:

- Quantidade é desabilitada quando existe `*` entre Em estoque e Reserva prévia;
- Valor/Preço são desabilitados quando Financeiro contém `*` ou `C`;
- há uma segunda atribuição para Preços baseada em Última Compra `=`, criando uma interação contraditória: Preços podem ser habilitados pela posição 11 mesmo depois da regra Financeiro;
- Última compra só é editável quando posição 11 é `=`;
- Quantidade zero é rejeitada se houver `+`/`-` nas posições 1–9 ou 16–17;
- Financeiro zero é rejeitado, conforme Parâmetro, quando o fluxo financeiro exige valor.

A UI não é fonte suficiente para interpretar todos os caracteres/posições; o contrato definitivo deve vir das triggers.

### Validação de Estoque e negativo

Antes de postar, `ExisteEstoque` exige uma linha `estoques(produto, filial)`. Para as posições 1–7, quando o caractere é `-`, compara a Quantidade digitada com o saldo atual correspondente e bloqueia se insuficiente. A mensagem identifica Estoque, Reservada, Trânsito, Demonstração, Conserto, Futuro ou Danificada.

Limitações do legado:

- valida apenas as posições 1–7, não Estoque físico nem Reserva prévia;
- valida na aplicação antes do post, sujeita a corrida entre Usuários;
- consulta Estoque por Filial sem demonstrar autorização server-side;
- não usa `comexcecaosenegativo` nem `usuarioautorizacao` como fluxo explícito de exceção de negativo nesta tela;
- Lote é obrigatório quando gerenciado, mas esta função compara o Estoque agregado e não o saldo do Lote.

O Laravel deve antecipar mensagens úteis, porém a garantia concorrente precisa permanecer transacional no banco.

### Data Contábil

O controle recebe limite calculado por `NDiasLimiteLancto`:

- quando existe Data Contábil: `DaysBetween(DataLocal, DataContabil) - 1`;
- caso contrário: `DiasNotaRetroativa`.

Também existe mensagem padronizada quando a data digitada é menor ou igual à Data Contábil. A restrição real depende do comportamento do componente `TDBEditData`; o Laravel deve especificar validação server-side explícita e usar data/hora do servidor, não confiar somente em limite visual.

### Permissão e autorização

Na gravação, `PermitirLancamentoAvulso` sempre registra o Usuário logado. Se o Parâmetro `Exigir Senha em Lançamentos Avulsos` estiver ativo **ou** o Usuário logado não for Gerente de Estoque, abre autorização por login com motivo “Para lançamento avulso” e exige outro/um Usuário com `GerenteEstoque`.

Se o Usuário logado já é Gerente de Estoque e o Parâmetro não exige senha, grava sem autorização adicional. Quando há autenticação, `usuarioautorizacao` recebe o código do autorizador.

O acesso ao menu passa pelo framework genérico de menus/formulários; não foi localizada nesta unit uma checagem específica adicional na abertura. A autorização material ocorre no Salvar. Para Laravel, visibilidade do menu, acesso ao módulo, capacidade de criar Movimento e eventual prova contextual devem ser decisões separadas.

### Gravação e transação

O dataset posta somente as colunas selecionadas de `movimentos`; as colunas de efeito (`emestoque`, `reservado`, `financeiro` etc.) não são calculadas pela tela. A tela envia principalmente identidade, Data, Tipo, Quantidade, Valor, Preços, Referência, transferência, Lote e Usuários. As triggers preenchem os deltas/snapshots e atualizam as projeções.

O fluxo normal:

1. valida campos e autorização;
2. valida Filial de transferência e existência do Estoque destino;
3. valida Estoque origem;
4. obtém próximo número;
5. atribui Usuários;
6. opcionalmente atualiza Última Compra;
7. posta `movimentos`;
8. aplica a transação e recarrega últimos Movimentos, Estoque e Estoque por Lote.

Para operações financeiras comuns, a tela primeiro mantém uma transação pendente, compara Custo Médio anterior e posterior e pede confirmação se mudou. Confirmando, comita; recusando, faz rollback e reconstrói o lançamento em edição com flag local `insercaocancelada`. Para operações Financeiro `*`/`C`, comita diretamente.

Esse diálogo pós-trigger é uma regra de UX sobre o efeito calculado, não autorização do banco. No Laravel, não se deve manter transação HTTP aberta esperando uma segunda interação; a decisão futura precisa escolher preview/confirm ou confirmação prévia com contrato explícito.

### Última compra: defeito confirmado

Quando editável, `GravarValorUltimaCompra` executa antes do post:

```sql
update estoques
set valorultimacompra = :valor
where produto = :produto
```

Não há filtro por Filial. Isso altera todas as Filiais do Produto e é um defeito a não reproduzir. Também é uma escrita paralela às triggers e chega a ser perpetrada separadamente, o que exige cuidado com atomicidade. No Laravel, qualquer alteração de Última Compra deve ser explicitamente Produto+Filial e transacional, ou delegada ao contrato correto da trigger se ela já implementar a posição 11.

### Abas e contexto exibido

A tela mostra três abas com até 10 Movimentos anteriores do Produto+Filial, ordenados por `movimentos.numero desc`:

- **1 - Movimentos**: Data, Tipo, Nº Lote, Referência, Quantidade, Em estoque, Valor e Financeiro;
- **2 - Quantidades**: Data, Tipo, Nº Lote, Em estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro e Danificada;
- **3 - Valores**: Data, Tipo, Nº Lote, Valor, Financeiro, Preço com ICMS e Preço sem ICMS.

Há dois painéis adicionais:

- **Valores atuais**: Custo Médio, Financeiro, Preço com ICMS, Preço sem ICMS e Última Compra da linha `estoques`;
- **Quantidades do Produto**: Em estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Reserva prévia e Estoque físico;
- **Quantidades do Lote**: os mesmos nove saldos da linha `estoqueslotes` para Produto+Lote+Filial.

O Custo Médio visual é `financeiro / (emestoque + reservado + transito + demonstracao + conserto + danificada + reservaprevia)` quando o denominador é positivo; Futuro e Estoque físico não entram.

### Lookups e falhas de escopo

- Tipo: somente não interno e operação diferente do sentinela de 20 asteriscos.
- Produto: frame compartilhado; compostos condicionados por Parâmetro.
- Lote: frame compartilhado, condicionado a gerenciamento de Lote.
- Filiais: `select codigo,nome from filiais order by nome normalizado`, sem filtro de Filiais do Usuário.
- Filial de transferência: lookup por código, também sem prova de autorização.

No Laravel, ambos os lados da transferência devem ser Filiais autorizadas server-side. Produto e Lote devem existir/coincidir com Produto+Filial conforme o contrato do banco.

### Legado a não reproduzir

- permitir Filiais não autorizadas por lookup global;
- confiar em validação de saldo apenas na memória/UI;
- atualizar Última Compra em todas as Filiais;
- manter transação aberta aguardando confirmação do Usuário;
- expor edição/exclusão só porque o form herda Cadastro;
- duplicar em PHP/Laravel os deltas que as triggers já calculam;
- gerar número fora do mecanismo canônico sem avaliar concorrência;
- gravar log SQL em `c:\lancamentosprodutos.sql`;
- usar estado técnico `insercaocancelada` como contrato de domínio;
- depender de habilitação contraditória entre Financeiro e Última Compra;
- aceitar Tipo interno/sentinela ou string `operacao` enviada pelo navegador;
- alterar `estoques` diretamente fora do contrato transacional do Movimento.

### Evidências principais

- `fmlancamentosmanuais.pas/.dfm`: menu visual da tela, campos, habilitação, validação e abas.
- `dmlancamentosmanuais.pas/.dfm`: queries, inclusão, autorização, gravação, rollback, Última Compra, Estoque e Lotes.
- `frConsultaProduto.pas/.dfm`: Produto e Lote compartilhados.
- `fmtecsoft.dfm` e `rgestoque.pas`: item de menu e registro do formulário.
- `ctconstantes.pas`: posições da string `operacao` e nomes dos totalizadores.
- `dmbasico.pas`: limite de Data Contábil e confirmação genérica de exclusão.
- `clparametrossistema.pas`: Parâmetros de senha, financeiro zero e Produtos compostos.
