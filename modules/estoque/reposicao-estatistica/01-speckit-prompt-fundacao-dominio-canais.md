# Prompt 01 — Fundação do módulo, domínio e canais

## Objetivo

Definir e implementar a fundação do módulo Laravel de Reposição Estatística, separado do ECC existente, sem alterar Delphi e sem substituir Consulta de Compras.

## Prompt para /speckit.specify

/speckit.specify

Crie a especificação funcional e técnica da fundação do módulo Reposição Estatística e Inteligente entre Filiais. Inspecione o mapa .scratch/reposicao-estatistica-wayfinder/map.md, os tickets resolvidos, laravel/CONTEXT.md, a documentação do ECC e o código real antes de decidir nomes de classes, tabelas ou rotas.

Modele uma fronteira nova ao lado de Consulta de Compras/ECC. O módulo estatístico é responsável por preparar dataset, calcular recomendação, medir confiança e explicar resultado. O ECC continua responsável por fatos vivos, revalidação, disponibilidade, concentração, alocação, autorização e confirmação. O legado Delphi permanece fonte/operador, sem lógica estatística nova.

Defina os termos:

- Configuração de Reposição Estatística;
- Execução;
- Snapshot imutável;
- Recomendação por produto e filial;
- canal transferência;
- canal compra residual;
- revisão humana;
- fallback ECC.

Uma execução deve poder produzir os dois canais, mas a necessidade deve ser única: primeiro simular transferência com estoque do grupo e depois encaminhar somente o residual para compra de fornecedor. Não duplicar demanda entre os canais.

Inclua configuração por cliente e por rotina, sem nomes, filiais, depósitos, períodos, filtros, modelos ou limites pré-configurados. O cliente escolhe quais componentes de estoque, filtros, segmentos, políticas e modelos são permitidos.

Preserve as regras já decididas:

- vendas perdidas não entram na primeira entrega;
- devoluções seguem Consulta de Compras;
- produtos.inativol não entram em nenhum canal;
- produtos.foralinhal não entram em compra, mas podem ser transferidos;
- embalagem e múltiplos não entram nesta fase;
- confirmação continua no fluxo pedidosfiliais existente.

Defina autorização, escopos, lifecycle, versionamento e auditoria sem confundir acesso ao módulo com autorização de gerente de vendas. Não permitir que JSON arbitrário desligue invariantes.

## Aceite

- [ ] O módulo é separado do ECC, com responsabilidades explícitas.
- [ ] Transferência e compra residual têm contratos distintos.
- [ ] Não existe demanda duplicada entre os canais.
- [ ] Não há defaults específicos de cliente.
- [ ] O fluxo legado e Delphi permanecem preservados.
- [ ] PostgreSQL 9.5/9.6 e a arquitetura Laravel existente são considerados.
- [ ] A especificação cita as autoridades reais do checkout e registra CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE e POSSÍVEL BUG LEGADO quando aplicável.
