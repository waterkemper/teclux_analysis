# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a aba "Documentos fiscais" do Cadastro de Contratos — Etapa 5 (Faturamento até `F`), segundo e último spec dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`) e sobre `FaturarContrato` (`09-speckit-prompt.md`), cujo compromisso em `F` este spec projeta em modo somente leitura.

**A proposta financeira/razão financeiro (parcelas) já foi entregue pelo spec 4** — em `F/C`, a aba Pagamentos já reutiliza `FichaFinanceiraContratoParcelasPanel` e já expõe o deep-link para a Ficha Financeira completa. Não reabra, não redefina e não duplique essa entrega. Este spec cobre exclusivamente a projeção somente leitura de **documentos fiscais** (notas, cupons e devoluções) e a reconciliação da fonte de dados correta para o Cadastro, seguindo o mesmo padrão de deep-link já estabelecido pelo spec 4 para o contexto financeiro.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real, especialmente as duas projeções de documentos fiscais hoje existentes (Ficha Financeira e Consulta de Contratos); corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- a aba **"Documentos fiscais"** do shell (já nomeada como área na Fundação, ainda sem componente), carregada sob demanda seguindo o protocolo de seção já estabelecido (Cliente/Produtos/Serviços/Pagamentos);
- reaproveitamento de `FichaFinanceiraService::listDoctosFiscais` (e, por trás dele, `LegacyFichaFinanceiraContratoTabsRepository::listNotasECuponsSaida`/`listNotasDevolucao`) como **única fonte** de documentos fiscais — a mesma já usada pela Ficha Financeira — e do componente `FichaFinanceiraContratoDoctosFiscaisPanel.tsx`, reaproveitado tal como está ou com adaptação mínima de layout;
- uma **decisão documentada e explícita** sobre a divergência confirmada entre essa projeção e a projeção própria, mais restrita, hoje usada pela Consulta de Contratos (ver Investigação Laravel obrigatória): o Cadastro adota a projeção da Ficha Financeira;
- o **deep-link** para a Ficha Financeira completa no contexto do documento fiscal do Contrato, seguindo o mesmo padrão já usado pela aba Pagamentos (spec 4) para o razão financeiro — sem embutir a experiência completa da Ficha dentro do Cadastro;
- a operacionalização, especificamente nesta aba, da regra já fixada na Fundação de que `F/P/N` são somente leitura — nenhuma ação de gravação, seleção de item para documento ou comando fiscal nasce aqui;
- rótulos de situação documental (`F/P/N`) reaproveitando `ContratoSituacaoDocumentalMapper` já existente.

Não inclua: qualquer cálculo, seleção, planejamento, preparação, submissão, autorização ou confirmação fiscal, e as transições que produzem/recalculam `P/N` (Etapa 9); qualquer edição de parcelas, recebimento, baixa ou estorno financeiro (já entregue pelo spec 4 ou pertencente à Ficha Financeira); a correção da projeção divergente da Consulta de Contratos (documentar como achado, não implementar aqui); cancelamento, reversão ou devolução de documento fiscal (fatia própria de cancelamento/devolução).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual — especialmente as duas projeções de documentos fiscais já existentes — e construa a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Services\Vendas\FichaFinanceiraService::listDoctosFiscais(string $numero, ?string $contratoFiscal)` (chamado por `FichaFinanceiraController.php:199`) — **já monta** exatamente `{notas_saida, notas_devolucao}` a partir dos dois métodos abaixo. Reaproveite este método público; não recomponha a consulta.
- `App\Infrastructure\Persistence\Legacy\Vendas\LegacyFichaFinanceiraContratoTabsRepository::listNotasECuponsSaida` (~443-565) — inclui **notas e cupons**, todas as situações fiscais (`N`/`C`/`D`, com `descricaosituacao` mapeada: NORMAL/CANCELADA/DENEGADA), `valortotal`, e resolve o "contrato fiscal" via `resolveContratoFiscalNumero` (~1181-1200), que cai para `contratos.primogenito` quando nenhum contrato fiscal explícito é informado. `listNotasDevolucao` (~570 em diante) usa a mesma resolução para devoluções. Confirme com o futuro spec de semântica de cópia se esse fallback por linhagem é o comportamento definitivo para Contratos desmembrados antes de tratá-lo como encerrado — mas adote-o como base nesta fatia, por ser estritamente mais completo que a alternativa abaixo.
- **`DIVERGENTE` confirmada** — `App\Infrastructure\Persistence\Legacy\Vendas\LegacyContratoDetalheRepository::listNotasFiscaisByContrato` (~149-185), usada por `ConsultaContratosDetalheService::buildResponse` para a chave `notas_fiscais`, é uma **segunda projeção**, mais restrita: só a tabela `notas` (sem cupons, sem devoluções), filtrada a `df.situacao = 'N'` (oculta canceladas e denegadas), sem `valortotal`, sem a resolução por linhagem/`primogenito`. Documente esta divergência com a evidência acima; decida e registre que o Cadastro usa a projeção da Ficha Financeira, e trate a reconciliação da Consulta como achado a resolver fora deste spec — não a corrija aqui.
- `App\Services\Vendas\ConsultaContratosDetalheService` — já injeta `LegacyFichaFinanceiraContratoTabsRepository $contratoTabs` e já reaproveita `listParcelas`/`listTransacoesByContrato` dele para parcelas/razão financeiro (o padrão de reaproveitamento correto já existe e funciona ali); a lacuna de projeção divergente está isolada em documentos fiscais, não é um problema geral desta classe.
- `Components/erp/vendas/fichaFinanceira/FichaFinanceiraContratoDoctosFiscaisPanel.tsx` — componente já pronto: grid de notas/cupons de saída (`filial, serie, maquina, intervencao, numero, data, situacao, descricaosituacao, valortotal`) e grid de devolução, com formatação de data/moeda já resolvida. Reaproveite tal como está ou com adaptação mínima de layout para a aba do Cadastro; não recrie os grids.
- Spec 4 (`04-speckit-prompt.md`, decisão 16 e "Seção Pagamentos") — já entrega, em `F/C`, projeção somente leitura de parcelas/razão financeiro via `FichaFinanceiraContratoParcelasPanel` e o deep-link para a Ficha Financeira completa. Este spec não reabre essa entrega; replica o mesmo padrão de deep-link para o contexto de documentos fiscais, sem inventar um segundo mecanismo de navegação.
- `App\Support\Vendas\ContratoSituacaoDocumentalMapper` — rótulos `F/P/N` já prontos (`FATURADO`/`NOTA PARCIAL`/`NOTA FISCAL`); reaproveitar para exibição, não recriar.
- `App\Support\Vendas\ContratoFichaSituacaoMapper` — classificação financeira derivada (`aberto`/`em_atraso`/`quitado`/etc., distinta da situação documental) já existe e é usada por outras telas. Está disponível caso a especificação decida exibi-la nesta aba, mas nenhum ticket já fixou essa exigência — decida e documente explicitamente se entra ou não, sem inventar escopo não pedido.
- Shell da Fundação (`01-speckit-prompt.md`) — "Documentos fiscais" já é área nomeada no plano de abas, mas nenhum componente (`DocumentosFiscaisTab.tsx` ou equivalente) existe ainda no checkout. Esta fatia constrói a aba do zero, seguindo o mesmo protocolo de seção (carregamento sob demanda, aba inaplicável não renderiza, cache por `revision`) já usado por Cliente/Produtos/Serviços/Pagamentos.

## Evidência Delphi confirmada

### Vocabulário: por que a aba pode estar vazia mesmo em `F`

- `CONFIRMADO` — faturar o Contrato (`R → F`, spec 9) e emitir documento fiscal são operações diferentes; `F` significa Faturado, não "NF emitida". O Delphi só cria `dadosfiscais`, nota/cupom, itens, vencimentos e vínculos no fluxo documental posterior. Evidências: `fmcadastrocontratos.pas:3089-3095,3448-3542,3873-3888`; `dmcadastrocontratos.pas:2641-2761,6142-6145,7718-7738,10218-11238,11303-12170`.
- `DECISÃO NOVA` — como a emissão fiscal propriamente dita é esforço posterior (Etapa 9, ainda não especificado), é esperado e correto que a aba "Documentos fiscais" apareça vazia para a maioria dos Contratos faturados pelo novo Cadastro na primeira liberação — isso não é um bug desta fatia, é a fronteira já decidida pelo mapa.
- `CONFIRMADO` — `P — Nota Parcial` e `N — Nota Fiscal` são estados documentais reconhecidos pelo sistema (`contratos.situacao`), distintos de `estado_ficha` (classificação financeira derivada — aberto/em atraso/quitado); as duas máquinas não devem ser confundidas nesta aba nem em nenhuma outra.

### Reaproveitamento e projeção única

- `CONFIRMADO` — a Ficha Financeira Laravel já consulta notas/cupons de saída e devoluções, com situação e `dadofiscal` (ver Investigação Laravel obrigatória); a UI correspondente já existe.
- `CONFIRMADO` — o detalhe da Consulta de Contratos também expõe notas fiscais, mas por um caminho próprio e mais restrito (ver `DIVERGENTE` acima).
- `DECISÃO NOVA` — Cadastro, Consulta e Ficha devem reutilizar uma única projeção de documentos fiscais. O Cadastro não cria outro grid/repository incompatível; acrescenta comandos somente onde houver capability (nenhum comando nesta primeira entrega, que é inteiramente somente leitura).

## Estado Laravel confirmado

- Existem **duas** projeções de documentos fiscais de Contrato hoje: a da Ficha Financeira (`listNotasECuponsSaida`/`listNotasDevolucao`, completa, com resolução por linhagem) e a da Consulta (`listNotasFiscaisByContrato`, restrita a notas com situação `N`, sem cupons/devoluções/valor/linhagem). Nenhuma delas foi construída pensando no Cadastro.
- Nenhum componente de UI para "Documentos fiscais" existe no Cadastro; o painel da Ficha (`FichaFinanceiraContratoDoctosFiscaisPanel.tsx`) é o único candidato pronto para reaproveitamento direto.
- O deep-link para a Ficha Financeira completa já existe como padrão estabelecido pela aba Pagamentos (spec 4); nenhum equivalente para o contexto de documentos fiscais foi localizado ainda.
- `ContratoSituacaoDocumentalMapper` e `ContratoFichaSituacaoMapper` já existem e cobrem, respectivamente, o rótulo documental e a classificação financeira derivada.

## Decisões obrigatórias

1. O Cadastro nunca cria uma terceira projeção de documentos fiscais; reaproveita `FichaFinanceiraService::listDoctosFiscais` como única fonte, idêntica à usada pela Ficha Financeira.
2. A divergência entre essa projeção e a da Consulta de Contratos é documentada com evidência concreta, mas **não corrigida** dentro deste spec — a Consulta continua como está até uma decisão própria fora desta série.
3. A resolução por linhagem/`primogenito` (`resolveContratoFiscalNumero`) é adotada como está nesta fatia; qualquer refinamento definitivo para Contratos desmembrados aguarda a especificação de semântica de cópia.
4. A aba é inteiramente somente leitura: nenhum comando de gravação, seleção de item para documento ou ação fiscal nasce aqui, em nenhuma situação (`O/R/F/P/N/C`).
5. A aba segue o mesmo protocolo de seção já usado pelas demais abas do Cadastro (carregamento sob demanda, cache por `revision`, aba inaplicável não renderiza — por exemplo, pode ficar oculta ou vazia com mensagem clara em `O/R`, onde nenhum documento pode existir).
6. O deep-link para a Ficha Financeira completa replica exatamente o padrão já estabelecido pela aba Pagamentos (spec 4); não é um novo mecanismo de navegação.
7. Rótulos de situação documental reaproveitam `ContratoSituacaoDocumentalMapper`; exibir ou não a classificação financeira derivada (`ContratoFichaSituacaoMapper`) é uma decisão explícita desta especificação, não uma obrigação herdada de ticket algum.
8. Este spec não implementa nada da Etapa 9 (preparação, seleção, submissão, autorização, confirmação fiscal, transições que produzem `P/N`); apenas projeta, somente leitura, o que já existir nas tabelas fiscais legadas.
9. Autorização de visualização reaproveita a matriz de capabilities já fixada na Fundação; nenhuma prova sensível é necessária para uma aba puramente de leitura, salvo se a especificação decidir proteger algum dado sensível específico exposto nela (documentar a decisão, não assumir).

## Contrato da seção "Documentos fiscais"

- Entrada: identidade do Contrato (`numero`), `revision` para cache, contexto do ator para autorização de visualização.
- Processo: resolver o "contrato fiscal" pela mesma lógica já usada pela Ficha (`resolveContratoFiscalNumero`) → consultar `listDoctosFiscais` (notas/cupons de saída + devoluções) → mapear rótulos de situação documental e fiscal para exibição.
- Saída: `{notas_saida, notas_devolucao}` no mesmo formato já consumido por `FichaFinanceiraContratoDoctosFiscaisPanel.tsx`, mais a URL de deep-link para a Ficha Financeira completa.
- Esta seção nunca grava; qualquer tentativa de comando de escrita roteada para esta aba é rejeitada no servidor.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações/capabilities já fixada na Fundação; a capability de visualização desta aba segue o mesmo nível de acesso das demais abas de leitura do Cadastro.
- Não introduza parâmetros ou permissões novas sem necessidade comprovada pela evidência Delphi ou pela decisão explícita desta especificação.

## Testes obrigatórios

1. A aba renderiza exatamente o mesmo conjunto de documentos fiscais que a Ficha Financeira mostra para o mesmo Contrato — mesmo dataset, nenhuma consulta divergente própria do Cadastro.
2. Nenhuma rota de escrita nasce nesta aba; payload manipulado no frontend não cria, altera nem cancela documento algum.
3. `F/P/N` exibidos com o rótulo correto (`ContratoSituacaoDocumentalMapper`); nenhuma ação de edição fica habilitada em nenhuma situação.
4. Em `O/R`, a aba fica vazia/oculta com mensagem clara, sem erro, consistente com o protocolo de seção da Fundação.
5. Resolução por linhagem: um Contrato com `primogenito` diferente do próprio número usa a mesma resolução que a Ficha Financeira já usa — teste explícito comparando os dois caminhos.
6. Regressão: a suíte da Consulta de Contratos permanece inalterada; nenhum teste desta fatia depende de corrigir `listNotasFiscaisByContrato`.
7. Teste-sinalizador explícito documentando a divergência entre `listNotasECuponsSaida`/`listNotasDevolucao` e `listNotasFiscaisByContrato` (ex.: comparação dos dois datasets para o mesmo Contrato com nota cancelada ou cupom), servindo de lembrete vivo até uma decisão de reconciliação fora deste spec.
8. Deep-link para a Ficha Financeira completa aponta para o contexto correto de Cliente/Contrato e não duplica dados já carregados na aba.

Prefira Feature tests no endpoint/seção real; reutilize fixtures e helpers já existentes da suíte de Ficha Financeira e da Consulta de Contratos para os casos de regressão e de divergência.

## Entregáveis

- Contrato da seção "Documentos fiscais" (entrada/processo/saída) e sua integração ao protocolo de seção da Fundação.
- Decisão documentada sobre qual projeção o Cadastro usa e o registro formal da divergência com a Consulta de Contratos, incluindo evidência concreta (arquivo/linha) dos dois caminhos.
- Matriz de evidência Delphi × Laravel para documentos fiscais, deixando explícito o que a Ficha Financeira já cobre.
- Critérios de aceitação e testes, incluindo o teste-sinalizador da divergência como parte da suíte obrigatória.
- Riscos, dúvidas (definitividade do fallback por `primogenito` para Contratos desmembrados) e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- qualquer cálculo, seleção, planejamento, preparação, submissão, autorização ou confirmação fiscal, e as transições que produzem/recalculam `P/N` (Etapa 9);
- edição de parcelas, recebimento, baixa, estorno ou qualquer operação financeira (spec 4 e Ficha Financeira);
- corrigir a projeção divergente da Consulta de Contratos — apenas documentá-la;
- cancelamento, reversão e devolução de documento fiscal;
- redesenhar `FichaFinanceiraContratoDoctosFiscaisPanel.tsx`, `FichaFinanceiraContratoParcelasPanel` ou a Ficha Financeira completa;
- alterar o schema Delphi.
```
