# Prompt para /speckit.specify — fundação, domínio e segurança

```text
/speckit.specify

Crie a especificação funcional e técnica da fundação Laravel do módulo **Entregas e Montagens → Entregas → Romaneios**. Esta é a primeira de seis specs coordenadas. Entregue contratos de domínio, persistência, transação, concorrência, idempotência, auditoria, menu/capability, Filiais, parâmetros e integração interna com o núcleo Contas a Pagar. Não especifique ainda a consulta F6, a interface completa, relatórios ou os comandos operacionais.

Não implemente durante /speckit.specify. Inspecione o checkout Laravel atual e cite arquivos concretos. Trate os artefatos abaixo como pacote autoritativo, sem reabrir decisões funcionais:

- modules/entregas/cadastro-romaneios/schema/README.md
- modules/entregas/cadastro-romaneios/schema/postgresql-authoritative-2026-08-01.json
- modules/entregas/cadastro-romaneios/schema/functions-2026-08-01.sql
- modules/entregas/cadastro-romaneios/modelo-dominio-coexistencia-transacoes.md
- modules/entregas/cadastro-romaneios/seguranca-menu-parametros.md
- modules/entregas/cadastro-romaneios/pesquisa-padroes-laravel-reutilizaveis.md

Se checkout e pacote divergirem, classifique a divergência, bloqueie o SQL afetado e peça nova verificação do banco autoritativo. Não use Schema::hasTable, Schema::hasColumn, information_schema ou pg_catalog em caminhos de negócio.

## Contrato canônico

- Romaneio é o agregado identificado por romaneios.numero; Item de Romaneio usa a PK composta romaneiosnotas(romaneio,dadofiscal). Não criar identidade ou cópia Cloud paralela.
- Obter novo número somente por romaneios_proximonumero(). PostgreSQL confirmado: 9.5.25, SQL_ASCII.
- Tipo N é Normal e T é Transferência. Situações e transições continuam sob autoridade de Atualizar_situacao_romaneio(integer), situacao_romaneio(integer), situacao_romaneio_saida(integer,integer) e triggers confirmados. Não portar uma máquina de estados concorrente para PHP.
- Datas/horas autoritativas vêm do PostgreSQL.
- Cada comando sobre um Romaneio usa uma única transação que inclui mestre, itens, agenda/conferência alcançada, situação, financeiro, prova sensível, idempotência e auditoria. Falha em qualquer etapa reverte tudo.
- Locks seguem ordem determinística: Romaneio; Itens por dadofiscal; Documentos Fiscais; agenda/conferência; Documento a Pagar e Duplicatas. Revalidar situação, Filiais, revisão, parâmetros e autorização depois dos locks.
- Toda mutação exige chave de idempotência ligada a operação, usuário, Filial, Romaneio e hash canônico. Mesmo conteúdo reproduz o resultado; conteúdo divergente conflita.
- Defina Revisão do Romaneio que detecte escritas Laravel e Delphi. Prefira evidência das auditorias *_log_new; se insuficiente para todo o agregado, especifique revisão Cloud transacional sem alterar a identidade legada.
- Configure DatabaseAuditContext na transação e diferencie Operador de Autorizador. Nunca registre senha ou prova bruta.

## Menu, capability e Filiais

- Criar ou alinhar idempotentemente a árvore exata **Entregas e Montagens → Entregas → Romaneios** em acessosmodulos.
- Reusar a raiz existente quando sua identidade for inequívoca; criar os nós intermediário/folha ausentes. Catálogo parcialmente existente ou ambíguo deve falhar de forma acionável.
- Administrador mantém bypass global. Usuário comum depende de grant explícito em usuariosacessosmodulos; a migration não concede acesso em massa.
- Capability do módulo não substitui escopo de usuariosfiliais nem capabilities por ação. Todo endpoint revalida módulo, Filiais envolvidas e ação.
- Especifique matriz de capabilities para leitura, manutenção estrutural, exclusão, conferência, recebimento, liberação, retenção, justificativa, relatórios, exportação e cancelamento F6.

## Parâmetros

Crie CadastroRomaneiosParameterManifest com somente:

1. Incluir documento a pagar no romaneio — booleano legado;
2. Evento para pagamento de romaneio — inteiro positivo quando o financeiro estiver ativo.

Resolver ambos uma vez por comando e Filial efetiva com ParameterService::getMany. Não aceitar valores do browser nem consultar por item. Financeiro desligado não cria novo efeito. Financeiro ligado com evento ausente/inválido falha antes de qualquer escrita.

## Seam Contas a Pagar

Inspecione e reutilize CreateDocumentoPagCommand, UpdateDocumentoPagDraftCommand, LegacyDocumentoPagRepository, LegacyDuplicataRepository, ContasPagarFinancialRevision, ContasPagarFinancialReconciler e ADRs 0246/0255, conforme existirem no checkout.

Se os comandos atuais estiverem acoplados à tela/autorização HTTP, especifique a extração de um application service/port de **manutenção de rascunho financeiro por origem**. Ele recebe intenção tipada de Romaneio, participa da transação já aberta, não faz HTTP/commit interno, preserva locks/revisão/auditoria e mantém exatamente uma Duplicata. Romaneios depende do núcleo financeiro; Contas a Pagar não depende da UI de Romaneios. Não criar segundo repositório ou motor financeiro.

Duplicata paga é imutável e somente Estorno do Pagamento atravessa esse estado, fora deste módulo. Duplicata autorizada/protegida segue as regras mais restritivas já existentes. Um vínculo financeiro existente não é apagado silenciosamente porque o parâmetro mudou.

## Saída esperada

Produza limites de módulos, vocabulário, ports/services/repositories, contratos imutáveis, esquema de rotas/capabilities, migration idempotente do menu, contrato de revisão/idempotência/auditoria, seam financeiro, sequência segura de implementação e estratégia de testes PostgreSQL/SQLite. Identifique arquivos existentes a aprofundar e novos arquivos propostos; não implemente.

## Critérios de aceite

- [ ] Nenhuma segunda fonte canônica, máquina de estados, sequence ou motor financeiro é criada.
- [ ] Schema e SQL miram PostgreSQL 9.5.25 e o snapshot com checksum documentado.
- [ ] Transação, locks, revisão e idempotência cobrem coexistência Delphi–Laravel.
- [ ] Menu exato é idempotente e não concede grants automáticos.
- [ ] Cada endpoint futuro possui ponto explícito de capability e Filial.
- [ ] Parâmetros usam uma leitura getMany por comando e falham de modo fechado.
- [ ] O seam financeiro compartilha invariantes e transação com Contas a Pagar.
- [ ] Auditoria registra Operador/Autorizador/request_id sem dados sensíveis.
- [ ] Testes PostgreSQL reais cobrem functions, triggers, locks, replay, conflito e rollback; skip não conta como aceite.

## Fora de escopo

- F6, grid de candidatos e cancelamento;
- UI mestre–detalhe e CRUD;
- conferência, recebimento, liberação, retenção e justificativa;
- relatórios;
- rollout/feature flag;
- qualquer alteração no Delphi ou banco durante a especificação.
```
