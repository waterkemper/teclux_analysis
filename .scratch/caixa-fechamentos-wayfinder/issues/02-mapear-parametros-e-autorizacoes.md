# Mapear Parâmetros do Sistema e Autorizações envolvidos no Fechamento de Caixa

Type: task
Status: resolved
Blocked by:

## Question

Quais Parâmetros do Sistema (`ParSistema.LimiteDiasFechamentoCaixa`, `VisualizarFechamentoCaixa`, `NomeImpressoraFechamentoCaixa`, `NomeImpressoraNFCe`, `Emissor_de_NFC_e`, `Autenticadora`, `MaxColAutenticadora`, `Cancelamentos`, `ChequePrazo`, `ChequeVista`, `Depositos`, `Devolucoes`, `DevolucoesSaldo`, `Documentos`, `Duplicatas`, `Perdas`, `Recebimentos`, `ResgateDeCheques`, `Resumo`, `Transferencias`, `Assinatura1/2/3`, `NumeroCopias`) e quais Autorizações/Permissões (`GerenteCaixa`, `Administrador`, `Suporte`, `ObterAutorizacao(taSENHA, ctPARAALTERACAOEVENTOCAIXA, ctGERENTECAIXA, '')`, restrição de fechar somente o próprio caixa) já têm equivalente no Laravel — em especial no Configuration Center (`specs/054-configuration-center`) e no padrão de autorização sensível por senha já usado em outros módulos —, e quais ainda não existem?

## Answer

Evidência lida em `biblio/clparametrossistema.pas` (todas as properties confirmadas existir), `biblio/ctconstantes.pas`, `biblio/clusuario.pas`, `repositorio/dmbasico.pas` (`ObterAutorizacao`), e no Laravel em `specs/054-configuration-center/spec.md`, `LegacyUsuarioReadRepository.php`, `migrations/2026_04_02_000001_align_usuarios_perfil_booleans_sqlite.php` e o cluster `app/{Http/Controllers,Http/Requests,Services}/Authorization/*SensitiveOperation*`.

### Parâmetros do Sistema — via `FList[ctX]` (equivalente Laravel: Configuration Center, `specs/054-configuration-center`, já existente e desenhado exatamente para esse formato: chave técnica, tipo boolean/integer/string, valor global com override por filial via `parametrosfiliais`)

CONFIRMADO, todos resolvidos por getter/setter que passam por `FList` (o mecanismo genérico de parâmetro do Delphi, equivalente a uma linha em `parametrosfiliais`):

- `LimiteDiasFechamentoCaixa` (Integer) — limite de dias retroativos para fechar caixa, só se aplica a quem não é Administrador/Suporte
- `VisualizarFEchamentoCaixa` (Boolean) — controla se o botão de pré-visualizar (sem fechar) aparece
- `Cancelamentos`, `ChequePrazo`, `ChequeVista`, `Depositos`, `Devolucoes`, `DevolucoesSaldo`, `Documentos`, `Duplicatas`, `Perdas`, `Recebimentos`, `ResgateDeCheques`, `Resumo`, `Transferencias` (todos Boolean) — cada um é o valor **padrão inicial** do checkbox correspondente na aba Impressão (o usuário pode religar/desligar manualmente antes de gerar; não são um "on/off" travado)
- `Assinatura1`, `Assinatura2`, `Assinatura3` (String) — texto de rodapé/assinatura do relatório
- `NumeroCopias` (Integer) — número de vias a repetir no relatório (o loop `for a := 1 to ParSistema.NumeroCopias` reimprime o relatório inteiro N vezes)

Ainda não confirmado se essas chaves específicas já existem como linhas cadastradas em `parametrosfiliais`/no catálogo do Configuration Center, ou só a infraestrutura genérica existe — DÚVIDA a resolver ao escrever o prompt do Fechamento (ticket 09/13): registrar as chaves que faltarem.

### Parâmetros de hardware/impressão física — sem equivalente necessário

`NomeImpressoraFechamentoCaixa`, `NomeImpressoraNFCe`, `Autenticadora`, `MaxColAutenticadora`, `Emissor_de_NFC_e` são todos DIVERGENTE/fora de escopo: os quatro primeiros (`Autenticadora`, `MaxColAutenticadora`, `NomeImpressoraFechamentoCaixa`, `NomeImpressoraNFCe`) nem passam por `FList` — são campos privados simples (`FAutenticadora`, `FMaxColAutenticadora`, etc., sem loader visível neste arquivo, plausivelmente configuração de estação de trabalho/impressora local). Como o mapa já decidiu (Notes) que o Fechamento vira PDF e ECF/impressora matricial/TEF ficam fora de escopo, nenhum desses cinco parâmetros precisa de equivalente Laravel.

### Autorizações e Permissões

- `GerenteCaixa`, `Administrador`, `Suporte`, `Caixa` (perfil "opera caixa") — todos CONFIRMADO já existentes no Laravel: `gerentecaixa`, `suporte` e `caixa` são booleans de perfil (`migrations/2026_04_02_000001_align_usuarios_perfil_booleans_sqlite.php`); `administrador` é campo de primeira classe já tratado à parte na UI (`LegacyUsuarioReadRepository.php`).
- `ObterAutorizacao(taSENHA, ctPARAALTERACAOEVENTOCAIXA, ctGERENTECAIXA, '')` (`dmfechamentocaixa.pas` → `SalvarEventos`) — autorização sensível **por senha** (não exige logout/re-login completo, `taSENHA` ≠ `taLOGIN`), com mensagem formatada a partir de `Motivo`='Para a alteração dos eventos do caixa' e `Responsavel`=' GERENTE DE CAIXA'; retorna um usuário autorizado cujo `.GerenteCaixa` precisa ser `true` para a operação prosseguir. Equivalente Laravel CONFIRMADO já existente e reutilizado por outros fluxos sensíveis (Contas a Pagar, Cancelamento de Contratos): `SensitiveOperationAuthController` / `ValidateSensitiveOperationProofRequest` / `SensitiveOperationAuthService` / `SensitiveOperationProofService`.
- Nota de nomenclatura (não é bug, só alerta pra não confundir ao portar): existem **dois** símbolos chamados `ctGERENTECAIXA` em units diferentes — `ctconstantes.pas` (String `' GERENTE DE CAIXA'`, rótulo de mensagem) e `clusuario.pas` (Integer `28`, índice posicional de campo em `qryUsuarios`). São independentes, sem colisão de compilação, mas merecem nomes distintos no domínio Laravel.
- Regra "fechar somente o próprio caixa": é comparação direta de código (`edfCodigoCaixa.Text = IntToStr(CodigoUsuario)`), **não** gateada por nenhuma flag de permissão — é regra fixa de negócio, sem parâmetro. `GerenteCaixa`/`Administrador`/`Suporte` só habilitam **editar o campo de seleção de caixa** (poder consultar/imprimir o fechamento de outro operador), não autorizam de fato fechar o caixa de outra pessoa. Essa distinção é relevante para o ticket de "Definir a ação Fechar Caixa".
