# Modelo de domínio, coexistência e transações — Cadastro de Romaneios

## Decisão executiva

**DECISÃO NOVA, confirmada em 2026-08-01** — Laravel e Delphi operam o mesmo Romaneio canônico no PostgreSQL legado. O Laravel adota uma fronteira transacional mais forte: cada comando sobre um Romaneio é uma única unidade atômica, idempotente, auditável e protegida por revisão otimista e locks determinísticos. Funções e triggers legados continuam autoridades das regras que já executam.

## Agregado e identidade

- **Romaneio** é o agregado mestre, identificado por `romaneios.numero`; inclusões obtêm a identidade somente por `romaneios_proximonumero()`.
- **Item de Romaneio** é o vínculo de um Documento Fiscal ao Romaneio, identificado pela PK composta `romaneiosnotas(romaneio, dadofiscal)`. Não criar ID paralelo Cloud.
- `romaneios`, `romaneiosnotas`, documentos fiscais, agenda/conferência e financeiro permanecem registros canônicos compartilhados. Não criar cópia Laravel como segunda fonte de verdade.
- `tipo=N` representa Romaneio Normal e `tipo=T` Romaneio de Transferência. A Situação do Romaneio é a condição calculada pelo PostgreSQL; os textos conhecidos não devem virar uma máquina de estados PHP independente.

Evidência: `schema/README.md:18-28`, `pesquisa-sql-dominio-efeitos-delphi.md:48-67`.

## Invariantes

1. Todo Item pertence a exatamente um Romaneio e referencia exatamente um Documento Fiscal válido; a PK impede repetição do documento no mesmo Romaneio.
2. Operações revalidam módulo, Filiais envolvidas, situação corrente, revisão e prova sensível depois dos locks, nunca apenas na UI.
3. Exclusão é rejeitada quando existe entrega ou Duplicata paga. Duplicata paga não é editada ou apagada; eventual reversão usa o domínio de Estorno do Pagamento.
4. O parâmetro `Incluir documento a pagar no romaneio`, resolvido para a Filial efetiva, determina se o comando mantém o Documento a Pagar e exatamente uma Duplicata. Quando ativo, `Evento para pagamento de romaneio` deve resolver para evento válido.
5. Números de Romaneio e Documento a Pagar vêm exclusivamente de `romaneios_proximonumero()` e `documentospag_proximonumero()`; proibir `MAX()+1`.
6. Data/hora operacional e de auditoria vêm do PostgreSQL dentro da transação. A UI nunca fornece o instante autoritativo.

## Unidade transacional

Cada inclusão, alteração, exclusão, confirmação de recebimento, liberação, retenção e futura operação financeira executa em **uma transação PostgreSQL por Romaneio**. Conforme a intenção, a unidade inclui:

- mestre e todos os Itens afetados;
- efeitos de agenda/conferência alcançados pelo fluxo;
- chamada de `Atualizar_situacao_romaneio(:numero)` e efeitos das triggers habilitadas;
- criação/alteração do Documento a Pagar e sua Duplicata quando o parâmetro exigir;
- consumo da prova de operação sensível;
- idempotência e auditoria Laravel.

Qualquer erro de SQL, função, trigger, autorização, revisão ou pós-condição causa rollback integral. Não reproduzir commits intermediários possíveis no Delphi, não compensar parcialmente em outra request e não publicar sucesso antes do commit. Depois dos efeitos, reler do banco a Situação do Romaneio e as identidades/valores produzidos.

## Coexistência e concorrência

1. Abrir a transação e adquirir lock do Romaneio antes de seus dependentes. Em inclusão, serializar a intenção pela chave de idempotência e usar a função de próximo número.
2. Bloquear linhas em ordem determinística: Romaneio; Itens por `dadofiscal`; Documentos Fiscais por `numero`; agenda/conferência por chave canônica; Documento a Pagar e Duplicatas por suas chaves. A implementação deve refinar a lista com o SQL de cada comando e cobrir deadlock em teste PostgreSQL real.
3. Depois dos locks, reler agregado, situação, Filiais, efeitos financeiros e a **Revisão do Romaneio**. Se divergir da revisão enviada pela tela, rejeitar com conflito e exigir recarga; não sobrescrever nem mesclar automaticamente.
4. A revisão deve mudar diante de alterações relevantes feitas por qualquer aplicação. Usar a auditoria compartilhada de `romaneios_log_new` e `romaneiosnotas_log_new` como evidência disponível; se os efeitos externos que integram o agregado não produzirem um token único confiável, a especificação deve acrescentar uma revisão Cloud transacional sem alterar a identidade legada. Não usar apenas `updated_at` nem valor enviado pelo cliente.
5. O lock reduz corridas durante o comando Laravel; ele não transforma o Delphi em cliente de revisão. Portanto, toda escrita Laravel revalida depois de esperar locks, e testes de coexistência devem executar escrita Delphi-equivalente concorrente.

## Idempotência

- Todo comando mutável exige chave de idempotência persistida, vinculada a módulo, operação, usuário/Filial, Romaneio quando conhecido e hash do payload canônico.
- Mesma chave + mesmo conteúdo retorna o resultado original, inclusive após timeout, sem repetir funções ou efeitos.
- Mesma chave + conteúdo/contexto diferente retorna conflito.
- Uma nova chave não contorna invariantes do domínio: PKs, vínculo fiscal, situação, revisão e existência de Documento a Pagar são revalidados sob lock.
- O registro distingue `pending`, `succeeded` e `failed`; resultado de sucesso só se torna reproduzível com o commit. Falha/rollback não pode deixar efeito de negócio parcial.

## Funções, triggers e schema

- **CONFIRMADO** — `Atualizar_situacao_romaneio(integer)` delega a `situacao_romaneio(integer)`; `situacao_romaneio_saida` calcula a situação por Item. O Laravel chama a função canônica e relê o resultado, sem portar seus casos para PHP.
- **CONFIRMADO** — triggers de inclusão, log, auditoria e timestamps estão habilitadas; duas triggers `romaneiosnotas_antesinseriratualizar*` estão desabilitadas. Não ativá-las nem duplicar seus efeitos.
- Repositories são trigger-aware: gravam apenas os campos de responsabilidade da aplicação e nunca repetem efeitos já produzidos por trigger.
- Cada prompt manda conferir `schema/README.md`, o JSON/SQL versionado e o checkout alvo antes de escrever SQL. Divergência estrutural falha explicitamente conforme ADR Laravel 0007; é proibida introspecção de schema em caminho de negócio.
- O banco autoritativo encontrado é PostgreSQL 9.5.25. SQL deve ser compatível com essa versão, apesar de referências genéricas anteriores a 9.6.

## Auditoria

Cada intenção gera evidência imutável com operação, chave de idempotência, Romaneio, revisão anterior/nova, valores relevantes antes/depois, Filial, instante do servidor, origem e resultado. Registrar separadamente o Usuário operador e o Autorizador; nunca senha.

Antes das escritas Laravel, configurar no escopo da transação `app.user_id`, `app.user_login`, `app.user_name`, `app.source='Laravel'`, `app.request_id` e `app.filial_codigo`, consumidos por `replicacao_audit_log_new_fn`. Mudanças legadas sem contexto completo são apresentadas como origem Delphi ou origem não informada conforme a evidência real; não inventar ator.

Tentativas rejeitadas antes da escrita e rollbacks precisam de auditoria de comando fora da trilha de mutação das tabelas legadas, sem afirmar que houve alteração persistida.

## Critérios obrigatórios para os prompts

- Testes PostgreSQL reais para rollback em cada etapa, replay idempotente, chave divergente, conflito de revisão, espera por lock, deadlock/retry e escrita Delphi-equivalente concorrente.
- Testes que comprovem uma única criação financeira e ausência de alteração em Duplicata paga.
- Testes que comprovem função/trigger executados uma vez e resultado relido.
- Nenhum N+1: carregar conjuntos por consulta set-based, `IN` ou `= ANY(array)`, com arrays vazios tratados explicitamente.
- Nenhum `LEFT JOIN` automático: usar `INNER JOIN` nas relações obrigatórias confirmadas e documentar relações opcionais/órfãs.

## Fora da decisão

O possível botão legado “Cancelar pagamento” permanece fora do Laravel até uma decisão específica definir sua semântica como Estorno do Pagamento; não editar campos calculados nem apagar Duplicata paga.

