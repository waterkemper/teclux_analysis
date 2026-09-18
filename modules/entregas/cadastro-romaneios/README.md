# Prompts SpecKit - Cadastro de Romaneios

Este pacote agora inclui o prompt 08, separado para corrigir os filtros da inclusao multipla de Notas. Consulte modules/entregas/cadastro-romaneios/08-speckit-prompt-correcao-filtros-inclusao-multipla.md.

Esta pasta contém o pacote de evidências e treze prompts coordenados para especificar no Laravel o módulo **Entregas e Montagens → Entregas → Romaneios**. Os prompts 07–13 são correções posteriores derivadas da validação da implementação contra o fluxo legado já consolidado nas evidências do módulo.

## Ordem de execução

| Ordem | Prompt | Fronteira |
|---:|---|---|
| 1 | [Fundação, domínio e segurança](01-speckit-prompt-fundacao-dominio-seguranca.md) | agregado, schema, transações, revisão, idempotência, menu, acesso, parâmetros e seam financeiro |
| 2 | [Consulta F6 e seleção múltipla](02-speckit-prompt-consulta-f6-selecao-multipla.md) | filtros, SQL set-based, grid, exportação e cancelamento PostgreSQL |
| 3 | [Cadastro, itens e Contas a Pagar](03-speckit-prompt-cadastro-itens-financeiro.md) | mestre–detalhe, comandos CRUD, lote e efeito financeiro atômico |
| 4 | [Operações de entrega e conferência](04-speckit-prompt-operacoes-entrega-conferencia.md) | conferência, recebimento, liberação, retenção, justificativa e histórico |
| 5 | [Relatórios e integração da interface](05-speckit-prompt-relatorios-integracao-interface.md) | relatórios, shell final, grids, atalhos, NF-e, modais e acessibilidade |
| 6 | [Aceite, desempenho e observabilidade](06-speckit-prompt-aceite-desempenho-observabilidade.md) | matriz transversal, PostgreSQL real, N+1, concorrência, falhas e telemetria |
| 7 | [Correção da tela de inclusão de Item](07-speckit-prompt-correcao-tela-inclusao-item.md) | superfície única Nota/Cupom, Auto Incluir, lookups encadeados, Tabela de Fretes e valores financeiros |
| 8 | [Correção dos filtros da inclusão múltipla](08-speckit-prompt-correcao-filtros-inclusao-multipla.md) | clientes, datas, Filiais, chave NF-e, estados, cancelamento e testes da F6 |
| 9 | [Correção da conferência por chave e volume](09-speckit-prompt-correcao-conferencia-chave-volume.md) | modo N/T, chave versus chave+volume, granularidade, parcial, recomeço, persistência e aceite |
| 10 | [Auditoria do fluxo Normal/Transferência e situações](10-speckit-prompt-auditoria-fluxo-normal-transferencia-status.md) | fluxo mestre–itens, elegibilidade, conferência de notas/volumes, ROS/RPS/ROE/ROP, estados por tipo, capabilities e comparação pós-implementação |
| 11 | [Botões e operações por tipo e Situação](11-speckit-prompt-botoes-operacoes-por-status.md) | matriz de visibilidade/habilitação, atalhos, capabilities, ações do mestre/Item, estados N/T e proteção UI/backend |
| 12 | [Transferência em trânsito sem ações do grid](12-speckit-prompt-correcao-transferencia-em-transito.md) | correção da regra T + EM TRÂNSITO, todos os botões do grid desabilitados, capabilities, atalhos, rotas e handlers |
| 13 | [Recuperação de Documento a Pagar ausente](13-speckit-prompt-recuperacao-documento-pagar-ausente.md) | invariante financeiro, botão de recuperação, reconciliação, concorrência e rollback sem reabrir ações do grid |

Execute cada bloco com `/speckit.specify` no checkout Laravel alvo. A saída de uma etapa é pré-condição da seguinte; não peça implementação ao comando de especificação. Antes de cada execução, confira se o checkout ainda contém os componentes citados e se o snapshot autoritativo continua representando o banco-alvo.

## Autoridades do pacote

- [Snapshot do schema](schema/README.md), JSON bruto e funções SQL;
- [interface Delphi](pesquisa-interface-delphi.md) e [SQL/efeitos Delphi](pesquisa-sql-dominio-efeitos-delphi.md);
- [padrões Laravel reutilizáveis](pesquisa-padroes-laravel-reutilizaveis.md);
- contratos decididos de [domínio/transações](modelo-dominio-coexistencia-transacoes.md), [F6](consulta-f6-sql-performance-cancelamento.md), [interface](interface-operacoes-componentes.md), [segurança/financeiro](seguranca-menu-parametros.md) e [aceite](aceite-testes-observabilidade.md).

As classificações `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO`, `POSSÍVEL BUG ATUAL` e `DECISÃO NOVA` devem permanecer rastreáveis. Estrutura divergente ou apenas inferida bloqueia o SQL dependente; não deve ser preenchida por suposição.

## Regras comuns

- O PostgreSQL legado é a única fonte canônica; Delphi e Laravel coexistem sobre os mesmos registros.
- Não copiar layout, SQL inseguro, commits intermediários ou bugs do Delphi.
- Não usar introspecção de schema em runtime, `MAX()+1`, N+1, SQL interpolado ou `LEFT JOIN` automático.
- Todo comando mutável é atômico, idempotente, auditável e protegido por revisão/locks.
- **Gravar é F8** em todas as superfícies Laravel.
- A consulta F6 oferece **Cancelar** imediatamente e interrompe a query PostgreSQL real.
- Estratégia de rollout, feature flag e plano de retorno estão fora deste pacote.
