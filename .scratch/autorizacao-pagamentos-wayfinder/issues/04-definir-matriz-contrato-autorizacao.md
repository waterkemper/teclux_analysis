# Definir a matriz e o contrato seguro da Autorização de Pagamentos

Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Confrontando Delphi, Laravel atual e o contrato de Quitação, o que deve ser preservado, estendido, substituído ou excluído, e qual deve ser o contrato verificável de consulta, seleção, autorizar/desautorizar, proof, estado/revisão, Filiais, concorrência, auditoria, impressão, UX, erros e integração com Pay/lote/retorno?

## Answer

### Linguagem e limites do domínio

- **Duplicata** é a parcela de uma obrigação de Contas a Pagar, identificada por `(documentopag, datavencto, numero)`.
- **Autorização de Pagamento** é evidência contextual e revogável de que uma Duplicata pode ser submetida a uma tentativa de Quitação. Não movimenta banco, não contabiliza, não gera imposto e não torna a Duplicata paga.
- **Quitação** é o fato financeiro confirmado somente após commit e reconciliação de seus efeitos. Permanece sob o contrato da ADR-0246 e do dossiê de Quitação.
- **Operador** é o Usuário da sessão que inicia a ação. **Autorizador** é outro Usuário que concede a autorização por possuir a Permissão Pagamento. **Proof** é a credencial opaca, curta e consumível que evidencia essa aprovação; não é a Autorização persistida.
- Autorização automática é decisão do sistema por Parâmetro do Sistema, com origem própria; não deve fabricar Operador, Autorizador ou proof humano.

O glossário transversal em `CONTEXT.md` passa a registrar esses termos. Não é necessária nova ADR: a separação entre rascunho e comandos financeiros já está decidida pela ADR-0246; este ticket especifica o contrato subordinado.

### Matriz de decisão

| Tema | Decisão | Tratamento |
|---|---|---|
| Identidade da Duplicata | Usar `(documentopag, datavencto, numero)` | **Preservar** |
| Estado legado | `autorizado` + `dataautorizacaopagto` coerentes | **Preservar e corrigir** |
| Commands dedicados, locks, revision, idempotência, Filiais | Base atual Laravel | **Preservar e aprofundar** |
| Autorização unitária | `AuthorizeDuplicataPaymentCommand` | **Estender**, sem criar paralelo |
| Desautorização | Command dedicado ausente | **Adicionar** |
| Consulta transversal | Read model dedicado, paginado e filtrável | **Adicionar** |
| Seleção em lote | Identidades explícitas ou token servidor-side | **Adicionar** |
| Proof `quitar_duplicata` usado para autorizar | Contextos misturados | **Substituir** por ação própria |
| Gate que exige Pagamento do Operador | Impede delegação | **Substituir** por acesso ao módulo + proof de Autorizador |
| Impressão que autoriza | Efeito colateral Delphi | **Excluir** |
| Impressão JSON atual | Query sem mutação | **Estender** para multi-documento e PDF/preview |
| Parâmetro automático dentro do command manual | Ramo redundante | **Mover** para criação/recriação elegível |
| Filtros SQL concatenados/Filial apenas visual | Frágil | **Excluir**; usar binds e escopo autorizado |
| Estado provisório na data de autorização | Confunde seleção com persistência | **Excluir** |
| Log técnico como auditoria | Insuficiente | **Estender** com Auditoria durável/transacional |
| Pagamento direto de não autorizada com proof | Composição útil | **Preservar**, usando o mesmo contrato de autorização dentro da transação de Pay |

### Estados e transições

Estados observáveis da Duplicata:

1. `OPEN_UNAUTHORIZED`: `datapagto` vazio, `autorizado=false`, `dataautorizacaopagto=null`.
2. `OPEN_AUTHORIZED`: `datapagto` vazio, `autorizado=true`, data de autorização preenchida e evidência compatível com o snapshot financeiro vigente.
3. `PAID`: `datapagto` preenchido; fica fora das consultas e commands deste módulo.

Transições permitidas:

- `OPEN_UNAUTHORIZED -> OPEN_AUTHORIZED`: Autorizar manualmente ou aplicar Autorização Automática na criação/recriação.
- `OPEN_AUTHORIZED -> OPEN_UNAUTHORIZED`: Desautorizar manualmente, com motivo e proof específico.
- `OPEN_AUTHORIZED -> PAID`: somente pelo command de Quitação.
- `OPEN_UNAUTHORIZED -> PAID`: somente por composição atômica na qual Pay consome proof vinculado ao mesmo snapshot, estabelece a Autorização de Pagamento e conclui a Quitação na mesma transação.
- `PAID` não pode ser autorizado nem desautorizado. Cancelamento/Refazer da Quitação decide o estado aberto resultante pelo contrato de Quitação; quando restaurar autorização, deve emitir nova evidência auditada, não reutilizar silenciosamente a anterior.

Invariantes:

- `autorizado=true` exige `dataautorizacaopagto` não nula; `autorizado=false` exige data nula.
- Documento de previsão, Duplicata paga, Filial inacessível ou snapshot divergente nunca são elegíveis.
- Autorização manual vincula Documento, Duplicata, Parte Fornecedora, Filial de Emissão, valores financeiros relevantes e revisão. Alteração material invalida a evidência.
- Durante coexistência, `autorizado=true` legado sem Auditoria Laravel continua reconhecido como `LEGACY_UNATTRIBUTED`, sem inventar Autorizador; seu uso deve ser auditado e o snapshot corrente deve ser registrado na primeira operação Cloud que o consumir.

### Consulta e read model

Criar um read model dedicado da Autorização de Pagamentos, sem reutilizar o payload do cadastro de um Documento. A consulta deve:

- exigir ability de consulta e aplicar `UserBranchAccessService` antes da paginação;
- excluir previsões e pagas no servidor;
- aceitar operação `AUTHORIZE` ou `DEAUTHORIZE_OR_PRINT`;
- filtrar por Filial ou Grupo de Filiais, Parte Fornecedora `(tipo,codigo)`, intervalo de vencimento, lançamento e autorização;
- usar datas ISO e binds, validar início <= fim e intersectar grupos com as Filiais autorizadas;
- paginar por páginas, 25 por padrão, com ordenação determinística;
- retornar a identidade canônica, Documento, fornecedor, nota/série, vencimento, valor nominal, previsão calculada no servidor, estado, data/origem da autorização, observação, Filial, revisão e elegibilidade/razão.

Totais devem ser servidor-side e acompanhar exatamente o filtro autorizado: `total_count`, `total_previsao`. A UI calcula somente os totais da seleção explícita mostrada; para “todos os resultados”, usa resumo retornado pelo servidor.

### Seleção e lote

- Seleção local nunca altera campos persistidos. Marcar página seleciona identidades daquela página.
- “Selecionar todos os resultados” deve solicitar um `selection_token` opaco, curto, expirável e vinculado a filtros normalizados, Usuário, Filiais, operação, conjunto de chaves e revisões. Não aceitar booleano `todos=true` como autoridade.
- O command aceita ou lista explícita de itens com revisões, ou `selection_token`, nunca ambos. Deve impor limite configurado e falhar antes de mutar se excedido.
- O lote é **all-or-nothing**, preservando a semântica transacional Delphi: locks em ordem canônica, revalidação de todos os itens, proof/fingerprint do lote, gravação e Auditoria numa transação. Um conflito retorna todos os itens recusados conhecidos e nenhuma mudança.

### Commands verificáveis

Manter o command unitário e introduzir uma fachada profunda que possa atender item ou lote sem duplicar regras, por exemplo:

```text
search(AuthorizationSearch): AuthorizationPage
createSelection(SelectionIntent): SelectionToken
authorize(AuthorizePaymentIntent): AuthorizationCommandResult
deauthorize(DeauthorizePaymentIntent): AuthorizationCommandResult
print(PrintPaymentAuthorizationQuery): AuthorizationReport
```

Contrato comum de mutação:

- `Idempotency-Key` obrigatório, `origin` derivada pelo adapter, `expected_revision` por Documento/item ou embutida no token, proof e fingerprint da intenção;
- reserva/commit de idempotência dentro da mesma transação do negócio;
- lock de Documentos e Duplicatas em ordem determinística;
- Policy, Filiais, estado, revisão, Parâmetro do Sistema e proof revalidados sob lock;
- timestamps obtidos no servidor/banco;
- resposta com `command_id`, `replayed`, revisões novas, contagens, totais, itens alterados, `audit_id` e warnings, sem proof bruto.

Autorizar grava `autorizado=true` e `dataautorizacaopagto=server_now`. Desautorizar exige `reason`, grava `false/null` e não toca em dados de Quitação. “Já autorizado” e “já desautorizado” são conflitos de estado, salvo replay comprovado pela mesma chave.

### Operador, Autorizador, abilities e proof

- Abilities distintas: `viewPaymentAuthorizations`, `authorizePayment`, `deauthorizePayment` e `printPaymentAuthorization`.
- `viewPaymentAuthorizations` permite entrar/consultar somente dentro do módulo e das Filiais acessíveis. `authorizePayment`/`deauthorizePayment` no Operador significam poder iniciar o fluxo, não possuir a Permissão Pagamento.
- Autorização manual exige sempre proof de `ContasPagar/autorizar_pagamento_duplicata`; desautorização exige proof distinto `ContasPagar/desautorizar_pagamento_duplicata` e motivo.
- O Autorizador deve possuir perfil/Permissão Pagamento e ser diferente do Operador, conforme o contrato já fixado para Quitação. Administrador/Suporte não substitui essa Permissão.
- Proof vincula ação, Operador, Autorizador, Filiais, chaves, valores, revisões e hash do conjunto. Mudança invalida; consumo é único, dentro da transação; senha e proof bruto nunca são persistidos ou logados.
- Impressão é leitura: exige ability própria e Filiais, mas não proof sensível nem mutação.

### Parâmetro e Autorização Automática

`parametros_valor('AUTORIZACAO PAGTO AUTOMATICA')` deve continuar representado por `ContasPagarParameterManifest`, precedência Filial -> global -> ausente e fallback `false`, conforme ADR-0005.

O valor é aplicado nos pontos canônicos que criam/recriam Duplicatas abertas — inclusive Documento a Pagar, entrada de nota e residual quando o contrato de Quitação determinar — e não dentro do command manual. Quando ativo, grava estado/data e Auditoria com origem `SYSTEM_PARAMETER`, texto canônico do parâmetro e Filial; quando inativo, cria `OPEN_UNAUTHORIZED`. Conflito/valor inválido condicional deve resultar em inativo + log, sem introspecção de schema em runtime, conforme ADR-0007.

### Auditoria

Persistir Auditoria transacional por command e por item, correlacionada por `command_id`/`audit_id`, contendo:

- ação, origem (`ui`, `batch`, `supplier_return`, `system_parameter`, `legacy`), Operador e Autorizador quando aplicáveis;
- chaves, Filiais, Parte Fornecedora, revisão e snapshot/fingerprint antes/depois;
- data, motivo de desautorização, idempotency key hash, request/correlation id e resultado;
- referência segura ao evento de Sensitive Operation, nunca senha ou proof bruto.

`Log::info` permanece apenas para observabilidade. A Auditoria deve alimentar a consulta/histórico e permitir explicar quem, quando, por quê e sobre qual snapshot autorizou ou revogou.

### Impressão

- `PrintPaymentAuthorizationQuery` continua puramente de leitura e deve aceitar as mesmas identidades explícitas ou token de seleção do resultado autorizado.
- Revalidar ability, Filiais e estado; imprimir somente `OPEN_AUTHORIZED`. Se algum item estiver stale/inacessível, falhar sem autorizar ou imprimir parcialmente, salvo opção explícita de remover recusados antes da confirmação.
- Produzir preview e PDF com Documento/Duplicata, Parte Fornecedora, Filial, valores, data/origem da autorização, Autorizador quando conhecido, geração e correlação. Identificar legado não atribuído sem inventar nome.
- Imprimir nunca concede, renova, consome ou revoga Autorização de Pagamento.

### UX ERP

Criar página completa no diretório de modules já adotado, com toolbar superior conforme ADR-0002:

- alternância **Autorizar** / **Desautorizar ou imprimir**;
- filtros primários visíveis e filtros avançados colapsáveis sem perder estado;
- lookups acessíveis de Filial, Grupo de Filiais e Parte Fornecedora;
- grid paginada densa com colunas Delphi normalizadas, checkbox separado do estado, observação e razão de inelegibilidade;
- resumo do resultado e da seleção; comandos desabilitados sem seleção;
- confirmação de intenção com quantidade/valor/efeito antes do modal sensível;
- `F5` executa a mutação da operação, `F6` consulta, `F7` abre preview de impressão, `Esc` volta/fecha contexto; atalhos não disparam em inputs/modais e possuem alternativa visível;
- loading, empty, erro, forbidden, stale/conflict, sucesso, replay e timeout/retry explícitos; timeout reutiliza a mesma idempotency key e conflito recarrega preservando filtros, mas limpa seleção stale.

Seleção persiste entre páginas apenas enquanto filtros/operação/revisões continuarem compatíveis. Alterar filtro invalida token e pede confirmação se houver seleção.

### Erros HTTP e resultados

- `400/422`: filtros, intervalos, motivo, limite ou payload inválidos.
- `401`: sessão ausente; `403`: ability, Filial ou proof recusado.
- `404`: Documento/Duplicata não encontrada dentro do escopo autorizado, sem revelar existência externa.
- `409`: revisão, estado, selection token, idempotência ou fingerprint divergente; nenhuma mutação no lote.
- `410`: token de seleção expirado.
- `413`: seleção acima do limite.
- `503`: dependência/auditoria/reconciliação indisponível, com rollback e correlação.

Respostas de erro devem usar códigos de domínio estáveis (`DUPLICATA_PAID`, `ALREADY_AUTHORIZED`, `REVISION_CONFLICT`, `PROOF_CONTEXT_MISMATCH`, etc.), mensagem pt-BR e detalhes seguros por item.

### Integração com Pay, lote e retorno

- `PayDuplicataCommand` consulta o mesmo validador de Autorização; não replica regra de `autorizado`/proof. Se receber proof para Duplicata não autorizada, delega à mesma interface interna e vincula a evidência ao fingerprint do Pay.
- Autorização não aciona writers bancário, contábil ou tributário. Pay continua dono desses efeitos.
- `PayDuplicatasBatch` e retorno de fornecedor podem consumir Autorização existente ou solicitar a composição definida, mas não acessam repositories/writers internos nem fabricam `autorizado=true`.
- Cancelamento/Refazer da Quitação chamam a mesma política de estado resultante e Auditoria; não reutilizam proof consumido.

### Testes e aceite

Cobertura obrigatória em unit, feature, frontend e PostgreSQL real:

- filtros, paginação, totais, ordenação, Grupo/Filiais e não vazamento entre Filiais;
- abilities distintas, Operador/Autorizador, proof próprio/delegado/expirado/usado/contexto divergente e segredo ausente de logs;
- autorizar/desautorizar item e lote, data/estado coerentes, motivo, automática ativa/inativa/ausente/conflitante;
- pago, previsão, já autorizado/desautorizado, item removido, revisão stale, token expirado/adulterado e lote atômico;
- duas sessões concorrentes, locks ordenados, mesma idempotency key/payload, mismatch, timeout/retry e crash entre negócio/idempotência;
- Auditoria antes/depois, legado não atribuído, falha fechada e nenhum proof bruto;
- impressão multi-documento sem mutação, preview/PDF e Filiais;
- UX, teclado, acessibilidade, loading/empty/error/forbidden/conflict/replay e seleção entre páginas;
- regressão de cadastro protegido e integração Pay/lote/retorno sem efeitos financeiros na autorização.

Aceite: nenhum estado vem confiado do browser; nenhum pago/previsão/Filial externa é mutado; lote não produz sucesso parcial; retry não duplica; estado/data/Auditoria são coerentes; Autorização e Quitação permanecem separadas; impressão é leitura; UI só confirma após commit.
