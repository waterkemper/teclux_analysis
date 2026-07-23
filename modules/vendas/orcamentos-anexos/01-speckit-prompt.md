# Prompt SpecKit — Atalho de Anexos no Cadastro de Orçamentos

Crie uma especificação e um plano de implementação completos para adicionar, no Cadastro de Orçamentos do Laravel já existente, o mesmo atalho de **Anexos** já implementado e funcionando no Cadastro de Clientes e na Ficha Financeira. Não é um domínio novo: é o **terceiro/quarto ponto de reuso** de um painel de anexos genérico já pronto (`tipo` + `codigo`). Esta entrega não redesenha o painel de anexos, a policy ou os endpoints — apenas conecta o Cadastro de Orçamentos a eles, do mesmo jeito que Clientes e Ficha Financeira já fazem.

## Regra de investigação

Você tem acesso somente ao Laravel atual. A paridade com o Delphi já foi verificada e está resumida abaixo — **não procure, não solicite e não dependa de Delphi**. Inspecione o Laravel para confirmar os pontos de reuso: `ArquivoAnexoContext`, `ArquivosAnexadosController`, `ArquivoAnexoPolicy`, `ArquivosAnexadosPanel.tsx`, `AnexosCommandBarButton.tsx`, `Cadastros/Clientes/Cadastro.tsx` (referência de integração já funcionando), `Cadastros/ClientesController.php` (referência de payload), `OrcamentoCadastroPageService.php`, `OrcamentoCommandBar.tsx` e `Vendas/Orcamentos/Cadastro.tsx`.

## Evidência Delphi confirmada

- No Cadastro de Orçamentos (`fmorcamentos.pas:2262-2269`), o botão Anexos não abre um anexo *do orçamento* — ele abre os anexos do **Cliente vinculado ao orçamento**, reutilizando a mesma tela genérica de anexos (`AcionarTelaArquivosAnexados(self, 'CLIENTES', dtmOrcamentos.qryOrcamentoscliente.asstring)`). O mesmo padrão (`'CLIENTES'`, código do cliente) é usado por Ficha Financeira (`fmfichafinanceira.pas:976-983`) e pelo próprio Cadastro de Clientes.
- Habilitação do botão (`fmorcamentos.pas:1953`): `sbnArquivosAnexados.enabled := (dtmOrcamentos.qryorcamentoscliente.asinteger <> 0)` — **única condição é existir Cliente vinculado**. Não depende de `situacao` do orçamento (`A/C/P/T`), de o orçamento estar em modo leitura, nem do tipo de Cliente (`C/F/L`); o Delphi sempre passa o literal `'CLIENTES'`.
- Conclusão: replicar exatamente essa semântica no Laravel — botão visível/habilitado assim que houver Cliente vinculado ao Orçamento, independentemente de `situacao`, de `isEdit`/`podeAlterar`, ou do `tipocliente`.

## Estado Laravel atual (reuso, não domínio novo)

- `App\Domain\Cadastros\ArquivosAnexados\ArquivoAnexoContext` já define `TIPO_CLIENTES` (junto com `TIPO_ATENDIMENTOS`, `TIPO_OS`) — nenhum tipo novo é necessário.
- `ArquivosAnexadosController` (rotas globais `cadastros/anexos/*`, `routes/web.php:781-794`) e `ArquivosAnexadosService` já são agnósticos ao módulo chamador e ao `tipocliente` (C/F/L) — operam só por `(tipo, codigo)`.
- `ArquivoAnexoPolicy` já roteia `TIPO_CLIENTES` para `ClientesCadastroAuthorizationService::canList` (visualizar) e `::canUpdate` (mutar) — **a permissão de anexos em Orçamentos continua sendo a permissão de Clientes**, não uma nova permissão de Orçamentos. Isso já é o comportamento aceito hoje em Ficha Financeira, que também usa `'CLIENTES'`.
- `ArquivosAnexadosPanel.tsx` é documentado como reutilizável entre módulos e já recebe `open`, `onClose`, `context: {tipo, codigo}`, `canMutate`, `onChanged` — usado sem alteração em `Clientes/Cadastro.tsx`, `CobrancaSac/Atendimentos/Cadastro.tsx` e `Vendas/FichaFinanceira/Index.tsx`.
- `AnexosCommandBarButton.tsx` já encapsula ícone, badge de contagem e estado oculto/desabilitado (`visible`, `count`, `onClick`, `disabled`) — reutilize-o tal como está, sem recriar como `OrcamentoSecondaryBarButton`.
- `OrcamentoCadastroPageService` já resolve e devolve `cabecalho.cliente` (código) e `cabecalho.tipocliente` tanto em `buildCreatePayload` quanto em `buildShowPayload`; `Cadastro.tsx` já consome isso em `data.cabecalho.cliente`/`data.cabecalho.tipocliente` (usado hoje para o deep-link de Ficha Financeira em `OrcamentoCommandBar.tsx:169-186`).
- `OrcamentoCommandBar.tsx` já tem dois grupos de ações secundárias renderizados em `trailingActions` (`OrcamentoCommandBar.tsx:346-354`): `extendedActions` (Contrato/Copiar/Imprimir/Enviar) e `moduleActions` (Atendimento, Vendas, Contratos, Enquete, Venda perdida, Ficha financeira) — Anexos entra em `moduleActions`, junto de Ficha financeira.

## Decisão que diverge do precedente de Clientes — e por quê

Em `Clientes/Cadastro.tsx`, `anexosToolbarVisible` e `anexosCount` vêm prontos do Inertia (`ClientesController.php:176-184`) porque, naquela tela, o `codigo` da página **é** o próprio Cliente — fixo durante toda a edição.

Em Orçamentos isso não vale: o Cliente vinculado pode não existir ainda (orçamento novo, sem Cliente selecionado) e pode **mudar durante a edição** (o Cadastro já tem fluxo de troca de Cliente — `cliente_transicao_prepare`/`cliente_transicao_confirm` em `OrcamentoCadastroPageService.php:283-284`). Um `anexosCount` calculado uma vez no load do Inertia ficaria obsoleto assim que o Cliente mudasse ou fosse selecionado pela primeira vez num orçamento novo. Portanto:

- **Permissão** (`canViewAnexos`/`canMutateAnexos`): continua vindo do backend, calculada **uma vez por carregamento de página**, pois é uma permissão de usuário (Clientes), não depende de qual Cliente está vinculado. Como `ArquivoAnexoPolicy` ignora completamente o `codigo` do contexto (só olha `tipo`), é seguro avaliar o Gate com um código-placeholder (ex.: `'0'`) só para obter o booleano de permissão — documente isso no código para não confundir leitores futuros.
- **Existência do Cliente e contagem** (`cliente !== null` e `anexosCount`): tratadas **reativamente no frontend**. A visibilidade do botão é `canViewAnexos && data.cabecalho.cliente !== null` (computado no cliente, não no servidor). A contagem é buscada via `GET /cadastros/anexos/count?tipo=CLIENTES&codigo=<cliente>` num efeito disparado sempre que `data.cabecalho.cliente` mudar (seleção inicial, troca de Cliente confirmada, ou Cliente Expresso recém-criado) — nunca pré-computada no payload Inertia.
- **Independência de `situacao`/`isEdit`/`podeAlterar`**: o botão não entra nas listas de dependência desses estados — só de `canViewAnexos` e `data.cabecalho.cliente`, replicando a evidência Delphi.

## Contratos técnicos consolidados

**Backend** (`OrcamentoCadastroPageService.php`, em `buildCreatePayload` e `buildShowPayload`):
- Adicionar `'anexosCanView' => bool` e `'anexosCanMutate' => bool` ao payload retornado, calculados uma vez via `Gate`/`ArquivoAnexoPolicy` com `ArquivoAnexoContext::TIPO_CLIENTES` e um código-placeholder (a policy ignora o `codigo`).
- Não adicionar `anexosCount` nem exigir `codigo` do Cliente no payload — isso é resolvido no frontend.

**Frontend** (`Vendas/Orcamentos/Cadastro.tsx`):
- Novo estado local `anexosOpen` (igual ao padrão de Clientes) e um efeito que busca a contagem via `axios.get('/cadastros/anexos/count', {params: {tipo: 'CLIENTES', codigo: String(data.cabecalho.cliente)}})` sempre que `data.cabecalho.cliente` mudar e for não nulo; contagem `null`/omitida quando `cliente` é nulo.
- Renderizar `<ArquivosAnexadosPanel open={anexosOpen} onClose={...} context={{tipo: 'CLIENTES', codigo: String(data.cabecalho.cliente)}} canMutate={anexosCanMutate} onChanged={() => refazer a busca de contagem} />` como sibling dos demais modais do Cadastro (mesmo padrão de `VendaPerdidaCaptureModal`), só quando `data.cabecalho.cliente !== null`.
- Passar para `OrcamentoCommandBar`: `anexosVisible={anexosCanView && data.cabecalho.cliente !== null}`, `anexosCount`, `onAnexos={() => setAnexosOpen(true)}`.

**`OrcamentoCommandBar.tsx`**:
- Novas props `anexosVisible: boolean`, `anexosCount: number`, `onAnexos: () => void`.
- Adicionar `<AnexosCommandBarButton visible={anexosVisible} count={anexosCount} onClick={onAnexos} disabled={processing} />` dentro do grupo `moduleActions`, após o botão "Ficha financeira" (ambos operam sobre o Cliente do orçamento).
- Não incluir esse botão nas listas de dependência de `canContrato`/`canCopiarAction`/`canEnviarAction`; sua própria visibilidade já vem pronta via prop.

## Fases de implementação

1. Backend: `anexosCanView`/`anexosCanMutate` em `buildCreatePayload` e `buildShowPayload`.
2. Frontend: busca reativa de contagem por `cliente`, estado `anexosOpen`, render do `ArquivosAnexadosPanel`.
3. `OrcamentoCommandBar.tsx`: novas props e botão `AnexosCommandBarButton` em `moduleActions`.
4. Verificação manual: orçamento novo sem Cliente (botão ausente) → seleciona Cliente (botão aparece, contagem correta) → troca de Cliente confirmada (contagem atualiza) → Cliente Expresso recém-criado (botão aparece sem reload de página).

## Matriz mínima de testes

Backend (Feature, seguindo `OrcamentoCadastroTest.php`):
- `buildCreatePayload`/`buildShowPayload` expõem `anexosCanView`/`anexosCanMutate` corretos por permissão de usuário (com/sem acesso a Clientes), independentemente de existir Cliente vinculado.
- Endpoint `/cadastros/anexos/count` já coberto por testes existentes de `ArquivosAnexadosController` — não duplicar, só confirmar que aceita `tipo=CLIENTES` com o código do Cliente do Orçamento.

Frontend (novo `Cadastro.anexos.test.tsx`, seguindo a convenção de `Cadastro.exclusaoProduto.test.tsx`):
- Orçamento novo sem Cliente: botão de Anexos não é renderizado.
- Cliente selecionado (novo orçamento, ainda não salvo): botão aparece e contagem é buscada para aquele código.
- Troca de Cliente confirmada: contagem é buscada novamente para o novo código.
- Botão habilitado independentemente de `situacao` (`A/C/P/T`) e de `isEdit`/`podeAlterar`.
- Usuário sem permissão de Clientes: botão nunca aparece, mesmo com Cliente vinculado.
- Painel abre com `context.tipo === 'CLIENTES'` e `context.codigo === String(cliente)`; `canMutate` reflete `anexosCanMutate`.

## Critérios de conclusão

Considere concluído somente quando:
- o botão de Anexos aparece no Cadastro de Orçamentos assim que há Cliente vinculado, e some quando não há;
- a contagem exibida corresponde aos anexos do Cliente atual e se atualiza ao trocar de Cliente, sem recarregar a página;
- a permissão para ver/mutar segue exatamente a permissão de Clientes já usada em Ficha Financeira, sem nova permissão de Orçamentos;
- o botão não depende de `situacao`, `isEdit` ou `podeAlterar` do Orçamento;
- nenhuma alteração de comportamento em `Clientes/Cadastro.tsx`, `FichaFinanceira/Index.tsx`, `ArquivosAnexadosController`, `ArquivoAnexoPolicy` ou `ArquivosAnexadosPanel.tsx`;
- testes relevantes (backend do payload, frontend do adaptador) passarem.

## Saída esperada do SpecKit

Produza especificação executável e plano, não apenas análise. Liste requisitos funcionais/não funcionais, contratos e payloads, arquivos atuais a alterar após inspecioná-los, fases, riscos, critérios de aceite e matriz de testes.

Não mande investigar Delphi — a evidência acima já é definitiva. Não crie um novo `tipo` em `ArquivoAnexoContext`, uma nova policy ou uma nova permissão de módulo para Orçamentos — o reuso da permissão de Clientes é decisão confirmada, não um gap a resolver. Não pré-compute `anexosCount` no payload Inertia. Não condicione o botão a `situacao`, `isEdit` ou `podeAlterar`. Não redesenhe `ArquivosAnexadosPanel`, `AnexosCommandBarButton` ou os endpoints de `cadastros/anexos`.
