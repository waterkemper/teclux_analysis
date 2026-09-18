# Prompt para /speckit.specify - Aceite final e hardening pos-prompts 03 e 02

## Objetivo

Os prompts 03 (aceite/hardening da geracao) e 02 (gravacao da classificacao ABC) foram especificados e implementados no checkout Laravel. A revisao dos commits `2c02295b2` e `b3c466a7f`, desde `c719f93be`, encontrou lacunas de contrato, seguranca do snapshot, concorrencia e cobertura PostgreSQL.

Produza uma especificacao de correcao e aceite final. Este prompt nao implementa codigo durante `/speckit.specify`.

## Leituras obrigatorias

- `modules/estoque/relatorio-curva-abc/README.md` e `dossie.md`;
- `modules/estoque/relatorio-curva-abc/03-speckit-prompt-hardening-pos-prompt-01.md`;
- `.scratch/relatorio-curva-abc-wayfinder/research/05-revisao-implementacao-pos-prompt-01.md`;
- `.scratch/relatorio-curva-abc-wayfinder/research/06-revisao-implementacoes-prompts-03-02.md`;
- `laravel/specs/475-fix-curva-abc-aceite/*` e `laravel/specs/476-fix-curva-abc-gravar/*`;
- o diff `c719f93be...HEAD` do checkout Laravel e os testes atuais da Curva ABC.

Revalide os nomes no checkout vigente. Separe falha comprovada, risco inferido e cobertura ausente. Nao reescreva a formula legada nem altere Delphi.

## Correcoes obrigatorias da nova especificacao

### 1. Fechar Top N em todos os pontos

- O backend e o payload ja exigem Top N >= 1, mas `Index.tsx` ainda renderiza `min={0}` e a dica `0 = todos os registros`.
- Alinhar input, default, mensagem, validação cliente, request, payload e testes. Zero nao deve ser oferecido nem documentado.

### 2. Vincular Gravar ao job correto

Antes de qualquer mutacao, validar no servidor:

- `report_key` exatamente `curva_abc`;
- `job_id` solicitado igual ao job identificado no envelope/resultado;
- `environment` presente e exatamente igual ao ambiente da sessao, nao apenas quando o campo existe;
- `user_codigo`, status `ready`, resultado/blob vivo e TTL valido;
- `meta.row_count` igual ao numero real de linhas;
- `universe_count_available` explicitamente `true` e, para Cloud, `raw_row_count` inteiro coerente com o resultado; resultado legado sem universo deve ser inelegivel para gravacao;
- nenhum modo agregado, linha sem `codigo`, tipo fora de A/B/C, produto inexistente ou duplicata de codigo silenciosamente colapsada.

Um job `ready` de outro relatorio ou um envelope malformado nao pode ser usado para gravar classificacao.

### 3. Tornar o digest e a entrada HTTP coerentes

- Se `snapshot_digest` aparecer no corpo e no header, valores diferentes devem ser recusados.
- Validar digest como SHA-256 hexadecimal de 64 caracteres.
- Se `rows` vier no corpo, inclusive vazio, sua divergencia em relacao ao snapshot do servidor deve ser recusada; nunca ignorar array vazio como se o campo nao tivesse vindo.
- O digest deve rejeitar duplicatas de `codigo`, mesmo que tenham a mesma letra, ou documentar prova de que a duplicata e uma linha valida do dominio.
- O digest nao pode ser a unica verificacao de estrutura: validar contagens e identidade da geracao antes da transacao.

### 4. Corrigir idempotencia e concorrencia real

A implementacao atual calcula `ownerToken` deterministicamente a partir de usuario, chave e digest; duas requisicoes concorrentes com a mesma intencao podem ser tratadas como o mesmo owner e ambas seguem para a transacao. Alem disso, `complete()` e `fail()` nao condicionam a atualizacao ao owner/lease vigente.

Especificar e testar uma maquina de estados que:

- reserve uma intencao uma unica vez;
- responda `pending` para concorrente, sem iniciar uma segunda mutacao;
- permita takeover somente apos lease expirado e impeça worker antigo de completar/falhar a reserva do novo owner;
- mantenha `environment`, operador, job e digest vinculados à reserva;
- devolva replay somente para a mesma intenção autorizada, sem reutilizar sucesso de outro operador/job por coincidencia de chave e digest;
- trate crash entre commit de Produtos e `complete()` sem segunda alteracao material e sem auditoria inconsistente;
- trate corrida de criacao da primeira linha do mutex sem unique violation nao classificada.

O aceite deve usar duas sessoes/conexoes PostgreSQL reais, nao apenas duas chamadas sequenciais dentro da mesma transacao de teste.

### 5. Completar a transacao e o contrato da trigger

- Preservar limpeza global e apply set-based na mesma transacao PostgreSQL.
- Provar rollback depois da limpeza, timeout de lock e concorrencia Laravel x Laravel e Laravel x UPDATE estilo Delphi.
- Provar em todas as linhas tocadas que `veiodatriggercaracteristicas` termina falso conforme a trigger implantada; se a trigger divergir, bloquear o aceite.
- Definir comportamento quando a auditoria Cloud falhar depois do commit do cadastro: resposta, retry, idempotencia e registro nao podem mentir sobre sucesso.

### 6. Alinhar UI de Gravar ao contrato do servidor

- O botão só pode habilitar quando o resultado corrente tiver job, payload não obsoleto, modo 0–2, linhas, universo válido e capacidade de gravação.
- Testar componente ou fluxo real para confirmação global, F5, erro 403/409/422/423, sucesso/replay e limpeza após resultado expirado.
- Não bloquear acidentalmente o refresh normal do navegador com F5 fora de uma ação de Gravar, salvo padrão explícito do shell ERP.

## Matriz de aceite obrigatoria

Reproduza em PostgreSQL alvo, com skip bloqueante fora de `pgsql`:

- Top N 4500/100 nos modos 0, 1 e 2, com métricas positivas, `raw_row_count > row_count` e limites reais;
- Top N 0 recusado na UI, cliente e servidor;
- job de outro `report_key`, ambiente, operador, status, TTL/blob ausente e meta inválida recusados sem mutar Produtos;
- digest divergente corpo/header, rows divergentes, array vazio enviado e duplicatas recusados;
- G1/G8 substituição global, G9 flag final, G10/G11 rollback e lock timeout;
- G12 duas sessões Laravel e Laravel/Delphi, sem leitor ver estado intermediário;
- G13 replay PostgreSQL sem segundo UPDATE material;
- G14 auditoria de sucesso, rejeição, conflito e rollback sem segredo;
- G15 leitores Compras, Transferências, Requisições e Manutenção de Preços com A/B/C/ND;
- G16 cancelado, expirado e blob perdido;
- G17 F6 isolado, sem alteração de classificação nem flag;
- corrida de primeiro mutex e takeover de lease.

Os testes não podem ser considerados verdes apenas porque foram marcados `[x]` no tasks. Registrar comando executado, ambiente, driver, função/migration vigente e bloqueios de infraestrutura.

## Fora de escopo

- Não criar histórico ou fotografia da geração.
- Não criar job pesado para Gravar.
- Não alterar a fórmula `abc_prod`, Delphi, leitores downstream ou triggers sem evidência específica.
- Não substituir PostgreSQL por SQLite/mock nos gates de trigger, atomicidade, concorrência, idempotência e leitores.

## Saida esperada do SpecKit

Produza `spec.md`, `plan.md`, `tasks.md`, contratos de estado/idempotência, matriz PostgreSQL e atualizações de ADR/documentação. A especificação só pode declarar a Curva ABC pronta quando o contrato de geração, gravação e a matriz PostgreSQL estiverem realmente aprovados.
