## Destination

Chegar a um conjunto ordenado de specs independentes e comprováveis para migrar **Estoque → Manutenção de Preços** do Delphi para o Laravel, preservando regras internas de preço e seus efeitos nas Vendas, com uma interface melhor, sem paginação e sem absorver a Manutenção de Preços de Marketplace.

## Notes

- Analisar PAS e DFM conjuntamente, incluindo forms ancestrais, data modules, queries, eventos, actions, units compartilhadas, permissões, autorizações e parâmetros.
- `delphi` e `laravel` são fontes somente de leitura; toda documentação deste esforço fica nesta árvore em `.scratch`.
- Toda conclusão deve citar evidência concreta e ser classificada como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `DECISÃO NOVA`.
- Não converter automaticamente limitações ou defeitos do Delphi em requisitos. Comparar continuamente com o Laravel existente.
- Marketplace é um contexto separado. Reutilizar filtros, componentes e infraestrutura Laravel aplicáveis, mas não migrar para este módulo cálculos, persistência, publicação ou integrações exclusivas de Marketplace.
- O escopo interno inclui Promoções, preços por Cargo e operações de copiar/excluir colunas de preço.
- A experiência terá filtros antes da consulta, geração explícita por F6, todos os registros filtrados sem paginação, edição/preparação local, prévia e gravação atômica por F8 no padrão Laravel (equivalente ao F5 legado).
- A Auditoria interna é separada de Marketplace e correlaciona lote e alterações individuais.
- Consultar o vocabulário de domínio antes de nomear conceitos novos. Atualizar glossário ou ADR somente se surgir uma decisão real que satisfaça o workflow de domínio.
- Não gerar `/speckit.specify` durante o mapa. Ao resolver uma fatia independente, indicar o `$to-spec` correspondente.

## Decisions so far

- [Inventariar módulo legado e delimitar fronteira Marketplace](issues/01-inventariar-modulo-legado-e-delimitar-fronteira-marketplace.md) — o legado mistura dois fluxos no mesmo form/data module; o novo módulo interno preserva preços, colunas, Promoções e Cargos, corta datasets/cálculos/publicação Marketplace e compartilha somente infraestrutura neutra.
- [Modelar preço interno, colunas e identidades](issues/02-modelar-preco-interno-colunas-e-identidades.md) — Produto escolhe uma Faixa; Valores são compartilhados por Característica + Faixa + Coluna; a Filial resolve normal/promocional, e preço calculado nunca é persistido sem ação explícita.
- [Mapear filtros, seleção e consulta integral](issues/03-mapear-filtros-selecao-e-consulta-integral.md) — F6 combina filtros internos comprovados, aceita períodos abertos em movimento/nota, preserva semântica própria de estoque/promoção/filial e devolve toda a coleção ordenada sem paginação ou dependências de Marketplace.
- [Mapear permissões, parâmetros e autorizações sensíveis](issues/04-mapear-permissoes-parametros-e-autorizacoes-sensiveis.md) — acesso ao módulo e escopo de Filial são separados da prova de Gerente de Estoque, exigida uma vez no commit F5; parâmetros de Cargo, grades e múltiplo condicionam comportamento, não permissão.
- [Reconstruir motor de cálculo de preços e margens](issues/05-reconstruir-motor-de-calculo-de-precos-e-margens.md) — o coordenador interno preserva fórmulas locais, múltiplos e Filial efetiva, mas trata `formacaoprecovenda`/`estoques_preco` do PostgreSQL como oráculos, sem reutilizar fórmulas Marketplace nem seu fallback como prova de paridade.
- [Delimitar promoções, percentuais e validade](issues/06-delimitar-promocoes-percentuais-e-validade.md) — vínculo da Faixa, Valor/Validade da Coluna e ajustes em lote são intenções distintas; o cadastro existente só fornece Promoções elegíveis e a efetividade na Filial permanece sob `estoques_produtoempromocao`.

- [Delimitar preços e descontos por Cargo](issues/07-delimitar-precos-e-descontos-por-cargo.md) — desconto é persistido por Produto + Cargo, propagado por Característica + Faixa e projetado pelo motor oficial sobre preço normal/Promoção; a migração exige lote F5 atômico e deixa divergências de Vendas para specs consumidoras.

- [Definir operações em lote e semântica de colunas](issues/08-definir-operacoes-em-lote-e-semantica-de-colunas.md) — operações atuam apenas nos selecionados, compõem-se sobre propostas locais com histórico/desfazer e produzem prévia explicável; copiar, ajustar, limpar, editar e recalcular permanecem sem persistência até o F5.

- [Prototipar shell e grid integral sem paginação](issues/10-prototipar-shell-e-grid-integral-sem-paginacao.md) — duas abas preservam Filtros → F6 → Dados; três grids redimensionáveis compartilham linha e rolagem, toda a coleção usa virtualização sem paginação e F8 revisa em modal com erros/conflitos visíveis.

- [Definir gravação atômica, concorrência e auditoria](issues/09-definir-gravacao-atomica-concorrencia-e-auditoria.md) — F8 confirma lote idempotente e tudo-ou-nada, valida revisões antes de escrever e correlaciona cabeçalho interno, autorização e diffs `_log_new` sem acionar Marketplace.

- [Mapear consumidores e efeitos nas Vendas](issues/11-mapear-consumidores-e-efeitos-nas-vendas.md) — preços correntes são consultados sob demanda por pesquisa/inclusão/validação; documentos preservam sua fotografia comercial, sem reprecificação, cache ou publicação síncrona após o F8.

- [Comparar Laravel e definir arquitetura reutilizável](issues/12-comparar-laravel-e-definir-arquitetura-reutilizavel.md) — a manutenção interna será um módulo profundo próprio, compartilhando apenas infraestrutura ERP neutra e expondo módulos pequenos para consulta F6, propostas, commit F8 e resolução transversal de preço.

- [Consolidar casos dourados, ordem de specs e rollout](issues/13-consolidar-casos-dourados-ordem-de-specs-e-rollout.md) — quatro specs encadeados cobrem motor, consulta, propostas e commit; a liberação integral exige 100% dos casos dourados, limites de desempenho, auditoria e homologação real, sem participação de Marketplace.

## Not yet specified

- Nenhuma. O mapa está concluído e pronto para os quatro comandos incrementais de $to-spec definidos na decisão final.

## Out of scope

- Manutenção, simulação, margem, frete, comissão, gravação, exportação e publicação específicas de Marketplace.
- Implementação no checkout Laravel, execução de migrations/builds/testes ou alteração do Delphi.
- Redesenho geral do Cadastro de Produtos que não seja necessário para navegar a partir da Manutenção de Preços.
