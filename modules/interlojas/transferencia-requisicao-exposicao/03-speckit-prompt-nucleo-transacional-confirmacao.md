# Prompt para `/speckit.specify` — núcleo transacional e confirmação

````text
/speckit.specify

Crie uma especificação funcional e técnica para os comandos transacionais da **Transferência de Requisição para Exposição**. Não implemente. Consuma os prompts 01 e 02, o inventário SQL/efeitos Delphi e o núcleo compartilhado de `modules/interlojas/requisicao-para-exposicao/01-speckit-prompt-nucleo-compartilhado.md`, separando o comando de Transferência das telas/DTOs/controllers de Consulta e Cadastro.

## Operações e paridade Delphi

Defina contratos server-side para:

- Gravar F5: persistir edição permitida, somente em requisição aberta, nos campos quantidade recebida e observação;
- Cancelar/Reabrir F6: alternar `A`/`C`, exigir motivo quando `Informar o motivo do cancelamento do pedido` estiver ativo, limpar recebimento no cancelamento e aplicar os efeitos de estoque previstos;
- Confirmar F8: validar novamente situação, saldo, lote e concorrência no servidor; nunca confiar na habilitação da UI;
- atualização de revisão/concorrência e auditoria.

`ConfirmaRequisicao` deve percorrer linhas abertas marcadas com quantidade recebida positiva e lote marcado, agrupar por requisitante e persistir cada grupo como no Delphi. Se um grupo posterior falhar, interromper os grupos seguintes sem desfazer grupos anteriores já persistidos; documente essa paridade e seus limites de retry/idempotência. Não introduzir uma transação global diferente sem registrar decisão explícita.

Quando `ReincluirRequisicaoSaldoPendente` estiver ativo, confirmação parcial cria nova requisição aberta com `qtdepedida - qtderecebida`, preservando produto, requisitante, requisitada, filial física e origem. Não implementar emissão ou transmissão fiscal como parte desse comando.

## Estoque, reserva e movimentos

Resolver parâmetros no backend e bloquear pares de estoque em ordem determinística. Releia o saldo depois do lock. Com `REQUISICAOSUBTRAIESTOQUE`:

- confirmação usa reserva prévia como disponibilidade;
- sem o parâmetro, usa `emestoque`;
- preserve a semântica Delphi de SPT/SET e TEP/TPE/TFR conforme triggers e funções do snapshot;
- cancelamento/reabertura devolve/recoloca saldo conforme o contrato vigente;
- nunca movimente mais que a reserva prévia disponível; venda futura deve seguir a regra legada quando aplicável.

Use `movimentos_proximonumero()` e as autoridades PostgreSQL existentes; nunca `MAX()+1`. Preserve `movimentos.usuariologado`, `trffilial`, numeração e referências legadas. Confirme no schema/triggers o efeito real de cada tipo antes de prometer saldos.

## Concorrência e anti-N+1

Bloqueie requisições, pares de estoque e conjuntos de códigos em ordem determinística. Use revisão/timestamp/identidade para rejeitar edição obsoleta sem efeitos. Resolva produtos, pedidos, lotes e logs em conjuntos; não faça consulta, `Locate`, `UPDATE` ou `INSERT` por linha quando um `IN`, `ANY`, CTE ou `UPDATE ... FROM` resolver o conjunto.

Os efeitos transacionais devem registrar falha, grupo, trace e revisão de modo observável. Defina idempotência para repetição de F8 e o que acontece quando o navegador perde a resposta após o commit.

## Aceite mínimo

- [ ] F5 só edita aberta e F8 revalida tudo no servidor.
- [ ] F6 alterna cancelamento/reabertura, motivo e efeitos de saldo conforme parâmetro.
- [ ] Confirmação agrupa por requisitante e preserva a persistência por grupo do Delphi.
- [ ] Saldo, estoque, movimentos, pedidos, auditoria e reinclusão têm unidade e ordem transacional documentadas.
- [ ] IDs usam funções/sequences PostgreSQL; não existe `MAX()+1`.
- [ ] Concorrência e revisão obsoleta não produzem movimentos parciais indevidos.
- [ ] Testes cobrem confirmação parcial, saldo insuficiente, concorrência, rollback da unidade escolhida, retry e auditoria em PostgreSQL real.

## Fora de escopo

NF-e/DANFE/XML/SEFAZ, séries fiscais, duplicatas, contratos, crédito entre filiais, venda entre filiais, grades obsoletas de compras/grupos/filiais, testes de driver e `hashtablefs`/`hastablefs`.
````

