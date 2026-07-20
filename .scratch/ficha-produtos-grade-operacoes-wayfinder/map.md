# Ficha de Produtos — Grade de Movimentos e Operações

Label: wayfinder:map

## Destination

Produzir um levantamento de paridade e uma recomendação pronta para especificação que defina exatamente as colunas padrão e opcionais da grade de Movimentos da Ficha de Produtos, todas as operações/atalhos do Delphi e sua adaptação melhorada no Laravel já implementado.

## Notes

- Comparar diretamente Delphi e Laravel atual; a implementação entregue pelo Cursor é o estado real de partida.
- Fontes Delphi prioritárias: apps/estoque/fmconsultafichaproduto.pas/.dfm, data module relacionado, ancestral de cadastro e componentes de grade usados pelo formulário.
- No Laravel, auditar catálogos Movimentos/Lotes, ErpPreferenceDataGrid, DTOs, controller, capabilities, exportação e handlers de teclado.
- Separar: coluna padrão (visível na abertura), coluna disponível (opt-in), preset de visão e operação sobre a linha.
- Preservar sigilo financeiro server-side; coluna não autorizada não pode chegar ao catálogo, payload, preferências ou exportação.
- Não copiar dependência de índices físicos de coluna nem edição ambígua de movimentos/lotes.
- Este mapa planeja e especifica; não altera a implementação.

## Decisions so far

<!-- Uma linha por ticket resolvido. -->

- [Inventariar colunas e operações Delphi](issues/01-inventariar-colunas-operacoes-delphi.md) — confirma 43 colunas, defaults por perfil e ciclos Alt+F5/Alt+F7/Alt+F8; revela TCOM fora do ciclo e Alt+F8 ocultando Custo Médio, omitindo Reserva Prévia e podendo reexpor dado financeiro a não gerente.
- [Auditar grade e operações Laravel](issues/02-auditar-grade-operacoes-laravel.md) — encontra catálogos de 27/13 colunas, F6 apenas decorativo, legenda invisível, busca/exportação locais à página e ordenação de linhas indevida para o extrato canônico filial-produto-data-lancto.
- [Decidir presets, botões e descoberta](issues/03-decidir-presets-atalhos-descoberta.md) — substitui todos os atalhos por botões combináveis e temporários, mantém somente consulta, fixa a ordem do extrato e leva busca/exportação completas ao servidor com AuthZ.
- [Consolidar correção para SpecKit](issues/04-consolidar-correcao-speckit.md) — publica dossiê autocontido com catálogo/defaults, botões sem atalhos, ordem fixa, busca/exportação completas, AuthZ e testes, preservando o restante do Laravel implementado.

## Not yet specified

Nenhum ponto permanece em aberto para produzir o prompt SpecKit.

## Out of scope

- Reescrever consultas, cálculos, filtros ou paginação da Ficha de Produtos sem relação com colunas/operações.
- Implementar alterações durante o Wayfinder.
- Restaurar edição financeira ambígua do Delphi sem autorização, auditoria e especificação próprias.
- Alterar a semântica de Movimentos, Lotes, saldo anterior ou histórico por contrato.
