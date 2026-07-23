# Inventariar dados, regras e efeitos da Autorização de Pagamentos no Delphi

Type: task
Status: resolved
Blocked by:

## Question

Quais queries, tabelas, chaves, campos, filtros, permissões, parâmetros, Filiais, usuários, transações e efeitos são usados por `dmautorizacaopagamento.pas/.dfm`, como autorização/desautorização altera Duplicatas e que consumidores ou invariantes de Quitação dependem desse estado?

## Answer

### Modelo persistido e identidade

- `CONFIRMADO`: a Autorização de Pagamento não possui tabela, entidade ou lote próprio. Ela é estado persistido em cada linha de `duplicatas`, pelos campos `autorizado` (booleano) e `dataautorizacaopagto` (data).
- `CONFIRMADO`: a duplicata é identificada pelo trio `(documentopag, datavencto, numero)`. Esse trio é usado na impressão e nos consumidores alcançáveis; `documentopag` referencia `documentospag.numero`.
- `CONFIRMADO`: autorizar grava `autorizado = true` e `dataautorizacaopagto = now()`; desautorizar grava `autorizado = false` e limpa a data. A operação é individual por duplicata, embora a tela aplique o mesmo comando a várias linhas marcadas.
- `NÃO LOCALIZADO`: identificador de lote de autorização, autorização parcial, validade/expiração, motivo, versão, revogação histórica ou vínculo persistido com o usuário autorizador.
- `POSSÍVEL BUG LEGADO`: o autorizador autenticado decide se a mutação pode ocorrer, mas sua identidade não é gravada junto aos campos da duplicata; `now()` também vem do cliente Delphi, não explicitamente do banco.

### Consulta principal e filtros

- `CONFIRMADO`: `qryDuplicatas` é uma query viva com cached updates sobre `duplicatas t`, `documentospag d`, `notaspag np` e `vfornecedores vf`; consulta ainda `filiais`, `bairros`, `cidades` e `filiaisgruposfiliais` para descrição/escopo.
- `CONFIRMADO`: invariantes comuns da lista: documento não pode ser previsão (`not coalesce(d.previsao,false)`) e duplicata deve estar aberta (`t.datapagto is null`).
- `CONFIRMADO`: Autorizar filtra `not coalesce(t.autorizado,false)` e ignora filtro de data de autorização. Cancelar/Imprimir filtra `coalesce(t.autorizado,false)` e ignora lançamento/vencimento.
- `CONFIRMADO`: filtros opcionais: emissão da nota (`np.emissao`), vencimento (`t.datavencto`), data de autorização (`t.dataautorizacaopagto`), filial de emissão, grupo de filiais e fornecedor + tipo de fornecedor.
- `CONFIRMADO`: uma ponta do intervalo preenchida vira igualdade; as duas preenchidas viram `between`. O cálculo de previsão usa valor, desconto, multa, juros, primeiro dia útil da filial e data corrente, mas não é o valor persistido pela autorização.
- `CONFIRMADO`: para usuário que não seja Administrador nem Suporte, documentos marcados `documentospag.administrador` são excluídos.
- `DIVERGENTE`: a filial é somente filtro sobre `documentospag.filialemissao`; não foi localizada neste módulo uma restrição pelas filiais autorizadas ao usuário. O Laravel não deve tratar a seleção visual de filial como autorização de acesso.

### Pesquisa auxiliar

- `CONFIRMADO`: filial vem de `filiais`, grupo de `gruposfiliais`/`filiaisgruposfiliais` e fornecedor de `vfornecedores`, preservando também o tipo (`F`, `C` ou `L`).
- `CONFIRMADO`: o filtro de fornecedor usa simultaneamente `documentospag.fornecedor` e `documentospag.tipofornecedor`; portanto, código sem tipo não é identidade suficiente.
- `POSSÍVEL BUG LEGADO`: filtros são montados por concatenação de macros SQL. A especificação Laravel deve exigir query parametrizada e validação de escopo.

### Permissão e desafio sensível

- `CONFIRMADO`: todas as três ações alcançáveis — autorizar, desautorizar e imprimir — passam por `AutorizarPagamentos` e exigem um `TtecUsuarios` com `Pagamento = true`.
- `CONFIRMADO`: se o operador logado já possui `Pagamento`, é solicitado desafio por senha (`taSENHA`); caso contrário, solicita-se outro login com o contexto `ctAUTORIZACAOPAGAMENTO` / `ctAUTORIZADO`. Depois do desafio, a capacidade `Usuario.Pagamento` é verificada novamente.
- `CONFIRMADO`: Administrador/Suporte altera visibilidade de documentos administrativos, mas não substitui a capacidade `Pagamento` para executar a ação.
- `NÃO LOCALIZADO`: permissões diferentes para autorizar versus desautorizar versus imprimir, segregação entre operador e autorizador, dupla aprovação, justificativa ou proof persistido/reutilizável.

### Parâmetro de autorização automática

- `CONFIRMADO`: `TtecParametrosSistema.AutorizacaoPagtoAutomatica` usa o texto exato `AUTORIZACAO PAGTO AUTOMATICA` em `biblio/clparametrossistema.pas`.
- `CONFIRMADO`: no Laravel, esse valor deve ser lido pelo padrão já adotado `parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')`, respeitando a ADR-0005, e convertido explicitamente para booleano.
- `CONFIRMADO`: quando ativo, caminhos de criação/recriação de duplicatas em Contas a Pagar e Entrada de Notas já nascem com `autorizado = true` e data atual; quando inativo, nascem desautorizadas e sem data.
- `OPORTUNIDADE`: a especificação deve decidir se autorização automática é uma decisão de sistema auditável distinta de uma aprovação humana, sem fabricar um proof humano.

### Transação, lote e concorrência

- `CONFIRMADO`: a tela altera todas as linhas marcadas em `qryDuplicatas` com cached updates e chama uma única vez `Perpetrar([qryDuplicatas])`; a infraestrutura aplica updates e faz commit da transação compartilhada, revertendo/cancelando updates e fazendo rollback quando ocorre exceção.
- `CONFIRMADO`: o efeito pretendido da seleção é atômico na transação, mas continua sendo uma coleção de autorizações por duplicata, não uma entidade lote.
- `NÃO LOCALIZADO`: lock explícito, versão/optimistic locking, revalidação servidor-side de `datapagto is null` e do estado esperado no instante do update, idempotency key ou retorno estruturado por item.
- `POSSÍVEL BUG LEGADO`: a elegibilidade é apurada ao abrir a query e não é explicitamente revalidada antes de gravar; outra sessão pode pagar, autorizar ou cancelar uma duplicata entre leitura e commit.

### Consumidores e invariantes de Quitação

- `CONFIRMADO`: as principais queries de Quitação de Duplicatas exigem simultaneamente documento real, `datapagto is null` e `autorizado = true`. Logo, autorizar apenas torna a duplicata elegível para tentativa de quitação; não a quita.
- `CONFIRMADO`: desautorizar remove imediatamente a duplicata dessas seleções de quitação, desde que ainda esteja aberta. Duplicata paga não é alcançável pela tela de autorização.
- `CONFIRMADO`: cancelamento/refazimento de quitação restaura a duplicata como autorizada e atualiza `dataautorizacaopagto`, para que volte a ser elegível. Outros caminhos legados de impressão também podem forçar `autorizado = true` antes de emitir a autorização.
- `DIVERGENTE`: imprimir não é operação puramente de leitura em todos os caminhos Delphi: na aba Autorizar, imprime depois de autorizar; no cadastro de Contas a Pagar, a montagem da lista de autorizações também marca registros como autorizados. O Laravel deve modelar comando e relatório separadamente ou explicitar a composição transacional.
- `CONFIRMADO`: o relatório recebe uma lista do trio-chave e relê os dados; não existe snapshot persistido do valor, fornecedor ou estado exibido na autorização.

### Invariantes para a especificação Laravel

Autorização deve ser tratada como estado/evidência por duplicata e pré-condição da Quitação, nunca como pagamento. Commands devem receber identidades canônicas, recalcular escopo e elegibilidade no servidor, bloquear pagos/previsões, checar Policies de filial e capacidade financeira, consumir proof sensível sem confiar no cliente, persistir autor e timestamps auditáveis, operar atomicamente e lidar com concorrência/idempotência. Autorizar, desautorizar e imprimir precisam de contratos distintos, ainda que a UI permita composição deliberada.
