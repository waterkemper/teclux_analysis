# Auditoria da implementação dos prompts 12 a 15

Data da auditoria: 2026-08-25

## Escopo

A implementação foi auditada nos refs remotos do submódulo Laravel:

- `origin/427-reposicao-ecc-fundacao` (`fa43c31e`);
- `origin/428-reposicao-ecc-calculo` (`ca35fc06`);
- `origin/429-reposicao-ecc-revisao` (`7230c746`);
- `origin/430-reposicao-ecc-operacao` / `origin/main` (`32f8c713`).

O checkout local de `laravel` está em `main` anterior e possui alterações locais não relacionadas. Por isso a auditoria usou `git show` dos refs corretos, sem trocar ou sobrescrever o worktree.

## Resultado executivo

A fundação, o cálculo, a tela própria, a autorização contextual e a fila de exceções estão presentes. As regras de prefixos, máximo `0/9999`, concentração Produto × Filial, proteção de concentradora e uso do núcleo de `pedidosfiliais` também aparecem implementadas.

Há, porém, três falhas de prioridade alta no contrato entre cálculo, revisão e confirmação:

1. A alocação calcula parcelas em várias fontes, mas o resultado operacional mantém somente a primeira filial em `fonte_filial`. A confirmação cria uma única requisição com a quantidade total para essa primeira fonte.
2. A revalidação usa `emestoque` cru e força `sem_venda = false`, em vez de reaplicar a projeção de estoque/reservas e a janela de vendas configuradas no snapshot.
3. Quando há atendimento parcial por `saldo_insuficiente`, a confirmação apenas retorna a exceção na resposta; não materializa a exceção persistente nem vincula `excecao_id` ao item.

## Evidências

### E1 — alocação multifonte é perdida na confirmação — P1

`ReposicaoEccAlocador::alocar()` percorre todas as fontes e soma `quantidade_alocada`, mas retorna `fonte_filial` como a primeira filial escolhida (`ReposicaoEccAlocador.php:65-66, 142, 161-186`).

`ReposicaoEccGerarPropostaService` grava a soma em `quantidade` e a primeira filial em `fonte_filial`, enquanto `cloud_estoque_reposicao_ecc_item_fontes` fica como trilha de tentativas (`ReposicaoEccGerarPropostaService.php:252-265`).

Na confirmação, `ReposicaoEccConfirmarService` lê uma única fonte e chama `somarWithinTransaction()` uma única vez (`:213-230`). Portanto, no caso fonte A com 6 unidades, fonte B com 4 e sugestão 10, o lote pode registrar 10 como se A atendesse 10.

Isso viola o prompt 13/spec 428, que exige distribuir a sugestão pelo excedente de cada fonte, e o prompt 14/spec 429, que exige uma operação de confirmação para cada parcela persistível. A tabela atual de fontes documenta tentativas, mas não é uma relação operacional fonte × quantidade.

### E2 — revalidação não é semanticamente equivalente ao cálculo — P1

`ReposicaoEccRevalidarService` usa `pol['emestoque']` diretamente e define `sem_venda` como `false` para todas as fontes (`:154-173`). Assim, a confirmação pode mudar a fonte escolhida em relação ao cálculo, ignorar reserva/status configurado e perder a prioridade de filiais sem venda prevista no prompt 13.

O mesmo seam deve ser usado para cálculo e confirmação: estoque elegível, reservas, pedidos concorrentes, vendas na janela fotografada, necessidade própria, concentração e prefixo. A revalidação deve ser viva quanto ao saldo, mas idêntica quanto à semântica dos filtros congelados.

### E3 — saldo insuficiente não vira exceção persistente — P1

Após confirmar uma quantidade parcial, o serviço apenas adiciona `SALDO_INSUFICIENTE` ao array de resposta (`ReposicaoEccConfirmarService.php:232-238`). Nesse ramo não há `ReposicaoEccExcecaoMaterializer`, atualização de `excecao_id`, nem registro persistente da quantidade de origem, confirmada e pendente.

Isso viola o prompt 15/spec 430: exceção de negócio deve sobreviver à resposta HTTP, permanecer ligada ao lote/item e não apagar a proposta original.

### E4 — timezone inválido é aceito — P2

`ReposicaoEccRotinaService::nullableTimezone()` apenas normaliza texto e devolve qualquer valor não vazio (`:307-318`). A rotina pode ser ativada com timezone inexistente e falhar somente quando o dispatcher tentar calcular a janela. O prompt 12 exige timezone válido.

### E5 — reserva de idempotência pode ficar órfã — P2

`ReposicaoEccDispatchService::enqueueCalculo()` reserva a chave, cria a execução, grava o snapshot e despacha o job. As falhas posteriores à reserva não estão protegidas por um fluxo que marque a idempotência e a execução como falhas recuperáveis. Um erro de snapshot ou dispatch pode deixar a janela sem retry seguro.

## Cobertura de testes observada

Os testes não foram executados nesta auditoria: os refs corretos estão no remoto e o worktree local do submódulo contém alterações não relacionadas. A conclusão acima é uma revisão estática dos contratos, código e testes presentes nos refs auditados.

Existem testes para concentradora, prioridade, redistribuição quando a primeira fonte tem saldo zero, confirmação parcial por item inválido, idempotência e autorização. Não foi encontrado teste independente para duas fontes com parcelas positivas, por exemplo `6 + 4`, nem asserção de duas requisições geradas para essas parcelas. O teste de saldo insuficiente também não exige registro na tabela de exceções.

## Decisão

Os prompts 12–15 não devem ser considerados encerrados como contrato implementável sem uma fatia corretiva. Foram publicados:

- `16-speckit-prompt-reposicao-ecc-correcao-alocacao-multifonte.md`;
- `17-speckit-prompt-reposicao-ecc-hardening-orquestracao.md`.

O prompt 16 é bloqueador funcional para produção. O prompt 17 é hardening operacional antes de ativar rotinas em bases de clientes.
