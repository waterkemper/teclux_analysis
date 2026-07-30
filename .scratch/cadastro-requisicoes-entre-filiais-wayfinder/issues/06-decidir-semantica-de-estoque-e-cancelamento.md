# Decidir a semântica de estoque, concorrência e cancelamento

Type: grilling
Status: resolved
Blocked by: 02, 03

## Question

Como o Cadastro Laravel deve tratar reserva ou débito imediato de estoque, revalidação concorrente, movimentos de criação e reversão, alteração de quantidade, duplicidade e cancelamento, preservando compatibilidade com `pedidosfiliais` e com requisições originadas na Consulta de Compras?

## Answer

### Modo de estoque

Resolver `REQUISICAOSUBTRAIESTOQUE` pela filial ativa da sessão no servidor em cada criação, edição e cancelamento, inclusive se o valor tiver mudado desde a criação. Com o parâmetro desligado, gravar apenas `pedidosfiliais`; com ele ligado, requisição e movimentos formam uma única transação.

Foi deliberadamente descartada a inferência do modo original pelo histórico de movimentos. Aceita-se a mesma dependência temporal do Delphi: o valor atual do parâmetro governa a operação.

TEP transfere a quantidade de `emestoque` para `reservaprevia`, garantindo a Requisição entre Filiais. Antes de criar ou aumentar, bloquear o estoque físico da requisitada, reler `emestoque` e exigir saldo suficiente depois do `FOR UPDATE`. Falta de saldo aborta tudo.

### Liberação, venda futura e inconsistência de reserva prévia

Ao reduzir, trocar ou cancelar, liberar no máximo a reserva prévia realmente disponível:

```text
quantidade_liberavel = min(quantidade_a_liberar, reservaprevia_atual)
para_reservado = min(futuro, quantidade_liberavel)
para_estoque = quantidade_liberavel - para_reservado
```

TPE libera a Reserva Prévia. Havendo Venda Futura, TFR direciona a parcela `para_reservado` para `reservado`, reduzindo a necessidade futura; somente o restante volta a `emestoque`.

Se uma movimentação avulsa tiver reduzido `reservaprevia` abaixo do esperado, a operação prossegue com o saldo disponível. A transação grava a alteração/cancelamento e a interface mostra alerta persistente com quantidade esperada, quantidade movimentada e diferença, solicitando conferência do estoque.

### Edição

- aumento da quantidade: TEP somente da diferença, com saldo pós-lock suficiente;
- redução: liberar somente a diferença, limitada pela Reserva Prévia disponível e preservando `futuro → reservado`;
- troca de produto ou requisitada: liberar o antigo segundo a regra acima e reservar a nova quantidade inteira;
- troca é atômica: se o novo estoque não suportar o TEP, nenhuma liberação antiga nem mudança da requisição é confirmada;
- quantidade inalterada não gera movimento.

Quando houver mais de uma chave de estoque, bloqueá-las em ordem determinística de produto e filial para evitar deadlock. Filial virtual usa a filial física resolvida por `filial_estoque`.

### Cancelamento

Permitir cancelar somente situação `A`, independentemente do valor de `qtderecebida`. A verificação em `dmtransferenciarequisicaoexposicao.pas` confirmou que `qtderecebida` é quantidade preparada para a transferência enquanto a requisição ainda está aberta, não envio parcial: ao concluir o fluxo, a situação muda para `F`.

No cancelamento:

- usar `qtdepedida` inteira como quantidade esperada para liberação;
- aplicar o limite da Reserva Prévia disponível e a prioridade da Venda Futura;
- limpar `qtderecebida`;
- gravar situação `C`, observação e motivo;
- persistir requisição, TPE e eventual TFR atomicamente.

### Concorrência

Usar `pedidosfiliais.datahoraalteracaousuario` como token compatível com Delphi. Na edição/cancelamento:

1. bloquear a requisição com `FOR UPDATE`;
2. reler situação, produto, participantes, quantidade e token;
3. abortar sem movimentos se o registro divergir do carregado;
4. bloquear estoques em ordem determinística;
5. revalidar saldos depois dos locks;
6. atualizar `datahoraalteracaousuario` na mesma transação.

Retornar conflito de concorrência para recarregar a ficha, sem copiar a reserva antecipada de edição do Delphi.

Quando duplicatas estiverem proibidas, adquirir lock transacional determinístico para a tríade `(produto, requisitante, requisitada)` antes de verificar a aberta. Em PostgreSQL, usar `pg_advisory_xact_lock`; em testes SQLite, substituto determinístico. Consulta de Compras soma conforme seu comando; Cadastro abre a existente sem somar.

### Compatibilidade dos movimentos

Padronizar novos movimentos Laravel com as referências Delphi:

- TEP, ajustes e TFR: `REQUISICAO <codigo>`;
- TPE de cancelamento: `EXCLUSAO REQUISICAO <codigo>`.

Não reescrever movimentos antigos `REQ <codigo>`. Preservar `usuariologado`, `trffilial` e numeração pela função/sequence legada; não usar `max + 1` em PostgreSQL.
