# Prompt para `/speckit.specify` — lotes e conferência

````text
/speckit.specify

Crie uma especificação funcional e técnica para seleção de lotes, geração de lote e conferência na **Transferência de Requisição para Exposição**. Não implemente. Consuma os prompts 01, 02 e 03 e as evidências de `pesquisa-interface-delphi.md` e `pesquisa-sql-dominio-efeitos-delphi.md`.

## Seleção e geração

Preserve o comportamento funcional do Delphi:

- a lista de lotes tem Lote e Selecionar em checkbox;
- marcar/desmarcar filtra a grade principal;
- lista sem lote selecionado significa sem filtro, não resultado vazio;
- Gerar Lote processa todas as linhas marcadas, não apenas a linha corrente;
- a ação só fica disponível quando houver linha elegível marcada e requisitante válido;
- linhas já loteadas não recebem novo lote sem regra explícita de reabertura/troca;
- atribuição de lote é feita server-side com revisão e estado revalidados.

O código do lote deve usar `lotestransferencia_proximocodigo()`/sequence, nunca `MAX()+1`. Persistir usuário e data/hora do servidor. A operação deve ser idempotente ou rejeitar repetição com resposta estruturada, sem duplicar associação.

## Conferência

`Conferir` deve chamar o equivalente a `VerificarLoteTransferencia` antes de aceitar a conferência. Especifique a relação com `produtosconferencia`, o tipo operacional `TRF`, a seleção por lote/produto e a remoção da conferência quando o item loteado é desmarcado, conforme constraints e triggers do snapshot.

Validar, em conjunto e não com consultas por item:

- quantidade recebida versus quantidade lida;
- quantidade recebida versus reserva prévia disponível;
- situação aberta e lote pertencente à requisição/filial autorizada;
- inconsistências de produto, lote, requisitante e revisão concorrente.

Defina mensagens operacionais, erro de saldo, conflito de revisão, lote inexistente e lote já utilizado. Não transformar conferência em emissão fiscal.

## SQL, locks e desempenho

Use `IN`/`= ANY(array)` para códigos, produtos e lotes, com lista vazia explícita. Faça uma projeção/consulta por conjunto para inconsistências e uma unidade transacional clara para geração, associação e conferência. Locks de pedidos, lotes, conferências e estoque devem ter ordem determinística. Nunca introduzir N+1, `Locate` por linha ou macro concatenada.

As relações e nulabilidades precisam ser conferidas em `schema/postgresql-authoritative-2026-08-06.json`. Use `INNER JOIN` quando o vínculo é obrigatório por FK/`NOT NULL`; `LEFT JOIN` somente para vínculo opcional comprovado. O schema gate é teste/CI e não pode rodar no request.

## Aceite mínimo

- [ ] O filtro de lote e a seleção de linhas têm a semântica Delphi confirmada.
- [ ] Nenhuma seleção de lote não restringe a consulta.
- [ ] Gerar Lote processa o conjunto marcado e usa a função PostgreSQL de código.
- [ ] Conferir valida todas as inconsistências em conjunto e registra `TRF`.
- [ ] Desmarcar item loteado trata `produtosconferencia` sem apagar outra conferência.
- [ ] Repetição, concorrência, saldo insuficiente e revisão obsoleta têm respostas determinísticas.
- [ ] Testes cobrem seleção vazia, múltiplos lotes/produtos, rollback e cancelamento de consulta sem driver/hashtablefs/hastablefs.

## Fora de escopo

Grades/painéis de compras, grupos e filiais; emissão fiscal, notas, venda entre filiais, DANFE/XML/SEFAZ, e qualquer motor de conferência não evidenciado pelas fontes.
````

