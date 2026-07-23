# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para o vínculo, a autoridade cadastral, a fotografia e a troca do Cliente no Cadastro de Contratos — Etapa 2 (Edição comercial), primeiro dos três specs dessa etapa, construído sobre a Fundação já especificada em `modules/vendas/contratos/01-speckit-prompt.md` (núcleo, ciclo de vida e shell).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o checkout Laravel. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Se o pacote fornecido for insuficiente ou ambíguo, registre uma DÚVIDA/BLOQUEIO objetiva para investigação no workspace de análise. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- identidade do papel Cliente no Contrato (`tipocliente + cliente`, origem `C/F/L`) e a restrição por `SelecionarSomenteClientesnasVendas`;
- autoridade cadastral do mestre correspondente em `O/R/F`, com atalho `Editar Cliente` (não um editor embutido) e recarga de fotografia/`revision` após salvar o mestre;
- congelamento da fotografia em `P/N/C`;
- fronteira exata entre dados do cadastro mestre e dados próprios da negociação;
- Cadastro Expresso reutilizado para origem `C` na inclusão e em `O/R`;
- obrigatoriedade do Cliente no primeiro F8, e a regra de que o Cliente nunca é removido de um Contrato persistido, só substituído em `O/R`;
- o contrato do seam de transição preparar/confirmar de Cliente como seção do núcleo já especificado, incluindo o **ponto de extensão** que os specs 3 (Produtos/Serviços/motor comercial) e 4 (Proposta financeira/parcelas) deverão implementar depois.

Não inclua: o motor comercial de Produtos/Serviços, o motor de Planos/Parcelas, avalista/dependente/Ficha Financeira além do disparo da seleção, permissões detalhadas de abrir/editar cada cadastro mestre, ou qualquer regra fiscal pós-`F`. Esses pertencem a specs próprios (3, 4, ou já especificados/adiados).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules ou queries Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm`, `dmcadastrocontratos.pas/.dfm` e de inspeção somente-leitura (`SET TRANSACTION READ ONLY`) do schema PostgreSQL efetivamente usado pelo Laravel.
- Use-as como requisitos legados de entrada, preservando suas classificações, sem exigir reconfirmação no código/schema Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Application\Vendas\Orcamentos\OrcamentoClienteTransitionService` (`prepare`/`confirm`) — prior art completo do fluxo preparar/confirmar, alertas de Ficha Financeira, plano padrão, crédito/cashback; hoje acoplado a Orçamento (produtos/serviços/planos/parcelas inline). Extraia o **contrato** (shape de entrada/saída, sequência de passos), não copie a classe para o Contrato.
- `App\Domain\Cadastros\Clientes\ClienteFeatureFlagsResolver` — `DiasAvisoAtualizarCliente` e flags equivalentes; reuso direto, sem duplicar.
- `CadastroExpressoClienteModal.tsx`, `atribuirClienteExpresso.ts`, `StoreClienteQuickRequest`, rota `cadastros.clientes.quick-store` — reuso direto, sem novo componente.
- `OrcamentoCadastroPageService` — os blocos `cliente_expresso_urls` e o deep-link `ficha_financeira_cliente` (`route('vendas.ficha_financeira.index').'?tipo_cliente=__TIPO__&codigo_cliente=__CODIGO__'`) já são o padrão a replicar para o Contrato.
- `LegacyConsultaContratosRepository`/`ConsultaContratosDetalheService` — confirme quais campos de Cliente a Consulta de Contratos já expõe, para reaproveitar leitura em vez de duplicar.
- O spec da Fundação (`01-speckit-prompt.md`) — o seam autoritativo, o protocolo de seção (revision carregada + payload sujo) e o envelope de auditoria. Cliente entra como **seção** desse seam; não crie um segundo caminho de gravação.
- `modules/vendas/orcamentos-cliente-gravacao/09-speckit-prompt.md` — spec irmão já escrito para Orçamentos (mesmo domínio, mesmas decisões de fronteira mestre × negociação); mantenha paridade de vocabulário e não reabra decisões já fixadas lá para Orçamentos.

## Evidência Delphi confirmada

### Papel Cliente e tipos

- No Contrato, a parte é sempre chamada de Cliente. `tipocliente` identifica a origem: `C` Cadastro de Clientes, `F` Cadastro de Fornecedores, `L` Cadastro de Filiais.
- `SelecionarSomenteClientesnasVendas` ativo restringe a seleção a `C`; desativado permite `C/F/L`.
- Delphi consulta e propaga o par `cliente + tipocliente` por Contrato, Produtos, movimentos, dados fiscais, contatos e integrações (`qryContratostipocliente`, `SelecionarCliente`, `AtribuirClienteNoContrato`).
- `contratos` contém fotografia extensa (nome, pessoa/documento, inscrições, endereço, telefones, e-mail, dados pessoais e comerciais), copiada também para estruturas fiscais (`qryDadosFiscais`).

### Sincronização física confirmada (schema PostgreSQL — já investigado nas fatias de núcleo/auditoria)

| `tipocliente` | Mestre | Sincronização ampla da fotografia | Mudança de código | Situações |
|---|---|---|---|---|
| `C` | `clientes` | sim, quando `AtualizarDadosClientesContratos='TRUE'` (`clientes_depoisatualizar`) | sim | fotografia ampla só `O/R/F`; código em todas |
| `F` | `fornecedores` | não localizada | sim | mudança de código em todas |
| `L` | `filiais` | não localizada | não localizada | nenhuma sincronização direta confirmada |

- A sincronização ampla de `C` filtra `WHERE cliente=NEW.codigo AND tipocliente='C' AND situacao IN ('O','R','F')` e copia identidade/nome, família/avaliação, endereço/contato, residência/trabalho/renda, referências, avaliação cadastral e `contribicms` — lista explícita, não `SELECT *`.
- Mudança de `clientes.codigo` ou `conceito` atualiza `contratos`/`dadosfiscais` **sem filtro de situação** — trate como manutenção de integridade referencial/projeção do mestre, nunca como reescrita da fotografia histórica em `P/N/C`. Documento fiscal já autorizado nunca é reescrito pela sincronização.
- Fluxo inverso Delphi (`AtribuirContratoNoCliente`, antes do commit em `O/R`, copiando diferenças do Contrato de volta para `clientes`/`fornecedores`) **não será reproduzido** — o cadastro mestre é o único editor.
- Qualquer `UPDATE contratos` da sincronização passa por `trg_contratos_audit_log_new`; no PostgreSQL isso também muda `xmin` — após sincronização do mestre, o Contrato deve recarregar fotografia, capabilities e `revision` antes de aceitar novo F8.

## Estado Laravel confirmado

- Não existe ainda vínculo/edição de Cliente no Cadastro de Contratos (o Cadastro em si está na Fundação, ainda não implementada).
- Já existem, prontos para reuso: Cadastro de Clientes completo, Cadastro Expresso, lookup, auditoria, conferência cadastral (`ClienteFeatureFlagsResolver`), Ficha Financeira e o fluxo preparar/confirmar de transição de Cliente do Orçamento (`OrcamentoClienteTransitionService`).
- `OrcamentoClienteTransitionService::prepare`/`confirm` misturam a orquestração de Cliente com recálculo de produtos/serviços/planos/parcelas do Orçamento — para o Contrato, extraia o contrato de fases (carregar → recalcular contexto comercial → coletar alertas/autorizações → apresentar → confirmar) sem herdar o acoplamento a Orçamento.
- NÃO LOCALIZADO: qualquer serviço de transição de Cliente genérico e desacoplado de Orçamento/Contrato pronto para reuso direto — precisa ser extraído/generalizado, não descoberto pronto.

## Decisões obrigatórias

1. Cliente é o papel comercial do Contrato; identidade é `tipocliente + cliente` com origem `C` (Clientes), `F` (Fornecedores) ou `L` (Filiais); `SelecionarSomenteClientesnasVendas` restringe a `C` quando ativo.
2. Em `O/R/F`, o cadastro mestre correspondente é autoritativo para os dados pessoais/fiscais sincronizados; o Contrato oferece `Editar Cliente`, que abre o cadastro mestre já posicionado no tipo correto — nunca reproduz as abas completas do cadastro mestre dentro do Contrato.
3. Após salvar o cadastro mestre, o Contrato recarrega fotografia, dados fiscais sincronizados e `revision` autoritativos antes de aceitar novo comando.
4. Em `P/N/C`, a fotografia fica congelada; alterações posteriores no cadastro mestre não reescrevem esses Contratos. Mudança de código/`conceito` do mestre (integridade referencial) é tratada à parte da fotografia histórica, nunca como sincronização de negócio.
5. Fronteira de dados: cadastro mestre possui nome/razão social, documentos, inscrições, endereços cadastrais, telefones, e-mail, estado civil, renda, profissão, referências, cônjuge e dados gerais equivalentes. O Contrato possui Cliente selecionado, dependente/beneficiário, avalista, consumidor final/NFC-e, endereço de entrega específico, contatos vinculados ao Contrato e escolhas comerciais/fiscais da própria Venda. Dados específicos do Contrato nunca propagam automaticamente ao cadastro mestre — nenhum fluxo inverso Delphi é reproduzido.
6. Cadastro Expresso do Laravel é reutilizado na inclusão e em `O/R`, somente para origem `C`; após sucesso, o novo Cliente é selecionado e passa pela mesma preparação/confirmação de transição; `F`/`L` usam seus cadastros completos, sem atalho expresso.
7. Contrato só existe com Cliente: o rascunho novo pode abrir sem Cliente, mas o primeiro F8 exige `tipo + código` válidos — sem eles não há alocação de número nem persistência (consistente com o seam da Fundação). Cliente nunca é removido de um Contrato persistido; em `O/R` só pode ser **substituído** pelo fluxo preparar/confirmar; em `F/P/N/C` não pode ser trocado (ainda que a sincronização física do mestre continue valendo em `F` pela regra 4).
8. Reserva e Faturamento (fatias posteriores) revalidam o vínculo de Cliente autoritativo no servidor; este spec não implementa esses comandos, só garante que a seção Cliente exponha o suficiente para que eles o façam.
9. A troca de Cliente é modelada como transição explícita preparar/confirmar, nunca como efeitos disparados direto pela mutação do formulário: preparar carrega identidade/cadastro autoritativos, avalia elegibilidade de tipo, calcula fotografia e contexto comercial (via o ponto de extensão da seção "Contrato de transição" abaixo), reúne alertas cadastrais/financeiros e Ficha Financeira, identifica autorizações pendentes, e devolve tudo para confirmação explícita do usuário; só confirmar aplica ao rascunho; cancelar preserva integralmente o Cliente e o contexto anterior; a persistência definitiva só ocorre no F8 atômico com `expected_revision`.
10. Reaproveite, sem redesenhar, os parâmetros/alertas já providos por `ClienteFeatureFlagsResolver` (incluindo `DiasAvisoAtualizarCliente`) e o disparo parametrizado de Ficha Financeira (`MostrarFichaSomenteAtraso`, `PerguntarAntesExibirFicha`, `naoexibirfichafinanceira`, restrição de Analista de Crédito) já fixados para Orçamentos — o Contrato dispara os mesmos alertas na seleção/troca, sem duplicar a lógica.

## Seção "Cliente" dentro do seam do núcleo

- A seção Cliente segue o protocolo de seção já definido na Fundação: carrega junto com o resumo inicial (fotografia resumida, tipo, capabilities de troca), participa do payload sujo de um F8 apenas quando alterada, e tem namespace de validação próprio.
- F8 ordinário nunca cria/troca Cliente por edição direta de campo — troca só entra no rascunho depois de uma confirmação explícita do fluxo preparar/confirmar (decisão 9); F8 então persiste a fotografia confirmada como parte atômica do rascunho, com o restante das seções.
- A capability "pode trocar Cliente" é calculada pelo servidor a partir da situação (`O/R` apenas) e nunca aceita do navegador, seguindo a precedência já fixada na Fundação (regra de estado → Permissão → Parâmetro → prova sensível).

## Contrato de transição preparar/confirmar (ponto de extensão para specs 3 e 4)

Especifique uma costura de backend de alto nível, análoga à do Orçamento, mas **desacoplada de produtos/planos concretos** por meio de um port/interface que os specs 3 e 4 implementarão:

- `prepare(contexto)` recebe identidade/`revision` do Contrato (ou identidade do rascunho), Cliente atual e proposto (`tipo + código`, inclusive remoção só permitida antes do primeiro F8), Filial, e o estado atual de produtos/serviços/planos/parcelas quando já existirem (por exemplo, Contrato originado de Orçamento já chega com itens). Calcula fotografia proposta, alertas cadastrais/financeiros, Ficha Financeira e autorizações pendentes; delega o recálculo de produtos/totais/planos/parcelas a uma porta `ClienteTransitionRecalculoComercialPort` (nome ilustrativo) com dois métodos: um que recalcula produtos/serviços/totais a partir do novo contexto de Cliente, e um que recalcula planos/parcelas a partir dos totais resultantes.
- `confirm(token/proposta)` aplica a fotografia e os resultados da porta ao rascunho em memória (sem persistir); F8 persiste tudo com o restante do rascunho.
- **Decisão de escopo explícita**: até os specs 3 e 4 existirem, a implementação da porta cobre apenas o caso de Contrato **sem produtos/serviços ainda** (rascunho novo vazio) — nesse caso, recalcular produtos/totais é um no-op documentado (nenhum item para reprecificar) e planos/parcelas seguem o mesmo "stub sem valor financiável" já usado pelo Orçamento. **Troca de Cliente num Contrato que já possui produtos/serviços lançados (por exemplo, originado de Orçamento) deve ser bloqueada nesta entrega com mensagem clara de operação ainda não suportada**, e não com um recálculo improvisado — evita inventar cálculo comercial que colidiria com os specs 3/4. Registre esse bloqueio como critério de aceite, não como bug.
- Defina respostas tipadas para: Cliente inválido, tipo não permitido pelo parâmetro, cadastro desatualizado pendente, autorização necessária/negada, conflito de `revision`, proposta expirada, e o bloqueio de "produtos já lançados" acima.
- Preparar/confirmar não persistem nada por si — a persistência definitiva ocorre no F8 atômico da Fundação.

## Autorizações e parâmetros

- Reaproveite a matriz de autorizações/parâmetros já fixada na Fundação (`01-speckit-prompt.md`, seção "Autorizações, permissões e parâmetros"); este spec não introduz uma nova camada, só os parâmetros próprios de Cliente: `SelecionarSomenteClientesnasVendas` e os já cobertos por `ClienteFeatureFlagsResolver`.
- Abrir `Editar Cliente` respeita as permissões já existentes do cadastro mestre correspondente (Clientes/Fornecedores/Filiais) — este spec não define uma permissão nova para abrir esses cadastros, só o atalho e a recarga pós-salvamento.

## Testes obrigatórios

1. Identidade: seleção `C` com `SelecionarSomenteClientesnasVendas` ativo; tentativa `F`/`L` bloqueada nesse caso; `C/F/L` permitidos quando desativado.
2. Primeiro F8 sem Cliente é rejeitado; primeiro F8 com Cliente válido persiste `tipo + código` atomicamente com o restante do rascunho.
3. Cliente nunca é removido de Contrato persistido; tentativa de remoção é rejeitada; substituição só é aceita em `O/R` via fluxo preparar/confirmar.
4. Sincronização do mestre: gravar o cadastro mestre em `C` com `AtualizarDadosClientesContratos` ligado reflete fotografia ampla em Contratos `O/R/F` do Cliente e não altera Contratos do mesmo Cliente em `P/N/C`; mudança de código/`conceito` atualiza identidade referencial sem reescrever a fotografia histórica congelada.
5. `revision`/capabilities do Contrato são recarregadas após gravação do mestre, e um F8 com `expected_revision` antiga após essa sincronização externa é rejeitado com as seções afetadas identificadas.
6. Cadastro Expresso: criação de Cliente `C` a partir do Contrato seleciona automaticamente o novo Cliente e entra no fluxo preparar/confirmar; não disponível para `F/L`.
7. Preparar/confirmar: fluxo feliz de troca em rascunho vazio aplica fotografia só após confirmação explícita; cancelamento preserva integralmente o Cliente e contexto anteriores; falha em qualquer etapa não deixa estado parcial.
8. Troca de Cliente em Contrato já populado por produtos/serviços é rejeitada com mensagem de operação não suportada nesta entrega (não silenciosamente ignorada nem calculada de forma improvisada).
9. Troca só permitida em `O/R`; rejeitada em `F/P/N/C` mesmo com `revision` válida.
10. Alertas/Ficha Financeira: reaproveitamento correto dos parâmetros já testados no Orçamento (ficha exibida conforme `MostrarFichaSomenteAtraso`/`PerguntarAntesExibirFicha`/`naoexibirfichafinanceira`, autorização de Analista de Crédito quando inadimplente), sem duplicar a suíte de testes do Orçamento — referencie/reutilize fixtures existentes.
11. Cadastro desatualizado (`DiasAvisoAtualizarCliente`): alerta exibido e pendência reconhecida; comportamento de bloqueio de gravação, se herdado do Orçamento, deve ser confirmado no checkout antes de ser assumido como requisito do Contrato — não pressuponha.

Prefira Feature tests no seam de aplicação real (herdado da Fundação); reutilize fixtures/casos dourados do fluxo de Cliente do Orçamento sempre que a regra for comum ao domínio; divergências documentadas recebem cenário próprio.

## Entregáveis

- Matriz de evidência Delphi × Laravel para vínculo, sincronização e edição de Cliente.
- Contrato da seção "Cliente" dentro do protocolo de seção da Fundação.
- Contrato de `prepare`/`confirm` de transição de Cliente, incluindo a interface da porta de recálculo comercial que os specs 3 e 4 deverão implementar.
- Matriz de parâmetros/autorizações específicos de Cliente, remetendo à matriz geral já fixada na Fundação.
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- motor comercial de Produtos, Serviços e cálculo (spec 3) e motor de Planos/Parcelas (spec 4) — este spec só define o ponto de extensão que eles devem satisfazer;
- recalcular produtos/totais/planos/parcelas de um Contrato já populado ao trocar Cliente — bloqueado nesta entrega, não implementado de forma improvisada;
- avalista, dependente e regras completas de Ficha Financeira além do disparo já parametrizado da seleção/troca;
- redesenhar o Cadastro de Clientes, de Fornecedores, de Filiais, o Cadastro Expresso ou a Ficha Financeira existentes;
- permissões detalhadas para abrir/editar cada cadastro mestre;
- qualquer regra fiscal ou de venda futura posterior a `F`;
- alterar o schema Delphi.
```
