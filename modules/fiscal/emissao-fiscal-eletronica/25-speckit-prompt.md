# Prompt para /speckit.specify — fechamento da reconciliação fiscal e consistência final do sync

```text
/speckit.specify

Revise o código Laravel atual após a implementação da spec 24 e produza uma especificação corretiva final, pronta para implementação. Não implemente código nesta execução.

O foco desta revisão é somente fechar as lacunas residuais de reconciliação, atomicidade, auditoria, dependências do contribuinte canônico e regressão NF-e/NFC-e.

## Escopo fechado

1. NFS-e permanece fora desta execução. Não criar, alterar ou expandir gateway, porta, gate, política, emissão, consulta, ADN, modelo 98 ou homologação NFS-e.
2. A exposição de CNPJ completo na administração é permitida e não deve gerar requisito, bloqueio, sanitização ou alteração de contrato.
3. Não implementar venda entre Filiais, transferência de posse, devolução entre Filiais ou qualquer fluxo comercial de transferência.
4. NF-e/NFC-e devem continuar selecionando certificado por vínculo explícito da Filial, sem fallback automático pela raiz de CNPJ.

## Evidências para validar no código atual

Inspecione, no mínimo:

- `backend/app/Application/Fiscal/Certificate/ReconciliarEstabelecimentoFiscalService.php`;
- `backend/app/Application/Fiscal/Certificate/SyncFiliaisFiscaisService.php`;
- `backend/app/Application/Fiscal/Certificate/FiscalContribuinteCanonicoResolver.php`;
- `backend/app/Application/Fiscal/Certificate/FiscalEstabelecimentoDivergenciaGuard.php`;
- `backend/app/Application/Fiscal/Certificate/ManageCertificateLinkService.php`;
- `backend/app/Application/Fiscal/Certificate/ActivateCertificateLinkService.php`;
- `backend/app/Application/Fiscal/Certificate/SelectCertificateService.php`;
- `backend/app/Application/Fiscal/Certificate/FiscalCertificadoAdminProjector.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/FilialFiscalContextReader.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/CloudFiscalCertificadoRepository.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/CloudFiscalContribuinteRepository.php`;
- testes em `backend/tests/Feature/Fiscal/Certificate` e `backend/tests/Unit/Fiscal/Certificate`.

Classifique cada achado como CONFIRMADO, PARCIAL, CORRIGIDO ou NÃO LOCALIZADO, citando arquivo, método, linha aproximada e teste relacionado.

## Correção 1 — reconciliação manual idempotente também deve auditar `noop`

O fluxo atual retorna `resultado = noop` quando o estabelecimento já está consistente, mas pode sair antes de gravar a auditoria `sync_reconciliar`. O teste da reconciliação espera que a operação administrativa autenticada seja auditada mesmo quando não há alteração.

Defina o contrato:

- toda chamada manual autorizada e reautenticada deve gerar exatamente uma auditoria do comando, inclusive `resultado = noop`;
- a auditoria de `noop` deve registrar estabelecimento, contribuinte de origem/destino, resultado e motivo, sem senha, PFX, PEM, ciphertext ou material;
- `noop` não pode atualizar timestamps, criar registros, mover vínculos ou gerar novas duplicatas;
- repetir o comando deve permanecer idempotente no estado persistido, embora cada comando administrativo efetivamente recebido possa ter sua própria evidência de auditoria;
- falha de reautenticação ou validação não deve gerar auditoria de sucesso;
- atualizar o teste Feature para provar a quantidade e o conteúdo mínimo da auditoria `noop`.

Não resolver isso removendo a expectativa de auditoria do teste sem justificar uma mudança formal de contrato.

## Correção 2 — divergência com qualquer dependência relevante não pode sofrer rebase automático

O sync atual decide o bloqueio da divergência do estabelecimento principalmente pela existência de vínculos no estabelecimento. Verifique o caso em que o estabelecimento aponta para um contribuinte incorreto, não possui vínculo direto, mas o contribuinte de origem possui versões, material ou outras dependências fiscais.

A especificação deve fixar e implementar uma regra única:

- sem versões, vínculos, material ou dependências de estabelecimento no contribuinte de origem: rebase automático, preservando o ID do estabelecimento;
- com qualquer versão/material/vínculo ou dependência relevante: não mover automaticamente, registrar divergência/bloqueio e exigir reconciliação manual autenticada;
- a decisão deve ocorrer antes de alterar o snapshot Cloud do estabelecimento, ou deve definir claramente quais campos podem ser atualizados sem esconder a divergência;
- o relatório deve informar a razão do bloqueio e os IDs/quantidades afetados;
- a reconciliação manual deve ser o único caminho para resolver o caso bloqueado;
- novo vínculo, ativação e seleção NF-e devem continuar recusados enquanto a divergência permanecer bloqueada.

Defina com precisão se “dependência relevante” é avaliada no estabelecimento, no contribuinte de origem ou nos dois. A regra deve ser consistente entre `SyncFiliaisFiscaisService`, `FiscalContribuinteCanonicoResolver` e `ReconciliarEstabelecimentoFiscalService`.

Inclua teste específico para contribuinte de origem com versão/material, mas sem vínculo no estabelecimento divergente. Esse teste deve provar que não ocorre `rebaseados_automaticos`.

## Correção 3 — criação do contribuinte canônico deve respeitar atomicidade

Verifique se `canonicalContribuinteId()` cria um contribuinte antes de entrar na transação que atualiza estabelecimento, versões e vínculos.

O contrato deve garantir:

- descoberta e criação do contribuinte canônico dentro da mesma transação da reconciliação;
- rollback completo se falhar a atualização do estabelecimento, versão, vínculo ou auditoria transacional;
- nenhuma duplicata de contribuinte criada por duas reconciliações concorrentes da mesma raiz;
- reconsulta ou lock apropriado para decidir o canônico sob concorrência;
- preservação dos IDs quando a operação for concluída;
- teste de exceção no meio da reconciliação provando que não sobra contribuinte novo nem alteração parcial.

Se o projeto não puder garantir lock/unique constraint para a raiz, a especificação deve documentar a estratégia segura de concorrência e o comportamento de retry, sem apagar dados antigos.

## Correção 4 — relatório e auditoria do sync

Revise o relatório atual e confirme que ele mantém compatibilidade com os campos existentes:

- `criados_contribuintes`;
- `atualizados_contribuintes`;
- `criados_estabelecimentos`;
- `atualizados_estabelecimentos`;
- `rebaseados_automaticos`;
- `impedidos`;
- `orfaos`;
- `divergentes`;
- `bloqueados`;
- `duplicatas`;
- `duplicatas_contribuintes`.

Corrija, se necessário:

- contadores que aumentam em uma segunda execução sem mudança;
- duplicatas reportadas sem ação ou sem dependências identificadas;
- mutações escondidas em campos auxiliares ou não refletidas na auditoria;
- auditoria ausente quando há reconciliação necessária, mas nenhuma mutação automática;
- relatório que não diferencia duplicata de Filial, duplicata de contribuinte, órfão e divergência.

O resultado deve ser idempotente, determinístico e diagnosticável sem consultar manualmente cada tabela.

## Correção 5 — paginação e hidratação: confirmar regressões restantes

A spec 24 passou filtros Cloud para a consulta do catálogo. Faça uma revisão final para garantir que:

- filtros de ambiente, modelo, vínculo ativo, sem vínculo, expirado e a vencer são aplicados antes da contagem e paginação;
- `meta.total` corresponde exatamente ao conjunto filtrado;
- somente a página corrente é hidratada;
- não há `listAll()` nem fatiamento posterior em memória no caminho normal;
- consultas N+1 ficam limitadas ou são substituídas por consultas em lote;
- ordenação SQL e ordenação da projeção são idênticas e determinísticas;
- `somente_orfaos_cloud` não ignora filtros combinados de raiz, UF, pesquisa ou Filial, caso a UI/API permita combiná-los;
- página fora do intervalo mantém o padrão do ERP;
- o filtro legado `estado_nfse` não seja ampliado nem passe a criar requisito de NFS-e.

Se o filtro de órfãos for deliberadamente exclusivo, documente isso no contrato e faça a API/UI limpar ou rejeitar os filtros incompatíveis, em vez de ignorá-los silenciosamente.

## Correção 6 — tipos e contratos internos

Corrija os métodos adicionados que recebem ou retornam `Illuminate\Database\Query\Builder` sem type hint, especialmente:

- `FilialFiscalContextReader::indexCatalogQuery()`;
- `FilialFiscalContextReader::applyCloudPredicates()`.

Use imports e tipos explícitos conforme os padrões do projeto. Preserve PHPStan/Psalm/Pint e não use `mixed` quando o contrato puder ser expresso pelo tipo do Query Builder.

## Testes obrigatórios

Produza testes para:

1. reconciliação manual já consistente retorna `noop` e grava auditoria uma única vez por comando;
2. falha transacional reverte criação do canônico, estabelecimento, versões e vínculos;
3. duas reconciliações concorrentes não criam dois canônicos para a mesma raiz;
4. divergência sem dependências faz rebase automático;
5. divergência com versão/material, mas sem vínculo direto no estabelecimento, não faz rebase automático;
6. divergência com vínculo preserva material, bloqueia seleção e exige reautenticação;
7. reconciliação da mesma raiz com versão exclusiva re-hospeda preservando IDs e mantém seleção NF-e;
8. versão compartilhada não é movida indevidamente e o vínculo afetado fica explicitamente inativo/bloqueado;
9. duplicatas com e sem dependências aparecem no relatório e não perdem material;
10. segundo sync sem mudança não gera mutações nem contadores novos;
11. filtros Cloud retornam total correto e hidratam somente a página atual;
12. filtro de órfãos combinado com filtros de Filial tem comportamento explícito, testado e documentado;
13. seleção NF-e por vínculo explícito continua funcionando para duas Filiais da mesma raiz;
14. nenhum teste adiciona emissão ou comportamento novo de NFS-e.

## Critérios de aceite

1. Toda reconciliação manual autenticada deixa auditoria, inclusive `noop`.
2. Nenhuma divergência com versão/material/vínculo relevante é rebaseada automaticamente.
3. Falhas não deixam contribuinte canônico ou relação parcial criada fora da transação.
4. O relatório de sync é completo, idempotente e distinguível por classe de problema.
5. A paginação filtrada não carrega o universo inteiro e não ignora filtros silenciosamente.
6. O código fiscal alterado segue os tipos explícitos do projeto.
7. A seleção NF-e/NFC-e permanece funcional por vínculo explícito.
8. CNPJ administrativo continua permitido; NFS-e e transferências permanecem fora.

Entregue a especificação corretiva final, contratos, decisão de atomicidade/concurrency, matriz de testes e plano de implementação. Não implemente.
```
