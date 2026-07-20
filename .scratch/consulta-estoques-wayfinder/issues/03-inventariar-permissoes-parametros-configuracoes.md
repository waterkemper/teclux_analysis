# Inventariar Permissões, Autorizações e configurações Delphi

Type: task
Status: resolved
Blocked by:

## Answer

### Resumo executivo

- `CONFIRMADO` — Dentro dos quatro artefatos centrais, a única Permissão de Usuário consultada é `UsuarioLogin.GerenteEstoque`. Ela governa a visibilidade das abas **Financeiro/Movimento**, **Fornecedores** e **Acumuladores** e torna editáveis `localizacao`, `minimo` e `maximo` nos datasets principal, Similares e Lotes (`fmconsultaestoque.pas:319-324`; `dmconsultaestoque.pas:958-960,1260-1262,2013-2015`).
- `NÃO LOCALIZADO` — Não há nesses artefatos autorização contextual, solicitação de senha, Permissão específica por botão/operação ou verificação adicional antes das escritas. A gravação do valor da última compra fica indiretamente acessível pela aba gerencial, mas não possui autorização própria no handler (`fmconsultaestoque.pas:926-957`).
- `CONFIRMADO` — A configuração funcional é determinada por Parâmetros do Sistema, `FilialBase`, regime tributário das Filiais existentes, configuração do ECF e data/hora do servidor. Esses valores alteram abas, colunas, formato, escopo das queries, preço exibido e validade de promoção.
- `RISCO DE MIGRAÇÃO` — No Delphi, a proteção de informações financeiras é predominantemente visual. Os campos sensíveis fazem parte dos datasets e a tela apenas oculta abas. No Laravel, policies/abilities e escopo de consulta devem ser aplicados no servidor, sem ampliar o acesso legado.

### Matriz de Permissões e Autorizações

| Regra | Efeito comprovado | Evidência | Classificação |
|---|---|---|---|
| `UsuarioLogin.GerenteEstoque = true` | Exibe `tstMovimento`, `tstFornecedores` e `tstAcumuladores` | `fmconsultaestoque.pas:319-324` | `CONFIRMADO` |
| `UsuarioLogin.GerenteEstoque = true` | Permite edição de `localizacao`, `maximo` e `minimo` nos datasets de Produtos, Similares e Lotes; para os demais, os persistent fields recebem `ReadOnly := true` | `dmconsultaestoque.pas:958-960,1260-1262,2013-2015` | `CONFIRMADO` |
| Permissão específica para abrir a Consulta | Existem constantes `ctConsultaEstoque = 36`, `ctConsultaEstoqueFiliais = 181` e `ctConsultaEstoqueProdutos = 182`, porém não há referência executável a elas no repositório além das declarações | `biblio/ctconstantes.pas:753,862-863`; busca global | `NÃO LOCALIZADO` |
| Acesso geral a módulos | O Usuário carrega acessos diretos e por grupo de `acessosmodulos`, `usuariosacessosmodulos` e `gruposusuariosacessosmodulos`, mas o vínculo concreto desta tela com um nome/código de módulo não foi localizado | `biblio/clusuario.pas:332-341,425-438,612-623` | `INFERIDO` |
| Restrição da Filial por Usuário | A Consulta não consulta `usuariosfiliais` nem uma ability equivalente; quando Filiais não são independentes, o seletor trabalha sobre a relação geral de Filiais | `dmconsultaestoque.dfm:17-20`; ausência nos SQLs centrais | `NÃO LOCALIZADO` |
| Autorizações contextuais por operação | Nenhuma chamada a mecanismo de autorização/senha foi encontrada nos forms/data modules centrais | busca por autorização, permissão, senha e acesso | `NÃO LOCALIZADO` |

`GerenteEstoque` é propriedade booleana carregada do campo `usuarios.gerenteestoque`: declaração/getter em `biblio/clusuario.pas:40,109,193,541-544`, coluna incluída no SQL em `:312` e carregamento em `:652`. Não é uma Autorização transitória; é atributo persistente do Usuário.

### Parâmetros do Sistema e efeitos

| Parâmetro/condição | Efeito na Consulta | Evidência | Classificação |
|---|---|---|---|
| `PrecosporCargo` | Alterna exclusivamente entre **Preços Cargos** e **Preços** e escolhe a query correspondente ao navegar por Produtos/Similares/Lotes/Componentes | `fmconsultaestoque.pas:321-322`; `dmconsultaestoque.pas:1022-1034,1085-1097,1136-1141,1181-1188` | `CONFIRMADO` |
| `PrecoParaCliente` | Exibe **Preços por Cliente** | `fmconsultaestoque.pas:323` | `CONFIRMADO` |
| `FiliaisIndependentes` | Oculta seletor de Filial e colunas `filial`; força Produtos, Similares e Componentes para `FilialBase`; para pedidos, usa total entre Filiais | `fmconsultaestoque.pas:326-332`; `dmconsultaestoque.pas:853-873,1014-1018,1077-1081,1129-1134,1175-1180` | `CONFIRMADO` |
| `UsarGradesProdutos` | Exibe aba de Grade e colunas `valorgrade1/2`; quando falso, aumenta fonte. Participa da disponibilidade da grade detalhada | `fmconsultaestoque.pas:337-349`; `dmconsultaestoque.pas:1560-1563` | `CONFIRMADO` |
| `LiberarVisualizacaodeModelosProdutos` | No frame compartilhado, exibe **Modelos** e **Especificações de modelos** apenas para `TfrmConsultaEstoque` | `repositorio/frmultiplaselecaoaleatoria.pas:91-100` | `CONFIRMADO` |
| `LiberarVisualizacaoPesoProdutonasPesquisas` | Controla visibilidade de `peso` nos datasets principal, Similares, Componentes e Lotes | `dmconsultaestoque.pas:1647-1667,1981-1986` | `CONFIRMADO` |
| `SoVisualizarEstoqueDeposito` | Na Grade detalhada, restringe o saldo às Filiais `tipofilial = 'D'`; não aparece na consulta mestre | `dmconsultaestoque.pas:1755-1780` | `CONFIRMADO` |
| `MascaraQuantidadeGrade` | Define `DisplayFormat` de saldos, limites, pedidos, acumulados e licitações | `dmconsultaestoque.pas:779-803` | `CONFIRMADO` |
| `TamanhoMascaraQuantidade` | Aumenta larguras de colunas de quantidade | `fmconsultaestoque.pas:350-360` | `CONFIRMADO` |
| `CorZebradoRelatorio` | Define cor das bandas da grade detalhada e licitações | `fmconsultaestoque.pas:375-377` | `CONFIRMADO` |

As propriedades estão em `biblio/clparametrossistema.pas:1270-1271,1367,1427-1431,1450,1554,1565`. Há evidência de administração em `apps/adminsistema/fmparametrossistema.dfm:1880,1946,1954,3019,3324,3355` e persistência em `fmparametrossistema_.pas:1148,1178-1179,1185,1533,1568-1570,1678-1679`.

### Configuração de Filial e ambiente

- `CONFIRMADO` — `FilialBase` é default de escopo e parâmetro de preço por cargo, valor da última compra e cálculos. Com Filiais independentes, substitui qualquer Filial informada (`dmconsultaestoque.pas:715,806,853-873,953,1025-1027,1064,1088,1101,1137,1145,1182-1184,1193-1194`).
- `CONFIRMADO` — Existir ao menos uma Filial com regime tributário `1/4` expõe CSOSN; com regime `2/3`, expõe CST. A condição é global, não limitada à Filial selecionada (`repositorio/ctcontantesdmbasico.pas:1694-1695`; `fmconsultaestoque.pas:362-363`).
- `CONFIRMADO` — `Assigned(EcfPadrao) and EcfPadrao.Arredonda` alimenta `arredondamento` das consultas principal e Lotes, alterando cálculo monetário (`dmconsultaestoque.pas:715-716,1975-1977`).
- `CONFIRMADO` — `DataServidor` limpa promoção vencida; `DataHoraServidor` registra horário estatístico/auditoria. O Laravel deve usar relógio do servidor/banco, não do navegador (`dmconsultaestoque.pas:922-926,1244-1248` e ticket 02).
- `CONFIRMADO` — Na Grade detalhada, `tipofilial = 'D'` é configuração funcional quando somente depósitos devem compor o saldo (`dmconsultaestoque.pas:1755-1780`).

### Operações governadas e lacunas

- **Consultar, navegar, imprimir e integrações:** `NÃO LOCALIZADO` controle específico dentro da tela; quem abre executa conforme dados/abas disponíveis.
- **Alterar localização/mínimo/máximo:** condicionado a `GerenteEstoque` por `ReadOnly`. O SQL de update do ticket 02 não persiste `localizacao`, embora o campo seja liberado: `POSSÍVEL BUG LEGADO` até teste em execução.
- **Alterar valor da última compra:** o controle fica em Movimento, visível só para gerente, mas não existe segundo gate no método: no Laravel requer ability server-side.
- **Financeiro, fornecedores e acumuladores:** a UI oculta abas para não gerentes, mas não filtra colunas no dataset. O contrato Laravel não deve entregar esses campos sem Permissão.
- **Filiais consultáveis:** não foi localizado escopo por Usuário. A futura especificação deve confrontar isso com autorização/tenancy já existente no Laravel, sem criar novo acesso irrestrito.

### Preferências persistidas e estado

- `NÃO LOCALIZADO` — Não há persistência explícita de filtros, Filial, aba ou Produto. O construtor redefine páginas iniciais (`fmconsultaestoque.pas:317-318`) e visibilidades a cada abertura.
- `INFERIDO` — Componentes/ancestrais podem ter infraestrutura genérica de layout, mas não há chamada específica suficiente para declarar persistência de colunas como requisito.
- `CONFIRMADO` — Filial, flags, seleção múltipla, página ativa e índice são estado da instância, não preferência persistida.

### Requisitos para o `$to-spec`

1. Separar acesso à funcionalidade, visualização sensível e autorização de escrita em policies/abilities server-side.
2. Mapear `GerenteEstoque` para a capacidade Laravel existente mais próxima; ocultar abas não basta.
3. Ler os Parâmetros do Sistema no backend e expor ao frontend apenas configuração necessária à renderização.
4. Aplicar `FilialBase`, independência e eventual escopo Laravel antes da consulta; documentar divergências do acesso legado.
5. Tratar CST/CSOSN, arredondamento, validade promocional, tipo de Filial e relógio do servidor como condições explícitas.
6. Não exigir persistência de filtros/layout por paridade sem nova evidência; se o Laravel já a oferecer, registrar como melhoria.

## Question

Quais Permissões, Autorizações, Parâmetros do Sistema, configurações de Filial, preferências persistidas e condições de ambiente governam o acesso à Consulta de Estoques, a visibilidade das abas e controles, os dados consultáveis e cada operação disponível?
