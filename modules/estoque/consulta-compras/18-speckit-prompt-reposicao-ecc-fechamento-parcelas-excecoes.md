# Prompt para `/speckit.specify` — Reposição ECC: fechamento de parcelas, exceções e redistribuição

```text
/speckit.specify

Crie uma especificação corretiva final para fechar a implementação da Reposição ECC após os prompts 16 e 17 em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ . Não implemente código nesta etapa. Consuma os prompts 13–17 em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/, as specs 428–432 e o checkout atual. Preserve as decisões já fechadas sobre prefixos, máximo 0/9999, concentração, gerente de vendas, tela própria, núcleo de pedidosfiliais, timezone e recuperação de dispatch.

## Diagnóstico obrigatório

A persistência de parcelas e o caso feliz A=6/B=4 já existem. Porém:

- a revalidação filtra as candidatas para a fonte original da parcela e não consegue redistribuir A para B;
- saldo insuficiente só aparece na resposta HTTP e ainda não é exceção persistente por parcela;
- uma exceção do núcleo pode abortar a confirmação das demais parcelas seguras;
- o contexto compartilhado ainda usa `estoques.emestoque` cru e não garante a projeção de status/reservas do snapshot;
- a UI e os tipos TypeScript ainda mostram tentativas, mas não parcelas operacionais;
- faltam testes dedicados para os cenários obrigatórios das specs 431 e 432.

## Redistribuição correta por parcela

Revalide cada parcela não confirmada contra todas as fontes elegíveis restantes, não somente contra a filial originalmente gravada na parcela.

Para um item originalmente A=6 e B=4:

1. se A continua elegível, preserve A=6 e revalide B=4;
2. se A perdeu saldo, recalcule somente a necessidade residual de 6 usando B e demais fontes elegíveis;
3. não altere a parcela B=4 já vigente, salvo se a capacidade global das fontes exigir uma decisão explícita e auditável;
4. não ultrapasse o excedente individual nem a soma da quantidade vigente do item;
5. se não houver fonte alternativa, marque somente a parcela afetada como exceção e preserve as demais.

O algoritmo deve considerar a capacidade já comprometida por outras parcelas do mesmo item, para que a redistribuição não prometa duas vezes o mesmo excedente. Cada nova escolha deve gerar uma tentativa append-only de revalidação e uma parcela operacional atualizada, sem apagar a origem.

A verificação de duplicidade deve ocorrer por produto + Filial Requisitante + filial fonte da parcela. Pedido aberto para A não pode bloquear automaticamente a parcela independente de B.

## Projeção de fontes

Fortaleça `ReposicaoEccFonteContextoService` ou extraia uma projeção comum que seja usada no cálculo e na revalidação. Ela deve:

- usar o mesmo status de estoque, reservas, pedidos concorrentes, cobertura, mínimo/máximo, redutora e janela de vendas do snapshot;
- não substituir a projeção por `estoques.emestoque` cru;
- calcular `sem_venda` pela janela fotografada; ausência de uma linha no preview não pode ser presumida como “sem venda” sem uma regra documentada e testada;
- preservar as políticas de depósito, prefixo, concentração e proteção da concentradora;
- permitir ler saldo vivo na confirmação sem mudar a semântica dos filtros congelados;
- produzir fatos suficientes para explicar por que uma fonte foi escolhida, redistribuída ou rejeitada.

Não recalcular a sugestão da Filial Requisitante com filtros vivos.

## Exceção persistente de saldo insuficiente

Implemente um caminho explícito no `ReposicaoEccExcecaoMaterializer` para saldo insuficiente por parcela. A exceção deve ser criada:

- no cálculo quando a soma das parcelas for menor que a sugestão;
- na revalidação/confirmação quando a fonte perder capacidade;
- mesmo quando outra parcela do mesmo item for confirmada com sucesso.

O registro deve conter lote, item, produto, Filial Requisitante, filial fonte candidata, parcela, motivo `saldo_insuficiente`, fatos observados, quantidade original, quantidade confirmada e quantidade pendente. Vincule `excecao_id` ao item e/ou à parcela conforme o modelo já criado.

Ao confirmar parcialmente A=7 de uma necessidade 10:

- `pedidosfiliais` deve guardar somente 7;
- a exceção deve permanecer aberta com original 10, confirmada 7 e pendente 3;
- tentativas rejeitadas e parcelas confirmadas devem continuar consultáveis;
- retry não pode criar nova requisição para os 7 já confirmados.

## Isolamento da confirmação

Uma falha em uma parcela não pode abortar parcelas seguras do mesmo item ou escopo permitido. Defina o mecanismo transacional compatível com o núcleo existente:

- classificação preventiva de duplicidade e elegibilidade;
- savepoint por parcela quando uma exceção do núcleo puder abortar a transação maior;
- uma chamada `somarWithinTransaction` por parcela efetivamente confirmada;
- materialização da exceção da parcela que falhou;
- atualização dos agregados do item somente com as parcelas realmente confirmadas;
- lote permanece pendente enquanto houver parcela ou item aguardando decisão.

Não escrever diretamente em `pedidosfiliais`, `movimentos` ou `estoques`.

Quando uma parcela for revalidada com quantidade diferente, persista `quantidade_revalidada` e o estado correspondente antes de confirmar. Uma parcela em exceção não pode continuar parecendo `proposta`.

## Contrato de API e UI

O detalhe do lote deve devolver e renderizar, separadamente:

- tentativas de fontes (`fontes`), incluindo rejeições;
- parcelas operacionais (`parcelas`), com filial fonte, ordem, quantidade calculada, revalidada, confirmada, pendente, estado, exceção e código de `pedidosfiliais`.

Atualize os tipos TypeScript e a tela para exibir as parcelas como sublinhas operacionais. O resultado de confirmação deve manter a idempotência por lote/item/parcela e devolver todos os códigos; pode agrupar por item conforme `contracts/confirmacao-parcelas.md`, sem perder a identidade da parcela.

## Hardening residual do prompt 17

Preserve o código já implementado e adicione regressões explícitas para:

- falha ao criar `OperationalExecution` depois do reserve;
- falha ao persistir snapshot;
- falha ao despachar job;
- retry sem duplicar execução, snapshot, lote ou job;
- timezone válido, nulo/vazio e inválido em create, update e ativação.

Se a entrada de timezone for um valor preenchido que não seja string, trate-o como configuração inválida, não como ausência silenciosa.

## Testes obrigatórios

Crie/complete testes para:

- cálculo A=6/B=4 com duas parcelas;
- confirmação A=6/B=4 com dois `pedidosfiliais`;
- A sem saldo, B=7: exceção persistente no cálculo e após confirmação parcial;
- A perdida na revalidação redistribuída para B;
- A com duplicidade e B seguro: B confirma e A vira exceção;
- falha do núcleo em uma parcela sem abortar as demais;
- retry por mesma idempotência sem segundo efeito;
- status de estoque e `sem_venda` provenientes do snapshot;
- tentativas rejeitadas separadas de parcelas confirmáveis;
- concentradora e prefixos preservados por parcela;
- UI/tipos exibindo parcelas;
- três pontos de falha pós-reserve do dispatch.

## Aceite mínimo

- [ ] A perda de uma fonte pode redistribuir somente a parcela afetada para outra fonte elegível.
- [ ] Saldo insuficiente é exceção persistente, com original/confirmada/pendente, mesmo após confirmação parcial.
- [ ] Uma parcela com falha não impede parcelas seguras.
- [ ] Cálculo e revalidação usam a mesma projeção de estoque, reservas e vendas.
- [ ] Toda quantidade confirmada possui parcela e código de `pedidosfiliais` correspondentes.
- [ ] Tentativas e parcelas aparecem separadamente na API e na tela.
- [ ] Idempotência cobre todas as parcelas e não duplica efeitos.
- [ ] Testes cobrem os cenários P1 e as falhas de dispatch do prompt 17.

## Fontes obrigatórias

- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/13-speckit-prompt-reposicao-ecc-calculo-alocacao.md`;
- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/14-speckit-prompt-reposicao-ecc-revisao-confirmacao.md`;
- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/15-speckit-prompt-reposicao-ecc-excecoes-indicadores.md`;
- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/16-speckit-prompt-reposicao-ecc-correcao-alocacao-multifonte.md`;
- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/17-speckit-prompt-reposicao-ecc-hardening-orquestracao.md`;
- `specs/431-reposicao-ecc-parcelas-fonte/spec.md`;
- `specs/431-reposicao-ecc-parcelas-fonte/contracts/confirmacao-parcelas.md`;
- `specs/431-reposicao-ecc-parcelas-fonte/tasks.md`;
- `specs/432-reposicao-ecc-ops-hardening/spec.md`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccRevalidarService.php`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccConfirmarService.php`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccFonteContextoService.php`;
- `backend/app/Application/Estoque/ReposicaoEcc/ReposicaoEccExcecaoMaterializer.php`;
- `backend/resources/js/Pages/Cadastros/Estoque/ReposicaoEcc/Index.tsx`;
- `backend/resources/js/types/reposicaoEcc.ts`.
```

