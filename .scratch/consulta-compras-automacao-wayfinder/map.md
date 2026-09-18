# Automacao da reposicao de estoque entre filiais - Consulta de Compras

Label: wayfinder:map

## Destination

Produzir uma especificacao/roadmap funcional e tecnico para automatizar as rotinas de reposicao descritas no manual operacional, reduzindo o trabalho manual de duas pessoas sem remover os controles necessarios para excecoes, aprovacoes e rastreabilidade.

O resultado deve definir o que pode ser executado automaticamente, o que precisa de revisao humana e quais dados, regras, jobs, notificacoes e contratos faltam no Laravel. Nao implementar neste mapa.

## Notes

- Dominio: Estoque -> Compras -> Consulta de Compras -> Requisicao entre Filiais.
- Fonte operacional primaria: [procedimentos.pdf](docs/procedimentos.pdf).
- Base funcional investigada: [consulta-compras-wayfinder](../consulta-compras-wayfinder/map.md), seus 20 tickets resolvidos e a implementacao/documentacao Laravel.
- Classificar descobertas como CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO, DIVERGENTE, POSSIVEL BUG LEGADO ou DECISAO NOVA, sempre com evidencia.
- O mapa define o plano; nenhuma implementacao, migration, seed ou teste sera executada dentro deste mapa.

## Decisions so far

- [Tornar Rotinas ECC nomeadas e configuraveis](docs/analise-modelo-configuravel-ecc.md) - Os tres tipos atuais deixam de ser categorias comportamentais; cada filial pode cadastrar varias rotinas com nome, agenda, regras temporais, filtros, motor e politicas ECC proprios. `tipo` fica apenas como compatibilidade legada.
- [Diagnosticar cobertura do manual de reposicao no Laravel](issues/01-diagnosticar-cobertura-manual-laravel.md) - O motor e a confirmacao de requisicoes sao reutilizaveis; falta orquestracao recorrente e politicas de elegibilidade, prioridade, embalagem, urgencia e aprovacao.
- [Definir limite entre automacao e aprovacao humana](issues/02-definir-limite-automacao-aprovacao.md) - Jobs preparam propostas; confirmacao e humana; grupos restritos exigem autenticacao de Gerente de Vendas e excecoes sao tratadas por item.
- [Definir perfis, janelas e agendamento das rotinas de reposicao](issues/03-definir-perfis-e-agendamento-operacional.md) - Tres Rotinas fixas por Filial Requisitante, com filtros proprios, parametros explicitos sem padroes globais e janelas diaria/quinzenal.
- [Definir politicas de elegibilidade e dados mestres para automacao](issues/04-definir-politicas-de-elegibilidade-e-dados.md) - Regras M/D/U/F/O/C, gerente por grupo e usuario, maximo 0/9999 e concentracao por Produto x Filial.
- [Definir alocacao entre filiais, quantidade e urgencia](issues/05-definir-alocacao-quantidade-e-urgencia.md) - Quantidade usa a sugestao e o excedente calculado com os filtros da propria fonte; concentradoras so enviam para concentradoras e urgencias sem evidencia ficam manuais.
- [Definir execucao segura, idempotencia e auditoria](issues/06-definir-execucao-segura-e-auditoria.md) - Snapshot e lote unico pendente por rotina/filial/cenario; nova execucao alerta, revisao revalida e confirmacao usa o nucleo transacional existente de pedidosfiliais.
- [Definir fila de excecoes, notificacoes e indicadores](issues/07-definir-fila-de-excecoes-e-indicadores.md) - Fila e tela operacional proprias para Reposicao ECC, alertas externos opcionais por base e baseline manual antes de metas.
- [Consolidar prompts SpecKit da reposicao ECC](issues/08-consolidar-prompts-speckit-reposicao-ecc.md) - Publicados quatro prompts incrementais em modules/estoque/consulta-compras/, cobrindo fundacao/orquestracao, calculo/alocacao, revisao/confirmacao e excecoes/indicadores.

## Not yet specified

- O modelo configuravel exige os prompts 27 a 33 publicados em modules/estoque/consulta-compras/: contrato de dominio, migration/compatibilidade, dispatcher e snapshot genericos, editor completo, aceite, correcao de escopo/read models e hardening de filtros/integridade. Os prompts 23, 25 e 26 foram marcados como historicos da decisao anterior; o prompt 24 permanece como base compartilhada de filtros, exceto a secao de overlays fixos por tipo. A implementacao continua fora deste mapa.

## Out of scope

- Implementar a automacao ou alterar o modulo Consulta de Compras neste mapa.
- Implementar o Cadastro de Pedidos de Compra completo; ele continua sendo um esforco separado, como registrado no mapa anterior.
- Redesenhar os modulos ja migrados que apenas servem de apoio a Consulta de Compras.
