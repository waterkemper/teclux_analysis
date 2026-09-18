# Reposição estatística e inteligente entre filiais

Pacote de prompts sequenciais para Speckit. Este diretório é o handoff da decisão consolidada no mapa .scratch/reposicao-estatistica-wayfinder/map.md.

## Resultado esperado

Criar um módulo novo de recomendação estatística, ao lado do ECC existente, para dois canais:

1. transferência entre filiais, usando primeiro o estoque disponível no grupo;
2. compra de fornecedor, usando somente a necessidade residual após a análise de transferência.

O módulo recomenda. O ECC revalida fatos vivos, concentração, disponibilidade, alocação e autorização. A confirmação continua gerando o fluxo existente de pedidosfiliais.

## Decisões que todos os prompts devem preservar

- Primeira entrega somente Laravel, filas/jobs existentes e repositórios canônicos. Não criar worker Python nesta fase.
- Consulta de Compras e ECC atuais continuam como baseline e fallback.
- Vendas perdidas ficam fora da primeira entrega.
- Devoluções mantêm a semântica atual da Consulta de Compras.
- produtos.inativol exclui ambos os canais.
- produtos.foralinhal exclui compra de fornecedor, mas continua elegível para transferência.
- Embalagens, múltiplos e arredondamento por embalagem ficam fora do escopo.
- O cliente configura os componentes de estoque, filtros, segmentos, modelos permitidos, políticas e limites. Não criar defaults de uma base específica.
- A recomendação estatística não grava diretamente em tabelas legadas nem confirma pedidosfiliais.
- Toda execução fotografa configuração, dados, política, modelo, resultado e explicação.
- A primeira entrega produtiva exige revisão humana, revalidação ECC e auditoria.
- Compatibilidade com PostgreSQL legado 9.5/9.6 deve ser respeitada.

## Ordem de execução

| Ordem | Prompt | Entrega |
|---:|---|---|
| 01 | Fundação e domínio | módulo, canais, configuração e fronteiras |
| 02 | Dataset e qualidade | contrato canônico, sinais e gate de dados |
| 03 | Motor estatístico | modelos, incerteza, seleção e fallback |
| 04 | Política de estoque | nível de serviço, proteção, mínimo/máximo e lead time |
| 05 | Rede e alocação | transferência multifonte e residual de compras |
| 06 | Execução e snapshots | jobs, idempotência, sombra e piloto |
| 07 | Revisão operacional | Bancada de decisão, explicabilidade e aprovação |
| 08 | Backtest e rollout | métricas, controle, drift, circuit breaker e rollback |
| 09 | Aceite e handoff | testes integrados, documentação e critérios finais |

Execute os prompts nesta ordem. Cada prompt deve inspecionar o checkout atual, localizar as autoridades reais e citar arquivos concretos antes de propor alterações.
