# Prompt 12 — Eliminar N+1 e corrigir a data global do rodapé

Execute `/speckit.specify` para corrigir somente dois pontos do módulo
`/caixa/controle-recebimentos`:

1. eliminar N+1 no fluxo de fotografia/aceite relacionado à confirmação;
2. fazer o F5 usar a data global vigente no rodapé.

Leia os prompts já gerados, a spec do Prompt 11 no diretorio /mnt/c/teclux_analysis/modules/caixa/controle-recebimentos, a auditoria atual e o checkout
Laravel. Não peça para abrir, reler ou conferir diretamente qualquer fonte
Delphi. Não implemente nesta execução do `/speckit.specify`.

As demais alterações existentes no checkout são intencionais e estão fora deste
prompt. Não revisá-las, revertê-las, reorganizá-las ou criar prompt para elas.

## 1. Data global do rodapé

A tela possui `dataConfirmacaoLote` no rodapé da operação Confirmar. Atualmente,
ao marcar uma linha, a data é copiada para o draft; depois, ao alterar o rodapé,
apenas o estado global muda. O payload de F5 é montado a partir do draft e pode
continuar usando a data antiga.

Especificar e corrigir o contrato para que:

- `dataConfirmacaoLote` seja a data global da operação 1;
- no instante do F5, cada linha selecionada que será confirmada receba a data
  global vigente no rodapé;
- a data não seja obtida da linha focada, da ordem de seleção, da ordenação do
  grid ou de uma cópia obsoleta no draft;
- alterar o rodapé depois de marcar uma ou várias linhas altere o valor enviado
  para todas elas;
- alterar o rodapé antes de marcar também use o novo valor;
- desmarcar e remarcar não recupere uma data antiga;
- o rodapé continue não ligado à linha focada e não altere a data persistida
  antes do F5;
- a validação existente permaneça: data válida e não posterior à data civil do
  servidor; a validação da data individual da coluna não pode ser removida;
- operações 0 e 2 não recebam a regra da data global da operação 1.

É permitido resolver isso passando a data global explicitamente para
`montarLinhasGravar` ou atualizando drafts no `onChange`, desde que o payload
observável seja idêntico ao contrato acima e não haja estado obsoleto.

### Testes obrigatórios da data

Adicionar testes unitários/integração suficientes para provar:

- marcar → alterar a data do rodapé → montar/enviar F5: todas as linhas usam a
  nova data;
- alterar a data → marcar → montar/enviar F5: a nova data é usada;
- duas linhas com focos e ordens diferentes produzem o mesmo payload;
- desmarcar/remarcar não restaura a data anterior;
- data inválida não substitui o último valor válido;
- nenhuma linha não selecionada é incluída no payload.

O teste deve verificar o payload final ou o efeito persistido, não somente o
estado visual do input.

## 2. Eliminação de N+1

Auditar o caminho de leitura e aceite associado à confirmação, incluindo a
fotografia financeira usada pelos testes do Prompt 11. Nenhuma coleção pode ser
carregada com uma consulta por linha, par `(conta,data)`, documento, duplicata
ou evento.

A implementação deve:

- buscar recebimentos por conjunto de códigos;
- buscar movimentos e eventos por conjunto de chaves explícitas, incluindo
  pares compostos quando necessário;
- buscar documentos por conjunto de `documentopag`;
- buscar duplicatas por conjunto de documentos;
- manter colunas explícitas e ordenação determinística;
- usar `whereIn`, `= ANY(array)`, `unnest` ou equivalente set-based com binds;
- evitar `SELECT *`, SQL concatenado, `Locate` e consultas escondidas em loops;
- preservar todos os campos já exigidos pela fotografia financeira e a
  comparação `assertSame($antes, $depois)` nos 422.

O orçamento deve comparar lote pequeno e lote maior com
`Tests\Support\DatabaseQueryCountAsserter`, demonstrando que não existe
crescimento linear por linha. O teste deve continuar no ramo de recusa
pré-escrita do Prompt 10, sem inventar sucesso bancário e sem teto arbitrário
de queries.

A fotografia pode usar uma consulta set-based por coleção ou a menor quantidade
equivalente. O resultado deve permanecer determinístico para as mesmas chaves,
independentemente da ordem dos argumentos.

## Guardrails

Não alterar a regra bancária já fechada no Prompt 10. Não criar alocador,
`MAX()+1`, INSERT bancário, migration, tabela, nova operação ou regra de
Contas a Pagar. Não modificar outras alterações do checkout que não sejam
necessárias para estes dois pontos. Não criar N+1, SQL concatenado, introspecção
de schema em runtime, teste de driver ou skip condicional para fazer a prova
passar. Não pedir inspeção direta dos fontes Delphi.

## Critérios de aceite

- O payload de F5 usa sempre a data global vigente no rodapé para o lote da
  operação 1.
- Nenhum teste de data depende da linha focada ou de draft antigo.
- A fotografia e o caminho medido não fazem uma query por item.
- O custo do lote maior não cresce linearmente com a quantidade de linhas.
- Os 422 continuam atômicos e com fotografia pré/pós idêntica.
- Alterações não relacionadas permanecem intactas.
- PHP e testes frontend são executados conforme o ambiente disponível; qualquer
  bloqueio de ambiente é registrado, sem trocar a prova por skip ou `assertOk`.

## Artefatos de referência

- `/mnt/c/teclux_analysis/modules/caixa/controle-recebimentosmodules/auditoria-implementacao-laravel-vs-delphi.md`
- `/mnt/c/teclux_analysis/modules/caixa/controle-recebimentosmodules/modules/caixa/controle-recebimentos/11-speckit-prompt-fechamento-aceite-prompt10.md`
- `/mnt/c/teclux_analysis/modules/caixa/controle-recebimentosmodules/modules/caixa/controle-recebimentos/pesquisa-interface-fluxo-delphi.md`
- `/mnt/c/teclux_analysis/modules/caixa/controle-recebimentosmodules/modules/caixa/controle-recebimentos/schema/controle-recebimentos-schema-manifest.json`
- `specs/470-fix-cr-p10-aceite/spec.md`
- `specs/470-fix-cr-p10-aceite/contracts/fotografia-financeira.md`