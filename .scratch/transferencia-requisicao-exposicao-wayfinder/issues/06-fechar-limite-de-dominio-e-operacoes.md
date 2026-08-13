# Fechar limite de domínio e operações da Transferência de Requisição

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Conversation

O usuario confirmou: a v1 inclui transferencia operacional, lotes, conferencia, confirmacao da requisicao, estoque/reserva, movimentos, auditoria e cancelamento/reabertura; exclui totalmente emissao fiscal e venda entre filiais. Tambem confirmou que a semantica transacional deve seguir o Delphi.

A leitura do Delphi refinou essa regra: ConfirmaRequisicao percorre as linhas marcadas, agrupa por Requisitante e chama a persistencia por grupo. Se um grupo falha, o loop interrompe, mas grupos anteriores podem permanecer persistidos. O Laravel nao deve trocar esse comportamento por atomicidade por linha nem por rollback global sem uma decisao posterior explicita. Gerar lote possui variantes legadas com persistencia ao final ou durante o loop; a variante efetivamente chamada pela tela ainda deve ser fixada pela jornada.

A jornada fixa a variante: o botao Gerar Lote chama GerarLoteTransferencia, que persiste cada associacao durante o loop; o botao Conferir chama VerificarLoteTransferencia antes de abrir a conferencia. A implementacao Laravel deve preservar essa diferenca de efeitos e falhas.

## Answer

O usuario confirmou que todo o comportamento deve seguir o Delphi, sem trocar a semantica por um desenho Laravel novo. O contrato v1 inclui transferencia operacional, lotes, conferencia, confirmacao, estoque/reserva, movimentos, auditoria, cancelamento/reabertura e reinclusao automatica de saldo pendente quando ReincluirRequisicaoSaldoPendente estiver habilitado.

Paridade transacional confirmada:

- ConfirmaRequisicao percorre as linhas marcadas, agrupa por Requisitante e persiste grupo a grupo. Se um grupo falha, interrompe os grupos seguintes, mas grupos anteriores podem permanecer persistidos.
- O botao Gerar Lote chama GerarLoteTransferencia e persiste cada associacao durante o loop.
- O botao Conferir chama VerificarLoteTransferencia antes da conferencia.
- Validacoes, estados A/F/D/C, concorrencia, auditoria, movimentos, reservas e reabertura devem preservar as regras observadas; melhorias tecnicas nao podem alterar o resultado observavel sem nova decisao.

Emissao Fiscal Eletronica e Venda entre Filiais permanecem fora do contrato, mesmo quando aparecem como ramos alcançados pelo Delphi; os prompts devem marcarlos como exclusoes e nao criar capabilities ou SQL para eles.

## Question

Qual contrato Laravel deve preservar a paridade observável da Transferência de Requisição para Exposição, distinguindo Requisição entre Filiais, Lote de Transferência, Conferência de Produtos, Movimento, Reserva Prévia, Estoque, situação e revisão? Decidir semântica e autorização de gerar, selecionar/desselecionar, conferir, gerar lote, confirmar, cancelar, reabrir, atualizar, imprimir e localizar produto, incluindo estados, idempotência, concorrência, auditoria, rollback e convivência com Delphi. Confirmar explicitamente que emissão fiscal e “venda entre filiais” não entram no contrato.
