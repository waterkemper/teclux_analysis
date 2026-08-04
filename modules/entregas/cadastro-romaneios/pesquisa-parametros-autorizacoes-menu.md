# Pesquisa — parâmetros, autorizações e menu do Cadastro de Romaneios

## Parâmetros efetivamente alcançados

Não há chamada textual direta a `parametros_valor` nas units do Romaneio. O módulo lê propriedades de `ParSistema`, carregadas de `parametros` + `parametrosfiliais` por `TtecParametrosSistema.Ler` (`delphi/biblio/clparametrossistema.pas:1888-1910,3157-3194`). A precedência do objeto é valor da Filial corrente e, quando `ValorGlobal` está ativo, fallback para a linha global (`:7110-7153`).

| Descrição persistida exata | Tipo | Uso confirmado | Evidência |
|---|---|---|---|
| `Incluir documento a pagar no romaneio` | booleano; Delphi considera verdadeiro somente texto `true`, sem distinguir caixa | Ao gravar/excluir, habilita manutenção de `documentospag` e `duplicatas`; falso deixa o fluxo financeiro fora do Romaneio | `clparametrossistema.pas:2357,6754-6762`; `dmcadastroromaneios.pas:868-896` |
| `Evento para pagamento de romaneio` | código textual de evento | Preenche `documentospag.evento` quando o documento financeiro é criado/atualizado | `clparametrossistema.pas:2306,6248-6256`; `delphi/apps/contaspagar/dmcontaspagar.pas:5550` |

**CONFIRMADO NO POSTGRESQL, 2026-08-01, consulta READ ONLY** — os dois parâmetros existem. O evento (código 403) possui linha global e overrides nas Filiais 1, 3, 7, 8, 10, 11, 13, 14, 16, 17 e 24. O habilitador financeiro (código 467) possui linha global e overrides nas Filiais 1, 3, 8, 10, 11, 14, 16, 17 e 24. Os valores não foram copiados para este artefato.

### Contrato Laravel

Criar `CadastroRomaneiosParameterManifest` com as duas descrições literais acima. Resolver ambas em uma chamada `ParameterService::getMany(..., $filialAtiva)`; o serviço já usa um único `SELECT ... VALUES` com `parametros_valor` no PostgreSQL e memória por request (`laravel/backend/app/Services/Parameter/ParameterService.php:13-25,113-174`). Normalizar o booleano com a autoridade compartilhada para valores legados e validar o evento como inteiro positivo quando o financeiro estiver ativo.

O browser pode receber apenas capacidades derivadas. Toda gravação deve reler o manifest no backend para a Filial efetiva; não confiar em valor enviado pela UI, não consultar por item e não criar alias baseado no nome Pascal.

## Autorizações Delphi

| Operação | Quando | Regra realmente executada |
|---|---|---|
| Confirmar hora/justificativa/motivo de recebimento | qualquer alteração nesses campos ao salvar | Desafio `taLOGIN`, motivo “CONFIRMAÇÃO DA HORA DA ENTREGA”, responsável textual `ctAUTORIZADO`; qualquer login PostgreSQL válido aceito pelo diálogo é suficiente. O código/nome do autorizador e hora do servidor são gravados no item |
| Liberar entrega | Romaneio Normal em `CONFIRMADA` | Desafio `taLOGIN` “LIBERAR ENTREGA”; não há teste de perfil após autenticar. Grava autorizador como `usuariotransito` e timestamp do servidor |
| Reter entrega | Romaneio Normal em `EM TRÂNSITO` | Desafio `taLOGIN` “RETER ENTREGA”; não há teste de perfil após autenticar. Limpa usuário/timestamp de trânsito |
| Cancelar pagamento | botão legado | Usuário da sessão com `gerenteestoque=true` passa diretamente; caso contrário, o login desafiado também precisa ter `gerenteestoque=true` |

Evidências: `dmcadastroromaneios.pas:778-842`; `fmcadastroromaneios.pas:454-490,665-689,782-806`. `ObterAutorizacao` apenas autentica uma conexão PostgreSQL e retorna o usuário; os textos “usuário autorizado” e “responsável” são mensagem, não perfil (`delphi/repositorio/dmbasico.pas:1489-1522`; `dmsenhaautorizacao.pas:44-104`). Assim, não se deve inferir uma flag de perfil para as três primeiras operações.

**POSSÍVEL BUG LEGADO / risco** — `CancelarPagamentoRomaneios` aparenta editar campos calculados do dataset, e seu efeito persistente é duvidoso. A autorização foi inventariada, mas a operação não deve entrar no Laravel até o ticket transacional decidir sua semântica.

### Contrato Laravel

Usar o mecanismo compartilhado `SensitiveOperationAuthService`/`SensitiveOperationProofService`, nunca senha própria do módulo. Registrar quatro ações distintas, vinculando prova de uso único a módulo, ação, Filial, Romaneio, revisão esperada e contexto; consumir atomicamente no comando e auditar operador da sessão e autorizador separadamente.

- `confirmar_recebimento`, `liberar_entrega` e `reter_entrega`: preservar a evidência de “credencial válida”, sem inventar `gerenteestoque`; a decisão de endurecer isso deve ser explícita no ticket de segurança.
- `cancelar_pagamento`: exigir coluna legada `gerenteestoque`; administrador só deve ser bypass se o catálogo compartilhado o definir conscientemente.
- Persistir o autorizador nos campos legados quando existe coluna própria. Para retenção, que limpa `usuariotransito`, preservar ator/autorizador no log imutável de operação sensível.
- Revalidar no comando a situação, a revisão e o acesso à Filial depois da emissão da prova, evitando autorização obsoleta ou TOCTOU.

O catálogo compartilhado suporta perfil legado, modal, reutilização contextual, persistência do autorizador, expiração e prova `issued → reserved → consumed` (`SensitiveOperationDefinition.php`; `SensitiveOperationProofService.php`). As novas ações precisam de entradas próprias; nenhuma das quatro foi localizada no catálogo atual.

## Escopo de Filial

**CONFIRMADO** — os parâmetros variam por Filial e devem ser resolvidos para a Filial ativa/efetiva. **NÃO LOCALIZADO NO DELPHI DO MÓDULO** — filtro ou guard por `usuariosfiliais`; as buscas permitem selecionar Filiais sem validar a lista do usuário.

**DECISÃO PARA OS PROMPTS** — seguir o padrão de segurança Laravel: usar `UserBranchAccessService` para limitar lookups, filtros, documentos candidatos, exportações e comandos às Filiais autorizadas. Administrador segue o contrato global do projeto. A Filial não pode vir apenas do request: derivar/revalidar contra usuário e registros fiscais. Para operações que alcançam emissão, destino e documento financeiro, validar todas as Filiais relevantes, não só a ativa.

## Menu e acesso ao módulo

**CONFIRMADO NO POSTGRESQL, 2026-08-01**:

- O acesso Delphi é `acessosmodulos.codigo=63`, `nomemenu=mitCadastroRomaneio`, descrição “Entrega e Montagem - Entrega - Romaneios”, não Cloud.
- Existe o nó Cloud raiz `codigo=445`, rótulo “Entrega e Montagem”, rota `cloud.modulo.entrega_e_montagem`.
- Não existe folha Cloud para Cadastro de Romaneios.

**DIVERGENTE** — o pedido chama o caminho de “Entregas → Cadastro de Romaneios”, enquanto o catálogo Cloud atual usa “Entrega e Montagem”. Evitar criar uma segunda raiz concorrente. O ticket de segurança/menu deve decidir entre manter o rótulo atual ou renomear o nó compartilhado com avaliação de impacto; a folha deve ser “Cadastro de Romaneios”.

Padrão aplicável:

1. Migration idempotente localiza o pai pela rota `cloud.modulo.entrega_e_montagem` e cria/atualiza a folha pela rota canônica, por exemplo `entregas.cadastro-romaneios.index`.
2. Não copiar grants do acesso Delphi 63 nem conceder a todos. Administrador acessa automaticamente; usuário comum precisa de `usuariosacessosmodulos(usuario, acesso)` para a nova folha.
3. Um `EntregasCadastroRomaneiosModuleAccessService` resolve o código pela rota + `teclux_cloud=true`; middleware próprio protege todo o grupo de rotas; Policy/serviço de capacidades revalida cada leitura e mutação.
4. Ausência da linha de menu é fail-closed. Menu oculto não substitui autorização backend.
5. Não usar `Schema::has*` em runtime de negócio. Checagens estruturais existentes em migrations não são precedente para services/controllers.

O paralelo comprovado é Consulta de Requisições: migration de folha sem replicação automática de grants, service que permite administrador ou concessão explícita e middleware no grupo inteiro (`database/migrations/2026_07_30_295000_acessosmodulos_consulta_requisicoes.php`; `app/Services/Authorization/InterlojasConsultaRequisicoesModuleAccessService.php`).

## Matriz mínima de capacidades

O acesso à folha habilita abrir/consultar, mas não elimina guards de estado, Filial ou prova sensível:

- `view/search/export/print`: acesso ao módulo + escopo de Filial; exportação usa o mesmo conjunto filtrado.
- `create/update/delete_item/delete_romaneio`: acesso ao módulo + Policy + estado/revisão + Filiais.
- `confirmar_recebimento/liberar_entrega/reter_entrega`: requisitos anteriores + prova contextual.
- `cancelar_pagamento`: manter fora até semântica confirmada; se incluída, acesso + prova de gerente de estoque + imutabilidade de duplicata paga.

## Resposta

O Romaneio depende exatamente de dois parâmetros por Filial e quatro desafios contextuais. O Laravel já possui os mecanismos adequados — manifest/`getMany`, acesso por `acessosmodulos`, `UserBranchAccessService` e provas sensíveis — mas ainda não possui manifest, folha Cloud, service/middleware/Policy ou ações sensíveis específicas do Cadastro de Romaneios. A especificação deve acrescentar essas integrações sem duplicar mecanismos e sem ampliar silenciosamente os perfis exigidos pelo legado.
