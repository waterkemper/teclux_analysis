# Venda Perdida reutilizável

Label: wayfinder:map

## Destination

Produzir uma análise Delphi–Laravel baseada em evidências e pronta para `$to-spec` para implementar Venda Perdida como funcionalidade reutilizável no Laravel, inventariando todos os consumidores Delphi e integrando futuramente os consumidores equivalentes sem duplicar regras, sem implementar neste workspace.

## Notes

- `delphi/` e `laravel/` são junctions somente de leitura. PAS e DFM devem ser analisados conjuntamente, incluindo ancestrais, data modules, queries, eventos, actions, Permissões, Autorizações, Parâmetros do Sistema, relatórios e units compartilhadas.
- Classificar cada descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre citando arquivo, linha, campo, SQL ou outro vestígio concreto.
- CONFIRMADO: o núcleo Delphi está em `apps/vendas/fmVendasPerdidas.pas/.dfm` e `dmVendasPerdidas.pas/.dfm`; a persistência usa `vendasperdidas` e `vendasperdidas_codigo_seq`.
- CONFIRMADO: Orçamentos, Contratos e Consulta de Estoque abrem o mesmo formulário com `['Incluir']`, sem transmitir documento, Cliente ou Produto selecionado.
- CONFIRMADO: cada registro contém uma única demanda, identificada por Produto cadastrado ou por descrição livre do item, e grupo cadastrado ou descrição livre do grupo.
- CONFIRMADO: Filial e data/hora são preenchidas ao incluir; vendedor e observações são obrigatórios. Vendedor não recebe valor automático no código ativo.
- CONFIRMADO: a exclusão pede confirmação e Autorização contextual por login. A inclusão/gravação não chama essa autorização no código ativo; a associação do autorizador ao vendedor está comentada.
- NÃO LOCALIZADO: implementação Laravel de Venda Perdida, motivo estruturado, concorrente e Parâmetro do Sistema específico de Venda Perdida.
- A solução Laravel deve ser reutilizável por diferentes módulos e receber contexto opcional por contrato/adaptador, sem alterar automaticamente Orçamento, Contrato ou Estoque.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

- DECISÃO NOVA: Venda Perdida representa uma ocorrência por item ou demanda não atendida; uma negociação pode gerar várias ocorrências.
- DECISÃO NOVA: preservar a alternativa entre Produto cadastrado e descrição livre de item/grupo, permitindo registrar demanda por Produto inexistente no Cadastro.
- DECISÃO NOVA: o componente Laravel recebe, quando disponíveis, módulo e registro de origem, Filial, Cliente, Produto, quantidade e valor; isso é contexto e não produz efeitos no documento ou estoque de origem.
- DECISÃO NOVA: não criar motivo estruturado nem concorrente; observações livres continuam obrigatórias.
- DECISÃO NOVA: vendedor começa em branco e deve ser preenchido explicitamente pelo usuário; não usar vendedor do contexto nem usuário logado como padrão.

## Not yet specified

- Esquema físico completo da tabela legada, constraints, triggers de Auditoria e compatibilidade de escrita pelo Laravel.
- Semântica e limites de quantidade e valor quando recebidos do contexto, pois esses campos não aparecem no registro Delphi localizado.
- Identidade polimórfica da origem e comportamento quando o documento ou Produto de origem for posteriormente alterado ou excluído.
- Permissões separadas para incluir, consultar, alterar e excluir, e equivalência da Autorização contextual usada na exclusão Delphi.
- Política para alteração/exclusão de um registro histórico e efeitos da Auditoria por `_log_new`.
- Necessidade de listagem administrativa, filtros, exportação e relatórios analíticos no primeiro incremento.
- Todos os consumidores Delphi além dos três já confirmados e todas as superfícies Laravel equivalentes.
- UX exata para Produto cadastrado versus demanda livre, validações e acessibilidade.

## Out of scope

- Implementar ou testar código neste workspace.
- Alterar Delphi ou Laravel, inclusive migrations, Composer, npm, builds, formatadores e geradores.
- Converter cancelamento de Orçamento/Contrato ou indisponibilidade de Estoque automaticamente em Venda Perdida.
- Criar Cadastro de Motivos de Perda ou de concorrentes.
- Tratar uma negociação inteira como uma única Venda Perdida.
- Reproduzir automaticamente limitações ou possíveis bugs do Delphi.
