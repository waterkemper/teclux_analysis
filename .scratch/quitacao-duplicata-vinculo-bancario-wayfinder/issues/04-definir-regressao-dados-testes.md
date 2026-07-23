# Definir regressão, dados existentes e testes de aceite

Type: task
Status: resolved
Blocked by: 03

## Question

Quais testes unitários, feature, integração PostgreSQL e regressões de UI/adapters provam o novo contrato, e quitações Laravel já gravadas com `documentopag`, histórico divergente ou `sequenciaevento` vazio exigem diagnóstico e backfill seguro?

## Answer

### Decisão sobre dados existentes

Quitações já gravadas pelo Laravel exigem diagnóstico porque a correção prospectiva não consegue tornar confiáveis vínculos que nunca foram persistidos. Porém não deve existir backfill automático dentro de migration/deploy: os dados atuais permitem casos ambíguos, movimentos órfãos e débitos possivelmente duplicados por Rebuild.

Criar uma rotina operacional dedicada, por exemplo `contas-pagar:audit-bank-links`, cujo padrão é somente leitura. Ela deve percorrer Duplicatas pagas em lotes determinísticos, confrontar `duplicatas`, `movtosbancos` origem `P` e `movtosbancoseventos`, e produzir relatório JSON/CSV com chaves, evidências e classificação. O comando de aplicação deve ser explícito (`--apply-safe`), exigir backup confirmado e aceitar filtros por período/Filial/Documento para execução gradual.

Não usar introspecção condicional de schema em runtime no fluxo financeiro. A migration SQLite é aditiva para testes; o PostgreSQL legado deve falhar cedo na inicialização/deploy se `duplicatas.sequenciaevento` ou as chaves bancárias esperadas não existirem.

### Classificação obrigatória do diagnóstico

Cada Duplicata paga deve cair em exatamente uma classe:

- `HEALTHY_LINKED`: link completo, evento existente, valor/conta/data/evento coerentes, cabeçalho origem `P` reconciliado, documento/histórico canônicos.
- `LINKED_METADATA_DIVERGENT`: link completo e monetariamente coerente, mas documento ou observações ainda usam `documentopag`, `Pagto doc ...` ou `Refazer pagto doc ...`.
- `REPAIRABLE_UNIQUE_EVENT`: link ausente/incompleto, mas existe exatamente um evento origem `P` não reivindicado que coincide por conta, data, evento e valor, com evidência adicional única por histórico antigo/canônico, Documento ou sequência já conhecida.
- `EXPECTED_NO_BANK_EFFECT`: valor zero ou Adiantamento comprovado, sem movimento/evento e sem sequências. Não inferir retroativamente integração inativa apenas pelo valor atual do Parâmetro do Sistema.
- `UNLINKED_NO_CANDIDATE`: Quitaçao positiva sem link e sem evento candidato comprovável.
- `AMBIGUOUS_EVENT_MATCH`: dois ou mais candidatos possíveis; inclui cabeçalhos gerados por documento/data que não permitem atribuição individual segura.
- `CONFLICTING_EVENT_CLAIM`: duas Duplicatas reivindicam o mesmo evento completo.
- `ORPHAN_BANK_EVENT`: evento origem `P` com padrão de pagamento Laravel que não corresponde a uma Duplicata paga.
- `DUPLICATED_REBUILD_EFFECT`: mais de um evento/debito compatível com a mesma Duplicata, especialmente com histórico `Refazer pagto doc ...`.
- `VALUE_OR_HEADER_MISMATCH`: evento identificado, mas valor, soma, origem, tipo ou cabeçalho divergem.

O relatório deve incluir razão estável, confiança, chaves da Duplicata, candidatos, valores, observações atuais/canônicas e ação permitida. Não incluir proof, senha ou dados sensíveis desnecessários.

### Reparos automáticos permitidos

`--apply-safe` pode alterar apenas classes cuja prova seja única e revalidada sob lock:

1. `LINKED_METADATA_DIVERGENT`: normalizar observação do evento; normalizar o cabeçalho somente se todos os seus eventos forem mapeáveis e a cardinalidade determinar inequivocamente descrição individual ou `PAGTO DIVERSAS DUPLICATAS`; corrigir `documento` para o cheque somente se todo o cabeçalho pertencer ao mesmo cheque.
2. `REPAIRABLE_UNIQUE_EVENT`: preencher `duplicatas.sequencia`, `evento` e `sequenciaevento` com a chave do único evento não reivindicado; depois aplicar a normalização segura acima.
3. Remover valores de link residuais apenas em `EXPECTED_NO_BANK_EFFECT` quando for comprovado que não existe cabeçalho/evento correspondente.

O reparo nunca pode:

- criar um Movimento retroativo para “fechar” uma Duplicata;
- apagar ou ajustar valores bancários;
- escolher o primeiro/mais recente entre candidatos;
- fundir ou separar cabeçalhos;
- apagar efeitos classificados como Rebuild duplicado;
- inferir cheque, evento ou sequência pelo browser, por proximidade temporal ou pelo Parâmetro do Sistema atual;
- mudar Contabilidade, impostos, data ou valor da Quitaçao.

Casos ambíguos, órfãos, duplicados ou com divergência monetária permanecem bloqueados para Cancel/Rebuild e exigem análise humana. A ferramenta deve exportar um roteiro de resolução, mas não oferecer `--force` genérico.

### Segurança operacional do saneamento

- Dry-run é o default e não abre transação de escrita.
- `--apply-safe` processa um cabeçalho por transação, bloqueia Duplicatas, cabeçalho e eventos em ordem canônica e revalida a classificação antes do update.
- Cada alteração produz Auditoria durável com execução, Operador técnico, filtros, chave, classificação, evidência e before/after; log técnico sozinho não basta.
- Execuções são retomáveis e idempotentes: uma linha reparada vira `HEALTHY_LINKED`; rerun não gera nova alteração.
- Relatório contém totais por classe, valor envolvido e falhas; termina com código não zero quando restarem classes críticas no escopo solicitado.
- Antes do primeiro `--apply-safe`, exigir backup verificado e anexar os hashes dos relatórios dry-run/aplicado ao procedimento de implantação.

### Ordem de entrega

1. Corrigir shape SQLite, mapper e interface tipada do módulo bancário.
2. Implementar formatter, elegibilidade, gravação/estorno/rebuild e reconciliação com testes.
3. Implementar e executar o diagnóstico em dry-run no PostgreSQL representativo antes de liberar reparos.
4. Implantar a correção prospectiva para que novas Quitações sempre saiam `HEALTHY_LINKED`.
5. Após backup e revisão do relatório, executar somente `--apply-safe` por intervalo pequeno; reconciliar novamente.
6. Tratar manualmente classes críticas antes de habilitar Cancel/Rebuild para esses registros. Novos registros e vínculos saudáveis não ficam bloqueados.

Migration de deploy não deve reescrever tabelas legadas. A única alteração estrutural prevista neste esforço é acrescentar `sequenciaevento` ao shape SQLite de `duplicatas`; PostgreSQL já possui a coluna.

### Testes unitários

Testar pela interface do módulo/formatter, não por métodos privados:

- `DOC DUP 209120/1 - ANDRA UNIFORMES` sem nota/complemento;
- prefixo `NF`, complemento com espaços antes de `/`, whitespace redundante, caracteres Latin-1/UTF-8 e limite de 512;
- Parte Fornecedora dos tipos permitidos e falha quando não resolvida;
- documento igual à representação decimal de `chequepagto`, vazio sem cheque e nunca igual a `documentopag` por fallback;
- matriz de elegibilidade: data anterior/igual/posterior ao início, parâmetro ausente/inválido/limite de 1980, Adiantamento, valor zero e evento obrigatório;
- resultados `APPLIED` sempre completos e `SKIPPED` sempre sem link;
- transformação do cabeçalho: zero eventos remove, um evento herda histórico/evento, vários usam `PAGTO DIVERSAS DUPLICATAS`/evento nulo;
- códigos de erro estáveis e nenhum detalhe sensível.

### Testes de integração SQLite

Atualizar a migration SQLite de `duplicatas` e fixtures para `sequenciaevento`. Exercitar `ContasPagarMovimentoBancarioWriter` com tabelas reais:

- pagamento individual com e sem cheque;
- duas Quitações individuais na mesma conta/data geram cabeçalhos distintos;
- agrupamento explícito pelo mesmo cheque compartilha cabeçalho e gera eventos com links distintos;
- eventos com mesmo código recebem `sequenciaevento` diferentes;
- inclusão faz a transição de histórico individual para diverso;
- estorno exato de um agregado preserva o outro evento e restaura o cabeçalho individual;
- estorno do último evento remove o cabeçalho;
- link inexistente, valor divergente, evento já reivindicado e agregado ambíguo falham sem mutação;
- Rebuild deixa um único efeito e um único link atual;
- EncodingSanitizer preserva comparação e saída das observações.

### Testes feature dos commands

Cobertura pela rota/interface pública:

- Pay persiste `chequepagto`, `evento`, `sequencia` e `sequenciaevento` e as linhas bancárias exatas na mesma confirmação;
- assert literal de `movtosbancos.documento='209120'` e observações canônicas iguais no cabeçalho/evento para o exemplo informado;
- Pay sem cheque grava documento vazio; `documentopag` não aparece nesse campo;
- integração inativa/anterior ao início, Adiantamento e valor zero produzem `SKIPPED`, sequências nulas e nenhum movimento;
- parcial residual/desconto vincula apenas a Duplicata efetivamente paga pelo valor correto;
- falha depois do writer — Contabilidade, impostos ou reconciler — reverte Duplicata, cabeçalho e evento;
- Cancel usa `sequenciaevento`, remove somente o evento certo e limpa o link após sucesso;
- Cancel de vínculo incompleto retorna `409 BANK_PAYMENT_LINK_INCOMPLETE` e não limpa a Quitaçao;
- Rebuild estorna/reaplica, não duplica valor/evento, troca o link atomicamente e rollback restaura o anterior;
- idempotency replay mantém um único efeito; payload mismatch continua conflito;
- Filial de Emissão/Pagamento, proof, revisão e abilities continuam protegidos;
- resposta só confirma após commit/reload e não aceita chaves bancárias do request.

### PostgreSQL real e concorrência

Substituir os `markTestSkipped` incondicionais de `DocumentosPagarPayPostgresTest`, `DocumentosPagarPayPartialPostgresTest`, `DocumentosPagarCancelRebuildPostgresTest`, `DocumentosPagarPayConcurrencyPostgresTest`, `DocumentosPagarPayRollbackPostgresTest` e `DocumentosPagarAdiantamentoPostgresTest` por fixtures reais. Continuar pulando apenas quando o driver/ambiente PostgreSQL não estiver disponível.

Provar:

- duas Quitações concorrentes individuais em mesma conta/data recebem sequências únicas;
- duas Quitações concorrentes agrupadas no mesmo cheque produzem um cabeçalho, soma correta e dois eventos/links únicos;
- Pay concorrente com Cancel/Rebuild serializa sem evento órfão ou lost update;
- locks são adquiridos na ordem especificada e cenários multi-Documento não entram em deadlock;
- violation/retry limitado não duplica efeitos;
- mesma idempotency key concorrente produz um commit e um replay;
- rollback após cada ponto crítico não deixa link parcial;
- queries de reconciliação detectam soma, documento, observação, cardinalidade e claims divergentes.

Os testes gerais de `MovimentacaoBancariaService` não substituem esses testes, pois atravessam outra seam e origem `B`.

### Adapters e UI

- `PayDuplicatasBatchAdapter`: testar propagação de origem/idempotência, decisão explícita de agrupamento por cheque e links diferentes por item; documentar que o loop atual não é lote atômico antes de conectá-lo.
- `ApplySupplierPaymentReturnAdapter`: testar evento de romaneio, origem, retorno sem cheque/documento bancário e delegação ao mesmo Pay.
- Enquanto não houver consumer de produção, não criar rota/UI artificial apenas para satisfazer cobertura.
- UI Pay nunca envia documento, observações ou sequências; ao detectar cheque já usado em conta/data, apresenta escolha explícita de agrupamento e envia somente a intenção.
- Sucesso recarrega a Duplicata e exibe os fatos confirmados; conflito de vínculo/concor­rência mantém o modal e orienta recarregar.
- Cancel/Rebuild ficam indisponíveis com razão explícita para `BANK_PAYMENT_LINK_INCOMPLETE`; registros saudáveis continuam operáveis.
- Se Rebuild for habilitado na UI, testar proof, confirmação de intenção, loading, sucesso, conflito e que uma nova idempotency key não duplica o débito.

### Testes do diagnóstico/backfill

Fixtures devem cobrir todas as classes, inclusive histórico antigo, `documento=documentopag`, sequência conhecida sem `sequenciaevento`, Pay sem sequência, dois candidatos iguais, claim duplicado, órfão e dois efeitos de Rebuild.

Aceites:

- dry-run não altera nenhuma tabela;
- candidato único é reparado e reconciliado;
- segundo `--apply-safe` não altera novamente;
- ambíguo/duplicado/mismatch nunca é escrito;
- alteração concorrente entre scan e apply é detectada e recusada;
- relatório e Auditoria before/after correspondem ao banco;
- filtros/chunking não mudam a classificação;
- falha em um cabeçalho faz rollback apenas daquele grupo e mantém a execução retomável.

### Critério final de aceite

Para toda nova Quitaçao com efeito bancário, a Duplicata aponta para exatamente um evento existente; documento vem do cheque; evento tem histórico individual canônico; cabeçalho reflete deterministicamente seus eventos; Cancel remove apenas o efeito vinculado; Rebuild deixa exatamente um efeito; retry e concorrência não duplicam; rollback não deixa órfãos. Dados históricos só são alterados quando a correspondência é única e auditável; qualquer ambiguidade permanece visível e bloqueada, nunca “corrigida” por aproximação.
