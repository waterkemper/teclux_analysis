# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, a Fundação/Parâmetros da Consulta de Compras (Estoque → Compras → Consultas) — seleção de Filial/Grupo Filial, filtro de produtos, período de vendas e as opções auxiliares — a base sobre a qual o Motor de Sugestão de Compras (`02-speckit-prompt.md`) e a Requisição entre Filiais + Integração com Pedido de Compra (`03-speckit-prompt.md`) serão implementados.

Não implemente nesta etapa. O Laravel já possui Consulta de Estoques, Ficha de Produtos e Manutenção de Preços migrados, mas nenhuma parte da Consulta de Compras. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o checkout Laravel. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Não altere, complete ou descarte regras Delphi por inferência. Se o pacote fornecido for insuficiente ou ambíguo, registre uma DÚVIDA/BLOQUEIO objetiva para investigação no workspace de análise. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- seleção de Filial e Grupo Filial com listas de marcação múltipla;
- filtro de produtos seguindo o padrão arquitetural da Consulta de Estoques (filtros nativos por cadastro — Item de Produto, Grupo, Classe, Marca, Modelo, Promoção, e os equivalentes a CST/CSOSN, Lista Padronizada, Localizações de Estoque, Lotes, Atributos, Serviços), **sem** nenhuma dependência da Busca Assistida;
- período de vendas com recálculo bidirecional entre datas inicial/final e número de dias;
- os 7 checkboxes de status de estoque (Em Estoque, Reservado, Em Trânsito, Demonstração, Conserto, Danificada, Reserva Prévia) e o parâmetro "Estoque para: N dias";
- as opções auxiliares de produto (em linha/fora de linha, com/sem montagem, brinde, ativo/inativo, composto) e os filtros por Conceito e Grupos de Fornecedores;
- os atalhos de navegação para Consulta de Estoques, Ficha de Produtos e Manutenção de Preços, reaproveitando os módulos já migrados.

Não inclua nesta entrega: o cálculo de velocidade de vendas, estoque agregado, curva ABC, Tabela Redutora ou a fórmula da sugestão (spec `02-speckit-prompt.md`, que consome estes parâmetros); a Requisição entre Filiais e a integração com Pedido de Compra (spec `03-speckit-prompt.md`); o Cadastro de Pedidos de Compra em si (fora de escopo deste mapa, esforço futuro separado).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmconsultacompras.pas/.dfm` e `apps/estoque/fmconsultacompras.pas/.dfm`.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual e localizar os seams reaproveitáveis.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise.

## Investigação Laravel obrigatória

Analise o estado existente antes de desenhar qualquer filtro novo:

- `ConsultaEstoquesParameterManifest`, `GerarConsultaEstoquesRequest` e os componentes de filtro por cadastro da Consulta de Estoques (`resources/js/Pages/Cadastros/Estoque/ConsultaEstoques/`) — padrão arquitetural a replicar para o filtro de produtos;
- `App\Models\ConceitoVenda` (Conceitos, já existente);
- os módulos já migrados de Ficha de Produtos (`modules/estoque/ficha-produtos`) e Manutenção de Preços (`modules/estoque/manutencao-precos`) — para os atalhos de navegação;
- `specs/054-configuration-center` (Configuration Center) — ainda que esta Consulta não tenha Parâmetros do Sistema de negócio embutidos além de uma máscara de formatação (`MascaraQuantidadeGrade`, sem efeito de cálculo), confirme se algo mudou.

## Evidência Delphi confirmada

### Filial/Grupo Filial — comportamento a replicar exatamente, inclusive a ambiguidade

`MontarFiltroFiliais` (`dmconsultacompras.pas:2117-2142`): a variável `TodasFiliais` só fica `True` quando **todas** as filiais da lista estão marcadas; o loop marca `TodasFiliais := False` a cada filial desmarcada — inclusive quando **nenhuma** está marcada (toda a lista cai no `else`), produzindo uma lista de filtro vazia. **POSSÍVEL BUG LEGADO**: o nome da variável sugere a intenção "nenhuma marcada = todas", mas a lógica implementada não faz essa distinção. **DECISÃO DO USUÁRIO**: manter esse comportamento exatamente como está, sem corrigir a ambiguidade. `MontarFiltroGrupoFiliais` segue a mesma lógica, espelhada.

### Filtro de produtos — sem Busca Assistida

**DECISÃO DO USUÁRIO**: a aba Parâmetros tem um bloco de filtro de produtos (`tstSelecaoAleatoria*`: Grupo/Classe/Marca/Modelo/Especificações/Promoções/CST/CSOSN/Lista Padronizada/Localizações/Lotes/MarketPlace/Atributos/Serviços — o mesmo componente reaproveitado por Manutenção de Preços no Delphi), mas a Busca Assistida (painel de IA já existente no Laravel) foi descartada para este filtro. **DECISÃO DO USUÁRIO**: seguir o padrão arquitetural já usado pela Consulta de Estoques (filtros nativos por cadastro, cada Consulta com sua própria Parameter Manifest/Request — sem componente compartilhado, já que nenhum existe ainda).

### Período de vendas — recálculo bidirecional

CONFIRMADO (`edtDataInicialExit`/`edtDataFinalExit`/`edtNumerodediasExit`, `fmconsultacompras.pas`): preencher o número de dias recalcula a data inicial a partir da final (ou de hoje, se a final estiver vazia); preencher/alterar qualquer uma das datas recalcula o número de dias. Este comportamento é preservado.

### Estoque para N dias e os 7 checkboxes de status

CONFIRMADO (`fmconsultacompras.pas:674-710`): os 7 checkboxes (Em Estoque/Reservado/Em Trânsito/Demonstração/Conserto/Danificada/Reserva Prévia) constroem `Param_Estoque` como expressão SQL aditiva sobre as colunas correspondentes de `estoques` (`emestoque`, `reservado`, `transito`, `demonstracao`, `conserto`, `danificada`, `reservaprevia`), começando em `'0'` e somando `' + e.<coluna>'` para cada marcado. **Nenhum checkbox tem `Checked = True` por padrão no `.dfm`** — sem interação do usuário, a expressão resolve para `'0'` (estoque considerado zero). **DECISÃO DO USUÁRIO**: manter esse comportamento exatamente como está — nenhum padrão marcado no Laravel. "Estoque para: N dias" (`edtDiasEstoque`) e "Proporcional para: N dias" (`edtDiasProporcional`) são parâmetros distintos consumidos pela fórmula da sugestão (spec 02).

### Parâmetros do Sistema e autorizações — quase inexistentes

CONFIRMADO: busca exaustiva por `ParSistema.\w+` e `UsuarioLogin.\w+` nesta tela só encontrou `ParSistema.MascaraQuantidadeGrade` (máscara de formatação de relatório, sem efeito de cálculo) — nenhuma chamada a `ObterAutorizacao`. "Gravar F5" (`LerArquivoCFG`) persiste só o flag `PedidosEntreFiliais` num arquivo `.ini` **local por estação de trabalho**, não é Parâmetro do Sistema server-side. `qryFiliais` não filtra por Filiais liberadas ao usuário — não há restrição de acesso por Filial nesta tela.

## Decisões obrigatórias

1. Filial/Grupo Filial: listas de marcação múltipla, com a ambiguidade "nenhuma marcada" replicada fielmente (não tratada como "todas").
2. Filtro de produtos: Parameter Manifest/Request própria desta Consulta, seguindo o padrão da Consulta de Estoques — nenhuma dependência de Busca Assistida.
3. Período de vendas com recálculo bidirecional data↔dias preservado.
4. Estoque considerado na sugestão é uma expressão configurável por 7 checkboxes de status, nenhum marcado por padrão.
5. "Gravar F5" (persistência de preferências de busca) é local à sessão/estação do usuário, não um Parâmetro do Sistema — não migrar para o Configuration Center.
6. Nenhuma migration cria tabelas fisicamente inexistentes no Postgres compartilhado — `estoques`, `filiais`, `produtos`, `conceitos` já existem populadas; o trabalho é de repositório/domínio Laravel sobre elas.

## Critérios de aceite

- [ ] Filtro de produtos segue o padrão da Consulta de Estoques (filtros nativos por cadastro), sem nenhuma dependência da Busca Assistida.
- [ ] Seleção de Filial/Grupo Filial replica o comportamento Delphi, incluindo o caso "nenhuma marcada" tratado como filtro vazio (não como "todas").
- [ ] Período de vendas recalcula bidirecionalmente entre datas e número de dias.
- [ ] Os 7 checkboxes de status de estoque constroem a expressão aditiva correta; nenhum vem marcado por padrão.
- [ ] Os atalhos para Consulta de Estoques, Ficha de Produtos e Manutenção de Preços reaproveitam os módulos já migrados, sem duplicar lógica.

## Matriz mínima de testes

- Seleção de Filial com todas marcadas vs. algumas desmarcadas vs. nenhuma marcada — três comportamentos distintos, o último produzindo filtro vazio.
- Preencher número de dias recalcula datas; preencher datas recalcula número de dias.
- Cada um dos 7 checkboxes de estoque, isolado e em combinação, produz a expressão de soma correta; nenhum marcado resulta em estoque considerado zero.
- Navegação para Consulta de Estoques/Ficha de Produtos/Manutenção de Preços passa o contexto correto (produto+filial) para o módulo já migrado.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais desta fundação (parâmetros de Filial/Grupo Filial e filtro de produtos), não do Motor de Sugestão em si (spec 02, que consome estes parâmetros);
- identifiquem os arquivos/componentes Laravel atuais a estender ou seguir como padrão, após inspecioná-los;
- detalhem a Parameter Manifest/Request desta Consulta;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que o cálculo da sugestão, a Requisição entre Filiais e o Cadastro de Pedidos de Compra **não fazem parte** desta entrega;
- não mandem investigar Delphi.

## Fora de escopo

- implementar durante `/speckit.specify`;
- qualquer cálculo de velocidade de vendas, estoque agregado, curva ABC, Tabela Redutora ou fórmula de sugestão — ver spec `02-speckit-prompt.md`;
- Requisição entre Filiais e integração com Pedido de Compra — ver spec `03-speckit-prompt.md`;
- o Cadastro de Pedidos de Compra completo;
- Busca Assistida como mecanismo de filtro de produtos;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
