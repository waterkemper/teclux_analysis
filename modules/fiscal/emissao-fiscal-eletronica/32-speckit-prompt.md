# Prompt para `/speckit.specify` — fechamento residual da spec 31

```text
/speckit.specify

Revise o código Laravel atual após a implementação da spec 31 e produza uma especificação corretiva pronta para implementação. Não implemente código nesta execução.

O objetivo é fechar somente as lacunas residuais verificadas na validação da spec 31. Não reabrir arquitetura fiscal, não criar segundo pipeline e não alterar o escopo de emissão já aprovado.

## Escopo que permanece válido

- NF-e modelo 55, transferência fiscal já existente, Filial de SC e homologação Linux.
- Configuração normativa versionada, snapshot efetivo, catálogo de Web Services, tela administrativa e diagnóstico explícito.
- Certificado continua com vínculo explícito à Filial; não criar fallback por raiz de CNPJ.
- NFS-e, Emissor Nacional, modelo 98, NFC-e 65, produção, venda/devolução entre Filiais e entrada fiscal automática continuam fora.
- Não criar mapa SC→SVRS no gateway e não descobrir endpoint pelo XSD.

## Evidências encontradas na implementação atual

1. `FiscalCatalogoProveniencia::tryFromMixed()` converte tanto ausência quanto proveniência inválida em `null`. O resolvedor em `Infrastructure/Fiscal/Persistence/FiscalConfigurationResolver.php` e a projeção da listagem em `Application/Fiscal/ListarConfiguracaoNormativaService.php` não distinguem `metadados` ausentes de `metadados` presentes, porém ilegais.
2. Por isso, uma linha `PUBLICADA` modelo 55 com JSON de proveniência malformado, enum inválido, fonte não oficial, data inválida ou hash inválido ainda pode ser resolvida como snapshot e/ou aparecer como `PUBLICADA`. O contrato 388 exige que proveniência presente e ilegal torne a configuração não efetiva; somente legado sem metadados pode continuar sujeito à regra de legado.
3. `resources/js/Pages/Fiscal/ConfiguracaoNormativa/Show.tsx` exibe `publicado_em` e `motivo`, mas não exibe `publicado_por`, embora a auditoria obrigatória do detalhe exija quem publicou, quando e motivo.
4. `Application/Fiscal/ConsultarWsdlNormativoService.php` chama `DOMDocument::loadXML()` com `LIBXML_NOENT`, permite `definitions` sem namespace WSDL e só verifica o limite de corpo depois que a resposta inteira já foi carregada. Isso não fecha o contrato de XML sem entidades externas, WSDL real e teto de resposta.
5. O modelo de publicação usa fallback numérico para modelo 55 quando o campo está ausente (`$modelo > 0 ? $modelo : 55`), mas a exigência de proveniência é avaliada usando o valor original. Especificar se o modelo deve ser obrigatório e rejeitado quando ausente/inválido; não permitir que payload incompleto contorne a validação de modelo 55.

Classifique cada item como CONFIRMADO, PARCIAL, CORRIGIDO ou NÃO LOCALIZADO, citando arquivo, método, teste e comportamento observado. Não repetir correções já concluídas na spec 31 sem evidência de regressão.

## Correção 1 — distinguir metadados ausentes de metadados inválidos

Definir uma API de parsing que preserve três estados:

- ausente: `null` ou coluna sem valor, permitindo a regra documentada para snapshot legado;
- válido: proveniência completa e aprovada pela `FiscalFonteOficialPolitica`;
- inválido: valor presente, mas malformado ou rejeitado pela política.

Aplicar a distinção em:

- `FiscalConfigurationResolver`: se a configuração modelo 55 tiver `metadados` presentes e inválidos, retornar `FiscalConfigResolutionFailure` de incompatibilidade/inelegibilidade e não devolver `FiscalConfigSnapshot`;
- diagnóstico: falhar antes da rede e não chamar status SEFAZ quando a proveniência inválida impedir a resolução;
- `ListarConfiguracaoNormativaService`: estado calculado não pode ser `PUBLICADA` para linha publicada com proveniência presente inválida; mostrar `INELEGÍVEL` ou `INCOMPLETA` conforme a matriz 388;
- cartão da Filial: exibir estado e próximo passo coerentes, sem afirmar configuração efetiva quando a linha foi rejeitada;
- diff: continuar comparando somente contra o vigente efetivo; não tratar uma linha inválida como vigente.

Não invalidar automaticamente todo legado sem metadados se ele ainda satisfizer a regra explícita de legado do contrato 388. Não expor o JSON inválido nem segredos nas respostas.

## Correção 2 — auditoria completa no detalhe

No detalhe `/fiscal/configuracao-normativa/{id}`, mostrar `publicado_por` junto de `publicado_em` e `motivo`, com dados sanitizados. Garantir que o tipo TypeScript e a projeção Inertia preservem o campo.

Adicionar teste Vitest e teste HTTP/Inertia que comprovem os três campos de auditoria e a ausência de senha, PFX, chave privada, token e corpo externo.

## Correção 3 — parser WSDL compatível com o contrato de segurança

Em `ConsultarWsdlNormativoService`:

- remover `LIBXML_NOENT`;
- usar parsing XML sem expansão/substituição de entidades e sem acesso a entidades externas, mantendo `LIBXML_NONET`;
- rejeitar DTD/entidades quando presentes, ou demonstrar por teste que não são expandidas nem causam acesso externo;
- exigir elemento raiz `definitions` no namespace WSDL aceito (`http://schemas.xmlsoap.org/wsdl/` ou versão formalmente suportada), não aceitar `definitions` sem namespace apenas porque o nome coincide;
- manter host aprovado, HTTPS, porta, redirects zero, timeout de até 5 segundos e resposta sanitizada sem trecho/body;
- aplicar o limite de 512 KiB durante a leitura/transferência ou por mecanismo equivalente que impeça baixar e acumular resposta arbitrariamente grande antes da validação;
- quando serviço/versão forem informados no contrato da chamada, validar compatibilidade com o perfil; se a API atual não recebe esses campos, documentar a decisão e cobrir ao menos a validação do WSDL do serviço solicitado;
- não transformar consulta WSDL em precondição de publicação ou diagnóstico.

Adicionar testes negativos para:

1. XML `definitions` sem namespace WSDL;
2. DTD/entidade externa ou entidade expansível;
3. corpo acima de 512 KiB;
4. WSDL incompatível com serviço/versão quando esses dados forem informados;
5. confirmação de que nenhum request de status/autorização é feito.

## Correção 4 — payload de publicação sem modelo implícito

Definir o contrato de entrada para exigir modelo e ambiente válidos quando a configuração é publicada ou submetida a dry-run. Rejeitar modelo ausente, zero ou inválido antes de aplicar regras específicas do NF-e 55. Não usar 55 como fallback silencioso para completar payload incompleto.

Preservar o escopo atual e não ampliar suporte para NFC-e, NFS-e, produção ou outros modelos. Atualizar mensagens, matriz de falhas e testes somente onde essa validação for necessária.

## Testes de aceite obrigatórios

- proveniência ausente em legado permitido somente quando a regra de legado for satisfeita;
- proveniência presente inválida não resolve snapshot, não aparece como `PUBLICADA` e bloqueia diagnóstico antes da rede;
- fonte oficial, data e hash continuam validados pela política 388;
- `publicado_por`, `publicado_em` e `motivo` aparecem no detalhe;
- XML sem namespace WSDL é recusado;
- DTD/entidade não é expandida nem acessa rede;
- resposta WSDL acima de 512 KiB é recusada sem acumulação ilimitada;
- modelo ausente/inválido não passa por fallback para 55;
- regressão dos testes 385/388 permanece verde;
- nenhuma resposta contém senha, PFX, chave privada, token ou corpo externo;
- nenhuma rota ou fluxo de NFS-e, venda/devolução entre Filiais ou produção é criado/reativado.

## Verificação da entrega

Executar `php -l` nos PHP alterados, `git diff --check`, testes Unit/Feature fiscais, testes Vitest das telas e testes PostgreSQL quando disponíveis. Se Docker ou serviços externos não estiverem disponíveis, registrar a limitação sem declarar prontidão real de homologação.

Entregar `spec.md`, contratos afetados, tarefas, matriz de falhas, testes de aceite e runbook revisado. Não alterar código nesta chamada.
```
