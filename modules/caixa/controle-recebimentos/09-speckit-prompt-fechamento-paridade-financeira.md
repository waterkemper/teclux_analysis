# Prompt 09 — Fechamento da paridade financeira residual

Execute `/speckit.specify` para corrigir somente as divergências residuais da
implementação atual de `/caixa/controle-recebimentos` depois dos prompts 01–08.
Leia `auditoria-implementacao-laravel-vs-delphi.md`, o Prompt 08, o contrato de
domínio, a pesquisa de SQLs/parâmetros, o snapshot/manifesto de schema e o
checkout Laravel atual. Use os artefatos versionados; não peça reabertura,
inspeção ou conferência direta dos fontes Delphi. Não implemente nesta execução
do `/speckit.specify`.

Este é um prompt de fechamento. Não reabra filtros, defaults, catálogo de grid,
títulos, editabilidade, seleção global, F5/F6/F7, F9, autorização, menu,
breadcrumb, máscara de chave NF-e, read model, `VlrDesagio` ou atualização em
lote já comprovados, salvo teste que demonstre regressão.

## Estado que deve ser preservado

- `ControleRecebimentosVlrDesagio` já reproduz a regra capturada e o valor
  líquido é usado no Documento a Pagar e na Duplicata.
- `confirmarRecebimentos` usa uma atualização set-based com `CASE`/`WHERE IN`.
- documentos, duplicatas, movimentos e eventos são carregados em lote e as
  chaves compostas são deduplicadas antes da mutação.
- o read model preserva `NULL` de `valor_confirmacao`, dá precedência ao
  contrato e usa `coalesce(razao, nome)` em consultas por conjunto.

## 1. Completar os campos de Contas a Pagar

Reproduza os campos comprovados no contrato e no snapshot, sem inventar
colunas. A projeção do tipo de recebimento deve disponibilizar o código textual
de `tiporecebimento` (o equivalente ao `tiporec` do Delphi), além do código
numérico e da descrição.

Na criação e na atualização de `documentospag`, usar:

- `fornecedor` e `evento` do recebimento;
- `emissao` e `datalancto` iguais a `recebimentos.datalancto`;
- `filialemissao` igual à filial do recebimento;
- `valor` igual ao `VlrDesagio` líquido;
- `complemento` e `referencia` iguais ao tipo textual de recebimento;
- `tipofornecedor = 'F'`, `previsao = false`, `adiantamento = false`;
- `administrador` igual ao perfil do operador autenticado, não um `false`
  constante.

Na criação e na atualização da duplicata correspondente, usar:

- `datavencto` e `datapagto` iguais à data de confirmação vigente;
- `valorvencto` e `valorpagto` iguais ao valor líquido;
- `valordesconto = 0`, `juros = 0`, `multa = 0`;
- `tipojuros = '%'`, `tipomulta = '%'`, `autorizado = false`;
- `observacao` igual ao tipo textual de recebimento;
- `filialpagto` igual à filial do recebimento e `usuario` igual ao operador.

Ao mudar a data de vencimento, localizar e bloquear a duplicata pela chave
correta, alterar a chave com segurança e validar `rowCount`. Nunca manter a
data antiga apenas porque a atualização por valores seria mais simples.

## 2. Fechar a mudança de data/identidade bancária

Quando a confirmação mudar de data, conta, sequência, evento ou sequência do
evento, a operação deve ser uma unidade transacional:

1. pré-validar e bloquear o efeito antigo por
   `(conta, data, sequencia, evento, sequenciaevento)`;
2. resolver antes da primeira mutação como será alocada a nova identidade;
3. remover o evento antigo, ajustar o total e o cabeçalho do movimento antigo;
4. localizar o movimento da nova conta/data ou criá-lo por alocador autoritativo
   e transacional já existente no projeto;
5. alocar a sequência do movimento/evento sem `MAX()+1`, inserir o evento e
   atualizar no recebimento conta, sequência, evento e sequência do evento;
6. manter `origemlancto = 'X'`, o tipo e o cabeçalho conforme o contrato: um
   evento mantém o código; mais de um evento deixa o cabeçalho nulo.

Se o schema e o projeto não fornecerem alocador seguro para a criação, recusar
a operação antes de alterar `recebimentos`, Contas a Pagar ou banco, com erro
explícito e rollback. Não criar um movimento novo com sequência inventada.

A confirmação na mesma data e identidade continua sendo apenas uma alteração
por delta no evento e no total do movimento. Eventos de outras linhas não podem
ser substituídos pelo valor isolado da linha corrente.

## 3. Ordem, vínculo e lote

Preparar e validar todos os efeitos da transição antes da primeira escrita,
inclusive a existência do novo movimento ou a disponibilidade do alocador.
Atualizar os vínculos dos recebimentos em operações set-based; não executar um
`UPDATE` por linha quando a alteração tiver a mesma semântica de lote.

No estorno, preservar a regra já aceita de proteção contra documento
compartilhado. Quando permitido, limpar no mesmo change set todos os vínculos
de Contas a Pagar (`documentopag`, `duplicata`, `fornecedor` e
`eventodocumentopag`) e os vínculos bancários removidos. Não inferir evento por
valor, posição ou ordem de consulta.

## 4. Testes obrigatórios

Adicionar ou ajustar testes na conexão PostgreSQL autoritativa para provar:

- documento existente atualizado com tipo textual, filial, administrador,
  valor líquido e datas corretas;
- nova criação com `100.00 -> 90.00` gerando `10.00` no documento e duplicata;
- duplicata com data antiga sendo transferida para a nova data sem duplicata
  órfã;
- confirmação com mudança de data que remove o evento antigo e cria/reutiliza
  o efeito novo, ou recusa sem qualquer mutação quando não houver alocador
  seguro;
- recebimento contendo as quatro partes da nova identidade bancária;
- movimento antigo com múltiplos eventos preservando os eventos restantes e o
  cabeçalho correto;
- estorno limpando todos os vínculos e sem exclusão por heurística de valor;
- operador administrador/não administrador refletido no documento;
- `rowCount`, rollback integral, replay/idempotência e orçamento de consultas
  sem N+1.

## Guardrails

Preserve a rota, o menu, o breadcrumb, F9 pelo modal padrão, F5/F6/F7,
Cancelar de F6, radio buttons, catálogo/preferências/exportação, a máscara de
chave de NF-e e os três modos. Não criar CRUD, nova permissão, tabela, teste de
driver, `hasTable`/`Schema::has*`, introspecção de schema em runtime,
`information_schema`, `pg_catalog`, SQL concatenado ou `MAX()+1`.

Se o snapshot não comprovar uma coluna, relação, cardinalidade ou alocador,
registrar o bloqueio no spec e escolher a falha segura antes da mutação. O
resultado deve ser um spec implementável, com critérios de aceite observáveis e
sem pedir ao próximo agente para abrir os fontes Delphi.
