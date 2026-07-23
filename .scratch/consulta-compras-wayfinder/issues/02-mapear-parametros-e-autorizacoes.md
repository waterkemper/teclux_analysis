# Mapear Parâmetros do Sistema e Autorizações envolvidos na Consulta de Compras

Type: task
Status: resolved
Blocked by:

## Question

Quais Parâmetros do Sistema e Autorizações/Permissões estão envolvidos na Consulta de Compras (limites de percentual/desconto, parametrização de dias de estoque padrão, permissões de gerar pedido/requisição, restrições por Filial/Grupo Filial) e quais já têm equivalente no Laravel — em especial no Configuration Center (`specs/054-configuration-center`) e nos manifestos de parâmetro (`ParameterReadBundle`/`CadastroParameterManifestContract`) já usados por outros Cadastros/Consultas de Estoque?

## Answer

### Achado central: a superfície de Parâmetros/Autorizações embutida nesta tela é muito menor do que a pergunta supunha

Busca exaustiva por `ParSistema.\w+` e `UsuarioLogin.\w+` em `dmconsultacompras.pas`/`fmconsultacompras.pas` encontrou só uma referência: `ParSistema.MascaraQuantidadeGrade` — CONFIRMADO ser só uma máscara de formatação usada como variável do FastReport (`frVariables['MascaraQuantidade']`), sem efeito de cálculo ou de negócio. Não há nenhuma chamada a `ObterAutorizacao` nesta tela — nenhuma operação aqui exige autorização sensível por senha.

### "Gravar F5" não é um Parâmetro do Sistema

CONFIRMADO (`LerArquivoCFG`, `dmconsultacompras.pas:3136-3185`): persiste um único flag booleano (`PedidosEntreFiliais`) num arquivo `.ini` local (`ExtractFilePath(Application.ExeName) + ctNomeArquivoCFG`) — é uma preferência **por estação de trabalho**, não um Parâmetro do Sistema server-side, não é por usuário nem por Filial. Reforça a Nota já registrada no mapa: tratar como preferência de UI local, não como Parâmetro a migrar para o Configuration Center.

### Filial/Grupo Filial não são restritos por permissão

CONFIRMADO (`qryFiliais`, `dmconsultacompras.dfm:3684-3699`): a lista de Filiais disponíveis para seleção é `SELECT codigo, nome FROM filiais ORDER BY codigo` — sem filtro por Filiais liberadas ao usuário logado. Não há evidência de restrição de acesso por Filial nesta tela.

### O que falta é infraestrutura padrão, não parametrização de negócio

NÃO LOCALIZADO: não existe ainda nenhuma entrada em `acessosmodulos` para "Compras" no Laravel — é esperado, já que nada do módulo existe. Isso é infraestrutura padrão (a mesma registrada via migrations `add_acessosmodulos_*` para outros Cadastros), não uma decisão de negócio a resolver aqui; basta seguir o padrão já estabelecido ao implementar.

### Conclusão

Diferente de outros módulos analisados (ex.: Caixa), a Consulta de Compras **não tem** uma matriz rica de Parâmetros do Sistema/Autorizações sensíveis embutida em si — os parâmetros de cálculo (percentual acima do mínimo, dias de estoque, curva ABC etc.) são todos inseridos pelo próprio usuário na aba Parâmetros a cada consulta, não vêm de `ParSistema`. Os tickets seguintes (03 a 12) não precisam mapear nenhum Parâmetro do Sistema adicional além do já confirmado aqui; a única infraestrutura pendente é o registro padrão de acesso ao módulo em `acessosmodulos`, a resolver na implementação.
