# Dossie - Curva ABC no Laravel

## Destino

Ajustar a geracao existente em /cadastros/estoque/relatorios/curva-abc aos padroes atuais de heavy-reports e especificar a Gravacao da Classificacao ABC com paridade funcional deliberada ao Delphi, sem implementar nesta etapa.

## Fontes autoritativas

### Delphi

- delphi/apps/estoque/dmrelatoriocurvaabc.pas
- delphi/apps/estoque/dmrelatoriocurvaabc.dfm
- delphi/apps/estoque/fmrelatoriocurvaabc.pas
- delphi/apps/estoque/fmrelatoriocurvaabc.dfm

### Laravel

- laravel/backend/app/Http/Controllers/Estoque/CurvaAbcController.php
- laravel/backend/app/Services/Estoque/CurvaAbcService.php
- laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php
- laravel/backend/app/Support/Database/GerarJobStore.php
- laravel/backend/app/Application/Operations/ManagedHeavyReportDispatcher.php
- laravel/backend/app/Application/Operations/HeavyReportLifecycleService.php
- laravel/backend/app/Application/Operations/HeavyReportLifecyclePolicy.php
- laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyCurvaAbcRepository.php
- laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/Index.tsx
- laravel/backend/resources/js/Pages/Cadastros/Estoque/Relatorios/CurvaAbc/CurvaAbcDadosGrid.tsx
- laravel/backend/app/Policies/CurvaAbcPolicy.php
- laravel/backend/app/Services/Authorization/EstoqueCurvaAbcModuleAccessService.php
- laravel/backend/resources/sql/estoque/teclux_abc_prod.sql
- laravel/backend/database/migrations/2026_09_09_030000_refresh_teclux_abc_prod_topn_numeric_pgsql.php

Pesquisas completas e rastreaveis estao em .scratch/relatorio-curva-abc-wayfinder/research/.

## Evidencia Delphi

CONFIRMADO: a tela inicia com datas de hoje, percentuais 20/30/50, quantidade 100, Vendas, Lucro por Produto, Todos, Em Linha, Ativo, Com Montagem, Sem Montagem, Brinde e Nao Brinde. F6 valida datas e A+B+C=100 e chama a consulta. F5 chama Gravar depois de um resultado nao vazio.

CONFIRMADO: ha seis modos: Lucro por Produto (0), Quantidade (1), Faturamento (2), Fornecedor (3), Lucros por Grupo/Classe/Marca (4) e Lucros por Marca (5). A consulta usa a funcao de banco abc_prod e retorna linhas com tipo ABC e campos de produto/agregacao.

CONFIRMADO: AtualizarResultadoCurvaABC limpa globalmente produtos.resultadocurvaabc, percorre o resultado e grava o tipo por produtos.codigo, enviando veiodatriggercaracteristicas = true. Em seguida executa a persistencia do componente legado.

NAO LOCALIZADO: a definicao implantada de abc_prod, as funcoes estoques_produto..., a implementacao de perpetrar e a semantica completa das triggers nao estavam no conjunto Delphi acessivel. Formula, desempates, cortes precisos, atomicidade legada e gravabilidade de modos agregados nao podem ser inventados.

POSSIVEL BUG LEGADO: o filtro somente Inativo possui parentesis excedente. DIVERGENTE: Compras aparece na tela, mas o ramo correspondente nao e implementado. Nenhum desses comportamentos deve ser copiado sem decisao.

## Evidencia Laravel

CONFIRMADO: a rota atual ja despacha GerarCurvaAbcJob, que implementa ManagedHeavyReportJob, usa a fila redis-heavy/heavy-reports, timeout configurado, dispatcher gerenciado, OperationalExecution, checkpoints, progresso e reconciliacao.

CONFIRMADO: CurvaAbcService valida Filiais autorizadas, compila filtros, chama LegacyCurvaAbcRepository, mapeia/enriquece linhas e retorna rows/meta. O GerarJobStore/blob sustenta polling e checkpoint, mas e suporte operacional temporario, nao autoridade relacional.

ATUALIZACAO DO CHECKOUT: o commit `97376be77 (abb 4500)` adicionou observabilidade de Top N/contagens, alterou os acumuladores da funcao Cloud de `numeric(11,2)` para `numeric`, reinicializou o estado antes da segunda leitura e criou migration para reaplicar a funcao. Isso e uma tentativa de correcao/diagnostico, nao evidencia de aceite: a cobertura existente ainda usa mocks e nao executa PostgreSQL com universo grande.

REVISAO POS-PROMPT 01: o commit de implementacao seguinte avancou a instrumentacao, mas deixou divergencias que bloqueiam a Gravacao: Top N 0 foi introduzido apesar do contrato `>= 1`, `raw_row_count` pode cair para um fallback igual ao emitido, a proveniencia numerica e estatica, o teste de overflow nao excede o antigo limite, a verificacao do reset SQL e fraca, a UI pode manter linhas antigas apos falha e o heavy-reports pode executar sem `OperationalExecution`. Os achados rastreaveis e o proximo prompt estao em [05-revisao-implementacao-pos-prompt-01.md](../../../.scratch/relatorio-curva-abc-wayfinder/research/05-revisao-implementacao-pos-prompt-01.md) e [03-speckit-prompt-hardening-pos-prompt-01.md](03-speckit-prompt-hardening-pos-prompt-01.md).

REVISAO POS-PROMPTS 03 E 02: o hardening corrigiu o backend de Top N e a geracao, e a gravacao criou comando, transacao, digest, mutex e auditoria; porem a tela ainda oferece Top N 0, o comando nao restringe explicitamente `report_key`, ambiente/envelope/metadados e rows apresentam validacoes incompletas, e a reserva de idempotencia permite corrida para o mesmo owner deterministico. A matriz PostgreSQL G1-G17 tambem nao esta demonstrada integralmente. O novo aceite esta em [06-revisao-implementacoes-prompts-03-02.md](../../../.scratch/relatorio-curva-abc-wayfinder/research/06-revisao-implementacoes-prompts-03-02.md) e [04-speckit-prompt-aceite-pos-prompts-03-02.md](04-speckit-prompt-aceite-pos-prompts-03-02.md).

REVISAO POS-PROMPT 04: a UI e o contrato de Top N/job/digest avancaram, e foram adicionados testes PostgreSQL de lock, takeover e reparo; contudo a captura de `23505` ainda pode continuar em transacao PostgreSQL abortada tanto na reserva de idempotencia quanto na criacao do mutex. O teste C1 nao dispara a corrida real. A auditoria pode falhar depois de a reserva ser marcada `succeeded`, sem estado explicito de auditoria pendente; contagens aceitam valores numericos nao inteiros; o helper TypeScript ignora linhas invalidas; o fallback de environment diverge do contrato; e o formulario E1 ainda nao e evidencia reprodutivel do run completo. Os achados e o proximo prompt estao em [07-revisao-implementacao-prompt-04.md](../../../.scratch/relatorio-curva-abc-wayfinder/research/07-revisao-implementacao-prompt-04.md) e [05-speckit-prompt-correcao-concorrencia-evidencia.md](05-speckit-prompt-correcao-concorrencia-evidencia.md).

INCIDENTE DE REGRESSAO: para universo aproximado de 4500 produtos, periodo de 1o de marco a 1o de setembro e Top N 100, a grade foi relatada como recebendo 4500 linhas com valores zerados. O contrato precisa distinguir universo calculado (`raw_row_count`) de rows emitidas (`row_count`) e validar valores positivos antes e depois do mapper. O artefato rastreavel e [04-diagnostico-top-n-zerado.md](../../../.scratch/relatorio-curva-abc-wayfinder/research/04-diagnostico-top-n-zerado.md).

CONFIRMADO: nao existe endpoint Laravel de Gravacao da Classificacao ABC. O campo produtos.resultadocurvaabc e lido por Consulta de Compras, Consulta de Transferencias, Consulta de Requisicoes e Manutencao de Precos.

CONFIRMADO: resultadocurvaabc e character(1), com valores A, B, C ou nulo/vazio como nao definido. Triggers legadas e auditoria nova observam alteracoes; veiodatriggercaracteristicas e sinal de controle da trigger, nao resultado de negocio.

## Contrato decidido

### Geracao

- F6 gera e mostra o resultado corrente.
- Resultado e efemero; nao existe historico de negocio nem Fotografia persistente.
- Reutilizar heavy-reports, polling, cancelamento, retry, reconciliacao e idempotencia existentes.
- Cancelamento nao publica parcial; resultado indisponivel exige nova geracao.
- Progresso e por fase; SQL longo nao recebe percentual falso.
- Filiais e grupos sao resolvidos server-side dentro do escopo autorizado.
- Nao criar PDF, impressao ou Excel nesta frente.
- A especificacao da geracao deve fechar primeiro o gate PostgreSQL do incidente Top N antes de habilitar qualquer uso do resultado para a Gravacao.

### Gravacao

- Gravar e comando separado, autorizado e auditado.
- Somente modos por Produto 0/1/2 podem gravar.
- Exigir job ready, resultado corrente nao vazio, usuario/ambiente autorizado e payload compativel.
- Substituir globalmente a classificacao ABC em uma unica transacao PostgreSQL.
- Preservar A/B/C e o significado de nulo/vazio; respeitar o contrato das triggers sem deixar o flag de controle artificialmente true.
- Separar capacidade gerar de capacidade gravar; gravacao global exige escopo global.
- Definir concorrencia, rollback, idempotencia e auditoria sem copiar a concatenacao SQL do Delphi.

## Fora de escopo

- Alterar Delphi ou executar /speckit.specify.
- Criar historico ou Fotografia persistente da geracao.
- Implementar modos agregados como classificacao por Produto sem regra comprovada.
- PDF, impressao, Excel, novo shell de relatorios ou redesign generico de heavy-reports.
- Alterar Consulta de Compras, Reposicao ECC ou leitores downstream fora dos efeitos necessarios da gravacao.
