# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **Fotos e Anexos** do Cadastro de Contratos — Etapa 7 (Capacidades transversais), segundo dos quatro specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`) e o motor comercial (`03-speckit-prompt.md`), cuja aba Produtos já hospeda a galeria de fotos.

**Fotos já está integrada.** A aba Produtos do Cadastro (`resources/js/Pages/Vendas/Contratos/Cadastro/tabs/ProdutosTab.tsx`) já importa e usa `ProductPhotoThumbCell`, `ProductPhotoGalleryModal` e `buildGallerySequence` — miniatura por linha, modal de galeria e sequência deduplicada por Produto já funcionam. Este spec **confirma e documenta** essa integração (capability, ausência de callback/revision, exclusão de serviços) em vez de construí-la; não a redesenhe. **Anexos não existe.** A infraestrutura genérica de anexos (`ArquivoAnexoContext`/`ArquivoAnexoPolicy`) só reconhece `CLIENTES`, `ATENDIMENTOS` e `OS` — este é o trabalho real desta fatia.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real de Fotos (já integrada) e a ausência de Anexos de Contrato; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- **confirmação/documentação da integração de Fotos já existente**: miniatura clicável por linha de Produto (nunca em Serviço), abre o produto selecionado e navega pela sequência deduplicada de Produtos do Contrato; capability única `products.photos.view`; somente leitura, sem callback nem mudança de `revision`; qualquer botão lateral legado equivalente não é reproduzido;
- a **infraestrutura de Anexos de Contrato**: novo tipo `CONTRATOS` em `ArquivoAnexoContext` (chave lógica `contrato:<numero>`) e policy correspondente em `ArquivoAnexoPolicy`, distinto de `CLIENTES` — sem compartilhar arquivos entre Contratos nem repetir a ambiguidade do Delphi (que abre `CLIENTES/<cliente>`);
- reaproveitamento do modal, storage e `AnexosCommandBarButton` já existentes (visibilidade, contador, bloqueio) — apenas estendidos para o novo tipo, sem componente paralelo;
- capabilities `attachments.view/create/updateMetadata/delete/download`; botão visível somente após o Contrato ter número e capability `view`; mutações dependem das capacidades específicas;
- upload como fluxo de duas fases fora da gravação do Contrato: persiste o objeto primeiro, depois confirma metadado/vínculo por comando idempotente; exclusão é lógica/auditável, nunca física;
- callback que atualiza contador/lista/timeline de Anexos sem alterar Cliente mestre nem `revision` comercial do Contrato.

Não inclua: Atendimentos, Contatos e Questionários (spec 13); Impressão, relatórios e e-mail (specs 15/16); qualquer alteração na tabela/policy de anexos de `CLIENTES`/`ATENDIMENTOS`/`OS` além de adicionar o tipo novo; redesenho do modal de fotos, da galeria ou do `AnexosCommandBarButton`.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual — especialmente a integração de Fotos já existente — e construa a matriz de lacunas de Anexos.

## Investigação Laravel obrigatória

- `resources/js/Pages/Vendas/Contratos/Cadastro/tabs/ProdutosTab.tsx` — **já integra** `ProductPhotoThumbCell`, `ProductPhotoGalleryModal` e `buildGallerySequence` (estado `galleryProductId`, memo `gallerySequence`). Confirme que o comportamento bate com as decisões abaixo (capability única, sem callback/revision, exclusão de Serviços) antes de declarar a integração completa; corrija a especificação se o código divergir do que está descrito aqui.
- `resources/js/Components/product/{ProductPhotoGalleryModal,ProductPhotoThumbCell}.tsx` e `resources/js/lib/productPhotos/buildGallerySequence.ts` — componentes genéricos já reutilizados por Produtos em outros contextos; não recrie.
- `App\Domain\Cadastros\ArquivosAnexados\ArquivoAnexoContext` — hoje só `TIPO_CLIENTES`, `TIPO_ATENDIMENTOS`, `TIPO_OS` em `TIPOS_PERMITIDOS`; adicione `TIPO_CONTRATOS` seguindo o mesmo padrão de constante/lista, sem reestruturar a classe.
- `App\Policies\ArquivoAnexoPolicy` — cobre autorização só para os três tipos acima; estenda para `CONTRATOS` reaproveitando o mesmo mecanismo de autorização usado pelo Cadastro (capabilities já fixadas na Fundação), não uma policy solta.
- `resources/js/Components/erp/cadastro/AnexosCommandBarButton.tsx` — já suporta visibilidade, contador e bloqueio; reutilize tal como está, passando o novo tipo/contexto.
- Shell da Fundação (`01-speckit-prompt.md`) — decisão já fixada (ver ticket 20): Anexos fica na barra persistente com contador, não em aba permanente; Fotos abre pela miniatura em Produtos, não em aba própria.

## Evidência Delphi confirmada

### Fotos

- `CONFIRMADO` — o Delphi abre o visualizador com o produto corrente (`fmcadastrocontratos.pas:4179-4183`); o botão separado está no DFM (`:6360-6472`).
- `DECISÃO NOVA` — clicar na miniatura abre o produto selecionado e navega pela sequência deduplicada de Produtos do Contrato; Serviços/linhas sem Produto não participam; capability única `products.photos.view`; somente leitura, sem callback/revision; o botão lateral legado desaparece.

### Anexos: contexto documental e transação própria

- `CONFIRMADO` — o Delphi abre `CLIENTES/<cliente>`, não anexos do Contrato. Evidência: `fmcadastrocontratos.pas:4580-4586`.
- `DIVERGENTE` — usar `CLIENTES/<cliente>` no Cadastro repetiria a ambiguidade Delphi e compartilharia arquivos entre Contratos do mesmo Cliente; não será reproduzido.
- `DECISÃO NOVA` — estender a infraestrutura com `CONTRATOS/<numero>` (chave lógica `contrato:<numero>`) e policy de Contratos; reutilizar modal/storage e `AnexosCommandBarButton`.
- `DECISÃO NOVA` — capabilities `attachments.view/create/updateMetadata/delete/download`; botão só após existir número e `view`; mutações dependem das capacidades específicas.
- `DECISÃO NOVA` — upload não participa da gravação do Contrato: persiste objeto, depois confirma metadado/vínculo idempotente; exclusão é lógica/auditável; callback atualiza contador/lista/timeline e não altera Cliente mestre nem `revision` comercial.

## Estado Laravel confirmado

- Fotos: integração completa já existe em `ProdutosTab.tsx`; este spec confirma/documenta, não constrói.
- Anexos: `ArquivoAnexoContext`/`ArquivoAnexoPolicy` não reconhecem `CONTRATOS`; nenhuma rota/contexto de anexo de Contrato existe. O modal, o storage e o botão de barra de comando já são genéricos e reutilizáveis assim que o tipo/policy existir.

## Decisões obrigatórias

1. Fotos permanece somente leitura, sem capability adicional além de `products.photos.view`, sem callback e sem afetar `revision` — qualquer mudança de comportamento em relação ao que já está implementado exige justificativa explícita, não é presumida por este spec.
2. Anexos de Contrato usam contexto próprio (`CONTRATOS/<numero>`), nunca `CLIENTES/<cliente>`; arquivos não são compartilhados entre Contratos do mesmo Cliente.
3. O modal, o storage e o `AnexosCommandBarButton` genéricos são reutilizados sem modificação estrutural; a extensão é o tipo/policy novos, não um componente paralelo.
4. Upload é sempre um fluxo em duas fases (persistir objeto, depois confirmar metadado/vínculo) e nunca participa da transação de gravação do Contrato; exclusão é lógica e auditável.
5. Capabilities de Anexos são finas (`view/create/updateMetadata/delete/download`) e resolvidas no servidor a cada carga/comando, seguindo a precedência já fixada na Fundação.
6. Nenhuma mutação de Anexos altera o cadastro mestre do Cliente nem a `revision` comercial do Contrato.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações já fixada na Fundação; a policy de Anexos de Contrato segue o mesmo padrão de autorização por capability já usado pelas demais abas.

## Testes obrigatórios

1. Regressão de Fotos: miniatura abre o produto correto, sequência deduplicada de navegação está correta, Serviços não aparecem, nenhuma escrita/callback/mudança de `revision` ocorre.
2. Anexos: `CONTRATOS/<numero>` é aceito por `ArquivoAnexoContext`/`ArquivoAnexoPolicy`; `CLIENTES` continua funcionando sem alteração de comportamento.
3. Upload em duas fases: objeto persistido antes da confirmação; falha na confirmação não deixa vínculo órfão nem afeta a gravação do Contrato.
4. Exclusão lógica é auditável e reversível na consulta de histórico, nunca remove o arquivo fisicamente nesta fatia.
5. Autorização server-side: payload manipulado no frontend não concede visualizar/criar/editar/excluir/baixar sem a capability correspondente.
6. Contador e botão da barra de comando refletem o estado real (visibilidade, contador, bloqueio) para o tipo `CONTRATOS`, com o componente genérico existente.

Prefira Feature tests nos endpoints/policy reais; reutilize os testes existentes de Anexos de `CLIENTES`/`ATENDIMENTOS`/`OS` como base de regressão e de padrão de teste para o novo tipo.

## Entregáveis

- Confirmação documentada da integração de Fotos (capability, comportamento, ausência de callback/revision).
- Contrato do tipo/policy de Anexos de Contrato (`CONTRATOS/<numero>`), reaproveitando modal/storage/botão existentes.
- Matriz de evidência Delphi × Laravel, deixando explícito o que já existe (Fotos, modal/storage/botão de Anexos) e o que esta fatia adiciona (tipo/policy de Anexos).
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- Atendimentos, Contatos e Questionários (spec 13);
- Impressão, relatórios e e-mail (specs 15/16);
- alterar a policy/contexto de anexos de `CLIENTES`/`ATENDIMENTOS`/`OS` além de adicionar o tipo novo;
- redesenhar o modal de fotos, a galeria, o storage de anexos ou o `AnexosCommandBarButton`;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas.
```
