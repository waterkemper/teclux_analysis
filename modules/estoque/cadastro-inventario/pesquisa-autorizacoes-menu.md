# Pesquisa: autorizações e menu do Cadastro de Inventário

## Escopo e classificação

Pesquisa sobre autorização, visibilidade no menu e escopo por filial, usando os fontes locais do Delphi e os padrões já implementados no Laravel.

- **Confirmado**: encontrado diretamente no fonte.
- **Não localizado**: não encontrado nos arquivos analisados; pode existir em camada herdada ou compartilhada.
- **Proposta**: regra necessária para a especificação Laravel, ainda sujeita ao ticket de domínio.

Fontes principais:

- delphi/apps/estoque/dmcadastroinventario.pas
- delphi/apps/estoque/fmcadastroinventario.pas
- delphi/apps/estoque/fmcadastroprodutosinventario.pas
- laravel/backend/app/Services/Menu/MenuService.php
- laravel/backend/app/Http/Middleware/HandleInertiaRequests.php
- laravel/backend/app/Services/Authorization/ControleRecebimentosModuleAccessService.php
- laravel/backend/app/Services/Authorization/EstoqueConsultaEstoquesModuleAccessService.php
- laravel/backend/app/Services/Authorization/SensitiveOperationAuthService.php
- laravel/backend/config/sensitive-operation-auth.php

## Evidência do Delphi

### Entrada no módulo e menu

**Não localizado** nos fontes do Cadastro de Inventário:

- criação ou consulta de acessosmodulos;
- nome da rota ou registro de menu;
- teste explícito de permissão para abrir a tela;
- atribuição de usuariosacessosmodulos.

O método ZMonitor1MonitorEvent grava SQL e resultado em c:\acessos.sql. Isso é monitoramento legado de consultas, não autorização de menu nem fonte de grants; não deve ser reproduzido no Laravel.

A localização originalmente citada como Caixa -> Controle de Recebimentos não corresponde ao cadastro analisado. Para este trabalho, a localização Delphi do inventário permanece não confirmada. **Proposta** para o novo menu: Estoque -> Inventário, com folha Cadastro de Inventário, até validação do catálogo funcional.

### Regra confirmada para processar o inventário

O método TdtmCadastroInventario.GerarMovimentos é a operação sensível:

1. Verifica o limite de dias configurado para processamento.
2. Pesquisa se há movimentações posteriores à data do inventário; se houver, bloqueia e pede revisão.
3. Pesquisa itens não inventariados e, quando o total não é zero, pede confirmação de que o estoque será zerado.
4. Cria TtecUsuarios.
5. Se UsuarioLogin possui GerenteEstoque, chama ObterAutorizacao(taSENHA).
6. Caso contrário, chama ObterAutorizacao(taLOGIN, ctGERENTEESTOQUE, ctAUTORIZADO), permitindo outro usuário autorizado.
7. Só continua quando o usuário retornado existe e possui GerenteEstoque.

Portanto, a autorização mínima confirmada para processar é o perfil legado Gerente de Estoque. Há dois caminhos:

- gerente da sessão: prova somente por senha;
- outro autorizador: login e senha, com perfil Gerente de Estoque e autorizado.

Isso é diferente do direito de abrir, consultar, editar ou excluir um inventário aberto.

### Operações sem autorização explícita localizada

Nos arquivos analisados, gravar o cabeçalho, excluir inventário aberto, incluir/editar/excluir produtos, copiar itens, importar arquivo e gerar produtos auxiliares são acionados por métodos padrão/inherited e pelo estado da tela. Não foi localizada chamada de autorização equivalente à de GerarMovimentos.

O formulário habilita essas ações principalmente quando:

- situação é A (aberto);
- filial, data e processamento estão preenchidos;
- existe inventário carregado;
- o inventário ainda não foi processado.

Isso é controle de estado da operação, não segurança suficiente no backend. A especificação Laravel deve revalidar situação, filial, registro e autorização em toda requisição.

Há dois botões administrativos de inclusão de reservas inconsistentes que ficam visíveis somente quando UsuarioLogin.Administrador e o inventário aberto ainda não tem produtos. Essa regra foi encontrada no formulário e deve ser capacidade separada, caso seja mantida.

## Matriz de autorização proposta

| Capacidade | Evidência | Regra a especificar |
|---|---|---|
| Abrir módulo | menu não localizado no Delphi | grant da folha acessosmodulos; administrador conforme padrão Cloud |
| Consultar inventários | tela permite localizar | grant do módulo + filial autorizada |
| Gravar cabeçalho/produtos | ações em situação A | grant + filial autorizada + situação aberta + concorrência |
| Excluir inventário/produtos | ações em situação A | grant + filial autorizada + confirmação e auditoria |
| Gerar/importar | ações da tela | grant + filial autorizada; validar formato no backend |
| Processar movimentos | GerarMovimentos exige GerenteEstoque | operação sensível; senha do gerente ou login/senha de gerente autorizado |
| Reservas inconsistentes | administrador no formulário | capacidade separada, administrador ou permissão dedicada |
| Imprimir/relatório | botão de impressão | grant de consulta/relatório e escopo de filial |
| Exportar grids | requisito Laravel | capability de consulta; nunca exportar fora do escopo |

O endpoint de processar deve repetir no servidor todas as pré-condições do Delphi, inclusive limite de dias, movimentação posterior, itens a zerar e situação. O front-end apenas apresenta modal e estado.

## Padrão Laravel encontrado

### Menu e acessosmodulos

HandleInertiaRequests obtém a filial ativa e compartilha o menu gerado por MenuService. O MenuService:

- considera módulos Cloud (teclux_cloud = true);
- constrói hierarquia por codigo_pai, ordem e nomemenu;
- para administrador, lista o catálogo Cloud;
- para outros usuários, cruza usuariosacessosmodulos com acessosmodulos;
- só expõe folhas com rota existente e oculta grupos sem filhos visíveis.

O cadastro deve seguir este modelo:

- raiz funcional já existente, se houver;
- grupo Estoque, se já existir no catálogo;
- folha única Cadastro de Inventário;
- rota canônica única usada pelo middleware;
- teclux_cloud = true e habilitado = true;
- codigo_pai e ordem coerentes;
- grants mantidos em usuariosacessosmodulos, sem replicação automática.

O middleware deve negar por padrão usuário não autenticado, rota ausente, catálogo ambíguo ou falta de grant. ControleRecebimentosModuleAccessService demonstra códigos distintos para rota_ausente, catalogo_ambiguo e sem_grant; o inventário deve seguir esse conceito.

As migrações existentes de acessosmodulos contêm verificações históricas de schema. Isso não autoriza copiá-las para o fluxo do módulo: o prompt final deve obedecer ao requisito de nunca testar driver, nunca testar hasTable/hasColumn em runtime e nunca pedir que outro agente reabra fonte Delphi.

### Autorização sensível e senha

O Laravel já possui SensitiveOperationCatalog e SensitiveOperationAuthService, com:

- operação identificada por modulo/acao;
- parâmetro habilitador;
- perfil legado;
- modo senha-only quando aplicável;
- login e senha de outro autorizador;
- rate limit, prova com TTL, cancelamento e auditoria;
- contexto por operador, filial e entidade.

**Proposta**: cadastrar uma operação Estoque / processar_inventario, com coluna de perfil legado gerenteestoque, exigindo esse perfil, e configurar o comportamento de senha conforme o padrão já utilizado para estoque. Não armazenar senha ou segredo; registrar somente resultado, operador, autorizador quando permitido, filial, inventário, motivo e timestamp.

A prova deve estar vinculada ao inventário e à filial, expirar e ser invalidada quando o inventário mudar de situação ou o processamento for cancelado. O processamento deve ser transacional e idempotente.

### Filial e escopo

O Delphi exige filial preenchida para habilitar operações, mas não foi localizada nos fontes uma política de filiais autorizadas. No Laravel, filial ativa não é autorização suficiente.

**Proposta obrigatória**:

- consultar filiais autorizadas pelo serviço de acesso por filial já usado no projeto;
- validar a filial no backend para leitura, gravação, exclusão, processamento, relatório e exportação;
- não confiar em filial enviada pelo navegador;
- impedir troca de numero para inventário de outra filial;
- aplicar a restrição nas consultas de produtos, lotes e movimentos.

## Consequências para o prompt /speckit.specify

O prompt do módulo deve exigir:

1. autorização baseada em acessosmodulos e usuariosacessosmodulos, com rota canônica única e fail-closed;
2. capacidades separadas para consulta, gravação, exclusão, relatório/exportação e processamento;
3. middleware e políticas no backend, sem depender de botão habilitado;
4. operação sensível de processamento usando o mecanismo central de senha;
5. modal de senha/login seguindo padrão existente e botão Cancelar;
6. auditoria sem senha ou segredo;
7. escopo obrigatório por filial autorizada;
8. situação A como pré-condição de alterações e processamento, rechecando em transação;
9. administrador não ignorar invariantes de negócio;
10. menu Estoque -> Cadastro de Inventário somente após confirmar hierarquia do catálogo;
11. não instruir sessões futuras a abrir fontes Delphi;
12. não usar teste de driver, hasTable ou hasColumn como compatibilidade.

## Pontos ainda abertos

- posição e rótulo exatos do menu no catálogo funcional;
- se gravação/exclusão exige permissão além do grant de módulo;
- se os botões administrativos de reservas pertencem ao escopo Laravel;
- nome legado exato do parâmetro de limite de dias e mapeamento para parametros_valor('', '');
- política de filiais autorizadas aplicável ao usuário.

Esses pontos devem ser resolvidos no ticket de domínio, não inventados no prompt final.
