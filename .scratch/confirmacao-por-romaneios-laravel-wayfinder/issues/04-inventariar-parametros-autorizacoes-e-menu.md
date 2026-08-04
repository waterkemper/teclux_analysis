# Inventariar parâmetros, autorizações e menu da Confirmação por Romaneios

Type: research
Status: resolved
Blocked by:

## Answer

A pesquisa foi consolidada em [pesquisa-parametros-autorizacoes-menu.md](../../../modules/interlojas/confirmacao-por-romaneios/pesquisa-parametros-autorizacoes-menu.md), usando as units Delphi, `clparametrossistema.pas`, `clusuario.pas`, o menu Interlojas e os contratos Laravel existentes.

- Foram confirmados cinco literais efetivos: `USAR GRADES PRODUTOS`, `Máscara Quantidade`, `DATA CONTABIL`, `DIASNOTARETROATIVA` e `Evento Pagto Duplicata Transferência entre empresa`. A resolução deve ser batched por `ParameterService::getMany`, respeitando Filial específica com fallback global; o browser não é autoridade para parâmetros nem limites.
- A Filial ativa é a Filial base/requisitante (`cliente` na consulta), não a `filialemissao` das notas. O Laravel deve derivar e validar o escopo no servidor com acesso de Filial, sem aceitar `filial`/`cliente` enviado pelo cliente.
- O menu é `InterLojas` → `Confirmação por Romaneios`. Não foi localizado código numérico confiável para `acessosmodulos`; a decisão é criar folha Cloud própria, rota própria e grants explícitos em `usuariosacessosmodulos`, sem concessão em massa e sem reaproveitar o código de Confirmação por Notas.
- A capability de confirmação não é mero acesso ao menu: exige as pré-condições de domínio e a autorização sensível compartilhada (`taSENHA`/`taLOGIN`), com revalidação de estado, Filial e documentos no backend. A flag legada `TransferenciaPorItem` não deve ser promovida automaticamente a grant Laravel.
- O Laravel deve proteger a árvore completa (consulta, cancelamento, exportação e comandos) por middleware/Policy, manter operador e autorizador em auditoria separada sem senha e derivar o breadcrumb do mesmo catálogo/rota.

Ficam para tickets posteriores as decisões de compatibilidade do bypass `Suporte`, persistência do autorizador, lista final de capabilities sensíveis e semântica de grupos no Cloud. Nenhuma implementação, migration aplicada, teste de driver ou `hashtablefs` foi executado.

## Question

Quais chamadas `parametros_valor('', '')`, propriedades de `clparametrossistema.pas`, autorizações de usuário, validações de Filial, acessos Delphi, capabilities e registros necessários em `acessosmodulos` controlam filtros, consultas, conferência e confirmação? Mapear cada regra para `ParameterService::getMany`, manifest batched, middleware/Policy, `usuariosacessosmodulos`, autorização sensível e breadcrumb/menu Laravel, sem conceder grants em massa.

Usar `C:\projetos.vcl\biblio\clparametrossistema.pas` e as chamadas efetivas do módulo como fontes primárias. Distinguir acesso à folha de autorização operacional, operador de autorizador e escopo de Filial.
