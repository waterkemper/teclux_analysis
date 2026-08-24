# Pesquisa da interface Delphi — Relatório de Entregas

## Escopo e autoridade da evidência

Este artefato consolida a leitura das fontes Delphi disponíveis, para que os prompts de especificação não dependam de uma nova inspeção do legado:

- `delphi/apps/entrega/fmrelatorioentrega.pas` e `.dfm` — formulário e eventos da tela.
- `delphi/apps/entrega/dmrelatorioentrega.pas` e `.dfm` — dataset, macros, SQL e definição do relatório chamado pelo formulário.
- `delphi/repositorio/frintervalodatas.pas` e `.dfm` — frame compartilhado de intervalo de datas.
- `delphi/repositorio/frselecaoaleatoria.pas` e `.dfm` — frame compartilhado de listas condicionais.
- `delphi/repositorio/frselecaoaleatoriaclientes.pas` e `.dfm` — frame compartilhado de clientes/fornecedores.
- `delphi/repositorio/frconsultacodigo.pas` e `.dfm` — modal de pesquisa usado pelos frames.
- `delphi/repositorio/fmrelatoriopadrao.pas` e `.dfm`, `fmnavcontroles.pas` — atalhos e command bar herdados.
- `delphi/biblio/clparametrossistema.pas` — infraestrutura de parâmetros do sistema, consultada para verificar existência de contrato de parâmetro.

Não foram inspecionados fontes fora desse conjunto, nem foi feita implementação Laravel. Referências abaixo estão no formato `arquivo:linha`.

## Identidade e composição visual

| Elemento | Evidência | Classificação | Contrato observável |
|---|---|---|---|
| Formulário | `fmrelatorioentrega.dfm:1-15` | `CONFIRMADO` | Classe `Tfrmrelatorioentrega`, caption “Relatório de entregas”, MDI child, 673×511; o foco inicial é o intervalo de entrega (`ActiveControl`). |
| Herança | `fmrelatorioentrega.pas:13-26`; `fmrelatoriopadrao.pas:12-27` | `CONFIRMADO` | A tela herda `TfrmRelatorioPadrao` e expõe o command bar padrão do relatório. |
| Período de vendas | `fmrelatorioentrega.dfm:25-38` | `CONFIRMADO` | `fraIntervaloDatasVenda`, caption “PERÍODO DE VENDAS”, primeiro tab order do bloco. Não há default atribuído no formulário; tratar como vazio. |
| Período de entrega | `fmrelatorioentrega.dfm:167-183`; `fmrelatorioentrega.pas:115-116` | `CONFIRMADO` | `fraIntervaloDatasEntrega`, caption “PERÍODO DE ENTREGA”; abertura define início = data corrente e fim = `incWeek(Date)`. |
| Situação | `fmrelatorioentrega.dfm:148-166` | `CONFIRMADO` | `TRadioGroup` com `ItemIndex = 0`: `EM ABERTO`; segunda opção: `ENTREGUE`. O índice é passado ao dataset em `fmrelatorioentrega.pas:224-231`. |
| Agrupamento | `fmrelatorioentrega.dfm:102-146` | `DIVERGENTE` / `POSSÍVEL BUG LEGADO` | Grupo “AGRUPAMENTO”, opções “REGIÕES” e “CLIENTES”, mas `Visible = False`; os valores não entram na chamada `ImprimirRelatorio` (`fmrelatorioentrega.pas:224-231`). Não gerar comportamento de agrupamento sem nova decisão explícita. |
| Regiões | `fmrelatorioentrega.dfm:39-100`; `fmrelatorioentrega.pas:96-113` | `CONFIRMADO` | Lista tabular com query inicial `select r.* from regioes r where false`; mostra somente `codigo` e `nome`, com código editável e nome somente leitura. |
| Clientes envolvidos | `fmrelatorioentrega.dfm:374-506` | `CONFIRMADO` | Frame de seleção condicional com grade de clientes e filtros por campo, comparação e lógica. |
| Fornecedores de transporte | `fmrelatorioentrega.dfm:184-373`; `fmrelatorioentrega.pas:119-122` | `CONFIRMADO` | Mesmo frame condicional, configurado como `pesFORNECEDORESTRANSPORTE`, tipo `F`, fornecedor `F`, e `ConsultarTodos = true`. |
| Autorização/menu | fontes inspecionadas | `NÃO LOCALIZADO` | Não há chamada de autorização, grant, `acessosmodulos` ou definição do caminho “Entregas e Montagens → Entregas → Relatório de Entregas” nessas unidades. Isso deve ser decidido/confirmado no checkout Laravel, sem reabrir Delphi. |

## Defaults, controles e operações

### Intervalos de datas

O frame compartilhado tem dois `TEditData`, com máscara/comprimento máximo de 10 e limites DFM `Minimo = 37353`, `Maximo = 0` (`frintervalodatas.dfm:44-76`). A regra de validação compartilhada exige datas válidas, início menor ou igual ao fim e pelo menos uma data preenchida (`frintervalodatas.pas:28-50`).

Na tela concreta, somente o intervalo de entrega recebe default (`fmrelatorioentrega.pas:115-116`). A rotina local de impressão, contudo, verifica explicitamente apenas o caso em que as duas datas de entrega estão vazias (`fmrelatorioentrega.pas:211-222`). O chamador genérico também executa `VerificarComponentesdePesquisa` antes de `InternoImpressao` (`fmrelatoriopadrao.pas:63-95`), mas a ligação concreta desse verificador aos dois frames não está nas fontes autorizadas.

Classificação: `CONFIRMADO` para a regra do frame e para o default; `DÚVIDA` sobre qual camada efetivamente executa a validação do formulário; `OPORTUNIDADE` para o Laravel registrar mensagens e validação de intervalo de forma explícita e testável.

### Regiões

- `CampoParaLista = 'codigo'` e a consulta é aberta no construtor (`fmrelatorioentrega.pas:96-98`).
- A pesquisa é `TfraConsultaCodigo`, com código de comprimento máximo 4, datasource/campo vinculados à linha corrente, pesquisa `pesRegioes`, lookup por `Codigo` e `AbrirTabelaProcura = false` (`fmrelatorioentrega.pas:100-112`).
- Após abrir, todos os campos são ocultados; somente `codigo` e `nome` ficam visíveis, com labels “CÓDIGO” e “NOME”; a primeira linha vazia é criada (`fmrelatorioentrega.pas:173-200`).
- Duplo clique e botão de procura chamam o modal; Enter tenta resolver o código e, se não encontrar, mantém o foco no código (`fmrelatorioentrega.pas:134-169`, `234-239`).
- O DFM habilita edição, redimensionamento, linhas, tabs e cancelamento de edição (`fmrelatorioentrega.dfm:66-79`).

### Clientes e fornecedores

O frame cliente cria uma tabela em memória com `codigo`, `tipo`, `descricao`, `campo`, `opcomparacao` e `oplogico` (`frselecaoaleatoriaclientes.pas:94-105`). A nova linha recebe `campo = codigo`, comparação `= Igual a` e lógica `ou` (`frselecaoaleatoriaclientes.pas:68-77`). O cliente padrão é `pesCLIENTES`, tipo `C`; o fornecedor é reconfigurado pelo formulário para fornecedor de transporte/tipo `F` (`frselecaoaleatoriaclientes.pas:113-134`; `fmrelatorioentrega.pas:119-122`).

Colunas e opções visuais são confirmadas em `frselecaoaleatoriaclientes.dfm:20-93` e nos overrides da tela `fmrelatorioentrega.dfm:224-350` e `414-483`:

| Campo | Label/valores | Estado |
|---|---|---|
| `codigo` | Cliente | editável; pesquisa modal em duplo clique, botão e Ctrl+F9 |
| `tipo` | T | preenchido pela pesquisa; somente leitura no frame (`frselecaoaleatoriaclientes.pas:47-54`) |
| `descricao` | Nome do Cliente / Nome do Cliente | preenchida pela pesquisa |
| `campo` | `codigo`, `descricao`, `cpf/cnpj` | pick list |
| `opcomparacao` | igual, diferente, maior/menor, contém, não contém, contido na lista, não contido na lista | pick list |
| `oplogico` | `e`, `ou` | pick list |

Adicionar, excluir item e excluir todos são operações do frame compartilhado (`frselecaoaleatoria.pas:122-143`; `frselecaoaleatoria.dfm:135-321`). A lista condicional é convertida para aliases da consulta: `codigo → vf.codigo`, `tipo → vf.tipo`, `descricao → vf.nome`, `cpf/cnpj → vf.pessoanumero` (`frselecaoaleatoriaclientes.pas:137-145`, `222-228`).

## Filtros e SQL efetivamente gerado

### Parâmetros de chamada

O formulário passa para `dtmrelatorioentrega.ImprimirRelatorio` os textos dos dois intervalos, a lista condicional de clientes, a lista de fornecedores, a lista de códigos de regiões e o índice da situação (`fmrelatorioentrega.pas:224-231`). O data module declara macros para esses argumentos e para as condições de situação (`dmrelatorioentrega.dfm:17-52`).

### Data de entrega e data de venda

`ImprimirRelatorio` gera macros SQL para os quatro casos de cada intervalo (`dmrelatorioentrega.pas:72-121`):

- ambas preenchidas: `between` inclusivo;
- somente início: `>=`;
- somente fim: `<=`;
- ambas vazias: sem predicado.

O filtro de entrega usa `pc.dataentrega`; o de venda usa `ct.data` (`dmrelatorioentrega.pas:74-121`). As strings são convertidas por `StrToDateTime` e formatadas como `yyyy-mm-dd`.

### Clientes, fornecedores e regiões

- Cliente: quando a lista não está vazia, é inserida como `and (<ListaClientes>)` (`dmrelatorioentrega.pas:124-130`). A lista vem do frame com comparadores e lógica, não é necessariamente uma simples lista de ids.
- Fornecedor de transporte: a macro recebe `and (<ListaFornecedoresTransporte>)`, substituindo `vf.` por `vft.` (`dmrelatorioentrega.pas:132-139`).
- Região: a macro recebe `and ((b.regiao in (<lista>)) or (d.regiao in (<lista>)))` (`dmrelatorioentrega.pas:141-147`).
- Situação “em aberto”: predicado `(quantidade - quantidadeentregue) > 0` (`dmrelatorioentrega.pas:154-159`).
- Situação “entregue”: predicado `quantidadeentregue > 0` (`dmrelatorioentrega.pas:160-164`).

O frame legado constrói SQL textual, inclusive para “contido na lista”, usando `string_to_array`/`unnest` e casts (`frselecaoaleatoria.pas:918-1026`, `1134-1237`). Isso é evidência do comportamento legado, não recomendação de implementação.

### Relações, projeção e ordenação

O SQL fonte está em `dmrelatorioentrega.dfm:53-201`. A consulta parte de `Contratos ct`, `ProdutosContratos pc` e `Produtos p`; associa cliente/fornecedor por `vFornecedores vf`; obtém bairro/cidade por `Bairros b` e `Cidades d`; liga dados fiscais/romaneio/fornecedor de transporte; e finalmente região por `Regioes r` (`dmrelatorioentrega.dfm:122-158`, `187-201`).

Filtros fixos comprovados: `pc.Entrega = 'S'` e `ct.Situacao IN ('F','N','P')` (`dmrelatorioentrega.dfm:160-170`). O endereço de entrega usa `COALESCE` entre endereço de entrega e endereço cadastral (`dmrelatorioentrega.dfm:65-84`). A ordenação é região, UF/cidade/bairro/endereço, contrato, cliente e tipo (`dmrelatorioentrega.dfm:197-201`).

Quantidade entregue é calculada por subconsulta correlacionada que soma `ProdutosDadosFiscais` + `RomaneiosNotas` para cada produto (`dmrelatorioentrega.dfm:98-117`). Classificação: `CONFIRMADO` como SQL legado; `OPORTUNIDADE` para substituir por agregação set-based/CTE ou subconsulta pré-agregada no Laravel, eliminando risco de custo repetitivo; não traduzir isso como N+1 de requisições HTTP, mas também não copiar cegamente.

O SQL usa `LEFT JOIN` em `Bairros`, `Cidades`, o conjunto fiscal/romaneio e `Regioes` (`dmrelatorioentrega.dfm:132-158`, `187-189`). A projeção prevê região não definida com `COALESCE(r.Nome, 'NÃO DEFINIDA')` (`dmrelatorioentrega.dfm:53-58`). A nulabilidade real das colunas não está nas fontes Delphi inspecionadas: a decisão inner/left deve ser confirmada no schema Laravel. Se as chaves envolvidas forem `NOT NULL` e a relação for obrigatória, o prompt deve exigir `INNER JOIN`; manter `LEFT JOIN` somente quando a ausência tiver significado funcional, como “região não definida”.

Os macros legados concatenam valores e expressões SQL (`dmrelatorioentrega.pas:74-147`; `frselecaoaleatoria.pas:957-1011`). Classificação: `POSSÍVEL BUG LEGADO`/`OPORTUNIDADE`; a especificação Laravel deve exigir bindings, listas tipadas em uma consulta e `IN` ou `= ANY(:array)` quando a semântica for de ids, sem N+1 e sem concatenar entrada de usuário.

## Grid e superfície do relatório

### Grid legado visível na tela

Os únicos grids no formulário são os grids de seleção de regiões, clientes e fornecedores — não um grid de resultados (`fmrelatorioentrega.dfm:53-99`, `198-371`, `388-505`). Eles suportam edição, títulos, indicador, resize, linhas, tabs e cancelamento de edição (`fmrelatorioentrega.dfm:66-72`, `224-249`, `414-483`). O padrão compartilhado permite exclusão via grid (`CanDelete = True`) e não grava configurações (`GravarConfiguracoes = False`) (`frselecaoaleatoria.dfm:17-57`).

Classificação: `DIVERGENTE` em relação ao requisito de migração de exibir o resultado do F6 em grid com ordenação, personalização e exportação. O Laravel deve criar uma superfície de resultado própria e manter equivalência com o dataset do relatório; isso é requisito do destino, não comportamento confirmado do Delphi.

### Dataset de saída

O data module expõe os campos de saída em `dmrelatorioentrega.dfm:205-312`: cliente/tipo/nome; endereço (rua, número, complemento, bairro, CEP, cidade, UF); produto e descrição; quantidade, quantidade entregue e a entregar; região/código da região; contrato; datas de emissão/faturamento/entrega; filial de venda; observação de montagem; dia da semana. Formatos confirmados: quantidades `0.00`, inteiros `0`, datas com máscara `99/99/9999` (`dmrelatorioentrega.dfm:205-312`).

O relatório `frpRelatorioEntrega` usa `fdsRelatorioEntrega`, tem preview com zoom, carregar, salvar, imprimir, localizar, ajuda e sair, e aplica zebração em `BeforePrint` (`dmrelatorioentrega.dfm:314-320`; `dmrelatorioentrega.pas:187-192`). A impressão é disparada após `Open`; se vazio, mostra “Nenhum registro encontrado”; caso contrário chama `ImprimirRelatoriofast` (`dmrelatorioentrega.pas:167-183`). O título é “RELAÇÃO DE PRODUTOS A ENTREGAR” ou “RELAÇÃO DE PRODUTOS ENTREGUES” (`dmrelatorioentrega.pas:154-164`).

O `ReportForm` está serializado no DFM; os nomes legíveis de grupos/campos não são um contrato de layout suficientemente auditável no texto (`dmrelatorioentrega.dfm:323-790`). Classificação: `DÚVIDA`; preservar conteúdo, campos, ordenação, agrupamentos efetivamente existentes e zebração, mas não exigir reprodução pixel a pixel. Há ainda um `TfrxReport` vazio, sem datasets, variáveis ou script (`dmrelatorioentrega.dfm:797-817`), classificado como `POSSÍVEL BUG LEGADO`/artefato não utilizado.

## Atalhos, pesquisa e botões

| Atalho/ação | Evidência | Resultado confirmado |
|---|---|---|
| F7 | `fmrelatoriopadrao.dfm:22-72`; `fmrelatoriopadrao.pas:46-54` | Botão “Imprimir F7” chama `InternoImpressao`; o botão é desabilitado durante a rotina e reabilitado no `finally` (`fmrelatoriopadrao.pas:63-95`). |
| F9 | `fmnavcontroles.pas:148-164` | O formulário base chama `InternoPesquisar('')` para F9 sem modificador ou com Ctrl. A pesquisa modal é criada por `JanelaPesquisa`/`TfrmConsultaBasica` e executada com `ShowModal` (`fmnavcontroles.pas:94-133`). |
| Ctrl+F9 — clientes/fornecedores | `frselecaoaleatoriaclientes.pas:175-220`; `frselecaoaleatoriaclientes.dfm:98-110` | Procura o cliente na linha selecionada, pelo modal padrão; o hint da lupa declara Ctrl+F9. |
| Ctrl+F9 — regiões | `fmrelatorioentrega.pas:141-169`; `fmrelatorioentrega.dfm:66-79` | Abre `TfraConsultaCodigo` para regiões, com foco na coluna código. |
| F9 — código de pesquisa | `frconsultacodigo.pas:931-955` | No campo `edfCodigo`, somente Ctrl+F9 chama a pesquisa; Enter trata o retorno de pesquisa. |
| Ctrl+Del | `fmrelatorioentrega.dfm:356-365`, `489-498`; `frselecaoaleatoria.dfm:17-57`; `frselecaoaleatoria.pas:130-143`, `1153-1157` | A orientação declara Ctrl+Del para excluir; o grid permite delete e encaminha para o botão excluir. O detalhe exato do mapeamento de tecla está no componente compartilhado, não no formulário. |
| F6 | fontes Delphi inspecionadas | `NÃO LOCALIZADO`: não há `VK_F6`/F6 nessas unidades. O requisito do destino “F6 gerar” precisa ser especificado como novo contrato Laravel, sem atribuí-lo ao legado. |
| Cancelar consulta | fontes Delphi inspecionadas | `NÃO LOCALIZADO`: há cancelamento de edição de grid e `mrCancel` para modal genérico, mas não botão/controle para cancelar a execução SQL de `qryRelatorioEntrega.Open`. |

## Parâmetros, NF-e, schema e segurança

### Parâmetros do sistema

Não foi localizada chamada `parametros_valor('', '')`, nem leitura de `ParSistema`, no formulário/data module do relatório. `clparametrossistema.pas` define o carregamento geral via `ParametrosSistemasSQL`, lendo `parametrosfiliais` e `parametros` (`clparametrossistema.pas:1889-1909`), e expõe alguns parâmetros transversais potencialmente relacionados:

- `MarcarProdutosParaEntregaContrato` (`clparametrossistema.pas:2163-2167`, `4577-4585`);
- `Não imprimir data e hora nos rodapés dos relatórios` (`clparametrossistema.pas:2261-2264`, `5620-5628`);
- `CorZebradoRelatorio` (`clparametrossistema.pas:7609-7617`);
- `RelatorioSomenteFiliaisAutorizadas`, condicionado a administrador/suporte (`clparametrossistema.pas:7945-7955`).

Classificação: `NÃO LOCALIZADO` para parâmetro específico usado por esta tela; `INFERIDO` para os candidatos transversais acima. O prompt deve exigir que a implementação descubra no checkout Laravel o adaptador padrão de parâmetros e registre a chave exata, sem inventar nomes nem pedir nova inspeção Delphi.

### Chave de acesso NF-e

Não há controle, campo `chv_nfe` ou máscara de chave NF-e na interface/dataset deste relatório; a única ocorrência de campos de chave no conjunto compartilhado é genérica e não está configurada para esta tela. Classificação: `NÃO LOCALIZADO`. Se uma tela Laravel relacionada precisar dessa máscara, reutilizar a autoridade compartilhada `NfeAccessKey*`; não criar regex, cálculo de DV ou máscara local.

### Schema necessário

Não há snapshot/schema de tabelas nas fontes inspecionadas. As relações/colunas citadas pelo SQL são: `contratos`, `produtoscontratos`, `produtos`, `vfornecedores`, `bairros`, `cidades`, `dadosfiscais`, `produtosdadosfiscais`, `romaneiosnotas`, `romaneios`, `regioes`, além da função `diadasemana` (`dmrelatorioentrega.dfm:53-201`). Classificação: `NÃO LOCALIZADO` para snapshot; `OPORTUNIDADE` para manter no módulo um contrato versionado de schema derivado do checkout/migrations Laravel, com colunas, tipos, nulabilidade, chaves e cardinalidades.

O futuro prompt deve orientar confirmação contra o schema Laravel e migrations disponíveis, não contra os arquivos Delphi; não deve testar driver, não deve usar `hasTable`/`Schema::has*` em runtime, e deve falhar de forma observável se o contrato de schema não estiver presente.

## Ambiguidades e decisões que não devem ser inventadas

1. **`DÚVIDA` — validação concreta dos intervalos.** O frame possui `ValidarIntervalo`, mas a rotina local só verifica ambos vazios; a cadeia genérica de validação não está demonstrada para esses frames.
2. **`DIVERGENTE` — agrupamento.** Os checkboxes estão ocultos e não são enviados ao data module. Não prometer agrupamento legado; decidir no prompt a partir do relatório/dataset.
3. **`POSSÍVEL BUG LEGADO` — macro `CondicaoEntregue`.** É declarada e limpa, mas os dois casos observados populam `CondicaoemAberto` (`dmrelatorioentrega.pas:149-164`). Preservar o resultado observável comprovado ou abrir decisão específica; não corrigir silenciosamente.
4. **`POSSÍVEL BUG LEGADO` — `frxReport1`.** Objeto FastReport sem dataset e sem script (`dmrelatorioentrega.dfm:797-817`); não tratá-lo como segundo relatório ativo.
5. **`OPORTUNIDADE` — custo SQL.** A soma correlacionada de entregas deve ser pré-agregada ou equivalente set-based; filtros de várias chaves devem usar uma consulta com bindings e `IN`/`ANY(array)`, nunca N+1.
6. **`DÚVIDA` — `LEFT JOIN`.** Não é possível classificar a nulabilidade pelo Delphi; confirmar no schema. Relação obrigatória com chaves `NOT NULL` deve ser `INNER JOIN`; região ausente pode continuar `LEFT JOIN` se “não definida” for estado válido.
7. **`NÃO LOCALIZADO` — F6/cancelamento real.** O legado não comprova F6 nem cancelamento do `Open`; ambos são requisitos novos do destino e devem aparecer em critérios de aceite.
8. **`NÃO LOCALIZADO` — menu, acessos e autorizações.** O caminho de menu e `acessosmodulos` não estão nas fontes autorizadas; especificar pela arquitetura Laravel existente.
9. **`NÃO LOCALIZADO` — exportação/personalização do resultado.** O preview confirma imprimir/salvar/localizar, mas não confirma grid de saída com catálogo, ordenação, personalização e exportação. Esses recursos são requisitos Laravel do mapa.

## Contrato de handoff para os prompts SpecKit

Os prompts podem referenciar este arquivo como evidência legada. O implementador deve consultar somente o checkout Laravel atual para seams, catálogo de grids, modal de pesquisa, autorização/menu, parâmetros, schema e mecanismo de cancelamento. Não deve ser orientado a abrir ou inspecionar os fontes Delphi diretamente.

Requisitos de destino já explicitados pelo mapa e compatíveis com esta evidência: F6 gera o mesmo resultado em grid e relatório; Cancelar aparece assim que a consulta começa e cancela a execução no PostgreSQL; F9 usa o modal padrão; grids têm ordenação, personalização e exportação; SQL é set-based e evita N+1; `LEFT JOIN` só permanece quando a nulabilidade/semântica exigir; não testar driver nem `hasTable`; breadcrumb e command bar seguem o padrão do sistema.
