# Contrato de segurança, menu e parâmetros — Cadastro de Romaneios

## Decisão executiva

**DECISÃO NOVA, confirmada em 2026-08-01** — o módulo preserva no Cloud a hierarquia funcional do Delphi:

**Entregas e Montagens → Entregas → Romaneios**

O acesso à folha é explícito para Usuário comum e automático apenas para Administrador conforme o contrato global. Todas as rotas são protegidas no backend, todas as Filiais alcançadas são revalidadas e as três operações sensíveis comprovadas usam prova contextual de credencial válida, sem inventar perfil adicional. Os dois Parâmetros do Sistema são resolvidos em lote por Filial e falham de forma segura quando a configuração financeira necessária é inválida.

## Árvore de menu e migration

### Identidades

- Reutilizar o nó Cloud já identificado pela rota `cloud.modulo.entrega_e_montagem` e alinhar seu rótulo exibido a **Entregas e Montagens**, sem criar segunda raiz.
- Criar/reutilizar o agrupador **Entregas** sob essa raiz, com rota/identidade canônica estável de agrupamento.
- Criar/reutilizar a folha **Romaneios** sob Entregas, apontando para a rota canônica do cadastro, recomendada como `entregas.romaneios.index`.
- Não reutilizar `acessosmodulos.codigo=63`, pois ele representa o acesso Delphi não Cloud.

Os nomes exatos das colunas pai/ordem/rota devem ser conferidos no schema e nas migrations contemporâneas antes de escrever a migration; não inferir por memória.

### Idempotência

A migration:

1. localiza a raiz por rota canônica + `teclux_cloud=true`;
2. atualiza apenas os atributos de catálogo intencionais da raiz;
3. faz upsert do agrupador pelo pai + rota canônica;
4. faz upsert da folha pelo pai + rota `entregas.romaneios.index`;
5. corrige rótulo, ordem e pai em reexecução sem gerar duplicatas;
6. falha explicitamente se encontrar identidades ambíguas;
7. não executa grants em massa, não copia `usuariosacessosmodulos` do código 63 e não modifica permissões de outros filhos.

O rollback remove apenas registros comprovadamente criados por essa migration e somente quando não possuem dependentes/grants que tornem a remoção destrutiva. Nunca apagar a raiz compartilhada.

## Acesso ao módulo

Criar um service equivalente ao padrão `*ModuleAccessService`, resolvendo a folha por rota + `teclux_cloud=true`:

- Administrador segue o acesso automático global.
- Usuário comum precisa de linha explícita em `usuariosacessosmodulos(usuario, acesso)`.
- Ausência, duplicidade ou configuração inválida da folha resulta em negação fail-closed e diagnóstico operacional.
- O menu deriva do mesmo acesso, mas sua ocultação não é controle de segurança.

Middleware específico protege **todo o grupo de rotas**, incluindo página, lookups, busca por chave, F6, cancelamento da F6, exportação, download, relatórios, histórico, autenticação sensível e comandos mutáveis. Policies/application services revalidam capacidades por operação.

## Matriz de capacidades

| Capacidade | Requisitos adicionais ao acesso do módulo |
|---|---|
| `view`, `search` | Filiais autorizadas e escopo do registro |
| `export`, `print` | mesmos filtros, Filiais e colunas autorizadas da leitura |
| `create` | Filiais dos Documentos Fiscais + parâmetros válidos |
| `update` | situação, Revisão do Romaneio, Filiais e campos permitidos |
| `delete_item` | Item/saída em estado permitido, revisão e Filiais |
| `delete_romaneio` | `ABERTA`, sem entrega, sem Duplicata paga, revisão e Filiais |
| `conferir` | documentos não cancelados, operação RPS/ROS canônica e Filiais |
| `confirmar_recebimento` | guards do Item + prova sensível contextual |
| `liberar_entrega` | Normal em `CONFIRMADA` + prova sensível contextual |
| `reter_entrega` | Normal em `EM TRÂNSITO` + prova sensível contextual |

`cancelar_pagamento` não integra o catálogo/capabilities deste módulo. O botão Delphi possui efeito duvidoso e a operação permanece fora até existir decisão própria como Estorno do Pagamento, preservando a imutabilidade de Duplicata paga.

O frontend recebe capacidades derivadas para apresentar/desabilitar ações, mas nunca envia capacidade como autoridade. Cada endpoint relê módulo, Filiais, situação, revisão, parâmetros e prova aplicáveis.

## Escopo de Filial

Usar `UserBranchAccessService` em:

- carregamento e localização do Romaneio;
- filtros e resultados da F6;
- lookups de Filial, Documento Fiscal, série, transportador, frete e motivo quando aplicável;
- busca por chave NF-e;
- exportação, relatórios, assinatura e histórico;
- todos os Comandos de Romaneio.

Validar **todas** as Filiais alcançadas: emissão de cada Documento Fiscal, origem/destino de transferência, Filial efetiva dos parâmetros e Filial do eventual Documento a Pagar. Administrador segue o bypass global; Usuário comum precisa de vínculo em `usuariosfiliais` para todas elas.

Filiais solicitadas são intersectadas com o escopo autorizado. Quando uma operação unitária/lote alcança Filial não autorizada, falha integralmente sem revelar existência, descrição ou valores do registro. Trocar a Filial ativa invalida resultados, seleção, capabilities, parâmetros e provas sensíveis anteriores.

## Operações sensíveis

Reusar `SensitiveOperationAuthService`, `SensitiveOperationProofService` e o diálogo/hook compartilhado. Registrar três definições:

1. `romaneios.confirmar_recebimento`;
2. `romaneios.liberar_entrega`;
3. `romaneios.reter_entrega`.

### Autoridade exigida

Para as três operações, preservar a regra comprovada do Delphi: o Autorizador precisa ser Usuário ativo com credencial válida, sem exigir `gerenteestoque`, grant do módulo ou perfil não demonstrado. O Operador da sessão, porém, precisa de acesso ao módulo, Filiais e capacidade da ação.

Administrador não elimina a reautenticação quando a operação exige prova. Operador e Autorizador podem ser a mesma pessoa, mas são papéis auditados separadamente.

### Prova

A prova:

- é curta, de uso único e nunca contém senha;
- vincula Usuário autorizador, Operador, módulo, ação, Filial/Filiais, número do Romaneio, Itens/campos afetados, Revisão do Romaneio e hash do contexto confirmado;
- segue `issued → reserved → consumed`;
- é reservada e consumida atomicamente dentro do Comando de Romaneio;
- não pode ser reutilizada entre ações, Romaneios, Filiais, revisões ou payloads;
- expira e é invalidada quando o agregado muda;
- sofre rate limit e auditoria de sucesso/falha sem registrar credencial.

Depois de obter a prova e adquirir locks, o comando relê situação, revisão, Filiais e capacidade para evitar TOCTOU. Falha causa rollback integral.

Persistir o Autorizador nos campos legados quando existe coluna própria. Reter limpa `usuariotransito`/timestamp conforme a semântica legada, mas preserva Operador e Autorizador na auditoria imutável.

## Parâmetros do Sistema

Criar `CadastroRomaneiosParameterManifest` com somente as descrições persistidas:

| Chave do manifest | Descrição literal | Tipo |
|---|---|---|
| habilitar financeiro | `Incluir documento a pagar no romaneio` | booleano legado |
| evento financeiro | `Evento para pagamento de romaneio` | inteiro positivo quando exigido |

Resolver ambos em **uma única** chamada:

`ParameterService::getMany(CadastroRomaneiosParameterManifest::descriptions(), $filialEfetiva)`

O serviço preserva override da Filial e fallback global conforme a autoridade compartilhada. Não consultar por Item, Documento Fiscal ou linha; não criar alias a partir do nome Pascal.

### Validação

- Normalizar o booleano com o parser compartilhado de valores legados.
- Com financeiro desativado, o evento não participa do comando e nenhuma escrita em `documentospag`/`duplicatas` é produzida.
- Com financeiro ativado, evento ausente, vazio, não inteiro ou não positivo bloqueia o comando **antes de qualquer efeito**.
- Se a validade referencial do evento puder ser comprovada pelo catálogo correspondente, validá-la também sob o mesmo contrato; não inventar valor padrão.
- Falha retorna mensagem de configuração acionável e diagnóstico operacional sem expor dados sensíveis.

O browser recebe apenas efeitos/capacidades derivados. Todo comando mutável relê o manifest no backend para a Filial efetiva dentro da unidade de trabalho; valores enviados pela UI são ignorados como autoridade.

## Integração com o Contas a Pagar Laravel

O comportamento Delphi define **quando** o Romaneio produz financeiro e quais dados específicos fornece. O núcleo já implementado no Laravel define **como** um Documento a Pagar e suas Duplicatas são criados, revisados, reconciliados, protegidos e auditados.

### Autoridades existentes a reutilizar

Antes de especificar código novo, conferir e reutilizar/deepening conforme o checkout:

- `CreateDocumentoPagCommand` e `UpdateDocumentoPagDraftCommand`;
- `LegacyDocumentoPagRepository`, inclusive `documentospag_proximonumero()`;
- `LegacyDuplicataRepository`, incluindo detecção de parcela quitada/protegida;
- `ContasPagarFinancialRevision` e `ContasPagarFinancialReconciler`;
- regras de rascunho versus comandos financeiros da ADR 0246;
- imutabilidade de Duplicata paga e Estorno do Pagamento único da ADR 0255;
- auditoria, idempotência, Filiais, normalização de valores legados e adapters já usados pelo Cadastro de Documentos a Pagar.

Não criar `RomaneioDocumentoPagRepository` que duplique insert/update/delete de `documentospag` ou `duplicatas`, outro cálculo de revisão, outra regra de proteção ou outro motor financeiro.

### Seam de integração

Os comandos HTTP atuais de Contas a Pagar podem carregar autorização e payload próprios da tela. O prompt deve avaliar o checkout e, quando necessário, extrair um application service/port compartilhado de **manutenção de rascunho financeiro por origem**, consumido tanto pelo Cadastro de Documentos a Pagar quanto pelo Comando de Romaneio.

Esse seam:

- recebe uma intenção tipada de origem Romaneio, ator, Filial, Documento a Pagar existente opcional, cabeçalho e exatamente uma Duplicata aberta;
- executa na transação PostgreSQL já aberta pelo Comando de Romaneio, sem commit interno independente e sem chamada HTTP entre módulos;
- não exige ao Operador um segundo grant do menu Contas a Pagar para o efeito automático autorizado pelo Romaneio;
- aplica internamente as mesmas invariantes financeiras, revisão, locks, reconciliação e auditoria do núcleo Contas a Pagar;
- devolve número, revisão e fotografia financeira resultante para vincular a `romaneios.documentopag`;
- mantém a dependência em uma direção: Romaneios chama o núcleo financeiro; Contas a Pagar não conhece a interface de Romaneios.

### Mapeamento específico do Romaneio

Com `Incluir documento a pagar no romaneio=true`, o adapter de origem:

1. calcula/relê o total canônico não cancelado do Romaneio;
2. usa o evento efetivo de `Evento para pagamento de romaneio`;
3. usa datas do PostgreSQL e a Filial efetiva autorizada;
4. cria ou mantém um Documento a Pagar ligado ao Romaneio;
5. mantém **exatamente uma** Duplicata compatível com o total e vencimento definidos pelo fluxo legado;
6. calcula `previsao` conforme ainda exista entrega pendente, preservando a regra Delphi confirmada;
7. grava o vínculo no mestre e relê Documento/Duplicata pelo núcleo financeiro.

O mapeamento completo de fornecedor/tipo, emissão, lançamento, vencimento, complemento, referência e valores deve ser confirmado simultaneamente no Delphi, no schema versionado e no DTO aceito pelo núcleo Laravel. Campo não comprovado bloqueia o SQL; não usar default silencioso.

### Documento já existente, proteção e exclusão

- Bloquear Documento a Pagar e Duplicata em ordem determinística junto dos locks do Romaneio.
- Se a Duplicata estiver paga, nenhuma alteração/exclusão é permitida; somente o comando compartilhado de Estorno do Pagamento pode atravessar esse estado, fora do Cadastro de Romaneios.
- Se estiver autorizada ou protegida pelas regras atuais do Laravel, não substituir a parcela destrutivamente. Divergência de valor/vencimento exige bloqueio e tratamento explícito no Contas a Pagar, mesmo que o Delphi antigo verificasse apenas pagamento.
- Alterar Romaneio não pode limpar campos financeiros, bancários ou de autorização por meio de update genérico.
- Excluir o Romaneio só remove o Documento a Pagar quando o núcleo compartilhado confirmar que o rascunho é removível e pertence àquela origem; qualquer dependência/proteção bloqueia toda a transação.
- Com o parâmetro financeiro desativado, não criar novo financeiro. Um vínculo já existente não deve ser apagado ou abandonado silenciosamente apenas porque o parâmetro mudou; reler e aplicar política explícita de manutenção segura.

### Atomicidade e idempotência

Criação/alteração/exclusão financeira integra a mesma transação e chave de idempotência do Comando de Romaneio. Timeout ou replay não pode criar segundo Documento a Pagar ou segunda Duplicata. A idempotência do Romaneio referencia a identidade financeira resultante; se o núcleo financeiro possuir guard próprio, compor as identidades sem dois commits ou estados `succeeded` contraditórios.

Testes PostgreSQL reais devem cobrir criação, replay, atualização, parâmetro desligado após vínculo, evento inválido, divergência de total, Duplicata autorizada, Duplicata paga, exclusão bloqueada, falha depois do financeiro e rollback integral. Incluir teste de integração contra os mesmos commands/services usados pelo Cadastro de Documentos a Pagar, para impedir deriva futura.

## Segurança de endpoints e dados

- Requests usam autenticação, CSRF, validação tipada, rate limit nos desafios e allow-lists para sort/colunas.
- Busca por ID/chave retorna resultado indistinguível para inexistente versus não autorizado quando necessário para evitar enumeração.
- Exportações/downloads usam contexto preso ao Usuário e reautorização no consumo.
- Cancelamento F6 valida Usuário + screen key + trace e nunca cancela backend alheio.
- Logs não contêm senha, prova bruta, chave de sessão, payload financeiro desnecessário ou assinatura Base64.
- Ausência de configuração estrutural falha conforme ADR 0007; não usar `Schema::has*` ou introspecção runtime.

## Auditoria

Registrar:

- concessão/negação de acesso e capability relevante sem poluir logs com cada render de menu;
- Operador, Autorizador e papéis distintos;
- ação, Romaneio, Itens, Filiais, revisão, request/idempotência e resultado;
- emissão, reserva, consumo, expiração e rejeição de prova;
- snapshot lógico das descrições/valores efetivos dos parâmetros usados, evitando segredo;
- origem Laravel e instante do PostgreSQL.

Rejeições e falhas anteriores à mutação ficam na auditoria de comando; não criar entrada legada que afirme alteração inexistente.

## Critérios para os prompts

- Testar migration inicial, reexecução, catálogo parcialmente existente, identidade ambígua e ausência de grants automáticos.
- Testar Administrador e Usuário comum com/sem folha e com combinações de Filiais.
- Testar acesso direto a cada rota, inclusive cancelamento, exportação e download.
- Testar provas cross-action, cross-Romaneio, cross-Filial, payload/revisão alterados, expiração, replay e concorrência.
- Testar que as três ações aceitam credencial válida sem perfil inventado e continuam exigindo capacidade do Operador.
- Testar parâmetros globais, overrides por Filial, uma leitura em lote e falha atômica com evento inválido.
- Testar que o efeito financeiro reutiliza o núcleo Contas a Pagar Laravel, mantém exatamente uma Duplicata e não duplica repositories/regras.
- Testar proteção compartilhada de Duplicata autorizada/paga, Estorno fora do Romaneio e rollback conjunto Romaneio–financeiro.
- Testar ausência de vazamento em erros, logs e respostas.
