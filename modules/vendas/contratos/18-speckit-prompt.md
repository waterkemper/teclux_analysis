# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **Venda perdida e demais integrações simples do shell** do Cadastro de Contratos — Etapa 8 (Conveniências), segundo e último spec dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`).

Esta fatia é **wiring puro**: as duas capacidades que ela cobre — Venda Perdida e o atalho de Entrega em Loja — já têm engine, adapter/builder e serviço de domínio completos e testados. Nenhum dos dois está hoje acessível a partir do shell do Cadastro de Contratos. O trabalho real é abrir o componente certo com o contexto certo e a capability certa — não construir nada novo em nenhum dos dois casos.

Não implemente nesta etapa: qualquer engine novo de venda perdida ou de entrega; qualquer mudança no comando de cancelamento (spec 11) — registrar venda perdida **não cancela** o Contrato automaticamente, são comandos independentes. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar que as duas capacidades realmente existem prontas e não estão wireadas ao Cadastro; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- **Venda Perdida**: um comando no shell do Cadastro que abre `VendaPerdidaCaptureModal` com o Contrato atual (`originType=contrato`, `originId=numero`), reutilizando integralmente `VendaPerdidaCaptureEngine`/`VendaPerdidaCaptureAdapterResolver`/`ContratoVendaPerdidaOpeningBuilder` já existentes; motivo inicia em branco para preenchimento pelo usuário; registrar venda perdida **não** altera a situação do Contrato nem aciona cancelamento — são comandos distintos que o usuário executa separadamente;
- **Entrega em loja**: um comando visível na área apropriada do shell (Entrega, do spec 7, ou barra de comandos) que reutiliza `RegistrarContratoEntregaLojaService`/`ContratoEntregaLojaEligibility` já existentes e testados — decidindo explicitamente se o Cadastro chama a mesma rota hoje exposta só pela Consulta (`vendas.consulta_contratos.registrar_entrega_loja`) ou se ganha uma rota própria sob o namespace do Cadastro que delega ao mesmo serviço; em qualquer caso, nenhuma lógica de elegibilidade/gravação é duplicada;
- callbacks que atualizam somente o que mudou (resumo de entrega, contador, timeline quando aplicável) sem recarregar a página nem sobrescrever rascunho comercial;
- capabilities resolvidas no servidor para os dois comandos, seguindo a mesma precedência já fixada na Fundação — a visibilidade do botão nunca autoriza sozinha.

Não inclua: qualquer engine novo de venda perdida ou de entrega em loja — apenas reutilização; alteração da elegibilidade/regras já fixadas por `ContratoEntregaLojaEligibility` (restrita a `P/N`, conforme specs 1/7/8); acoplamento entre venda perdida e cancelamento do Contrato (spec 11); execução quantitativa de entrega/retirada além do atalho já existente (spec 8, quando implementado).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar que as duas capacidades já existem prontas e apenas não estão conectadas ao Cadastro.

## Investigação Laravel obrigatória

- `App\Application\Shared\VendaPerdida\{VendaPerdidaCaptureEngine,VendaPerdidaCaptureAdapterResolver}`, `App\Infrastructure\Persistence\Legacy\Vendas\VendaPerdida\ContratoVendaPerdidaOpeningBuilder` (já implementa `VendaPerdidaCaptureAdapterInterface` com `supportedOriginTypes() = ['contrato']`) e `resources/js/Components/erp/venda-perdida/VendaPerdidaCaptureModal.tsx` — **tudo já pronto e testado** (`VendaPerdidaCaptureFeatureTest.php`); confirme que nenhum arquivo em `resources/js/Pages/Vendas/Contratos` ainda referencia venda perdida antes de escrever a integração, para não presumir um estado que já mudou.
- `App\Services\Vendas\RegistrarContratoEntregaLojaService`, `App\Support\Vendas\ContratoEntregaLojaEligibility`, `App\Infrastructure\Persistence\Legacy\Vendas\LegacyContratoEntregaLojaWriteRepository` (já citados nos specs 1/7/8) — comando completo e testado, hoje acessível só pela rota `POST /cadastros/vendas/consulta-contratos/{numero}/registrar-entrega-loja` (`vendas.consulta_contratos.registrar_entrega_loja`), controlada por `ConsultaContratosController`. Nenhuma rota equivalente existe sob o namespace do Cadastro (`vendas.contratos.*`); decida e documente a forma de acesso a partir do Cadastro sem duplicar a lógica de elegibilidade/gravação.
- `ConsultaContratosDetalheService::buildResponse` — já calcula `can_registrar_entrega_loja` via `ContratoEntregaLojaEligibility::canRegistrarEntregaLoja`; reaproveite o mesmo predicado de elegibilidade para a capability exposta pelo Cadastro, não recalcule com uma regra própria.
- Shell/capabilities da Fundação (`01-speckit-prompt.md`) — protocolo de comando/capability já definido; esta fatia só acrescenta dois comandos novos ao catálogo existente, sem alterar o protocolo.

## Evidência Delphi confirmada

### Venda perdida

- `CONFIRMADO` — o Laravel já possui engine e adapter/builder de abertura para Contrato: `VendaPerdidaCaptureEngine.php`, `VendaPerdidaCaptureAdapterResolver.php` e `ContratoVendaPerdidaOpeningBuilder.php`, com testes em `VendaPerdidaCaptureFeatureTest.php`.
- `DECISÃO NOVA` — o shell apenas abre `VendaPerdidaCaptureModal` com o Contrato atual; motivo inicia em branco para preenchimento pelo usuário.
- `DECISÃO NOVA` — registrar venda perdida não cancela o Contrato automaticamente; se o fluxo exigir ambos, o usuário executa comandos distintos ou uma futura orquestração explícita — não há efeito oculto.

### Entrega em loja

- `CONFIRMADO` — o Laravel já implementa esse fluxo com prova sensível, transação, nota fiscal válida e idempotência por status (`RegistrarContratoEntregaLojaService.php`, `ContratoEntregaLojaEligibility.php`, `LegacyContratoEntregaLojaWriteRepository.php`), hoje acessível apenas pela Consulta de Contratos.
- `DECISÃO NOVA` — reutilizar esse comando no shell do Cadastro; não reimplementá-lo. Evoluí-lo para eventos quantitativos por item/documento pertence ao spec 8, não a esta fatia.

### Regra de fatiamento (contexto geral desta etapa)

- `DECISÃO NOVA` — uma operação é integração simples do shell quando já existe engine/componente genérico e o Contrato apenas fornece identidade, contexto e capability — exatamente o caso de Venda Perdida e Entrega em Loja nesta fatia.
- `DECISÃO NOVA` — após um comando transversal, o shell invalida somente as projeções afetadas; não recarrega e sobrescreve um rascunho comercial silenciosamente.
- `DECISÃO NOVA` — componentes reutilizáveis recebem contexto tipado e capabilities do servidor; não inferem permissão pela visibilidade do botão.

## Estado Laravel confirmado

- Venda Perdida: engine, adapter/builder e modal completos e testados para `originType=contrato`; nenhuma referência no shell do Cadastro de Contratos.
- Entrega em loja: serviço, elegibilidade e repositório completos e testados; acessível hoje só pela rota da Consulta de Contratos, nenhuma integração com o Cadastro.

## Decisões obrigatórias

1. Nenhum engine novo é criado para nenhuma das duas capacidades; esta fatia é inteiramente wiring de UI/rota/capability sobre o que já existe.
2. Venda Perdida e cancelamento do Contrato (spec 11) permanecem comandos independentes; registrar venda perdida nunca altera a situação do Contrato.
3. A forma de acesso ao comando de entrega em loja a partir do Cadastro (reaproveitar a rota da Consulta ou criar uma rota própria que delega ao mesmo serviço) é decidida e documentada explicitamente — em ambos os casos, a lógica de elegibilidade/gravação nunca é duplicada.
4. A capability de entrega em loja no Cadastro usa o mesmo predicado de elegibilidade (`ContratoEntregaLojaEligibility`) já usado pela Consulta — nunca uma regra própria divergente.
5. Callbacks pós-comando invalidam só o que mudou; nunca recarregam a página nem sobrescrevem rascunho comercial não salvo.
6. Capabilities dos dois comandos são resolvidas no servidor a cada carga, seguindo a mesma precedência já fixada na Fundação.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações/prova sensível já fixada na Fundação e já usada por `RegistrarContratoEntregaLojaService` (prova sensível existente) e pelo engine de Venda Perdida; nenhum mecanismo paralelo.

## Testes obrigatórios

1. Venda Perdida: abrir o modal a partir do Cadastro produz o mesmo `VendaPerdidaOpeningContext` que a Consulta/outros pontos de entrada já testados; motivo inicia em branco; registrar venda perdida não altera a situação do Contrato.
2. Entrega em loja: comando a partir do Cadastro produz exatamente o mesmo resultado que a rota existente da Consulta (mesma elegibilidade, mesma gravação, mesma idempotência) — sem lógica duplicada.
3. Regressão: as suítes existentes de Venda Perdida e de Entrega em Loja continuam passando sem alteração de contrato.
4. Autorização server-side: payload manipulado no frontend não concede nenhum dos dois comandos sem a capability correta.
5. Callbacks atualizam somente as projeções afetadas, sem recarregar a página nem descartar edições locais não salvas.

Prefira Feature tests nos comandos/rotas reais; reutilize integralmente as suítes já existentes de `VendaPerdidaCaptureFeatureTest` e dos testes de entrega em loja como base de regressão.

## Entregáveis

- Contrato de integração dos dois comandos ao shell (contexto, rota, capability, callback).
- Decisão documentada sobre a forma de acesso ao comando de entrega em loja a partir do Cadastro.
- Matriz de evidência Delphi × Laravel, deixando explícito que ambos os engines já existem prontos.
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- qualquer engine novo de venda perdida ou de entrega;
- alterar a elegibilidade já fixada de entrega em loja (`P/N`) ou acoplá-la ao cancelamento;
- execução quantitativa de entrega/retirada além do atalho existente (spec 8);
- alterar o schema Delphi.
```
