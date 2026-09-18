# Pesquisa de autorizações, senha e menu — Controle de Recebimentos

## Escopo e fontes

Este artefato separa autorização sensível de negócio, acesso ao módulo/menu e escopo de Filial para o futuro Laravel. Fontes Delphi: `C:/projetos.vcl/apps/caixa/dmcontrolerecebimentos.pas` (`:699-706`, `:856-1000`, `:1567-1587`), `dmcontrolerecebimentos.dfm`, `fmcontrolerecebimentos.pas/.dfm`, `C:/projetos.vcl/repositorio/frlistafiliais.pas` e `C:/projetos.vcl/biblio/clparametrossistema.pas`. Fontes Laravel foram inspecionadas somente para localizar padrões concretos de integração.

## 1. Evidências Delphi

### Acesso à tela e escopo de Filial

- **NÃO LOCALIZADO:** as quatro units da tela não contêm `acessosmodulos`, `usuariosacessosmodulos`, nome do menu, capability ou verificação explícita para abrir `Caixa -> Controle de Recebimentos` (`fmcontrolerecebimentos.pas/.dfm`, `dmcontrolerecebimentos.pas/.dfm`).
- **CONFIRMADO:** a tela usa `TfraListaFiliais`; o frame restringe as Filiais de um usuário não administrador e entrega uma lista textual ao SQL (`fmcontrolerecebimentos.pas:178-180`; `frlistafiliais.pas:50-64`, `:101-116`).
- **INFERIDO:** escopo de Filial é filtro e controle de dados, não prova de autorização do módulo. No Laravel, validar a lista recebida no backend contra `usuariosfiliais`/regra administrativa; nunca confiar somente no filtro do frontend.

### Operações e autorização sensível

- **CONFIRMADO:** F5 chama `GravarRecebimentos`, que chama `ObterAutorizacaoPagamento` antes de processar (`dmcontrolerecebimentos.pas:699-706`).
- **CONFIRMADO:** se o usuário corrente for Analista de Crédito, o Delphi solicita senha; caso contrário solicita login com os tipos `ctANALISTACREDITO` e `ctAUTORIZADO`. O resultado só é aceito quando o usuário obtido tem `analistacredito`; caso contrário mostra `ctUSUARIONAOAUTORIZADO` (`dmcontrolerecebimentos.pas:1567-1587`).
- **CONFIRMADO:** a autorização sensível é usada pela gravação/alteração de tipo, não foi localizada como requisito para simplesmente abrir a consulta (`dmcontrolerecebimentos.pas:1444-1562`).
- **DÚVIDA:** as units não deixam uma matriz independente por operação com distinção formal entre alterar tipo, confirmar e estornar; o código converge em `GravarRecebimentos` e em `RecalcularRecebimentos`.
- **NÃO LOCALIZADO:** exigência de senha de gerente, supervisor ou outro grupo além do perfil de Analista de Crédito para esta tela.

### Parâmetro que altera efeitos bancários

`Recebimentos Integrado com Bancos` é lido por `parsistema.RecebimentosIntegradoComBancos`, junto com o gate `InicioIntegracaoBancos`/`DataServidor` (`dmcontrolerecebimentos.pas:856-1000`; `clparametrossistema.pas:5792-5800`, `:2270`; `dmbasico.pas:17225-17230`). Isso habilita efeitos em `movtosbancos`/`movtosbancoseventos`, mas não concede autorização por si só.

## 2. Padrões Laravel localizados

### Menu e grant

- **CONFIRMADO:** o padrão recente cria uma folha própria em `acessosmodulos`, com rota canônica, label, parent, ordem e `teclux_cloud`; exemplo: `laravel/backend/database/migrations/2026_08_04_315000_acessosmodulos_confirmacao_por_romaneios.php:14-70`.
- **CONFIRMADO:** o serviço de acesso resolve a folha pela rota e exige relação explícita em `usuariosacessosmodulos`; Administrador tem bypass explícito. Exemplo: `laravel/backend/app/Services/Authorization/InterlojasConfirmacaoPorRomaneiosModuleAccessService.php:13-52`.
- **CONFIRMADO:** middleware separado redireciona anônimo ao login e retorna 403 quando o grant não existe: `laravel/backend/app/Http/Middleware/EnsureInterlojasConfirmacaoPorRomaneiosModuleAccess.php:13-34`.
- **CONFIRMADO:** `LegacyUsuarioAcessosModulosRepository` usa `usuariosacessosmodulos(usuario, acesso)` e `whereIn` para revogação em lote (`laravel/backend/app/Infrastructure/Persistence/Legacy/User/LegacyUsuarioAcessosModulosRepository.php:10-48`).
- **DIVERGENTE / GUARDRAIL:** migrations históricas do Laravel usam `Schema::hasTable`/`hasColumn` e serviços usam branches por `getDriverName()` (`2026_08_04_315000...php:22-23`; `UsuarioModuleGrantsService.php:83-87`). O usuário proibiu esses testes para este esforço; o prompt final deve declarar schema fixo/versionado, não copiar esses fallbacks nem criar testes de driver.

### Autorizações sensíveis e senha

- **CONFIRMADO:** `SensitiveOperationCatalog` resolve a combinação `(modulo, acao)` por configuração e associa perfil legado, modo de senha e parâmetro (`laravel/backend/app/Services/Authorization/SensitiveOperationCatalog.php:10-45`).
- **CONFIRMADO:** `SensitiveOperationCredentialValidator` valida login/senha, conta bloqueada/ativa, usuário ativo e perfil exigido; suporta perfil `analistacredito` e outros perfis legados (`laravel/backend/app/Services/Authorization/SensitiveOperationCredentialValidator.php:20-121`).
- **CONFIRMADO:** `SensitiveOperationAuthService` suporta senha-only para operador elegível, limita tentativas, emite prova contextual curta e audita resultado sem armazenar senha (`laravel/backend/app/Services/Authorization/SensitiveOperationAuthService.php:25-220`).
- **CONFIRMADO:** `SensitiveOperationProofService` produz prova com estados `issued/reserved/spent`, TTL, lock e contexto de operador/Filial/módulo/ação (`laravel/backend/app/Services/Authorization/SensitiveOperationProofService.php:10-130`).
- **INFERIDO:** a migração deve registrar operador e autorizador separadamente, atrelar a prova ao contexto/IDs/Filial e consumir a prova na operação; não transportar credenciais para auditoria.

### Parâmetros e Filial

- **CONFIRMADO:** `ParameterService::get` resolve `parametros_valor(?, ?)` no PostgreSQL e `getMany` agrupa nomes em uma única leitura, com memória por request (`laravel/backend/app/Services/Parameter/ParameterService.php:13-28`, `:36-174`).
- **CONFIRMADO:** `UserBranchAccessService` valida `usuariosfiliais`, oferece Filiais autorizadas com `whereIn` e trata Administrador explicitamente (`laravel/backend/app/Services/Branch/UserBranchAccessService.php:15-128`).
- **Handoff:** criar manifesto para `Recebimentos Integrado com Bancos`, mantendo nome legado e conversão booleana; definir fallback e precedência no ticket de domínio/padrões.

## 3. Matriz inicial de autorização para especificação

| Superfície | Evidência Delphi | Contrato Laravel a decidir |
|---|---|---|
| Abrir menu/página | Não localizado | Capability/folha própria em `acessosmodulos`, rota e middleware/policy fail-closed |
| Consultar/F6 | Sem autorização explícita localizada | Exigir acesso ao módulo e validar Filiais no backend |
| Editar grid local | Campos condicionados por operação/estado | Capability de preparar/editar, sem confundir preferência de grid com direito de gravar |
| F5 confirmar | `ObterAutorizacaoPagamento`; Analista de Crédito | Ação sensível própria, parâmetro quando aplicável, prova contextual e auditoria |
| Alterar tipo | Confirmação + autorização em `RecalcularRecebimentos` | Operação sensível separada ou ação catalogada explicitamente |
| Estornar | Passa pela gravação/autorização comum; detalhe de perfil não isolado | Decidir se usa a mesma autorização ou capability/ação distinta |
| Relatório/exportação | Relatório não localizado no Delphi | Respeitar acesso à página, escopo de Filial e autorização de exportação se o padrão exigir |

## 4. Lacunas

- Nome/rota/código da folha `Caixa -> Controle de Recebimentos` não está nas fontes Delphi consultadas; não inventar código numérico nem herdar grant de outro módulo.
- Não foi localizada matriz de grupos Delphi (`gruposusuariosacessosmodulos`) específica da tela; confirmar pelo padrão central, sem presumir suporte.
- Não há decisão sobre se o mesmo Analista de Crédito pode operar todas as Filiais selecionadas ou se cada Filial exige prova/escopo individual.
- Não há decisão sobre autorização em consulta, exportação, relatório e edição antes do F5.
- Não há chamada literal a `parametros_valor('', '')` no Delphi; a equivalência Laravel deve usar `ParameterService`/manifesto já existente, não uma query por linha.

## Handoff

Os prompts SpecKit devem citar este artefato e os dois inventários anteriores, inspecionar apenas o Laravel atual para nomes finais, separar menu/grant de autorização sensível, validar Filiais no servidor, usar `ParameterService::getMany`, não armazenar senha, não usar `Schema::has*`/`hasTable`, não testar driver e não pedir reabertura dos fontes Delphi.
