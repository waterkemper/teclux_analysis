# Definir o contrato seguro da correção bancária

Type: task
Status: resolved
Blocked by: 01, 02

## Question

Confrontando o legado e o Laravel atual, qual contrato único deve produzir documento e histórico canônicos, devolver atomicamente `sequencia` e `sequenciaevento`, persistir ambos na Duplicata e manter agregação, cancelamento/refazer, concorrência, idempotência, Filiais e reconciliação corretos em todos os consumidores aplicáveis?

## Answer

### Decisão arquitetural

Aprofundar `ContasPagarMovimentoBancarioWriter` e seu repository origem `P`, preservando a seam determinada pela ADR-0246. Não criar outro motor bancário e não reutilizar `MovimentacaoBancariaService`, cuja origem é `B`.

O módulo bancário de Contas a Pagar deve esconder dos callers:

- resolução de Nota Fiscal de Entrada, complemento e Parte Fornecedora;
- formatação de documento e histórico;
- decisão de criar ou agregar cabeçalho;
- alocação concorrente de sequências;
- criação, redução, exclusão e recomposição de cabeçalho/eventos;
- validação da integridade do vínculo retornado.

Pay, Cancel e Rebuild continuam sendo os commands financeiros públicos. Eles conhecem a Duplicata e a transação de Quitaçao, mas não montam `documento`, `observacoes`, não procuram eventos por heurística e não calculam sequências.

### Interface profunda

Substituir o payload associativo livre e os métodos `writePagamento`/`reducePagamento` por dois intents tipados equivalentes a:

```text
registrar(PagamentoBancarioIntent): PagamentoBancarioResult
estornar(EstornoPagamentoBancarioIntent): EstornoPagamentoBancarioResult
```

`PagamentoBancarioIntent` contém apenas fatos de domínio necessários e validados no servidor:

```text
duplicata: { documentopag, datavencto, numero }
conta
datapagto
valorpagto
filialpagto
tipopagamento
chequepagto?: int
evento: int
agrupamento: INDIVIDUAL | CHEQUE
origem: ui | lote | retorno | rebuild
```

Não aceita `documento`, `observacoes`, `sequencia` ou `sequenciaevento` vindos do HTTP. Lote pode transportar internamente uma referência de agrupamento devolvida pelo próprio módulo, mas o browser nunca escolhe uma sequência.

`PagamentoBancarioResult` é uma união explícita:

```text
APPLIED {
  link: { conta, data, sequencia, evento, sequenciaevento },
  movimento_valor,
  agregado: bool
}

SKIPPED {
  reason: INTEGRATION_INACTIVE | BEFORE_INTEGRATION_START |
          ADIANTAMENTO | ZERO_VALUE
}
```

Se o resultado for `APPLIED`, todos os cinco campos do link são obrigatórios e devem apontar para linhas que já existem na transação corrente. Um movimento sem evento não é sucesso parcial. `EstornoPagamentoBancarioIntent` recebe a identidade da Duplicata, o link completo persistido, o valor esperado e a Filial; `estornar` só atua sobre esse evento exato.

### Documento bancário

- `movtosbancos.documento` deriva exclusivamente de `duplicatas.chequepagto`.
- Com cheque, gravar sua representação decimal determinística, sem separador regional, espaços ou `documentopag`; por exemplo, `209120` gera `"209120"`. Não copiar a máscara dependente de locale do `FormatFloat('000,000')`.
- Sem cheque, gravar `NULL` ou string vazia conforme a convenção já exigida pelo schema/repository, mas expor semanticamente `null` no módulo.
- Ao agregar, o documento do cabeçalho permanece o cheque do agrupamento; nunca é substituído pelo Documento a Pagar de outra Duplicata.
- O limite de 20 caracteres deve ser validado antes da escrita. Como `chequepagto` é inteiro positivo, truncamento silencioso não é necessário nem permitido.

### Histórico canônico

Introduzir um formatter interno único, chamado pelo módulo bancário e testado pela sua interface. Ele consulta dados server-side por `documentopag`:

```text
[NF|DOC][ complemento] DUP {documentopag}/{numero} - {nome da Parte Fornecedora}
```

Regras:

- prefixo `NF` quando `LegacyDocumentoPagRepository::existsNotaByDocumentoPag` for verdadeiro; caso contrário, `DOC`;
- complemento de `documentospag.complemento`, aparado, com espaços antes de `/` removidos e espaços redundantes normalizados;
- nome resolvido por `(tipofornecedor, fornecedor)` em `vfornecedores`, preservando o conceito Parte Fornecedora; ausência deve falhar antes do efeito bancário, não gerar descrição incompleta;
- `movtosbancoseventos.observacoes` sempre recebe o histórico individual;
- cabeçalho com um evento recebe o mesmo histórico e o mesmo `evento`;
- cabeçalho com mais de um evento recebe exatamente `PAGTO DIVERSAS DUPLICATAS` e `evento=NULL`;
- respeitar o limite legado efetivo de 512 caracteres com truncamento multibyte determinístico somente no formatter, mantendo o identificador `DUP {documento}/{numero}` e o nome tão completos quanto possível. Nunca concatenar históricos com quebra de linha.

Pay e Rebuild deixam de produzir `Pagto doc ...` e `Refazer pagto doc ...`. A origem rebuild pertence à Auditoria/log técnico, não muda o histórico financeiro.

### Elegibilidade da integração

O módulo deve interpretar o Parâmetro do Sistema canônico “Início Integração Bancos” pela Filial de Pagamento e aplicar as quatro condições:

1. valor existe e é uma data válida;
2. data configurada é posterior a `1980-01-01`;
3. `datapagto >= inicio_integracao`;
4. não é Adiantamento e `valorpagto > 0`.

Falha em uma condição produz `SKIPPED` com motivo estável e nenhum cabeçalho, evento ou sequência. Desconto integral/valor zero não gera movimento bancário vazio. Se a integração for aplicável, `evento` ausente/inválido é erro de validação e causa rollback.

### Agregação

- `INDIVIDUAL` é o default da UI e do retorno: sempre cria cabeçalho próprio, mesmo que conta/data coincidam.
- `CHEQUE` é uma intenção explícita confirmada pela jornada ou definida pelo adapter de lote. Só é válida com `chequepagto`, mesma conta e mesma data de pagamento.
- O módulo procura e bloqueia o cabeçalho origem `P` por `(conta, data, documento_do_cheque)`. Zero resultados cria; um resultado agrega; mais de um é conflito de integridade e não escolhe “o primeiro”.
- Reutilizar cheque na UI deve oferecer escolha explícita de agrupar; a decisão do browser é apenas intenção. O servidor revalida cheque/conta/data e Filial.
- Lote conectado futuramente pode reutilizar o link/referência retornado pelo primeiro item para os seguintes, sem aceitar uma sequência arbitrária no request.
- Retorno continua `INDIVIDUAL` quando não há cheque. Não deve fabricar documento nem agrupamento.

Após toda inclusão ou exclusão de evento, o cabeçalho é recomputado deterministicamente a partir dos eventos persistidos sob lock: valor como soma assinada, observação/evento conforme cardinalidade e documento preservado pelo agrupamento. Não realizar atualização incremental baseada apenas no valor informado pelo caller.

### Concorrência e alocação

Manter a ordem externa já adotada: lock do Documento a Pagar e da Duplicata antes de entrar no módulo bancário. Dentro do módulo:

1. adquirir locks transacionais PostgreSQL determinísticos para os escopos `(conta,data)`, `(conta,compensacao)` e, quando aplicável, a chave de agrupamento;
2. bloquear cabeçalho existente com `FOR UPDATE`;
3. alocar `sequencia`, `seqcompensacao` e `sequenciaevento` somente sob esses locks;
4. inserir evento, recomputar cabeçalho e ler de volta a identidade persistida;
5. tratar violação de unicidade com erro de concorrência/retry limitado no nível do command, nunca escolher outra linha ambiguamente.

Pode-se continuar usando `MAX+1` somente dentro do lock transacional do respectivo escopo; `MAX+1` desprotegido é proibido. SQLite serve aos testes comportamentais; concorrência e locks devem ser provados em PostgreSQL real.

### Persistência atômica em Pay

Dentro da mesma `DB::transaction` de `PayDuplicataCommand`:

1. bloquear/revalidar Documento e Duplicata, Filiais, proof, revisão e idempotência;
2. calcular os fatos da Quitaçao e construir o intent server-side;
3. chamar `registrar`;
4. atualizar a Duplicata uma única vez com os fatos de pagamento e:
   - `evento`, `sequencia`, `sequenciaevento` do link quando `APPLIED`;
   - `sequencia=NULL`, `sequenciaevento=NULL` quando `SKIPPED`; `evento` pode permanecer como o evento financeiro canônico do Documento para os demais efeitos;
5. executar efeitos tributários/contábeis e reconciliação;
6. confirmar somente se todas as linhas e vínculos forem coerentes.

Não retornar sucesso ao browser antes do commit. A resposta pode expor `movimento_bancario.status/reason` e a Duplicata recarregada, mas a chave bancária não vira autoridade do cliente em chamadas futuras.

Invariante pós-commit para `APPLIED`:

```text
duplicata.(contapagto, datapagto, sequencia, evento, sequenciaevento)
  == movtosbancoseventos.(conta, data, sequencia, evento, sequenciaevento)
```

e o evento tem valor `-abs(duplicata.valorpagto)` e pertence ao cabeçalho origem `P` correspondente.

### Cancelamento

Cancel deve capturar o snapshot completo antes de limpar a Duplicata. Quando a Quitaçao possui link completo:

- chamar `estornar` com a chave completa e o valor esperado;
- bloquear e validar cabeçalho/evento, origem `P`, tipo de saída, valor e vínculo;
- excluir exatamente o evento identificado, nunca “o mais recente” do mesmo código;
- recomputar ou excluir o cabeçalho conforme os eventos restantes;
- somente depois limpar na Duplicata `sequencia`, `sequenciaevento`, `evento` e demais fatos de pagamento.

Link incompleto em uma Quitaçao que deveria ter integração ativa resulta em conflito `BANK_PAYMENT_LINK_INCOMPLETE`, sem heurística, sem limpar a Duplicata e sem mutação bancária. Isso protege dados existentes e encaminha o caso ao diagnóstico/backfill do ticket seguinte. Resultado `SKIPPED` comprovável não exige estorno bancário.

### Refazer pagamento

Rebuild continua command dedicado conforme ADR-0246, mas deve compor o mesmo módulo dentro de uma única transação:

1. capturar fatos e link atuais;
2. estornar exatamente o evento antigo;
3. registrar novamente com os fatos preservados e eventual novo evento validado;
4. substituir na Duplicata `evento`, `sequencia` e `sequenciaevento` pelo novo link;
5. reaplicar/reconciliar os demais efeitos e confirmar.

Qualquer falha restaura movimento/evento e vínculo anteriores por rollback. Rebuild não acrescenta “Refazer” à observação, não chama Pay por HTTP e não grava um segundo movimento sem desfazer o primeiro. Repetição com a mesma idempotency key devolve replay; chave nova após rebuild concluído é novo command sujeito à revisão atual, não duplicação cega.

### Filiais, idempotência e consumers

- A Filial de Pagamento governa Parâmetro do Sistema e autorização de acesso ao efeito bancário; a Filial de Emissão continua validada pelo command.
- Proof, revisão, idempotency key e `origem` permanecem nos commands; o módulo bancário não autentica Usuário nem aceita origem como autoridade.
- A reserva/commit da idempotência deve permanecer correlacionada à mesma transação lógica da Quitaçao; rollback não pode deixar resposta de sucesso reutilizável.
- `PayDuplicatasBatchAdapter` e `ApplySupplierPaymentReturnAdapter`, quando conectados, continuam chamando o mesmo Pay/module. Não recebem writer alternativo.
- Lote deve definir atomicidade e agrupamento antes de ser exposto; enquanto seus adapters estiverem desconectados, não ampliar esta correção com uma UI nova.

### Reconciliação e erros

Estender a reconciliação de Quitaçao para verificar antes do commit:

- `APPLIED` implica link completo e linhas existentes; `SKIPPED` implica sequências nulas;
- evento vinculado tem valor, tipo, observação e origem esperados;
- cabeçalho é origem `P`, seu valor iguala a soma dos eventos e sua observação/evento correspondem à cardinalidade;
- `documento` equivale ao cheque normalizado ou é vazio sem cheque;
- nenhuma outra Duplicata reivindica o mesmo evento completo;
- Cancel não deixa evento órfão; Rebuild deixa exatamente um vínculo atual.

Erros estáveis mínimos: `BANK_INTEGRATION_EVENT_REQUIRED`, `BANK_AGGREGATE_AMBIGUOUS`, `BANK_PAYMENT_LINK_INCOMPLETE`, `BANK_PAYMENT_EVENT_NOT_FOUND`, `BANK_PAYMENT_EVENT_MISMATCH`, `BANK_SEQUENCE_CONFLICT` e `BANK_RECONCILIATION_FAILED`. Todos causam rollback e correlação em log; não registrar proof bruto.

### Compatibilidade e limites

- Adicionar `sequenciaevento` ao shape SQLite de `duplicatas` e ao mapper do `LegacyDuplicataRepository`; o PostgreSQL legado já contém o campo.
- Preservar nomes físicos legados e `origemlancto='P'`; não criar tabela paralela para o vínculo.
- Não criar uma port/interface abstrata adicional: há um único adapter de persistência legado. O seam real continua no módulo `ContasPagarMovimentoBancarioWriter`; testes comportamentais atravessam essa mesma interface.
- Esta decisão é subordinada e compatível com ADR-0246; não exige nova ADR.
- Tratamento de quitações históricas já inconsistentes e backfill permanece para “Definir regressão, dados existentes e testes de aceite”.
