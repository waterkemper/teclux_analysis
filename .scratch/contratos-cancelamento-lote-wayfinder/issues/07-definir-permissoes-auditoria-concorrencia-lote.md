# Definir Permissões, Autorizações, Auditoria e concorrência do lote

Type: grilling
Status: resolved
Blocked by: 03-inventariar-estado-laravel, 05-reconciliar-contrato-cancelamento-lote, 06-definir-contrato-exclusao-fisica-lote

## Question

Quais Permissões/Autorizações (incluindo prova sensível, se aplicável) controlam Cancelar e Excluir nesta tela, como a Auditoria/correlation id é registrada por item do lote, e qual é o contrato de idempotência/concorrência quando dois Usuários processam lotes sobrepostos ou quando a `revision` de um Contrato muda entre a seleção e a confirmação?

## Answer

### Permissões e capabilities

- `DECISÃO NOVA` — Cancelamento reaproveita, sem alteração, as três capabilities já decididas no ticket 21 do `cadastro-contratos-wayfinder`: `contrato.cancelar_orcado`, `contrato.cancelar_reservado`, `contrato.cancelar_faturado`.
- `DECISÃO NOVA` — Exclusão física ganha uma capability nova e distinta: `contrato.excluir_orcado` (nome de trabalho) — não compartilha capability com Cancelamento, é ação mais sensível.
- `DECISÃO NOVA` — acesso à tela em si é controlado por uma permissão separada das capabilities por operação (`viewAny`/`search`, mesmo padrão de `ConsultaContratosPolicy`/`VendasConsultaContratosAuthorizationService`) — a permissão de tela nunca substitui a checagem de capability por operação no backend.

### Autorização sensível

- `DECISÃO NOVA` — Cancelamento reaproveita `SensitiveOperationProof` exatamente como o ticket 21 decidiu (uso único, vinculado a ação/Contrato/Filial/`revision`, "quando exigido" — replicando a lógica condicional do Delphi de reautenticação por senha versus autorização já presente na sessão, conforme Situação e `AutorizacaoCancelarContratoFaturado`).
- `DECISÃO NOVA` — Exclusão física também passa a exigir `SensitiveOperationProof`, mesmo o Delphi não tendo nenhuma checagem de autorização explícita em `ExcluirContratos` (nem nesta tela, nem no Cadastro principal). Mesma lógica já usada no ticket [Definir o contrato seguro de Exclusão física em lote](06-definir-contrato-exclusao-fisica-lote.md): a capability controla quem pode ver a ação, a prova sensível protege o momento de executar algo irreversível.

### Auditoria e correlation

- `DECISÃO NOVA` — sem identificador de lote/`batch correlation id`. Cada item processado é rastreável só pelo seu próprio `correlation id`, gerado pelo comando (`CancelarContrato`/`ExcluirContratoOrcado`) tal como já decidido no ticket 21 — a tela de lote não introduz uma camada de agrupamento própria.
- `CONFIRMADO` — Auditoria permanece a cargo dos triggers `_log_new` (mesmo padrão de todo o `cadastro-contratos-wayfinder`, confirmado fisicamente no ticket [Confirmar cobertura física das triggers de auditoria do Contrato](../cadastro-contratos-wayfinder/issues/25-confirmar-cobertura-fisica-das-triggers-de-auditoria-do-contrato.md)); nenhuma auditoria paralela específica desta tela.

### Concorrência e idempotência

- `DECISÃO NOVA` (decorre diretamente das decisões dos tickets 04/05/06, não nova discussão) — cada item é sua própria transação com revalidação de `revision`/Situação/capability/vínculos no momento da execução, não no momento da listagem (F6/Gerar). Um Contrato alterado por outra sessão entre a seleção e a confirmação simplesmente produz o resultado tipado "conflito de revision" para aquele item, sem abortar o restante do lote.
- `DECISÃO NOVA` — duplo clique, repetição do comando de confirmação ou dois Usuários processando lotes sobrepostos resultam em, no máximo, um resultado "já cancelado"/"já excluído"/"conflito" idempotente por item — nunca em duplicação de efeito (mesmo padrão de idempotência por comando já decidido no ticket 21, aplicado por item, não por lote).
