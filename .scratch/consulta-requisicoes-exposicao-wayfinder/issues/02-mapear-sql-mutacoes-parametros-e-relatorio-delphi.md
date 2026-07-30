# Mapear SQL, mutações, parâmetros e relatório Delphi

Type: task
Status: resolved
Blocked by:


## Question

Quais SQLs, macros de período/situação, regras de filial, joins, ordenações, filtros locais, atualizações de quantidade, cancelamento, movimentos TEP/TPE/TFR, parâmetros, autorizações e contrato de impressão são executados por `dmconsultarequisicaoexposicao.pas/.dfm`?

## Answer

### Consulta principal e filial

`qryPedidosFiliais` é viva (`RequestLive = True`) sobre `pedidosfiliais pf`, `produtos p`, `filiais f` e `left join notas n`. `:requisitante` recebe `FilialBase`; não existe seleção de requisitante nem filtro por filiais autorizadas do usuário.

Para a requisitada, `filial_estoque` é `coalesce(f.filial_estoque, f.codigo)` quando `tipofilial = 'V'`, senão `f.codigo`. Esse código é usado nos saldos, bloqueio e movimentos; o estoque requisitante usa diretamente `pf.requisitante`. O SQL ordena exatamente por `pf.requisitada, pf.produto`, ambos ascendentes: primeiro código da filial requisitada, depois código do produto.

### Período, situação e detalhe confirmado

`%Periodo` recebe texto SQL: igualdade quando só uma data está preenchida, `cast(pf.data as date) between inicial and final` quando há duas, e vazio sem datas. As datas são interpoladas, não bindadas. `%Situacao` traduz `0/1/2/3` em `A/F/D/C`. `Filtered = True` e `OnFilterRecord` repetem localmente a igualdade de situação.

`qryPedidosConfirmados` recebe o `dadofiscal` do registro principal e faz inner join com produto e característica. Retorna produto, descrição, grupo/setor, grades e descrição `FECHADO`/`CONFIRMADO`. Não tem `ORDER BY`; produto sem característica correspondente pode ser omitido.

### Edição e movimentos

Inserção é abortada e edição só começa em situação `A`. `qtdepedidaantiga` é inicialmente um alias de `qtdepedida`. A alteração dispara validação, post e persistência imediata.

Com `REQUISICAOSUBTRAIESTOQUE` falso, somente `pedidosfiliais` é persistida. Com verdadeiro, aplica literalmente `estoquerequisitada < (nova - antiga) - qtderecebida`, restaura a antiga se faltar estoque, bloqueia produto/`filial_estoque` em `estoques ... FOR UPDATE`, numera movimentos por `movimentos_proximonumero()`, perpetra requisição e movimentos juntos e relê estoque/reserva prévia.

- aumento: `TEP` por `nova - antiga`, de estoque para reserva prévia;
- redução: `TPE` por `antiga - nova`, devolvendo reserva prévia;
- redução com `futuro <> 0`: também `TFR` por `min(futuro, antiga - nova)`, referência `REQUISICAO <codigo> QTDE NAO CONFIRMADA`, destinando ao reservado a parcela da venda futura.

`qtderecebida` só participa da fórmula literal de validação; não cria requisição parcial.

### Cancelamento

É exclusão lógica apenas para situação `A`. A confirmação pode exigir motivo; concatena o texto à observação, grava `motivo`, muda para `C`, limpa `qtderecebida` e mantém a linha.

Com subtração de estoque, bloqueia a linha e cria `TPE` pela `qtdepedida` integral — a subtração de `qtderecebida` está comentada — com referência `EXCLUSAO REQUISICAO <codigo>`. Havendo futuro, cria `TFR` por `min(futuro, qtdepedida)`, preservando reservado para a venda futura. O módulo não valida explicitamente se a reserva prévia ainda cobre o TPE; confia no processamento dos movimentos.

### Parâmetros e autorização

Descrições literais de `clparametrossistema.pas`:

- `REQUISICAOSUBTRAIESTOQUE`: validação, bloqueio e movimentos;
- `Informar o motivo do cancelamento do pedido`: exigência do motivo;
- `USAR GRADES PRODUTOS`: apresentação das grades;
- `Máscara Quantidade`: máscara e largura das quantidades.

Não há uso local de `UsuarioLogin`, `ObterAutorizacao`, permissão específica ou filiais autorizadas. As barreiras locais são Filial Base, situação aberta e estoque. Eventual autorização do menu está fora destas unidades e não deve ser presumida como regra deste módulo.

### Impressão

Imprime o `qryPedidosFiliais` aberto e filtrado; não refaz consulta nem imprime Confirmados. O FastReport usa preview modal, recebe `Rua`, `Bairro` + CEP, `Cidade` + UF, `Fone` e `Outras` (razão social) da Filial Base e aplica zebramento.

O layout `REQUISIÇÕES DE MERCADORIAS` exibe filial requisitada, produto/código, descrição/grades, referência, ABC, lote quando não zero, quantidade solicitada e confirmada (`qtderecebida`), data e página. Segue a ordem requisitada/produto.
