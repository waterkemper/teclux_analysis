# Avaliar dados, transações, concorrência e integridade

Type: research
Status: resolved

## Answer

### Resultado executivo

A arquitetura nova tem bons mecanismos de integridade: transações curtas, FOR UPDATE, CAS para o contador fiscal compartilhado com o Delphi, revisão esperada, idempotência por chave/hash, outbox e reconciliação antes de retransmitir. O núcleo de emissão fiscal separa aquisição/checkpoint, I/O com a SEFAZ e aplicação do resultado.

Ainda assim, a integridade não está uniformemente protegida no banco. Em vários pontos ela depende do protocolo dos callers, de funções/DDL do PostgreSQL legado e de convenções da aplicação. Os riscos mais concretos são: migration não recuperável após execução parcial; tratamento incorreto de exceções PostgreSQL dentro de transação; projeção idempotente que pode declarar sucesso diante de erro ou hash divergente; e trilhas/relações Cloud sem garantias relacionais ou append-only no DDL.

### Achados

#### DTI-01 — Alto — migration de custódia pode ficar parcialmente aplicada e depois não ser retomada

Em laravel/backend/database/migrations/2026_08_10_338001_cloud_fiscal_artefatos.php:18-33, a coluna cloud_fiscal_emissoes.emissao_uuid é adicionada, os registros são atualizados um a um e só depois é criado o índice único. Todo esse fluxo está dentro de if (... && ! Schema::hasColumn(...)). Se o processo cair depois da criação da coluna e no meio do loop, uma nova execução encontra a coluna e pula todo o bloco. O banco pode permanecer com UUIDs parcialmente preenchidos, coluna ainda nullable e sem o índice final.

Isso é evidência direta de commit parcial de schema/dados: a migration não é idempotente por fase. O unique de coluna nullable também não impede múltiplos nulos. Pode haver perda de correlação entre emissão, artefatos e evidências, além de uma migration marcada como executada pelo framework apesar do estado intermediário.

Recomendação: separar fases recuperáveis (coluna, backfill dos nulos, validação de cardinalidade, índice, NOT NULL) e fazer cada fase verificar o estado real antes de sair. O backfill deve continuar enquanto houver nulos; não deve depender apenas de “coluna ainda não existe”.

#### DTI-02 — Alto — QueryException é capturada e o código continua usando a transação PostgreSQL abortada

Em laravel/backend/app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConfirmacaoPorNotasWriteRepository.php:235-245, a inserção de notaspag/produtosnotaspag captura qualquer QueryException e imediatamente chama findExistingEntrada(). O método é chamado dentro da transação de ConfirmarConfirmacaoPorNotasNotaCommand (laravel/backend/app/Application/Interlojas/ConfirmacaoPorNotas/Commands/ConfirmarConfirmacaoPorNotasNotaCommand.php:49-57), e o caller repete o mesmo padrão em :180-208. O mesmo aparece na confirmação por Romaneio em ConfirmarConfirmacaoPorRomaneiosRomaneioCommand.php:213-229.

Em PostgreSQL, uma falha SQL aborta o bloco transacional; a próxima consulta recebe 25P02 até rollback. Portanto, o caminho de “corrida já confirmada” não é confiável para erro de unicidade nem para qualquer outra falha. O tratamento também agrupa qualquer QueryException, em vez de distinguir unicidade de falha estrutural, timeout ou indisponibilidade.

Impacto: corrida legítima pode virar erro interno; erro não relacionado pode ser confundido com confirmação existente; e o fluxo de compensação/reconciliação fica dependente de uma consulta que não pode executar. Recomendação: não consultar na mesma transação abortada; usar rollback/savepoint ou uma transação curta separada, reconhecer somente a constraint esperada e validar a identidade completa.

#### DTI-03 — Alto — projeção TRF pode reportar aplicação com erro ou hash incompatível

laravel/backend/app/Infrastructure/Persistence/Cloud/Interlojas/CloudTransferenciaFiscalProjecaoRepository.php:25-50 faz leitura seguida de insert e captura qualquer QueryException. Em qualquer erro, retorna applied=false junto com o próprio efeitosHash, sem reler a linha vencedora e sem distinguir colisão de unicidade de outro erro de banco.

O banco em laravel/backend/database/migrations/2026_08_11_332002_cloud_interlojas_trf_projecao_destino.php:17-28 garante apenas a unicidade de emissao_uuid/grupo_idempotency_key, não a compatibilidade do hash ou da filial. TransferenciaFiscalProjecaoDestinoHandler.php:69-98 marca o grupo como APLICADA quando não há pendências, sem exigir que o efeito tenha sido efetivamente inserido nem comparar o hash persistido.

O produtor atual calcula hash determinístico, então a divergência pode ser rara; o problema demonstrável é a API fail-open e o mascaramento de qualquer erro de persistência como replay seguro. Recomendação: capturar somente violação de unicidade, reler e comparar hash/filial/identidade; em divergência criar incidente/bloqueio; propagar os demais erros.

#### DTI-04 — Alto — evidência fiscal Cloud tem integridade referencial e imutabilidade majoritariamente apenas na aplicação

As migrations criam vínculos como inteiros, mas não os protegem com foreign keys/checks nos trechos auditados: emissões/revisões/comandos/outbox em 2026_08_10_334001_cloud_fiscal_emissoes.php:54-117; tentativas em 2026_08_10_335001_cloud_fiscal_autorizacao.php:56-91; incidentes em 2026_08_10_336001_cloud_fiscal_reconciliacao.php:65-84; e artefatos/staging/auditoria em 2026_08_10_338001_cloud_fiscal_artefatos.php:35-97.

Os dados de evidência emissao_id, tentativa_id, evento_id e artefato_id podem ficar órfãos por operação administrativa, job incompleto ou limpeza indevida. Também não há trigger/permissionamento DDL impedindo UPDATE/DELETE nas tabelas de auditoria; por exemplo, 2026_08_28_452002_cloud_estoque_cancelamento_pedidos_auditoria.php:17-35 e 2026_09_02_458000_cloud_caixa_fechamento_eventos_auditoria.php:17-35 são append-only por convenção do writer.

No legado, 2026_07_29_120003_pedidosfiliais_audit_trigger_pgsql.php:8-21 é no-op e declara que trigger/tabela pertencem ao DBA/Delphi. A cobertura depende, portanto, de estado externo do PostgreSQL e não é validada pelo deploy Laravel.

Recomendação: adicionar FKs/checks onde compatível; proteger tabelas append-only por role/trigger; manter verificador periódico de órfãos, alterações e hashes; e validar no deploy a presença dos triggers legados.

#### DTI-05 — Médio/alto — numeração de tentativas usa MAX()+1 e a constraint não cobre inutilização

laravel/backend/app/Infrastructure/Fiscal/Persistence/CloudFiscalTentativaRepository.php:90-108 calcula ambos os números por MAX(numero_tentativa)+1. Os handlers de emissão e reconciliação travam a emissão antes de chamar o método, em ProcessarAutorizacaoNfeJobHandler.php:169-205 e ProcessarReconciliacaoNfeJobHandler.php:153-163, reduzindo o risco no fluxo atual, mas a primitiva não impõe a pré-condição de lock.

Em inutilização, ProcessarInutilizacaoFaixaJobHandler.php:105-115 usa nextNumeroTentativaPorEvento(), enquanto 2026_08_10_335001_cloud_fiscal_autorizacao.php:88-90 cria apenas unique emissao_id/numero_tentativa. Como emissao_id é NULL para inutilização, PostgreSQL permite múltiplas linhas com o mesmo par efetivo; não existe unique evento_id/numero_tentativa. O handler trava o evento hoje, mas o invariant não está protegido contra outro writer/reprocessador.

Recomendação: allocator atômico ou sequence por agregado, unique refletindo o escopo real e retry explícito da colisão.

#### DTI-06 — Médio — chave de idempotência TRF não é validada contra o payload original

TransferenciaFiscalIdempotencyGuard.php:21-83 e CloudTransferenciaFiscalGrupoRepository.php:116-141,169-176,202-305 fazem find seguido de update/insert. Para chave existente, linhas_hash, filiais, tipo e linha_ids_json podem ser substituídos sem comparação de fingerprint, revisão esperada ou CAS. Corridas de insert são relidas em alguns métodos, mas sem confirmar que a identidade é compatível.

Se uma chave for reutilizada com payload diferente, a operação pode preservar a identidade fiscal já alocada e sobrescrever a fotografia lógica ou descrição das linhas. Isso enfraquece “mesma chave = mesma operação”. A camada de entrada pode reduzir o risco, mas o repositório não impõe a regra.

Recomendação: comparar hash e campos de identidade ao encontrar a chave e falhar com conflito; fazer upsert sob lock/constraint e usar predicado de revisão quando a atualização for legítima.

#### DTI-07 — Médio — stubs SQLite podem ocultar falhas ou simular migration destrutiva

Em 2026_04_08_240500_extend_fiscal_informacoes_128_sqlite.php:21-27,57-74, safeAlter engole qualquer Throwable, inclusive erro estrutural, e continua a migration. Em 2026_07_21_203500_produtoscontratos_line_pk_sqlite.php:31-66, a tabela é lida, derrubada e recriada antes da reinserção linha a linha, sem transação explícita; há default semântico de filial para 1 em :50 e :74.

São migrations de teste, não evidência de perda em produção, mas criam falsa confiança: testes podem prosseguir com schema incompleto e não exercitam a mesma atomicidade/constraint do PostgreSQL legado. Isso é relevante porque o ADR 0007, em laravel/docs/adr/0007-legacy-runtime-schema-fail-fast.md:7-25, exige schema alinhado e falha explícita em runtime.

Recomendação: não engolir falhas estruturais silenciosamente; validar colunas após alterações e marcar claramente testes que não reproduzem locking, FKs e funções PostgreSQL.

#### DTI-08 — Médio, exploração não confirmada — macros Delphi montam predicados SQL com texto de seleção

Em delphi/apps/bancos/dmrelatorioextratoconta.pas:154-177, ParametroConta e ParametroEvento são concatenados em macros SQL. A tela atribui esses valores a partir de ListaCondicional em delphi/apps/bancos/fmrelatorioextratoconta.pas:117-127. Em delphi/apps/bancos/fmmovtosbancos.pas:560-582 e :814-827, listas são interpoladas em NOT IN por Format.

O caminho observado parece usar seleções de códigos, e não foi demonstrado que o usuário fornece texto arbitrário; portanto não classifico como injeção comprovada. Porém não há binding nem whitelist visível no ponto de montagem e a segurança depende do componente que produz ListaCondicional. É hotspot real para revisão.

Na amostra Laravel, filtros de cliente usam campos/operadores whitelisted e valores em bindings (app/Support/Vendas/ConsultaClientFilterSqlApplier.php:62-104,120-222). As expressões JSON/nomes dinâmicos do Marketplace aparentam ser escolhidas por driver/adapter. Não encontrei injeção Laravel comprovada nesta amostra.

#### DTI-09 — Médio — auditoria de confirmação pode perder detalhe justamente no rollback

O comando registra auditoria dentro da mesma transação para sucesso (ConfirmarConfirmacaoPorNotasNotaCommand.php:250-258) e erro (:180-225). O logger é um insert simples em ConfirmacaoPorNotasConfirmacaoAuditLogger.php:14-44. Se o erro anterior já abortou a transação PostgreSQL, esse insert também falha; o catch externo só tenta registro genérico depois do rollback (:260-270).

Assim, a confirmação pode deixar apenas erro_interno, sem o código/estado detalhado que motivou o rollback. A atomicidade do fato de negócio é correta, mas a evidência do incidente não é independente. Recomendação: persistir falhas em transação separada/outbox de diagnóstico, com correlação e snapshot mínimo.

### Evidências positivas

- A alocação fiscal compartilhada com Delphi usa FOR UPDATE em seriesfiliais, avança o candidato no mesmo commit e aplica CAS (LegacySeriesFiliaisNumeracaoRepository.php:11-16,56-75; AlocarEmissaoNfe55Service.php:67-86,183-190). Candidato ocupado bloqueia a série em vez de pular silenciosamente (:201-228).
- O envio NF-e separa TX1/lease, rede fora da transação e TX2 com validação do token (ProcessarAutorizacaoNfeJobHandler.php:91-116,131-223,351-417). Reconciliação consulta antes de retransmitir e registra incidente em divergência (ProcessarReconciliacaoNfeJobHandler.php:51-101,254-263,425-507).
- Quitação de Duplicata executa em DB::transaction, trava Documento a Pagar e Duplicata, verifica revisão esperada e usa chave/hash de idempotência (PayDuplicataCommand.php:64-87; :272-285). Isso reduz concorrência Laravel/Laravel, mas não substitui verificação de escritores Delphi.
- A idempotência financeira tem unique origem/ação/chave e o guard diferencia replay, pending e hash conflitante (2026_07_20_150000_create_cloud_contas_pagar_idempotency_table.php:17-29; ContasPagarIdempotencyGuard.php:11-19,34-166).
- O ADR 0007 escolhe fail-fast no schema legado em runtime, uma decisão mais segura que adaptar silenciosamente queries a schemas diferentes; o problema residual está nos stubs/migrations e na dependência de DDL externo.

### Commits, estado de integração e conclusão

Há evidência objetiva de integração parcial do submódulo: o repositório raiz está em 24d8cbc1 e referencia laravel no gitlink 193d9a25 (2026-08-24 10:10), enquanto o worktree do submódulo está em f7622de0 (2026-09-03 00:48). git diff --submodule=short -- laravel mostra o gitlink divergente. O worktree Laravel está limpo, mas o commit raiz não reproduz o código atualmente auditado; entre os commits posteriores estão 63bb919b (fiscal 7, 2026-08-10) e 9e8491b7 (transf fiscal, 2026-08-11). Isso não prova alteração incompleta dentro do submódulo, mas prova que a integração no repositório pai está não consolidada e compromete reprodutibilidade do release.

Prioridade do roadmap: (1) tornar migrations/backfills recuperáveis; (2) corrigir exceções em transações abortadas e fazer idempotência fail-closed; (3) impor invariantes relacionais/append-only ou reconciliação independente; (4) substituir MAX()+1 por alocadores com escopo e constraint corretos; (5) consolidar o gitlink Laravel e revisar macros Delphi com whitelist/bindings.

Confiança: alta nos DTI-01, DTI-02, DTI-03, DTI-04, DTI-05 e DTI-09; média nos DTI-06 e DTI-07; média quanto à exposição externa do DTI-08. Não foram executados testes destrutivos, pentest ou alteração de código.
Blocked by:

## Question

Como o sistema protege integridade de dados e fatos financeiros/fiscais em migrations, schema legado, queries, transações, locks, idempotência, concorrência Delphi/Laravel, numeração fiscal, auditoria e reconciliação? Quais riscos de commits parciais, consultas inseguras, inconsistência ou perda de evidência são demonstráveis?
