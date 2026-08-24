# Identificar parâmetros, autorizações e acesso do Relatório de Entregas legado

Type: research
Status: resolved
Blocked by:

## Question

Identificar usos diretos e indiretos de parâmetros do sistema no relatório e em suas dependências, usando `delphi/biblio/clparametrossistema.pas` e o padrão `parametros_valor('', '')`; levantar descrições literais, tipos, precedência global/Filial e efeitos. Também identificar `acessosmodulos`, `usuariosacessosmodulos`, permissões ou autorizações de Usuário e o menu legado para **Entregas e Montagens → Entregas → Relatório de Entregas**. Separar ausência de regra no legado de evidência não localizada e propor o contrato Laravel fail-closed sem copiar grants.
## Answer

Pesquisa consolidada em [pesquisa-parametros-autorizacoes-menu.md](../../../modules/entregas/relatorio-entregas/pesquisa-parametros-autorizacoes-menu.md).

- As quatro unidades Delphi localizadas nao usam `parametros_valor` nem `ParSistema` diretamente; `AtribuirParametrosBaseRelatorio` e uma chamada herdada cuja implementacao nao foi localizada.
- `clparametrossistema.pas` foi documentado com os literais relevantes, tipos, precedencia filial/global e fallbacks permissivos. Nenhum uso especifico desses parametros foi confirmado na tela.
- A tela usa filtros de interacao e monta macros SQL; a nota registra filtros bindados, `IN`/`ANY(array)` e consulta set-based para o Laravel.
- Nao foi localizado codigo, grant ou entrada de menu especifica do Relatorio de Entregas. O mecanismo legado generico de acessos diretos e por grupo foi confirmado em `clusuario.pas`.
- O contrato Laravel deve criar/reutilizar folha propria sob Entregas e Montagens -> Entregas -> Relatorio de Entregas, com acesso fail-closed e sem copiar grants; codigo `63` nao deve ser reutilizado.
- O caminho externo `C:\\prjetos.vcl\\...` nao esta no checkout; a pesquisa usou `delphi/apps/entrega/` e nao pede reabertura da fonte Delphi pelos prompts.
