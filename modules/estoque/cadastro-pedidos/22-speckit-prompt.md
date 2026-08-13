# Prompt para /speckit.specify — Formulário fiscal completo

```text
/speckit.specify

Crie uma especificação corretiva P1 que complete o formulário fiscal do item iniciado no prompt 15. Depende obrigatoriamente do motor autoritativo da spec 17 e da concorrência da spec 16. Gere a spec; não implemente.

FONTES

- prompts 02–05, 15–17;
- auditorias desta pasta;
- PedidoCompraItemForm, PedidoCompraItemFiscalTabs, PedidoCompraItemTotaisPanel, types, requests/services/repositories atuais;
- implementação vigente dos motores fiscal/custo e flags manuais.

Revalide o que já está entregue; não recrie campos corretos nem fórmulas.

ESCOPO

Completar, conforme contrato do prompt 15:
- classificação: Natureza→CFOP único, NCM, CST/CSOSN da empresa/nota/produto e regime efetivo;
- valores/quantidades: unidades NF/estoque, fator, quantidade convertida, preço, descontos, frete, líquido e total+IPI;
- ICMS próprio: reduções oficial/custo, bases, alíquotas, valores, crédito/Simples e FCP aplicável;
- ICMS-ST: MVA, equalização, reduções oficial/custo, base/alíquota/valor/FCP e ST anterior somente onde o contrato de entrada permite exibição;
- IPI e PIS/COFINS: CSTs, bases, alíquotas, valores e gating já definidos;
- painel completo de totais do prompt 15.

Não habilite DIFAL, saída, BaseDupla, Serviços/ISS ou fórmulas fora de Pedidos.

FONTE DOS VALORES

Frontend não calcula tributos. O backend executa/consulta o resultado reconciliado da spec 17. Cada campo informa origem (automático/manual), versão/revisão e editabilidade. Não retorne placeholders null quando o dado é obrigatório; ausência deve ser erro tipado ou indisponível explicado.

EDITABILIDADE

Especifique matriz campo × situação do Pedido × origem/regime × transferência/documento eletrônico × flag manual. Campo automático é read-only salvo quando specs 02–05 permitem edição. Edição manual marca flag correspondente e recálculo não sobrescreve; ação explícita “voltar ao automático” limpa flag e recalcula sob revisão.

Natureza/CFOP é um único lookup: seleciona Natureza, resolve CFOP e persiste ambas identidades de forma consistente. Checkbox de atualização de preço é a mesma flag do lote do prompt 13.

CONCORRÊNCIA/ERROS

Salvar usa expected_revision/idempotência/locks da spec 16 e motores/reconciliação da 17. Erro em campo/motor produz rollback. Retorne field_errors e correlation_id, sem sucesso parcial.

TESTES

PostgreSQL: persistência de todos os grupos, Natureza/CFOP, regimes, flags manual/automático, concorrência, rollback e resultados idênticos ao motor.

Unitários: matriz de editabilidade e mapeamento DTO.

React: abas/campos/totais, enabled/disabled, edição manual, voltar ao automático, atualização reativa, validação/foco e checkbox consistente com lote. Sem skips/incomplete; regressão completa dos motores e Cadastro.

SAÍDA

Spec com catálogo/matriz de campos, contratos backend/frontend, estados, erros, testes, acessibilidade, desempenho e arquivos mínimos revalidados.

FORA DE ESCOPO

Nova fórmula; cálculo React; botões “Gerar Total X” ainda sem direção fechada; grade; emissão NF-e; campos de saída; alterar Delphi; implementar agora.
```
