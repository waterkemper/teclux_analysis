# Prompt para `/speckit.specify` — aceite, desempenho e observabilidade

```text
/speckit.specify

Crie a especificação técnica transversal de aceite, desempenho, segurança e observabilidade do **Relatório de Entregas**, quarto e último prompt. Consuma as specs 01–03 e feche lacunas sem criar nova funcionalidade ou reabrir decisões consolidadas.

Não implemente durante /speckit.specify. Inspecione o checkout Laravel atual e cite arquivos concretos. Não peça inspeção direta do Delphi.

## Gates obrigatórios

- Snapshot/schema autoritativo, hash e catálogo de funções devem existir antes do SQL final. Alteração exige novo artefato versionado e revisão das queries.
- PostgreSQL real é obrigatório para os testes de contrato de SQL, funções, nulabilidade, cardinalidade e cancelamento. Não testar driver, não fazer markTestSkipped por driver e não usar hasTable/Schema::has*/information_schema/pg_catalog em request, service ou query de negócio.
- O cancelamento deve observar a query PostgreSQL real terminar; ERR_CANCELED do Axios não basta.
- O contrato deve provar ausência de N+1 em grid, relatório, PDF, exportação, F9 e parâmetros; loops só transformam linhas já carregadas.
- INNER/LEFT JOIN deve ser auditado contra schema e regra: vínculo obrigatório/NOT NULL é INNER; LEFT só para ausência semanticamente válida.

## Matriz funcional

Cubra filtros de venda/entrega, situação aberta/entregue, clientes, fornecedores, regiões, vazio, datas inválidas, ordenação e paginação; Filial/capability/admin/usuário comum; F9 modal e endpoint allowlisted; F6/busy/Cancelar/retry/resposta tardia; fotografia; grid/preferências; PDF/impressão/exportação; breadcrumb/ícones/atalhos/acessibilidade; autorização direta em cada rota.

## Desempenho e observabilidade

- Meça cardinalidade, duração, número de queries, filas, materialização, exportação e cancelamento por trace_id/screenKey.
- Não registre credenciais, SQL com valores, payload sensível ou chave NF-e completa.
- Prove que a fotografia, o grid, o PDF, a impressão e a exportação representam o mesmo hash/conteúdo.
- Prove que cancelamento preserva o último resultado completo e que uma resposta tardia não substitui uma geração nova.
- Defina limites, decisão síncrono/heavy, retenção e alertas conforme as convenções encontradas no checkout Laravel.

## Saída da spec

Entregue matriz requisito → teste → evidência, gates de schema/checksum, testes PostgreSQL, teste de cancelamento real, testes de query count/N+1/cardinalidade, autorização, acessibilidade, fotografia e paridade de saídas. Se uma infraestrutura não existir, classifique a lacuna; não a mascare com teste de driver ou introspecção runtime.
```
