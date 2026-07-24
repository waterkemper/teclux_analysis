# Mapear Parâmetros do Sistema e Autorizações envolvidos no Cadastro de Pedidos

Type: grilling
Status: resolved
Blocked by:

## Question

Quais Parâmetros do Sistema (`ParSistema.*`) e autorizações/permissões sensíveis estão embutidos no Cadastro de Pedidos de Compra (cabeçalho, itens, motor de custo/impostos, grade, documentos a pagar)? Seguir o mesmo padrão do ticket 02 do mapa de Consulta de Compras — identificar cada parâmetro, seu efeito, e se é Parâmetro do Sistema (server-side, `specs/054-configuration-center`) ou preferência local.

## Answer

### Autorizações sensíveis (CONFIRMADO)

Nenhuma checagem de autorização/permissão específica de tela foi encontrada (`grep` por `Autoriza*`, `acessosmodulos`, `NivelAcesso`, `PermissaoUsuario` nos 4 arquivos-núcleo+satélites não retornou nada) — mesmo padrão já confirmado em Consulta de Compras: só a infraestrutura padrão de `acessosmodulos` (fora de escopo detalhar aqui).

### 16 Parâmetros do Sistema confirmados (CONFIRMADO, por evidência de uso)

| Parâmetro | Efeito | Evidência |
|---|---|---|
| `GerarPrecoAutomatico` | Flag mestre: se falso, o preço de venda não é recalculado automaticamente ao editar/incluir item | `dmcadastropedidos.pas:3357,3453` |
| `LocalCalculoPreco` (enum `lcpPEDIDO`/`lcpNOTAENTRADA`/`lcpAMBOS`, `clparametrossistema.pas:27`) | Define **onde** o cálculo de preço de venda roda: só no Pedido, só na Nota de Entrada, ou em ambos — **mesmo parâmetro usado por `dmCalcularCusto.pas` (motor de custo compartilhado) e por `dmcadastronotasfiscais.pas` (Notas Fiscais, 20.610 linhas)** | `dmcadastropedidos.pas:3361`; `dmCalcularCusto.pas:746,763`; `dmcadastronotasfiscais.pas:14248` |
| `RetirarPISCONFINSCalPreco` | Se PIS/COFINS entram ou não na fórmula de formação de preço de venda | `dmcadastropedidos.pas:3383,3408,3420,3428,3436` |
| `SugestaoPeloPrecoVenda` | Inverte a direção da fórmula: preço de venda alvo → custo derivado, em vez de custo → markup → preço de venda | `dmcadastropedidos.pas:3404-3438` |
| `MultiploPreco` | Arredonda o preço de venda calculado para um múltiplo configurado (ex.: terminar em ,90) | `dmcadastropedidos.pas:3349-3350` |
| `NaoAtualizarPrecoMenorQueAtual` | Trava: não deixa o preço atribuído ficar menor que o preço atual já cadastrado do produto | `dmcadastropedidos.pas:5194-5196` |
| `PrecoUnitarioCasasDecimais` | Casas decimais usadas no arredondamento de preço unitário/total em Previsões e no cálculo de item | `dmcadastropedidos.pas:1462,1687,2643,3225-3227` |
| `UsarGradesProdutos` | Habilita/desabilita o recurso de grade (matriz linha/coluna) inteiro | `dmcadastropedidos.pas:3498-3499,3712`; `fmcadastropedidos.pas` |
| `MascaraQuantidadeGrade` | Máscara de exibição (não de cálculo) da coluna quantidade nas grades de item/similares | `dmcadastropedidos.pas:1513-1518` |
| `TamanhoMascaraQuantidade` | Tamanho da máscara de quantidade na UI do formulário principal | `fmcadastropedidos.pas` |
| `ImportacaoProdContratosePedidos` (enum `TtecImportacaoProdContratosePedidos`, valor `ipcpNENHUMA` = nenhuma) | Controla se o botão de Importação Daico aparece, e presumivelmente a origem/formato esperado | `fmcadastropedidos.pas:378` |
| `PermitirProdutoAlfanumerico` | Se o código de produto buscado pode ser alfanumérico (validação de busca) | `fmcadastroprodutospedidos_.pas:626` |
| `ObservacaoRodapePedidos` | Texto fixo de rodapé no relatório impresso e na exportação Excel do pedido | `dmcadastropedidos.pas:1255,4355,4671` |
| `DiretorioImagens` / `EnderecoLogotipo` / `SiteEmpresa` | Dados cosméticos de cabeçalho/rodapé do relatório e da exportação Excel (logo, endereço, site) | `dmcadastropedidos.pas:4673` (+ uso implícito em `frVariables`) |
| `UsaitecLUX` | **Código morto** — bloco inteiro comentado (`{...}`), não executa hoje; não replicar | `fmcadastropedidos.pas:644-648` |

### Achado central para o motor de impostos/preço (relevante aos tickets 06-08)

`ParSistema.LocalCalculoPreco` é o parâmetro que **já confirma no próprio Delphi** que o motor de formação de preço/custo (`dmCalcularCusto.pas`, 1.020 linhas) é compartilhado entre Cadastro de Pedidos, Nota de Entrada (`dmcadastronotasfiscais.pas`, 20.610 linhas — o módulo de Notas Fiscais já existe no legado) e presumivelmente outros pontos. Isso confirma e reforça a decisão do usuário de especificar o motor de custo/impostos como peça própria e reaproveitável: no Delphi ele **já é** uma peça só, referenciada em 3 lugares.

### Adendo (achado durante o ticket 06, em `dmCalcularCusto.pas`) — 3 parâmetros adicionais

| Parâmetro | Efeito | Evidência |
|---|---|---|
| `RegimeTributarioparaCalculodoCusto` | Inteiro; `4` = usar o regime tributário real da filial/documento; qualquer outro valor = força um regime tributário fixo só para fins de cálculo de custo, independente do regime real | `dmCalcularCusto.pas:430,441,568-571` |
| `NaorateardescontoparacalculodeprecodevendanaNFE` | Se true, a base de custo-para-venda ignora (soma de volta) o desconto do item | `dmCalcularCusto.pas:461-466` |
| `Nao_somar_PISCONFINS_no_calculo_do_preco_de_venda` | Zera as alíquotas de PIS/COFINS especificamente na fórmula de preço de venda (distinto de `RetirarPISCONFINSCalPreco`, que afeta o cálculo de custo) | `dmCalcularCusto.pas:654-663` |

### Decisão

Os 16 parâmetros originais + os 3 do adendo (19 no total) entram no manifesto de Parâmetros do Sistema desta fatia. `UsaitecLUX` é descartado (código morto). `LocalCalculoPreco` deve ser tratado com atenção especial nos tickets 06 e 07 — é a evidência mais forte já encontrada de que o motor de custo/impostos precisa ser desenhado para servir tanto Pedidos quanto (futuramente) Notas Fiscais de Entrada.
