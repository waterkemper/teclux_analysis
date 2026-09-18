# Prompt para `/speckit.specify` — Reposição ECC: correção de alocação multifonte e revalidação

```text
/speckit.specify

Crie uma especificação funcional e técnica corretiva para a Reposição ECC, consumindo os prompts 13, 14 e 15 em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ e a implementação existente nos serviços `ReposicaoEccAlocador`, `ReposicaoEccGerarPropostaService`, `ReposicaoEccRevalidarService` e `ReposicaoEccConfirmarService`. Não implemente código nesta etapa. O objetivo é eliminar a perda de parcelas entre cálculo, revisão e confirmação.

## Problema obrigatório a resolver

O cálculo pode usar mais de uma fonte, mas o contrato atual mantém apenas a primeira filial em `fonte_filial` e a confirmação chama o núcleo uma única vez com a quantidade total. Isso é incorreto: se a sugestão for 10, a fonte A puder fornecer 6 e a fonte B puder fornecer 4, devem nascer duas parcelas operacionais, A=6 e B=4.

A tabela de tentativas `cloud_estoque_reposicao_ecc_item_fontes` não pode ser tratada automaticamente como relação operacional. Tentativa rejeitada, parcela alocada, parcela confirmada e parcela pendente têm semânticas diferentes.

## Modelo canônico de alocação

Defina uma relação persistente fonte × quantidade por item, preferencialmente uma tabela Cloud própria ou uma extensão claramente versionada da tabela atual, contendo no mínimo:

- item, filial fonte e ordem de prioridade;
- quantidade alocada no cálculo;
- quantidade revalidada e confirmada;
- estado da parcela (`proposta`, `revalidada`, `confirmada`, `excecao` ou equivalente);
- código de `pedidosfiliais` quando existir;
- origem (`calculo` ou `revalidacao`) e fatos/justificativa;
- timestamps e vínculo imutável com o lote.

`cloud_estoque_reposicao_ecc_itens.quantidade` deve representar o agregado documentado, e nunca permitir que uma única `fonte_filial` seja interpretada como dona de parcelas que pertencem a outras fontes. A coluna singular existente pode permanecer como compatibilidade/resumo, mas não pode ser a fonte operacional da confirmação. Não esconder a relação em JSON se isso retirar integridade referencial, consulta ou idempotência por fonte.

Preserve todas as tentativas rejeitadas para auditoria, mas separe-as das parcelas que realmente serão confirmadas.

## Cálculo

Reutilize a ordenação e as políticas do prompt 13. Para cada produto:

1. comece na sugestão positiva da Filial Requisitante;
2. ordene as fontes segundo Depósito, não concentradora sem venda, demais não concentradoras e concentradoras por último;
3. calcule o excedente protegido de cada fonte;
4. crie uma parcela fonte × quantidade até atender a sugestão ou esgotar fontes seguras;
5. mantenha a soma das parcelas menor ou igual à sugestão e ao excedente individual de cada fonte;
6. registre a falta como exceção quando a soma não cobrir a necessidade.

Teste obrigatoriamente:

- sugestão 10, fonte A com excedente 6 e fonte B com excedente 4: duas parcelas 6 e 4, agregado 10;
- sugestão 10, fonte A sem excedente e fonte B com excedente 7: uma parcela 7 e exceção persistente para o restante;
- fonte concentradora nunca abaixo da proteção já definida nos prompts 13/14;
- fonte concentradora nunca enviando para destino não concentrador;
- concentração, prefixos M/D/U/F/O/C, máximo 0/9999 e prioridade de não venda continuam iguais.

## Revalidação

A revalidação deve reutilizar uma projeção comum de candidatas/política ou outra seam que garanta semântica idêntica ao cálculo. Ela deve:

- reler saldo, reservas e pedidos concorrentes vivos;
- usar o mesmo status de estoque configurado no snapshot, sem substituir por `emestoque` cru;
- calcular `sem_venda` na mesma janela de vendas do snapshot;
- recalcular necessidade própria, cobertura, mínimo/máximo e tabela redutora com os mesmos parâmetros fotografados;
- reaplicar prefixo, concentração e máximo do destino;
- verificar duplicidade por produto + requisitante + fonte para cada parcela;
- redistribuir apenas a parcela que perdeu a fonte, respeitando novamente a ordenação e a proteção;
- retornar todas as parcelas vigentes, não apenas a primeira fonte.

Não recalcular a sugestão da Requisitante com filtros vivos; a confirmação parte da quantidade revisada/original do item e apenas revalida fontes e elegibilidade.

## Confirmação

Dentro da transação da confirmação, para cada parcela persistível:

- chame exatamente uma vez `somarWithinTransaction(SomarRequisicaoFiliaisCommand)`;
- use a filial da parcela como `requisitada` e a Filial Requisitante do lote como `requisitante`/`filialAtiva`;
- grave o código retornado na relação parcela × `pedidosfiliais`;
- não faça insert direto em `pedidosfiliais`, `movimentos` ou `estoques`;
- trate duplicidade, conflito de revisão e retry de forma idempotente por lote/item/parcela.

Se uma parcela falhar, as demais parcelas seguras podem ser confirmadas no escopo permitido. O resultado da idempotência deve devolver todos os códigos e todas as parcelas, sem repetir efeitos num retry.

Defina explicitamente o estado do item quando houver confirmação parcial: a quantidade confirmada, a quantidade ainda pendente e a exceção devem ser consultáveis sem apagar `quantidade_origem`, as tentativas ou os pedidos já criados. O lote não deve ser encerrado enquanto ainda houver item/parcela aguardando decisão, conforme o contrato 429.

## Exceção persistente de saldo insuficiente

Quando a fonte atender somente parte da quantidade:

- persista uma exceção de negócio, mesmo que uma parcela tenha sido confirmada;
- vincule-a a lote, item, produto, Filial Requisitante e fonte;
- grave quantidade original, quantidade confirmada, quantidade pendente e fatos da revalidação;
- preencha `excecao_id` ou a relação equivalente;
- mantenha a proposta original e as parcelas já confirmadas;
- permita a fila do prompt 15 tratar a exceção sem depender do payload HTTP.

## Segurança e autorização

Não altere a regra já fechada: qualquer usuário com acesso ao módulo pode visualizar e revisar os itens; `usuarios.gerentevendas` só é exigido para concluir itens de grupos com `somente_gerentes_solicitacao_ecc = true`. A senha nunca deve ser persistida.

## Aceite mínimo

- [ ] O caso A=6/B=4 gera duas parcelas e duas chamadas ao núcleo, nunca uma chamada A=10.
- [ ] Cada código de `pedidosfiliais` fica ligado à sua filial fonte e quantidade.
- [ ] Tentativas rejeitadas continuam auditáveis e não são confundidas com parcelas confirmáveis.
- [ ] Revalidação preserva filtros/status de estoque, janela de vendas e prioridade de não venda.
- [ ] Fonte perdida pode ser redistribuída sem recalcular a sugestão do destino.
- [ ] Saldo insuficiente gera exceção persistente com quantidades original, confirmada e pendente.
- [ ] Retry não cria segunda requisição nem soma novamente qualquer parcela.
- [ ] Testes cobrem duas fontes positivas, fonte zerada, duplicidade por fonte, concorrência e confirmação parcial.

## Fontes obrigatórias

- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/13-speckit-prompt-reposicao-ecc-calculo-alocacao.md`;
- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/14-speckit-prompt-reposicao-ecc-revisao-confirmacao.md`;
- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/15-speckit-prompt-reposicao-ecc-excecoes-indicadores.md`;
- `specs/428-reposicao-ecc-calculo/spec.md`;
- `specs/429-reposicao-ecc-revisao/spec.md`;
- `specs/429-reposicao-ecc-revisao/contracts/confirmacao-pipeline.md`;
- `backend/app/Domain/Estoque/ReposicaoEcc/ReposicaoEccAlocador.php`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccGerarPropostaService.php`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccRevalidarService.php`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccConfirmarService.php`;
- `backend/app/Application/Estoque/ReposicaoEcc/ReposicaoEccExcecaoMaterializer.php`;
- `backend/app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisCommandService.php`.
```

