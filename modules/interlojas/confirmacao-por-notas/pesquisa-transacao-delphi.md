# Pesquisa — transação de confirmação por notas no Delphi

## Escopo

Reconstrução baseada em `dmconfirmarnotastransferencia.pas/.dfm` e no chamador `fmconfirmarnotastransferencia.pas/.dfm`, em `C:\projetos.vcl\apps\interlojas`. Referências são `arquivo:linha`. `Perpetrar`, `CalcularImpostos`, `AtribuirDadosProdutos` e funções PostgreSQL são caixas-pretas porque seus corpos não estão nessas fontes.

## Evidência do legado

### Elegibilidade, seleção e autorização

- A consulta oferece documentos destinados à `FilialBase`, `tipocliente='L'`, situação `N`, com CFOP de transferência/devolução ou `vendatransferencia`. Exige pedidos `F` e igualdade, por produto, entre quantidade fiscal e `qtderecebida`; o período entra pela macro `$SQL`. (`dmconfirmarnotastransferencia.dfm:24-127`; `dmconfirmarnotastransferencia.pas:827-841`)
- `selecionar` é local. Duplo clique, Ctrl+Espaço, chave NF-e ou série/número marcam várias notas; Confirmar exige marcados. Não existe seleção parcial de itens. “CONFIRMADA PARCIAL” é só situação/colorização do romaneio. (`dmconfirmarnotastransferencia.dfm:42-72`; `dmconfirmarnotastransferencia.pas:690-799,863-868`; `fmconfirmarnotastransferencia.pas:94-101,137-168,214-220,311-355`)
- O chamador obtém autorização por senha/login conforme `TransferenciaPorItem` e passa `CodigoUsuario`. A condição literal para executar é `Assigned(User) and not User.TransferenciaPorItem`, aparentemente contraintuitiva; deve ser validada na classe de usuário. (`fmconfirmarnotastransferencia.pas:236-254`)
- Uma confirmação modal precede o loop; cancelar não inicia alterações. (`dmconfirmarnotastransferencia.pas:401-409`)

### Sequência completa por nota

1. Recarrega cabeçalho fiscal e produtos por `dadofiscal`; para venda/transferência também vencimentos. (`dmconfirmarnotastransferencia.pas:412-424`; `dmconfirmarnotastransferencia.dfm:835-855,970-984,1151-1165`)
2. Abre datasets cached vazios para nota, itens, movimentos e, quando aplicável, documentos/duplicatas. (`dmconfirmarnotastransferencia.pas:801-825`; `dmconfirmarnotastransferencia.dfm:303-334,592-615,680-718,1192-1206,1350-1366`)
3. Inclui `notaspag` com `notaspag_proximocodigo()`: fornecedor filial origem, série/número, destino, modelo, chave, emissão, data do servidor, CNPJ/IE, totais fiscais e observações; grava situação `N`, `vendatransferencia=true`, `dadofiscalreferenciado` e escolhe natureza por venda, devolução ou transferência. (`dmconfirmarnotastransferencia.pas:599-688`; `dmconfirmarnotastransferencia.dfm:620-632`)
4. Inclui todos os itens, ligando nota, número do item, filial/filial de estoque, produto e dado fiscal; os demais atributos vêm de `AtribuirDadosProdutos`. (`dmconfirmarnotastransferencia.pas:690-799`)
5. Em `vendatransferencia`, inclui `documentospag` com novo número, fornecedor, emissão, complemento série/número, filial, valor, evento parametrizado, data e administrador. Cria duplicata por vencimento, preservando número da parcela; forma `T` ou venda/transferência nasce paga/autorizada. Duplicata usa `UsuarioLogin.CodigoUsuario`; a nota recebe o documento. (`dmconfirmarnotastransferencia.pas:926-1004`; `dmconfirmarnotastransferencia.dfm:1151-1190,1460-1472`)
6. Executa `CalcularImpostos`. Se falso, não chama commit, não apresenta erro próprio e segue; não há descarte explícito dos cached updates aqui. (`dmconfirmarnotastransferencia.pas:431-448`)
7. Em sucesso, monta uma cadeia textual de pares produto/filial e abre `estoques ... FOR UPDATE`. (`dmconfirmarnotastransferencia.pas:371-399`; `dmconfirmarnotastransferencia.dfm:640-662`)
8. Para cada item, cria `STC` pela quantidade total, com referência da NF, valor quantidade × preço, nota e item. Se `futuro > 0`, cria `FTR` por `min(futuro,quantidade)`. Números vêm de `movimentos_proximonumero()`. Estoque não localizado faz o item ser silenciosamente ignorado. (`dmconfirmarnotastransferencia.pas:530-596,844-854`; `dmconfirmarnotastransferencia.dfm:680-827`)
9. Carrega pedidos `F`, muda para `D` os do produto e subtrai `qtderecebida`; sucesso exige cobrir a quantidade. O acumulador é suspeito: não é claramente reiniciado por produto e `ProdAnt` nunca muda. (`dmconfirmarnotastransferencia.pas:327-369`; `dmconfirmarnotastransferencia.dfm:1004-1024`)
10. Se pedidos não fecham, troca o predicado de estoque para `false`, chama `Perpetrar([])` para liberar locks e avisa. Não há rollback/cancel explícito dos cached updates. (`dmconfirmarnotastransferencia.pas:439-445,1006-1010`)
11. Em sucesso, `Perpetrar([documentos, duplicatas, nota, movimentos, produtos, pedidos])` é o commit principal observável de uma nota. (`dmconfirmarnotastransferencia.pas:448-451`)
12. Só depois, havendo romaneio, grava `ROS` e commita; grava `ROE` e commita; atualiza situação e commita; então abre/reabre o cadastro de romaneio. (`dmconfirmarnotastransferencia.pas:452-482`; `dmconfirmarnotastransferencia.dfm:1480-1523`)

Ao final refaz a consulta e zera marcados. `Result` é sobrescrito por nota, não sendo resultado agregado confiável. (`dmconfirmarnotastransferencia.pas:412-495`)

### Transação, falhas e efeitos

- Os queries compartilham `dtmTecSoft.tstTecSoft`, mas confirmação principal e três passos do romaneio têm commits independentes. Falha posterior pode deixar romaneio incompleto. (`dmconfirmarnotastransferencia.dfm:8-10,642-644,682-684,1481-1507`; `dmconfirmarnotastransferencia.pas:448-478`)
- Só estoque recebe `FOR UPDATE`, após preparação fiscal; não há lock/revalidação visível de origem, pedidos ou romaneio. (`dmconfirmarnotastransferencia.pas:418-437`; `dmconfirmarnotastransferencia.dfm:640-662,1004-1024`)
- Não há guarda idempotente visível. Corridas podem duplicar nota, itens, financeiro e movimentos. `dadofiscalreferenciado` é candidato à identidade. (`dmconfirmarnotastransferencia.pas:625-686`)
- Não há `except`; o `finally` só restaura cursor/controles. Rollback e limpeza cached não aparecem. (`dmconfirmarnotastransferencia.pas:401-496`)
- Autoria diverge: romaneio usa autorizador; duplicata e administrador usam login global; demais registros não recebem autoria explícita. Efeitos externos incluem mensagens, refresh e abertura do formulário. (`dmconfirmarnotastransferencia.pas:456-495,949,989`)

## Requisitos recomendados para Laravel

### Atomicidade e invariantes

- Uma transação PostgreSQL por nota, com resultado individual (`confirmed`, `already_confirmed`, `rejected`, `failed`). Tornar atômicos nota, itens, financeiro, movimentos, pedidos e romaneio quando no mesmo banco.
- Sob transação revalidar destino, elegibilidade, ausência de confirmação, pedidos `F`, somas exatas por produto, toda linha de estoque, natureza/evento e vencimentos. Confirmar nota inteira; não inventar parcial por item.
- Usar `DB::transaction(..., attempts: N)` e exceções para rollback. UI/notificações só após commit.

### Locks e N+1

- Lock determinístico: origem, pedidos por PK, estoques por `(filial,produto)`, romaneio; usar `lockForUpdate()` e repetir invariantes após locks.
- Carregar pedidos/estoques em lote com `whereIn`, `ANY(?::bigint[])` ou chaves compostas via `unnest`/`VALUES`; nunca uma query por item. Substituir a cadeia `OR` por parâmetros tipados, ordenar chaves e falhar se faltar linha. Não reproduzir o `Locate` silencioso ou acumulador ambíguo.

### Idempotência

- Criar unique de domínio, preferencialmente `notaspag(dadofiscalreferenciado,filial)`, após confirmar cardinalidade; também itens `(codigonota,numeroprodutotabela)`, movimentos por confirmação/item/tipo, documento da nota, duplicata `(documentopag,numero)` e conferência `(tipo,romaneio,filial,dadofiscal)`.
- Persistir idempotency key com usuário, hash canônico e resposta. Mesma chave/hash devolve resposta; payload diferente conflita. Em corrida de unique, reler e retornar `already_confirmed` só se conteúdo coincidir.

### Autoria, recuperação e reconciliação

- Persistir `requested_by_user_id` e `authorized_by_user_id`, timestamp, filial, idempotency/correlation id.
- Se romaneio ficar fora da transação, usar outbox transacional e consumidor idempotente com `pending/completed/failed`, tentativas e erro, em vez de três commits sem estado.
- Reconciliação reexecutável deve detectar entrada sem itens, movimentos ausentes, pedido não concluído, financeiro divergente, ROS sem ROE, romaneio não atualizado e autoria ausente; corrigir só idempotentemente ou sinalizar intervenção.
- Testar concorrência na mesma nota, lotes sobrepostos, deadlock/retry, falha em cada estágio, timeout/repetição, alteração após listagem, falha do romaneio, venda com vencimentos, estoque ausente e sucesso parcial entre notas.

## Pendências antes de codificar

Inspecionar as caixas-pretas citadas; confirmar `TransferenciaPorItem`; inventariar constraints; confirmar triggers/semântica de `STC`/`FTR`; decidir se ROS/ROE cabem na transação ou exigem outbox.
