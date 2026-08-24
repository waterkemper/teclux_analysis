# Prompt para /speckit.specify — correção de reconciliação, duplicatas e paginação da administração de certificados

```text
/speckit.specify

Revise o código Laravel atual após a implementação da spec 23 e produza uma especificação corretiva pronta para implementação. Não implemente código nesta execução. O objetivo é corrigir somente as lacunas de reconciliação da projeção Cloud, relatório de duplicatas, consistência dos vínculos e paginação do índice administrativo.

## Decisões de escopo que prevalecem

1. NFS-e está fora desta execução. Não criar, alterar ou expandir gateway, porta, gate, política municipal, emissão, autorização, consulta, ADN, modelo 98 ou runbook de homologação de NFS-e.
2. NF-e/NFC-e continuam no caminho já existente, com seleção por vínculo explícito da Filial. A correção não pode introduzir fallback por raiz de CNPJ.
3. CNPJ completo pode aparecer na tela administrativa e nas respostas administrativas. O acesso é restrito a administradores e não existe, nesta correção, requisito de mascaramento, sanitização ou bloqueio por exposição de CNPJ.
4. Não alterar testes ou contratos para exigir `titular_cnpj_sanitizado`, `cnpj_filial_sanitizado` ou máscaras. Se a implementação atual já expõe CNPJ completo, isso não é achado desta especificação.
5. Não reintroduzir venda entre Filiais, transferência de posse, devolução entre Filiais ou qualquer fluxo de transferência comercial.

## Diagnóstico obrigatório

Inspecione o estado real do checkout, sem confiar apenas em testes existentes:

- `backend/app/Application/Fiscal/Certificate/SyncFiliaisFiscaisService.php`;
- `backend/app/Application/Fiscal/Certificate/ReconciliarEstabelecimentoFiscalService.php`;
- `backend/app/Application/Fiscal/Certificate/ManageCertificateLinkService.php`;
- `backend/app/Application/Fiscal/Certificate/ActivateCertificateLinkService.php`;
- `backend/app/Application/Fiscal/Certificate/FiscalCertificadoAdminProjector.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/CloudFiscalCertificadoRepository.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/CloudFiscalEstabelecimentoRepository.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/CloudFiscalContribuinteRepository.php`;
- `backend/app/Infrastructure/Fiscal/Persistence/FilialFiscalContextReader.php`;
- `backend/app/Http/Controllers/Fiscal/Certificate/FiscalCertificadoController.php`;
- `backend/resources/js/Pages/Fiscal/Certificados/Index.tsx` e `Show.tsx`;
- testes em `backend/tests/Feature/Fiscal/Certificate` e `backend/tests/Unit/Fiscal/Certificate`;
- `specs/373-nfse-closeout/contracts/reconciliacao.md`, `data-model.md` e os prompts 20, 21, 22 e 23.

Classifique cada item como CONFIRMADO, PARCIAL, CORRIGIDO ou NÃO LOCALIZADO e cite arquivo, método e comportamento observado.

## Correção 1 — reconciliação manual sem relações inconsistentes

O código atual altera o `contribuinte_id` do estabelecimento em `ReconciliarEstabelecimentoFiscalService`, mas pode deixar versões e vínculos com o contribuinte antigo. Isso não pode permanecer silencioso.

Especifique e corrija o contrato de reconciliação para que:

- a operação seja atômica e idempotente;
- o contribuinte canônico seja escolhido pelo mesmo critério do sync: dependências existentes primeiro e menor ID como desempate;
- o `cloud_fiscal_estabelecimentos.id` seja preservado;
- IDs de versões, vínculos, material e auditoria nunca sejam apagados;
- nenhum vínculo ativo ou elegível fique apontando para um estabelecimento cujo `contribuinte_id` seja incompatível com o `contribuinte_id` da versão;
- a reconciliação produza antes ou durante a execução uma relação explícita dos registros afetados;
- origem, destino, estabelecimento, versões, vínculos, resultado e motivo sejam registrados na auditoria sem senha, PFX, PEM ou ciphertext;
- repetir a mesma reconciliação não crie duplicatas nem altere novamente registros já reconciliados.

Defina uma estratégia segura para os vínculos e versões já existentes. A especificação deve escolher e justificar uma destas formas, sem deixar estado implícito:

- re-hospedar as relações necessárias no contribuinte canônico, preservando IDs e validando que o compartilhamento não quebre outras Filiais; ou
- preservar o material e o proprietário original, mas marcar os vínculos afetados como inativos/bloqueados de forma explícita, com motivo e relatório, exigindo novo vínculo administrativamente consistente antes da seleção NF-e.

Não aceitar uma solução que apenas mova o estabelecimento e deixe vínculos ativos incompatíveis, nem uma solução que apague e recrie material sem trilha histórica.

Enquanto a divergência estiver pendente:

- novo vínculo deve retornar `ESTABELECIMENTO_DIVERGENTE` em HTTP 422;
- a prévia administrativa da Filial deve retornar o mesmo código;
- nenhuma seleção NF-e ambígua deve ser liberada;
- após a reconciliação, testar explicitamente o caminho de seleção NF-e por vínculo explícito.

## Correção 2 — duplicatas de contribuintes no relatório do sync

O relatório atual usa `duplicatas` principalmente para códigos de Filial duplicados e não descreve adequadamente contribuintes duplicados da mesma raiz.

Defina um contrato estável para o relatório, preservando os campos já consumidos, que inclua:

- contribuintes duplicados por raiz;
- ID do contribuinte canônico;
- IDs dos contribuintes extras;
- indicação se cada extra tem versões, vínculos, estabelecimentos ou material;
- ação tomada: inativado automaticamente, preservado e bloqueado, ou pendente de reconciliação manual;
- Filiais afetadas e quantidade de dependências;
- órfãos, divergentes, bloqueados e rebaseados automáticos.

Regras obrigatórias:

- contribuinte extra sem dependências pode ser inativado, nunca excluído;
- contribuinte extra com dependências não pode ser inativado ou movido silenciosamente;
- o relatório deve informar a duplicata mesmo quando todos os contribuintes possuem dependências;
- o resultado deve ser idempotente: segunda execução sem mudança não deve aumentar contadores nem gerar novas auditorias equivalentes;
- não alterar a regra de agrupamento de Filiais pela raiz nem transformar raiz em autorização implícita.

Se for necessário adicionar `duplicatas_contribuintes`, mantenha `duplicatas` compatível ou documente a migração do contrato. A resposta e a auditoria devem permitir diagnosticar o caso sem consultar manualmente tabelas internas.

## Correção 3 — paginação real no índice administrativo

O projetor atual pagina corretamente o catálogo em alguns casos, mas quando há filtros Cloud — como ambiente, modelo, vínculo ativo, sem vínculo, expirado ou a vencer — carrega o conjunto inteiro, hidrata e só depois usa `array_slice`.

Corrija o desenho para que o servidor sempre:

1. aplique os filtros do catálogo e os filtros Cloud;
2. conte o resultado filtrado;
3. ordene de forma determinística;
4. busque somente os códigos/IDs da página solicitada;
5. hidrate projeção Cloud apenas para essa página.

Requisitos:

- não chamar `listAll()` ou equivalente para construir uma página comum;
- não carregar o universo inteiro para filtrar em PHP;
- mover filtros Cloud para consultas/repositórios SQL ou para uma consulta de candidatos limitada e paginável;
- manter `meta.total`, `meta.current_page`, `meta.per_page` e `meta.last_page` corretos;
- preservar o filtro e a ordenação ao navegar entre páginas;
- tratar página fora do intervalo de forma consistente com o padrão ERP;
- não alterar nem reabrir o filtro `estado_nfse`, que continua congelado e fora do escopo NFS-e;
- manter a hidratação de vínculos, versões e alertas limitada aos registros da página.

Inclua no contrato de dados quais filtros são aplicados no banco, quais índices são necessários e como evitar consultas N+1. Se a solução exigir uma consulta de candidatos por códigos de Filial, ela deve retornar somente a página ou um conjunto limitado por uma etapa SQL, nunca o universo completo para fatiamento posterior.

## Correção 4 — autorização de mutações na UI

Revise apenas a autorização administrativa, sem alterar o escopo NFS-e:

- `can.mutate` deve refletir a autorização real recebida do backend;
- ausência da propriedade não pode liberar mutações por padrão;
- upload, vínculo, ativação, inativação, sincronização e reconciliação devem estar ocultos ou desabilitados quando `can.mutate` for falso;
- o backend continua sendo a autoridade e deve retornar 403/422 conforme o contrato atual;
- testes devem cobrir `can.mutate=true`, `false` e propriedade ausente.

## Testes obrigatórios

Produza testes PHPUnit/Feature/Unit e Vitest quando aplicável para:

1. divergência sem versões/vínculos: rebase automático, ID do estabelecimento preservado e auditoria;
2. divergência com vínculo ou versão: não mover automaticamente, marcar bloqueio, retornar 422 na criação de vínculo e na prévia;
3. reconciliação manual autenticada: operação idempotente, transação, IDs preservados e nenhuma relação ativa incompatível;
4. reconciliação repetida: nenhum novo registro, vínculo ou auditoria duplicada;
5. duas Filiais com a mesma raiz usando o mesmo certificado por vínculos explícitos;
6. duas Filiais com a mesma raiz usando certificados diferentes;
7. dois contribuintes duplicados sem dependências: extra inativado e duplicata reportada;
8. dois contribuintes duplicados com dependências: extras preservados, bloqueio/pendência reportado e nenhum material apagado;
9. relatório com órfãos, duplicatas, divergentes, bloqueados e rebaseados;
10. execução idempotente do sync;
11. página 1 e página 2 com catálogo grande, comprovando que apenas os registros da página são hidratados;
12. cada filtro Cloud aplicado antes da hidratação, sem carregar o universo em memória;
13. `can.mutate` verdadeiro, falso e ausente na tela;
14. regressão NF-e/NFC-e: seleção por vínculo explícito continua funcionando;
15. nenhum teste deve introduzir emissão, consulta, gateway ou regra nova de NFS-e.

## Critérios de aceite

1. Após uma reconciliação, não existe vínculo ativo incompatível entre estabelecimento, contribuinte e versão.
2. Material, versões, vínculos e histórico nunca são apagados automaticamente.
3. Duplicatas de contribuinte aparecem no relatório mesmo quando possuem dependências.
4. O sync repetido converge sem duplicar registros, contadores ou auditorias.
5. O índice não hidrata o universo completo para montar uma página filtrada.
6. A tela não oferece mutações quando `can.mutate` é falso ou ausente.
7. A seleção NF-e continua baseada em Filial/vínculo explícito, sem fallback por raiz.
8. A especificação e os testes não ampliam o escopo de NFS-e.

## Fora de escopo explícito

- mascarar, remover ou bloquear a exibição de CNPJ na tela administrativa;
- qualquer alteração de gateway, emissão, consulta ou política NFS-e;
- homologação real de NFS-e;
- venda, transferência ou devolução entre Filiais;
- migração destrutiva ou exclusão de certificados/material/histórico;
- implementação nesta execução.

Entregue a especificação corretiva final com diagnóstico do código atual, decisão de consistência de vínculos, contrato do relatório de sync, desenho SQL da paginação, matriz de testes, critérios de aceite e plano de implementação. Não implemente.
```
