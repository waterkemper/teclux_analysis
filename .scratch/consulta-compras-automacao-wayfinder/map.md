# Automação da reposição de estoque entre filiais — Consulta de Compras

Label: wayfinder:map

## Destination

Produzir uma especificação/roadmap funcional e técnico para automatizar as rotinas de reposição descritas no manual operacional, reduzindo o trabalho manual de duas pessoas sem remover os controles necessários para exceções, aprovações e rastreabilidade.

O resultado deve definir o que pode ser executado automaticamente, o que precisa de revisão humana e quais dados, regras, jobs, notificações e contratos faltam no Laravel. Não implementar neste mapa.

## Notes

- Domínio: Estoque → Compras → Consulta de Compras → Requisição entre Filiais.
- Fonte operacional primária: [`procedimentos.pdf`](docs/procedimentos.pdf).
- Base funcional já investigada: [`consulta-compras-wayfinder`](../consulta-compras-wayfinder/map.md), seus 20 tickets resolvidos e a implementação/documentação Laravel.
- Classificar descobertas como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência.
- Ao resolver tickets de decisão, consultar `grilling` e `domain-modeling`; fatos devem ser verificados no manual, no código e nos contratos existentes. Decisões de negócio ficam para o usuário, uma pergunta por vez.
- O mapa define o plano; nenhuma implementação, migration, seed ou teste será executada dentro dele.

## Decisions so far

<!-- tickets fechados serão acrescentados aqui -->

- [Diagnosticar cobertura do manual de reposição no Laravel](issues/01-diagnosticar-cobertura-manual-laravel.md) — O motor e a confirmação de requisições são reutilizáveis; falta a orquestração recorrente e várias políticas de elegibilidade, prioridade, embalagem, urgência e aprovação.

## Not yet specified

- Qual nível de autonomia o cliente aceita: somente montar uma fila de revisão, confirmar requisições automaticamente ou também distribuir e efetivar requisições sem intervenção.
- Como os três cenários do manual serão parametrizados por filial, calendário, horário, janela de dados e cobertura-alvo.
- Como representar no sistema as políticas de classe/status, gerência, concentração, embalagem/unidade e urgência.
- Como resolver concorrência, idempotência, duplicidade, falta de estoque, exceções e auditoria de execuções automáticas.
- Quais notificações, indicadores e fila de exceções substituirão o acompanhamento manual contínuo.

## Out of scope

- Implementar a automação ou alterar o módulo Consulta de Compras neste mapa.
- Implementar o Cadastro de Pedidos de Compra completo; ele continua sendo um esforço separado, como registrado no mapa anterior.
- Redesenhar os módulos já migrados que apenas servem de apoio à Consulta de Compras.
