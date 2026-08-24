# Pesquisa: parâmetros, autorizações e menu — Relatório de Entregas

## Escopo e classificação

Esta nota consolida a evidência primária disponível no checkout para o ticket **Identificar parâmetros, autorizações e acesso do Relatório de Entregas legado**. Ela é a autoridade que os prompts `/speckit.specify` devem consumir. A implementação Laravel e a reabertura da investigação Delphi estão fora deste trabalho.

Classificação usada:

- **CONFIRMADO** — literal, uso ou contrato aparece na fonte consultada;
- **INFERIDO** — conclusão derivada de uma evidência confirmada, explicitamente marcada;
- **DÚVIDA** — há indício, mas a fonte não permite fechar a decisão;
- **NÃO LOCALIZADO** — a busca no checkout/fonte disponível não encontrou a evidência;
- **DIVERGENTE** — fontes apresentam contratos diferentes;
- **POSSÍVEL BUG LEGADO** — comportamento legado tecnicamente inseguro ou inconsistente;
- **OPORTUNIDADE** — melhoria para o contrato Laravel, sem afirmar paridade observável.

## Fontes e disponibilidade

**CONFIRMADO.** O caminho informado originalmente, `C:\prjetos.vcl\apps\interlojas\dmrelatorioentrega.pas/.dfm` e `fmrelatorioentrega.pas/.dfm`, não existe neste checkout. As quatro unidades localizadas e usadas nesta pesquisa são:

- `delphi/apps/entrega/dmrelatorioentrega.pas`;
- `delphi/apps/entrega/dmrelatorioentrega.dfm`;
- `delphi/apps/entrega/fmrelatorioentrega.pas`;
- `delphi/apps/entrega/fmrelatorioentrega.dfm`.

Também foram consultados `delphi/biblio/clparametrossistema.pas`, `delphi/biblio/clusuario.pas`, o contrato Laravel vizinho de Cadastro de Romaneios e o service/migration Laravel que materializam a árvore Cloud de Entregas. A ausência do caminho `C:\prjetos.vcl\...` é **NÃO LOCALIZADO**, não prova de que o legado original não possua outras unidades.

## Parâmetros do sistema

### Resultado específico do relatório

**CONFIRMADO.** Os quatro arquivos do relatório não contêm `parametros_valor`, `ParSistema`, `ParameterService` ou outro acesso direto a parâmetro. O `rg` da unidade encontra apenas o campo privado `ParametroCabecalho`, usado para descrever os filtros no cabeçalho do FastReport (`dmrelatorioentrega.pas:45-54,70-152`); isso não é um parâmetro do sistema.

**CONFIRMADO.** O único ponto indireto identificável é a chamada herdada `AtribuirParametrosBaseRelatorio` antes de `ImprimirRelatoriofast` (`dmrelatorioentrega.pas:174-181`). A implementação dessa rotina base não foi localizada no checkout. Portanto, qualquer parâmetro comum que ela possa carregar é **NÃO LOCALIZADO** e não pode ser tratado como dependência específica do Relatório de Entregas.

Não criar no Laravel um manifest de parâmetros apenas porque a biblioteca Delphi possui propriedades com nomes parecidos. O manifest desta tela deve permanecer vazio até existir evidência de que um parâmetro influencia filtros, dados, autorização ou saída do relatório.

### Literais genéricos encontrados em `clparametrossistema.pas`

Os itens abaixo são contratos da biblioteca de parâmetros, não usos confirmados pela tela. Eles são registrados para evitar que uma implementação futura os confunda com dependências do relatório.

| Classificação | Descrição literal | Tipo exposto | Semântica/fallback da biblioteca | Uso concreto no Relatório de Entregas |
|---|---|---|---|---|
| **NÃO LOCALIZADO** | `DATA CONTABIL` (`ctDATA_CONTABIL`) | `TDateTime` / string | `AsDatetime` tenta `StrToDateTime`; erro retorna `30/12/1899`. A propriedade delega a `FList[ctDATA_CONTABIL]` (`clparametrossistema.pas:1969,2606-2609,4957-4964,7091-7097`). | Nenhum uso nas quatro unidades; as datas do relatório são filtros informados na tela. |
| **NÃO LOCALIZADO** | `DIASNOTARETROATIVA` (`ctDiasNotaRetroativa`) | inteiro | `AsInteger` tenta `StrToInt`; erro retorna `0` (`clparametrossistema.pas:2128,7791-7799,7100-7106`). | Nenhum uso nas quatro unidades. |
| **NÃO LOCALIZADO** | `Máscara Quantidade` (`ctMascaraQuantidade`) | string | `AsString` devolve o valor da filial ou, quando `ValorGlobal=true`, o valor da filial `-1`; ausente devolve string vazia (`clparametrossistema.pas:2132,7823-7847,7139-7155`). `MascaraQuantidadeGrade` troca vírgula e ponto (`clparametrossistema.pas:7849-7866`). | A query expõe campos `TFloatField`, mas nenhuma das quatro unidades atribui `DisplayFormat` a partir de `ParSistema`; o uso visual por FastReport permanece **DÚVIDA/NÃO LOCALIZADO**. |

O literal de quantidade aparece também no carregador comum, que atribui `frVariables['MascaraQuantidade']` (`clparametrossistema.pas:3226`), mas essa linha não prova que `AtribuirParametrosBaseRelatorio` ou o DFM desta tela o consuma. O prompt deve exigir confirmação no checkout Laravel do componente de número/relatório, sem pedir nova leitura da fonte Delphi.

### Precedência filial/global e tipos

**CONFIRMADO.** O SQL de carregamento da biblioteca transforma `parametrosfiliais.filial IS NULL` em filial `-1`, inclui parâmetros sem linha de valor por uma segunda seleção e ordena por descrição e filial descendente (`clparametrossistema.pas:1889-1909`). Cada linha de filial é acumulada em `TtecParametroSistema` por `Ler` (`clparametrossistema.pas:3157-3195`).

**CONFIRMADO.** Para `AsString` e `AsTStrings`, a biblioteca primeiro procura a filial corrente (`PorFilial`); somente se não encontrou e `ValorGlobal` for verdadeiro procura a entrada global `-1` (`clparametrossistema.pas:7109-7128,7139-7155`). O fallback global não é automático para todo parâmetro: depende do sinalizador `ValorGlobal` atribuído à lista/propriedade (`clparametrossistema.pas:3127-3130,3969-3972,7317-7318`).

**CONFIRMADO.** Conversões permissivas da biblioteca são: booleano verdadeiro apenas quando, após `LowerCase`, o valor é `true`; qualquer outro valor e exceção viram `false` (`clparametrossistema.pas:7076-7088`); inteiro inválido vira `0` (`:7100-7106`); real inválido vira `0` (`:7130-7137`); data inválida vira `30/12/1899` (`:7091-7097`); string sem valor vira `''` (`:7139-7155`).

**CONFIRMADO.** Quando o nome não existe na lista, `GetItemByName` emite mensagem de erro se a filial não for zero e devolve um objeto vazio (`clparametrossistema.pas:7305-7318`). O Laravel não deve reproduzir essa conversão silenciosa para uma regra de negócio: um parâmetro necessário deve falhar com diagnóstico; parâmetro opcional deve declarar o fallback no contrato.

**DECISÃO PARA OS PROMPTS.** Se uma futura evidência do checkout mostrar necessidade de parâmetro, resolver todas as descrições em uma leitura/bundle por Filial, com precedência explícita filial → global quando autorizada, tipos fechados, fallback declarado e snapshot auditável dos valores efetivos. Não fazer uma consulta por campo e não consultar `parametros_valor` dentro de loops.

## Usos concretos da tela e separação de parâmetros

**CONFIRMADO.** Os filtros da tela são dados da interação, não parâmetros do sistema:

- período de entrega inicial/final, default hoje até uma semana (`fmrelatorioentrega.pas:115-117`);
- período de vendas, sem default explícito no código localizado (`fmrelatorioentrega.dfm:25-37`);
- situação por `TRadioGroup`, `EM ABERTO` ou `ENTREGUE`, default no primeiro item (`fmrelatorioentrega.dfm:148-165`);
- seleção múltipla de regiões por consulta F9/duplo clique/botão, com `Ctrl+F9` (`fmrelatorioentrega.pas:63-72,134-169,234-239`);
- seleção de fornecedores de transporte e clientes por frames compartilhados; fornecedor é tipado como `F` (`fmrelatorioentrega.pas:119-123`, `fmrelatorioentrega.dfm:184-220,374-495`).

**CONFIRMADO.** O método `ImprimirRelatorio` transforma os filtros em macros de intervalo de venda/entrega, clientes, fornecedores e regiões, e acrescenta o texto usado no cabeçalho (`dmrelatorioentrega.pas:72-147`). A situação `EM ABERTO` usa `(quantidade - quantidadeentregue) > 0`, enquanto `ENTREGUE` usa `quantidadeentregue > 0` (`dmrelatorioentrega.pas:149-165`).

**POSSÍVEL BUG LEGADO / OPORTUNIDADE.** As listas são interpoladas no SQL por macro (`'and ('+ListaClientes+')'`, fornecedor e regiões), e as datas são formatadas dentro de strings SQL (`dmrelatorioentrega.pas:72-147`). O prompt Laravel deve exigir filtros tipados e bindados, `IN`/`ANY(array)` para coleções, uma consulta set-based e zero N+1; não copiar concatenação SQL.

## Autorização, `acessosmodulos` e menu

### Evidência diretamente ligada ao relatório

**NÃO LOCALIZADO.** Nenhuma das quatro unidades contém referência a `acessosmodulos`, `usuariosacessosmodulos`, `gruposusuariosacessosmodulos`, código numérico de acesso ou caminho de menu do Relatório de Entregas. Também não foi localizada, neste checkout, uma entrada literal `Relatório de Entregas`/`relatorioentrega` em uma unidade de menu Delphi.

Essa ausência não autoriza copiar o código `63`, nem afirmar que o relatório possuía grants próprios. O código `63` foi identificado pela documentação vizinha como acesso Delphi não Cloud do Cadastro de Romaneios e explicitamente não deve ser reutilizado (`modules/entregas/cadastro-romaneios/seguranca-menu-parametros.md:15-20`). Para este relatório, código, grants diretos e grants por grupo são **NÃO LOCALIZADOS**.

### Mecanismo legado genérico localizado

**CONFIRMADO.** A biblioteca de usuários monta a lista de acessos por `nomemenu` em `acessosmodulos`: une grants diretos em `usuariosacessosmodulos` com grants herdados pelo grupo em `gruposusuariosacessosmodulos` (`delphi/biblio/clusuario.pas:332-344`). A consulta é executada para o usuário corrente e seus resultados são materializados em uma lista ordenada (`clusuario.pas:428-438,612-625`). `TtecUsuarios.GetAdministrador` apenas expõe o flag de administrador (`clusuario.pas:441-444`); não há nessa fonte prova específica de que o Relatório de Entregas tenha bypass próprio.

**INFERIDO, aplicando o padrão Cloud já decidido para Entregas.** A folha futura deve ficar sob **Entregas e Montagens → Entregas → Relatório de Entregas**, com rota/capability própria. O contrato vizinho do Cadastro de Romaneios confirma a raiz `cloud.modulo.entrega_e_montagem`, o agrupador Entregas, a regra de usuário comum com linha explícita em `usuariosacessosmodulos` e a não replicação de grants (`modules/entregas/cadastro-romaneios/seguranca-menu-parametros.md:5-18,24-32,36-45`). O service Laravel correspondente mostra o fail-closed: administrador passa pelo contrato global; usuário comum precisa da folha Cloud localizada por rota e de uma linha explícita `(usuario, acesso)` (`laravel/backend/app/Services/Authorization/EntregasRomaneiosModuleAccessService.php:13-49`).

Para o Relatório de Entregas, a rota exata é uma decisão de especificação, não evidência legada. Uma opção legível é `entregas.relatorio-entregas.index`; o prompt deve confirmar convenções atuais do Laravel e criar/reutilizar a folha por identidade de rota, sem inventar código numérico e sem conceder grants em massa.

**RESTRIÇÃO DE IMPLEMENTAÇÃO PARA OS PROMPTS.** O middleware/backend deve proteger página, lookup/modal F9, F6, cancelamento, exportação, impressão/relatório e downloads. Esconder a folha no menu não é autorização. O browser não é autoridade para usuário, Filial, capability ou grant. Ausência, duplicidade ou configuração ambígua deve negar acesso e produzir diagnóstico operacional.

## Schema e ausência de evidência estrutural

**CONFIRMADO.** O SQL legado referencia `contratos`, `vfornecedores`, `produtoscontratos`, `produtos`, `bairros`, `cidades`, `dadosfiscais`, `romaneiosnotas`, `romaneios` e `regioes` (`delphi/apps/entrega/dmrelatorioentrega.dfm:53-201`). Há uma subconsulta agregada de `produtosdadosfiscais` ligada a `romaneiosnotas` para calcular `QuantidadeEntregue` (`:98-117`).

**NÃO LOCALIZADO.** Não existe ainda, em `modules/entregas/relatorio-entregas/`, um snapshot/schema autoritativo específico dessas relações. Antes da implementação, gerar e versionar uma fotografia de schema/constraints/nullable/índices/funções na própria pasta `modules/entregas/relatorio-entregas/schema/`, obtida por processo de pesquisa autorizado. Os prompts devem instruir o SpecKit a usar essa fotografia para validar tabelas, colunas e nulabilidade, sem consultar a fonte Delphi.

**RESTRIÇÃO PERMANENTE.** Se os campos de junção forem `NOT NULL` e a presença da relação for requisito do resultado, usar `INNER JOIN`; reservar `LEFT JOIN` para relação realmente opcional. Não usar testes runtime de driver, `hasTable`, `Schema::hasTable` ou `Schema::has*` para mascarar schema ausente; a ausência estrutural deve falhar no gate/versionamento.

## Contrato de handoff para os prompts `/speckit.specify`

1. Tratar esta nota como contrato legado consolidado e não pedir ao agente de implementação para abrir `C:\prjetos.vcl` ou qualquer fonte Delphi diretamente.
2. Não declarar parâmetros do sistema específicos sem nova evidência no checkout Laravel; os três literais de `clparametrossistema.pas` acima são candidatos genéricos não usados pela tela.
3. Preservar os filtros e a semântica de situação confirmados, mas parametrizar SQL, deduplicar listas e carregar em lote com `IN`/`ANY(array)` quando aplicável.
4. Fazer F6 devolver o mesmo read model usado pelo grid e pelo relatório, com Cancelar visível imediatamente e cancelamento real do backend/PostgreSQL; o botão não pode ser apenas visual.
5. Usar o modal padrão de pesquisa no F9, grid padrão do Laravel (catálogo, ordenação, personalização e exportação), command bar/breadcrumb padrão e atalhos somente quando comprovados na interface consolidada.
6. Criar acesso próprio sob a árvore **Entregas e Montagens → Entregas → Relatório de Entregas**, sem copiar grants legados. Administrador segue o bypass global já existente; usuário comum precisa de grant explícito e todas as rotas revalidam autorização no servidor.
7. Persistir o schema versionado antes de fechar a query e registrar como bloqueio qualquer tabela, coluna, função ou nulabilidade não comprovada.

## Resumo de ausência versus não localizado

| Pergunta | Resultado | Classificação |
|---|---|---|
| A tela chama `parametros_valor` diretamente? | Não nas quatro unidades localizadas. | **CONFIRMADO: ausência no escopo localizado** |
| A tela acessa `ParSistema` diretamente? | Não nas quatro unidades localizadas. | **CONFIRMADO: ausência no escopo localizado** |
| `AtribuirParametrosBaseRelatorio` carrega parâmetros? | A chamada existe; a implementação não foi localizada. | **NÃO LOCALIZADO** |
| Há literal/código de acesso específico do relatório? | Não localizado no checkout. | **NÃO LOCALIZADO** |
| Existe mecanismo legado de grant direto/grupo? | Sim, genérico em `clusuario.pas`. | **CONFIRMADO** |
| Existe contrato Laravel vizinho para a árvore Entregas? | Sim, para Romaneios; não é grant do relatório. | **CONFIRMADO / INFERIDO para reaproveitar o padrão** |
| Existe schema versionado específico do relatório? | Não localizado. | **NÃO LOCALIZADO** |

