Type: task
Status: resolved
Blocked by:

## Question

Quais permissões, autorizações contextuais, restrições por filial, parâmetros da aplicação, configurações, regras de usuário, lançamentos avulsos, auditoria e mecanismos como supressão de triggers condicionam acesso, filtros, visibilidade, edição e processamento na Ficha de Produtos Delphi?

## Answer

### Fontes e modelo geral

Foram inspecionados o formulário e data module da Ficha, `clusuario.pas`, `clparametrossistema.pas`, `dmlancamentosmanuais.pas`, `dmbasico.pas`, o registro do módulo em `rgestoque.pas` e as telas administrativas de usuários/grupos. O Laravel atual foi consultado apenas para identificar padrões reutilizáveis; seu inventário definitivo permanece no ticket próprio.

O legado possui quatro controles diferentes, mas combina três deles no booleano `GerenteEstoque`:

1. acesso ao módulo pelo menu;
2. alcance de filial;
3. visibilidade de valores financeiros;
4. permissão de alterar dados históricos.

Autorização contextual de lançamentos avulsos é uma quinta camada, originada no módulo que cria o movimento, não na Ficha.

### Acesso ao módulo

- `TfrmConsultaFichaProduto` é registrado em `rgestoque.pas` para criação dinâmica.
- O usuário carrega os nomes de menu permitidos por `acessosmodulos`, reunindo:
  - concessões diretas de `usuariosacessosmodulos`;
  - concessões herdadas do grupo em `gruposusuariosacessosmodulos`.
- O formulário não repete a verificação: pressupõe que o menu/infraestrutura só o instancie após autorização.
- Existem constantes legadas:
  - `ctConsultaFichaProduto = 38`;
  - `ctConsultaGeralFichaProduto = 48`;
  - `ctTabelasConsultaFichaProduto = 160`.
- Elas não são referenciadas pelo código ativo da Ficha. Não há evidência para transformá-las em três permissões Laravel. A fonte efetiva do acesso é o cadastro dinâmico de módulo/menu.
- Chamadas contextuais por `TfrmConsultaCompras` abrem a mesma classe. A autorização deve ser aplicada também nesse deep-link; não basta ocultar o item de menu.

**Decisão:** criar/reusar uma policy de tela para `viewAny/view`, vinculada à rota Cloud cadastrada em `acessosmodulos`. Acesso direto à rota e abertura a partir de outro módulo devem passar pela mesma policy.

### Perfil “Gerente de estoque”

`UsuarioLogin.GerenteEstoque` é lido do campo `usuarios.gerenteestoque`. O perfil também existe em `gruposusuarios.gerenteestoque` nas telas administrativas, mas a instância de usuário usada pela Ficha lê o valor materializado na consulta de usuários; não há, nesta unit, composição dinâmica entre os dois.

Na Ficha, esse único valor controla:

| Capacidade | Gerente | Não gerente |
|---|---|---|
| Escolher filial | qualquer filial do cadastro | filial-base fixa |
| Pesquisar filial | sim | não |
| Ver Financeiro/Custo médio/ICMS/Moeda | sim | não |
| Alternar Financeiro/Custo/IPI | sim | não |
| Editar grade principal | parcialmente | não |
| Ver botão Gravar | sim | não |

Isso é coarse-grained e viola separação de responsabilidades. A migração deve distinguir ao menos:

- `viewAny`: acessar a Ficha;
- `viewFinancials`: visualizar custo, financeiro, preços, moeda e dados equivalentes;
- `updateFinancialMovement`: corrigir campos permitidos;
- escopo de filiais: lista autorizada, independente dos três anteriores.

Não assumir que todo gerente pode consultar toda filial, nem que quem pode ver financeiro pode editar.

### Filiais

- No construtor do data module, `Filial` recebe `FilialBase`.
- Para não gerente, o filtro é preenchido com essa filial, desabilitado e somente leitura.
- Para gerente, filial é opcional. Vazio significa **todas as filiais**.
- O lookup Delphi executa `SELECT codigo,nome FROM filiais` sem filtro por `usuariosfiliais`, grupo, empresa, ativa/inativa ou outro escopo.
- Logo, o legado concede alcance global por ser gerente e alcance único por não ser gerente; não implementa filiais autorizadas intermediárias.

**Decisão:** o Laravel deve usar `UserBranchAccessService`/`usuariosfiliais`. O lookup lista somente filiais autorizadas e toda query intersecta os IDs solicitados com esse conjunto no servidor. Administrador pode manter o comportamento já estabelecido de todas as filiais. “Sem filtro” deve significar todas as **autorizadas**, jamais todas as filiais do banco.

### Visualização financeira

Para não gerente, o formulário oculta em Movimentos e Lotes:

- `financeiro`;
- `customedio`;
- `precocomicms`;
- `precosemicms`;
- `moedaLookup`;
- `valormoeda`.

O valor bruto `valor` e a alíquota IPI aparecem na mesma coluna alternável usada por gerente, mas Alt+F5 fica bloqueado para não gerente. A especificação deve tratar todo o conjunto custo/financeiro/fiscal como sensível e decidir explicitamente quais campos pertencem à permissão financeira.

Ocultar colunas apenas no frontend não basta: endpoints e serialização não devem devolver campos financeiros quando `viewFinancials` for negado.

### Alteração e gravação

- `qryFichaProduto` usa cached updates e `RequestLive = True`.
- Só a grade principal de Movimentos participa do fluxo de gravação.
- Mesmo gerente só pode alterar:
  - preço com ICMS;
  - preço sem ICMS;
  - moeda;
  - valor em moeda;
  - pedido de cotação;
  - pedido aberto;
  quando a posição financeira da operação (`fin`, 12º caractere) é `+`.
- Os outros campos persistentes são `ReadOnly` no dataset.
- Não há reautorização contextual ao salvar: ser gerente logado é suficiente.
- `InternoGravar` chama `GravarMovimento`, que:
  1. guarda a posição;
  2. remove a primeira linha sintética de saldo;
  3. posta a edição;
  4. aplica atualizações/transação por `Perpetrar`;
  5. reinsere o saldo anterior e restaura a posição.

**Decisão:** se a correção histórica continuar no escopo, implementá-la como comando explícito e auditável, com whitelist de campos, validação server-side de `fin = '+'`, optimistic locking e permissão própria. Não expor update genérico sobre `movimentos`.

### Supressão de triggers

Antes de qualquer post, `qryFichaProdutoBeforePost` força:

`naoprocessartriggers = true`.

Isso indica que a edição da Ficha corrige metadados financeiros do movimento existente sem recalcular novamente saldos, estoque e efeitos do lançamento. O repositório não contém a definição dos triggers PostgreSQL; portanto, não é possível afirmar quais triggers são ignorados nem se o flag é automaticamente restaurado.

Implicações:

- a Ficha não cria um novo movimento compensatório;
- atualizar sem o flag pode duplicar efeitos de estoque;
- copiar o flag para uma API pública seria perigoso;
- a camada de persistência Laravel deve encapsular a atualização em método específico e testar contra o banco legado;
- se for possível, preferir procedure/serviço transacional autorizado em vez de permitir que a requisição controle `naoprocessartriggers`.

Esse mecanismo é de gravação, não necessário à consulta somente leitura. Como o objetivo inicial do usuário é “só pela consulta”, a recomendação é **não incluir edição na primeira entrega**, mas documentá-la como paridade adiada/fora da fase de leitura.

### Efeito colateral ao navegar

`qryFichaProdutoAfterScroll` marca os campos financeiros como somente leitura quando `fin <> '+'`. Se moeda fica somente leitura, a rotina entra em edição, limpa `moeda` e `moedaLookup` e posta o dataset.

Isso acontece durante navegação, inclusive sem uma intenção explícita de editar. Como são cached updates, a persistência só ocorre se o fluxo de gravação for executado, mas o dataset fica modificado e pode limpar moeda de registros não financeiros.

**Classificação:** comportamento legado perigoso; não reproduzir. Leitura nunca deve mutar estado.

### Lançamentos avulsos e autorização

A Ficha não cria lançamento avulso; apenas filtra movimentos históricos por:

`m.usuarioautorizacao is not null`.

A origem está em `TdtmLancamentosManuais.PermitirLancamentoAvulso`:

- sempre grava `usuariologado` com o usuário da sessão;
- exige outro login autorizador quando:
  - o parâmetro `Exigir Senha em Lançamentos Avulsos` está ativo; **ou**
  - o usuário logado não é gerente de estoque;
- o autorizador precisa ter `GerenteEstoque`;
- quando aprovado, seu código vai para `usuarioautorizacao`;
- se o usuário já é gerente e o parâmetro está desativado, o lançamento é permitido sem preencher autorizador.

Portanto, **“Somente Lançamentos avulsos” não significa todos os avulsos**. Significa movimentos avulsos que passaram por autorização de um segundo usuário. Avulsos feitos diretamente por gerente sem exigência de senha ficam de fora.

**Decisão recomendada:** renomear o filtro para **Somente lançamentos com autorização** se a regra permanecer. Para filtrar todos os avulsos, é necessário um discriminador de origem confiável, não apenas `usuarioautorizacao`.

### Auditoria

Campos históricos exibidos:

- `usuariologado` e nome: executor;
- `usuarioautorizacao` e nome: autorizador contextual;
- `processamento`: timestamp do processamento;
- `data`: data do movimento.

O nome é consultado em `usuarios` no momento da leitura, não armazenado como snapshot. Renomear usuário muda o nome exibido no histórico.

Para a futura API:

- preservar códigos e nomes;
- tratar autorizador como anulável;
- não confundir executor com autorizador;
- definir timezone/formatação de `data` e `processamento`;
- registrar também o ator da eventual correção financeira no mecanismo de auditoria Laravel, pois o update legado não cria novo movimento.

### Parâmetros e configurações consumidos

| Origem | Parâmetro/configuração | Efeito |
|---|---|---|
| `ParSistema` | `MascaraQuantidadeGrade` | formato das quantidades |
| `ParSistema` | `TamanhoMascaraQuantidade` | largura mínima de QTDE/ESTOQUE |
| `ParSistema` | `ExigirSenhaLancamentoAvulso` | determina se gerente também precisa de autorizador ao criar avulso |
| Sessão/global | `FilialBase` | filial fixa do não gerente |
| Sessão | `UsuarioLogin.GerenteEstoque` | visibilidade, filial e edição |
| Locale cliente | `DateToStr/StrToDate` | defaults e parsing `dd/mm/yyyy` |
| Banco/componentes | `ctTabelas`/tags | autoabertura de datasets auxiliares e do dataset principal |

`SetarActivePage` apenas escolhe a primeira aba visível; não restaura preferência do usuário. A geração sempre volta para Movimentos.

Não foram encontrados parâmetros próprios para:

- período máximo;
- paginação/limite;
- quantidade máxima de linhas;
- inclusão/exclusão de movimentos processados;
- exibição da grade de contratos;
- habilitação da correção financeira;
- timezone.

Esses limites deverão ser decisões explícitas no Laravel.

### Constantes e tags de dataset

O construtor marca `qryFichaProduto`, lookups de filial/movimento e moedas com `ctTabelas`. `TdtmBasico.AfterConstruction` abre automaticamente datasets com essa tag quando o data module tem `Tag = 0`. Isso explica o dataset principal aberto antes da primeira geração e a linha sintética inicial.

Não transportar esse lifecycle implícito. No Laravel, a página deve abrir sem resultados e consultar somente após filtros válidos.

### Estado atual do Laravel relevante

Já existem:

- policies registradas para módulos de estoque;
- serviços de acesso por rota Cloud cadastrada em `acessosmodulos`;
- `UserBranchAccessService` com `usuariosfiliais`;
- serviços que resolvem/intersectam filiais solicitadas;
- infraestrutura de autorização sensível configurável;
- o campo legado `gerenteestoque` no modelo/perfis.

Pontos a observar no ticket Laravel:

- alguns serviços de módulo atuais consultam apenas concessão direta em `usuariosacessosmodulos`, enquanto o Delphi também aceita concessão do grupo; verificar e reutilizar a variante correta;
- não criar outra implementação de filial autorizada;
- cadastrar a operação sensível somente se a fase incluir correção financeira;
- não usar `gerenteestoque` como substituto de policy ou escopo de filial.

### Matriz de decisão

| Regra legado | Classificação |
|---|---|
| Acesso via módulo/menu concedido | Paridade obrigatória |
| Abertura contextual sujeita à mesma autorização | Paridade obrigatória |
| Não gerente limitado à filial-base | Substituir por filiais autorizadas |
| Gerente acessa todas as filiais | Não reproduzir automaticamente |
| Financeiro oculto para não gerente | Paridade, com permissão dedicada |
| Gerente pode corrigir movimento `fin='+'` | Adiar na fase só-consulta; comando dedicado se retomado |
| `naoprocessartriggers` controlado pelo dataset | Encapsular internamente; nunca aceitar do cliente |
| Navegação limpa moeda | Bug legado; não reproduzir |
| “Avulsos” = autorizador não nulo | Renomear ou criar origem real |
| Sem paginação/limite | Lacuna a decidir |

### Síntese

A Ficha Delphi tem autorização de entrada por módulo, mas dentro dela usa `GerenteEstoque` como superperfil para filiais, sigilo financeiro e alteração. O Laravel deve preservar o acesso e a confidencialidade, substituindo o superperfil por policy, permissão financeira, permissão de correção e escopo de filiais autorizadas. Na primeira entrega somente de consulta, não deve existir endpoint de gravação nem exposição de `naoprocessartriggers`.
