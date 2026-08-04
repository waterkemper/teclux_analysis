# Pesquisa: parâmetros, autorizações e menu da Confirmação por Romaneios

## Escopo e fontes

Este inventário cobre somente parâmetros efetivamente lidos, autorização do usuário, escopo de Filial, capacidades derivadas e acesso/menu. As fontes primárias foram:

- `C:\projetos.vcl\apps\interlojas\dmconfirmarromaneiostransferencia.pas/.dfm`;
- `C:\projetos.vcl\apps\interlojas\fmconfirmarromaneiostransferencia.pas/.dfm`;
- `C:\projetos.vcl\biblio\clparametrossistema.pas`;
- `C:\projetos.vcl\biblio\clusuario.pas`;
- `C:\projetos.vcl\apps\tecsoft\fmtecsoft.pas/.dfm` e `C:\projetos.vcl\apps\interlojas\rginterlojas.pas`;
- contratos e código Laravel já existentes para `ParameterService`, menu Cloud e acesso por `usuariosacessosmodulos`.

Não há chamada textual direta a `parametros_valor('', '')` nas quatro units do módulo. O Delphi usa propriedades de `ParSistema`; a tradução Laravel deve resolver os literais persistidos por `ParameterService::getMany`, não inventar nomes Pascal nem consultas por item.

## Parâmetros efetivos

| Literal persistido | Propriedade/call site | Tipo e fallback legado | Filial e efeito | Contrato Laravel/prompt |
|---|---|---|---|---|
| `USAR GRADES PRODUTOS` | `ParSistema.UsarGradesProdutos` | Booleano textual: somente `true` (case-insensitive) vira verdadeiro; ausente/inválido vira `false` (`clparametrossistema.pas:2075,7075-7087,7487-7489`). | Efetivo para a Filial ativa; controla visibilidade das duas colunas de grade no grid de Produtos (`fmconfirmarromaneiostransferencia.pas:127-128`). | Incluir no manifest batched. Expor somente capacidade/metadata de colunas; não aceitar a decisão do browser. |
| `Máscara Quantidade` | `ParSistema.MascaraQuantidade`, derivada `MascaraQuantidadeGrade` | String; ausente resulta em vazio (`clparametrossistema.pas:2132,7138-7153,7822-7865`). A derivada troca `,` por `.` e `.` por `,`; não há validação ativa no setter (`:7827-7845`). | Efetivo para a Filial ativa; determina formato das quantidades e largura mínima da coluna (`fmconfirmarromaneiostransferencia.pas:130-132`; `dmconfirmarromaneiostransferencia.pas:962-976`). | Reutilizar o formatador compartilhado de quantidades do Laravel. Nunca montar SQL ou validação de quantidade a partir da máscara; ela é apresentação. |
| `DATA CONTABIL` | `ParSistema.DataContabil`/`DataContabilString` | Data; `AsDatetime` tenta converter e, em erro, cai em `30/12/1899`; a string sem valor permanece vazia (`clparametrossistema.pas:1969,2606-2608,4957-4964,7090-7097`). | Efetivo para a Filial ativa; a tela rejeita data inicial/final menor ou igual à data contábil (`fmconfirmarromaneiostransferencia.pas:187-205`). | Resolver no manifest. Fazer validação server-side com erro de configuração explícito para valor inválido; não reproduzir silenciosamente a data sentinela Delphi. |
| `DIASNOTARETROATIVA` | `ParSistema.DiasNotaRetroativa`, usado por `TdtmBasico.NDiasLimiteEmissao` | Inteiro; conversão inválida vira `0` (`clparametrossistema.pas:2128,7099-7105,7790-7792`). `NDiasLimiteEmissao = min(DiasNotaRetroativa, NDiasLimiteLancto)`; com `DataContabilString` preenchida, `NDiasLimiteLancto` deriva da distância entre data local e contábil, senão usa o próprio parâmetro (`dmbasico.pas:3522-3527,3535-3547,3583-3588`). | Efetivo para a Filial ativa; define o limite retroativo inicial/final e o novo mínimo após sair da data inicial (`fmconfirmarromaneiostransferencia.pas:134-137,179-185,281-287`). | Resolver junto no mesmo manifest; normalizar como inteiro não negativo e rejeitar configuração impossível de forma explícita. O request não pode enviar o limite final como autoridade. |
| `Evento Pagto Duplicata Transferência entre empresa` | `ParSistema.EventoPagtoDuplTransferenciaentreEmpresa` | Getter declarado `variant`, mas retorna `AsString`; ausente resulta em string vazia (`clparametrossistema.pas:2230,5912-5915`). O módulo atribui o valor ao campo inteiro `documentospag.evento` sem guarda local (`dmconfirmarromaneiostransferencia.pas:1000`). | Efetivo para a Filial ativa; usado somente no ramo financeiro da confirmação de nota de transferência (`dmconfirmarromaneiostransferencia.pas:979-1005`). | Resolver em lote. Validar como código de evento inteiro positivo quando o ramo financeiro for executado; falhar por configuração ausente/inválida, sem converter silenciosamente para `0`. |

### Precedência por Filial

O carregamento do sistema representa `filial` nula como `-1` global (`clparametrossistema.pas:1888-1909`). Depois de definir a Filial, `ParSistema` propaga-a aos itens (`:7314-7326`) e a leitura de string procura primeiro a linha específica e depois a linha global quando `ValorGlobal` está ativo (`:7138-7153`). A inicialização do módulo/base ativa exatamente essa política (`dmbasico.pas:3445-3448`).

O equivalente Laravel é uma única chamada conceitual:

```php
$values = $parameterService->getMany([
    'USAR GRADES PRODUTOS',
    'Máscara Quantidade',
    'DATA CONTABIL',
    'DIASNOTARETROATIVA',
    'Evento Pagto Duplicata Transferência entre empresa',
], $filialAtiva);
```

`ParameterService::getMany` já consolida os nomes, usa a resolução batched por `parametros_valor` no PostgreSQL e mantém memória por request (`laravel/backend/app/Services/Parameter/ParameterService.php:13-25,133-174,222-249`). O manifest deve ser criado uma vez por request/caso de uso; não chamar `get` dentro de cada linha do grid.

## Filial e escopo de dados

- A tela exibe a Filial requisitante a partir de `FilialBase` e passa esse valor como parâmetro `cliente` da consulta principal (`fmconfirmarromaneiostransferencia.pas:120-125`; `dmconfirmarromaneiostransferencia.pas:539-548`). A consulta também localiza romaneio de passagem pelo mesmo `FilialBase` (`:1096-1103`).
- Portanto, a Filial ativa é a requisitante/destino da confirmação. A `filialemissao` da nota pode ser outra Filial; não limitar a consulta apenas à Filial emissora.
- O código compartilhado valida na inicialização que o usuário é administrador/suporte ou pertence à Filial base (`dmbasico.pas:3435-3444`). O módulo não faz uma consulta própria a `usuariosfiliais`; no Laravel, essa proteção deve ser explícita e server-side via `BranchContextService` + `UserBranchAccessService`, rejeitando Filial ativa ausente ou não autorizada.
- Não aceitar `filial`, `cliente`, `FilialBase`, valor de parâmetro ou lista de Filiais enviados pelo browser como autoridade. Derivar a Filial da sessão e reler/revalidar todos os documentos selecionados no comando.

## Autorização operacional

### Regra observada

O botão `Confirmar F5` é habilitado apenas quando há registros marcados (`fmconfirmarromaneiostransferencia.pas:99-106`; botão no DFM:74-80). A seleção só é aceita para romaneio que não seja de passagem e cuja situação de entrada seja exatamente `CONFIRMADA` (`dmconfirmarromaneiostransferencia.pas:904-920`). Isso é uma pré-condição de domínio, não uma autorização de usuário.

No clique de confirmação:

1. O Delphi carrega o usuário corrente e consulta `TransferenciaPorItem`.
2. Se o usuário corrente **não** tiver essa flag, chama `ObterAutorizacao(taSENHA)`.
3. Se tiver a flag, chama `ObterAutorizacao(taLOGIN, ctAUTORIZACAOTRANSFERENCIA, ctAUTORIZADO)`, com motivo literal `Para Confirmar a Transferência` e responsável textual ` usuário autorizado`.
4. Só confirma se o usuário retornado existir e também **não** tiver `TransferenciaPorItem`; caso contrário mostra “Sem autorização para confirmar a transferência...” (`fmconfirmarromaneiostransferencia.pas:232-250`; `clusuario.pas:275,602-605,658-661`; `ctconstantes.pas:1483-1485,1693,2032`).

`ObterAutorizacao` abre o mecanismo compartilhado de senha/login, conecta com as credenciais informadas e materializa o usuário autorizado; o módulo não consulta uma senha própria nem testa `administrador`, `suporte` ou `gerenteestoque` nesse ponto (`dmbasico.pas:1484-1528`; `dmsenhaautorizacao.pas:63-103`). A flag `TransferenciaPorItem` deve ser tratada como bloqueio da confirmação integral neste fluxo, não como grant a ser promovido para capability Laravel.

### Mapeamento de capabilities

| Capability proposta | Requisitos mínimos | Evidência/limite |
|---|---|---|
| `interlojas.confirmacao_romaneios.view` | Acesso à folha Cloud + Filial ativa autorizada | Folha de menu não substitui autorização backend. |
| `interlojas.confirmacao_romaneios.query` | `view` + parâmetros resolvidos para a Filial ativa | F6 aplica período e consulta com `cliente = FilialBase` (`dmconfirmarromaneiostransferencia.pas:868-883,539-548`). |
| `interlojas.confirmacao_romaneios.select` | `query` + documento não ser passagem + situação de entrada `CONFIRMADA` | Regra exata de `SelecionarRegistros` (`dmconfirmarromaneiostransferencia.pas:904-920`). |
| `interlojas.confirmacao_romaneios.confirm` | `select` + prova sensível contextual equivalente a `taSENHA`/`taLOGIN` + revalidação de estado/Filial | Não confiar em `autorizador_id`, `TransferenciaPorItem` ou IDs selecionados enviados pelo cliente. O comando deve reler e bloquear os documentos dentro da transação. |
| `interlojas.confirmacao_romaneios.conferir_produtos` | `view` + documento selecionado | Chama o componente compartilhado com operação `NST` (`fmconfirmarromaneiostransferencia.pas:289-306`). |
| `interlojas.confirmacao_romaneios.conferir_volumes` | `view` + romaneios selecionados; operação `ROP` para passagem e `ROE` para os demais | A escolha é derivada do tipo do romaneio, não de input livre (`fmconfirmarromaneiostransferencia.pas:361-405`). |
| `interlojas.confirmacao_romaneios.view_conference` | `view` + documento/romaneio no escopo | A abertura do visualizador não tem desafio adicional no Delphi (`fmconfirmarromaneiostransferencia.pas:411-418`). |

O comando de confirmação deve manter operador da sessão e autorizador em auditoria separada, sem armazenar senha. Deve também ser atômico e set-based; o legado percorre cada selecionado e executa várias consultas por documento (`dmconfirmarromaneiostransferencia.pas:460-534`). Essa observação pertence ao desenho transacional/SQL, mas é necessária para não transformar a capability em uma porta para N+1.

## Menu Delphi e catálogo de acessos

O menu legado é:

`InterLojas` → `Confirmação por Romaneios`

O pai e a folha estão no DFM (`fmtecsoft.dfm:828-864`), com componente `mitConfirmarromaneiosTransferencia`, caption `Confirmação por Romaneios` e despacho comum `ExecutarItemMenu`. A classe `TfrmConfirmarRomaneiosTransferencia` é registrada em `rginterlojas.pas:12-23`.

O mecanismo de autorização Delphi carrega `acessosmodulos.nomemenu`, combinando concessões diretas de `usuariosacessosmodulos` e de grupos (`clusuario.pas:332-344,425-438`), materializa os nomes em `AcessosUsuarios` (`:612-623`) e o menu exige formulário registrado mais bypass de `UsuarioLogin.Suporte`/`Administrador` ou presença do nome do item (`fmtecsoft.pas:1360-1382`).

Não foi encontrado no código-fonte um `acessosmodulos.codigo` numérico confiável para `mitConfirmarromaneiosTransferencia`. Não inventar código, reaproveitar o código de Confirmação por Notas ou copiar grants legados.

### Comportamento exigido no Laravel

1. Criar migration idempotente para uma folha própria `Confirmação por Romaneios`, marcada `teclux_cloud = true`, sob o pai Cloud `cloud.modulo.interlojas`, com rota canônica própria (por exemplo, `interlojas.confirmacao-por-romaneios.index`). O padrão de folha sem replicação de grants está em `laravel/backend/database/migrations/2026_07_31_302000_acessosmodulos_confirmacao_por_notas.php:14-75`.
2. Resolver o `codigo` pela rota + `teclux_cloud`, nunca por número presumido. Usuário comum precisa de uma linha explícita `usuariosacessosmodulos(usuario, acesso)`; a migration não deve conceder acesso em massa.
3. Criar `InterlojasConfirmacaoPorRomaneiosModuleAccessService` e middleware próprio protegendo todas as rotas, inclusive endpoints de consulta, cancelamento, exportação e operação. O padrão atual resolve a folha por rota e consulta a relação do usuário (`laravel/backend/app/Services/Authorization/InterlojasConsultaTransferenciasModuleAccessService.php:15-39`; middleware: `.../EnsureInterlojasConsultaTransferenciasModuleAccess.php:18-32`).
4. O contrato Cloud vigente dá bypass a `usuarios.administrador` e, para não administrador, exige `usuariosacessosmodulos`; isso é confirmado pelo `MenuService` (`laravel/backend/app/Services/Menu/MenuService.php:10-16,30-39,100-112`) e pela spec de menus (`laravel/specs/002-teclux-cloud-menus-access/spec.md:104-116`). O Delphi também dá bypass a `suporte`; preservar esse bypass no Cloud exige decisão explícita de compatibilidade, pois o serviço Cloud existente não o implementa.
5. O breadcrumb deve seguir o pai `Interlojas` e a folha `Confirmação por Romaneios`, derivado da mesma rota/catálogo. Ocultar a folha sem grant não substitui o middleware/Policy.

## Lacunas e decisões que não devem ser inferidas

- Não foi localizado `F9` no form: os atalhos efetivos são `F6` para gerar, `F5` para confirmar e `Ctrl+Space` para marcar (`fmconfirmarromaneiostransferencia.pas:210-229`). Se a especificação Laravel criar lookup novo, usar o modal F9 compartilhado do sistema; isso não é evidência de uma autorização Delphi adicional.
- Não foi localizado filtro de Filial livre na tela nem uma capability separada para Filial emissora. O escopo é a Filial base/requisitante, enquanto emissoras são dados das notas.
- Não foi localizado grant por grupo no contrato Cloud desta folha; a fonte atual de menu Cloud é `usuariosacessosmodulos`. Se grupos forem suportados pelo Laravel, precisam de regra própria e não podem ser presumidos a partir do SQL Delphi de grupos.
- A escolha do bypass `suporte`, a persistência do autorizador e a lista final de capabilities sensíveis devem ser resolvidas nos tickets de segurança/transação. Este artefato registra a evidência e o limite, mas não resolve essas decisões.

## Resumo para o prompt SpecKit

O módulo depende de cinco literais (`USAR GRADES PRODUTOS`, `Máscara Quantidade`, `DATA CONTABIL`, `DIASNOTARETROATIVA` e `Evento Pagto Duplicata Transferência entre empresa`), todos resolvidos por Filial com fallback global legado. A confirmação exige que o operador/autorizador autenticado não tenha `TransferenciaPorItem`, além das pré-condições de romaneio não passagem e entrada `CONFIRMADA`. O Laravel deve criar uma folha Cloud própria sob `Interlojas`, sem grants automáticos, proteger a árvore completa por acesso + Filial, usar autorização sensível compartilhada, manter auditoria sem senha e recalcular tudo no backend.
