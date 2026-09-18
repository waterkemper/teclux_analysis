# Confirmar comportamento atual do Cadastro de Contratos Delphi

Type: research
Status: resolved
Blocked by:

## Question

O Cadastro de Contratos recompõe os grupos/classes dos produtos no momento de selecionar o plano e o motor compartilhado aplica a regra de cobertura integral dos grupos?

## Evidence

- `delphi/apps/vendas/fmcadastrocontratos.pas:1021-1033` passa `Grupos` e `Classes` ao cálculo sem chamar `MontarListaGruposClasses` imediatamente antes.
- `delphi/apps/vendas/fmcadastrocontratos.pas:1120`, `:1646`, `:2076`, `:2650` e `:3926` recompõem as listas apenas em eventos específicos; elas ficam armazenadas no formulário.
- `delphi/apps/vendas/fmcadastrocontratos.pas:2915-2916` repassa esses mesmos arrays ao callback do formulário financeiro.
- `delphi/apps/vendas/dmcadastrocontratos.pas:10180-10234` obtém os produtos, consulta grupos via `caracteristicas.grupo` e preenche os arrays; `dmcadastrocontratos.dfm:4991-5010` confirma a SQL.
- `delphi/repositorio/dmcalculofinanciamento.pas:692-823` filtra `planosgrupos`; para cada plano, só o inclui quando a contagem de grupos encontrados equivale ao tamanho da lista recebida.
- A mesma função injeta uma exceção que libera plano sem registros em `planosgrupos` e `planosclasses` (`:694-697`), e retorna sem filtrar quando ambas as listas estão vazias (`:798-822`).
- O caminho de venda à vista em `fmcadastrocontratos.pas:1045-1054` atribui `ParSistema.PlanoVendaVista` diretamente, sem validação por grupo.

## Finding

CONFIRMADO: o motor compartilhado consegue excluir um plano quando recebe um grupo incompatível, mas o Cadastro de Contratos não garante que a lista esteja atualizada no instante da abertura. Se o produto não produzir grupo/classe, as listas ficam vazias e todos os planos passam. Logo, a implementação atual não permite certificar que o cenário relatado funcione corretamente.

## Suggested basic prompt

Use o prompt registrado no ticket 02 para o ajuste Delphi. O ajuste deve recompor grupos/classes imediatamente antes da seleção e validar também a confirmação/gravação do plano, mantendo a exceção de plano sem vínculos somente após decisão explícita.

