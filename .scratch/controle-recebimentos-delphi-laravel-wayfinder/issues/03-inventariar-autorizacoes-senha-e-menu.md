# Inventariar autorizações, senha e menu do Controle de Recebimentos

Type: research
Status: resolved
Blocked by:

## Question

Como o Delphi decide quem pode abrir a tela, consultar, editar, gravar, excluir ou executar cada operação? Identificar chamadas de autorização, exigências de senha, grupos/papéis, mensagens, pontos de reautenticação, filial/escopo e qualquer diferença entre acesso ao menu e autorização sensível.

Mapear a entrada em `Caixa -> Controle de Recebimentos`, o registro esperado em `acessosmodulos`, vínculos em `usuariosacessosmodulos` e convenções equivalentes já existentes no Laravel. Separar fatos confirmados de propostas novas e não guardar credenciais em auditoria. Produzir evidência de pesquisa, não migration nem policy.

## Answer

A análise foi consolidada nos artefatos já produzidos:

- [pesquisa-interface-fluxo-delphi.md](../../modules/caixa/controle-recebimentos/pesquisa-interface-fluxo-delphi.md), que documenta a autorização de Analista de Crédito e a ausência de menu/acessos nas units da tela;
- [pesquisa-sqls-parametros-delphi.md](../../modules/caixa/controle-recebimentos/pesquisa-sqls-parametros-delphi.md), que documenta o parâmetro `Recebimentos Integrado com Bancos` e seu carregamento por `TtecParametrosSistema`.

Conclusões confirmadas:

- Abrir a tela e consultar não possuem uma autorização de módulo/menu localizada nas fontes Delphi analisadas.
- F5/gravação chama `ObterAutorizacaoPagamento`; o usuário atual pode informar senha quando é Analista de Crédito, ou outro usuário pode autenticar-se com os tipos `ctANALISTACREDITO`/`ctAUTORIZADO`. O sucesso exige que o usuário autorizado tenha `analistacredito` (`dmcontrolerecebimentos.pas:699-706`, `:1567-1587`).
- A autorização sensível de negócio é distinta do acesso ao menu e do escopo de Filiais. O frame de Filiais restringe a seleção conforme as Filiais autorizadas, mas não substitui a capability do módulo.
- Não foram localizados `acessosmodulos`, `usuariosacessosmodulos` ou a entrada `Caixa -> Controle de Recebimentos` nas units consultadas.
- O parâmetro usado na operação bancária é `Recebimentos Integrado com Bancos`, booleano, combinado com `InicioIntegracaoBancos`; não há chamada literal a `parametros_valor('', '')` na tela.

Handoff Laravel: criar/verificar capability própria do módulo e entradas de menu/acesso conforme o padrão existente, manter autorização de negócio contextual separada, registrar ator/autorizador sem armazenar senha, aplicar escopo de Filial no backend e definir explicitamente quais operações exigem reautenticação. Não foi criada migration nem policy.
### Complemento da pesquisa

A auditoria dedicada dos padrões Laravel foi registrada em [pesquisa-autorizacoes-menu.md](../../modules/caixa/controle-recebimentos/pesquisa-autorizacoes-menu.md), confirmando o padrão de folha por rota, grant explícito em `usuariosacessosmodulos`, middleware fail-closed, `SensitiveOperationCatalog`/prova contextual, `ParameterService` e escopo de Filial. Também marcou como divergência os fallbacks históricos por `hasTable`/`hasColumn` e teste de driver, proibidos para este módulo.