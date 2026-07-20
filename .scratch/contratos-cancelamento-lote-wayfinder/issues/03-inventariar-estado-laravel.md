# Inventariar estado atual do Laravel para Cancelamento/Exclusão de Contrato

Type: task
Status: resolved
Blocked by:

## Question

O que já existe hoje no Laravel relevante para este recorte: Cadastro de Contratos (mesmo que ainda não implementado — confirmar o estado real da Etapa 1 do rollout do `cadastro-contratos-wayfinder`), Consulta de Contratos reutilizável, comandos `CancelarContrato`/`ReverterFaturamentoContrato` (devem estar apenas decididos, não implementados), policies/capabilities de Contrato, e o precedente estrutural de `CancelarOrcamentoCommand.php` citado no ticket 21? Confirmar também a leitura de `EXCLUSAO CONTRATO` via `parametros_valor` no `LegacySystemParametersRepository` (existe entrada no manifesto de parâmetros?).

## Answer

### Cadastro de Contratos (Etapa 1)

- `CONFIRMADO` — não existe Cadastro de Contratos (shell mutável de ciclo de vida `O/R/F/C`) no Laravel. A Etapa 1 (`Fundação`) do rollout do `cadastro-contratos-wayfinder` segue não implementada, como previsto nas Notes deste mapa.
- `CONFIRMADO` — o que existe é a **Consulta de Contratos**, majoritariamente leitura, com escritas pontuais e específicas já implementadas: `ConsultaContratosGravarAlteracaoService`/`...Request` (edição de campos específicos), `RegistrarContratoEntregaLojaService`/`...Request` (registro sensível de entrega em loja), impressão (`ContratoImpressaoService`, `ContratoClienteImpressaoOrchestrator`) e Ficha Financeira (`LegacyFichaFinanceiraContratoRepository`/`...TabsRepository`). Nenhuma delas cancela, exclui ou reverte Contrato.
- `CONFIRMADO` — arquivos relevantes reutilizáveis para o futuro Cancelamento: `LegacyConsultaContratosRepository`, `ConsultaContratosPolicy`/`VendasConsultaContratosAuthorizationService` (autorização de acesso à Consulta), `ConsultaContratosParameterManifest` (padrão de manifesto de parâmetros via `parametros_valor`, ver abaixo), `ConsultaContratosSensitiveOperationGate` (`ConsultaContratosGravarAlteracaoSensitiveOperationGate`/`...RegistrarEntregaLojaSensitiveOperationGate` — precedente de prova sensível citado no ticket 21).

### Comandos e capabilities de Cancelamento

- `CONFIRMADO` — `CancelarContrato`, `ReverterFaturamentoContrato` e capabilities (`contrato.cancelar_orcado`, `contrato.cancelar_reservado`, `contrato.cancelar_faturado`, `contrato.reverter_faturado`) não existem no código Laravel — busca em todo `laravel/` não encontrou nenhuma ocorrência. Confirma que o ticket 21 registrou apenas **decisão**, não implementação.
- `CONFIRMADO` — o precedente estrutural citado no ticket 21 existe e é concreto: `laravel/backend/app/Application/Vendas/Orcamentos/CancelarOrcamentoCommand.php`, com `CancelarOrcamentoService.php` correspondente. Mais importante: o próprio wayfinder de origem (`orcamentos-f6-exclusao-cancelamento-wayfinder`) **já chegou a produção** como `laravel/specs/227-orcamento-f6-excluir-cancelar/` (spec, plan, tasks) e há `laravel/docs/architecture/orcamentos-f6-cancel-exclude.md` documentando o resultado — é uma referência viva de como um `$to-spec` deste tipo termina implementado, útil para calibrar o nível de detalhe do nosso prompt final.

### Parâmetro `EXCLUSAO CONTRATO`

- `CONFIRMADO` — nenhuma ocorrência de `EXCLUSAO CONTRATO`/`ExclusaoContrato` em todo `laravel/`. O parâmetro não está em nenhum manifesto hoje; terá que ser adicionado quando este mapa chegar à implementação.
- `CONFIRMADO` — o padrão de manifesto a seguir já existe e está em uso: `ConsultaContratosParameterManifest` (`laravel/backend/app/Support/Vendas/ConsultaContratosParameterManifest.php`) implementa `CadastroParameterManifestContract` + trait `PreloadsCadastroParameterManifest`, expõe `descriptions(): array` com as descrições canônicas (Win-1252) e resolve valores via `ParameterReadBundle`/`ParameterService::getMany` — um único round-trip a `parametros_valor` por request. Um futuro manifesto de Cancelamento de Contrato deve seguir exatamente este padrão, tratando `EXCLUSAO CONTRATO` como enum (`E/C/P`/ausente), não como booleano (`isTruthyParameter` deste manifesto é para outro parâmetro, não deve ser copiado para este).

### Síntese

Não há nada a integrar ou reconciliar tecnicamente ainda além de decisão e desenho — é território novo, mas com precedentes de padrão (comando, policy, manifesto de parâmetro, sensitive operation gate) já maduros e replicáveis no domínio de Contrato. O prompt final deve apontar explicitamente para `CancelarOrcamentoCommand.php`/`CancelarOrcamentoService.php` e para o spec `227-orcamento-f6-excluir-cancelar` como referências estruturais, e para `ConsultaContratosParameterManifest.php` como modelo de leitura de parâmetro.
