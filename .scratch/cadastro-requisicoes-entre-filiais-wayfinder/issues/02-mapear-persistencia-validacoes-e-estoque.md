# Mapear persistência, validações e efeitos de estoque

Type: task
Status: resolved
Blocked by:

## Question

Quais tabelas, queries, parâmetros do sistema, validações, estados de `pedidosfiliais`, transações, bloqueios pessimistas e movimentos de estoque são lidos ou gravados pelo Cadastro de Requisições, incluindo inclusão, alteração e cancelamento, e quais invariantes o Delphi efetivamente impõe?

## Answer

### Persistência e fontes

A entidade gravada é uma linha de `pedidosfiliais`, localizada por `(requisitante, codigo)`. A query grava `codigo`, `codigoorigem`, `produto`, `requisitante`, `requisitada`, `data`, `qtdepedida`, `qtderecebida`, `situacao`, `dadofiscal`, `observacao` e `motivo`.

O código vem de `pedidosfiliais_proximocodigo()`; movimentos usam `movimentos_proximonumero()`. `pedidosfiliais_log` não é escrito explicitamente aqui; a auditoria parece ser infraestrutura/trigger e será tratada no ticket próprio.

Também lê `filiais`, `estoques`, `produtos`, `caracteristicas`, `produtoscodigobarras`, `notas`, `pedidosfiliais` e `movimentos`. Filial virtual (`tipofilial = 'V'`) resolve saldo/movimentos em `filial_estoque`, com o próprio código como fallback.

### Parâmetros

- `Transferir_Produtos_Compostos`: filtra compostos.
- `Permitir_Requisicoes_de_Produtos_Duplicadas`: controla múltiplas abertas para produto–requisitante–requisitada.
- `RequisicaoSubtraiEstoque`: liga movimentos imediatos.
- `InformarMotivoCancelamentoPedido`: exige motivo no cancelamento.
- `UsarGradesProdutos`: apenas apresentação da pesquisa.

### Estados e invariantes

Cria em `'A'`; somente `'A'` é editável/cancelável. A projeção mapeia `'F'` fechada, `'D'` confirmada e demais cancelada; cancelar grava `'C'`.

São obrigatórios data, requisitante, requisitada, produto/código visual, quantidade e situação. Requisitante ≠ requisitada. Produto deve existir no estoque da requisitada e compostos podem ser bloqueados. Quantidade não aceita negativo na UI nem nulo, mas não existe validação explícita `qtdepedida > 0`, portanto zero não está inequivocamente proibido. Cancelamento é lógico, nunca `DELETE`.

Se duplicatas são proibidas, procura uma aberta para a mesma tríade. Ao encontrar durante inclusão, pergunta se deseja alterar e navega para a existente; **não soma automaticamente**. Isso difere da geração em lote da Consulta de Compras.

### Sem movimento imediato

Com `RequisicaoSubtraiEstoque = false`, inclusão/edição gravam somente `pedidosfiliais`; troca de produto/filial apenas atualiza a linha; cancelamento muda para `'C'`, registra motivo, limpa `qtderecebida` e não movimenta estoque.

### Com movimento imediato

`qryEstoqueBloqueio` executa `FOR UPDATE` em `(produto, filial_estoque)`. Requisição e movimentos usam cached updates e são entregues juntos a `Perpetrar`, que aplica e confirma a transação; exceções seguem rollback.

- `TEP`: debita estoque da requisitada.
- `TPE`: credita/devolve estoque.
- `TFR`: quando existe `futuro`, direciona parte devolvida à reserva.

**Inclusão:** aloca código, bloqueia saldo, cria `TEP` pela quantidade inteira e grava requisição/movimento juntos.

**Edição sem trocar produto/requisitada:** aumento gera `TEP` apenas pela diferença; redução gera `TPE` pela diferença e, havendo futuro, `TFR` por `min(futuro, diferença)`; quantidade igual não movimenta.

**Edição trocando produto/requisitada:** bloqueia o saldo antigo, devolve toda a quantidade antiga (`TPE` + eventual `TFR`), bloqueia o novo saldo, debita toda a nova quantidade (`TEP`) e grava tudo junto.

**Cancelamento:** bloqueia saldo; cria `TPE` pela quantidade pedida inteira — a subtração de `qtderecebida` está comentada — e eventual `TFR` por `min(futuro, qtdepedida)`; usa referência `EXCLUSAO REQUISICAO <codigo>`; anexa motivo, grava seu código, muda para `'C'`, limpa recebida e confirma atomicamente.

### Riscos confirmados no legado

Fatos a decidir depois, não requisitos automaticamente aceitos:

1. **Revalidação concorrente incompleta:** compara a quantidade com o saldo da lookup antes do `FOR UPDATE`; não compara novamente depois do bloqueio.
2. **Troca sem validar o novo saldo:** o ramo de troca devolve o antigo e debita o novo sem a validação explícita quantidade ≤ novo estoque.
3. **Parâmetro temporal não persistido:** cancelar usa o valor atual de `RequisicaoSubtraiEstoque`; a linha não registra se houve `TEP` ao nascer. Mudar o parâmetro entre criação e cancelamento pode omitir ou criar estorno indevido.
4. **Devolução integral:** cancelamento ignora `qtderecebida` e depende de que uma requisição aberta ainda não tenha recebimento efetivo.
5. **Retorno transacional mascarado:** alguns ramos chamam `Perpetrar` sem propagar seu retorno e depois atribuem `Result := True`; a transação é atômica, mas a função pode reportar sucesso incorretamente.

Esses pontos alimentam **“Decidir a semântica de estoque, concorrência e cancelamento”**.
