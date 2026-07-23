# Definir o domínio de Eventos

Type: grilling
Status: resolved
Blocked by: 01

## Question

O que é a tabela `eventos` (código, descrição, parâmetros, valor, tipo de movimentação E/S) no domínio do Caixa, como ela se relaciona com `autenticacoes.evento`, se precisa de Cadastro próprio nesta entrega ou só leitura/lookup para a reclassificação feita na aba Eventos do Fechamento, e qual sua relação com o `ctPARAALTERACAOEVENTOCAIXA` (código de autorização sensível usado para alterar evento de uma autenticação)?

## Answer

CONFIRMADO por leitura do checkout: `eventos` **não é conceito próprio do Caixa** — já é um Cadastro completo e existente em Vendas: `App\Models\EventoCadastro`, `App\Http\Controllers\Vendas\EventosController`, `App\Services\Vendas\EventoService`, `App\Infrastructure\Persistence\Legacy\Vendas\LegacyEventosRepository`, com policy própria (`viewAny`/`create`/`update`/`delete`) e o campo `tipomovimentacao` já reconhecido pelo repositório.

### Decisão

A Fundação de Caixa **não cria nada novo para Eventos** — o Fechamento apenas consome o Cadastro de Eventos já existente como lookup, filtrado por `tipomovimentacao in ('E','S')` coerente com a direção da autenticação sendo reclassificada (mesma regra do `CondicoesEvento` do Delphi). Nenhuma extensão ao Cadastro de Eventos é necessária.

A relação com `ctPARAALTERACAOEVENTOCAIXA` já foi resolvida no ticket [Mapear Parâmetros do Sistema e Autorizações](02-mapear-parametros-e-autorizacoes.md): é a autorização sensível por senha que gateia a persistência da reclassificação (equivalente Laravel: `SensitiveOperationAuthService`), não uma regra do próprio Cadastro de Eventos.
