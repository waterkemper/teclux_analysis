# Inventariar interface e fluxos do Cadastro de Romaneios Delphi

Type: task
Status: resolved
Blocked by:

## Question

Quais filtros, campos, grids, abas, estados, botões, ícones, atalhos, validações, mensagens, foco, relatórios e transições são efetivamente oferecidos pelo Cadastro de Romaneios Delphi, considerando conjuntamente PAS/DFM e as dependências alcançadas pelas quatro raízes?

## Answer

Inventário concluído em [`pesquisa-interface-delphi.md`](../../../modules/entregas/cadastro-romaneios/pesquisa-interface-delphi.md). Foram confirmados cadastro mestre–detalhe, manutenção unitária e múltipla, conferência, liberação/retenção, justificativa/reagendamento/atendimento, assinatura, movimentações, relatórios, atalhos, validações, foco e guards por estado.

Também foram classificados riscos a não reproduzir: geração sem Cancelar, validação parcial de chave NF-e, exceções silenciosas e cor sem legenda. Transições completas permanecem nos tickets de SQL/schema e domínio.
