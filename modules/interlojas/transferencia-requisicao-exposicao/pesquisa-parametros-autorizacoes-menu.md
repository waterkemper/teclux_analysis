# Pesquisa: parâmetros, autorizações e menu da Transferência de Requisição para Exposição

## Escopo e conclusão

Fontes primárias inspecionadas:

- `C:\projetos.vcl\apps\interlojas\fmtransferenciarequisicaoexposicao.pas/.dfm`;
- `C:\projetos.vcl\apps\interlojas\dmtransferenciarequisicaoexposicao.pas/.dfm`;
- `C:\projetos.vcl\apps\interlojas\dmrequisicaoexposicao.pas/.dfm`, porque a Transferência reinclui saldo pendente e reaproveita a regra de duplicidade/compostos;
- `C:\projetos.vcl\biblio\clparametrossistema.pas`;
- `C:\projetos.vcl\biblio\clusuario.pas`;
- `C:\projetos.vcl\apps\tecsoft\fmtecsoft.pas/.dfm` e `C:\projetos.vcl\apps\interlojas\rginterlojas.pas`;
- fontes Laravel atuais de `ParameterService`, acesso de módulo, menu, filial e Cadastro de Requisição para Exposição.

Não há chamada textual a `parametros_valor` nas units Delphi. A tela usa propriedades tipadas de `ParSistema`; os literais persistidos são resolvidos internamente por `clparametrossistema.pas`. Também não há, nas units do fluxo, chamada a `ObterAutorizacao` nem consulta direta a `usuariosfiliais`, `usuariosacessosmodulos` ou `acessosmodulos`. Logo, estoque, reserva, lote, conferência, cancelamento e emissão são regras de domínio/estado, não grants de usuário.

## Parâmetros efetivamente alcançados

| Literal persistido | Propriedade/call site | Tipo e semântica observada | Evidência |
|---|---|---|---|
| `USAR GRADES PRODUTOS` | `ParSistema.UsarGradesProdutos` | Booleano. Mostra `valorgrade1`/`valorgrade2` na grade e participa da navegação de colunas. | Literal/getter: `clparametrossistema.pas:2075,7487-7490`; tela: `fmtransferenciarequisicaoexposicao.pas:252-253,509-515`. |
| `REQUISICAOSUBTRAIESTOQUE` | `ParSistema.RequisicaoSubtraiEstoque` | Booleano. Mostra estoque da requisitante; ao confirmar/cancelar/reabrir altera a semântica de reserva e movimentos. Na transferência, disponibilidade usa `reservapreviarequisitada` quando ligado e `estoquerequisitada` quando desligado. | Literal/getter: `clparametrossistema.pas:2004,4233-4235`; visibilidade: `fmtransferenciarequisicaoexposicao.pas:255`; disponibilidade: `dmtransferenciarequisicaoexposicao.pas:1057-1066`; cancelamento: `:748-825`. |
| `Máscara Quantidade` | `ParSistema.MascaraQuantidadeGrade` e `TamanhoMascaraQuantidade` | String de apresentação. O getter troca `,` por `.` e `.` por `,`; a largura mínima é `length(MascaraQuantidade) * 7`. Não é autoridade para validar quantidade. | Literal/getters: `clparametrossistema.pas:2132,7822-7872`; formatos: `dmtransferenciarequisicaoexposicao.pas:1012-1028`; larguras: `fmtransferenciarequisicaoexposicao.pas:259-272`. |
| `DATA CONTABIL` | `ParSistema.DataContabil`/`DataContabilString` | Data de corte. Data inicial e final precisam ser estritamente posteriores à data contábil; o final também não pode preceder a inicial. | Literal/getters: `clparametrossistema.pas:1969,2606-2609,4957-4960`; validação visual: `fmtransferenciarequisicaoexposicao.pas:625-646`. |
| `DIASNOTARETROATIVA` | `ParSistema.DiasNotaRetroativa`, indiretamente via `NDiasLimiteEmissao` | Inteiro. O limite de emissão é o menor entre dias retroativos e limite derivado da data contábil; após informar a data inicial, o limite final é recalculado. | Literal/getter: `clparametrossistema.pas:2128,7790-7793`; cálculo base: `C:\projetos.vcl\repositorio\dmbasico.pas:3522-3547,3583-3588`; tela: `fmtransferenciarequisicaoexposicao.pas:246-250,648-658`. |
| `Permitir requisições de produtos duplicadas` | `ParSistema.Permitir_Requisicoes_de_Produtos_Duplicadas` | Booleano. Quando falso, a requisição de origem consulta produto + requisitada + requisitante e impede a nova linha aberta, oferecendo alteração de quantidade; na confirmação da transferência, também habilita a checagem de divergência lote/produto lido. As duas alterações de visibilidade no form estão comentadas e não têm efeito. | Literal/getter: `clparametrossistema.pas:2305,6237-6240`; regra de origem: `dmrequisicaoexposicao.pas:312-348`; confirmação: `dmtransferenciarequisicaoexposicao.pas:3155-3213`; comentários sem efeito: `fmtransferenciarequisicaoexposicao.pas:274-275`. |
| `Transferir Produtos Compostos` | `ParSistema.Transferir_Produtos_Compostos` | Booleano. Só altera o filtro de produtos elegíveis no lookup da Requisição; composto não vira grant nem autorização adicional. | Literal/getter: `clparametrossistema.pas:2316,6369-6372`; filtros: `dmrequisicaoexposicao.pas:763-784`. |
| `Informar o motivo do cancelamento do pedido` | `ParSistema.InformarMotivoCancelamentoPedido` | Booleano. Controla se o diálogo de cancelamento/reabertura exige motivo; o texto é anexado à observação. É validação de conteúdo, não prova de autoridade. | Literal/getter: `clparametrossistema.pas:2320,6402-6405`; cancelamento/reabertura: `dmtransferenciarequisicaoexposicao.pas:769-812`; origem: `dmrequisicaoexposicao.pas:197-226`. |
| `Reincluir requisições com saldo pendente` | `ParSistema.ReincluirRequisicaoSaldoPendente` | Booleano. Após confirmar quantidade parcial, cria nova requisição aberta com `qtdepedida - qtderecebida`, preservando requisitante, requisitada, filial física de estoque, produto e código de origem. | Literal/getter: `clparametrossistema.pas:2350,6677-6680`; decisão: `dmtransferenciarequisicaoexposicao.pas:944-950`; reinclusão: `:3833-3871`. |
| `Exibir localização por código de barras nas transferências` | `ParSistema.ExibirLocalizaporCodigoBarrasnasTransferencias` | Booleano. Exibe o grupo de leitura por código de barras; Enter localiza produto/código e incrementa a quantidade recebida em uma unidade. | Literal/getter: `clparametrossistema.pas:2351,6688-6691`; visibilidade: `fmtransferenciarequisicaoexposicao.pas:283-285`; entrada: `:660-673`; localização/incremento: `dmtransferenciarequisicaoexposicao.pas:2780-2793`. |
| `Mensagem de produtos não conferidos ao emitir a NF` | `ParSistema.MensagemProdutosNaoConferidosnaNF` | Booleano. Antes da confirmação/emissão, consulta produtos marcados no lote e pode abrir a conferência; não concede autorização para confirmar. | Literal/getter: `clparametrossistema.pas:2312,6314-6317`; uso: `dmtransferenciarequisicaoexposicao.pas:3795-3831`; encadeamento da confirmação: `:896-908`. |
| `Imprimir Requisição Não Confirmada` | `ParSistema.ImprimirRequisicaoNaoConfirmada` | Booleano. No filtro do FastReport, permite linhas com `qtderecebida >= 0`; desligado restringe a `qtderecebida > 0`. É filtro de impressão. | Literal/getter: `clparametrossistema.pas:2252,5486-5489`; filtro: `dmtransferenciarequisicaoexposicao.pas:2729-2742`; relatório: `:1979-2018`. |
| `EmissorNFe` | `ParSistema.EmissorNfe` | Booleano. A emissão eletrônica só é considerada quando o parâmetro está ligado e o modelo é `55` ou `57`. | Literal/getter: `clparametrossistema.pas:2197,4905-4908`; condição: `dmtransferenciarequisicaoexposicao.pas:3019-3030`. |
| `Observação Cliente no Simples` | `ParSistema.obsnfeClientesnoSimples` | String. Se o regime tributário é Simples e o valor não está vazio, é concatenado à informação complementar da NF. | Literal/getter: `clparametrossistema.pas:2170,5341-5344`; uso: `dmtransferenciarequisicaoexposicao.pas:1513-1520`. |
| `NomeImpressoraNotaMercadorias` | `ParSistema.NomeImpressoraNotaMercadorias` | String de infraestrutura de impressão. É passado à impressão do DANFE; não é permissão de imprimir. | Propriedade/getter: `clparametrossistema.pas:1246,7654-7657`; uso: `dmtransferenciarequisicaoexposicao.pas:1679-1688,1738-1748`. |

`ctTRANSFERENCIAS = 'TRANSFERENCIAS'` existe na unit (`clparametrossistema.pas:1949`), mas não foi lido pelas quatro units do fluxo. Não deve ser convertido em parâmetro deste módulo sem novo call site comprovado.

## Tipo, ausência e escopo por filial

O carregamento legado lê `parametrosfiliais`, converte `filial NULL` para `-1` global e cria linhas globais para parâmetros sem override (`clparametrossistema.pas:1889-1909`). `TtecParametrosSistema.setFilial` propaga a filial corrente para todos os itens (`:3622-3625` e `:7320-7327`). A leitura procura primeiro a filial corrente e só cai para `-1` quando `ValorGlobal` está habilitado (`:7138-7154`). Portanto, o contrato é **filial efetiva de `ParSistema` → global**, não “requisitante → requisitada”. A tela usa `FilialBase` como contexto operacional (`fmtransferenciarequisicaoexposicao.pas:229-239`; `dmtransferenciarequisicaoexposicao.pas:1002-1007`), enquanto requisitante e requisitada são dados do pedido.

Conversões nativas importantes:

- Booleano: somente texto `true`, sem distinção de maiúsculas/minúsculas, vira verdadeiro; qualquer outro texto vira falso (`clparametrossistema.pas:7075-7087`).
- Inteiro: conversão inválida vira `0` (`:7099-7106`).
- Data: conversão inválida cai em `30/12/1899` (`:7090-7097`).

O Laravel atual usa `ParameterService::getMany` em lote por descrição/filial e o repositório PostgreSQL chama `parametros_valor`; a própria documentação do serviço registra que não há fallback posterior a `parametrosfiliais` (`laravel/backend/app/Services/Parameter/ParameterService.php:16-25,117-167,222-241`). O manifest vizinho já agrupa os literais compartilhados em uma leitura por filial (`laravel/backend/app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisParameterManifest.php:16-40,55-82`). Para esta tela, acrescentar somente os literais comprovados acima; não enviar parâmetros do browser nem usar a máscara como validação numérica. A ausência de configuração deve ser uma decisão explícita do contrato Laravel, pois reproduzir silenciosamente a data sentinela Delphi é inseguro.

## Filiais, consulta e validações da tela

- A filial requisitada inicial é `FilialBase`; a consulta principal exige `pf.requisitada = :requisitada`, e os filtros opcionais são período, requisitante, situação, curva ABC e quantidade confirmada (`fmtransferenciarequisicaoexposicao.pas:229-239,547-571`; `dmtransferenciarequisicaoexposicao.dfm:106-274`).
- O filtro de requisitante é montado como `pf.requisitante = valor` (`dmtransferenciarequisicaoexposicao.pas:2629-2634`). A situação do radio group é exatamente `A` aberta, `F` fechada, `D` e `C` cancelada (`:2636-2643`).
- A validação do form exige período válido e requisitante informado/existente (`fmtransferenciarequisicaoexposicao.pas:589-593`). Datas respeitam a data contábil e o limite retroativo (`:625-658`).
- O SQL deriva estoque e reserva da filial requisitada; para filial do tipo `V`, usa `filial_estoque` quando preenchida (`dmtransferenciarequisicaoexposicao.dfm:177-224,253-273`). A filial física do estoque da requisitante é preservada em `filial_estoque_requisitante` e usada na confirmação/reinclusão (`dmtransferenciarequisicaoexposicao.pas:944-946,3852-3853`).
- A UI habilita excluir/cancelar-reabrir, gerar, confirmar e imprimir conforme estado/seleção, mas isso é apenas UX: `fmtransferenciarequisicaoexposicao.pas:173-195`. Os atalhos observados são F6 cancelar/reabrir, F7 gerar, F8 confirmar, F11 alternar busca produto/código e F12 imprimir (`:467-503`).

Não foi localizada, no código específico, interseção explícita da lista de requisitantes com `usuariosfiliais`. Portanto, não se deve concluir que qualquer filial enviada ao filtro é autorizada; deve-se tratar essa ausência como uma lacuna a ser fechada server-side.

## Operações sensíveis e o que o legado realmente valida

| Operação | Validações/efeitos encontrados | Autoridade de usuário encontrada |
|---|---|---|
| Cancelar/reabrir F6 | Alterna situação `A`/`C`, limpa recebimento no cancelamento, anexa motivo, verifica alteração concorrente e, com reserva prévia, grava movimentos para devolver/recolocar saldo (`dmtransferenciarequisicaoexposicao.pas:748-825`). | Nenhum `ObterAutorizacao`, senha ou flag de gerente no fluxo. O parâmetro de motivo só exige texto. |
| Confirmar F8 | Só percorre itens `A`, com `qtderecebida > 0` e marcados para lote; bloqueia inconsistências de reserva/leitura, agrupa por requisitante, inclui produtos/movimentos e pode emitir NF (`dmtransferenciarequisicaoexposicao.pas:896-991`). | Nenhuma autorização operacional adicional localizada. `UsuarioLogin.CodigoUsuario` é gravado como usuário do lote/vendedor, não é um grant (`:1380-1385,2929-2941`). |
| Gerar lote / conferir | Cria lote com usuário e data do servidor, atribui-o aos itens marcados e a conferência usa operação `TRF` (`dmtransferenciarequisicaoexposicao.pas:2918-3017,3273-3330`; form: `:711-765`). | Nenhum grant específico localizado. |
| Imprimir requisições | Abre o relatório FastReport; seleção de lotes e parâmetro de não confirmada filtram as linhas (`dmtransferenciarequisicaoexposicao.pas:1979-2018,2729-2767`). | Nenhum grant específico localizado. |
| Emitir NF / DANFE | Verifica série/modelo da filial base, cria dados fiscais, usa condição `EmissorNFe`, texto do Simples e impressora configurada (`dmtransferenciarequisicaoexposicao.pas:2646-2665,3019-3030,1513-1520,1679-1748`). | Nenhuma senha ou autorização adicional localizada. Não transformar `EmissorNFe` em capability. |
| Reincluir saldo | Cria nova requisição aberta com saldo pendente e código de origem quando o parâmetro está ligado (`dmtransferenciarequisicaoexposicao.pas:944-950,3833-3871`). | É efeito automático da confirmação, não grant separado comprovado. |

As validações de estado/estoque não devem ser convertidas automaticamente em capabilities. Se o Laravel decidir granular ações como cancelar, confirmar, conferir ou emitir, isso será uma decisão nova; esta pesquisa não fornece nomes de grants.

## Menu legado e autorização

O DFM define a árvore:

`InterLojas` → `Transferência`

O pai é `mitInterLojas` (`Tag = 1`) e a folha é `mitTransferenciaRequisicaoExposicao`, caption `Transferência`, com `OnClick = ExecutarItemMenu` (`C:\projetos.vcl\apps\tecsoft\fmtecsoft.dfm:828-846`; mesma árvore na variante `fmtecsoft__.dfm:620-638`). A classe `TfrmTransferenciaRequisicaoExposicao` é registrada por `rginterlojas.pas:11-23`, portanto a folha precisa apontar para uma classe registrada para abrir.

O acesso materializado do usuário é uma lista de `nomemenu` de `acessosmodulos`, unindo concessões diretas em `usuariosacessosmodulos` e concessões via grupo em `gruposusuariosacessosmodulos` (`clusuario.pas:331-344`). A lista é copiada para `AcessosUsuarios` (`:612-623`). Ao verificar o menu, a folha precisa estar registrada e passa quando o usuário é `Suporte`, `Administrador`, possui o nome do componente na lista ou o item tem `Tag = 1` (`fmtecsoft.pas:1378-1390`). Como a folha de Transferência não tem `Tag = 1`, a evidência aponta para o nome técnico `mitTransferenciaRequisicaoExposicao`, não para o caption `Transferência`.

Não foi encontrado, nas fontes inspecionadas, um `acessosmodulos.codigo` numérico ou seed Delphi que associe inequivocamente essa folha. Não inventar código, não copiar o acesso de Requisição para Exposição e não conceder acesso em massa.

## Comparação com o padrão Laravel atual

Há implementação Laravel do Cadastro **Requisição para Exposição**, mas não foi localizada uma implementação equivalente da tela **Transferência**. O padrão existente oferece estes pontos de comparação, sem constituir autorização para a nova tela:

1. A migration do Cadastro cria folha Cloud sob `cloud.modulo.interlojas`, com rota `interlojas.requisicao-exposicao.cadastro` e label próprio (`laravel/backend/database/migrations/2026_07_29_293000_acessosmodulos_requisicao_exposicao.php:15-18,39-72`). Ela ainda replica grants do pai (`:78-105`); isso é comportamento específico dessa migration, não evidência para Transferência.
2. O serviço de acesso do Cadastro resolve a folha por rota + `teclux_cloud`, dá bypass a administrador e, para usuário comum, exige linha explícita em `usuariosacessosmodulos` (`laravel/backend/app/Services/Authorization/InterlojasRequisicaoExposicaoModuleAccessService.php:15-39`). O middleware protege o grupo de rotas, inclusive endpoints de mutação (`laravel/backend/routes/web.php:1847-1874`).
3. O serviço de filial valida `usuariosfiliais`; `RequisicaoExposicaoAuthorizationService` rejeita requisitante inválida/não autorizada e requisitada igual à requisitante (`laravel/backend/app/Services/Interlojas/RequisicaoExposicao/RequisicaoExposicaoAuthorizationService.php:13-50`). O controller deriva filial ativa da sessão e passa parâmetros/filial ao serviço, não do browser como autoridade (`.../RequisicaoExposicaoController.php:53-87,96-102`).
4. O menu Cloud atual distingue administrador de usuário comum e, para o usuário comum, filtra folhas pela relação `usuariosacessosmodulos`; pai/folha só aparecem quando a rota existe e a hierarquia é válida (`laravel/backend/app/Services/Menu/MenuService.php:10-16,82-112,150-203`).
5. O manifest Laravel vizinho já cobre os literais compartilhados `Transferir Produtos Compostos`, duplicidade, `REQUISICAOSUBTRAIESTOQUE`, motivo, grades e máscara (`laravel/backend/app/Services/Estoque/RequisicaoFiliais/RequisicaoFiliaisParameterManifest.php:16-40`). Para Transferência, o manifest futuro precisa adicionar apenas parâmetros realmente usados pelo fluxo confirmado nesta pesquisa, com leitura batched por filial.

Conclusão de segurança: a futura tela Laravel deve ter folha/menu próprio, rota canônica própria, middleware em todas as rotas e escopo server-side por filial. A lista de capabilities por ação permanece decisão de implementação; nenhum grant operacional foi comprovado pelo Delphi e nenhum deve ser inventado nesta pesquisa.

## Lacunas que permanecem abertas

- Qual registro/rota/código existente em produção representa `mitTransferenciaRequisicaoExposicao` em `acessosmodulos`; o fonte Delphi só prova o nome técnico e o mecanismo de leitura.
- Se o usuário pode selecionar qualquer requisitante ou somente as filiais de `usuariosfiliais`; o módulo legado não impõe essa interseção explicitamente.
- Se confirmação, emissão, conferência e cancelamento terão capabilities Laravel separadas ou uma capability de módulo mais estado/filial. A separação não pode ser inferida como grant legado.
- Semântica Laravel para valores ausentes/inválidos, especialmente data sentinela, máscara vazia e parâmetros que habilitam efeitos fiscais/estoque; falhar explicitamente é mais seguro que copiar defaults implícitos sem decisão.
